#include "filesys/inode.h"
#include <list.h>
#include <debug.h>
#include <round.h>
#include <string.h>
#include "filesys/filesys.h"
#include "filesys/free-map.h"
#include "threads/malloc.h"
#include "threads/synch.h"
#include "filesys/buffer_cache.h"
/* Identifies an inode. */
#define INODE_MAGIC 0x494e4f44
#define INODE_FIRST_LAYER_NODES 125
#define INODE_SECOND_LAYER_NODES 127
/* On-disk inode.
   Must be exactly BLOCK_SECTOR_SIZE bytes long. */
struct inode_disk {
  block_sector_t start;                            /* First data sector. */
  off_t length;                                    /* File size in bytes. */
  unsigned magic;                                  /* Magic number. */
  block_sector_t sectors[INODE_FIRST_LAYER_NODES]; /* data sectors, max 125*512 bytes */
};
struct inode_node_disk {
  unsigned magic;
  block_sector_t sectors[INODE_SECOND_LAYER_NODES];
};
/* Returns the number of sectors to allocate for an inode SIZE
   bytes long. */
static inline size_t bytes_to_sectors(off_t size) { return DIV_ROUND_UP(size, BLOCK_SECTOR_SIZE); }
static inline size_t bytes_to_sector_nodes(off_t size) {
  return DIV_ROUND_UP(size, BLOCK_SECTOR_SIZE) / INODE_FIRST_LAYER_NODES;
}
/* In-memory inode. */
struct inode {
  struct list_elem elem;  /* Element in inode list. */
  block_sector_t sector;  /* Sector number of disk location. */
  int open_cnt;           /* Number of openers. */
  bool removed;           /* True if deleted, false otherwise. */
  int deny_write_cnt;     /* 0: writes ok, >0: deny writes. */
  struct inode_disk data; /* Inode content. */
  struct lock lock;       /* Per-inode lock (protects deny_write_cnt, removed, data). */
};

/* Returns the block device sector that contains byte offset POS
   within INODE.
   Returns -1 if INODE does not contain data for a byte at offset
   POS. */
static block_sector_t byte_to_sector(const struct inode* inode, off_t pos) {
  ASSERT(inode != NULL);
  if (pos < inode->data.length)
    return inode->data.sectors[pos / BLOCK_SECTOR_SIZE];
  else
    return -1;
}

/* List of open inodes, so that opening a single inode twice
   returns the same `struct inode'.  Protected by open_inodes_lock. */
static struct list open_inodes;
static struct lock open_inodes_lock;
/* Initializes the inode module. */
void inode_init(void) {
  list_init(&open_inodes);
  lock_init(&open_inodes_lock);
}

/* Initializes an inode with LENGTH bytes of data and
   writes the new inode to sector SECTOR on the file system
   device.
   Returns true if successful.
   Returns false if memory or disk allocation fails. */
