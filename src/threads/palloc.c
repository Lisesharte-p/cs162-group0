#include "threads/palloc.h"
#include <bitmap.h>
#include <debug.h>
#include <inttypes.h>
#include <round.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "threads/loader.h"
#include "threads/interrupt.h"
#include "threads/synch.h"
#include "threads/vaddr.h"
#ifdef VM
#include "lib/random.h"
#include "threads/pte.h"
#include "userprog/pagedir.h"
#include "userprog/process.h"
#include "vm/vm.h"
#endif

/* Page allocator.  Hands out memory in page-size (or
   page-multiple) chunks.  See malloc.h for an allocator that
   hands out smaller chunks.

   System memory is divided into two "pools" called the kernel
   and user pools.  The user pool is for user (virtual) memory
   pages, the kernel pool for everything else.  The idea here is
   that the kernel needs to have memory for its own operations
   even if user processes are swapping like mad.

   By default, half of system RAM is given to the kernel pool and
   half to the user pool.  That should be huge overkill for the
   kernel pool, but that's just fine for demonstration purposes. */

/* A memory pool. */
struct pool {
  struct lock lock;        /* Mutual exclusion. */
  struct bitmap* used_map; /* Bitmap of free pages. */
  uint8_t* base;           /* Base of pool. */
};

/* Two pools: one for kernel data, one for user pages. */
static struct pool kernel_pool, user_pool;

static void init_pool(struct pool*, void* base, size_t page_cnt, const char* name,
                      void* bitmap_buf);
static bool page_from_pool(const struct pool*, void* page);

#ifdef VM
/* Chooses one resident, non-COW user page in the current address space and
   writes it to swap.  Reservoir sampling avoids maintaining a second list of
   mapped pages just for eviction.  A page can belong to any live process:
   when one process faults in a page, its own resident set may be the complete
   working set that it is actively using, while another process is blocked in
   wait() and is a much better eviction candidate. */
struct swap_candidate {
  uint32_t* pd;
  uint32_t* upage;
  uint32_t* current_pd;
  struct thread* owner;
  size_t owner_pages;
  int rank;
};

static void find_swap_candidate(struct thread* t, void* aux) {
  struct swap_candidate* candidate = aux;
  uint32_t* pd;
  size_t pages = 0;

  if (t->pcb == NULL || (pd = t->pcb->pagedir) == NULL)
    return;

  for (uint32_t* pde = pd; pde < pd + pd_no(PHYS_BASE); pde++) {
    if ((*pde & PTE_P) == 0)
      continue;

    uint32_t* pt = pde_get_pt(*pde);
    for (uint32_t* pte = pt; pte < pt + PGSIZE / sizeof *pte; pte++) {
      if ((*pte & (PTE_P | PTE_U | PTE_COW)) != (PTE_P | PTE_U))
        continue;
      /* pte_get_page() is only valid for RAM-backed physical addresses;
         user LFB mappings live in the PCI address hole. */
      if ((*pte & PTE_ADDR) >= (uintptr_t)PHYS_BASE)
        continue;

      void* page = pte_get_page(*pte);
      if (!page_from_pool(&user_pool, (void*)vtop(page)))
        continue;

      pages++;
    }
  }

  int process_rank = pd == candidate->current_pd ? 2 : (t->status == THREAD_RUNNING ? 1 : 0);
  /* "Nothing chosen yet" must be tested on owner, not upage: upage is only
     filled in later by choose_swap_page(), so testing it here is always true
     and the whole ranking below is skipped -- the last thread in all_list
     always won and a running process ended up evicting its own pages. */
  if (pages > 0 &&
      (candidate->owner == NULL || process_rank < candidate->rank ||
       (process_rank == candidate->rank && pages > candidate->owner_pages))) {
    candidate->pd = pd;
    candidate->owner = t;
    candidate->owner_pages = pages;
    candidate->rank = process_rank;
    candidate->upage = NULL;
  }
}

/* Picks the victim uniformly at random among the pages resident in the chosen
   address space.  Any deterministic rule -- scanning from the bottom of the
   address space, or a clock hand -- keeps landing on the same few frames: the
   process refaults on the victim immediately, it is swapped back in, and the
   next eviction picks it again, so a handful of pages ping-pong forever while
   the rest of the resident set is never evicted.  Picking uniformly at random
   spreads evictions over every resident page.  Reservoir sampling does this in
   a single page-table walk, with no second list of mapped pages. */
