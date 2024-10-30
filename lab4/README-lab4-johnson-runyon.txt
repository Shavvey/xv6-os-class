Write down a few words of explanation of each file you had to modify/create for the two tasks

# Part 1: Threads
To implement kernel-level threads requires a modification of the same
files needed to implement any syscall: defs.h, syscall.c, syscall.h, 
proc.c, user.h, an dusys.S 

However, proc.c is substantially modified since it ultimately
provided the implementation for thread management syscalls.

proc.c provides for the implementation for thread
creation and manipulation, these functions are pulled
from the POSIX api:
thread_create, thread_exit, and thread_join.

#Part 2: Mutex
For the mutex lock, we opted to create seperate files mutex.c and mutex.h
to implement the basic mutex lock funcitonality. The makefile
also requires a modification to compile the object file
and link it with user programs.

mutex.c: includes implementaton of three functions
needed for the mutual exclusion lock: lock_init,
lock_acquire, and lock_release

mutex.h: header file includes function declarations
and definition of lock_t data structures so that
any user program can implement a mutex lock--
for example the threads_sync.c user program.

