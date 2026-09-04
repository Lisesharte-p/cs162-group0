#ifndef PAGE_REPLACER_H
#define PAGE_REPLACER_H

#include <stddef.h>
#include <inttypes.h>
#include "devices/block.h"
#include "lib/kernel/list.h"
#include "threads/synch.h"
#include "threads/malloc.h"
#include "bitmap.h"
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
  bool visited; //for clock algorithm
  struct buffer_page* buffer;
};
int check_exist(block_sector_t sector, struct bitmap* records, block_sector_t* sector_array);
int evict(struct bitmap* records, bool* visited, size_t* now_evict, bool* in_use);
int record_access(block_sector_t se, struct bitmap* records, block_sector_t* sector_array,
                   bool* visited);

#endif