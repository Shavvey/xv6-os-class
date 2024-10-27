#include "mutex.h"
#include "user.h"
#include "param.h"
#include "x86.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
               "+m" (*lock), "=a" (result) :
               "1" (1) :
               "cc");
  // the xchg function swaps the values of two variables
  // this primitive operation serves as the locking mechanism
  return result;
}

int lock_init(struct lock_t *lk) { 
  // initialize the lock
  if (lk) {
    lk->lock = 0;
    return 1;
  } else {
    // just return an error, if lock ref is null
    return -1; 
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
    // use sleep to yield to the scheduler
    sleep(1);
  }
  // prevent any interrupts from occuring--which would create a deadlock
  return 1;
}

int lock_release(struct lock_t *lk) {
  // release lock by setting binary val to zero
  lk->lock = 0;
  return 1;
}
