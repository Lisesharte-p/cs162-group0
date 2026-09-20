#ifndef USERPROG_PAGEDIR_H
#define USERPROG_PAGEDIR_H

#include <stdbool.h>
#include <stdint.h>

uint32_t* pagedir_create(void);
void pagedir_destroy(uint32_t* pd);
bool pagedir_set_page(uint32_t* pd, void* upage, void* kpage, bool rw, bool is_cow);
bool pagedir_set_kernel_page(uint32_t* pd, void* kvaddr, void* kpage, bool writable);
void* pagedir_get_kernel_page(uint32_t* pd, const void* kvaddr);
void pagedir_clear_kernel_page(uint32_t* pd, void* kvaddr);
void* pagedir_get_page(uint32_t* pd, const void* upage);
void pagedir_clear_page(uint32_t* pd, void* upage);
void pagedir_set_writable(uint32_t* pd, void* upage, bool writable);
bool pagedir_is_dirty(uint32_t* pd, const void* upage);
void pagedir_set_dirty(uint32_t* pd, const void* upage, bool dirty);
bool pagedir_is_accessed(uint32_t* pd, const void* upage);
void pagedir_set_accessed(uint32_t* pd, const void* upage, bool accessed);
void pagedir_activate(uint32_t* pd);
uint32_t* active_pd(void);

#endif /* userprog/pagedir.h */
