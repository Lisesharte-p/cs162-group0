#include "buffer_cache.h"
#include <string.h>
#include "stdio.h"
#include "threads/synch.h"
/* One lock for the whole cache.  buffer_region, sector_array, dirty[] and
   buffer_map are shared by every thread, and block_read()/block_write() block
   while the slot is only half filled: without the lock another thread can
   evict the slot we just claimed, or find it through check_exist() before the
   disk read has landed, and memcpy() the wrong sector into the caller's
   buffer. */
static struct lock buffer_lock;
struct list buffer_records;
struct bitmap* buffer_map;
block_sector_t sector_array[BUFFER_SIZE];
bool visited[BUFFER_SIZE];
bool dirty[BUFFER_SIZE];
bool in_use[BUFFER_SIZE];
void* buffer_region;
uint32_t now_evict;

//TODO!: we should use pre-allocated buffer region to avoid malloc failure

void page_buffer_init() {

  lock_init(&buffer_lock);
  buffer_map = bitmap_create(BUFFER_SIZE);
  buffer_region = malloc(BLOCK_SECTOR_SIZE * BUFFER_SIZE);
  memset(sector_array, 0, BUFFER_SIZE * sizeof(block_sector_t));
  memset(visited, 0, BUFFER_SIZE * sizeof(bool));
  memset(dirty, 0, BUFFER_SIZE * sizeof(bool));
  memset(in_use, 0, BUFFER_SIZE * sizeof(bool));
  now_evict = 0;
}
// struct buffer_page* register_page(block_sector_t sector) {}
static bool buffer_read_locked(struct block* blk, block_sector_t sector, void* buffer, size_t size,
                               int offset) {

  int idx = check_exist(sector, buffer_map, sector_array);
  if (idx != -1) { //already cached

    record_access(sector, buffer_map, sector_array, visited);
    memcpy(buffer, buffer_region + BLOCK_SECTOR_SIZE * idx + offset, size);
    return true;
  }
  for (int i = 0; i < BUFFER_SIZE; ++i) {
    if (!bitmap_test(buffer_map, i)) {
      idx = i;
      bitmap_flip(buffer_map, idx);
      break;
    }
  }
  if (idx == -1) { //need evict
    idx = evict(buffer_map, visited, &now_evict, in_use);

    if (dirty[idx]) {
      block_write(blk, sector_array[idx], buffer_region + BLOCK_SECTOR_SIZE * idx);
    }
  }
  if (idx == -1) {
    PANIC("read failed");
    return false;
  }
  ASSERT(idx<BUFFER_SIZE&&idx>=0);
  sector_array[idx] = sector;

  dirty[idx] = false;
  record_access(sector, buffer_map, sector_array, visited);

  block_read(blk, sector_array[idx], buffer_region + BLOCK_SECTOR_SIZE * idx); //first read
  memcpy(buffer, buffer_region + BLOCK_SECTOR_SIZE * idx + offset, size);
  return true;
}

static bool buffer_write_locked(struct block* blk, block_sector_t sector, void* buffer, size_t size,
                                int offset) {

  int idx = check_exist(sector, buffer_map, sector_array);
  if (idx != -1) { //already cached

    dirty[idx] = true;
    record_access(sector, buffer_map, sector_array, visited);
    memcpy(buffer_region + BLOCK_SECTOR_SIZE * idx + offset, buffer, size);
    return true;
  }
  for (int i = 0; i < BUFFER_SIZE; ++i) {
    if (!bitmap_test(buffer_map, i)) {
      idx = i;
      bitmap_flip(buffer_map, idx);
      break;
    }
  }
  if (idx == -1) { //need evict
    idx = evict(buffer_map, visited, &now_evict, in_use);

    if (dirty[idx]) {
      block_write(blk, sector_array[idx], buffer_region + BLOCK_SECTOR_SIZE * idx);
    }
  }
  if (idx == -1) {
    PANIC("write failed");
    return false;
  }


  sector_array[idx] = sector;
  dirty[idx] = true;
  record_access(sector, buffer_map, sector_array, visited);
  block_read(blk, sector_array[idx], buffer_region + BLOCK_SECTOR_SIZE * idx);

  memcpy(buffer_region + BLOCK_SECTOR_SIZE * idx + offset, buffer, size);
  return true;
}
bool buffer_read(struct block* blk, block_sector_t sector, void* buffer, size_t size, int offset) {
  lock_acquire(&buffer_lock);
  bool ok = buffer_read_locked(blk, sector, buffer, size, offset);
  lock_release(&buffer_lock);
  return ok;
}

bool buffer_write(struct block* blk, block_sector_t sector, void* buffer, size_t size, int offset) {
  lock_acquire(&buffer_lock);
  bool ok = buffer_write_locked(blk, sector, buffer, size, offset);
  lock_release(&buffer_lock);
  return ok;
}

bool write_back(struct block* blk, block_sector_t sector, void* buffer) {

  block_write(blk, sector, buffer);

  return true;
}
void write_all(struct block* blk) {
  lock_acquire(&buffer_lock);
  for (int i = 0; i < BUFFER_SIZE; ++i) {
    if (dirty[i]) {
      write_back(blk, sector_array[i], buffer_region + BLOCK_SECTOR_SIZE * i);
    }
  }
  lock_release(&buffer_lock);
}