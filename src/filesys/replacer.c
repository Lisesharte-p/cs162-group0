#include "filesys/replacer.h"

struct sector_elem* check_exist(block_sector_t sector, struct list* records) {
  struct list_elem* head = list_begin(records);
  struct list_elem* tail = list_end(records);
  while (head != tail) {
    struct sector_elem* se = list_entry(head, struct sector_elem, elem);
    if (se->sector == sector) {
      return se;
    }
    head = list_next(head);
  }
  return NULL;
}

struct sector_elem* evict(struct list* records) { //should consider page in use
  if (list_empty(records)) {
    return NULL;
  }
  struct sector_elem* se = list_entry(list_back(records), struct sector_elem, elem);
  list_remove(&se->elem);
  return se;
}
bool record_access(struct sector_elem* se, struct list* records) {
  if (check_exist(se->sector, records) == se) {
    list_remove(&se->elem);
  }

  list_push_front(records, &se->elem);
  return true;
}