#ifndef BUFFER_CACHE_H
#define BUFFER_CACHE_H

#include "filesys/replacer.h"
#include "filesys/filesys.h"



void page_buffer_init();
bool buffer_read(struct block* blk, block_sector_t sector, void* buffer);
bool buffer_write(struct block* blk, block_sector_t sector, void* buffer);
bool write_back(struct buffer_page* page,struct block* blk);
void write_all();
#endif