#include "vm.h"
#include "threads/malloc.h"
#include "lib/string.h"
uint8_t* page_ref_count;
uint8_t* user_pool_base;

bool vm_init(uint32_t user_pages, uint8_t* base) {
  page_ref_count = malloc(sizeof(uint8_t) * user_pages);
  memset(page_ref_count, 0, sizeof(uint8_t) * user_pages);
  user_pool_base = base;
  return true;
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
