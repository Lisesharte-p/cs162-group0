#include "filesys/replacer.h"
#include "devices/timer.h"
#include "stdio.h"
int check_exist(block_sector_t sector, struct bitmap* records, block_sector_t* sector_array) {
  int idx = 0;
  while(idx<BUFFER_SIZE){
    if(sector_array[idx]==sector){
      return bitmap_test(records, idx)?idx:-1;
    }
    ++idx;
  }
  return -1;
}

int evict(struct bitmap* records,bool* visited,size_t* now_evict,bool* in_use) { //should consider page in use, sleep if all pages in use
  int i = 0;
  int trys = 0;
  while (++i) {
    if(!visited[*now_evict]&&!in_use[*now_evict]){

      return *now_evict;
    } else {
      if(trys>5){
        printf("eviction failed");
        return -1;
      }
      if(!i%BUFFER_SIZE){
        trys++;

      }
      visited[*now_evict] = false;
      *now_evict = *now_evict < BUFFER_SIZE-1 ? *now_evict+1 : 0;
    }
  }
}

int record_access(block_sector_t se, struct bitmap* records, block_sector_t* sector_array,bool* visited) {
  int idx = check_exist(se, records, sector_array);
  if (idx!=-1) {
    visited[idx] = true;
    return idx;
  }

  if(idx==BITMAP_ERROR){
    return -1;
  }
  sector_array[idx] = se;
  visited[idx] = true;
  return idx;
}