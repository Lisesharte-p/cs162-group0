#include "vm.h"
#include "threads/malloc.h"
#include "lib/string.h"
#include "lib/kernel/bitmap.h"
#include "devices/block.h"
#include "userprog/pagedir.h"
#include "userprog/process.h"
#include "threads/pte.h"
#include "threads/thread.h"
#include "threads/palloc.h"

#define SWAP_SECTORS_PER_PAGE (PGSIZE / BLOCK_SECTOR_SIZE)

uint8_t* page_ref_count;
uint8_t* user_pool_base;
struct bitmap* swap_use_map;
void* swap_map_buf;
struct block* swap_block;

bool vm_init(uint32_t user_pages, uint8_t* base) {
  page_ref_count = malloc(sizeof(uint8_t) * user_pages);
  memset(page_ref_count, 0, sizeof(uint8_t) * user_pages);
  user_pool_base = base;
  swap_block = block_get_role(BLOCK_SWAP);
  if (!swap_block) {
    PANIC("swap block not found\n");
  }
  size_t swap_pages = block_size(swap_block) / SWAP_SECTORS_PER_PAGE;
  swap_map_buf = malloc(bitmap_buf_size(swap_pages));
  swap_use_map = bitmap_create_in_buf(swap_pages, swap_map_buf,
                                      bitmap_buf_size(swap_pages));

  return true;
}

uint32_t alloc_swap_page() {
  uint32_t res = bitmap_scan_and_flip(swap_use_map, 0, 1, false);
  if (res == BITMAP_ERROR) {
    PANIC("no enough memory\n");
  }
  return res;
}

uint8_t ref_cnt(void* page) { //takes physical addr

  return page_ref_count[((uintptr_t)page - (uintptr_t)user_pool_base) >> 12];
}

uint8_t ref_page(void* page) {
  page_ref_count[((uintptr_t)page - (uintptr_t)user_pool_base) >> 12]++;
  return page_ref_count[((uintptr_t)page - (uintptr_t)user_pool_base) >> 12];
}

uint8_t ref_cnt_remove(void* page) {
  page_ref_count[((uintptr_t)page - (uintptr_t)user_pool_base) >> 12]--;
  return page_ref_count[((uintptr_t)page - (uintptr_t)user_pool_base) >> 12];
}
void free_swap_page(uint32_t* upage) {
  uint32_t* pd = thread_current()->pcb->pagedir;
  ASSERT(pagedir_is_swapped(pd, upage));
  ASSERT(pagedir_is_user(pd, upage));
  uint32_t slot = pagedir_get_swap_slot(pd, upage);
  ASSERT(bitmap_test(swap_use_map, slot));
  uint32_t* page = palloc_get_page(PAL_USER);
  if (page == NULL)
    PANIC("unable to allocate page for swap-in");
  void* kpage = ptov((uintptr_t)page);
  for (size_t i = 0; i < SWAP_SECTORS_PER_PAGE; ++i) {
    block_read(swap_block, slot * SWAP_SECTORS_PER_PAGE + i,
               (uint8_t*)kpage + i * BLOCK_SECTOR_SIZE);
  }
  pagedir_resume_swapped(pd, upage, kpage);
  bitmap_flip(swap_use_map, slot);
}

void free_swap_slot(uint32_t slot) {
  ASSERT(swap_use_map != NULL);
  ASSERT(slot < bitmap_size(swap_use_map));
  if (bitmap_test(swap_use_map, slot))
    bitmap_flip(swap_use_map, slot);
}

bool do_swap_page(uint32_t* pd, uint32_t* upage) {
  ASSERT(!pagedir_is_swapped(pd, upage));
  ASSERT(pagedir_is_user(pd, upage));
  uint32_t paddr = pagedir_get_physical_page(pd, upage);
  ASSERT(paddr != 0);
  void* kpage = pagedir_get_page(pd, upage);
  ASSERT(kpage != NULL);
  uint32_t idx = alloc_swap_page();
  for (size_t i = 0; i < SWAP_SECTORS_PER_PAGE; ++i) {
    block_write(swap_block, idx * SWAP_SECTORS_PER_PAGE + i,
                (uint8_t*)kpage + i * BLOCK_SECTOR_SIZE);
  }
  ASSERT(pagedir_set_swap_slot(pd, upage, idx));
  if (ref_cnt((void*)paddr) != 0)
    ref_cnt_remove((void*)paddr);
  else
    palloc_free_page((void*)paddr, true);
  return true;
}

bool do_swap(uint32_t* upage) {
  return do_swap_page(thread_current()->pcb->pagedir, upage);
}
