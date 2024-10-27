Write down a few words of explanation of each file you had to modify/create for the two tasks

# Part 1: Threads
To implement kernel-level threads requires a modification of the same
files needed to implement any syscall: defs.h, syscall.c, syscall.h, 
proc.c, user.h, an dusys.S 

However, proc.c is substantially modified since it ultimately
provided the implementation for thread management syscalls.

#Part 2: Mutex
For mutex, we opted to create seperate files mutex.c and mutex.h
to implemnet the basic mutex lock funcitonality. The makefile
also requires a modification to compile the object file
and link it with user programs.
