#include "buffer_cache.h"
#include <string.h>

struct list buffer_records;

//TODO!: we should use pre-allocated buffer region to avoid malloc failure

void page_buffer_init() { list_init(&buffer_records); }
// struct buffer_page* register_page(block_sector_t sector) {}
bool buffer_read(struct block* blk, block_sector_t sector, void* buffer, size_t size, int offset) {
  struct sector_elem* se = check_exist(sector, &buffer_records);

  if (se == NULL) { //not in buffer
    se = malloc(sizeof(struct sector_elem));
    if (!se) {
      return false;
    }
    struct buffer_page* bp = malloc(sizeof(struct buffer_page));
    if (!bp) {
      free(se);
      return false;
    }
    bp->data = malloc(BLOCK_SECTOR_SIZE);
    if (!bp->data) {
      free(se);
      free(bp);
      return false;
    }
    rw_lock_init(&bp->lk);
    bp->sector = sector;
    se->buffer = bp;
    se->sector = sector;
    if (list_size(&buffer_records) >= BUFFER_SIZE) {
      struct sector_elem* se_evicted = evict(&buffer_records);
      write_back(se_evicted->buffer, blk);
      free(se_evicted->buffer);
      free(se_evicted);
    }
    block_read(blk, sector, se->buffer->data);
  }
  record_access(se, &buffer_records);
  rw_lock_acquire(&se->buffer->lk, true);
  memcpy(buffer, se->buffer->data + offset, size);
  rw_lock_release(&se->buffer->lk, true);
  return true;
}

bool buffer_write(struct block* blk, block_sector_t sector, void* buffer, size_t size, int offset) {
  struct sector_elem* se = check_exist(sector, &buffer_records);
  if (se == NULL) { //not in buffer
    se = malloc(sizeof(struct sector_elem));
    if (!se) {
      return false;
    }
    struct buffer_page* bp = malloc(sizeof(struct buffer_page));
    if (!bp) {
      free(se);
      return false;
    }
    bp->data = malloc(BLOCK_SECTOR_SIZE);
    if (!bp->data) {
      free(se);
      free(bp);
      return false;
    }
    rw_lock_init(&bp->lk);
    bp->sector = sector;
    se->buffer = bp;
    se->sector = sector;
    if (list_size(&buffer_records) >= BUFFER_SIZE) {
      struct sector_elem* se_evicted = evict(&buffer_records);
      write_back(se_evicted->buffer, blk);
      free(se_evicted->buffer);
      free(se_evicted);
    }
    block_read(blk, sector, se->buffer->data);
  }
  record_access(se, &buffer_records);
  rw_lock_acquire(&se->buffer->lk, false);
  memcpy(se->buffer->data + offset, buffer, size);
  rw_lock_release(&se->buffer->lk, false);
  return true;
}
bool write_back(struct buffer_page* page, struct block* blk) {
  if (page == NULL) {
    return true;
  }
  rw_lock_acquire(&page->lk, false);
  block_write(blk, page->sector, page->data);
  return true;
}
void write_all() {
  struct list_elem* head = list_begin(&buffer_records);
  struct list_elem* tail = list_end(&buffer_records);
  while (head != tail) {
    struct sector_elem* se = list_entry(head, struct sector_elem, elem);
    write_back(se->buffer, fs_device);
    head = list_next(head);
  }
}