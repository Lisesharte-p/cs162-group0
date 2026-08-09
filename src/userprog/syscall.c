#include "userprog/syscall.h"
#include <stdio.h>
#include <syscall-nr.h>
#include "threads/interrupt.h"
#include "threads/thread.h"
#include "userprog/process.h"
#include "userprog/pagedir.h"
#include "devices/input.h"
#include "devices/kbd.h"
#include "devices/shutdown.h"
#include "devices/timer.h"
#include "devices/vga.h"
#include "filesys/file.h"
#include "filesys/filesys.h"
#include "lib/string.h"
#include "threads/malloc.h"
#include "threads/vaddr.h"
#include "threads/pte.h"
#include "threads/palloc.h"
static void syscall_handler(struct intr_frame*);
struct list_elem* list_find_file(struct list* list_, int fd);
void remove_file(struct list* list_, int fd);
bool add_file_descriptor(struct list* list_, struct file* file_, int fd);
static struct sema_descriptor* find_sema(int sid, struct process* pcb);
static struct lock_descriptor* find_lock(int lid, struct process* pcb);
void validate(uint32_t* args, int n);
void exit_on_err(void);
pid_t exec_(const char* cmd_line);
int wait_(pid_t pid);
int fork_(struct intr_frame* f);
int close_file(struct list* list_, int fd);
void syscall_init(void) { intr_register_int(0x30, 3, INTR_ON, syscall_handler, "syscall"); }

