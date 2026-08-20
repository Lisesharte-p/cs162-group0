#ifndef PAGE_REPLACER_H
#define PAGE_REPLACER_H

#include <stddef.h>
#include <inttypes.h>
#include "devices/block.h"
#include "lib/kernel/list.h"
#include "threads/synch.h"
#include "threads/malloc.h"
//we use LRU here, a list would be enough.
#define BUFFER_SIZE 64
struct buffer_page {
  void* data;
  struct rw_lock lk;
  block_sector_t sector;
};
struct sector_elem {
  block_sector_t sector;
  struct list_elem elem;
  bool visited;//for clock algorithm
  struct buffer_page* buffer;
};
struct sector_elem* check_exist(block_sector_t sector, struct list* records);
struct sector_elem* evict(struct list* records);
bool record_access(struct sector_elem* se, struct list* records);

#endif