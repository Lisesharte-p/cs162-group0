#ifndef FILESYS_DIRECTORY_H
#define FILESYS_DIRECTORY_H

#include <stdbool.h>
#include <stddef.h>
#include "devices/block.h"
#include "filesys/off_t.h"
/* Maximum length of a file name component.
   This is the traditional UNIX maximum length.
   After directories are implemented, this maximum length may be
   retained, but much longer full path names must be allowed. */
#define NAME_MAX 14
#define MAX_ENTRIES 16
struct inode;
struct dir {
  struct inode* inode; /* Backing store. */
  off_t pos;           /* Current position. */
  int len;
};
/* Opening and closing directories. */
bool dir_create(block_sector_t sector, size_t entry_cnt);
struct dir* dir_open(struct inode*);
struct dir* dir_open_root(void);
/* Opens the parent directory for PATH and returns its final component in
   *NAME.  The caller owns *NAME and must free it, and must close the returned
   directory.  Returns NULL when PATH is invalid or an intermediate component
   cannot be opened as a directory. */
struct dir* dir_open_path(const char* path, char** name);
struct dir* dir_reopen(struct dir*);
void dir_close(struct dir*);
struct inode* dir_get_inode(struct dir*);

/* Reading and writing. */
bool dir_lookup(const struct dir*, const char* name, struct inode**);
bool dir_add(struct dir*, const char* name, block_sector_t,bool is_dir);
bool dir_remove(struct dir*, const char* name);
bool dir_readdir(struct dir*, char name[NAME_MAX + 1]);
bool mkdir_(char* path);
bool isdir_(char* path,block_sector_t *sector);
int dir_len(struct dir* dir);
#endif /* filesys/directory.h */