static void syscall_handler(struct intr_frame* f UNUSED) {
  uint32_t* args = ((uint32_t*)f->esp);

  /*
   * The following print statement, if uncommented, will print out the syscall
   * number whenever a process enters a system call. You might find it useful
   * when debugging. It will cause tests to fail, however, so you should not
   * include it in your final submission.
   */

  /* printf("System call number: %d\n", args[0]); */

  if (args[0] == SYS_EXIT) {
    validate(args, 1);
    f->eax = args[1];
    // printf("%s: exit(%d)\n", thread_current()->pcb->process_name, args[1]);
    thread_current()->pcb->exit_code = args[1];
    process_exit();
  }

  if (args[0] == SYS_TIME_MS) {
    /* 自启动以来的毫秒数(timer 100Hz,每 tick 10ms)。 */
    f->eax = timer_ticks() * (1000 / TIMER_FREQ);
    return;
  }

  if (args[0] == SYS_KEY_POLL) {
    /* 非阻塞读原始 scancode(含 E0 前缀与 make/break 位),
       没有按键时返回 -1。 */
    uint16_t code;
    f->eax = kbd_try_read(&code) ? (int)code : -1;
    return;
  }

  if (args[0] == SYS_PRACTICE) {
    validate(args, 1);
    f->eax = args[1] + 1;
  }

  if (args[0] == SYS_HALT) {
    shutdown_configure(SHUTDOWN_POWER_OFF);
    shutdown();
  }

  if (args[0] == SYS_EXEC) {
    validate(args, 1);
    // printf("%p\n", args[1]);
    pid_t pid = exec_((const char*)args[1]);
    f->eax = pid;
  }

  if (args[0] == SYS_WAIT) {
    validate(args, 1);
    f->eax = wait_(args[1]);
    return;
  }

  if (args[0] == SYS_FORK) {

    f->eax = fork_(f);
    return;
  }

  if (args[0] == SYS_WRITE) {
    validate(args, 3);
    if (args[1] == STDOUT_FILENO) {
      putbuf((const void*)args[2], args[3]);
      f->eax = args[3];
      return;
    }
    f->eax = -1;
    struct list* list_ = &thread_current()->pcb->fd_list;
    struct list_elem* list_elem_ = list_find_file(list_, args[1]);
    if (!list_elem_) {

      return;
    }
    if (args[3] == 0) {
      f->eax = 0;
      return;
    }
    struct file_descriptors* file_node = list_entry(list_elem_, struct file_descriptors, elem);
    char* buf = malloc(
        sizeof(char) *
        args[3]); //additional buffer, avoid filesys dead lock when user passed invalid pointer.
    if (!buf) {
      f->eax = -1;
      return;
    }
    memcpy(buf, (void*)args[2], sizeof(char) * args[3]);
    int off = file_write(file_node->file_descriptor, buf, args[3]);

    f->eax = off;

    free(buf);
    return;
  }

  if (args[0] == SYS_OPEN) {
    validate(args, 1);
    if (args[1] == STDOUT_FILENO || args[1] == STDIN_FILENO) {
      f->eax = -1;
      return;
    }
    if (!args[1]) {
      exit_on_err();
    }
    char* file_name = palloc_get_page(0);
    if (!file_name) {
      f->eax = -1;
      return;
    }
    strlcpy(file_name, (const char*)args[1], strlen((const char*)args[1]) + 1);
    // printf("opening %s\n",file_name);
    struct file* file_new = filesys_open((char*)(file_name));
    if (!file_new) {
      // printf("open fail %s\n",file_name);
      palloc_free_page(file_name);
      f->eax = -1;
      return;
    }
    if (strcmp(file_name, thread_current()->pcb->process_name) == 0) {
      file_deny_write(file_new);
    }
    struct list* file_list = &thread_current()->pcb->fd_list;
    int new_fd = thread_current()->pcb->next_fd;
    thread_current()->pcb->next_fd += 1;
    bool success = add_file_descriptor(file_list, file_new, new_fd);
    // printf("open success %d\n",new_fd);
    f->eax = new_fd;
    palloc_free_page(file_name);
    if (!success) {
      file_close(file_new);
      f->eax = -1;
    }
    // printf("open\n");
    return;
  }

  if (args[0] == SYS_CLOSE) { //bug here
    validate(args, 1);
    struct list* file_list = &thread_current()->pcb->fd_list;
    close_file(file_list, args[1]);
    return;
  }

  if (args[0] == SYS_READ) {
    validate(args, 3);
    if (args[1] == STDIN_FILENO) {
      uint8_t* buf = (uint8_t*)args[2];
      for (unsigned i = 0; i < args[3]; i++) {
        buf[i] = input_getc();
      }
      f->eax = args[3];
      return;
    }
    struct list* list_ = &thread_current()->pcb->fd_list;
    struct list_elem* file_node = list_find_file(list_, args[1]);
    if (!file_node) {
      f->eax = -1;
      return;
    }
    struct file_descriptors* file_ptr = list_entry(file_node, struct file_descriptors, elem);
    if (!file_ptr || !args[2]) {
      f->eax = -1;
      return;
    }
    // printf("%u\n", args[2]);
    int off = file_read(file_ptr->file_descriptor, (const void*)args[2], args[3]);

    f->eax = off;
    return;
  }

  if (args[0] == SYS_FILESIZE) {
    struct list* list_ = &thread_current()->pcb->fd_list;
    struct list_elem* file_node = list_find_file(list_, args[1]);
    if (!file_node) {
      f->eax = -1;
      return;
    }
    struct file_descriptors* file_ptr = list_entry(file_node, struct file_descriptors, elem);

    int off = file_length(file_ptr->file_descriptor);

    f->eax = off;
    return;
  }

  if (args[0] == SYS_CREATE) {
    validate(args, 2);
    char* file_name = palloc_get_page(0);
    if (!file_name) {
      f->eax = -1;
      return;
    }
    if (!args[1]) {
      exit_on_err();
    }
    strlcpy(file_name, (const char*)args[1], strlen((const char*)args[1]) + 1);
    bool success = filesys_create(file_name, args[2]);
    f->eax = 1;
    palloc_free_page(file_name);
    if (!success) {
      f->eax = 0;
    }
    return;
  }

  if (args[0] == SYS_SEEK) { //should check the file lenth first.
    validate(args, 2);
    struct list_elem* node = list_find_file(&thread_current()->pcb->fd_list, args[1]);
    if (!node) {
      return;
    }
    struct file_descriptors* fd = list_entry(node, struct file_descriptors, elem);

    int file_len = file_length(fd->file_descriptor);
    if (file_len < args[2]) { //a work for p2.
      return;
    }

    file_seek(fd->file_descriptor, args[2]);
  }
  if (args[0] == SYS_TELL) {
    validate(args, 1);
    struct list_elem* node = list_find_file(&thread_current()->pcb->fd_list, args[1]);
    if (!node) {
      f->eax = -1;
      return;
    }
    struct file_descriptors* fd = list_entry(node, struct file_descriptors, elem);
    int now_pos = file_tell(fd->file_descriptor);

    f->eax = now_pos;
    return;
  }
  if (args[0] == SYS_LOCK_INIT) {
    validate(args, 1);
    if (!args[1]) {
      f->eax = 0;
      return;
    }
    struct lock_descriptor* ld = malloc(sizeof(struct lock_descriptor));
    if (!ld) {
      f->eax = 0;
      return;
    }
    lock_init(&ld->lock);
    ld->lid = thread_current()->pcb->next_lid++;
    list_push_back(&thread_current()->pcb->lock_list, &ld->elem);
    *(int*)args[1] = ld->lid;
    f->eax = 1;
    return;
  }
  if (args[0] ==
      SYS_LOCK_ACQUIRE) { //get lock, if the lock is held by another thread, donate priority.
    validate(args, 1);
    int lid = *(int*)args[1];
    struct lock_descriptor* ld = find_lock(lid, thread_current()->pcb);
    if (!ld) {
      f->eax = 0;
      return;
    }
    if (lock_held_by_current_thread(&ld->lock)) {
      thread_current()->pcb->exit_code = 1;
      process_exit();
      NOT_REACHED();
    }
    lock_acquire(&ld->lock); //might be blocked.
    f->eax = 1;
    return;
  }
  if (args[0] == SYS_LOCK_RELEASE) {
    validate(args, 1);
    int lid = *(int*)args[1];
    struct lock_descriptor* ld = find_lock(lid, thread_current()->pcb);
    if (!ld) {
      f->eax = 0;
      return;
    }
    if (!lock_held_by_current_thread(&ld->lock)) {
      f->eax = 0;
      return;
    }
    lock_release(&ld->lock);
    f->eax = 1;
    return;
  }
  if (args[0] == SYS_CHDIR) {
  }
  if (args[0] == SYS_GET_TID) {
    f->eax = thread_current()->tid;
  }
  if (args[0] == SYS_ISDIR) {
  }
  if (args[0] == SYS_MKDIR) {
  }
  if (args[0] == SYS_MMAP) {
  }
  if (args[0] == SYS_MUNMAP) {
  }
  if (args[0] == SYS_SEMA_DOWN) {
    validate(args, 1);
    int sid = *(int*)args[1];
    struct sema_descriptor* sd = find_sema(sid, thread_current()->pcb);
    if (!sd) {
      f->eax = 0;
      return;
    }
    sema_down(&sd->sema);
    f->eax = 1;
    return;
  }
  if (args[0] == SYS_SEMA_INIT) {
    validate(args, 1); //we only check the sema address.
    if ((int)args[2] < 0 || args[1] == NULL) {
      f->eax = 0;
      return;
    }
    struct sema_descriptor* sd = malloc(sizeof(struct sema_descriptor));
    if (!sd) {
      f->eax = 0;
      return;
    }
    sema_init(&sd->sema, args[2]);
    sd->sid = thread_current()->pcb->next_sid++;
    list_push_back(&thread_current()->pcb->sema_list, &sd->elem);
    *(int*)args[1] = sd->sid;
    f->eax = 1;
    return;
  }
  if (args[0] == SYS_SEMA_UP) {
    validate(args, 1);
    int sid = *(int*)args[1];
    struct sema_descriptor* sd = find_sema(sid, thread_current()->pcb);
    if (!sd) {
      f->eax = 0;
      return;
    }
    sema_up(&sd->sema);
    f->eax = 1;
    return;
  }
  if (args[0] == SYS_PT_CREATE) {
    validate(args, 3);
    f->eax = pthread_execute((stub_fun)args[1], (pthread_fun)args[2], (void*)args[3]);
    return;
  }
  if (args[0] == SYS_PT_EXIT) {
    pthread_exit();
  }
  if (args[0] == SYS_PT_JOIN) {
    validate(args, 1);
    f->eax = pthread_join(args[1]);
    return;
  }
  if (args[0] == SYS_READDIR) {
  }
  if (args[0] == SYS_REMOVE) {
  }
}

