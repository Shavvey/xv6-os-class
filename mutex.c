#include "types.h"
#include "mutex.h"
#include "user.h"
#include "param.h"
#include "x86.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"


int __set_and_test(uint* lock) {
  uint val = *lock; // test for lock val by dereffing pointer
  *lock = 1; // set lock to true
  return val;
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
  while (__set_and_test(&lk->lock)) {
    // use sleep to yield to the scheduler
    sleep(5);
  }
  cli();
  // prevent any interrupts from occuring--which would create a deadlock
  return 1;
}

int lock_release(struct lock_t *lk) {
  // release lock by setting binary val to zero
  lk->lock = 0;
  return 1;
}