static void choose_swap_page(struct thread* t, void* aux) {
  struct swap_candidate* candidate = aux;
  if (t != candidate->owner)
    return;

  uint32_t* pd = candidate->pd;
  const size_t per_pt = PGSIZE / sizeof(uint32_t);
  const size_t npde = pd_no(PHYS_BASE);

  uintptr_t chosen = 0;
  size_t candidates = 0;
  for (size_t pi = 0; pi < npde; pi++) {
    uint32_t* pde = pd + pi;
    if ((*pde & PTE_P) == 0)
      continue; /* whole 4 MB region unmapped: skip it in one step */
    uint32_t* pt = pde_get_pt(*pde);
    for (size_t i = 0; i < per_pt; i++) {
      uint32_t* pte = pt + i;
      if ((*pte & (PTE_P | PTE_U | PTE_COW)) != (PTE_P | PTE_U))
        continue;
      if ((*pte & PTE_ADDR) >= (uintptr_t)PHYS_BASE)
        continue;
      if (!page_from_pool(&user_pool, (void*)vtop(pte_get_page(*pte))))
        continue;

      candidates++;
      if (random_ulong() % candidates == 0)
        chosen = (uintptr_t)(pi * per_pt + i) * PGSIZE;
    }
  }

  if (chosen == 0)
    return;

  candidate->upage = (uint32_t*)chosen;
  candidate->rank = candidate->rank * 2 + 1;
}



static bool swap_random_user_page(void) {
  struct swap_candidate candidate = {
      NULL, NULL,
      thread_current()->pcb != NULL ? thread_current()->pcb->pagedir : NULL,
      NULL,
      0,
      3,
  };
  enum intr_level old_level = intr_disable();

  /* thread_foreach() requires interrupts to be disabled.  Do the page-table
     walk while the thread list is stable, then perform disk I/O after
     restoring the previous interrupt level. */
  thread_foreach(find_swap_candidate, &candidate);
  if (candidate.owner != NULL)
    thread_foreach(choose_swap_page, &candidate);
  intr_set_level(old_level);

  if (candidate.upage != NULL) {
    if (0) printf("SWDBG req=%s victim=%s status=%d va=%x rank=%d\n", thread_name(),
           candidate.owner != NULL ? candidate.owner->name : "?",
           candidate.owner != NULL ? candidate.owner->status : -1,
           candidate.upage, candidate.rank);
    return do_swap_page(candidate.pd, candidate.upage);
  }
  return false;
}
#else
static bool swap_random_user_page(void) { return false; }
#endif

/* Initializes the page allocator.  At most USER_PAGE_LIMIT
   pages are put into the user pool. */
void palloc_init_kernel(size_t user_page_limit, uint32_t* user_page, uint32_t* user_base) {
  /* Free memory starts at 1 MB and runs to the end of RAM. */
  uint8_t* free_start = (void*)(1024 * 1024);
  const size_t reserved_pages = (1024 * 1024) / PGSIZE;
  size_t free_pages = init_ram_pages > reserved_pages ? (size_t)init_ram_pages - reserved_pages : 0;
  size_t user_pages = free_pages / 2;
  size_t kernel_pages;
  if (user_pages > user_page_limit)
    user_pages = user_page_limit;
  kernel_pages = free_pages - user_pages;
  if (kernel_pages > kernel_page_limit) {
    kernel_pages = kernel_page_limit;
  }
  uint32_t bitmap_page_kernel = DIV_ROUND_UP(bitmap_buf_size(kernel_pages), PGSIZE);
  uint32_t bitmap_page_user = DIV_ROUND_UP(bitmap_buf_size(user_pages), PGSIZE);

  void* kernel_bitmap_buf = ptov((uintptr_t)free_start);
  void* user_bitmap_buf = ptov((uintptr_t)free_start) + PGSIZE * bitmap_page_kernel;

  /* Give half of memory to kernel, half to user. */
  init_pool(&kernel_pool,
            (ptov)((uintptr_t)free_start) + (PGSIZE * (bitmap_page_kernel + bitmap_page_user)),
            kernel_pages, "kernel pool", kernel_bitmap_buf);

  init_pool(&user_pool,
            (free_start) + kernel_pages * PGSIZE +
                (PGSIZE * bitmap_page_user),
            user_pages, "user pool", user_bitmap_buf);

  *user_page = (uint32_t)user_pages;
  *user_base = (uint32_t)((free_start) + kernel_pages * PGSIZE +
                          (PGSIZE * bitmap_page_user));
}
void palloc_init_user(size_t user_page_limit) {
  const size_t reserved_pages = (1024 * 1024) / PGSIZE;
  size_t free_pages = init_ram_pages > reserved_pages ? (size_t)init_ram_pages - reserved_pages : 0;
  size_t user_pages = free_pages / 2;
  size_t kernel_pages;
  if (user_pages > user_page_limit)
    user_pages = user_page_limit;
  kernel_pages = free_pages - user_pages;

  // init_pool(&user_pool, free_start + kernel_pages * PGSIZE, user_pages, "user pool");
}
/* Obtains and returns a group of PAGE_CNT contiguous free pages.
   If PAL_USER is set, the pages are obtained from the user pool,
   otherwise from the kernel pool.  If PAL_ZERO is set in FLAGS,
   then the pages are filled with zeros.  If too few pages are
   available, returns a null pointer, unless PAL_ASSERT is set in
   FLAGS, in which case the kernel panics. */
