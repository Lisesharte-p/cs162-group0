#include "filesys/filesys.h"
#include <debug.h>
#include <stdio.h>
#include <string.h>
#include "filesys/file.h"
#include "filesys/free-map.h"
#include "filesys/inode.h"
#include "filesys/directory.h"
#include "filesys/buffer_cache.h"
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

  struct dir* dir = dir_open_root();
  if (name[0] == '/') {
    char *token, *save_ptr;
    int total_entity = 0;
    char* name_copy = malloc(sizeof(char) * (strlen(name) + 1));
    memcpy(name_copy, name, sizeof(char) * (strlen(name) + 1));
    for (token = strtok_r(name_copy, "/", &save_ptr); token != NULL;
         token = strtok_r(NULL, "/", &save_ptr)) {
      total_entity++;
    }
    free(name_copy);
    if (total_entity == 0) {
      dir_close(dir);
      return NULL;
    }
    char** entity_v = malloc(total_entity * sizeof(char*));
    int i = 0;
    for (token = strtok_r(name, "/", &save_ptr); token != NULL;
         token = strtok_r(NULL, "/", &save_ptr)) {
      entity_v[i] = token;

      i++;
    }
    for (int j = 0; j < total_entity; ++j) {
      if (j == total_entity - 1) {
        struct inode* inode = NULL;
        dir_lookup(dir, entity_v[j], &inode);
        if (inode != NULL) { //already exist
          dir_close(dir);
          free(entity_v);
          return NULL;
        }
        bool success = free_map_allocate(1, &inode_sector) &&
                       inode_create(inode_sector, initial_size) &&
                       dir_add(dir, entity_v[j], inode_sector, false);
        if (!success && inode_sector != 0)
          free_map_release(inode_sector, 1);
        dir_close(dir);
        return success;
      }
      struct inode* inode = NULL;
      bool is_dir=dir_lookup(dir, entity_v[j], &inode);
      if (inode == NULL||!is_dir) {

          dir_close(dir);
          free(entity_v);
          return NULL;

      } else {
        dir_close(dir);
        dir_open(inode);
      }
    }
  }

  //else: scan the working dir
  bool success =
      (dir != NULL && free_map_allocate(1, &inode_sector) &&
       inode_create(inode_sector, initial_size) && dir_add(dir, name, inode_sector, false));
  if (!success && inode_sector != 0)
    free_map_release(inode_sector, 1);
  dir_close(dir);

  return success;
}

/* Opens the file with the given NAME.
   Returns the new file if successful or a null pointer
   otherwise.
   Fails if no file named NAME exists,
   or if an internal memory allocation fails. */
struct file* filesys_open(const char* name) { //parse file path?
  if(!strcmp(name,"/")){
    struct file* res=file_open(inode_open(ROOT_DIR_SECTOR));
    res->is_dir = true;
    return res;
  }
  struct dir* dir = dir_open_root();
  
  struct inode* inode = NULL;
  if (name[0] == '/') {
    char *token, *save_ptr;
    int total_entity = 0;
    char* name_copy = malloc(sizeof(char) * (strlen(name) + 1));
    memcpy(name_copy, name, sizeof(char) * (strlen(name) + 1));

    for (token = strtok_r(name_copy, "/", &save_ptr); token != NULL;
         token = strtok_r(NULL, "/", &save_ptr)) {
      total_entity++;
    }
    free(name_copy);
    if (total_entity == 0) {
      dir_close(dir);
      return NULL;
    }
    char** entity_v = malloc(total_entity * sizeof(char*));
    int i = 0;
    for (token = strtok_r(name, "/", &save_ptr); token != NULL;
         token = strtok_r(NULL, "/", &save_ptr)) {
      entity_v[i] = token;

      i++;
    }

    for (int j = 0; j < total_entity; ++j) {
      if (j == total_entity - 1) {
        struct inode* inode = NULL;
        bool is_dir=dir_lookup(dir, entity_v[j], &inode);
        if (inode != NULL) { //already exist
          dir_close(dir);
          free(entity_v);
          struct file* res = file_open(inode);
          if(!res){
            return NULL;
          }
          res->is_dir = is_dir;
          return res;
        }
        dir_close(dir);
        free(entity_v);
        return NULL; //not exist
      }
      struct inode* inode = NULL;
      bool is_dir=dir_lookup(dir, entity_v[j], &inode);
      if (inode == NULL||!is_dir) {

        dir_close(dir);
        free(entity_v);
        return NULL;

      } else {
        dir_close(dir);
        dir_open(inode);
      }
    }
  }
  bool is_dir = false;
  if (dir != NULL)
    is_dir = dir_lookup(dir, name, &inode);
  dir_close(dir);

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
  struct dir* dir = dir_open_root();
  bool success = dir != NULL && dir_remove(dir, name);
  dir_close(dir);

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
