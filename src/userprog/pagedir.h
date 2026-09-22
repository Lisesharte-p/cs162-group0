#ifndef USERPROG_PAGEDIR_H
#define USERPROG_PAGEDIR_H

#include <stdbool.h>
#include <stdint.h>

uint32_t* pagedir_create(void);
void pagedir_destroy(uint32_t* pd);
bool pagedir_set_page(uint32_t* pd, void* upage, void* kpage, bool rw, bool is_cow);
bool pagedir_replace_page(uint32_t* pd, void* upage, void* kpage, bool rw, bool is_cow);
bool pagedir_set_page_flags(uint32_t* pd, void* upage, bool rw, bool is_cow);
bool pagedir_set_cow_page(uint32_t* pd, void* upage, void* kpage, bool rw, bool is_cow);
bool pagedir_set_physical_page(uint32_t* pd, void* upage, uintptr_t paddr, bool rw,
                               bool is_cow);
uintptr_t pagedir_get_physical_page(uint32_t* pd, const void* upage);
void* pagedir_map_temp_page(uint32_t* pd, uintptr_t paddr, bool writable);
void pagedir_unmap_temp_page(uint32_t* pd, void* upage);
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
bool page_is_cow(uint32_t* pd, const void* upage);
bool pagedir_is_user(uint32_t* pd, const void* vpage);
bool pagedir_is_swapped(uint32_t* pd, const void* vpage);
void pagedir_resume_swapped(uint32_t* pd, void* upage, void* kapge);
void pagedir_set_swapped(uint32_t* pd, const void* vpage, bool swapped);
#endif /* userprog/pagedir.h */
