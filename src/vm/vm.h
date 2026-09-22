#ifndef PINTOS_VM
#define PINTOS_VM
#include <debug.h>
#include <stdint.h>
#include <stdbool.h>

extern uint8_t* page_ref_count;
extern uint8_t* user_pool_base;

bool vm_init(uint32_t user_pages,uint8_t* base);

uint8_t ref_cnt(void* page);

uint8_t ref_page(void* page);

uint8_t ref_cnt_remove(void* page);

void free_swap_page(uint32_t* page);
void free_swap_slot(uint32_t slot);

bool do_swap(uint32_t* upage);
bool do_swap_page(uint32_t* pd, uint32_t* upage);


#endif
