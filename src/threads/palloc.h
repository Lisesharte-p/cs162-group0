#ifndef THREADS_PALLOC_H
#define THREADS_PALLOC_H

#include <stddef.h>
#define kernel_page_limit 251888 //1GB kernel space, starts from 1MB
/* How to allocate pages. */
enum palloc_flags {
  PAL_ASSERT = 001, /* Panic on failure. */
  PAL_ZERO = 002,   /* Zero page contents. */
  PAL_USER = 004    /* User page. */
};

void palloc_init_kernel(size_t user_page_limit);
void* palloc_get_page(enum palloc_flags);
void* palloc_get_multiple(enum palloc_flags, size_t page_cnt);
void palloc_free_page(void*);
void palloc_free_multiple(void*, size_t page_cnt);
void palloc_init_user(size_t user_page_limit);
#endif /* threads/palloc.h */
