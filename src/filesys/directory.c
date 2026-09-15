#include "filesys/directory.h"
#include <stdio.h>
#include <string.h>
#include <list.h>
#include "filesys/filesys.h"
#include "filesys/inode.h"
#include "threads/malloc.h"
#include "filesys/free-map.h"
#include "threads/thread.h"
#include "userprog/process.h"
/* A directory. */

/* A single directory entry. */
struct dir_entry {
  block_sector_t inode_sector; /* Sector number of header. */
  char name[NAME_MAX + 1];     /* Null terminated file name. */
  bool in_use;                 /* In use or free? */
  bool is_dir;
};

/* Creates a directory with space for ENTRY_CNT entries in the
   given SECTOR.  Returns true if successful, false on failure. */
bool dir_create(block_sector_t sector,
                size_t entry_cnt) { //add the dir self (.) and the parent dir (..)
  return inode_create(sector, entry_cnt * sizeof(struct dir_entry));
}

/* Opens and returns the directory for the given INODE, of which
   it takes ownership.  Returns a null pointer on failure. */
struct dir* dir_open(struct inode* inode) {
  struct dir* dir = calloc(1, sizeof *dir);
  if (inode != NULL && dir != NULL) {
    dir->inode = inode;
    dir->pos = 0;
    // dir->len = -1;//not initialized
    return dir;
  } else {
    inode_close(inode);
    free(dir);
    return NULL;
  }
}

/* Opens the root directory and returns a directory for it.
   Return true if successful, false on failure. */
struct dir* dir_open_root(void) { return dir_open(inode_open(ROOT_DIR_SECTOR)); }

struct dir* dir_open_cwd() { return dir_open(inode_open(thread_current()->pcb->cwd_sector)); }

/* Opens the parent directory of PATH and copies its final component to NAME.
   PATH is interpreted from the root directory, matching the filesystem's
   existing path handling. */
struct dir*
dir_open_path(const char* path,
              char** name) { //if starts with /, start from root, else we start from cwd.
  struct dir* dir;
  char* path_copy;
  char* token;
  char* save_ptr;

  if (name == NULL)
    return NULL;

  *name = NULL;
  if (path == NULL || *path == '\0')
    return NULL;
  path_copy = malloc(strlen(path) + 1);
  if (path_copy == NULL)
    return NULL;
  strlcpy(path_copy, path, strlen(path) + 1);

  if (path[0] == '/') {
    dir = dir_open_root();
  } else {
    dir = dir_open_cwd();
  }

  if (dir == NULL) {
    free(path_copy);
    return NULL;
  }

  token = strtok_r(path_copy, "/", &save_ptr);
  if (token == NULL) {
    dir_close(dir);
    free(path_copy);
    return NULL;
  }

  for (;;) {
    char* next = strtok_r(NULL, "/", &save_ptr);
    if (next == NULL) {
      *name = malloc(strlen(token) + 1);
      if (*name == NULL) {
        dir_close(dir);
        free(path_copy);
        return NULL;
      }
      strlcpy(*name, token, strlen(token) + 1);
      free(path_copy);
      return dir;
    }

    struct inode* inode = NULL;
    bool is_dir = dir_lookup(dir, token, &inode);
    if (inode == NULL || !is_dir) {
      inode_close(inode);
      dir_close(dir);
      free(path_copy);
      return NULL;
    }

    struct dir* next_dir = dir_open(inode);
    if (next_dir == NULL) {
      dir_close(dir);
      free(path_copy);
      return NULL;
    }
    dir_close(dir);
    dir = next_dir;
    token = next;
  }
}

/* Opens and returns a new directory for the same inode as DIR.
   Returns a null pointer on failure. */
struct dir* dir_reopen(struct dir* dir) { return dir_open(inode_reopen(dir->inode)); }

/* Destroys DIR and frees associated resources. */
void dir_close(struct dir* dir) {
  if (dir != NULL) {
    inode_close(dir->inode);
    free(dir);
  }
}

/* Returns the inode encapsulated by DIR. */
struct inode* dir_get_inode(struct dir* dir) { return dir->inode; }

/* Searches DIR for a file with the given NAME.
   If successful, returns true, sets *EP to the directory entry
   if EP is non-null, and sets *OFSP to the byte offset of the
   directory entry if OFSP is non-null.
   otherwise, returns false and ignores EP and OFSP. */
static bool lookup(const struct dir* dir, const char* name, struct dir_entry* ep, off_t* ofsp) {
  struct dir_entry e;
  size_t ofs;

  ASSERT(dir != NULL);
  ASSERT(name != NULL);

  for (ofs = 0; inode_read_at(dir->inode, &e, sizeof e, ofs) == sizeof e; ofs += sizeof e)
    if (e.in_use && !strcmp(name, e.name)) {
      if (ep != NULL)
        *ep = e;
      if (ofsp != NULL)
        *ofsp = ofs;
      return true;
    }
  return false;
}

/* Searches DIR for a file with the given NAME
   and returns true if one exists, false otherwise.
   On success, sets *INODE to an inode for the file, otherwise to
   a null pointer.  The caller must close *INODE. */
