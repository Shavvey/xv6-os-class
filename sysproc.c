#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return proc->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
// the actual implementation 
// (defintions are provided in defs.h and user.h, 
// to provide an interface for the user)
int sys_set_priority(void) {
  int pid;
  int priority;
  if(argint(0, &pid) < 0) {
    // sys call fails if args are not passed
    return -1;
  }
  if(argint(1, &priority) < 0) {
    // sys call fails also if second arg not passed
    return -1;
  } 
  // preform syscall routine with args
  return set_priority(pid,priority);
}

int sys_get_priority(void) {
  int pid;
  if(argint(0,&pid) < 0) {
    // sys call will fail if args aren't passed or can't be retrieved
    return -1;
  }
  return get_priority(pid);
}

int sys_cps(void) {
  return cps();
}


 int sys_thread_create(void) {
    void (*fn)(void *);
    void *stack;
    void *arg;

    // Fetch arguments from user space
    if (argint(0, (int *)&fn) < 0 || argint(1, (int *)&stack) < 0 || argint(2, (int *)&arg) < 0) {
        return -1; // Argument fetch failure
    }

    // Call the kernel function to create the thread
    return thread_create(fn, stack, arg);
}

int sys_thread_exit(void) {
    // Call the kernel function to exit the thread
    thread_exit(); // This function should handle the thread termination logic.
    return 0;      // This line is never reached because thread_exit does not return.
}

int sys_thread_join(void) {
    int thread_id;

    // Fetch the thread ID argument from user space
    if (argint(0, &thread_id) < 0) {
        return -1; // Argument fetch failure
    }

    // Call the kernel function to join the specified thread
    return thread_join();
}