pid_t exec_(const char* cmd_line) {

  if (cmd_line >= PHYS_BASE || !cmd_line) {
    return -1;
  }
  struct semaphore sync_sig; //on stack
  sema_init(&sync_sig, 0);
  struct process_start_bundle* bundle = malloc(sizeof(struct process_start_bundle));
  if (!bundle) {
    return -1;
  }
  bundle->success = 1;
  bundle->sema = &sync_sig;
  bundle->file_name = palloc_get_page(0);
  if (!bundle->file_name) {
    free(bundle);
    return -1;
  }
  bundle->parent_tid = thread_current()->pcb->main_pid;
  strlcpy(bundle->file_name, cmd_line, strlen(cmd_line) + 1);
  thread_create(cmd_line, PRI_DEFAULT, start_process, (void*)bundle);

  sema_down(&sync_sig);
  bool success = bundle->success;
  pid_t child_pid = bundle->child_pid;
  palloc_free_page(bundle->file_name);
  free(bundle);
  if (!success) {
    return -1;
  }

  return child_pid;
}

bool add_file_descriptor(struct list* list_, struct file* file_, int fd) {
  struct file_descriptors* new_fd_node = malloc(sizeof(struct file_descriptors));
  if (!new_fd_node) {
    return false;
  }
  new_fd_node->file_descriptor = file_;
  new_fd_node->fd = fd;
  list_push_back(list_, &new_fd_node->elem);
  return true;
}

