#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

struct proc *myproc(void)
{
  struct cpu *c;
  pushcli();
  // disable interrupts
  c = &cpus[cpunum()];
  // renable interrupts again
  popcli();
  return c->proc;
}

struct
{
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

// PAGEBREAK: 32
//  Look in the process table for an UNUSED proc.
//  If found, change state to EMBRYO and initialize
//  state required to run in the kernel.
//  Otherwise return 0.
static struct proc *
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  // assign default priority to process
  p->state = EMBRYO;
  p->pid = nextpid++;
  p->priority = DEFAULT_PRIOR;

  release(&ptable.lock);

  // Allocate kernel stack.
  if ((p->kstack = kalloc()) == 0)
  {
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe *)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}

// PAGEBREAK: 32
//  Set up first user process.
void userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();

  initproc = p;
  if ((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0; // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n)
{
  uint sz;

  sz = proc->sz;
  if (n > 0)
  {
    if ((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  else if (n < 0)
  {
    if ((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int fork(void)
{
  int i, pid;
  struct proc *np;

  // Allocate process.
  if ((np = allocproc()) == 0)
  {
    return -1;
  }

  // Copy process state from p.
  if ((np->pgdir = (pde_t*) copyuvm_cow(proc->pgdir, proc->sz)) == 0)
  {
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  // NOTE: this was done for lab2, which specifies to modify the priority
  // value to have a default of 20
  np->priority = DEFAULT_PRIOR;
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;
  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for (i = 0; i < NOFILE; i++)
    if (proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);

  safestrcpy(np->name, proc->name, sizeof(proc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(void)
{
  struct proc *p;
  int fd;

  if (proc == initproc)
    panic("init exiting");

  // Close all open files.
  for (fd = 0; fd < NOFILE; fd++)
  {
    if (proc->ofile[fd])
    {
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(proc->cwd);
  end_op();
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->parent == proc)
    {
      p->parent = initproc;
      if (p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int wait(void)
{
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
  for (;;)
  {
    // Scan through table looking for exited children.
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    {
      if (p->parent != proc)
        continue;
      havekids = 1;
      if (p->state == ZOMBIE)
      {
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if (!havekids || proc->killed)
    {
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock); // DOC: wait-sleep
  }
}

// PAGEBREAK: 42
//  Per-CPU process scheduler.
//  Each CPU calls scheduler() after setting itself up.
//  Scheduler never returns.  It loops, doing:
//   - choose a process to run
//   - swtch to start running that process
//   - eventually that process transfers control
//       via swtch back to the scheduler.
void round_robin(void)
{
  acquire(&ptable.lock);
  struct proc *p;
  // loop over the proceses table and find somehting that is runnable
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->state != RUNNABLE)
      continue;

    // Switch to chosen process.  It is the process's job
    // to release ptable.lock and then reacquire it
    // before jumping back to us.
    proc = p;
    switchuvm(p);
    p->state = RUNNING;
    swtch(&cpu->scheduler, p->context);
    switchkvm();

    // Process is done running for now.
    // It should have changed its p->state before coming back.
    proc = 0;
  }
  release(&ptable.lock);
}

void priority(void)
{
  acquire(&ptable.lock);
  struct proc *p;  // process picked via round_robin
  struct proc *hp; // high priority process (might be prioritized if runnable)
  // first part is just like round robin
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->state != RUNNABLE)
      continue;
    // now try to find a high priority process than the runnable process we just pick
    // if so, schedule that process instead, neglecting/starving the lower priority process
    for (hp = ptable.proc; hp < &ptable.proc[NPROC]; hp++)
    {
      if (hp->priority < p->priority && hp->state == RUNNABLE)
      {
        p = hp;
      }
    }
    proc = p;
    // preform the context switch, load user virtual mem
    switchuvm(p);
    p->state = RUNNING;
    swtch(&cpu->scheduler, p->context);
    // switch back to kernel mode, load kernel virtual mem
    switchkvm();
    // Process is done running for now.
    // It should have changed its p->state before coming back.
    proc = 0;
  }
  release(&ptable.lock);
}

void scheduler(void)
{
  for (;;)
  {
    // Enable interrupts on this processor.
    sti();
    priority();
  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void sched(void)
{
  int intena;

  if (!holding(&ptable.lock))
    panic("sched ptable.lock");
  if (cpu->ncli != 1)
    panic("sched locks");
  if (proc->state == RUNNING)
    panic("sched running");
  if (readeflags() & FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
}

// Give up the CPU for one scheduling round.
void yield(void)
{
  acquire(&ptable.lock); // DOC: yieldlock
  proc->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first)
  {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
  if (proc == 0)
    panic("sleep");

  if (lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if (lk != &ptable.lock)
  {                        // DOC: sleeplock0
    acquire(&ptable.lock); // DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
  proc->state = SLEEPING;
  sched();

  // Tidy up.
  proc->chan = 0;

  // Reacquire original lock.
  if (lk != &ptable.lock)
  { // DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

// PAGEBREAK!
//  Wake up all processes sleeping on chan.
//  The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->pid == pid)
    {
      p->killed = 1;
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

// PAGEBREAK: 36
//  Print a process listing to console.  For debugging.
//  Runs when user types ^P on console.
//  No lock to avoid wedging a stuck machine further.
void procdump(void)
{
  static char *states[] = {
      [UNUSED] "unused",
      [EMBRYO] "embryo",
      [SLEEPING] "sleep ",
      [RUNNABLE] "runble",
      [RUNNING] "run   ",
      [ZOMBIE] "zombie"};
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if (p->state == SLEEPING)
    {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
      for (i = 0; i < 10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}

int set_priority(int pid, int priority)
{
  // pointer to process (need to use pid to actually obtain it)
  struct proc *proc;
  // acquire mutex lock for process table
  // since we modify information, we won't to make sure process info will not change
  // before we have set the our proceess priority
  acquire(&ptable.lock);

  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
  {
    // loop through ptable entries and find our process
    // using the pid given
    if (proc->pid == pid)
    {
      // use a mod to clamp values to range [0,39] for the priority
      priority = (priority % MAX_PRIOR + MAX_PRIOR) % MAX_PRIOR;
      // set the priority
      proc->priority = priority;
      // release the mutex lock on process table
      release(&ptable.lock);
      // exit out with a success val
      return 0;
    }
  }
  // if we can't find the process just return an error and release mutex
  release(&ptable.lock);
  return -1;
}

int get_priority(int pid)
{
  // pointer to process info
  struct proc *proc;
  acquire(&ptable.lock);
  // loop through process table until we find our process id
  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
  {
    // found our process!
    if (proc->pid == pid)
    {
      int priority = proc->priority;
      release(&ptable.lock);
      // return back the priority of the matched process
      return priority;
    }
  }
  release(&ptable.lock);
  // if we can't find the process by the pid, just return error val
  return -1;
}

int cps(void)
{
  struct proc *proc;
  // acquire to mutex of process table to avoid
  // concurrency issue with writers messing up reads
  acquire(&ptable.lock);
  // loop over the process table using pid
  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
  {
    if (proc->state == SLEEPING)
      cprintf("%s \t %d \t SLEEPING \t %d \n", proc->name, proc->pid, proc->priority);
    else if (proc->state == RUNNING)
      cprintf("%s \t %d \t RUNNING \t %d \n", proc->name, proc->pid, proc->priority);
    else if (proc->state == RUNNABLE)
      cprintf("%s \t %d \t RUNNABLE \t %d \n", proc->name, proc->pid, proc->priority);
  }
  // release the mutex
  release(&ptable.lock);
  return 0;
}

int thread_create(void (*fn)(void *), void *stack, void *arg)
{
  int i;
  struct proc *np;
  struct proc *curproc = myproc();

  // allocate the process
  if ((np = allocproc()) == 0)
    return -1;

  // make it so that the space is shared with the parent
  np->pgdir = curproc->pgdir;
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // create user stack
  np->ustack = stack;
  uint sp = (uint)stack + PGSIZE;

  // push argument onto the stack
  sp -= sizeof(arg);
  *(uint *)sp = (uint)arg;

  // push fake return address (0xFFFFFFFF, as given in lab)
  sp -= sizeof(uint);
  *(uint *)sp = 0xFFFFFFFF;

  // set up the trap for the new thread
  np->tf->eip = (uint)fn;
  np->tf->esp = sp;

  // mark this process as a thread.
  np->isthread = 1;

  // inherit parents attributes
  for (i = 0; i < NOFILE; i++)
    if (curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  acquire(&ptable.lock);
  np->state = RUNNABLE;
  release(&ptable.lock);

  return np->pid;
}

void thread_exit(void)
{
  struct proc *curproc = myproc();

  if (curproc == initproc)
    panic("init exiting");

  // close all open files
  int fd;
  for (fd = 0; fd < NOFILE; fd++)
  {
    if (curproc->ofile[fd])
    {
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  // release current directory
  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Wake up the parent thread if the thread is complete
  wakeup1(curproc->parent);

  // mark process as ZOMBIE and schedule more
  curproc->state = ZOMBIE;

  // jump into the scheduler, and don't return
  sched();
  panic("zombie exit");
}

int thread_join(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();

  acquire(&ptable.lock);
  for (;;)
  {
    // look for ZOMBIE thread
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    {
      if (p->parent != curproc || !p->isthread)
        continue;
      havekids = 1;
      if (p->state == ZOMBIE)
      {
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // wait only if childs exists
    if (!havekids || curproc->killed)
    {
      release(&ptable.lock);
      return -1;
    }

    // wait for children to exit.
    sleep(curproc, &ptable.lock);
  }
}
