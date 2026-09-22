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
  swap_map_buf = malloc(block_size(swap_block) / 8 / 4); //1 page uses 4 sectors
  swap_use_map = bitmap_create_in_buf(block_size(swap_block) / 4 / 8, swap_map_buf,
                                      block_size(swap_block) / 4);

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
  ASSERT(!pagedir_is_swapped(thread_current()->pcb->pagedir, upage)); //only ref in memory page
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
  uint32_t paddr = pagedir_get_physical_page(pd, upage);
  ASSERT(paddr != NULL);
  ASSERT(bitmap_test(swap_use_map, paddr >> 12) == true);
  bitmap_flip(swap_use_map, paddr >> 12);
  uint32_t* page = palloc_get_page(PAL_USER);
  pagedir_resume_swapped(pd, upage, ptov((uintptr_t)page));
  for (int i = 0; i < 4; ++i) {
    block_read(swap_block, ((paddr >> 12) << 2) + i, upage + i * 512);
  }
}

bool do_swap(uint32_t* upage) {
  uint32_t* pd = thread_current()->pcb->pagedir;
  ASSERT(!pagedir_is_swapped(pd, upage));
  ASSERT(pagedir_is_user(pd, upage));
  uint32_t paddr = pagedir_get_physical_page(pd, upage);
  ASSERT(paddr != NULL);
  uint32_t idx = alloc_swap_page();
  for (int i = 0; i < 4; ++i) {
    block_write(swap_block, (idx << 2 )+ i, upage + i * 512);
  }
  pagedir_set_swapped(pd, upage,true);
  return true;
}