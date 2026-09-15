#include "filesys/filesys.h"
#include <debug.h>
#include <stdio.h>
#include <string.h>
#include "filesys/file.h"
#include "filesys/free-map.h"
#include "filesys/inode.h"
#include "filesys/directory.h"
#include "filesys/buffer_cache.h"
#include "threads/thread.h"
#include "userprog/process.h"
/* Partition that contains the file system. */
struct block* fs_device;

static void do_format(void);

/* Initializes the file system module.
   If FORMAT is true, reformats the file system. */
void filesys_init(bool format) {
  fs_device = block_get_role(BLOCK_FILESYS);
  if (fs_device == NULL)
    PANIC("No file system device found, can't initialize file system.");

  inode_init();
  free_map_init();

  if (format)
    do_format();

  free_map_open();
}

/* Shuts down the file system module, writing any unwritten data
   to disk. */
void filesys_done(void) {
  write_all(fs_device);

  free_map_close();
}

/* Creates a file named NAME with the given INITIAL_SIZE.
   Returns true if successful, false otherwise.
   Fails if a file named NAME already exists,
   or if internal memory allocation fails. */
bool filesys_create(const char* name, off_t initial_size) {
  block_sector_t inode_sector = 0;
  char* leaf;
  struct dir* dir = dir_open_path(name, &leaf);
  struct inode* inode = NULL;
  bool success;

  if (dir == NULL || strcmp(leaf, ".") == 0) {
    dir_close(dir);
    free(leaf);
    return false;
  }

  dir_lookup(dir, leaf, &inode);
  if (inode != NULL) {
    inode_close(inode);
    dir_close(dir);
    free(leaf);
    return false;
  }

  success = free_map_allocate(1, &inode_sector) &&
            inode_create(inode_sector, initial_size) &&
            dir_add(dir, leaf, inode_sector, false);
  if (!success && inode_sector != 0)
    free_map_release(inode_sector, 1);
  dir_close(dir);
  free(leaf);
  return success;
}

/* Opens the file with the given NAME.
   Returns the new file if successful or a null pointer
   otherwise.
   Fails if no file named NAME exists,
   or if an internal memory allocation fails. */
struct file* filesys_open(const char* name) {
  if (name == NULL)
    return NULL;
  if (!strcmp(name, "/")) {
    struct file* res = file_open(inode_open(ROOT_DIR_SECTOR));
    if (res != NULL)
      res->is_dir = true;
    return res;
  }
  char* leaf;
  struct dir* dir = dir_open_path(name, &leaf);
  struct inode* inode = NULL;
  bool is_dir = false;
  if (dir == NULL)
    return NULL;

  if (strcmp(leaf, ".") == 0) {
    inode = inode_reopen(dir_get_inode(dir));
    is_dir = true;
  } else {
    is_dir = dir_lookup(dir, leaf, &inode);
  }

  dir_close(dir);
  free(leaf);

  struct file* res = file_open(inode);

  if (!res) {
    return NULL;
  }
  res->is_dir = is_dir;
  return res;
}

/* Deletes the file named NAME.
   Returns true if successful, false on failure.
   Fails if no file named NAME exists,
   or if an internal memory allocation fails. */
bool filesys_remove(const char* name) {
  if (name == NULL)
    return false;
  if (!strcmp(name, "/")) {
    return false;
  }
  char* leaf;
  struct dir* dir = dir_open_path(name, &leaf);
  struct inode* inode = NULL;
  bool is_dir;

  if (dir == NULL || strcmp(leaf, ".") == 0) {
    dir_close(dir);
    free(leaf);
    return false;
  }

  is_dir = dir_lookup(dir, leaf, &inode);
  if (inode == NULL) {
    dir_close(dir);
    free(leaf);
    return false;
  }

  if (is_dir) {
    struct dir* target = dir_open(inode);
    if (target == NULL || dir_len(target) != 1 || thread_current()->pcb->cwd_sector==get_inode_sector(inode)) {
      dir_close(target);
      dir_close(dir);
      free(leaf);
      return false;
      }
    dir_close(target);
  } else {
    inode_close(inode);
  }

  bool success = dir_remove(dir, leaf);
  dir_close(dir);
  free(leaf);
  return success;
}

/* Formats the file system. */
static void do_format(void) {
  printf("Formatting file system...");
  free_map_create();
  if (!dir_create(ROOT_DIR_SECTOR, 16))
    PANIC("root directory creation failed");
  free_map_close();
  printf("done.\n");
}