bool inode_create(block_sector_t sector, off_t length) {
  struct inode_disk* disk_inode = NULL;
  bool success = false;

  ASSERT(length >= 0);

  /* If this assertion fails, the inode structure is not exactly
     one sector in size, and you should fix that. */
  ASSERT(sizeof *disk_inode == BLOCK_SECTOR_SIZE);

  disk_inode = calloc(1, sizeof *disk_inode);
  if (disk_inode != NULL) {
    size_t sectors = bytes_to_sectors(length);
    if (sectors > 125) {
      return false;
    }
    disk_inode->length = length;
    if (free_map_allocate(sectors, &disk_inode->start)) {
      disk_inode->magic = INODE_MAGIC;

      if (sectors > 0) {
        static char zeros[BLOCK_SECTOR_SIZE];
        size_t i;

        for (i = 0; i < sectors; i++) {
          disk_inode->sectors[i] = disk_inode->start + i;
          buffer_write(fs_device, disk_inode->sectors[i], zeros, BLOCK_SECTOR_SIZE, 0);
        }
      }
      {
        buffer_write(fs_device, sector, disk_inode, BLOCK_SECTOR_SIZE, 0);
      }
      success = true;
    } else {
      disk_inode->magic = INODE_MAGIC;

      {
        buffer_write(fs_device, sector, disk_inode, BLOCK_SECTOR_SIZE, 0);
      }
      static char zeros[BLOCK_SECTOR_SIZE];
      size_t allocated = 0;
      size_t remains = sectors;
      size_t alloc_try = remains / 2;
      while (allocated != sectors) {
        uint32_t first_sector = 0;
        if (free_map_allocate(alloc_try, &first_sector)) {
          for (int i = allocated; i < alloc_try + allocated; ++i) {
            disk_inode->sectors[i] = first_sector + i - allocated;
            buffer_write(fs_device, disk_inode->sectors[i], zeros, BLOCK_SECTOR_SIZE, 0);
          }
          allocated += alloc_try;
        } else {
          alloc_try /= 2;
          if (alloc_try == 0) { //TODO: add space recycle here
            // return false;
            alloc_try = 1;
          }
        }
      }

      {
        buffer_write(fs_device, sector, disk_inode, BLOCK_SECTOR_SIZE, 0);
      }
      success = true;
    }
    free(disk_inode);
  }
  return success;
}

/* Reads an inode from SECTOR
   and returns a `struct inode' that contains it.
   Returns a null pointer if memory allocation fails. */
struct inode* inode_open(block_sector_t sector) {
  struct list_elem* e;
  struct inode* inode;

  lock_acquire(&open_inodes_lock);

  /* Check whether this inode is already open. */
  for (e = list_begin(&open_inodes); e != list_end(&open_inodes); e = list_next(e)) {
    inode = list_entry(e, struct inode, elem);
    if (inode->sector == sector) {
      inode->open_cnt++;
      lock_release(&open_inodes_lock);
      return inode;
    }
  }

  /* Allocate memory. */
  inode = malloc(sizeof *inode);
  if (inode == NULL) {
    lock_release(&open_inodes_lock);
    return NULL;
  }

  /* Initialize. */
  list_push_front(&open_inodes, &inode->elem);
  inode->sector = sector;
  inode->open_cnt = 1;
  inode->deny_write_cnt = 0;
  inode->removed = false;
  lock_init(&inode->lock);

  buffer_read(fs_device, inode->sector, &inode->data, BLOCK_SECTOR_SIZE, 0);
  lock_release(&open_inodes_lock);
  return inode;
}

/* Reopens and returns INODE. */
struct inode* inode_reopen(struct inode* inode) {
  if (inode != NULL) {
    lock_acquire(&open_inodes_lock);
    inode->open_cnt++;
    lock_release(&open_inodes_lock);
  }
  return inode;
}

/* Returns INODE's inode number. */
block_sector_t inode_get_inumber(const struct inode* inode) { return inode->sector; }

/* Closes INODE and writes it to disk.
   If this was the last reference to INODE, frees its memory.
   If INODE was also a removed inode, frees its blocks. */
void inode_close(struct inode* inode) {
  /* Ignore null pointer. */
  if (inode == NULL)
    return;

  lock_acquire(&open_inodes_lock);

  /* Release resources if this was the last opener. */
  if (--inode->open_cnt == 0) {
    /* Remove from inode list and release lock. */
    list_remove(&inode->elem);
    lock_release(&open_inodes_lock);
    /* Deallocate blocks if removed. */
    if (inode->removed) {
      free_map_release(inode->sector, 1);
      for (int i = 0; i < bytes_to_sectors(inode->data.length); ++i) {
        free_map_release(inode->data.sectors[i], 1);
      }
    }

    free(inode);
  } else {
    lock_release(&open_inodes_lock);
  }
}

/* Marks INODE to be deleted when it is closed by the last caller who
   has it open. */
void inode_remove(struct inode* inode) {
  ASSERT(inode != NULL);
  lock_acquire(&inode->lock);
  inode->removed = true;
  lock_release(&inode->lock);
}

