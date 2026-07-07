# Pintos P1 User Programs 文档

> 本文档包含 Git Commit Message 框架与设计文档框架，具体内容待填充。

---

## 一、Git Commit Message 框架

请按以下功能模块分点撰写 commit message。每个模块下可按 **新增 / 修复 / 重构** 等子类进一步拆分。

### 1. Fork 的进程同步
- （简述 fork 系统调用的实现，父子进程如何通过 semaphore 同步）
- （子进程启动完成后如何通知父进程继续执行）
- （错误处理路径，如子进程加载失败时如何返回 TID_ERROR）

### 2. 文件系统的锁
- （inode 层全局锁 `inode_lock` 的引入与保护范围）
- （`inode_open`、`inode_close`、`inode_reopen`、`inode_remove`、`inode_read_at`、`inode_write_at` 的同步修改）
- （`file` 结构体引用计数 `ref_cnt` 的设计，`file_reopen` 与 `file_close` 的改动）
- （文件写保护 `deny_write` 与可执行文件保护机制）

### 3. Fork 的内存页复制
- （父进程页表复制到子进程的实现）
- （`pagedir_set_page` 增加 `is_cow` 参数的设计意图）
- （Copy-On-Write 标记与页错误处理中的相关逻辑）
- （实际物理页映射与页目录复制的具体流程）

### 4. PID 的回收机制
- （bitmap 替换递增计数器 `next_tid` 的 tid 分配策略）
- (`tid_bitmap` 的初始化、分配 `allocate_tid` 与回收 `tid_recycle`)
- (`MAX_THREADS` 上限与 `TID_ERROR` 的返回处理)
- (进程等待结束后的 `pid_pcb` 清理与 tid 回收时机)

### 5. Wait 的同步
- (`process_wait` 中通过 `sema_exit` 阻塞等待子进程结束)
- (子进程 `process_exit` 时唤醒父进程的时机)
- (非法 pid、非子进程等边界条件的返回值处理)

### 6. 系统调用完整实现与参数验证
- (`validate` 用户指针验证机制)
- (`SYS_EXIT` / `SYS_PRACTICE` / `SYS_HALT` 的修改与完善)
- (`SYS_EXEC` 的实现与进程加载同步)
- (`SYS_FORK` 封装与中断帧传递)
- (`SYS_WAIT` 封装)
- (`SYS_READ` / `SYS_WRITE` 的文件描述符查找与缓冲区处理)
- (`SYS_OPEN` / `SYS_CLOSE` / `SYS_FILESIZE` / `SYS_CREATE` / `SYS_REMOVE` / `SYS_SEEK` / `SYS_TELL`)

### 7. 文件描述符管理
- (`fd_list` 链表维护打开的文件)
- (`next_fd` 递增分配策略)
- (进程退出时 `file_close_list` 批量关闭并释放资源)
- (标准输入输出 `STDIN_FILENO` / `STDOUT_FILENO` 的特殊处理)

### 8. 进程启动与参数传递
- (`start_process` 中的 ELF 加载与栈构造)
- (命令行参数的两次遍历与压栈策略)
- (16 字节栈对齐的实现)
- (伪返回地址与 `argv` 指针数组的布局)

### 9. 异常处理与进程终止
- (页错误 `page_fault` 中用户态非法访问的检测与进程终止)
- (`kill` 中异常退出码设置为 `-1`)
- (`process_exit` 中打印退出信息、释放 PCB、关闭文件、清理页目录)

### 10. 测试适配与 Bug 修复
- (各测试用例 `fork-fd`、`fork-nested`、`fork-offset` 等的适配修改)
- (内存分配失败路径的防护，`malloc` / `palloc_get_page` 返回 NULL 的处理)
- (竞争条件修复，如 `process_execute` 中 `bundle` 与 `fn_copy` 的释放)

---

## 二、设计文档框架

### 设计

#### 1. 函数功能
- 列出所有新增或修改的关键函数，说明其输入、输出及职责边界
- 明确每个函数在系统调用 / 进程管理 / 文件系统中的定位

#### 2. 同步机制
- 描述使用的同步原语（semaphore、lock、bitmap 等）
- 说明各原语保护的数据结构与临界区范围
- 解释避免死锁与竞态条件的策略

#### 3. 具体算法
- 进程创建（`exec`、`fork`）的完整流程图或步骤描述
- 页表复制的算法（遍历页目录、复制页表项、映射物理页）
- 文件描述符分配与查找算法
- PID 分配与回收算法（bitmap 扫描与翻转）
- 栈构造算法（参数解析、对齐、压栈顺序）

#### 4. 设计原因
- 解释为何选择 semaphore 而非 lock 进行 fork/exec 同步
- 解释为何引入 `inode_lock` 而非更细粒度的锁
- 解释 `ref_cnt` 与 `file_reopen` 的设计动机
- 解释 bitmap 替代递增计数器的原因
- 解释栈对齐 16 字节的必要性

### 思考

#### 1. 设计的理由
- 面对 P1 需求时，各项设计决策背后的核心考量
- 如何在 Pintos 原有架构上最小侵入地扩展功能
- 对内核态与用户态交互边界的思考

#### 2. 这样设计的优缺点
- **优点**：简洁性、正确性保证、性能影响、可维护性
- **缺点**：潜在瓶颈（如全局 `inode_lock`）、功能局限（如 COW 未完全实现）、资源上限（`MAX_THREADS`）
- 与其他可能方案的对比（如更细粒度锁、完全 COW、不同 tid 分配策略）

#### 3. 过程
- 实现顺序与迭代过程（从基础 syscall 到 fork 同步，再到文件锁与 pid 回收）
- 遇到的主要障碍与调试经历
- 测试用例驱动的修改过程
- 最终代码与最初设想的差异及原因

---
