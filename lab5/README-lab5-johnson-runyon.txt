# EXERCISE 1

This is fairly simple, the kernal already
has a struct--called `kmem`--that contians housekeeping info
for memory management. In here, we can stick a free page counter, 
and a little later on we can create a ref counter here as well.

Once we modify `kmem` in `kalloc.c`, we create a function
called `get_free_pages()`, this will just acquire a mutex,
read the value inside `kmem`, and then release the mutex to
return the value.

Once that function is created, we can just create a simple syscall
that just calls this function (as long as we provided a definition inside defs.h).
Here we modify all the usual files involved in the other syscall we have created:
sysproc.c, defs.h, syscall.c, syscall.h, proc.c, user.h, and usys.S

# EXERCISE 2
To implement a reference count, we modifed `kmem` again. This time
we create a table with a length based on the total physical
number of frames the system can support. We can do this
by dividing `PHYSTOP`, the highest address of physical memory,
by the total page size, defined in the constant `PGSIZE`,
to obtain the total physical pages / frames.
Once we have a table in `kmem`, it can be indexed using
the physical page number (PPN), luckily xv6 has a macro
to extract the physical page bits from a page table entry
`pde_t`, so this is fairly easy to use. You can also
convert to physical using V2P and just shift away offset bits
using `PGSHIFT`.

Once that table is set up, we can create helper function
that acquire the `kmem` mutex and increment/decrement
the page reference counter as needed.

# EXERCISE 3
To implement the new `copyvum_cow` system call, we just need to modify
`vm.c` and then call this new function inside `fork()` in `proc.c`.
This new function is fairly similar to `copyuvm`, except
we dont immediately create a new page. Instead, we remove
write permissions on the page, and then map the child's address space
to the same page as that of the parent's.

# EXERCISE 4
To create a new trap, we can modify `trap.c` and `traps.h`.
Once this is setup, we can call `handle_pgflt()` once
the trap is triggered. Here we will create a new page
and copy the contents of the memory to this new page.

# EXERCISE 5
This exercise just involves creating a test program, called `testcow.c`.
My implementation of `testcow.c` calls `getNumFreePages` to get the intialpages first
and then calls `fork()` to create a child process a few times.
The child process will then modify the variable `x`, printf will announce this change.
Afterwards, we then call `getNumFreePages` again and compare this to previous call by obtaining
the difference in the number of free pages.

TO implemented this we created the file `testcow.c`, and then modified the makefile
so that xv6 will compile this program and link it with user libraries so we can execute this
inside of QEMU.