int close_file(struct list* list_, int fd) {
  struct list_elem* elem = list_find_file(list_, fd);
  if (!elem) { //already removed.
    return 1;
  }
  struct file_descriptors* node = list_entry(elem, struct file_descriptors, elem);
  if (!node) {
    return -1;
  }
  list_remove(&node->elem);
  file_close(node->file_descriptor);
  free(node);
  return 1;
}

static struct sema_descriptor* find_sema(int sid, struct process* pcb) {
  struct list_elem* head = list_begin(&pcb->sema_list);
  struct list_elem* tail = list_end(&pcb->sema_list);
  while (head != tail) {
    struct sema_descriptor* sd = list_entry(head, struct sema_descriptor, elem);
    if (sd->sid == sid)
      return sd;
    head = list_next(head);
  }
  return NULL;
}

static struct lock_descriptor* find_lock(int lid, struct process* pcb) {
  struct list_elem* head = list_begin(&pcb->lock_list);
  struct list_elem* tail = list_end(&pcb->lock_list);
  while (head != tail) {
    struct lock_descriptor* ld = list_entry(head, struct lock_descriptor, elem);
    if (ld->lid == lid)
      return ld;
    head = list_next(head);
  }
  return NULL;
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

int wait_(pid_t pid) { return process_wait(pid); }

bool fd_list_reopen(struct list* parent_list, struct list* child_list) {
  list_init(child_list);
  struct list_elem* head = list_begin(parent_list);
  struct list_elem* tail = list_end(parent_list);
  while (head != tail) {
    struct file_descriptors* file_ptr = list_entry(head, struct file_descriptors, elem);
    if (!file_ptr) {

      return false;
    }

    struct file_descriptors* list_node = malloc(sizeof(struct file_descriptors));
    if (!list_node) {
      return false;
    }
    list_node->fd = file_ptr->fd;

    list_node->file_descriptor = file_reopen(file_ptr->file_descriptor);
    // list_node->file_descriptor = file_ptr->file_descriptor;
    // list_node->file_descriptor->ref_cnt++;
    // inode_reopen(list_node->file_descriptor->inode);
    if (!list_node->file_descriptor) {
      free(list_node);
      return false;
    }
    list_push_back(child_list, &list_node->elem);
    head = list_next(head);
  }
  return true;
}

int fork_(struct intr_frame* f) { //reopen files, copy pagedir and set to COW
  struct intr_frame* child_f = malloc(sizeof(struct intr_frame));
  if (!child_f) {
    return -1;
  }
  memcpy(child_f, f, sizeof(struct intr_frame));
  child_f->eax = 0;
  struct process* child_pcb = malloc(sizeof(struct process));
  if (!child_pcb) {
    free(child_f);
    return -1;
  }
  struct fork_bundle* bundle = malloc(sizeof(struct fork_bundle));
  if (!bundle) {
    free(child_f);
    free(child_pcb);
    return -1;
  }
  uint32_t* pd_parent = thread_current()->pcb->pagedir;
  uint32_t* pd_child = pagedir_create();
  if (!pd_child) {
    free(bundle);
    free(child_f);
    free(child_pcb);
    return -1;
  }
  bundle->pd = pd_child;
  bundle->child_state = child_f;
  bundle->child_pcb = child_pcb;
  // bundle->fd_list = &thread_current()->pcb->fd_list;
  bundle->success = false;
  memcpy(child_pcb, thread_current()->pcb, sizeof(struct process));
  child_pcb->parent_pid = thread_current()->tid;
  child_pcb->pagedir = pd_child;

  bool fd_list_copy = fd_list_reopen(&thread_current()->pcb->fd_list, &child_pcb->fd_list);

  if (!fd_list_copy) {
    file_close_list(&child_pcb->fd_list);
    pagedir_destroy(pd_child);
    free(bundle);
    free(child_f);
    free(child_pcb);
    return -1;
  }

  sema_init(&child_pcb->sema_exit, 0);
  /*copy pagedir and set flag*/
  for (uint32_t j = 0, i; i = pd_parent[j], j < pd_no(PHYS_BASE); j++) {

    if (!(i & PTE_P)) { //not present
      continue;
    }
    uint32_t* pt = pde_get_pt(i);

    for (uint32_t m = 0; m < PGSIZE / sizeof(uint32_t); ++m) {

      if (!(pt[m] & PTE_P)) {
        continue;
      }
      void* upage = (void*)((j << PDSHIFT) | (m << PTSHIFT));
      /* LFB 页不是进程内存(物理地址不在 RAM,pte_get_page 的 ptov
         会断言 PANIC),不能拷贝;子进程在循环结束后重新映射一份。
         必须先判断再取页,否则 pte_get_page 就先炸了。 */
      if (upage >= USER_LFB_VA && upage < USER_LFB_VA + VGA_LFB_XRES * VGA_LFB_YRES * 4)
        continue;
      uint32_t* page_base = pte_get_page(pt[m]);
      uint32_t* new_page = palloc_get_page(PAL_USER);
      if (!new_page) { //should free all pages allocated.
        file_close_list(&child_pcb->fd_list);
        pagedir_destroy(pd_child);
        free(bundle);
        free(child_f);
        free(child_pcb);
        return -1;
      }
      memcpy(new_page, page_base, PGSIZE);
      pagedir_set_page(pd_child, upage, new_page, true, false);
    }
  }

  /* 与父进程一致,子进程也映射一份 LFB。 */
  map_lfb_user(pd_child);

  list_init(&child_pcb->lock_list);
  list_init(&child_pcb->sema_list);

  sema_init(&bundle->fork_sema, 0);
  bundle->parent_pid = thread_current()->pcb->main_pid;
  pid_t child_pid = thread_create(thread_current()->name, PRI_DEFAULT, (thread_func*)fork_start, (void*)bundle);

  sema_down(&bundle->fork_sema);

  if (!bundle->success) {
    child_pid = -1;
  }
  free(bundle->child_state);
  int res = bundle->child_pid;
  free(bundle);
  // process_wait(res);
  return res;
}

void validate(uint32_t* args, int n) {
  for (int i = 1; i <= n; ++i) {
    if (!is_user_vaddr((const void*)args[i])) { //validate the passed pointers
      exit_on_err();
    }
  }
}
void exit_on_err() {
  thread_current()->pcb->exit_code = -1;
  process_exit();
}
