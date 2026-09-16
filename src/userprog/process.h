#ifndef USERPROG_PROCESS_H
#define USERPROG_PROCESS_H

#include "threads/thread.h"
#include <stdint.h>

// At most 8MB can be allocated to the stack
// These defines will be used in Project 2: Multithreading
#define MAX_STACK_PAGES (1 << 11)

/* VGA 线性帧缓冲映射到用户地址空间的位置(内核在 load 时映射,
   doom 等用户程序直接往这里写像素)。 */
#define USER_LFB_VA ((void*)0x30000000)

/* 把 VGA 线性帧缓冲映射进进程页表(用户可写),fork 子进程也要调。 */
void map_lfb_user(uint32_t* pd);

/* PIDs and TIDs are the same type. PID should be
   the TID of the main thread of the process */
typedef tid_t pid_t;

/* Thread functions (Project 2: Multithreading) */
typedef void (*pthread_fun)(void*);
typedef void (*stub_fun)(pthread_fun, void*);

static unsigned long pid_bitmap_buf[32];
static struct bitmap* pid_bitmap;
/* The process control block for a given process. Since
   there can be multiple threads per process, we need a separate
   PCB from the TCB. All TCBs in a process will have a pointer
   to the PCB, and the PCB will have a pointer to the main thread
   of the process, which is `special`. */
struct process {
  /* Owned by process.c. */
  uint32_t* pagedir;          /* Page directory. */
  char process_name[16];      /* Name of the main thread */
  struct thread* main_thread; /* Pointer to main thread */
  struct list fd_list;
  struct list thread_list;
  struct list sema_list;
  struct list lock_list;
  int next_fd;
  int next_sid;
  int next_lid;
  struct semaphore sema_exit;
  tid_t parent_pid;
  int exit_code;
  pid_t main_pid;
  int next_thread_num;
  unsigned long thread_id_bitmap_buf[32];
  struct bitmap* thread_id_bitmap;
  block_sector_t cwd_sector;


};

struct file_descriptors {
  struct list_elem elem;
  struct file* file_descriptor;
  struct dir* dir;
  int fd;
};
struct sema_descriptor {
  struct list_elem elem;
  int sid;
  struct semaphore sema;
};
struct lock_descriptor {
  struct list_elem elem;
  int lid;
  struct lock lock;
};
struct process_start_bundle {
  char* file_name;
  struct semaphore* sema;
  bool success;
  tid_t parent_tid;
  pid_t child_pid;

  block_sector_t cwd_sector;
};
struct fork_bundle {
  struct semaphore fork_sema;
  struct process* child_pcb;
  struct intr_frame* child_state;
  uint32_t* pd;
  struct list* fd_list;
  bool success;
  pid_t child_pid;
  pid_t parent_pid;
};
struct pthread_bundle {
  struct process* process_;
  stub_fun sf;
  pthread_fun pf;
  void* args;
  struct semaphore pt_start_sema;
  int id;
};
void userprog_init(void);
struct process* get_process(pid_t pid);
pid_t process_execute(const char* file_name);
void start_process(void* file_name_);
int process_wait(pid_t);
void process_exit(void);
void process_activate(void);
void id_recycle(tid_t tid, struct process* p);
bool is_main_thread(struct thread*, struct process*);
void file_close_list(struct list* file_list);
pid_t get_pid(struct process*);
int fork_start(void* bundle);
tid_t pthread_execute(stub_fun, pthread_fun, void*);
tid_t pthread_join(tid_t);
void pthread_exit(void);
void pthread_exit_main(void);
struct thread* get_thread_in_process(tid_t tid, struct process* p);
void sema_close_list(struct list*);
void lock_close_list(struct list*);
bool extend_stack(void* fault_addr);
bool add_file_descriptor(struct list* list_, struct file* file_, int fd,bool is_dir);
#endif /* userprog/process.h */
