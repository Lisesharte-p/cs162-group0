#include "userprog/syscall.h"
#include <stdio.h>
#include <syscall-nr.h>
#include "threads/interrupt.h"
#include "threads/thread.h"
#include "userprog/process.h"
#include "devices/shutdown.h"
#include "threads/vaddr.h"

static void syscall_handler(struct intr_frame*);
struct list_elem* list_find_file(struct list* list_, int fd);
void remove_file(struct list* list_, int fd);
// void add_file_descriptor(struct list* list_, struct file* file_, int fd);
void syscall_init(void) { intr_register_int(0x30, 3, INTR_ON, syscall_handler, "syscall"); }

static void syscall_handler(struct intr_frame* f UNUSED) {
  uint32_t* args = ((uint32_t*)f->esp);
  if (!is_user_vaddr(args[1])) {
    thread_current()->pcb->exit_code = -1;
    process_exit();
  }
  /*
   * The following print statement, if uncommented, will print out the syscall
   * number whenever a process enters a system call. You might find it useful
   * when debugging. It will cause tests to fail, however, so you should not
   * include it in your final submission.
   */

  /* printf("System call number: %d\n", args[0]); */

  if (args[0] == SYS_EXIT) {

    f->eax = args[1];
    // printf("%s: exit(%d)\n", thread_current()->pcb->process_name, args[1]);
    thread_current()->pcb->exit_code = args[1];
    process_exit();
  }
  if (args[0] == SYS_PRACTICE) {
    f->eax = -args[1] + 1;
  }
  if (args[0] == SYS_HALT) {
    shutdown_configure(SHUTDOWN_POWER_OFF);
    shutdown();
  }
  if (args[0] == SYS_EXEC) {
    // printf("%p\n", args[1]);
    pid_t pid = exec_(args[1]);
    f->eax = pid;
  }
  if (args[0] == SYS_WAIT) {
  }
  if (args[0] == SYS_FORK) {
  }
  if (args[0] == SYS_WRITE) {
    if (args[1] == STDOUT_FILENO) {
      putbuf((const void*)args[2], args[3]);
      f->eax = args[3];
      return;
    }
    struct list* list_ = &thread_current()->pcb->fd_list;

    struct file_descriptors* file_node =
        list_entry(list_find_file(list_, args[1]), struct file_descriptors, elem);

    int off = file_write(file_node->file_descriptor, args[2], args[3]);
  }
  if (args[0] == SYS_OPEN) {
  }
  if (args[0] == SYS_CLOSE) {
  }
  if (args[0] == SYS_READ) {
    if (args[1] == STDIN_FILENO) {
      uint8_t* buf = (uint8_t*)args[2];
      for (unsigned i = 0; i < args[3]; i++) {
        buf[i] = input_getc();
      }
      f->eax = args[3];
    }
  }
}

pid_t exec_(const char* cmd_line) {

  if (cmd_line >= PHYS_BASE) {
    return -1;
  }
  struct semaphore sync_sig; //on stack
  sema_init(&sync_sig, 0);
  struct sema_file_bundle* bundle = malloc(sizeof(struct sema_file_bundle));
  bundle->success = 1;
  bundle->sema = &sync_sig;
  bundle->file_name = palloc_get_page(0);
  strlcpy(bundle->file_name, cmd_line, strlen(cmd_line) + 1);
  pid_t new_process_pid = thread_create(cmd_line, PRI_DEFAULT, start_process, (void*)bundle);

  sema_down(&sync_sig);
  if (!bundle->success) {
    return -1;
  }

  return new_process_pid;
}

pid_t fork_(struct intr_frame* f) {}

void add_file_descriptor(struct list* list_, struct file* file_, int fd) {
  struct file_descriptors* new_fd_node = malloc(sizeof(struct file_descriptors));
  new_fd_node->file_descriptor = file_;
  new_fd_node->fd = fd;
  list_push_back(list_, &new_fd_node->elem);
}

void remove_file(struct list* list_, int fd) {
  struct list_elem* elem = list_find_file(list_, fd);
  struct file_descriptors* node = list_entry(elem, struct file_descriptors, elem);
  if (!node) {
    return;
  }
  list_remove(&node->elem);
  file_close(node->file_descriptor);
  free(node);
}

struct list_elem* list_find_file(struct list* list_, int fd) {
  struct list_elem* head = list_begin(list_);
  struct list_elem* tail = list_end(list_);
  while (head != tail) {
    struct file_descriptors* now_node = list_entry(head, struct file_descriptors, elem);
    if (now_node->fd == fd) {
      return head;
    }
    head = list_next(head);
  }
  return NULL;
}