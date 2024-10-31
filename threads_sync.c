#include "mutex.h"
#include "types.h"
#include "stat.h"
#include "user.h"

struct balance {
    char name[32];
    int amount;
};
struct total_balance {
  int balance;
  struct lock_t lock;
};

struct total_balance total;

volatile unsigned int delay (unsigned int d) {
   unsigned int i; 
   for (i = 0; i < d; i++) {
       __asm volatile( "nop" ::: );
   }
   return i;   
}
void do_work(void *arg){
    int i; 
    int old;
    struct balance *b = (struct balance*) arg; 
    printf(1, "Starting do_work: s:%s\n", b->name);

    for (i = 0; i < b->amount; i++) { 
         lock_acquire(&total.lock);
         old = total.balance;
         delay(100000);
         total.balance = old + 1;
         lock_release(&total.lock);
    }
    printf(1, "Done s:%x\n", b->name);
    thread_exit();
   return;
}

int main(int argc, char *argv[]) {
  // initialize lock and zero out balance
  total.balance = 0;
  if(lock_init(&total.lock) < 0) {
    printf(2,"Could not intialize mutex!");
    exit();
  }
  struct balance b1 = {"b1", 3200};
  struct balance b2 = {"b2", 2800};
  void *s1, *s2;
  int t1, t2, r1, r2;
  s1 = malloc(4096);
  s2 = malloc(4096);
  t1 = thread_create(do_work, s1, (void*)&b1);
  t2 = thread_create(do_work, s2, (void*)&b2); 
  r1 = thread_join();
  r2 = thread_join();
  printf(1, "Threads finished: (%d):%d, (%d):%d, shared balance:%d\n", 
      t1, r1, t2, r2, total.balance);
  exit();
}