void* palloc_get_multiple(enum palloc_flags flags, size_t page_cnt) {
  struct pool* pool = flags & PAL_USER ? &user_pool : &kernel_pool;
  void* pages;
  size_t page_idx;

  if (page_cnt == 0)
    return NULL;

  lock_acquire(&pool->lock);
  page_idx = bitmap_scan_and_flip(pool->used_map, 0, page_cnt, false);
  lock_release(&pool->lock);

  if (page_idx != BITMAP_ERROR)
    pages = pool->base + PGSIZE * page_idx;
  else if ((flags & PAL_USER) && page_cnt == 1 && swap_random_user_page()) {
    lock_acquire(&pool->lock);
    page_idx = bitmap_scan_and_flip(pool->used_map, 0, page_cnt, false);
    lock_release(&pool->lock);
    pages = page_idx != BITMAP_ERROR ? pool->base + PGSIZE * page_idx : NULL;
  } else
    pages = NULL;

  if (pages != NULL) {
    if (flags & PAL_ZERO && !(flags & PAL_USER)) //if user pool, clear after mapping
      memset(pages, 0, PGSIZE * page_cnt);
  } else {
    if (flags & PAL_ASSERT)
      PANIC("palloc_get: out of pages");
  }

  return pages;
}

/* Obtains a single free page and returns its kernel virtual
   address.
   If PAL_USER is set, the page is obtained from the user pool,
   otherwise from the kernel pool.  If PAL_ZERO is set in FLAGS,
   then the page is filled with zeros.  If no pages are
   available, returns a null pointer, unless PAL_ASSERT is set in
   FLAGS, in which case the kernel panics. */
void* palloc_get_page(enum palloc_flags flags) { return palloc_get_multiple(flags, 1); }

/* Frees the PAGE_CNT pages starting at PAGES. */
void palloc_free_multiple(void* pages, size_t page_cnt, bool phy_addr) {
  struct pool* pool;
  size_t page_idx;

  ASSERT(pg_ofs(pages) == 0);
  if (pages == NULL || page_cnt == 0)
    return;

  if (phy_addr) {
    if (page_from_pool(&user_pool, pages)) {
      pool = &user_pool;
      page_idx = pg_no(pages) - pg_no(pool->base);

    } else
      NOT_REACHED();
  } else {
    if (page_from_pool(&kernel_pool, pages)) {
      pool = &kernel_pool;
      page_idx = pg_no(pages) - pg_no(pool->base);

    } else
      NOT_REACHED();
  }

  ASSERT(bitmap_all(pool->used_map, page_idx, page_cnt));
  bitmap_set_multiple(pool->used_map, page_idx, page_cnt, false);
}

/* Frees the page at PAGE. */
void palloc_free_page(void* page, bool phy_addr) { palloc_free_multiple(page, 1, phy_addr); }

/* Initializes pool P as starting at START and ending at END,
   naming it NAME for debugging purposes. */
static void init_pool(struct pool* p, void* base, size_t page_cnt, const char* name,
                      void* bitmap_buf) {
  /* We'll put the pool's used_map at its base.
     Calculate the space needed for the bitmap
     and subtract it from the pool's size. */
  size_t bm_pages = DIV_ROUND_UP(bitmap_buf_size(page_cnt), PGSIZE);
  if (bm_pages > page_cnt)
    PANIC("Not enough memory in %s for bitmap.", name);
  page_cnt -= bm_pages;

  printf("%zu pages available in %s.\n", page_cnt, name);

  /* Initialize the pool. */
  lock_init(&p->lock);
  p->used_map = bitmap_create_in_buf(page_cnt, bitmap_buf, bm_pages * PGSIZE);
  p->base = base;
}

/* Returns true if PAGE was allocated from POOL,
   false otherwise. */
static bool page_from_pool(const struct pool* pool, void* page) {
  size_t page_no = pg_no(page);
  size_t start_page = pg_no(pool->base);
  size_t end_page = start_page + bitmap_size(pool->used_map);

  return page_no >= start_page && page_no < end_page;
}