/* Reads SIZE bytes from INODE into BUFFER, starting at position OFFSET.
   Returns the number of bytes actually read, which may be less
   than SIZE if an error occurs or end of file is reached. */
off_t inode_read_at(struct inode* inode, void* buffer_, off_t size, off_t offset) {
  uint8_t* buffer = buffer_;
  off_t bytes_read = 0;

  lock_acquire(&inode->lock);

  while (size > 0) {
    /* Disk sector to read, starting byte offset within sector. */
    block_sector_t sector_idx = byte_to_sector(inode, offset);
    int sector_ofs = offset % BLOCK_SECTOR_SIZE;

    /* Bytes left in inode, bytes left in sector, lesser of the two. */
    off_t inode_left = inode->data.length - offset;
    int sector_left = BLOCK_SECTOR_SIZE - sector_ofs;
    int min_left = inode_left < sector_left ? inode_left : sector_left;

    /* Number of bytes to actually copy out of this sector. */
    int chunk_size = size < min_left ? size : min_left;
    if (chunk_size <= 0)
      break;

    buffer_read(fs_device, sector_idx, buffer + bytes_read, chunk_size, sector_ofs);

    /* Advance. */
    size -= chunk_size;
    offset += chunk_size;
    bytes_read += chunk_size;
  }

  lock_release(&inode->lock);
  return bytes_read;
}

/* Writes SIZE bytes from BUFFER into INODE, starting at OFFSET.
   Returns the number of bytes actually written, which may be
   less than SIZE if end of file is reached or an error occurs.
   (Normally a write at end of file would extend the inode, but
   growth is not yet implemented.) */
off_t inode_write_at(struct inode* inode, const void* buffer_, off_t size, off_t offset) {
  const uint8_t* buffer = buffer_;
  off_t bytes_written = 0;

  lock_acquire(&inode->lock);

  if (inode->deny_write_cnt) {
    lock_release(&inode->lock);
    return 0;
  }

  while (size > 0) {
    /* Sector to write, starting byte offset within sector. */
    block_sector_t sector_idx = byte_to_sector(inode, offset);
    int sector_ofs = offset % BLOCK_SECTOR_SIZE;

    /* Bytes left in inode, bytes left in sector, lesser of the two. */
    off_t inode_left = inode->data.length - offset;
    int sector_left = BLOCK_SECTOR_SIZE - sector_ofs;
    int min_left = inode_left < sector_left ? inode_left : sector_left;

    /* Number of bytes to actually write into this sector. */
    int chunk_size = size < min_left ? size : min_left;
    if (chunk_size <= 0)
      break;

    buffer_write(fs_device, sector_idx, buffer + bytes_written, chunk_size, sector_ofs);

    /* Advance. */
    size -= chunk_size;
    offset += chunk_size;
    bytes_written += chunk_size;
  }
  // free(bounce);

  lock_release(&inode->lock);
  return bytes_written;
}

/* Disables writes to INODE.
   May be called at most once per inode opener. */
void inode_deny_write(struct inode* inode) {
  lock_acquire(&inode->lock);
  inode->deny_write_cnt++;
  ASSERT(inode->deny_write_cnt <= inode->open_cnt);
  lock_release(&inode->lock);
}

/* Re-enables writes to INODE.
   Must be called once by each inode opener who has called
   inode_deny_write() on the inode, before closing the inode. */
void inode_allow_write(struct inode* inode) {
  lock_acquire(&inode->lock);
  ASSERT(inode->deny_write_cnt > 0);
  ASSERT(inode->deny_write_cnt <= inode->open_cnt);
  inode->deny_write_cnt--;
  lock_release(&inode->lock);
}

/* Returns the length, in bytes, of INODE's data. */
off_t inode_length(const struct inode* inode) {
  lock_acquire(&((struct inode*)inode)->lock);
  off_t length = inode->data.length;
  lock_release(&((struct inode*)inode)->lock);
  return length;
}
