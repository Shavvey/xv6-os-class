// Physical memory allocator, intended to allocate
// memory for user processes, kernel stacks, page table pages,
// and pipe buffers. Allocates 4096-byte pages.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "spinlock.h"
// just divide highest addres by the pgsize to obtain the total
// number of physical frames we have, we can then createa a table
// that counts the references to each underlying physical frames
#define TOTAL_PHYS_FRAMES PHYSTOP / PGSIZE
// useful macro that just shifts away offset bit to obtain
// physical page number, this is then used as a index into table
// that tracks all the references to that physical page
#define GET_IDX(pa) (pa >> PGSHIFT)

void freerange(void *vstart, void *vend);
extern char end[]; // first address after kernel loaded from ELF file

struct run {
  struct run *next;
};

struct {
  struct spinlock lock;
  int use_lock;
  struct run *freelist;
  struct {
    uint free_pages;
    // table of page references, we can index this table via a physical page number,
    // all we need to do is extract using V2P and shifting away offset (which is PGSHIFT)
    // this can be done with a simple left-shift
    uint pg_refs[TOTAL_PHYS_FRAMES];
  } pg_desc;
} kmem;

// Initialization happens in two phases.
// 1. main() calls kinit1() while still using entrypgdir to place just
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  kmem.pg_desc.free_pages = TOTAL_PHYS_FRAMES;
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  // loop through range based on the pgsize
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE) {
    uint idx = GET_IDX(V2P(p));
    kmem.pg_desc.pg_refs[idx] = 0;
    kfree(p);
  }
}

//PAGEBREAK: 21
// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");


  if(kmem.use_lock)
   acquire(&kmem.lock);
  // convert addr to free page 
  r = (struct run*)v;
  uint idx = GET_IDX(V2P(v));
  // if there are more refs to the page, just remove dec reference counter
  // dont deallocate yet
  if(kmem.pg_desc.pg_refs[idx] > 0)
    kmem.pg_desc.pg_refs[idx]--;

  // safe to free the page only if there is no more references held to it
  if(kmem.pg_desc.pg_refs[idx] == 0) {
    // Fill with junk to catch dangling refs.
    memset(v,1, PGSIZE);
    kmem.pg_desc.free_pages = kmem.pg_desc.free_pages + 1;
    r->next = kmem.freelist;
    kmem.freelist = r;
  }

  if(kmem.use_lock)
    release(&kmem.lock);
}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
  struct run *r;
  // acquire mutex on kernel mem
  if(kmem.use_lock)
    acquire(&kmem.lock);
  // get page from free list, probably the head of this list
  r = kmem.freelist;
  if(r) {
    // set new head
    kmem.freelist = r->next;
    // decrement the number of free pages we have
    kmem.pg_desc.free_pages = kmem.pg_desc.free_pages - 1;
    uint idx = GET_IDX(V2P((char *)r));
    // initially set page refs to just one
    kmem.pg_desc.pg_refs[idx] = 1;
  }
  if(kmem.use_lock)
    release(&kmem.lock);
  // return a pointer to new page, cast of byte/char pointer
  return (char*)r;
}

uint get_free_pages(void) {
  acquire(&kmem.lock);
  uint free_pages = kmem.pg_desc.free_pages;
  release(&kmem.lock);
  return free_pages;
}

void increment_ref_count(uint pa)
{
    // first check to see if we are given a valid physical address
    // AND the virtual address conversion is not out of bounds
    if(pa >= PHYSTOP || pa < (uint)V2P(end))  {
      panic("[ERROR]: Panic! Invalid address!");
    } 
    acquire(&kmem.lock);
    kmem.pg_desc.pg_refs[GET_IDX(pa)]++;
    release(&kmem.lock);
}

void decrement_ref_count(uint pa)
{
    // first check to see if we are given a valid physical address
    // AND the virtual address conversion is not out of bounds
    if(pa >= PHYSTOP || pa < (uint)V2P(end))  {
      panic("[ERROR]: Panic! Invalid address!");
    } 
    acquire(&kmem.lock);
    uint pg_refs = --kmem.pg_desc.pg_refs[GET_IDX(pa)];
    // free the memory if no more pages point to it
    if (pg_refs == 0)
      kfree(P2V(pa));

   release(&kmem.lock);
}

uint get_reference_count(uint pa) {
  
    // first check to see if we are given a valid physical address
    // AND the virtual address conversion is not out of bounds
    if(pa >= PHYSTOP || pa < (uint)V2P(end))  {
      panic("[ERROR]: Panic! Invalid address!");
    } 
    acquire(&kmem.lock);
    uint count = kmem.pg_desc.pg_refs[GET_IDX(pa)];
    release(&kmem.lock);
    return count;
}