bool dir_lookup(const struct dir* dir, const char* name,
                struct inode** inode) { //true if is_dir false if is file
  ASSERT(dir != NULL);
  ASSERT(name != NULL);
  ASSERT(inode != NULL);

  if (strcmp(name, ".") == 0) {
    *inode = inode_reopen(dir->inode);
    return true;
  }
  struct dir_entry e;

  if (lookup(dir, name, &e, NULL)) {
    *inode = inode_open(e.inode_sector);
    return e.is_dir;
  } else {
    *inode = NULL;
    return false;
  }
}

/* Adds a file named NAME to DIR, which must not already contain a
   file by that name.  The file's inode is in sector
   INODE_SECTOR.
   Returns true if successful, false on failure.
   Fails if NAME is invalid (i.e. too long) or a disk or memory
   error occurs. */
bool dir_add(struct dir* dir, const char* name, block_sector_t inode_sector, bool is_dir) {
  struct dir_entry e;
  off_t ofs;
  bool success = false;

  ASSERT(dir != NULL);
  ASSERT(name != NULL);

  /* Check NAME for validity. */
  if (*name == '\0' || strlen(name) > NAME_MAX)
    return false;

  /* Check that NAME is not in use. */
  if (lookup(dir, name, NULL, NULL))
    goto done;

  /* Set OFS to offset of free slot.
     If there are no free slots, then it will be set to the
     current end-of-file.

     inode_read_at() will only return a short read at end of file.
     Otherwise, we'd need to verify that we didn't get a short
     read due to something intermittent such as low memory. */
  for (ofs = 0; inode_read_at(dir->inode, &e, sizeof e, ofs) == sizeof e; ofs += sizeof e)
    if (!e.in_use)
      break;

  /* Write slot. */
  e.in_use = true;
  strlcpy(e.name, name, sizeof e.name);
  e.inode_sector = inode_sector;
  e.is_dir = is_dir;
  success = inode_write_at(dir->inode, &e, sizeof e, ofs) == sizeof e;

done:
  return success;
}

/* Removes any entry for NAME in DIR.
   Returns true if successful, false on failure,
   which occurs only if there is no file with the given NAME. */
bool dir_remove(struct dir* dir, const char* name) {
  struct dir_entry e;
  struct inode* inode = NULL;
  bool success = false;
  off_t ofs;

  ASSERT(dir != NULL);
  ASSERT(name != NULL);

  /* Find directory entry. */
  if (!lookup(dir, name, &e, &ofs))
    goto done;

  /* Open inode. */
  inode = inode_open(e.inode_sector);
  if (inode == NULL)
    goto done;

  /* Erase directory entry. */
  e.in_use = false;
  if (inode_write_at(dir->inode, &e, sizeof e, ofs) != sizeof e)
    goto done;

  /* Remove inode. */
  inode_remove(inode);
  success = true;

done:
  inode_close(inode);
  return success;
}

/* Reads the next directory entry in DIR and stores the name in
   NAME.  Returns true if successful, false if the directory
   contains no more entries. */
bool dir_readdir(struct dir* dir, char name[NAME_MAX + 1]) {
  struct dir_entry e;

  while (inode_read_at(dir->inode, &e, sizeof e, dir->pos) == sizeof e) {
    dir->pos += sizeof e;
    if (e.in_use&&strcmp(e.name,"..")) {
      strlcpy(name, e.name, NAME_MAX + 1);
      return true;
    }
  }
  return false;
}

bool mkdir_(char* path) { //add the parent dir to it
  char* name;
  struct dir* dir = dir_open_path(path, &name);
  struct inode* inode = NULL;
  block_sector_t sector = 0;
  bool success;

  if (dir == NULL)
    return false;

  bool is_dir = dir_lookup(dir, name, &inode);
  if (inode != NULL) {
    inode_close(inode);
    dir_close(dir);
    free(name);
    return is_dir;
  }

  if (!free_map_allocate(1, &sector) || !dir_create(sector, 16)) {
    if (sector != 0)
      free_map_release(sector, 1);
    dir_close(dir);
    free(name);
    return false;
  }
  struct dir* dir_new = dir_open(inode_open(sector));
  dir_add(dir_new, "..", get_inode_sector(dir->inode), true);
  success = dir_add(dir, name, sector, true);
  if (!success)
    free_map_release(sector, 1);
  dir_close(dir);
  free(name);
  return success;
}

bool isdir_(char* path, block_sector_t* sector) {
  if (path == NULL)
    return false;
  if (strcmp(path, "/") == 0) {
    return true;
  }
  char* name;
  struct dir* dir = dir_open_path(path, &name);
  struct inode* inode = NULL;
  bool is_dir = false;

  if (dir == NULL)
    return false;
  is_dir = dir_lookup(dir, name, &inode);
  if(!inode){
    dir_close(dir);
    free(name);
    return false;
  }
  *sector = get_inode_sector(inode);
  inode_close(inode);
  dir_close(dir);
  free(name);
  return inode != NULL && is_dir;
}

int dir_len(struct dir* dir) {
  struct dir_entry e;
  int res = 0;
  while (inode_read_at(dir->inode, &e, sizeof e, dir->pos) == sizeof e) {
    dir->pos += sizeof e;
    if (e.in_use) {
      res++;
    }
  }

  return res;
}
