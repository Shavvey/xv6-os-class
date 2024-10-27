#include "types.h"
// define a mutex
// this lock uses a binary variable
// as an primitive to implement the mutex lock

struct lock_t {
  // lock, using a binary var as a atomic operation
  uint lock;
};

int lock_acquire(struct lock_t *);
int lock_init(struct lock_t *);
int lock_release(struct lock_t *);

