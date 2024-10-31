
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4 0f                	in     $0xf,%al

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc f0 c5 10 80       	mov    $0x8010c5f0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 30 2e 10 80       	mov    $0x80102e30,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 34 c6 10 80       	mov    $0x8010c634,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 40 76 10 80       	push   $0x80107640
80100051:	68 00 c6 10 80       	push   $0x8010c600
80100056:	e8 15 47 00 00       	call   80104770 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 4c 0d 11 80 fc 	movl   $0x80110cfc,0x80110d4c
80100062:	0c 11 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 50 0d 11 80 fc 	movl   $0x80110cfc,0x80110d50
8010006c:	0c 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba fc 0c 11 80       	mov    $0x80110cfc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 fc 0c 11 80 	movl   $0x80110cfc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 47 76 10 80       	push   $0x80107647
80100097:	50                   	push   %eax
80100098:	e8 c3 45 00 00       	call   80104660 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 50 0d 11 80       	mov    0x80110d50,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 50 0d 11 80    	mov    %ebx,0x80110d50

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d fc 0c 11 80       	cmp    $0x80110cfc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 00 c6 10 80       	push   $0x8010c600
801000e4:	e8 07 47 00 00       	call   801047f0 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 50 0d 11 80    	mov    0x80110d50,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb fc 0c 11 80    	cmp    $0x80110cfc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb fc 0c 11 80    	cmp    $0x80110cfc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle some unused buffer and clean buffer
  // "clean" because B_DIRTY and not locked means log.c
  // hasn't yet committed the changes to the buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 4c 0d 11 80    	mov    0x80110d4c,%ebx
80100126:	81 fb fc 0c 11 80    	cmp    $0x80110cfc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb fc 0c 11 80    	cmp    $0x80110cfc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 00 c6 10 80       	push   $0x8010c600
80100162:	e8 b9 47 00 00       	call   80104920 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 2e 45 00 00       	call   801046a0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 3d 1f 00 00       	call   801020c0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 4e 76 10 80       	push   $0x8010764e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 8d 45 00 00       	call   80104740 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 f7 1e 00 00       	jmp    801020c0 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 5f 76 10 80       	push   $0x8010765f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 4c 45 00 00       	call   80104740 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 fc 44 00 00       	call   80104700 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 00 c6 10 80 	movl   $0x8010c600,(%esp)
8010020b:	e8 e0 45 00 00       	call   801047f0 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 50 0d 11 80       	mov    0x80110d50,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 fc 0c 11 80 	movl   $0x80110cfc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 50 0d 11 80       	mov    0x80110d50,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 50 0d 11 80    	mov    %ebx,0x80110d50
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 00 c6 10 80 	movl   $0x8010c600,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 bf 46 00 00       	jmp    80104920 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 66 76 10 80       	push   $0x80107666
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 ab 14 00 00       	call   80101730 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 40 b5 10 80 	movl   $0x8010b540,(%esp)
8010028c:	e8 5f 45 00 00       	call   801047f0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 00 10 11 80       	mov    0x80111000,%eax
801002a6:	3b 05 04 10 11 80    	cmp    0x80111004,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(proc->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 40 b5 10 80       	push   $0x8010b540
801002b8:	68 00 10 11 80       	push   $0x80111000
801002bd:	e8 8e 3b 00 00       	call   80103e50 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 00 10 11 80       	mov    0x80111000,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 04 10 11 80    	cmp    0x80111004,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(proc->killed){
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 40 b5 10 80       	push   $0x8010b540
801002e7:	e8 34 46 00 00       	call   80104920 <release>
        ilock(ip);
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 5c 13 00 00       	call   80101650 <ilock>
        return -1;
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 00 10 11 80    	mov    %edx,0x80111000
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 80 0f 11 80 	movsbl -0x7feef080(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 40 b5 10 80       	push   $0x8010b540
80100346:	e8 d5 45 00 00       	call   80104920 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 fd 12 00 00       	call   80101650 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 00 10 11 80       	mov    %eax,0x80111000
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
{
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
8010037f:	c7 05 74 b5 10 80 00 	movl   $0x0,0x8010b574
80100386:	00 00 00 
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 6d 76 10 80       	push   $0x8010766d
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a6:	c7 04 24 a6 7b 10 80 	movl   $0x80107ba6,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 d2 43 00 00       	call   80104790 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 89 76 10 80       	push   $0x80107689
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003e1:	c7 05 78 b5 10 80 01 	movl   $0x1,0x8010b578
801003e8:	00 00 00 
  for(;;)
    ;
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 78 b5 10 80    	mov    0x8010b578,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
    cli();
    for(;;)
      ;
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b2 00 00 00    	je     801004c8 <consputc+0xd8>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 71 5d 00 00       	call   80106190 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100434:	89 ca                	mov    %ecx,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 d0             	movzbl %al,%edx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	b8 0f 00 00 00       	mov    $0xf,%eax
8010043f:	89 d6                	mov    %edx,%esi
80100441:	89 fa                	mov    %edi,%edx
80100443:	c1 e6 08             	shl    $0x8,%esi
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 ca                	mov    %ecx,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 d0             	movzbl %al,%edx
8010044d:	09 f2                	or     %esi,%edx

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 05 01 00 00    	je     8010055d <consputc+0x16d>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e0 00 00 00    	je     80100544 <consputc+0x154>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 c3             	movzbl %bl,%eax
80100467:	8d 7a 01             	lea    0x1(%edx),%edi
8010046a:	80 cc 07             	or     $0x7,%ah
8010046d:	66 89 84 12 00 80 0b 	mov    %ax,-0x7ff48000(%edx,%edx,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f b6 00 00 00    	jg     80100537 <consputc+0x147>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 69                	jg     801004f2 <consputc+0x102>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	89 f0                	mov    %esi,%eax
801004a8:	b2 d5                	mov    $0xd5,%dl
801004aa:	ee                   	out    %al,(%dx)
801004ab:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b0:	89 fa                	mov    %edi,%edx
801004b2:	ee                   	out    %al,(%dx)
801004b3:	89 d8                	mov    %ebx,%eax
801004b5:	b2 d5                	mov    $0xd5,%dl
801004b7:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004b8:	b8 20 07 00 00       	mov    $0x720,%eax
801004bd:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c3:	5b                   	pop    %ebx
801004c4:	5e                   	pop    %esi
801004c5:	5f                   	pop    %edi
801004c6:	5d                   	pop    %ebp
801004c7:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004c8:	83 ec 0c             	sub    $0xc,%esp
801004cb:	6a 08                	push   $0x8
801004cd:	e8 be 5c 00 00       	call   80106190 <uartputc>
801004d2:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004d9:	e8 b2 5c 00 00       	call   80106190 <uartputc>
801004de:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004e5:	e8 a6 5c 00 00       	call   80106190 <uartputc>
801004ea:	83 c4 10             	add    $0x10,%esp
801004ed:	e9 30 ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f2:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004f5:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	68 60 0e 00 00       	push   $0xe60
801004fd:	68 a0 80 0b 80       	push   $0x800b80a0
80100502:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100507:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
8010050e:	e8 0d 45 00 00       	call   80104a20 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100513:	b8 d0 07 00 00       	mov    $0x7d0,%eax
80100518:	83 c4 0c             	add    $0xc,%esp
8010051b:	29 f8                	sub    %edi,%eax
8010051d:	01 c0                	add    %eax,%eax
8010051f:	50                   	push   %eax
80100520:	6a 00                	push   $0x0
80100522:	56                   	push   %esi
80100523:	e8 48 44 00 00       	call   80104970 <memset>
80100528:	89 f1                	mov    %esi,%ecx
8010052a:	83 c4 10             	add    $0x10,%esp
8010052d:	be 07 00 00 00       	mov    $0x7,%esi
80100532:	e9 62 ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
80100537:	83 ec 0c             	sub    $0xc,%esp
8010053a:	68 8d 76 10 80       	push   $0x8010768d
8010053f:	e8 2c fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
80100544:	85 d2                	test   %edx,%edx
80100546:	8d 7a ff             	lea    -0x1(%edx),%edi
80100549:	0f 85 26 ff ff ff    	jne    80100475 <consputc+0x85>
8010054f:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
80100554:	31 db                	xor    %ebx,%ebx
80100556:	31 f6                	xor    %esi,%esi
80100558:	e9 3c ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
8010055d:	89 d0                	mov    %edx,%eax
8010055f:	b9 67 66 66 66       	mov    $0x66666667,%ecx
80100564:	f7 e9                	imul   %ecx
80100566:	89 d0                	mov    %edx,%eax
80100568:	c1 e8 05             	shr    $0x5,%eax
8010056b:	8d 04 80             	lea    (%eax,%eax,4),%eax
8010056e:	c1 e0 04             	shl    $0x4,%eax
80100571:	8d 78 50             	lea    0x50(%eax),%edi
80100574:	e9 fc fe ff ff       	jmp    80100475 <consputc+0x85>
80100579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100580 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 1c             	sub    $0x1c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	74 04                	je     80100593 <printint+0x13>
8010058f:	85 c0                	test   %eax,%eax
80100591:	78 5d                	js     801005f0 <printint+0x70>
    x = -xx;
  else
    x = xx;
80100593:	31 ff                	xor    %edi,%edi
80100595:	8d 5d d7             	lea    -0x29(%ebp),%ebx

  i = 0;
80100598:	31 c9                	xor    %ecx,%ecx
8010059a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a0:	31 d2                	xor    %edx,%edx
801005a2:	83 c1 01             	add    $0x1,%ecx
801005a5:	f7 f6                	div    %esi
801005a7:	0f b6 92 b8 76 10 80 	movzbl -0x7fef8948(%edx),%edx
  }while((x /= base) != 0);
801005ae:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005b0:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005b3:	75 eb                	jne    801005a0 <printint+0x20>

  if(sign)
801005b5:	85 ff                	test   %edi,%edi
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005b7:	89 c8                	mov    %ecx,%eax
  }while((x /= base) != 0);

  if(sign)
801005b9:	74 08                	je     801005c3 <printint+0x43>
    buf[i++] = '-';
801005bb:	83 c0 01             	add    $0x1,%eax
801005be:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005c3:	8d 74 05 d7          	lea    -0x29(%ebp,%eax,1),%esi
801005c7:	89 f6                	mov    %esi,%esi
801005c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  while(--i >= 0)
    consputc(buf[i]);
801005d0:	0f be 06             	movsbl (%esi),%eax
801005d3:	83 ee 01             	sub    $0x1,%esi
801005d6:	e8 15 fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005db:	39 de                	cmp    %ebx,%esi
801005dd:	75 f1                	jne    801005d0 <printint+0x50>
    consputc(buf[i]);
}
801005df:	83 c4 1c             	add    $0x1c,%esp
801005e2:	5b                   	pop    %ebx
801005e3:	5e                   	pop    %esi
801005e4:	5f                   	pop    %edi
801005e5:	5d                   	pop    %ebp
801005e6:	c3                   	ret    
801005e7:	89 f6                	mov    %esi,%esi
801005e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005f0:	f7 d8                	neg    %eax
801005f2:	bf 01 00 00 00       	mov    $0x1,%edi
801005f7:	eb 9c                	jmp    80100595 <printint+0x15>
801005f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 1c 11 00 00       	call   80101730 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 40 b5 10 80 	movl   $0x8010b540,(%esp)
8010061b:	e8 d0 41 00 00       	call   801047f0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 40 b5 10 80       	push   $0x8010b540
80100647:	e8 d4 42 00 00       	call   80104920 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 fb 0f 00 00       	call   80101650 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 74 b5 10 80       	mov    0x8010b574,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 27 01 00 00    	jne    801007a0 <cprintf+0x140>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 75 08             	mov    0x8(%ebp),%esi
8010067c:	85 f6                	test   %esi,%esi
8010067e:	0f 84 3b 01 00 00    	je     801007bf <cprintf+0x15f>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100684:	0f b6 06             	movzbl (%esi),%eax
80100687:	31 db                	xor    %ebx,%ebx
80100689:	8d 7d 0c             	lea    0xc(%ebp),%edi
8010068c:	85 c0                	test   %eax,%eax
8010068e:	75 51                	jne    801006e1 <cprintf+0x81>
80100690:	eb 64                	jmp    801006f6 <cprintf+0x96>
80100692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
80100698:	83 c3 01             	add    $0x1,%ebx
8010069b:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
    if(c == 0)
8010069f:	85 d2                	test   %edx,%edx
801006a1:	74 53                	je     801006f6 <cprintf+0x96>
      break;
    switch(c){
801006a3:	83 fa 70             	cmp    $0x70,%edx
801006a6:	74 7a                	je     80100722 <cprintf+0xc2>
801006a8:	7f 6e                	jg     80100718 <cprintf+0xb8>
801006aa:	83 fa 25             	cmp    $0x25,%edx
801006ad:	0f 84 ad 00 00 00    	je     80100760 <cprintf+0x100>
801006b3:	83 fa 64             	cmp    $0x64,%edx
801006b6:	0f 85 84 00 00 00    	jne    80100740 <cprintf+0xe0>
    case 'd':
      printint(*argp++, 10, 1);
801006bc:	8d 47 04             	lea    0x4(%edi),%eax
801006bf:	b9 01 00 00 00       	mov    $0x1,%ecx
801006c4:	ba 0a 00 00 00       	mov    $0xa,%edx
801006c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006cc:	8b 07                	mov    (%edi),%eax
801006ce:	e8 ad fe ff ff       	call   80100580 <printint>
801006d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006d6:	83 c3 01             	add    $0x1,%ebx
801006d9:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006dd:	85 c0                	test   %eax,%eax
801006df:	74 15                	je     801006f6 <cprintf+0x96>
    if(c != '%'){
801006e1:	83 f8 25             	cmp    $0x25,%eax
801006e4:	74 b2                	je     80100698 <cprintf+0x38>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006e6:	e8 05 fd ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006eb:	83 c3 01             	add    $0x1,%ebx
801006ee:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006f2:	85 c0                	test   %eax,%eax
801006f4:	75 eb                	jne    801006e1 <cprintf+0x81>
      consputc(c);
      break;
    }
  }

  if(locking)
801006f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006f9:	85 c0                	test   %eax,%eax
801006fb:	74 10                	je     8010070d <cprintf+0xad>
    release(&cons.lock);
801006fd:	83 ec 0c             	sub    $0xc,%esp
80100700:	68 40 b5 10 80       	push   $0x8010b540
80100705:	e8 16 42 00 00       	call   80104920 <release>
8010070a:	83 c4 10             	add    $0x10,%esp
}
8010070d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100710:	5b                   	pop    %ebx
80100711:	5e                   	pop    %esi
80100712:	5f                   	pop    %edi
80100713:	5d                   	pop    %ebp
80100714:	c3                   	ret    
80100715:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100718:	83 fa 73             	cmp    $0x73,%edx
8010071b:	74 53                	je     80100770 <cprintf+0x110>
8010071d:	83 fa 78             	cmp    $0x78,%edx
80100720:	75 1e                	jne    80100740 <cprintf+0xe0>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
80100722:	8d 47 04             	lea    0x4(%edi),%eax
80100725:	31 c9                	xor    %ecx,%ecx
80100727:	ba 10 00 00 00       	mov    $0x10,%edx
8010072c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010072f:	8b 07                	mov    (%edi),%eax
80100731:	e8 4a fe ff ff       	call   80100580 <printint>
80100736:	8b 7d e4             	mov    -0x1c(%ebp),%edi
      break;
80100739:	eb 9b                	jmp    801006d6 <cprintf+0x76>
8010073b:	90                   	nop
8010073c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100740:	b8 25 00 00 00       	mov    $0x25,%eax
80100745:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100748:	e8 a3 fc ff ff       	call   801003f0 <consputc>
      consputc(c);
8010074d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100750:	89 d0                	mov    %edx,%eax
80100752:	e8 99 fc ff ff       	call   801003f0 <consputc>
      break;
80100757:	e9 7a ff ff ff       	jmp    801006d6 <cprintf+0x76>
8010075c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100760:	b8 25 00 00 00       	mov    $0x25,%eax
80100765:	e8 86 fc ff ff       	call   801003f0 <consputc>
8010076a:	e9 7c ff ff ff       	jmp    801006eb <cprintf+0x8b>
8010076f:	90                   	nop
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100770:	8d 47 04             	lea    0x4(%edi),%eax
80100773:	8b 3f                	mov    (%edi),%edi
80100775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100778:	85 ff                	test   %edi,%edi
8010077a:	74 3c                	je     801007b8 <cprintf+0x158>
        s = "(null)";
      for(; *s; s++)
8010077c:	0f be 07             	movsbl (%edi),%eax
8010077f:	84 c0                	test   %al,%al
80100781:	74 14                	je     80100797 <cprintf+0x137>
80100783:	90                   	nop
80100784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100788:	83 c7 01             	add    $0x1,%edi
        consputc(*s);
8010078b:	e8 60 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
80100790:	0f be 07             	movsbl (%edi),%eax
80100793:	84 c0                	test   %al,%al
80100795:	75 f1                	jne    80100788 <cprintf+0x128>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100797:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010079a:	e9 37 ff ff ff       	jmp    801006d6 <cprintf+0x76>
8010079f:	90                   	nop
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007a0:	83 ec 0c             	sub    $0xc,%esp
801007a3:	68 40 b5 10 80       	push   $0x8010b540
801007a8:	e8 43 40 00 00       	call   801047f0 <acquire>
801007ad:	83 c4 10             	add    $0x10,%esp
801007b0:	e9 c4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007b5:	8d 76 00             	lea    0x0(%esi),%esi
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
801007b8:	bf a0 76 10 80       	mov    $0x801076a0,%edi
801007bd:	eb bd                	jmp    8010077c <cprintf+0x11c>
  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);

  if (fmt == 0)
    panic("null fmt");
801007bf:	83 ec 0c             	sub    $0xc,%esp
801007c2:	68 a7 76 10 80       	push   $0x801076a7
801007c7:	e8 a4 fb ff ff       	call   80100370 <panic>
801007cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801007d0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007d0:	55                   	push   %ebp
801007d1:	89 e5                	mov    %esp,%ebp
801007d3:	57                   	push   %edi
801007d4:	56                   	push   %esi
801007d5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007d6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007d8:	83 ec 18             	sub    $0x18,%esp
801007db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007de:	68 40 b5 10 80       	push   $0x8010b540
801007e3:	e8 08 40 00 00       	call   801047f0 <acquire>
  while((c = getc()) >= 0){
801007e8:	83 c4 10             	add    $0x10,%esp
801007eb:	90                   	nop
801007ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801007f0:	ff d3                	call   *%ebx
801007f2:	85 c0                	test   %eax,%eax
801007f4:	89 c7                	mov    %eax,%edi
801007f6:	78 48                	js     80100840 <consoleintr+0x70>
    switch(c){
801007f8:	83 ff 10             	cmp    $0x10,%edi
801007fb:	0f 84 3f 01 00 00    	je     80100940 <consoleintr+0x170>
80100801:	7e 5d                	jle    80100860 <consoleintr+0x90>
80100803:	83 ff 15             	cmp    $0x15,%edi
80100806:	0f 84 dc 00 00 00    	je     801008e8 <consoleintr+0x118>
8010080c:	83 ff 7f             	cmp    $0x7f,%edi
8010080f:	75 54                	jne    80100865 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100811:	a1 08 10 11 80       	mov    0x80111008,%eax
80100816:	3b 05 04 10 11 80    	cmp    0x80111004,%eax
8010081c:	74 d2                	je     801007f0 <consoleintr+0x20>
        input.e--;
8010081e:	83 e8 01             	sub    $0x1,%eax
80100821:	a3 08 10 11 80       	mov    %eax,0x80111008
        consputc(BACKSPACE);
80100826:	b8 00 01 00 00       	mov    $0x100,%eax
8010082b:	e8 c0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100830:	ff d3                	call   *%ebx
80100832:	85 c0                	test   %eax,%eax
80100834:	89 c7                	mov    %eax,%edi
80100836:	79 c0                	jns    801007f8 <consoleintr+0x28>
80100838:	90                   	nop
80100839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100840:	83 ec 0c             	sub    $0xc,%esp
80100843:	68 40 b5 10 80       	push   $0x8010b540
80100848:	e8 d3 40 00 00       	call   80104920 <release>
  if(doprocdump) {
8010084d:	83 c4 10             	add    $0x10,%esp
80100850:	85 f6                	test   %esi,%esi
80100852:	0f 85 f8 00 00 00    	jne    80100950 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100858:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010085b:	5b                   	pop    %ebx
8010085c:	5e                   	pop    %esi
8010085d:	5f                   	pop    %edi
8010085e:	5d                   	pop    %ebp
8010085f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100860:	83 ff 08             	cmp    $0x8,%edi
80100863:	74 ac                	je     80100811 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100865:	85 ff                	test   %edi,%edi
80100867:	74 87                	je     801007f0 <consoleintr+0x20>
80100869:	a1 08 10 11 80       	mov    0x80111008,%eax
8010086e:	89 c2                	mov    %eax,%edx
80100870:	2b 15 00 10 11 80    	sub    0x80111000,%edx
80100876:	83 fa 7f             	cmp    $0x7f,%edx
80100879:	0f 87 71 ff ff ff    	ja     801007f0 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010087f:	8d 50 01             	lea    0x1(%eax),%edx
80100882:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
80100885:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
80100888:	89 15 08 10 11 80    	mov    %edx,0x80111008
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
8010088e:	0f 84 c8 00 00 00    	je     8010095c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
80100894:	89 f9                	mov    %edi,%ecx
80100896:	88 88 80 0f 11 80    	mov    %cl,-0x7feef080(%eax)
        consputc(c);
8010089c:	89 f8                	mov    %edi,%eax
8010089e:	e8 4d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008a3:	83 ff 04             	cmp    $0x4,%edi
801008a6:	0f 84 c1 00 00 00    	je     8010096d <consoleintr+0x19d>
801008ac:	83 ff 0a             	cmp    $0xa,%edi
801008af:	0f 84 b8 00 00 00    	je     8010096d <consoleintr+0x19d>
801008b5:	a1 00 10 11 80       	mov    0x80111000,%eax
801008ba:	83 e8 80             	sub    $0xffffff80,%eax
801008bd:	39 05 08 10 11 80    	cmp    %eax,0x80111008
801008c3:	0f 85 27 ff ff ff    	jne    801007f0 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008c9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008cc:	a3 04 10 11 80       	mov    %eax,0x80111004
          wakeup(&input.r);
801008d1:	68 00 10 11 80       	push   $0x80111000
801008d6:	e8 25 37 00 00       	call   80104000 <wakeup>
801008db:	83 c4 10             	add    $0x10,%esp
801008de:	e9 0d ff ff ff       	jmp    801007f0 <consoleintr+0x20>
801008e3:	90                   	nop
801008e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
801008e8:	a1 08 10 11 80       	mov    0x80111008,%eax
801008ed:	3b 05 04 10 11 80    	cmp    0x80111004,%eax
801008f3:	75 2b                	jne    80100920 <consoleintr+0x150>
801008f5:	e9 f6 fe ff ff       	jmp    801007f0 <consoleintr+0x20>
801008fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100900:	a3 08 10 11 80       	mov    %eax,0x80111008
        consputc(BACKSPACE);
80100905:	b8 00 01 00 00       	mov    $0x100,%eax
8010090a:	e8 e1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010090f:	a1 08 10 11 80       	mov    0x80111008,%eax
80100914:	3b 05 04 10 11 80    	cmp    0x80111004,%eax
8010091a:	0f 84 d0 fe ff ff    	je     801007f0 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100920:	83 e8 01             	sub    $0x1,%eax
80100923:	89 c2                	mov    %eax,%edx
80100925:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100928:	80 ba 80 0f 11 80 0a 	cmpb   $0xa,-0x7feef080(%edx)
8010092f:	75 cf                	jne    80100900 <consoleintr+0x130>
80100931:	e9 ba fe ff ff       	jmp    801007f0 <consoleintr+0x20>
80100936:	8d 76 00             	lea    0x0(%esi),%esi
80100939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100940:	be 01 00 00 00       	mov    $0x1,%esi
80100945:	e9 a6 fe ff ff       	jmp    801007f0 <consoleintr+0x20>
8010094a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100950:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100953:	5b                   	pop    %ebx
80100954:	5e                   	pop    %esi
80100955:	5f                   	pop    %edi
80100956:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100957:	e9 94 37 00 00       	jmp    801040f0 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010095c:	c6 80 80 0f 11 80 0a 	movb   $0xa,-0x7feef080(%eax)
        consputc(c);
80100963:	b8 0a 00 00 00       	mov    $0xa,%eax
80100968:	e8 83 fa ff ff       	call   801003f0 <consputc>
8010096d:	a1 08 10 11 80       	mov    0x80111008,%eax
80100972:	e9 52 ff ff ff       	jmp    801008c9 <consoleintr+0xf9>
80100977:	89 f6                	mov    %esi,%esi
80100979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100980 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
80100980:	55                   	push   %ebp
80100981:	89 e5                	mov    %esp,%ebp
80100983:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100986:	68 b0 76 10 80       	push   $0x801076b0
8010098b:	68 40 b5 10 80       	push   $0x8010b540
80100990:	e8 db 3d 00 00       	call   80104770 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
80100995:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
8010099c:	c7 05 0c 1a 11 80 00 	movl   $0x80100600,0x80111a0c
801009a3:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009a6:	c7 05 08 1a 11 80 70 	movl   $0x80100270,0x80111a08
801009ad:	02 10 80 
  cons.locking = 1;
801009b0:	c7 05 74 b5 10 80 01 	movl   $0x1,0x8010b574
801009b7:	00 00 00 

  picenable(IRQ_KBD);
801009ba:	e8 21 28 00 00       	call   801031e0 <picenable>
  ioapicenable(IRQ_KBD, 0);
801009bf:	58                   	pop    %eax
801009c0:	5a                   	pop    %edx
801009c1:	6a 00                	push   $0x0
801009c3:	6a 01                	push   $0x1
801009c5:	e8 b6 18 00 00       	call   80102280 <ioapicenable>
801009ca:	83 c4 10             	add    $0x10,%esp
}
801009cd:	c9                   	leave  
801009ce:	c3                   	ret    
801009cf:	90                   	nop

801009d0 <exec>:
// give newly admitted processes a high priority val
#define ADMIT_PRIOR 10

int
exec(char *path, char **argv)
{
801009d0:	55                   	push   %ebp
801009d1:	89 e5                	mov    %esp,%ebp
801009d3:	57                   	push   %edi
801009d4:	56                   	push   %esi
801009d5:	53                   	push   %ebx
801009d6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  begin_op();
801009dc:	e8 3f 21 00 00       	call   80102b20 <begin_op>

  if((ip = namei(path)) == 0){
801009e1:	83 ec 0c             	sub    $0xc,%esp
801009e4:	ff 75 08             	pushl  0x8(%ebp)
801009e7:	e8 a4 14 00 00       	call   80101e90 <namei>
801009ec:	83 c4 10             	add    $0x10,%esp
801009ef:	85 c0                	test   %eax,%eax
801009f1:	89 c3                	mov    %eax,%ebx
801009f3:	0f 84 a1 01 00 00    	je     80100b9a <exec+0x1ca>
    end_op();
    return -1;
  }
  ilock(ip);
801009f9:	83 ec 0c             	sub    $0xc,%esp
801009fc:	50                   	push   %eax
801009fd:	e8 4e 0c 00 00       	call   80101650 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100a02:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a08:	6a 34                	push   $0x34
80100a0a:	6a 00                	push   $0x0
80100a0c:	50                   	push   %eax
80100a0d:	53                   	push   %ebx
80100a0e:	e8 fd 0e 00 00       	call   80101910 <readi>
80100a13:	83 c4 20             	add    $0x20,%esp
80100a16:	83 f8 33             	cmp    $0x33,%eax
80100a19:	77 25                	ja     80100a40 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a1b:	83 ec 0c             	sub    $0xc,%esp
80100a1e:	53                   	push   %ebx
80100a1f:	e8 9c 0e 00 00       	call   801018c0 <iunlockput>
    end_op();
80100a24:	e8 67 21 00 00       	call   80102b90 <end_op>
80100a29:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a2c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a31:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a34:	5b                   	pop    %ebx
80100a35:	5e                   	pop    %esi
80100a36:	5f                   	pop    %edi
80100a37:	5d                   	pop    %ebp
80100a38:	c3                   	ret    
80100a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a40:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a47:	45 4c 46 
80100a4a:	75 cf                	jne    80100a1b <exec+0x4b>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a4c:	e8 1f 65 00 00       	call   80106f70 <setupkvm>
80100a51:	85 c0                	test   %eax,%eax
80100a53:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a59:	74 c0                	je     80100a1b <exec+0x4b>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a5b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a62:	00 
80100a63:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a69:	0f 84 b3 02 00 00    	je     80100d22 <exec+0x352>
80100a6f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a76:	00 00 00 
80100a79:	31 ff                	xor    %edi,%edi
80100a7b:	eb 18                	jmp    80100a95 <exec+0xc5>
80100a7d:	8d 76 00             	lea    0x0(%esi),%esi
80100a80:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100a87:	83 c7 01             	add    $0x1,%edi
80100a8a:	83 c6 20             	add    $0x20,%esi
80100a8d:	39 f8                	cmp    %edi,%eax
80100a8f:	0f 8e ab 00 00 00    	jle    80100b40 <exec+0x170>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100a95:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100a9b:	6a 20                	push   $0x20
80100a9d:	56                   	push   %esi
80100a9e:	50                   	push   %eax
80100a9f:	53                   	push   %ebx
80100aa0:	e8 6b 0e 00 00       	call   80101910 <readi>
80100aa5:	83 c4 10             	add    $0x10,%esp
80100aa8:	83 f8 20             	cmp    $0x20,%eax
80100aab:	75 7b                	jne    80100b28 <exec+0x158>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100aad:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100ab4:	75 ca                	jne    80100a80 <exec+0xb0>
      continue;
    if(ph.memsz < ph.filesz)
80100ab6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100abc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ac2:	72 64                	jb     80100b28 <exec+0x158>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100ac4:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100aca:	72 5c                	jb     80100b28 <exec+0x158>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100acc:	83 ec 04             	sub    $0x4,%esp
80100acf:	50                   	push   %eax
80100ad0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100ad6:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100adc:	e8 1f 67 00 00       	call   80107200 <allocuvm>
80100ae1:	83 c4 10             	add    $0x10,%esp
80100ae4:	85 c0                	test   %eax,%eax
80100ae6:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100aec:	74 3a                	je     80100b28 <exec+0x158>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100aee:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100af4:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100af9:	75 2d                	jne    80100b28 <exec+0x158>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100afb:	83 ec 0c             	sub    $0xc,%esp
80100afe:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b04:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b0a:	53                   	push   %ebx
80100b0b:	50                   	push   %eax
80100b0c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b12:	e8 29 66 00 00       	call   80107140 <loaduvm>
80100b17:	83 c4 20             	add    $0x20,%esp
80100b1a:	85 c0                	test   %eax,%eax
80100b1c:	0f 89 5e ff ff ff    	jns    80100a80 <exec+0xb0>
80100b22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b28:	83 ec 0c             	sub    $0xc,%esp
80100b2b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b31:	e8 ea 67 00 00       	call   80107320 <freevm>
80100b36:	83 c4 10             	add    $0x10,%esp
80100b39:	e9 dd fe ff ff       	jmp    80100a1b <exec+0x4b>
80100b3e:	66 90                	xchg   %ax,%ax
80100b40:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100b46:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100b4c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80100b52:	8d be 00 20 00 00    	lea    0x2000(%esi),%edi
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b58:	83 ec 0c             	sub    $0xc,%esp
80100b5b:	53                   	push   %ebx
80100b5c:	e8 5f 0d 00 00       	call   801018c0 <iunlockput>
  end_op();
80100b61:	e8 2a 20 00 00       	call   80102b90 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b66:	83 c4 0c             	add    $0xc,%esp
80100b69:	57                   	push   %edi
80100b6a:	56                   	push   %esi
80100b6b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b71:	e8 8a 66 00 00       	call   80107200 <allocuvm>
80100b76:	83 c4 10             	add    $0x10,%esp
80100b79:	85 c0                	test   %eax,%eax
80100b7b:	89 c6                	mov    %eax,%esi
80100b7d:	75 2a                	jne    80100ba9 <exec+0x1d9>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b7f:	83 ec 0c             	sub    $0xc,%esp
80100b82:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b88:	e8 93 67 00 00       	call   80107320 <freevm>
80100b8d:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b95:	e9 97 fe ff ff       	jmp    80100a31 <exec+0x61>
  pde_t *pgdir, *oldpgdir;

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100b9a:	e8 f1 1f 00 00       	call   80102b90 <end_op>
    return -1;
80100b9f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100ba4:	e9 88 fe ff ff       	jmp    80100a31 <exec+0x61>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100ba9:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100baf:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bb2:	31 ff                	xor    %edi,%edi
80100bb4:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bb6:	50                   	push   %eax
80100bb7:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bbd:	e8 de 67 00 00       	call   801073a0 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bc2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bc5:	83 c4 10             	add    $0x10,%esp
80100bc8:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100bce:	8b 00                	mov    (%eax),%eax
80100bd0:	85 c0                	test   %eax,%eax
80100bd2:	74 71                	je     80100c45 <exec+0x275>
80100bd4:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100bda:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100be0:	eb 0b                	jmp    80100bed <exec+0x21d>
80100be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(argc >= MAXARG)
80100be8:	83 ff 20             	cmp    $0x20,%edi
80100beb:	74 92                	je     80100b7f <exec+0x1af>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bed:	83 ec 0c             	sub    $0xc,%esp
80100bf0:	50                   	push   %eax
80100bf1:	e8 ba 3f 00 00       	call   80104bb0 <strlen>
80100bf6:	f7 d0                	not    %eax
80100bf8:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bfa:	58                   	pop    %eax
80100bfb:	8b 45 0c             	mov    0xc(%ebp),%eax

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bfe:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c01:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c04:	e8 a7 3f 00 00       	call   80104bb0 <strlen>
80100c09:	83 c0 01             	add    $0x1,%eax
80100c0c:	50                   	push   %eax
80100c0d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c10:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c13:	53                   	push   %ebx
80100c14:	56                   	push   %esi
80100c15:	e8 e6 68 00 00       	call   80107500 <copyout>
80100c1a:	83 c4 20             	add    $0x20,%esp
80100c1d:	85 c0                	test   %eax,%eax
80100c1f:	0f 88 5a ff ff ff    	js     80100b7f <exec+0x1af>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c25:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c28:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c2f:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c32:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c38:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c3b:	85 c0                	test   %eax,%eax
80100c3d:	75 a9                	jne    80100be8 <exec+0x218>
80100c3f:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c45:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c4c:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c4e:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c55:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100c59:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c60:	ff ff ff 
  ustack[1] = argc;
80100c63:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c69:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100c6b:	83 c0 0c             	add    $0xc,%eax
80100c6e:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c70:	50                   	push   %eax
80100c71:	52                   	push   %edx
80100c72:	53                   	push   %ebx
80100c73:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c79:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c7f:	e8 7c 68 00 00       	call   80107500 <copyout>
80100c84:	83 c4 10             	add    $0x10,%esp
80100c87:	85 c0                	test   %eax,%eax
80100c89:	0f 88 f0 fe ff ff    	js     80100b7f <exec+0x1af>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100c8f:	8b 45 08             	mov    0x8(%ebp),%eax
80100c92:	0f b6 10             	movzbl (%eax),%edx
80100c95:	84 d2                	test   %dl,%dl
80100c97:	74 25                	je     80100cbe <exec+0x2ee>
80100c99:	83 c0 01             	add    $0x1,%eax
80100c9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100c9f:	eb 11                	jmp    80100cb2 <exec+0x2e2>
80100ca1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100ca8:	0f b6 10             	movzbl (%eax),%edx
80100cab:	83 c0 01             	add    $0x1,%eax
80100cae:	84 d2                	test   %dl,%dl
80100cb0:	74 09                	je     80100cbb <exec+0x2eb>
    if(*s == '/')
80100cb2:	80 fa 2f             	cmp    $0x2f,%dl
80100cb5:	75 f1                	jne    80100ca8 <exec+0x2d8>
      last = s+1;
80100cb7:	89 c1                	mov    %eax,%ecx
80100cb9:	eb ed                	jmp    80100ca8 <exec+0x2d8>
80100cbb:	89 4d 08             	mov    %ecx,0x8(%ebp)
  safestrcpy(proc->name, last, sizeof(proc->name));
80100cbe:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cc4:	83 ec 04             	sub    $0x4,%esp
80100cc7:	6a 10                	push   $0x10
80100cc9:	ff 75 08             	pushl  0x8(%ebp)
80100ccc:	83 c0 6c             	add    $0x6c,%eax
80100ccf:	50                   	push   %eax
80100cd0:	e8 9b 3e 00 00       	call   80104b70 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100cd5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100cdb:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100ce1:	8b 78 04             	mov    0x4(%eax),%edi
  proc->pgdir = pgdir;
  proc->sz = sz;
80100ce4:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
  proc->pgdir = pgdir;
80100ce6:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->sz = sz;
  proc->tf->eip = elf.entry;  // main
80100ce9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cef:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100cf5:	8b 50 18             	mov    0x18(%eax),%edx
80100cf8:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100cfb:	8b 50 18             	mov    0x18(%eax),%edx
80100cfe:	89 5a 44             	mov    %ebx,0x44(%edx)
  proc->priority = ADMIT_PRIOR;
80100d01:	c7 40 7c 0a 00 00 00 	movl   $0xa,0x7c(%eax)
  switchuvm(proc);
80100d08:	89 04 24             	mov    %eax,(%esp)
80100d0b:	e8 10 63 00 00       	call   80107020 <switchuvm>
  freevm(oldpgdir);
80100d10:	89 3c 24             	mov    %edi,(%esp)
80100d13:	e8 08 66 00 00       	call   80107320 <freevm>
  return 0;
80100d18:	83 c4 10             	add    $0x10,%esp
80100d1b:	31 c0                	xor    %eax,%eax
80100d1d:	e9 0f fd ff ff       	jmp    80100a31 <exec+0x61>
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d22:	bf 00 20 00 00       	mov    $0x2000,%edi
80100d27:	31 f6                	xor    %esi,%esi
80100d29:	e9 2a fe ff ff       	jmp    80100b58 <exec+0x188>
80100d2e:	66 90                	xchg   %ax,%ax

80100d30 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d30:	55                   	push   %ebp
80100d31:	89 e5                	mov    %esp,%ebp
80100d33:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d36:	68 c9 76 10 80       	push   $0x801076c9
80100d3b:	68 40 10 11 80       	push   $0x80111040
80100d40:	e8 2b 3a 00 00       	call   80104770 <initlock>
80100d45:	83 c4 10             	add    $0x10,%esp
}
80100d48:	c9                   	leave  
80100d49:	c3                   	ret    
80100d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d50 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d54:	bb 74 10 11 80       	mov    $0x80111074,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d59:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d5c:	68 40 10 11 80       	push   $0x80111040
80100d61:	e8 8a 3a 00 00       	call   801047f0 <acquire>
80100d66:	83 c4 10             	add    $0x10,%esp
80100d69:	eb 10                	jmp    80100d7b <filealloc+0x2b>
80100d6b:	90                   	nop
80100d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d70:	83 c3 18             	add    $0x18,%ebx
80100d73:	81 fb d4 19 11 80    	cmp    $0x801119d4,%ebx
80100d79:	74 25                	je     80100da0 <filealloc+0x50>
    if(f->ref == 0){
80100d7b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d7e:	85 c0                	test   %eax,%eax
80100d80:	75 ee                	jne    80100d70 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100d82:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100d85:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100d8c:	68 40 10 11 80       	push   $0x80111040
80100d91:	e8 8a 3b 00 00       	call   80104920 <release>
      return f;
80100d96:	89 d8                	mov    %ebx,%eax
80100d98:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100d9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d9e:	c9                   	leave  
80100d9f:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100da0:	83 ec 0c             	sub    $0xc,%esp
80100da3:	68 40 10 11 80       	push   $0x80111040
80100da8:	e8 73 3b 00 00       	call   80104920 <release>
  return 0;
80100dad:	83 c4 10             	add    $0x10,%esp
80100db0:	31 c0                	xor    %eax,%eax
}
80100db2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100db5:	c9                   	leave  
80100db6:	c3                   	ret    
80100db7:	89 f6                	mov    %esi,%esi
80100db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100dc0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100dc0:	55                   	push   %ebp
80100dc1:	89 e5                	mov    %esp,%ebp
80100dc3:	53                   	push   %ebx
80100dc4:	83 ec 10             	sub    $0x10,%esp
80100dc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dca:	68 40 10 11 80       	push   $0x80111040
80100dcf:	e8 1c 3a 00 00       	call   801047f0 <acquire>
  if(f->ref < 1)
80100dd4:	8b 53 04             	mov    0x4(%ebx),%edx
80100dd7:	83 c4 10             	add    $0x10,%esp
80100dda:	85 d2                	test   %edx,%edx
80100ddc:	7e 1a                	jle    80100df8 <filedup+0x38>
    panic("filedup");
  f->ref++;
  release(&ftable.lock);
80100dde:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100de1:	83 c2 01             	add    $0x1,%edx
80100de4:	89 53 04             	mov    %edx,0x4(%ebx)
  release(&ftable.lock);
80100de7:	68 40 10 11 80       	push   $0x80111040
80100dec:	e8 2f 3b 00 00       	call   80104920 <release>
  return f;
}
80100df1:	89 d8                	mov    %ebx,%eax
80100df3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100df6:	c9                   	leave  
80100df7:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100df8:	83 ec 0c             	sub    $0xc,%esp
80100dfb:	68 d0 76 10 80       	push   $0x801076d0
80100e00:	e8 6b f5 ff ff       	call   80100370 <panic>
80100e05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e10 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	57                   	push   %edi
80100e14:	56                   	push   %esi
80100e15:	53                   	push   %ebx
80100e16:	83 ec 28             	sub    $0x28,%esp
80100e19:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e1c:	68 40 10 11 80       	push   $0x80111040
80100e21:	e8 ca 39 00 00       	call   801047f0 <acquire>
  if(f->ref < 1)
80100e26:	8b 47 04             	mov    0x4(%edi),%eax
80100e29:	83 c4 10             	add    $0x10,%esp
80100e2c:	85 c0                	test   %eax,%eax
80100e2e:	0f 8e 9b 00 00 00    	jle    80100ecf <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e34:	83 e8 01             	sub    $0x1,%eax
80100e37:	85 c0                	test   %eax,%eax
80100e39:	89 47 04             	mov    %eax,0x4(%edi)
80100e3c:	74 1a                	je     80100e58 <fileclose+0x48>
    release(&ftable.lock);
80100e3e:	c7 45 08 40 10 11 80 	movl   $0x80111040,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e48:	5b                   	pop    %ebx
80100e49:	5e                   	pop    %esi
80100e4a:	5f                   	pop    %edi
80100e4b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e4c:	e9 cf 3a 00 00       	jmp    80104920 <release>
80100e51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e58:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e5c:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e5e:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e61:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100e64:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e6a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e6d:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e70:	68 40 10 11 80       	push   $0x80111040
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e75:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e78:	e8 a3 3a 00 00       	call   80104920 <release>

  if(ff.type == FD_PIPE)
80100e7d:	83 c4 10             	add    $0x10,%esp
80100e80:	83 fb 01             	cmp    $0x1,%ebx
80100e83:	74 13                	je     80100e98 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e85:	83 fb 02             	cmp    $0x2,%ebx
80100e88:	74 26                	je     80100eb0 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e8d:	5b                   	pop    %ebx
80100e8e:	5e                   	pop    %esi
80100e8f:	5f                   	pop    %edi
80100e90:	5d                   	pop    %ebp
80100e91:	c3                   	ret    
80100e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100e98:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100e9c:	83 ec 08             	sub    $0x8,%esp
80100e9f:	53                   	push   %ebx
80100ea0:	56                   	push   %esi
80100ea1:	e8 fa 24 00 00       	call   801033a0 <pipeclose>
80100ea6:	83 c4 10             	add    $0x10,%esp
80100ea9:	eb df                	jmp    80100e8a <fileclose+0x7a>
80100eab:	90                   	nop
80100eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100eb0:	e8 6b 1c 00 00       	call   80102b20 <begin_op>
    iput(ff.ip);
80100eb5:	83 ec 0c             	sub    $0xc,%esp
80100eb8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ebb:	e8 c0 08 00 00       	call   80101780 <iput>
    end_op();
80100ec0:	83 c4 10             	add    $0x10,%esp
  }
}
80100ec3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ec6:	5b                   	pop    %ebx
80100ec7:	5e                   	pop    %esi
80100ec8:	5f                   	pop    %edi
80100ec9:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100eca:	e9 c1 1c 00 00       	jmp    80102b90 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100ecf:	83 ec 0c             	sub    $0xc,%esp
80100ed2:	68 d8 76 10 80       	push   $0x801076d8
80100ed7:	e8 94 f4 ff ff       	call   80100370 <panic>
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ee0 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ee0:	55                   	push   %ebp
80100ee1:	89 e5                	mov    %esp,%ebp
80100ee3:	53                   	push   %ebx
80100ee4:	83 ec 04             	sub    $0x4,%esp
80100ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100eea:	83 3b 02             	cmpl   $0x2,(%ebx)
80100eed:	75 31                	jne    80100f20 <filestat+0x40>
    ilock(f->ip);
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	ff 73 10             	pushl  0x10(%ebx)
80100ef5:	e8 56 07 00 00       	call   80101650 <ilock>
    stati(f->ip, st);
80100efa:	58                   	pop    %eax
80100efb:	5a                   	pop    %edx
80100efc:	ff 75 0c             	pushl  0xc(%ebp)
80100eff:	ff 73 10             	pushl  0x10(%ebx)
80100f02:	e8 d9 09 00 00       	call   801018e0 <stati>
    iunlock(f->ip);
80100f07:	59                   	pop    %ecx
80100f08:	ff 73 10             	pushl  0x10(%ebx)
80100f0b:	e8 20 08 00 00       	call   80101730 <iunlock>
    return 0;
80100f10:	83 c4 10             	add    $0x10,%esp
80100f13:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f18:	c9                   	leave  
80100f19:	c3                   	ret    
80100f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f30 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f30:	55                   	push   %ebp
80100f31:	89 e5                	mov    %esp,%ebp
80100f33:	57                   	push   %edi
80100f34:	56                   	push   %esi
80100f35:	53                   	push   %ebx
80100f36:	83 ec 0c             	sub    $0xc,%esp
80100f39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f3f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f42:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f46:	74 60                	je     80100fa8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f48:	8b 03                	mov    (%ebx),%eax
80100f4a:	83 f8 01             	cmp    $0x1,%eax
80100f4d:	74 41                	je     80100f90 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f4f:	83 f8 02             	cmp    $0x2,%eax
80100f52:	75 5b                	jne    80100faf <fileread+0x7f>
    ilock(f->ip);
80100f54:	83 ec 0c             	sub    $0xc,%esp
80100f57:	ff 73 10             	pushl  0x10(%ebx)
80100f5a:	e8 f1 06 00 00       	call   80101650 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f5f:	57                   	push   %edi
80100f60:	ff 73 14             	pushl  0x14(%ebx)
80100f63:	56                   	push   %esi
80100f64:	ff 73 10             	pushl  0x10(%ebx)
80100f67:	e8 a4 09 00 00       	call   80101910 <readi>
80100f6c:	83 c4 20             	add    $0x20,%esp
80100f6f:	85 c0                	test   %eax,%eax
80100f71:	89 c6                	mov    %eax,%esi
80100f73:	7e 03                	jle    80100f78 <fileread+0x48>
      f->off += r;
80100f75:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f78:	83 ec 0c             	sub    $0xc,%esp
80100f7b:	ff 73 10             	pushl  0x10(%ebx)
80100f7e:	e8 ad 07 00 00       	call   80101730 <iunlock>
    return r;
80100f83:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f86:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8b:	5b                   	pop    %ebx
80100f8c:	5e                   	pop    %esi
80100f8d:	5f                   	pop    %edi
80100f8e:	5d                   	pop    %ebp
80100f8f:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100f90:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f93:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f99:	5b                   	pop    %ebx
80100f9a:	5e                   	pop    %esi
80100f9b:	5f                   	pop    %edi
80100f9c:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100f9d:	e9 ce 25 00 00       	jmp    80103570 <piperead>
80100fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fad:	eb d9                	jmp    80100f88 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100faf:	83 ec 0c             	sub    $0xc,%esp
80100fb2:	68 e2 76 10 80       	push   $0x801076e2
80100fb7:	e8 b4 f3 ff ff       	call   80100370 <panic>
80100fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fc0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fc0:	55                   	push   %ebp
80100fc1:	89 e5                	mov    %esp,%ebp
80100fc3:	57                   	push   %edi
80100fc4:	56                   	push   %esi
80100fc5:	53                   	push   %ebx
80100fc6:	83 ec 1c             	sub    $0x1c,%esp
80100fc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fcc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fcf:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fd3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fd6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100fdc:	0f 84 a9 00 00 00    	je     8010108b <filewrite+0xcb>
    return -1;
  if(f->type == FD_PIPE)
80100fe2:	8b 03                	mov    (%ebx),%eax
80100fe4:	83 f8 01             	cmp    $0x1,%eax
80100fe7:	0f 84 c2 00 00 00    	je     801010af <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100fed:	83 f8 02             	cmp    $0x2,%eax
80100ff0:	0f 85 d8 00 00 00    	jne    801010ce <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80100ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ff9:	31 f6                	xor    %esi,%esi
80100ffb:	85 c0                	test   %eax,%eax
80100ffd:	7f 34                	jg     80101033 <filewrite+0x73>
80100fff:	e9 9c 00 00 00       	jmp    801010a0 <filewrite+0xe0>
80101004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101008:	01 43 14             	add    %eax,0x14(%ebx)
      iunlock(f->ip);
8010100b:	83 ec 0c             	sub    $0xc,%esp
8010100e:	ff 73 10             	pushl  0x10(%ebx)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101011:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101014:	e8 17 07 00 00       	call   80101730 <iunlock>
      end_op();
80101019:	e8 72 1b 00 00       	call   80102b90 <end_op>
8010101e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101021:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101024:	39 f8                	cmp    %edi,%eax
80101026:	0f 85 95 00 00 00    	jne    801010c1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010102c:	01 c6                	add    %eax,%esi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010102e:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
80101031:	7e 6d                	jle    801010a0 <filewrite+0xe0>
80101033:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101036:	29 f7                	sub    %esi,%edi
80101038:	81 ff 00 1a 00 00    	cmp    $0x1a00,%edi
8010103e:	7e 05                	jle    80101045 <filewrite+0x85>
80101040:	bf 00 1a 00 00       	mov    $0x1a00,%edi
      int n1 = n - i;
      if(n1 > max)
        n1 = max;

      begin_op();
80101045:	e8 d6 1a 00 00       	call   80102b20 <begin_op>
      ilock(f->ip);
8010104a:	83 ec 0c             	sub    $0xc,%esp
8010104d:	ff 73 10             	pushl  0x10(%ebx)
80101050:	e8 fb 05 00 00       	call   80101650 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101055:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101058:	57                   	push   %edi
80101059:	ff 73 14             	pushl  0x14(%ebx)
8010105c:	01 f0                	add    %esi,%eax
8010105e:	50                   	push   %eax
8010105f:	ff 73 10             	pushl  0x10(%ebx)
80101062:	e8 b9 09 00 00       	call   80101a20 <writei>
80101067:	83 c4 20             	add    $0x20,%esp
8010106a:	85 c0                	test   %eax,%eax
8010106c:	7f 9a                	jg     80101008 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
8010106e:	83 ec 0c             	sub    $0xc,%esp
80101071:	ff 73 10             	pushl  0x10(%ebx)
80101074:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101077:	e8 b4 06 00 00       	call   80101730 <iunlock>
      end_op();
8010107c:	e8 0f 1b 00 00       	call   80102b90 <end_op>

      if(r < 0)
80101081:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101084:	83 c4 10             	add    $0x10,%esp
80101087:	85 c0                	test   %eax,%eax
80101089:	74 99                	je     80101024 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
8010108b:	8d 65 f4             	lea    -0xc(%ebp),%esp
filewrite(struct file *f, char *addr, int n)
{
  int r;

  if(f->writable == 0)
    return -1;
8010108e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
80101093:	5b                   	pop    %ebx
80101094:	5e                   	pop    %esi
80101095:	5f                   	pop    %edi
80101096:	5d                   	pop    %ebp
80101097:	c3                   	ret    
80101098:	90                   	nop
80101099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010a0:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
801010a3:	89 f0                	mov    %esi,%eax
801010a5:	75 e4                	jne    8010108b <filewrite+0xcb>
  }
  panic("filewrite");
}
801010a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010aa:	5b                   	pop    %ebx
801010ab:	5e                   	pop    %esi
801010ac:	5f                   	pop    %edi
801010ad:	5d                   	pop    %ebp
801010ae:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010af:	8b 43 0c             	mov    0xc(%ebx),%eax
801010b2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	5b                   	pop    %ebx
801010b9:	5e                   	pop    %esi
801010ba:	5f                   	pop    %edi
801010bb:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010bc:	e9 7f 23 00 00       	jmp    80103440 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010c1:	83 ec 0c             	sub    $0xc,%esp
801010c4:	68 eb 76 10 80       	push   $0x801076eb
801010c9:	e8 a2 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010ce:	83 ec 0c             	sub    $0xc,%esp
801010d1:	68 f1 76 10 80       	push   $0x801076f1
801010d6:	e8 95 f2 ff ff       	call   80100370 <panic>
801010db:	66 90                	xchg   %ax,%ax
801010dd:	66 90                	xchg   %ax,%ax
801010df:	90                   	nop

801010e0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010e0:	55                   	push   %ebp
801010e1:	89 e5                	mov    %esp,%ebp
801010e3:	57                   	push   %edi
801010e4:	56                   	push   %esi
801010e5:	53                   	push   %ebx
801010e6:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010e9:	8b 0d 80 1a 11 80    	mov    0x80111a80,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010f2:	85 c9                	test   %ecx,%ecx
801010f4:	0f 84 85 00 00 00    	je     8010117f <balloc+0x9f>
801010fa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101101:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101104:	83 ec 08             	sub    $0x8,%esp
80101107:	89 f0                	mov    %esi,%eax
80101109:	c1 f8 0c             	sar    $0xc,%eax
8010110c:	03 05 98 1a 11 80    	add    0x80111a98,%eax
80101112:	50                   	push   %eax
80101113:	ff 75 d8             	pushl  -0x28(%ebp)
80101116:	e8 b5 ef ff ff       	call   801000d0 <bread>
8010111b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010111e:	a1 80 1a 11 80       	mov    0x80111a80,%eax
80101123:	83 c4 10             	add    $0x10,%esp
80101126:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101129:	31 c0                	xor    %eax,%eax
8010112b:	eb 2d                	jmp    8010115a <balloc+0x7a>
8010112d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101130:	89 c1                	mov    %eax,%ecx
80101132:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101137:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010113a:	83 e1 07             	and    $0x7,%ecx
8010113d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010113f:	89 c1                	mov    %eax,%ecx
80101141:	c1 f9 03             	sar    $0x3,%ecx
80101144:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101149:	85 d7                	test   %edx,%edi
8010114b:	74 43                	je     80101190 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010114d:	83 c0 01             	add    $0x1,%eax
80101150:	83 c6 01             	add    $0x1,%esi
80101153:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101158:	74 05                	je     8010115f <balloc+0x7f>
8010115a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010115d:	72 d1                	jb     80101130 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
8010115f:	83 ec 0c             	sub    $0xc,%esp
80101162:	ff 75 e4             	pushl  -0x1c(%ebp)
80101165:	e8 76 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010116a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101171:	83 c4 10             	add    $0x10,%esp
80101174:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101177:	3b 05 80 1a 11 80    	cmp    0x80111a80,%eax
8010117d:	72 82                	jb     80101101 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
8010117f:	83 ec 0c             	sub    $0xc,%esp
80101182:	68 fb 76 10 80       	push   $0x801076fb
80101187:	e8 e4 f1 ff ff       	call   80100370 <panic>
8010118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
80101190:	09 fa                	or     %edi,%edx
80101192:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
80101195:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
80101198:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
8010119c:	57                   	push   %edi
8010119d:	e8 5e 1b 00 00       	call   80102d00 <log_write>
        brelse(bp);
801011a2:	89 3c 24             	mov    %edi,(%esp)
801011a5:	e8 36 f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011aa:	58                   	pop    %eax
801011ab:	5a                   	pop    %edx
801011ac:	56                   	push   %esi
801011ad:	ff 75 d8             	pushl  -0x28(%ebp)
801011b0:	e8 1b ef ff ff       	call   801000d0 <bread>
801011b5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011b7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ba:	83 c4 0c             	add    $0xc,%esp
801011bd:	68 00 02 00 00       	push   $0x200
801011c2:	6a 00                	push   $0x0
801011c4:	50                   	push   %eax
801011c5:	e8 a6 37 00 00       	call   80104970 <memset>
  log_write(bp);
801011ca:	89 1c 24             	mov    %ebx,(%esp)
801011cd:	e8 2e 1b 00 00       	call   80102d00 <log_write>
  brelse(bp);
801011d2:	89 1c 24             	mov    %ebx,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
801011da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011dd:	89 f0                	mov    %esi,%eax
801011df:	5b                   	pop    %ebx
801011e0:	5e                   	pop    %esi
801011e1:	5f                   	pop    %edi
801011e2:	5d                   	pop    %ebp
801011e3:	c3                   	ret    
801011e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801011f0 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801011f0:	55                   	push   %ebp
801011f1:	89 e5                	mov    %esp,%ebp
801011f3:	57                   	push   %edi
801011f4:	56                   	push   %esi
801011f5:	53                   	push   %ebx
801011f6:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
801011f8:	31 f6                	xor    %esi,%esi
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801011fa:	83 ec 28             	sub    $0x28,%esp
801011fd:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101200:	68 c0 1a 11 80       	push   $0x80111ac0
80101205:	e8 e6 35 00 00       	call   801047f0 <acquire>
8010120a:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010120d:	b9 f4 1a 11 80       	mov    $0x80111af4,%ecx
80101212:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101215:	eb 1b                	jmp    80101232 <iget+0x42>
80101217:	89 f6                	mov    %esi,%esi
80101219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101220:	85 f6                	test   %esi,%esi
80101222:	74 44                	je     80101268 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101224:	81 c1 90 00 00 00    	add    $0x90,%ecx
8010122a:	81 f9 14 37 11 80    	cmp    $0x80113714,%ecx
80101230:	74 4e                	je     80101280 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101232:	8b 59 08             	mov    0x8(%ecx),%ebx
80101235:	85 db                	test   %ebx,%ebx
80101237:	7e e7                	jle    80101220 <iget+0x30>
80101239:	39 39                	cmp    %edi,(%ecx)
8010123b:	75 e3                	jne    80101220 <iget+0x30>
8010123d:	39 51 04             	cmp    %edx,0x4(%ecx)
80101240:	75 de                	jne    80101220 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101242:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101245:	83 c3 01             	add    $0x1,%ebx
80101248:	89 ce                	mov    %ecx,%esi
8010124a:	89 59 08             	mov    %ebx,0x8(%ecx)
      release(&icache.lock);
8010124d:	68 c0 1a 11 80       	push   $0x80111ac0
80101252:	e8 c9 36 00 00       	call   80104920 <release>
      return ip;
80101257:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
8010125a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010125d:	89 f0                	mov    %esi,%eax
8010125f:	5b                   	pop    %ebx
80101260:	5e                   	pop    %esi
80101261:	5f                   	pop    %edi
80101262:	5d                   	pop    %ebp
80101263:	c3                   	ret    
80101264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101268:	85 db                	test   %ebx,%ebx
8010126a:	75 b8                	jne    80101224 <iget+0x34>
8010126c:	89 ce                	mov    %ecx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010126e:	81 c1 90 00 00 00    	add    $0x90,%ecx
80101274:	81 f9 14 37 11 80    	cmp    $0x80113714,%ecx
8010127a:	75 b6                	jne    80101232 <iget+0x42>
8010127c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101280:	85 f6                	test   %esi,%esi
80101282:	74 2d                	je     801012b1 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);
80101284:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
80101287:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101289:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010129a:	68 c0 1a 11 80       	push   $0x80111ac0
8010129f:	e8 7c 36 00 00       	call   80104920 <release>

  return ip;
801012a4:	83 c4 10             	add    $0x10,%esp
}
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012b1:	83 ec 0c             	sub    $0xc,%esp
801012b4:	68 11 77 10 80       	push   $0x80107711
801012b9:	e8 b2 f0 ff ff       	call   80100370 <panic>
801012be:	66 90                	xchg   %ax,%ax

801012c0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012c0:	55                   	push   %ebp
801012c1:	89 e5                	mov    %esp,%ebp
801012c3:	57                   	push   %edi
801012c4:	56                   	push   %esi
801012c5:	53                   	push   %ebx
801012c6:	89 c6                	mov    %eax,%esi
801012c8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012cb:	83 fa 0b             	cmp    $0xb,%edx
801012ce:	77 18                	ja     801012e8 <bmap+0x28>
801012d0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
801012d3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012d6:	85 c0                	test   %eax,%eax
801012d8:	74 76                	je     80101350 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012dd:	5b                   	pop    %ebx
801012de:	5e                   	pop    %esi
801012df:	5f                   	pop    %edi
801012e0:	5d                   	pop    %ebp
801012e1:	c3                   	ret    
801012e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
801012e8:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
801012eb:	83 fb 7f             	cmp    $0x7f,%ebx
801012ee:	0f 87 83 00 00 00    	ja     80101377 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
801012f4:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
801012fa:	85 c0                	test   %eax,%eax
801012fc:	74 6a                	je     80101368 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
801012fe:	83 ec 08             	sub    $0x8,%esp
80101301:	50                   	push   %eax
80101302:	ff 36                	pushl  (%esi)
80101304:	e8 c7 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101309:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010130d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101310:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101312:	8b 1a                	mov    (%edx),%ebx
80101314:	85 db                	test   %ebx,%ebx
80101316:	75 1d                	jne    80101335 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101318:	8b 06                	mov    (%esi),%eax
8010131a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010131d:	e8 be fd ff ff       	call   801010e0 <balloc>
80101322:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101325:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101328:	89 c3                	mov    %eax,%ebx
8010132a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010132c:	57                   	push   %edi
8010132d:	e8 ce 19 00 00       	call   80102d00 <log_write>
80101332:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101335:	83 ec 0c             	sub    $0xc,%esp
80101338:	57                   	push   %edi
80101339:	e8 a2 ee ff ff       	call   801001e0 <brelse>
8010133e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
80101341:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101344:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
80101346:	5b                   	pop    %ebx
80101347:	5e                   	pop    %esi
80101348:	5f                   	pop    %edi
80101349:	5d                   	pop    %ebp
8010134a:	c3                   	ret    
8010134b:	90                   	nop
8010134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101350:	8b 06                	mov    (%esi),%eax
80101352:	e8 89 fd ff ff       	call   801010e0 <balloc>
80101357:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010135a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010135d:	5b                   	pop    %ebx
8010135e:	5e                   	pop    %esi
8010135f:	5f                   	pop    %edi
80101360:	5d                   	pop    %ebp
80101361:	c3                   	ret    
80101362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101368:	8b 06                	mov    (%esi),%eax
8010136a:	e8 71 fd ff ff       	call   801010e0 <balloc>
8010136f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101375:	eb 87                	jmp    801012fe <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101377:	83 ec 0c             	sub    $0xc,%esp
8010137a:	68 21 77 10 80       	push   $0x80107721
8010137f:	e8 ec ef ff ff       	call   80100370 <panic>
80101384:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010138a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101390 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80101390:	55                   	push   %ebp
80101391:	89 e5                	mov    %esp,%ebp
80101393:	56                   	push   %esi
80101394:	53                   	push   %ebx
80101395:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
80101398:	83 ec 08             	sub    $0x8,%esp
8010139b:	6a 01                	push   $0x1
8010139d:	ff 75 08             	pushl  0x8(%ebp)
801013a0:	e8 2b ed ff ff       	call   801000d0 <bread>
801013a5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013a7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013aa:	83 c4 0c             	add    $0xc,%esp
801013ad:	6a 1c                	push   $0x1c
801013af:	50                   	push   %eax
801013b0:	56                   	push   %esi
801013b1:	e8 6a 36 00 00       	call   80104a20 <memmove>
  brelse(bp);
801013b6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013b9:	83 c4 10             	add    $0x10,%esp
}
801013bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013bf:	5b                   	pop    %ebx
801013c0:	5e                   	pop    %esi
801013c1:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013c2:	e9 19 ee ff ff       	jmp    801001e0 <brelse>
801013c7:	89 f6                	mov    %esi,%esi
801013c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013d0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	89 d3                	mov    %edx,%ebx
801013d7:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013d9:	83 ec 08             	sub    $0x8,%esp
801013dc:	68 80 1a 11 80       	push   $0x80111a80
801013e1:	50                   	push   %eax
801013e2:	e8 a9 ff ff ff       	call   80101390 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801013e7:	58                   	pop    %eax
801013e8:	5a                   	pop    %edx
801013e9:	89 da                	mov    %ebx,%edx
801013eb:	c1 ea 0c             	shr    $0xc,%edx
801013ee:	03 15 98 1a 11 80    	add    0x80111a98,%edx
801013f4:	52                   	push   %edx
801013f5:	56                   	push   %esi
801013f6:	e8 d5 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
801013fb:	89 d9                	mov    %ebx,%ecx
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
801013fd:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  m = 1 << (bi % 8);
80101403:	ba 01 00 00 00       	mov    $0x1,%edx
80101408:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
8010140b:	c1 fb 03             	sar    $0x3,%ebx
8010140e:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101411:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101413:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
{
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
80101418:	89 c6                	mov    %eax,%esi
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
8010141a:	85 d1                	test   %edx,%ecx
8010141c:	74 25                	je     80101443 <bfree+0x73>
8010141e:	89 c8                	mov    %ecx,%eax
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101420:	f7 d2                	not    %edx
  log_write(bp);
80101422:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101425:	21 d0                	and    %edx,%eax
80101427:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010142b:	56                   	push   %esi
8010142c:	e8 cf 18 00 00       	call   80102d00 <log_write>
  brelse(bp);
80101431:	89 34 24             	mov    %esi,(%esp)
80101434:	e8 a7 ed ff ff       	call   801001e0 <brelse>
80101439:	83 c4 10             	add    $0x10,%esp
}
8010143c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010143f:	5b                   	pop    %ebx
80101440:	5e                   	pop    %esi
80101441:	5d                   	pop    %ebp
80101442:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101443:	83 ec 0c             	sub    $0xc,%esp
80101446:	68 34 77 10 80       	push   $0x80107734
8010144b:	e8 20 ef ff ff       	call   80100370 <panic>

80101450 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101450:	55                   	push   %ebp
80101451:	89 e5                	mov    %esp,%ebp
80101453:	53                   	push   %ebx
80101454:	bb 00 1b 11 80       	mov    $0x80111b00,%ebx
80101459:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010145c:	68 47 77 10 80       	push   $0x80107747
80101461:	68 c0 1a 11 80       	push   $0x80111ac0
80101466:	e8 05 33 00 00       	call   80104770 <initlock>
8010146b:	83 c4 10             	add    $0x10,%esp
8010146e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101470:	83 ec 08             	sub    $0x8,%esp
80101473:	68 4e 77 10 80       	push   $0x8010774e
80101478:	53                   	push   %ebx
80101479:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010147f:	e8 dc 31 00 00       	call   80104660 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
80101484:	83 c4 10             	add    $0x10,%esp
80101487:	81 fb 20 37 11 80    	cmp    $0x80113720,%ebx
8010148d:	75 e1                	jne    80101470 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  
  readsb(dev, &sb);
8010148f:	83 ec 08             	sub    $0x8,%esp
80101492:	68 80 1a 11 80       	push   $0x80111a80
80101497:	ff 75 08             	pushl  0x8(%ebp)
8010149a:	e8 f1 fe ff ff       	call   80101390 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010149f:	ff 35 98 1a 11 80    	pushl  0x80111a98
801014a5:	ff 35 94 1a 11 80    	pushl  0x80111a94
801014ab:	ff 35 90 1a 11 80    	pushl  0x80111a90
801014b1:	ff 35 8c 1a 11 80    	pushl  0x80111a8c
801014b7:	ff 35 88 1a 11 80    	pushl  0x80111a88
801014bd:	ff 35 84 1a 11 80    	pushl  0x80111a84
801014c3:	ff 35 80 1a 11 80    	pushl  0x80111a80
801014c9:	68 a4 77 10 80       	push   $0x801077a4
801014ce:	e8 8d f1 ff ff       	call   80100660 <cprintf>
801014d3:	83 c4 30             	add    $0x30,%esp
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801014d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014d9:	c9                   	leave  
801014da:	c3                   	ret    
801014db:	90                   	nop
801014dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014e0 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
801014e0:	55                   	push   %ebp
801014e1:	89 e5                	mov    %esp,%ebp
801014e3:	57                   	push   %edi
801014e4:	56                   	push   %esi
801014e5:	53                   	push   %ebx
801014e6:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801014e9:	83 3d 88 1a 11 80 01 	cmpl   $0x1,0x80111a88
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
801014f0:	8b 45 0c             	mov    0xc(%ebp),%eax
801014f3:	8b 75 08             	mov    0x8(%ebp),%esi
801014f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801014f9:	0f 86 91 00 00 00    	jbe    80101590 <ialloc+0xb0>
801014ff:	bb 01 00 00 00       	mov    $0x1,%ebx
80101504:	eb 21                	jmp    80101527 <ialloc+0x47>
80101506:	8d 76 00             	lea    0x0(%esi),%esi
80101509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101510:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101513:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101516:	50                   	push   %eax
80101517:	e8 c4 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010151c:	83 c4 10             	add    $0x10,%esp
8010151f:	3b 1d 88 1a 11 80    	cmp    0x80111a88,%ebx
80101525:	73 69                	jae    80101590 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101527:	89 d8                	mov    %ebx,%eax
80101529:	83 ec 08             	sub    $0x8,%esp
8010152c:	c1 e8 03             	shr    $0x3,%eax
8010152f:	03 05 94 1a 11 80    	add    0x80111a94,%eax
80101535:	50                   	push   %eax
80101536:	56                   	push   %esi
80101537:	e8 94 eb ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + inum%IPB;
8010153c:	89 da                	mov    %ebx,%edx
    if(dip->type == 0){  // a free inode
8010153e:	83 c4 10             	add    $0x10,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
80101541:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
80101543:	83 e2 07             	and    $0x7,%edx
80101546:	c1 e2 06             	shl    $0x6,%edx
80101549:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
    if(dip->type == 0){  // a free inode
8010154d:	66 83 3a 00          	cmpw   $0x0,(%edx)
80101551:	75 bd                	jne    80101510 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101553:	83 ec 04             	sub    $0x4,%esp
80101556:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101559:	6a 40                	push   $0x40
8010155b:	6a 00                	push   $0x0
8010155d:	52                   	push   %edx
8010155e:	e8 0d 34 00 00       	call   80104970 <memset>
      dip->type = type;
80101563:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101567:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010156a:	66 89 02             	mov    %ax,(%edx)
      log_write(bp);   // mark it allocated on the disk
8010156d:	89 3c 24             	mov    %edi,(%esp)
80101570:	e8 8b 17 00 00       	call   80102d00 <log_write>
      brelse(bp);
80101575:	89 3c 24             	mov    %edi,(%esp)
80101578:	e8 63 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010157d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101580:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
80101583:	89 da                	mov    %ebx,%edx
80101585:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101587:	5b                   	pop    %ebx
80101588:	5e                   	pop    %esi
80101589:	5f                   	pop    %edi
8010158a:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
8010158b:	e9 60 fc ff ff       	jmp    801011f0 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
80101590:	83 ec 0c             	sub    $0xc,%esp
80101593:	68 54 77 10 80       	push   $0x80107754
80101598:	e8 d3 ed ff ff       	call   80100370 <panic>
8010159d:	8d 76 00             	lea    0x0(%esi),%esi

801015a0 <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
801015a0:	55                   	push   %ebp
801015a1:	89 e5                	mov    %esp,%ebp
801015a3:	56                   	push   %esi
801015a4:	53                   	push   %ebx
801015a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015a8:	83 ec 08             	sub    $0x8,%esp
801015ab:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ae:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015b1:	c1 e8 03             	shr    $0x3,%eax
801015b4:	03 05 94 1a 11 80    	add    0x80111a94,%eax
801015ba:	50                   	push   %eax
801015bb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015be:	e8 0d eb ff ff       	call   801000d0 <bread>
801015c3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015c5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015c8:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015cb:	83 e0 07             	and    $0x7,%eax
801015ce:	c1 e0 06             	shl    $0x6,%eax
801015d1:	8d 54 06 5c          	lea    0x5c(%esi,%eax,1),%edx
  dip->type = ip->type;
801015d5:	0f b7 43 f4          	movzwl -0xc(%ebx),%eax
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015d9:	83 c2 0c             	add    $0xc,%edx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
801015dc:	66 89 42 f4          	mov    %ax,-0xc(%edx)
  dip->major = ip->major;
801015e0:	0f b7 43 f6          	movzwl -0xa(%ebx),%eax
801015e4:	66 89 42 f6          	mov    %ax,-0xa(%edx)
  dip->minor = ip->minor;
801015e8:	0f b7 43 f8          	movzwl -0x8(%ebx),%eax
801015ec:	66 89 42 f8          	mov    %ax,-0x8(%edx)
  dip->nlink = ip->nlink;
801015f0:	0f b7 43 fa          	movzwl -0x6(%ebx),%eax
801015f4:	66 89 42 fa          	mov    %ax,-0x6(%edx)
  dip->size = ip->size;
801015f8:	8b 43 fc             	mov    -0x4(%ebx),%eax
801015fb:	89 42 fc             	mov    %eax,-0x4(%edx)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015fe:	6a 34                	push   $0x34
80101600:	53                   	push   %ebx
80101601:	52                   	push   %edx
80101602:	e8 19 34 00 00       	call   80104a20 <memmove>
  log_write(bp);
80101607:	89 34 24             	mov    %esi,(%esp)
8010160a:	e8 f1 16 00 00       	call   80102d00 <log_write>
  brelse(bp);
8010160f:	89 75 08             	mov    %esi,0x8(%ebp)
80101612:	83 c4 10             	add    $0x10,%esp
}
80101615:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101618:	5b                   	pop    %ebx
80101619:	5e                   	pop    %esi
8010161a:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010161b:	e9 c0 eb ff ff       	jmp    801001e0 <brelse>

80101620 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101620:	55                   	push   %ebp
80101621:	89 e5                	mov    %esp,%ebp
80101623:	53                   	push   %ebx
80101624:	83 ec 10             	sub    $0x10,%esp
80101627:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010162a:	68 c0 1a 11 80       	push   $0x80111ac0
8010162f:	e8 bc 31 00 00       	call   801047f0 <acquire>
  ip->ref++;
80101634:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101638:	c7 04 24 c0 1a 11 80 	movl   $0x80111ac0,(%esp)
8010163f:	e8 dc 32 00 00       	call   80104920 <release>
  return ip;
}
80101644:	89 d8                	mov    %ebx,%eax
80101646:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101649:	c9                   	leave  
8010164a:	c3                   	ret    
8010164b:	90                   	nop
8010164c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101650 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101650:	55                   	push   %ebp
80101651:	89 e5                	mov    %esp,%ebp
80101653:	56                   	push   %esi
80101654:	53                   	push   %ebx
80101655:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101658:	85 db                	test   %ebx,%ebx
8010165a:	0f 84 b4 00 00 00    	je     80101714 <ilock+0xc4>
80101660:	8b 43 08             	mov    0x8(%ebx),%eax
80101663:	85 c0                	test   %eax,%eax
80101665:	0f 8e a9 00 00 00    	jle    80101714 <ilock+0xc4>
    panic("ilock");

  acquiresleep(&ip->lock);
8010166b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010166e:	83 ec 0c             	sub    $0xc,%esp
80101671:	50                   	push   %eax
80101672:	e8 29 30 00 00       	call   801046a0 <acquiresleep>

  if(!(ip->flags & I_VALID)){
80101677:	83 c4 10             	add    $0x10,%esp
8010167a:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
8010167e:	74 10                	je     80101690 <ilock+0x40>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
80101680:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101683:	5b                   	pop    %ebx
80101684:	5e                   	pop    %esi
80101685:	5d                   	pop    %ebp
80101686:	c3                   	ret    
80101687:	89 f6                	mov    %esi,%esi
80101689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101690:	8b 43 04             	mov    0x4(%ebx),%eax
80101693:	83 ec 08             	sub    $0x8,%esp
80101696:	c1 e8 03             	shr    $0x3,%eax
80101699:	03 05 94 1a 11 80    	add    0x80111a94,%eax
8010169f:	50                   	push   %eax
801016a0:	ff 33                	pushl  (%ebx)
801016a2:	e8 29 ea ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016a7:	8b 53 04             	mov    0x4(%ebx),%edx
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016aa:	89 c6                	mov    %eax,%esi
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016ac:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016af:	83 e2 07             	and    $0x7,%edx
801016b2:	c1 e2 06             	shl    $0x6,%edx
801016b5:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
    ip->type = dip->type;
801016b9:	0f b7 02             	movzwl (%edx),%eax
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016bc:	83 c2 0c             	add    $0xc,%edx
  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
801016bf:	66 89 43 50          	mov    %ax,0x50(%ebx)
    ip->major = dip->major;
801016c3:	0f b7 42 f6          	movzwl -0xa(%edx),%eax
801016c7:	66 89 43 52          	mov    %ax,0x52(%ebx)
    ip->minor = dip->minor;
801016cb:	0f b7 42 f8          	movzwl -0x8(%edx),%eax
801016cf:	66 89 43 54          	mov    %ax,0x54(%ebx)
    ip->nlink = dip->nlink;
801016d3:	0f b7 42 fa          	movzwl -0x6(%edx),%eax
801016d7:	66 89 43 56          	mov    %ax,0x56(%ebx)
    ip->size = dip->size;
801016db:	8b 42 fc             	mov    -0x4(%edx),%eax
801016de:	89 43 58             	mov    %eax,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016e1:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016e4:	6a 34                	push   $0x34
801016e6:	52                   	push   %edx
801016e7:	50                   	push   %eax
801016e8:	e8 33 33 00 00       	call   80104a20 <memmove>
    brelse(bp);
801016ed:	89 34 24             	mov    %esi,(%esp)
801016f0:	e8 eb ea ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
801016f5:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
801016f9:	83 c4 10             	add    $0x10,%esp
801016fc:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101701:	0f 85 79 ff ff ff    	jne    80101680 <ilock+0x30>
      panic("ilock: no type");
80101707:	83 ec 0c             	sub    $0xc,%esp
8010170a:	68 6c 77 10 80       	push   $0x8010776c
8010170f:	e8 5c ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101714:	83 ec 0c             	sub    $0xc,%esp
80101717:	68 66 77 10 80       	push   $0x80107766
8010171c:	e8 4f ec ff ff       	call   80100370 <panic>
80101721:	eb 0d                	jmp    80101730 <iunlock>
80101723:	90                   	nop
80101724:	90                   	nop
80101725:	90                   	nop
80101726:	90                   	nop
80101727:	90                   	nop
80101728:	90                   	nop
80101729:	90                   	nop
8010172a:	90                   	nop
8010172b:	90                   	nop
8010172c:	90                   	nop
8010172d:	90                   	nop
8010172e:	90                   	nop
8010172f:	90                   	nop

80101730 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101730:	55                   	push   %ebp
80101731:	89 e5                	mov    %esp,%ebp
80101733:	56                   	push   %esi
80101734:	53                   	push   %ebx
80101735:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101738:	85 db                	test   %ebx,%ebx
8010173a:	74 28                	je     80101764 <iunlock+0x34>
8010173c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010173f:	83 ec 0c             	sub    $0xc,%esp
80101742:	56                   	push   %esi
80101743:	e8 f8 2f 00 00       	call   80104740 <holdingsleep>
80101748:	83 c4 10             	add    $0x10,%esp
8010174b:	85 c0                	test   %eax,%eax
8010174d:	74 15                	je     80101764 <iunlock+0x34>
8010174f:	8b 43 08             	mov    0x8(%ebx),%eax
80101752:	85 c0                	test   %eax,%eax
80101754:	7e 0e                	jle    80101764 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101756:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101759:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010175c:	5b                   	pop    %ebx
8010175d:	5e                   	pop    %esi
8010175e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010175f:	e9 9c 2f 00 00       	jmp    80104700 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101764:	83 ec 0c             	sub    $0xc,%esp
80101767:	68 7b 77 10 80       	push   $0x8010777b
8010176c:	e8 ff eb ff ff       	call   80100370 <panic>
80101771:	eb 0d                	jmp    80101780 <iput>
80101773:	90                   	nop
80101774:	90                   	nop
80101775:	90                   	nop
80101776:	90                   	nop
80101777:	90                   	nop
80101778:	90                   	nop
80101779:	90                   	nop
8010177a:	90                   	nop
8010177b:	90                   	nop
8010177c:	90                   	nop
8010177d:	90                   	nop
8010177e:	90                   	nop
8010177f:	90                   	nop

80101780 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	57                   	push   %edi
80101784:	56                   	push   %esi
80101785:	53                   	push   %ebx
80101786:	83 ec 28             	sub    $0x28,%esp
80101789:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
8010178c:	68 c0 1a 11 80       	push   $0x80111ac0
80101791:	e8 5a 30 00 00       	call   801047f0 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101796:	8b 46 08             	mov    0x8(%esi),%eax
80101799:	83 c4 10             	add    $0x10,%esp
8010179c:	83 f8 01             	cmp    $0x1,%eax
8010179f:	74 1f                	je     801017c0 <iput+0x40>
    ip->type = 0;
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
801017a1:	83 e8 01             	sub    $0x1,%eax
801017a4:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
801017a7:	c7 45 08 c0 1a 11 80 	movl   $0x80111ac0,0x8(%ebp)
}
801017ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017b1:	5b                   	pop    %ebx
801017b2:	5e                   	pop    %esi
801017b3:	5f                   	pop    %edi
801017b4:	5d                   	pop    %ebp
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
801017b5:	e9 66 31 00 00       	jmp    80104920 <release>
801017ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// case it has to free the inode.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801017c0:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
801017c4:	74 db                	je     801017a1 <iput+0x21>
801017c6:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017cb:	75 d4                	jne    801017a1 <iput+0x21>
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
801017cd:	83 ec 0c             	sub    $0xc,%esp
801017d0:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801017d3:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
801017d9:	68 c0 1a 11 80       	push   $0x80111ac0
801017de:	e8 3d 31 00 00       	call   80104920 <release>
801017e3:	83 c4 10             	add    $0x10,%esp
801017e6:	eb 0f                	jmp    801017f7 <iput+0x77>
801017e8:	90                   	nop
801017e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801017f0:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
801017f3:	39 fb                	cmp    %edi,%ebx
801017f5:	74 19                	je     80101810 <iput+0x90>
    if(ip->addrs[i]){
801017f7:	8b 13                	mov    (%ebx),%edx
801017f9:	85 d2                	test   %edx,%edx
801017fb:	74 f3                	je     801017f0 <iput+0x70>
      bfree(ip->dev, ip->addrs[i]);
801017fd:	8b 06                	mov    (%esi),%eax
801017ff:	e8 cc fb ff ff       	call   801013d0 <bfree>
      ip->addrs[i] = 0;
80101804:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010180a:	eb e4                	jmp    801017f0 <iput+0x70>
8010180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101810:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101816:	85 c0                	test   %eax,%eax
80101818:	75 46                	jne    80101860 <iput+0xe0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010181a:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010181d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101824:	56                   	push   %esi
80101825:	e8 76 fd ff ff       	call   801015a0 <iupdate>
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
8010182a:	31 c0                	xor    %eax,%eax
8010182c:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
80101830:	89 34 24             	mov    %esi,(%esp)
80101833:	e8 68 fd ff ff       	call   801015a0 <iupdate>
    acquire(&icache.lock);
80101838:	c7 04 24 c0 1a 11 80 	movl   $0x80111ac0,(%esp)
8010183f:	e8 ac 2f 00 00       	call   801047f0 <acquire>
    ip->flags = 0;
80101844:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010184b:	8b 46 08             	mov    0x8(%esi),%eax
8010184e:	83 c4 10             	add    $0x10,%esp
80101851:	e9 4b ff ff ff       	jmp    801017a1 <iput+0x21>
80101856:	8d 76 00             	lea    0x0(%esi),%esi
80101859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101860:	83 ec 08             	sub    $0x8,%esp
80101863:	50                   	push   %eax
80101864:	ff 36                	pushl  (%esi)
80101866:	e8 65 e8 ff ff       	call   801000d0 <bread>
8010186b:	83 c4 10             	add    $0x10,%esp
8010186e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101871:	8d 58 5c             	lea    0x5c(%eax),%ebx
80101874:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
8010187a:	eb 0b                	jmp    80101887 <iput+0x107>
8010187c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101880:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
80101883:	39 fb                	cmp    %edi,%ebx
80101885:	74 0f                	je     80101896 <iput+0x116>
      if(a[j])
80101887:	8b 13                	mov    (%ebx),%edx
80101889:	85 d2                	test   %edx,%edx
8010188b:	74 f3                	je     80101880 <iput+0x100>
        bfree(ip->dev, a[j]);
8010188d:	8b 06                	mov    (%esi),%eax
8010188f:	e8 3c fb ff ff       	call   801013d0 <bfree>
80101894:	eb ea                	jmp    80101880 <iput+0x100>
    }
    brelse(bp);
80101896:	83 ec 0c             	sub    $0xc,%esp
80101899:	ff 75 e4             	pushl  -0x1c(%ebp)
8010189c:	e8 3f e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018a1:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018a7:	8b 06                	mov    (%esi),%eax
801018a9:	e8 22 fb ff ff       	call   801013d0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018ae:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018b5:	00 00 00 
801018b8:	83 c4 10             	add    $0x10,%esp
801018bb:	e9 5a ff ff ff       	jmp    8010181a <iput+0x9a>

801018c0 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
801018c0:	55                   	push   %ebp
801018c1:	89 e5                	mov    %esp,%ebp
801018c3:	53                   	push   %ebx
801018c4:	83 ec 10             	sub    $0x10,%esp
801018c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
801018ca:	53                   	push   %ebx
801018cb:	e8 60 fe ff ff       	call   80101730 <iunlock>
  iput(ip);
801018d0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801018d3:	83 c4 10             	add    $0x10,%esp
}
801018d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801018d9:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
801018da:	e9 a1 fe ff ff       	jmp    80101780 <iput>
801018df:	90                   	nop

801018e0 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
801018e0:	55                   	push   %ebp
801018e1:	89 e5                	mov    %esp,%ebp
801018e3:	8b 55 08             	mov    0x8(%ebp),%edx
801018e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
801018e9:	8b 0a                	mov    (%edx),%ecx
801018eb:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
801018ee:	8b 4a 04             	mov    0x4(%edx),%ecx
801018f1:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
801018f4:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
801018f8:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
801018fb:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
801018ff:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101903:	8b 52 58             	mov    0x58(%edx),%edx
80101906:	89 50 10             	mov    %edx,0x10(%eax)
}
80101909:	5d                   	pop    %ebp
8010190a:	c3                   	ret    
8010190b:	90                   	nop
8010190c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101910 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	57                   	push   %edi
80101914:	56                   	push   %esi
80101915:	53                   	push   %ebx
80101916:	83 ec 1c             	sub    $0x1c,%esp
80101919:	8b 45 08             	mov    0x8(%ebp),%eax
8010191c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010191f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101922:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101927:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010192a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010192d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101930:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101933:	0f 84 b7 00 00 00    	je     801019f0 <readi+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101939:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010193c:	8b 40 58             	mov    0x58(%eax),%eax
8010193f:	39 f0                	cmp    %esi,%eax
80101941:	0f 82 d1 00 00 00    	jb     80101a18 <readi+0x108>
80101947:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010194a:	01 f2                	add    %esi,%edx
8010194c:	0f 82 c6 00 00 00    	jb     80101a18 <readi+0x108>
    return -1;
  if(off + n > ip->size)
80101952:	39 d0                	cmp    %edx,%eax
80101954:	0f 82 86 00 00 00    	jb     801019e0 <readi+0xd0>
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010195a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010195d:	31 ff                	xor    %edi,%edi
8010195f:	85 c0                	test   %eax,%eax
80101961:	74 6b                	je     801019ce <readi+0xbe>
80101963:	90                   	nop
80101964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101968:	8b 5d d8             	mov    -0x28(%ebp),%ebx
8010196b:	89 f2                	mov    %esi,%edx
8010196d:	c1 ea 09             	shr    $0x9,%edx
80101970:	89 d8                	mov    %ebx,%eax
80101972:	e8 49 f9 ff ff       	call   801012c0 <bmap>
80101977:	83 ec 08             	sub    $0x8,%esp
8010197a:	50                   	push   %eax
8010197b:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
8010197d:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101982:	e8 49 e7 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101987:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
8010198a:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
8010198c:	89 f0                	mov    %esi,%eax
8010198e:	25 ff 01 00 00       	and    $0x1ff,%eax
80101993:	83 c4 10             	add    $0x10,%esp
80101996:	29 c3                	sub    %eax,%ebx
80101998:	29 f9                	sub    %edi,%ecx
8010199a:	39 cb                	cmp    %ecx,%ebx
8010199c:	76 02                	jbe    801019a0 <readi+0x90>
8010199e:	89 cb                	mov    %ecx,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019a0:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801019a4:	83 ec 04             	sub    $0x4,%esp
801019a7:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019aa:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019ab:	01 df                	add    %ebx,%edi
801019ad:	01 de                	add    %ebx,%esi
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019af:	50                   	push   %eax
801019b0:	ff 75 e0             	pushl  -0x20(%ebp)
801019b3:	e8 68 30 00 00       	call   80104a20 <memmove>
    brelse(bp);
801019b8:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019bb:	89 14 24             	mov    %edx,(%esp)
801019be:	e8 1d e8 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019c3:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019c6:	83 c4 10             	add    $0x10,%esp
801019c9:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019cc:	77 9a                	ja     80101968 <readi+0x58>
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
801019ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
801019d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019d4:	5b                   	pop    %ebx
801019d5:	5e                   	pop    %esi
801019d6:	5f                   	pop    %edi
801019d7:	5d                   	pop    %ebp
801019d8:	c3                   	ret    
801019d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019e0:	29 f0                	sub    %esi,%eax
801019e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801019e5:	e9 70 ff ff ff       	jmp    8010195a <readi+0x4a>
801019ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
801019f0:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019f4:	66 83 f8 09          	cmp    $0x9,%ax
801019f8:	77 1e                	ja     80101a18 <readi+0x108>
801019fa:	8b 04 c5 00 1a 11 80 	mov    -0x7feee600(,%eax,8),%eax
80101a01:	85 c0                	test   %eax,%eax
80101a03:	74 13                	je     80101a18 <readi+0x108>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a05:	89 7d 10             	mov    %edi,0x10(%ebp)
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a0b:	5b                   	pop    %ebx
80101a0c:	5e                   	pop    %esi
80101a0d:	5f                   	pop    %edi
80101a0e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a0f:	ff e0                	jmp    *%eax
80101a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a1d:	eb b2                	jmp    801019d1 <readi+0xc1>
80101a1f:	90                   	nop

80101a20 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a20:	55                   	push   %ebp
80101a21:	89 e5                	mov    %esp,%ebp
80101a23:	57                   	push   %edi
80101a24:	56                   	push   %esi
80101a25:	53                   	push   %ebx
80101a26:	83 ec 1c             	sub    $0x1c,%esp
80101a29:	8b 45 08             	mov    0x8(%ebp),%eax
80101a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a2f:	8b 55 14             	mov    0x14(%ebp),%edx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a32:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a37:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a3a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a3d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a40:	89 55 e0             	mov    %edx,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a43:	0f 84 b7 00 00 00    	je     80101b00 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a49:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a4c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a4f:	0f 82 eb 00 00 00    	jb     80101b40 <writei+0x120>
80101a55:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101a58:	89 d0                	mov    %edx,%eax
80101a5a:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a5c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a61:	0f 87 d9 00 00 00    	ja     80101b40 <writei+0x120>
80101a67:	39 c6                	cmp    %eax,%esi
80101a69:	0f 87 d1 00 00 00    	ja     80101b40 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a6f:	85 d2                	test   %edx,%edx
80101a71:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a78:	74 7b                	je     80101af5 <writei+0xd5>
80101a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a80:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a83:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a85:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a8a:	c1 ea 09             	shr    $0x9,%edx
80101a8d:	89 f8                	mov    %edi,%eax
80101a8f:	e8 2c f8 ff ff       	call   801012c0 <bmap>
80101a94:	83 ec 08             	sub    $0x8,%esp
80101a97:	50                   	push   %eax
80101a98:	ff 37                	pushl  (%edi)
80101a9a:	e8 31 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101a9f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101aa2:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aa5:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101aa7:	89 f0                	mov    %esi,%eax
80101aa9:	83 c4 10             	add    $0x10,%esp
80101aac:	25 ff 01 00 00       	and    $0x1ff,%eax
80101ab1:	29 c3                	sub    %eax,%ebx
80101ab3:	39 cb                	cmp    %ecx,%ebx
80101ab5:	76 02                	jbe    80101ab9 <writei+0x99>
80101ab7:	89 cb                	mov    %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ab9:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101abd:	83 ec 04             	sub    $0x4,%esp
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ac0:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101ac2:	53                   	push   %ebx
80101ac3:	ff 75 dc             	pushl  -0x24(%ebp)
80101ac6:	50                   	push   %eax
80101ac7:	e8 54 2f 00 00       	call   80104a20 <memmove>
    log_write(bp);
80101acc:	89 3c 24             	mov    %edi,(%esp)
80101acf:	e8 2c 12 00 00       	call   80102d00 <log_write>
    brelse(bp);
80101ad4:	89 3c 24             	mov    %edi,(%esp)
80101ad7:	e8 04 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101adc:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101adf:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101ae2:	83 c4 10             	add    $0x10,%esp
80101ae5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101ae8:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101aeb:	77 93                	ja     80101a80 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101aed:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101af0:	39 70 58             	cmp    %esi,0x58(%eax)
80101af3:	72 33                	jb     80101b28 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101af5:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101af8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101afb:	5b                   	pop    %ebx
80101afc:	5e                   	pop    %esi
80101afd:	5f                   	pop    %edi
80101afe:	5d                   	pop    %ebp
80101aff:	c3                   	ret    
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b00:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b04:	66 83 f8 09          	cmp    $0x9,%ax
80101b08:	77 36                	ja     80101b40 <writei+0x120>
80101b0a:	8b 04 c5 04 1a 11 80 	mov    -0x7feee5fc(,%eax,8),%eax
80101b11:	85 c0                	test   %eax,%eax
80101b13:	74 2b                	je     80101b40 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b15:	89 55 10             	mov    %edx,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b1b:	5b                   	pop    %ebx
80101b1c:	5e                   	pop    %esi
80101b1d:	5f                   	pop    %edi
80101b1e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b1f:	ff e0                	jmp    *%eax
80101b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b28:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b2b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b2e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b31:	50                   	push   %eax
80101b32:	e8 69 fa ff ff       	call   801015a0 <iupdate>
80101b37:	83 c4 10             	add    $0x10,%esp
80101b3a:	eb b9                	jmp    80101af5 <writei+0xd5>
80101b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b45:	eb b1                	jmp    80101af8 <writei+0xd8>
80101b47:	89 f6                	mov    %esi,%esi
80101b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b50 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b50:	55                   	push   %ebp
80101b51:	89 e5                	mov    %esp,%ebp
80101b53:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b56:	6a 0e                	push   $0xe
80101b58:	ff 75 0c             	pushl  0xc(%ebp)
80101b5b:	ff 75 08             	pushl  0x8(%ebp)
80101b5e:	e8 3d 2f 00 00       	call   80104aa0 <strncmp>
}
80101b63:	c9                   	leave  
80101b64:	c3                   	ret    
80101b65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	57                   	push   %edi
80101b74:	56                   	push   %esi
80101b75:	53                   	push   %ebx
80101b76:	83 ec 1c             	sub    $0x1c,%esp
80101b79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101b7c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b81:	0f 85 80 00 00 00    	jne    80101c07 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101b87:	8b 53 58             	mov    0x58(%ebx),%edx
80101b8a:	31 ff                	xor    %edi,%edi
80101b8c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b8f:	85 d2                	test   %edx,%edx
80101b91:	75 0d                	jne    80101ba0 <dirlookup+0x30>
80101b93:	eb 5b                	jmp    80101bf0 <dirlookup+0x80>
80101b95:	8d 76 00             	lea    0x0(%esi),%esi
80101b98:	83 c7 10             	add    $0x10,%edi
80101b9b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101b9e:	76 50                	jbe    80101bf0 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ba0:	6a 10                	push   $0x10
80101ba2:	57                   	push   %edi
80101ba3:	56                   	push   %esi
80101ba4:	53                   	push   %ebx
80101ba5:	e8 66 fd ff ff       	call   80101910 <readi>
80101baa:	83 c4 10             	add    $0x10,%esp
80101bad:	83 f8 10             	cmp    $0x10,%eax
80101bb0:	75 48                	jne    80101bfa <dirlookup+0x8a>
      panic("dirlink read");
    if(de.inum == 0)
80101bb2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bb7:	74 df                	je     80101b98 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101bb9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bbc:	83 ec 04             	sub    $0x4,%esp
80101bbf:	6a 0e                	push   $0xe
80101bc1:	50                   	push   %eax
80101bc2:	ff 75 0c             	pushl  0xc(%ebp)
80101bc5:	e8 d6 2e 00 00       	call   80104aa0 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101bca:	83 c4 10             	add    $0x10,%esp
80101bcd:	85 c0                	test   %eax,%eax
80101bcf:	75 c7                	jne    80101b98 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101bd1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bd4:	85 c0                	test   %eax,%eax
80101bd6:	74 05                	je     80101bdd <dirlookup+0x6d>
        *poff = off;
80101bd8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bdb:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101bdd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101be1:	8b 03                	mov    (%ebx),%eax
80101be3:	e8 08 f6 ff ff       	call   801011f0 <iget>
    }
  }

  return 0;
}
80101be8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101beb:	5b                   	pop    %ebx
80101bec:	5e                   	pop    %esi
80101bed:	5f                   	pop    %edi
80101bee:	5d                   	pop    %ebp
80101bef:	c3                   	ret    
80101bf0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101bf3:	31 c0                	xor    %eax,%eax
}
80101bf5:	5b                   	pop    %ebx
80101bf6:	5e                   	pop    %esi
80101bf7:	5f                   	pop    %edi
80101bf8:	5d                   	pop    %ebp
80101bf9:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101bfa:	83 ec 0c             	sub    $0xc,%esp
80101bfd:	68 95 77 10 80       	push   $0x80107795
80101c02:	e8 69 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c07:	83 ec 0c             	sub    $0xc,%esp
80101c0a:	68 83 77 10 80       	push   $0x80107783
80101c0f:	e8 5c e7 ff ff       	call   80100370 <panic>
80101c14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c20 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c20:	55                   	push   %ebp
80101c21:	89 e5                	mov    %esp,%ebp
80101c23:	57                   	push   %edi
80101c24:	56                   	push   %esi
80101c25:	53                   	push   %ebx
80101c26:	89 ce                	mov    %ecx,%esi
80101c28:	89 c3                	mov    %eax,%ebx
80101c2a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c2d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c30:	89 55 dc             	mov    %edx,-0x24(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c33:	0f 84 4e 01 00 00    	je     80101d87 <namex+0x167>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c3f:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c42:	8b 78 68             	mov    0x68(%eax),%edi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c45:	68 c0 1a 11 80       	push   $0x80111ac0
80101c4a:	e8 a1 2b 00 00       	call   801047f0 <acquire>
  ip->ref++;
80101c4f:	83 47 08 01          	addl   $0x1,0x8(%edi)
  release(&icache.lock);
80101c53:	c7 04 24 c0 1a 11 80 	movl   $0x80111ac0,(%esp)
80101c5a:	e8 c1 2c 00 00       	call   80104920 <release>
80101c5f:	83 c4 10             	add    $0x10,%esp
80101c62:	eb 07                	jmp    80101c6b <namex+0x4b>
80101c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101c68:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101c6b:	0f b6 03             	movzbl (%ebx),%eax
80101c6e:	3c 2f                	cmp    $0x2f,%al
80101c70:	74 f6                	je     80101c68 <namex+0x48>
    path++;
  if(*path == 0)
80101c72:	84 c0                	test   %al,%al
80101c74:	0f 84 de 00 00 00    	je     80101d58 <namex+0x138>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101c7a:	0f b6 03             	movzbl (%ebx),%eax
80101c7d:	84 c0                	test   %al,%al
80101c7f:	0f 84 aa 00 00 00    	je     80101d2f <namex+0x10f>
80101c85:	3c 2f                	cmp    $0x2f,%al
80101c87:	0f 84 a2 00 00 00    	je     80101d2f <namex+0x10f>
80101c8d:	89 da                	mov    %ebx,%edx
80101c8f:	eb 0b                	jmp    80101c9c <namex+0x7c>
80101c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c98:	3c 2f                	cmp    $0x2f,%al
80101c9a:	74 0a                	je     80101ca6 <namex+0x86>
    path++;
80101c9c:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101c9f:	0f b6 02             	movzbl (%edx),%eax
80101ca2:	84 c0                	test   %al,%al
80101ca4:	75 f2                	jne    80101c98 <namex+0x78>
80101ca6:	89 d1                	mov    %edx,%ecx
80101ca8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cab:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101cae:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101cb0:	83 f9 0d             	cmp    $0xd,%ecx
80101cb3:	0f 8e 7f 00 00 00    	jle    80101d38 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cb9:	83 ec 04             	sub    $0x4,%esp
80101cbc:	6a 0e                	push   $0xe
80101cbe:	53                   	push   %ebx
80101cbf:	56                   	push   %esi
80101cc0:	e8 5b 2d 00 00       	call   80104a20 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cc5:	8b 55 e0             	mov    -0x20(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101cc8:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101ccb:	89 d3                	mov    %edx,%ebx
80101ccd:	eb 04                	jmp    80101cd3 <namex+0xb3>
80101ccf:	90                   	nop
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
    path++;
80101cd0:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cd3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cd6:	74 f8                	je     80101cd0 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101cd8:	83 ec 0c             	sub    $0xc,%esp
80101cdb:	57                   	push   %edi
80101cdc:	e8 6f f9 ff ff       	call   80101650 <ilock>
    if(ip->type != T_DIR){
80101ce1:	83 c4 10             	add    $0x10,%esp
80101ce4:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80101ce9:	75 7e                	jne    80101d69 <namex+0x149>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101ceb:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101cee:	85 d2                	test   %edx,%edx
80101cf0:	74 09                	je     80101cfb <namex+0xdb>
80101cf2:	80 3b 00             	cmpb   $0x0,(%ebx)
80101cf5:	0f 84 a2 00 00 00    	je     80101d9d <namex+0x17d>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	6a 00                	push   $0x0
80101d00:	56                   	push   %esi
80101d01:	57                   	push   %edi
80101d02:	e8 69 fe ff ff       	call   80101b70 <dirlookup>
80101d07:	83 c4 10             	add    $0x10,%esp
80101d0a:	85 c0                	test   %eax,%eax
80101d0c:	74 5b                	je     80101d69 <namex+0x149>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d0e:	83 ec 0c             	sub    $0xc,%esp
80101d11:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d14:	57                   	push   %edi
80101d15:	e8 16 fa ff ff       	call   80101730 <iunlock>
  iput(ip);
80101d1a:	89 3c 24             	mov    %edi,(%esp)
80101d1d:	e8 5e fa ff ff       	call   80101780 <iput>
80101d22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d25:	83 c4 10             	add    $0x10,%esp
80101d28:	89 c7                	mov    %eax,%edi
80101d2a:	e9 3c ff ff ff       	jmp    80101c6b <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d2f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80101d32:	31 c9                	xor    %ecx,%ecx
80101d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d38:	83 ec 04             	sub    $0x4,%esp
80101d3b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101d3e:	51                   	push   %ecx
80101d3f:	53                   	push   %ebx
80101d40:	56                   	push   %esi
80101d41:	e8 da 2c 00 00       	call   80104a20 <memmove>
    name[len] = 0;
80101d46:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101d49:	83 c4 10             	add    $0x10,%esp
80101d4c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101d4f:	c6 04 0e 00          	movb   $0x0,(%esi,%ecx,1)
80101d53:	e9 7b ff ff ff       	jmp    80101cd3 <namex+0xb3>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d58:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101d5b:	85 c0                	test   %eax,%eax
80101d5d:	75 54                	jne    80101db3 <namex+0x193>
80101d5f:	89 f8                	mov    %edi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101d61:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d64:	5b                   	pop    %ebx
80101d65:	5e                   	pop    %esi
80101d66:	5f                   	pop    %edi
80101d67:	5d                   	pop    %ebp
80101d68:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d69:	83 ec 0c             	sub    $0xc,%esp
80101d6c:	57                   	push   %edi
80101d6d:	e8 be f9 ff ff       	call   80101730 <iunlock>
  iput(ip);
80101d72:	89 3c 24             	mov    %edi,(%esp)
80101d75:	e8 06 fa ff ff       	call   80101780 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101d7a:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101d7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101d80:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101d82:	5b                   	pop    %ebx
80101d83:	5e                   	pop    %esi
80101d84:	5f                   	pop    %edi
80101d85:	5d                   	pop    %ebp
80101d86:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101d87:	ba 01 00 00 00       	mov    $0x1,%edx
80101d8c:	b8 01 00 00 00       	mov    $0x1,%eax
80101d91:	e8 5a f4 ff ff       	call   801011f0 <iget>
80101d96:	89 c7                	mov    %eax,%edi
80101d98:	e9 ce fe ff ff       	jmp    80101c6b <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101d9d:	83 ec 0c             	sub    $0xc,%esp
80101da0:	57                   	push   %edi
80101da1:	e8 8a f9 ff ff       	call   80101730 <iunlock>
      return ip;
80101da6:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101da9:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101dac:	89 f8                	mov    %edi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dae:	5b                   	pop    %ebx
80101daf:	5e                   	pop    %esi
80101db0:	5f                   	pop    %edi
80101db1:	5d                   	pop    %ebp
80101db2:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101db3:	83 ec 0c             	sub    $0xc,%esp
80101db6:	57                   	push   %edi
80101db7:	e8 c4 f9 ff ff       	call   80101780 <iput>
    return 0;
80101dbc:	83 c4 10             	add    $0x10,%esp
80101dbf:	31 c0                	xor    %eax,%eax
80101dc1:	eb 9e                	jmp    80101d61 <namex+0x141>
80101dc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101dd0 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101dd0:	55                   	push   %ebp
80101dd1:	89 e5                	mov    %esp,%ebp
80101dd3:	57                   	push   %edi
80101dd4:	56                   	push   %esi
80101dd5:	53                   	push   %ebx
80101dd6:	83 ec 20             	sub    $0x20,%esp
80101dd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101ddc:	6a 00                	push   $0x0
80101dde:	ff 75 0c             	pushl  0xc(%ebp)
80101de1:	53                   	push   %ebx
80101de2:	e8 89 fd ff ff       	call   80101b70 <dirlookup>
80101de7:	83 c4 10             	add    $0x10,%esp
80101dea:	85 c0                	test   %eax,%eax
80101dec:	75 67                	jne    80101e55 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101dee:	8b 7b 58             	mov    0x58(%ebx),%edi
80101df1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101df4:	85 ff                	test   %edi,%edi
80101df6:	74 29                	je     80101e21 <dirlink+0x51>
80101df8:	31 ff                	xor    %edi,%edi
80101dfa:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101dfd:	eb 09                	jmp    80101e08 <dirlink+0x38>
80101dff:	90                   	nop
80101e00:	83 c7 10             	add    $0x10,%edi
80101e03:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e06:	76 19                	jbe    80101e21 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e08:	6a 10                	push   $0x10
80101e0a:	57                   	push   %edi
80101e0b:	56                   	push   %esi
80101e0c:	53                   	push   %ebx
80101e0d:	e8 fe fa ff ff       	call   80101910 <readi>
80101e12:	83 c4 10             	add    $0x10,%esp
80101e15:	83 f8 10             	cmp    $0x10,%eax
80101e18:	75 4e                	jne    80101e68 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e1a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e1f:	75 df                	jne    80101e00 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e21:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e24:	83 ec 04             	sub    $0x4,%esp
80101e27:	6a 0e                	push   $0xe
80101e29:	ff 75 0c             	pushl  0xc(%ebp)
80101e2c:	50                   	push   %eax
80101e2d:	e8 de 2c 00 00       	call   80104b10 <strncpy>
  de.inum = inum;
80101e32:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e35:	6a 10                	push   $0x10
80101e37:	57                   	push   %edi
80101e38:	56                   	push   %esi
80101e39:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e3a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e3e:	e8 dd fb ff ff       	call   80101a20 <writei>
80101e43:	83 c4 20             	add    $0x20,%esp
80101e46:	83 f8 10             	cmp    $0x10,%eax
80101e49:	75 2a                	jne    80101e75 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e4b:	31 c0                	xor    %eax,%eax
}
80101e4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e50:	5b                   	pop    %ebx
80101e51:	5e                   	pop    %esi
80101e52:	5f                   	pop    %edi
80101e53:	5d                   	pop    %ebp
80101e54:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101e55:	83 ec 0c             	sub    $0xc,%esp
80101e58:	50                   	push   %eax
80101e59:	e8 22 f9 ff ff       	call   80101780 <iput>
    return -1;
80101e5e:	83 c4 10             	add    $0x10,%esp
80101e61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e66:	eb e5                	jmp    80101e4d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101e68:	83 ec 0c             	sub    $0xc,%esp
80101e6b:	68 95 77 10 80       	push   $0x80107795
80101e70:	e8 fb e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101e75:	83 ec 0c             	sub    $0xc,%esp
80101e78:	68 1a 7e 10 80       	push   $0x80107e1a
80101e7d:	e8 ee e4 ff ff       	call   80100370 <panic>
80101e82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e90 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101e90:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101e91:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101e93:	89 e5                	mov    %esp,%ebp
80101e95:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101e98:	8b 45 08             	mov    0x8(%ebp),%eax
80101e9b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101e9e:	e8 7d fd ff ff       	call   80101c20 <namex>
}
80101ea3:	c9                   	leave  
80101ea4:	c3                   	ret    
80101ea5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101eb0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101eb0:	55                   	push   %ebp
  return namex(path, 1, name);
80101eb1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101eb6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101eb8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101ebb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101ebe:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101ebf:	e9 5c fd ff ff       	jmp    80101c20 <namex>
80101ec4:	66 90                	xchg   %ax,%ax
80101ec6:	66 90                	xchg   %ax,%ax
80101ec8:	66 90                	xchg   %ax,%ax
80101eca:	66 90                	xchg   %ax,%ax
80101ecc:	66 90                	xchg   %ax,%ax
80101ece:	66 90                	xchg   %ax,%ax

80101ed0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ed0:	55                   	push   %ebp
  if(b == 0)
80101ed1:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101ed3:	89 c1                	mov    %eax,%ecx
80101ed5:	89 e5                	mov    %esp,%ebp
80101ed7:	56                   	push   %esi
80101ed8:	53                   	push   %ebx
  if(b == 0)
80101ed9:	0f 84 9d 00 00 00    	je     80101f7c <idestart+0xac>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101edf:	8b 58 08             	mov    0x8(%eax),%ebx
80101ee2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101ee8:	0f 87 81 00 00 00    	ja     80101f6f <idestart+0x9f>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101eee:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ef3:	90                   	nop
80101ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ef8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101ef9:	83 e0 c0             	and    $0xffffffc0,%eax
80101efc:	3c 40                	cmp    $0x40,%al
80101efe:	75 f8                	jne    80101ef8 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f00:	31 f6                	xor    %esi,%esi
80101f02:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f07:	89 f0                	mov    %esi,%eax
80101f09:	ee                   	out    %al,(%dx)
80101f0a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f0f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f14:	ee                   	out    %al,(%dx)
80101f15:	b2 f3                	mov    $0xf3,%dl
80101f17:	89 d8                	mov    %ebx,%eax
80101f19:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f1a:	89 d8                	mov    %ebx,%eax
80101f1c:	b2 f4                	mov    $0xf4,%dl
80101f1e:	c1 f8 08             	sar    $0x8,%eax
80101f21:	ee                   	out    %al,(%dx)
80101f22:	b2 f5                	mov    $0xf5,%dl
80101f24:	89 f0                	mov    %esi,%eax
80101f26:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f27:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f2b:	b2 f6                	mov    $0xf6,%dl
80101f2d:	83 e0 01             	and    $0x1,%eax
80101f30:	c1 e0 04             	shl    $0x4,%eax
80101f33:	83 c8 e0             	or     $0xffffffe0,%eax
80101f36:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101f37:	f6 01 04             	testb  $0x4,(%ecx)
80101f3a:	75 14                	jne    80101f50 <idestart+0x80>
80101f3c:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f41:	b8 20 00 00 00       	mov    $0x20,%eax
80101f46:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f47:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f4a:	5b                   	pop    %ebx
80101f4b:	5e                   	pop    %esi
80101f4c:	5d                   	pop    %ebp
80101f4d:	c3                   	ret    
80101f4e:	66 90                	xchg   %ax,%ax
80101f50:	b2 f7                	mov    $0xf7,%dl
80101f52:	b8 30 00 00 00       	mov    $0x30,%eax
80101f57:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101f58:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101f5d:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f60:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f65:	fc                   	cld    
80101f66:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f68:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f6b:	5b                   	pop    %ebx
80101f6c:	5e                   	pop    %esi
80101f6d:	5d                   	pop    %ebp
80101f6e:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101f6f:	83 ec 0c             	sub    $0xc,%esp
80101f72:	68 00 78 10 80       	push   $0x80107800
80101f77:	e8 f4 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101f7c:	83 ec 0c             	sub    $0xc,%esp
80101f7f:	68 f7 77 10 80       	push   $0x801077f7
80101f84:	e8 e7 e3 ff ff       	call   80100370 <panic>
80101f89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101f90 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101f90:	55                   	push   %ebp
80101f91:	89 e5                	mov    %esp,%ebp
80101f93:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101f96:	68 12 78 10 80       	push   $0x80107812
80101f9b:	68 a0 b5 10 80       	push   $0x8010b5a0
80101fa0:	e8 cb 27 00 00       	call   80104770 <initlock>
  picenable(IRQ_IDE);
80101fa5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80101fac:	e8 2f 12 00 00       	call   801031e0 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fb1:	58                   	pop    %eax
80101fb2:	a1 a0 3e 11 80       	mov    0x80113ea0,%eax
80101fb7:	5a                   	pop    %edx
80101fb8:	83 e8 01             	sub    $0x1,%eax
80101fbb:	50                   	push   %eax
80101fbc:	6a 0e                	push   $0xe
80101fbe:	e8 bd 02 00 00       	call   80102280 <ioapicenable>
80101fc3:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fc6:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fcb:	90                   	nop
80101fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fd0:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101fd1:	83 e0 c0             	and    $0xffffffc0,%eax
80101fd4:	3c 40                	cmp    $0x40,%al
80101fd6:	75 f8                	jne    80101fd0 <ideinit+0x40>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101fd8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fdd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101fe2:	ee                   	out    %al,(%dx)
80101fe3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fe8:	b2 f7                	mov    $0xf7,%dl
80101fea:	eb 09                	jmp    80101ff5 <ideinit+0x65>
80101fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80101ff0:	83 e9 01             	sub    $0x1,%ecx
80101ff3:	74 0f                	je     80102004 <ideinit+0x74>
80101ff5:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80101ff6:	84 c0                	test   %al,%al
80101ff8:	74 f6                	je     80101ff0 <ideinit+0x60>
      havedisk1 = 1;
80101ffa:	c7 05 80 b5 10 80 01 	movl   $0x1,0x8010b580
80102001:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102004:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102009:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010200e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010200f:	c9                   	leave  
80102010:	c3                   	ret    
80102011:	eb 0d                	jmp    80102020 <ideintr>
80102013:	90                   	nop
80102014:	90                   	nop
80102015:	90                   	nop
80102016:	90                   	nop
80102017:	90                   	nop
80102018:	90                   	nop
80102019:	90                   	nop
8010201a:	90                   	nop
8010201b:	90                   	nop
8010201c:	90                   	nop
8010201d:	90                   	nop
8010201e:	90                   	nop
8010201f:	90                   	nop

80102020 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102020:	55                   	push   %ebp
80102021:	89 e5                	mov    %esp,%ebp
80102023:	57                   	push   %edi
80102024:	56                   	push   %esi
80102025:	53                   	push   %ebx
80102026:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102029:	68 a0 b5 10 80       	push   $0x8010b5a0
8010202e:	e8 bd 27 00 00       	call   801047f0 <acquire>
  if((b = idequeue) == 0){
80102033:	8b 1d 84 b5 10 80    	mov    0x8010b584,%ebx
80102039:	83 c4 10             	add    $0x10,%esp
8010203c:	85 db                	test   %ebx,%ebx
8010203e:	74 34                	je     80102074 <ideintr+0x54>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
80102040:	8b 43 58             	mov    0x58(%ebx),%eax
80102043:	a3 84 b5 10 80       	mov    %eax,0x8010b584

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102048:	8b 33                	mov    (%ebx),%esi
8010204a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102050:	74 3e                	je     80102090 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102052:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102055:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102058:	83 ce 02             	or     $0x2,%esi
8010205b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010205d:	53                   	push   %ebx
8010205e:	e8 9d 1f 00 00       	call   80104000 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102063:	a1 84 b5 10 80       	mov    0x8010b584,%eax
80102068:	83 c4 10             	add    $0x10,%esp
8010206b:	85 c0                	test   %eax,%eax
8010206d:	74 05                	je     80102074 <ideintr+0x54>
    idestart(idequeue);
8010206f:	e8 5c fe ff ff       	call   80101ed0 <idestart>
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
80102074:	83 ec 0c             	sub    $0xc,%esp
80102077:	68 a0 b5 10 80       	push   $0x8010b5a0
8010207c:	e8 9f 28 00 00       	call   80104920 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
80102081:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102084:	5b                   	pop    %ebx
80102085:	5e                   	pop    %esi
80102086:	5f                   	pop    %edi
80102087:	5d                   	pop    %ebp
80102088:	c3                   	ret    
80102089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102090:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102095:	8d 76 00             	lea    0x0(%esi),%esi
80102098:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102099:	89 c1                	mov    %eax,%ecx
8010209b:	83 e1 c0             	and    $0xffffffc0,%ecx
8010209e:	80 f9 40             	cmp    $0x40,%cl
801020a1:	75 f5                	jne    80102098 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020a3:	a8 21                	test   $0x21,%al
801020a5:	75 ab                	jne    80102052 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020a7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020aa:	b9 80 00 00 00       	mov    $0x80,%ecx
801020af:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020b4:	fc                   	cld    
801020b5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020b7:	8b 33                	mov    (%ebx),%esi
801020b9:	eb 97                	jmp    80102052 <ideintr+0x32>
801020bb:	90                   	nop
801020bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020c0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020c0:	55                   	push   %ebp
801020c1:	89 e5                	mov    %esp,%ebp
801020c3:	53                   	push   %ebx
801020c4:	83 ec 10             	sub    $0x10,%esp
801020c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020ca:	8d 43 0c             	lea    0xc(%ebx),%eax
801020cd:	50                   	push   %eax
801020ce:	e8 6d 26 00 00       	call   80104740 <holdingsleep>
801020d3:	83 c4 10             	add    $0x10,%esp
801020d6:	85 c0                	test   %eax,%eax
801020d8:	0f 84 ad 00 00 00    	je     8010218b <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801020de:	8b 03                	mov    (%ebx),%eax
801020e0:	83 e0 06             	and    $0x6,%eax
801020e3:	83 f8 02             	cmp    $0x2,%eax
801020e6:	0f 84 b9 00 00 00    	je     801021a5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
801020ec:	8b 53 04             	mov    0x4(%ebx),%edx
801020ef:	85 d2                	test   %edx,%edx
801020f1:	74 0d                	je     80102100 <iderw+0x40>
801020f3:	a1 80 b5 10 80       	mov    0x8010b580,%eax
801020f8:	85 c0                	test   %eax,%eax
801020fa:	0f 84 98 00 00 00    	je     80102198 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102100:	83 ec 0c             	sub    $0xc,%esp
80102103:	68 a0 b5 10 80       	push   $0x8010b5a0
80102108:	e8 e3 26 00 00       	call   801047f0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010210d:	a1 84 b5 10 80       	mov    0x8010b584,%eax
80102112:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102115:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010211c:	85 c0                	test   %eax,%eax
8010211e:	75 0a                	jne    8010212a <iderw+0x6a>
80102120:	eb 59                	jmp    8010217b <iderw+0xbb>
80102122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102128:	89 d0                	mov    %edx,%eax
8010212a:	8b 50 58             	mov    0x58(%eax),%edx
8010212d:	85 d2                	test   %edx,%edx
8010212f:	75 f7                	jne    80102128 <iderw+0x68>
80102131:	83 c0 58             	add    $0x58,%eax
    ;
  *pp = b;
80102134:	89 18                	mov    %ebx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
80102136:	39 1d 84 b5 10 80    	cmp    %ebx,0x8010b584
8010213c:	74 44                	je     80102182 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010213e:	8b 03                	mov    (%ebx),%eax
80102140:	83 e0 06             	and    $0x6,%eax
80102143:	83 f8 02             	cmp    $0x2,%eax
80102146:	74 23                	je     8010216b <iderw+0xab>
80102148:	90                   	nop
80102149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102150:	83 ec 08             	sub    $0x8,%esp
80102153:	68 a0 b5 10 80       	push   $0x8010b5a0
80102158:	53                   	push   %ebx
80102159:	e8 f2 1c 00 00       	call   80103e50 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010215e:	8b 13                	mov    (%ebx),%edx
80102160:	83 c4 10             	add    $0x10,%esp
80102163:	83 e2 06             	and    $0x6,%edx
80102166:	83 fa 02             	cmp    $0x2,%edx
80102169:	75 e5                	jne    80102150 <iderw+0x90>
    sleep(b, &idelock);
  }

  release(&idelock);
8010216b:	c7 45 08 a0 b5 10 80 	movl   $0x8010b5a0,0x8(%ebp)
}
80102172:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102175:	c9                   	leave  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }

  release(&idelock);
80102176:	e9 a5 27 00 00       	jmp    80104920 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010217b:	b8 84 b5 10 80       	mov    $0x8010b584,%eax
80102180:	eb b2                	jmp    80102134 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
80102182:	89 d8                	mov    %ebx,%eax
80102184:	e8 47 fd ff ff       	call   80101ed0 <idestart>
80102189:	eb b3                	jmp    8010213e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
8010218b:	83 ec 0c             	sub    $0xc,%esp
8010218e:	68 16 78 10 80       	push   $0x80107816
80102193:	e8 d8 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 41 78 10 80       	push   $0x80107841
801021a0:	e8 cb e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 2c 78 10 80       	push   $0x8010782c
801021ad:	e8 be e1 ff ff       	call   80100370 <panic>
801021b2:	66 90                	xchg   %ax,%ax
801021b4:	66 90                	xchg   %ax,%ax
801021b6:	66 90                	xchg   %ax,%ax
801021b8:	66 90                	xchg   %ax,%ax
801021ba:	66 90                	xchg   %ax,%ax
801021bc:	66 90                	xchg   %ax,%ax
801021be:	66 90                	xchg   %ax,%ax

801021c0 <ioapicinit>:
void
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
801021c0:	a1 84 38 11 80       	mov    0x80113884,%eax
801021c5:	85 c0                	test   %eax,%eax
801021c7:	0f 84 a8 00 00 00    	je     80102275 <ioapicinit+0xb5>
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021cd:	55                   	push   %ebp
  int i, id, maxintr;

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
801021ce:	c7 05 14 37 11 80 00 	movl   $0xfec00000,0x80113714
801021d5:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
801021d8:	89 e5                	mov    %esp,%ebp
801021da:	56                   	push   %esi
801021db:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
801021dc:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021e3:	00 00 00 
  return ioapic->data;
801021e6:	8b 15 14 37 11 80    	mov    0x80113714,%edx
801021ec:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
801021ef:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
801021f5:	8b 0d 14 37 11 80    	mov    0x80113714,%ecx
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801021fb:	0f b6 15 80 38 11 80 	movzbl 0x80113880,%edx

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102202:	89 f0                	mov    %esi,%eax
80102204:	c1 e8 10             	shr    $0x10,%eax
80102207:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
8010220a:	8b 41 10             	mov    0x10(%ecx),%eax
  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
8010220d:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102210:	39 c2                	cmp    %eax,%edx
80102212:	74 16                	je     8010222a <ioapicinit+0x6a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 60 78 10 80       	push   $0x80107860
8010221c:	e8 3f e4 ff ff       	call   80100660 <cprintf>
80102221:	8b 0d 14 37 11 80    	mov    0x80113714,%ecx
80102227:	83 c4 10             	add    $0x10,%esp
8010222a:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010222d:	ba 10 00 00 00       	mov    $0x10,%edx
80102232:	b8 20 00 00 00       	mov    $0x20,%eax
80102237:	89 f6                	mov    %esi,%esi
80102239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102240:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102242:	8b 0d 14 37 11 80    	mov    0x80113714,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102248:	89 c3                	mov    %eax,%ebx
8010224a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102250:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102253:	89 59 10             	mov    %ebx,0x10(%ecx)
80102256:	8d 5a 01             	lea    0x1(%edx),%ebx
80102259:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010225c:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010225e:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
80102260:	8b 0d 14 37 11 80    	mov    0x80113714,%ecx
80102266:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010226d:	75 d1                	jne    80102240 <ioapicinit+0x80>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010226f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102272:	5b                   	pop    %ebx
80102273:	5e                   	pop    %esi
80102274:	5d                   	pop    %ebp
80102275:	f3 c3                	repz ret 
80102277:	89 f6                	mov    %esi,%esi
80102279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102280 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
80102280:	8b 15 84 38 11 80    	mov    0x80113884,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
80102286:	55                   	push   %ebp
80102287:	89 e5                	mov    %esp,%ebp
  if(!ismp)
80102289:	85 d2                	test   %edx,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
8010228b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
8010228e:	74 2b                	je     801022bb <ioapicenable+0x3b>
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102290:	8b 0d 14 37 11 80    	mov    0x80113714,%ecx
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
80102296:	8d 50 20             	lea    0x20(%eax),%edx
80102299:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010229d:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
8010229f:	8b 0d 14 37 11 80    	mov    0x80113714,%ecx

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022a5:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022a8:	89 51 10             	mov    %edx,0x10(%ecx)

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022ab:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022ae:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022b0:	a1 14 37 11 80       	mov    0x80113714,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022b5:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022b8:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801022bb:	5d                   	pop    %ebp
801022bc:	c3                   	ret    
801022bd:	66 90                	xchg   %ax,%ax
801022bf:	90                   	nop

801022c0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801022c0:	55                   	push   %ebp
801022c1:	89 e5                	mov    %esp,%ebp
801022c3:	53                   	push   %ebx
801022c4:	83 ec 04             	sub    $0x4,%esp
801022c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;
 numFreePages++;
801022ca:	83 05 5c 37 11 80 01 	addl   $0x1,0x8011375c

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801022d1:	81 fb 48 69 11 80    	cmp    $0x80116948,%ebx
801022d7:	72 79                	jb     80102352 <kfree+0x92>
801022d9:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022df:	75 71                	jne    80102352 <kfree+0x92>
801022e1:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022e7:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022ec:	77 64                	ja     80102352 <kfree+0x92>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801022ee:	83 ec 04             	sub    $0x4,%esp
801022f1:	68 00 10 00 00       	push   $0x1000
801022f6:	6a 01                	push   $0x1
801022f8:	53                   	push   %ebx
801022f9:	e8 72 26 00 00       	call   80104970 <memset>

  if(kmem.use_lock)
801022fe:	8b 15 54 37 11 80    	mov    0x80113754,%edx
80102304:	83 c4 10             	add    $0x10,%esp
80102307:	85 d2                	test   %edx,%edx
80102309:	75 35                	jne    80102340 <kfree+0x80>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
8010230b:	a1 58 37 11 80       	mov    0x80113758,%eax
80102310:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
80102312:	a1 54 37 11 80       	mov    0x80113754,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102317:	89 1d 58 37 11 80    	mov    %ebx,0x80113758
  if(kmem.use_lock)
8010231d:	85 c0                	test   %eax,%eax
8010231f:	75 0f                	jne    80102330 <kfree+0x70>
    release(&kmem.lock);
}
80102321:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102324:	c9                   	leave  
80102325:	c3                   	ret    
80102326:	8d 76 00             	lea    0x0(%esi),%esi
80102329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102330:	c7 45 08 20 37 11 80 	movl   $0x80113720,0x8(%ebp)
}
80102337:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010233b:	e9 e0 25 00 00       	jmp    80104920 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102340:	83 ec 0c             	sub    $0xc,%esp
80102343:	68 20 37 11 80       	push   $0x80113720
80102348:	e8 a3 24 00 00       	call   801047f0 <acquire>
8010234d:	83 c4 10             	add    $0x10,%esp
80102350:	eb b9                	jmp    8010230b <kfree+0x4b>
{
  struct run *r;
 numFreePages++;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102352:	83 ec 0c             	sub    $0xc,%esp
80102355:	68 92 78 10 80       	push   $0x80107892
8010235a:	e8 11 e0 ff ff       	call   80100370 <panic>
8010235f:	90                   	nop

80102360 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
80102360:	55                   	push   %ebp
80102361:	89 e5                	mov    %esp,%ebp
80102363:	57                   	push   %edi
80102364:	56                   	push   %esi
80102365:	53                   	push   %ebx
80102366:	83 ec 0c             	sub    $0xc,%esp
80102369:	8b 7d 08             	mov    0x8(%ebp),%edi
8010236c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010236f:	8d 9f ff 0f 00 00    	lea    0xfff(%edi),%ebx
80102375:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010237b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102381:	39 de                	cmp    %ebx,%esi
80102383:	72 1f                	jb     801023a4 <freerange+0x44>
80102385:	8d 76 00             	lea    0x0(%esi),%esi
80102388:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
    kfree(p);
8010238e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102391:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102397:	50                   	push   %eax
80102398:	e8 23 ff ff ff       	call   801022c0 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	39 f3                	cmp    %esi,%ebx
801023a2:	76 e4                	jbe    80102388 <freerange+0x28>
    kfree(p);
  numFreePages = (vend - vstart) / PGSIZE;
801023a4:	29 fe                	sub    %edi,%esi
801023a6:	89 f0                	mov    %esi,%eax
801023a8:	c1 f8 1f             	sar    $0x1f,%eax
801023ab:	c1 e8 14             	shr    $0x14,%eax
801023ae:	01 c6                	add    %eax,%esi
801023b0:	c1 fe 0c             	sar    $0xc,%esi
801023b3:	89 35 5c 37 11 80    	mov    %esi,0x8011375c
}
801023b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801023bc:	5b                   	pop    %ebx
801023bd:	5e                   	pop    %esi
801023be:	5f                   	pop    %edi
801023bf:	5d                   	pop    %ebp
801023c0:	c3                   	ret    
801023c1:	eb 0d                	jmp    801023d0 <kinit1>
801023c3:	90                   	nop
801023c4:	90                   	nop
801023c5:	90                   	nop
801023c6:	90                   	nop
801023c7:	90                   	nop
801023c8:	90                   	nop
801023c9:	90                   	nop
801023ca:	90                   	nop
801023cb:	90                   	nop
801023cc:	90                   	nop
801023cd:	90                   	nop
801023ce:	90                   	nop
801023cf:	90                   	nop

801023d0 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801023d0:	55                   	push   %ebp
801023d1:	89 e5                	mov    %esp,%ebp
801023d3:	56                   	push   %esi
801023d4:	53                   	push   %ebx
801023d5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&kmem.lock, "kmem");
801023db:	83 ec 08             	sub    $0x8,%esp
801023de:	68 98 78 10 80       	push   $0x80107898
801023e3:	68 20 37 11 80       	push   $0x80113720
801023e8:	e8 83 23 00 00       	call   80104770 <initlock>
  kmem.use_lock = 0;
  freerange(vstart, vend);
801023ed:	89 75 0c             	mov    %esi,0xc(%ebp)
801023f0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801023f3:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
801023f6:	c7 05 54 37 11 80 00 	movl   $0x0,0x80113754
801023fd:	00 00 00 
  freerange(vstart, vend);
}
80102400:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102403:	5b                   	pop    %ebx
80102404:	5e                   	pop    %esi
80102405:	5d                   	pop    %ebp
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
80102406:	e9 55 ff ff ff       	jmp    80102360 <freerange>
8010240b:	90                   	nop
8010240c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102410 <kinit2>:
}

void
kinit2(void *vstart, void *vend)
{
80102410:	55                   	push   %ebp
80102411:	89 e5                	mov    %esp,%ebp
80102413:	83 ec 10             	sub    $0x10,%esp
  freerange(vstart, vend);
80102416:	ff 75 0c             	pushl  0xc(%ebp)
80102419:	ff 75 08             	pushl  0x8(%ebp)
8010241c:	e8 3f ff ff ff       	call   80102360 <freerange>
  kmem.use_lock = 1;
80102421:	c7 05 54 37 11 80 01 	movl   $0x1,0x80113754
80102428:	00 00 00 
8010242b:	83 c4 10             	add    $0x10,%esp
}
8010242e:	c9                   	leave  
8010242f:	c3                   	ret    

80102430 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	53                   	push   %ebx
80102434:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
80102437:	a1 54 37 11 80       	mov    0x80113754,%eax
8010243c:	85 c0                	test   %eax,%eax
8010243e:	75 38                	jne    80102478 <kalloc+0x48>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102440:	8b 1d 58 37 11 80    	mov    0x80113758,%ebx
  if(r){
80102446:	85 db                	test   %ebx,%ebx
80102448:	74 23                	je     8010246d <kalloc+0x3d>
    kmem.freelist = r->next;
8010244a:	8b 13                	mov    (%ebx),%edx
    numFreePages--;
8010244c:	83 2d 5c 37 11 80 01 	subl   $0x1,0x8011375c

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = kmem.freelist;
  if(r){
    kmem.freelist = r->next;
80102453:	89 15 58 37 11 80    	mov    %edx,0x80113758
    numFreePages--;
}
  if(kmem.use_lock)
80102459:	85 c0                	test   %eax,%eax
8010245b:	74 10                	je     8010246d <kalloc+0x3d>
    release(&kmem.lock);
8010245d:	83 ec 0c             	sub    $0xc,%esp
80102460:	68 20 37 11 80       	push   $0x80113720
80102465:	e8 b6 24 00 00       	call   80104920 <release>
8010246a:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
8010246d:	89 d8                	mov    %ebx,%eax
8010246f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102472:	c9                   	leave  
80102473:	c3                   	ret    
80102474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102478:	83 ec 0c             	sub    $0xc,%esp
8010247b:	68 20 37 11 80       	push   $0x80113720
80102480:	e8 6b 23 00 00       	call   801047f0 <acquire>
  r = kmem.freelist;
80102485:	8b 1d 58 37 11 80    	mov    0x80113758,%ebx
  if(r){
8010248b:	83 c4 10             	add    $0x10,%esp
8010248e:	a1 54 37 11 80       	mov    0x80113754,%eax
80102493:	85 db                	test   %ebx,%ebx
80102495:	75 b3                	jne    8010244a <kalloc+0x1a>
80102497:	eb c0                	jmp    80102459 <kalloc+0x29>
80102499:	66 90                	xchg   %ax,%ax
8010249b:	66 90                	xchg   %ax,%ax
8010249d:	66 90                	xchg   %ax,%ax
8010249f:	90                   	nop

801024a0 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
801024a0:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801024a1:	ba 64 00 00 00       	mov    $0x64,%edx
801024a6:	89 e5                	mov    %esp,%ebp
801024a8:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801024a9:	a8 01                	test   $0x1,%al
801024ab:	0f 84 af 00 00 00    	je     80102560 <kbdgetc+0xc0>
801024b1:	b2 60                	mov    $0x60,%dl
801024b3:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
801024b4:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
801024b7:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
801024bd:	0f 84 7d 00 00 00    	je     80102540 <kbdgetc+0xa0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801024c3:	84 c0                	test   %al,%al
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801024c5:	8b 0d d4 b5 10 80    	mov    0x8010b5d4,%ecx
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801024cb:	79 2b                	jns    801024f8 <kbdgetc+0x58>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801024cd:	f6 c1 40             	test   $0x40,%cl
801024d0:	75 05                	jne    801024d7 <kbdgetc+0x37>
801024d2:	89 c2                	mov    %eax,%edx
801024d4:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
801024d7:	0f b6 82 00 7a 10 80 	movzbl -0x7fef8600(%edx),%eax
801024de:	83 c8 40             	or     $0x40,%eax
801024e1:	0f b6 c0             	movzbl %al,%eax
801024e4:	f7 d0                	not    %eax
801024e6:	21 c8                	and    %ecx,%eax
801024e8:	a3 d4 b5 10 80       	mov    %eax,0x8010b5d4
    return 0;
801024ed:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801024ef:	5d                   	pop    %ebp
801024f0:	c3                   	ret    
801024f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
801024f8:	f6 c1 40             	test   $0x40,%cl
801024fb:	74 09                	je     80102506 <kbdgetc+0x66>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
801024fd:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102500:	83 e1 bf             	and    $0xffffffbf,%ecx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102503:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
80102506:	0f b6 82 00 7a 10 80 	movzbl -0x7fef8600(%edx),%eax
8010250d:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
8010250f:	0f b6 82 00 79 10 80 	movzbl -0x7fef8700(%edx),%eax
80102516:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
80102518:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
8010251a:	89 0d d4 b5 10 80    	mov    %ecx,0x8010b5d4
  c = charcode[shift & (CTL | SHIFT)][data];
80102520:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
80102523:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
80102526:	8b 04 85 c0 78 10 80 	mov    -0x7fef8740(,%eax,4),%eax
8010252d:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
80102531:	74 bc                	je     801024ef <kbdgetc+0x4f>
    if('a' <= c && c <= 'z')
80102533:	8d 50 9f             	lea    -0x61(%eax),%edx
80102536:	83 fa 19             	cmp    $0x19,%edx
80102539:	77 15                	ja     80102550 <kbdgetc+0xb0>
      c += 'A' - 'a';
8010253b:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
8010253e:	5d                   	pop    %ebp
8010253f:	c3                   	ret    
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
80102540:	31 c0                	xor    %eax,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
80102542:	83 0d d4 b5 10 80 40 	orl    $0x40,0x8010b5d4
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102549:	5d                   	pop    %ebp
8010254a:	c3                   	ret    
8010254b:	90                   	nop
8010254c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
80102550:	8d 50 bf             	lea    -0x41(%eax),%edx
80102553:	83 fa 19             	cmp    $0x19,%edx
80102556:	77 97                	ja     801024ef <kbdgetc+0x4f>
      c += 'a' - 'A';
80102558:	83 c0 20             	add    $0x20,%eax
  }
  return c;
}
8010255b:	5d                   	pop    %ebp
8010255c:	c3                   	ret    
8010255d:	8d 76 00             	lea    0x0(%esi),%esi
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
80102560:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102565:	5d                   	pop    %ebp
80102566:	c3                   	ret    
80102567:	89 f6                	mov    %esi,%esi
80102569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102570 <kbdintr>:

void
kbdintr(void)
{
80102570:	55                   	push   %ebp
80102571:	89 e5                	mov    %esp,%ebp
80102573:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102576:	68 a0 24 10 80       	push   $0x801024a0
8010257b:	e8 50 e2 ff ff       	call   801007d0 <consoleintr>
80102580:	83 c4 10             	add    $0x10,%esp
}
80102583:	c9                   	leave  
80102584:	c3                   	ret    
80102585:	66 90                	xchg   %ax,%ax
80102587:	66 90                	xchg   %ax,%ax
80102589:	66 90                	xchg   %ax,%ax
8010258b:	66 90                	xchg   %ax,%ax
8010258d:	66 90                	xchg   %ax,%ax
8010258f:	90                   	nop

80102590 <fill_rtcdate>:

  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
80102590:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102591:	ba 70 00 00 00       	mov    $0x70,%edx
80102596:	89 e5                	mov    %esp,%ebp
80102598:	53                   	push   %ebx
80102599:	89 c3                	mov    %eax,%ebx
8010259b:	31 c0                	xor    %eax,%eax
8010259d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010259e:	b9 71 00 00 00       	mov    $0x71,%ecx
801025a3:	89 ca                	mov    %ecx,%edx
801025a5:	ec                   	in     (%dx),%al
static uint cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
801025a6:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025a9:	b2 70                	mov    $0x70,%dl
801025ab:	89 03                	mov    %eax,(%ebx)
801025ad:	b8 02 00 00 00       	mov    $0x2,%eax
801025b2:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025b3:	89 ca                	mov    %ecx,%edx
801025b5:	ec                   	in     (%dx),%al
801025b6:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025b9:	b2 70                	mov    $0x70,%dl
801025bb:	89 43 04             	mov    %eax,0x4(%ebx)
801025be:	b8 04 00 00 00       	mov    $0x4,%eax
801025c3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025c4:	89 ca                	mov    %ecx,%edx
801025c6:	ec                   	in     (%dx),%al
801025c7:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025ca:	b2 70                	mov    $0x70,%dl
801025cc:	89 43 08             	mov    %eax,0x8(%ebx)
801025cf:	b8 07 00 00 00       	mov    $0x7,%eax
801025d4:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025d5:	89 ca                	mov    %ecx,%edx
801025d7:	ec                   	in     (%dx),%al
801025d8:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025db:	b2 70                	mov    $0x70,%dl
801025dd:	89 43 0c             	mov    %eax,0xc(%ebx)
801025e0:	b8 08 00 00 00       	mov    $0x8,%eax
801025e5:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025e6:	89 ca                	mov    %ecx,%edx
801025e8:	ec                   	in     (%dx),%al
801025e9:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801025ec:	b2 70                	mov    $0x70,%dl
801025ee:	89 43 10             	mov    %eax,0x10(%ebx)
801025f1:	b8 09 00 00 00       	mov    $0x9,%eax
801025f6:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801025f7:	89 ca                	mov    %ecx,%edx
801025f9:	ec                   	in     (%dx),%al
801025fa:	0f b6 c8             	movzbl %al,%ecx
801025fd:	89 4b 14             	mov    %ecx,0x14(%ebx)
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
}
80102600:	5b                   	pop    %ebx
80102601:	5d                   	pop    %ebp
80102602:	c3                   	ret    
80102603:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102610 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
80102610:	a1 60 37 11 80       	mov    0x80113760,%eax
}
//PAGEBREAK!

void
lapicinit(void)
{
80102615:	55                   	push   %ebp
80102616:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102618:	85 c0                	test   %eax,%eax
8010261a:	0f 84 c8 00 00 00    	je     801026e8 <lapicinit+0xd8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102620:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102627:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010262a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010262d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102634:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102637:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010263a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102641:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102644:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102647:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010264e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102651:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102654:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010265b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010265e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102661:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102668:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010266b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010266e:	8b 50 30             	mov    0x30(%eax),%edx
80102671:	c1 ea 10             	shr    $0x10,%edx
80102674:	80 fa 03             	cmp    $0x3,%dl
80102677:	77 77                	ja     801026f0 <lapicinit+0xe0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102679:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102680:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102683:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102686:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010268d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102690:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102693:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010269a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010269d:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026a0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026a7:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026aa:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026ad:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026b4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026b7:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026ba:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026c1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026c4:	8b 50 20             	mov    0x20(%eax),%edx
801026c7:	89 f6                	mov    %esi,%esi
801026c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026d0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026d6:	80 e6 10             	and    $0x10,%dh
801026d9:	75 f5                	jne    801026d0 <lapicinit+0xc0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026db:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026e2:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026e5:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026e8:	5d                   	pop    %ebp
801026e9:	c3                   	ret    
801026ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026f0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026f7:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026fa:	8b 50 20             	mov    0x20(%eax),%edx
801026fd:	e9 77 ff ff ff       	jmp    80102679 <lapicinit+0x69>
80102702:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102710 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
80102710:	55                   	push   %ebp
80102711:	89 e5                	mov    %esp,%ebp
80102713:	56                   	push   %esi
80102714:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102715:	9c                   	pushf  
80102716:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
80102717:	f6 c4 02             	test   $0x2,%ah
8010271a:	74 12                	je     8010272e <cpunum+0x1e>
    static int n;
    if(n++ == 0)
8010271c:	a1 d8 b5 10 80       	mov    0x8010b5d8,%eax
80102721:	8d 50 01             	lea    0x1(%eax),%edx
80102724:	85 c0                	test   %eax,%eax
80102726:	89 15 d8 b5 10 80    	mov    %edx,0x8010b5d8
8010272c:	74 4d                	je     8010277b <cpunum+0x6b>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
8010272e:	a1 60 37 11 80       	mov    0x80113760,%eax
80102733:	85 c0                	test   %eax,%eax
80102735:	74 60                	je     80102797 <cpunum+0x87>
    return 0;

  apicid = lapic[ID] >> 24;
80102737:	8b 58 20             	mov    0x20(%eax),%ebx
  for (i = 0; i < ncpu; ++i) {
8010273a:	8b 35 a0 3e 11 80    	mov    0x80113ea0,%esi
  }

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
80102740:	c1 eb 18             	shr    $0x18,%ebx
  for (i = 0; i < ncpu; ++i) {
80102743:	85 f6                	test   %esi,%esi
80102745:	7e 59                	jle    801027a0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
80102747:	0f b6 05 c0 38 11 80 	movzbl 0x801138c0,%eax
8010274e:	39 d8                	cmp    %ebx,%eax
80102750:	74 45                	je     80102797 <cpunum+0x87>
80102752:	ba 7c 39 11 80       	mov    $0x8011397c,%edx
80102757:	31 c0                	xor    %eax,%eax
80102759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
80102760:	83 c0 01             	add    $0x1,%eax
80102763:	39 f0                	cmp    %esi,%eax
80102765:	74 39                	je     801027a0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
80102767:	0f b6 0a             	movzbl (%edx),%ecx
8010276a:	81 c2 bc 00 00 00    	add    $0xbc,%edx
80102770:	39 d9                	cmp    %ebx,%ecx
80102772:	75 ec                	jne    80102760 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
}
80102774:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102777:	5b                   	pop    %ebx
80102778:	5e                   	pop    %esi
80102779:	5d                   	pop    %ebp
8010277a:	c3                   	ret    
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
8010277b:	83 ec 08             	sub    $0x8,%esp
8010277e:	ff 75 04             	pushl  0x4(%ebp)
80102781:	68 00 7b 10 80       	push   $0x80107b00
80102786:	e8 d5 de ff ff       	call   80100660 <cprintf>
        __builtin_return_address(0));
  }

  if (!lapic)
8010278b:	a1 60 37 11 80       	mov    0x80113760,%eax
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
80102790:	83 c4 10             	add    $0x10,%esp
        __builtin_return_address(0));
  }

  if (!lapic)
80102793:	85 c0                	test   %eax,%eax
80102795:	75 a0                	jne    80102737 <cpunum+0x27>
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
80102797:	8d 65 f8             	lea    -0x8(%ebp),%esp
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
    return 0;
8010279a:	31 c0                	xor    %eax,%eax
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
8010279c:	5b                   	pop    %ebx
8010279d:	5e                   	pop    %esi
8010279e:	5d                   	pop    %ebp
8010279f:	c3                   	ret    
  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
801027a0:	83 ec 0c             	sub    $0xc,%esp
801027a3:	68 2c 7b 10 80       	push   $0x80107b2c
801027a8:	e8 c3 db ff ff       	call   80100370 <panic>
801027ad:	8d 76 00             	lea    0x0(%esi),%esi

801027b0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
801027b0:	a1 60 37 11 80       	mov    0x80113760,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
801027b5:	55                   	push   %ebp
801027b6:	89 e5                	mov    %esp,%ebp
  if(lapic)
801027b8:	85 c0                	test   %eax,%eax
801027ba:	74 0d                	je     801027c9 <lapiceoi+0x19>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027bc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027c3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027c6:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
801027c9:	5d                   	pop    %ebp
801027ca:	c3                   	ret    
801027cb:	90                   	nop
801027cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027d0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801027d0:	55                   	push   %ebp
801027d1:	89 e5                	mov    %esp,%ebp
}
801027d3:	5d                   	pop    %ebp
801027d4:	c3                   	ret    
801027d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027e0 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
801027e0:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027e1:	ba 70 00 00 00       	mov    $0x70,%edx
801027e6:	b8 0f 00 00 00       	mov    $0xf,%eax
801027eb:	89 e5                	mov    %esp,%ebp
801027ed:	53                   	push   %ebx
801027ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027f4:	ee                   	out    %al,(%dx)
801027f5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027fa:	b2 71                	mov    $0x71,%dl
801027fc:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801027fd:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
801027ff:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102802:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
80102808:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010280a:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
8010280d:	c1 e8 04             	shr    $0x4,%eax

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102810:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102812:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102815:	66 a3 69 04 00 80    	mov    %ax,0x80000469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010281b:	a1 60 37 11 80       	mov    0x80113760,%eax
80102820:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102826:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102829:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102830:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102833:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102836:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
8010283d:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102840:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102843:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102849:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010284c:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102852:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102855:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010285b:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010285e:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102864:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
80102867:	5b                   	pop    %ebx
80102868:	5d                   	pop    %ebp
80102869:	c3                   	ret    
8010286a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102870 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102870:	55                   	push   %ebp
80102871:	ba 70 00 00 00       	mov    $0x70,%edx
80102876:	b8 0b 00 00 00       	mov    $0xb,%eax
8010287b:	89 e5                	mov    %esp,%ebp
8010287d:	57                   	push   %edi
8010287e:	56                   	push   %esi
8010287f:	53                   	push   %ebx
80102880:	83 ec 4c             	sub    $0x4c,%esp
80102883:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102884:	b2 71                	mov    $0x71,%dl
80102886:	ec                   	in     (%dx),%al
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
80102887:	83 e0 04             	and    $0x4,%eax
8010288a:	8d 5d b8             	lea    -0x48(%ebp),%ebx
8010288d:	8d 7d d0             	lea    -0x30(%ebp),%edi
80102890:	88 45 b7             	mov    %al,-0x49(%ebp)
80102893:	90                   	nop
80102894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102898:	be 70 00 00 00       	mov    $0x70,%esi

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
8010289d:	89 d8                	mov    %ebx,%eax
8010289f:	e8 ec fc ff ff       	call   80102590 <fill_rtcdate>
801028a4:	b8 0a 00 00 00       	mov    $0xa,%eax
801028a9:	89 f2                	mov    %esi,%edx
801028ab:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ac:	ba 71 00 00 00       	mov    $0x71,%edx
801028b1:	ec                   	in     (%dx),%al
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028b2:	84 c0                	test   %al,%al
801028b4:	78 e7                	js     8010289d <cmostime+0x2d>
        continue;
    fill_rtcdate(&t2);
801028b6:	89 f8                	mov    %edi,%eax
801028b8:	e8 d3 fc ff ff       	call   80102590 <fill_rtcdate>
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028bd:	83 ec 04             	sub    $0x4,%esp
801028c0:	6a 18                	push   $0x18
801028c2:	57                   	push   %edi
801028c3:	53                   	push   %ebx
801028c4:	e8 f7 20 00 00       	call   801049c0 <memcmp>
801028c9:	83 c4 10             	add    $0x10,%esp
801028cc:	85 c0                	test   %eax,%eax
801028ce:	75 c8                	jne    80102898 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
801028d0:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028d4:	75 78                	jne    8010294e <cmostime+0xde>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
801028d6:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028d9:	89 c2                	mov    %eax,%edx
801028db:	83 e0 0f             	and    $0xf,%eax
801028de:	c1 ea 04             	shr    $0x4,%edx
801028e1:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028e4:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028e7:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
801028ea:	8b 45 bc             	mov    -0x44(%ebp),%eax
801028ed:	89 c2                	mov    %eax,%edx
801028ef:	83 e0 0f             	and    $0xf,%eax
801028f2:	c1 ea 04             	shr    $0x4,%edx
801028f5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028f8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028fb:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801028fe:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102901:	89 c2                	mov    %eax,%edx
80102903:	83 e0 0f             	and    $0xf,%eax
80102906:	c1 ea 04             	shr    $0x4,%edx
80102909:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010290c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290f:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102912:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102915:	89 c2                	mov    %eax,%edx
80102917:	83 e0 0f             	and    $0xf,%eax
8010291a:	c1 ea 04             	shr    $0x4,%edx
8010291d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102920:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102923:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102926:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102929:	89 c2                	mov    %eax,%edx
8010292b:	83 e0 0f             	and    $0xf,%eax
8010292e:	c1 ea 04             	shr    $0x4,%edx
80102931:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102934:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102937:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010293a:	8b 45 cc             	mov    -0x34(%ebp),%eax
8010293d:	89 c2                	mov    %eax,%edx
8010293f:	83 e0 0f             	and    $0xf,%eax
80102942:	c1 ea 04             	shr    $0x4,%edx
80102945:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102948:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294b:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
8010294e:	8b 4d 08             	mov    0x8(%ebp),%ecx
80102951:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102954:	89 01                	mov    %eax,(%ecx)
80102956:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102959:	89 41 04             	mov    %eax,0x4(%ecx)
8010295c:	8b 45 c0             	mov    -0x40(%ebp),%eax
8010295f:	89 41 08             	mov    %eax,0x8(%ecx)
80102962:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102965:	89 41 0c             	mov    %eax,0xc(%ecx)
80102968:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010296b:	89 41 10             	mov    %eax,0x10(%ecx)
8010296e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102971:	89 41 14             	mov    %eax,0x14(%ecx)
  r->year += 2000;
80102974:	81 41 14 d0 07 00 00 	addl   $0x7d0,0x14(%ecx)
}
8010297b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010297e:	5b                   	pop    %ebx
8010297f:	5e                   	pop    %esi
80102980:	5f                   	pop    %edi
80102981:	5d                   	pop    %ebp
80102982:	c3                   	ret    
80102983:	66 90                	xchg   %ax,%ax
80102985:	66 90                	xchg   %ax,%ax
80102987:	66 90                	xchg   %ax,%ax
80102989:	66 90                	xchg   %ax,%ax
8010298b:	66 90                	xchg   %ax,%ax
8010298d:	66 90                	xchg   %ax,%ax
8010298f:	90                   	nop

80102990 <install_trans>:
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
80102990:	55                   	push   %ebp
80102991:	89 e5                	mov    %esp,%ebp
80102993:	57                   	push   %edi
80102994:	56                   	push   %esi
80102995:	53                   	push   %ebx
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102996:	31 db                	xor    %ebx,%ebx
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
80102998:	83 ec 0c             	sub    $0xc,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
8010299b:	8b 0d c8 37 11 80    	mov    0x801137c8,%ecx
801029a1:	85 c9                	test   %ecx,%ecx
801029a3:	7e 6f                	jle    80102a14 <install_trans+0x84>
801029a5:	8d 76 00             	lea    0x0(%esi),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
801029a8:	a1 b4 37 11 80       	mov    0x801137b4,%eax
801029ad:	83 ec 08             	sub    $0x8,%esp
801029b0:	01 d8                	add    %ebx,%eax
801029b2:	83 c0 01             	add    $0x1,%eax
801029b5:	50                   	push   %eax
801029b6:	ff 35 c4 37 11 80    	pushl  0x801137c4
801029bc:	e8 0f d7 ff ff       	call   801000d0 <bread>
801029c1:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029c3:	58                   	pop    %eax
801029c4:	5a                   	pop    %edx
801029c5:	ff 34 9d cc 37 11 80 	pushl  -0x7feec834(,%ebx,4)
801029cc:	ff 35 c4 37 11 80    	pushl  0x801137c4
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029d2:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029d5:	e8 f6 d6 ff ff       	call   801000d0 <bread>
801029da:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
801029dc:	8d 47 5c             	lea    0x5c(%edi),%eax
801029df:	83 c4 0c             	add    $0xc,%esp
801029e2:	68 00 02 00 00       	push   $0x200
801029e7:	50                   	push   %eax
801029e8:	8d 46 5c             	lea    0x5c(%esi),%eax
801029eb:	50                   	push   %eax
801029ec:	e8 2f 20 00 00       	call   80104a20 <memmove>
    bwrite(dbuf);  // write dst to disk
801029f1:	89 34 24             	mov    %esi,(%esp)
801029f4:	e8 a7 d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
801029f9:	89 3c 24             	mov    %edi,(%esp)
801029fc:	e8 df d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a01:	89 34 24             	mov    %esi,(%esp)
80102a04:	e8 d7 d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a09:	83 c4 10             	add    $0x10,%esp
80102a0c:	39 1d c8 37 11 80    	cmp    %ebx,0x801137c8
80102a12:	7f 94                	jg     801029a8 <install_trans+0x18>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a17:	5b                   	pop    %ebx
80102a18:	5e                   	pop    %esi
80102a19:	5f                   	pop    %edi
80102a1a:	5d                   	pop    %ebp
80102a1b:	c3                   	ret    
80102a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102a20 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a20:	55                   	push   %ebp
80102a21:	89 e5                	mov    %esp,%ebp
80102a23:	53                   	push   %ebx
80102a24:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a27:	ff 35 b4 37 11 80    	pushl  0x801137b4
80102a2d:	ff 35 c4 37 11 80    	pushl  0x801137c4
80102a33:	e8 98 d6 ff ff       	call   801000d0 <bread>
80102a38:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a3a:	a1 c8 37 11 80       	mov    0x801137c8,%eax
  for (i = 0; i < log.lh.n; i++) {
80102a3f:	83 c4 10             	add    $0x10,%esp
80102a42:	31 d2                	xor    %edx,%edx
80102a44:	85 c0                	test   %eax,%eax
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a46:	89 43 5c             	mov    %eax,0x5c(%ebx)
  for (i = 0; i < log.lh.n; i++) {
80102a49:	7e 17                	jle    80102a62 <write_head+0x42>
80102a4b:	90                   	nop
80102a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102a50:	8b 0c 95 cc 37 11 80 	mov    -0x7feec834(,%edx,4),%ecx
80102a57:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102a5b:	83 c2 01             	add    $0x1,%edx
80102a5e:	39 c2                	cmp    %eax,%edx
80102a60:	75 ee                	jne    80102a50 <write_head+0x30>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102a62:	83 ec 0c             	sub    $0xc,%esp
80102a65:	53                   	push   %ebx
80102a66:	e8 35 d7 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102a6b:	89 1c 24             	mov    %ebx,(%esp)
80102a6e:	e8 6d d7 ff ff       	call   801001e0 <brelse>
}
80102a73:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102a76:	c9                   	leave  
80102a77:	c3                   	ret    
80102a78:	90                   	nop
80102a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102a80 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102a80:	55                   	push   %ebp
80102a81:	89 e5                	mov    %esp,%ebp
80102a83:	53                   	push   %ebx
80102a84:	83 ec 2c             	sub    $0x2c,%esp
80102a87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102a8a:	68 3c 7b 10 80       	push   $0x80107b3c
80102a8f:	68 80 37 11 80       	push   $0x80113780
80102a94:	e8 d7 1c 00 00       	call   80104770 <initlock>
  readsb(dev, &sb);
80102a99:	58                   	pop    %eax
80102a9a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102a9d:	5a                   	pop    %edx
80102a9e:	50                   	push   %eax
80102a9f:	53                   	push   %ebx
80102aa0:	e8 eb e8 ff ff       	call   80101390 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102aa5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102aa8:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102aab:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102aac:	89 1d c4 37 11 80    	mov    %ebx,0x801137c4

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102ab2:	89 15 b8 37 11 80    	mov    %edx,0x801137b8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102ab8:	a3 b4 37 11 80       	mov    %eax,0x801137b4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102abd:	5a                   	pop    %edx
80102abe:	50                   	push   %eax
80102abf:	53                   	push   %ebx
80102ac0:	e8 0b d6 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102ac5:	8b 58 5c             	mov    0x5c(%eax),%ebx
  for (i = 0; i < log.lh.n; i++) {
80102ac8:	83 c4 10             	add    $0x10,%esp
80102acb:	31 d2                	xor    %edx,%edx
80102acd:	85 db                	test   %ebx,%ebx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102acf:	89 1d c8 37 11 80    	mov    %ebx,0x801137c8
  for (i = 0; i < log.lh.n; i++) {
80102ad5:	7e 1b                	jle    80102af2 <initlog+0x72>
80102ad7:	89 f6                	mov    %esi,%esi
80102ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    log.lh.block[i] = lh->block[i];
80102ae0:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102ae4:	89 0c 95 cc 37 11 80 	mov    %ecx,-0x7feec834(,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102aeb:	83 c2 01             	add    $0x1,%edx
80102aee:	39 da                	cmp    %ebx,%edx
80102af0:	75 ee                	jne    80102ae0 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102af2:	83 ec 0c             	sub    $0xc,%esp
80102af5:	50                   	push   %eax
80102af6:	e8 e5 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102afb:	e8 90 fe ff ff       	call   80102990 <install_trans>
  log.lh.n = 0;
80102b00:	c7 05 c8 37 11 80 00 	movl   $0x0,0x801137c8
80102b07:	00 00 00 
  write_head(); // clear the log
80102b0a:	e8 11 ff ff ff       	call   80102a20 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b0f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b12:	c9                   	leave  
80102b13:	c3                   	ret    
80102b14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102b20 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b20:	55                   	push   %ebp
80102b21:	89 e5                	mov    %esp,%ebp
80102b23:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102b26:	68 80 37 11 80       	push   $0x80113780
80102b2b:	e8 c0 1c 00 00       	call   801047f0 <acquire>
80102b30:	83 c4 10             	add    $0x10,%esp
80102b33:	eb 18                	jmp    80102b4d <begin_op+0x2d>
80102b35:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102b38:	83 ec 08             	sub    $0x8,%esp
80102b3b:	68 80 37 11 80       	push   $0x80113780
80102b40:	68 80 37 11 80       	push   $0x80113780
80102b45:	e8 06 13 00 00       	call   80103e50 <sleep>
80102b4a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102b4d:	a1 c0 37 11 80       	mov    0x801137c0,%eax
80102b52:	85 c0                	test   %eax,%eax
80102b54:	75 e2                	jne    80102b38 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102b56:	a1 bc 37 11 80       	mov    0x801137bc,%eax
80102b5b:	8b 15 c8 37 11 80    	mov    0x801137c8,%edx
80102b61:	83 c0 01             	add    $0x1,%eax
80102b64:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b67:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b6a:	83 fa 1e             	cmp    $0x1e,%edx
80102b6d:	7f c9                	jg     80102b38 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102b6f:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102b72:	a3 bc 37 11 80       	mov    %eax,0x801137bc
      release(&log.lock);
80102b77:	68 80 37 11 80       	push   $0x80113780
80102b7c:	e8 9f 1d 00 00       	call   80104920 <release>
80102b81:	83 c4 10             	add    $0x10,%esp
      break;
    }
  }
}
80102b84:	c9                   	leave  
80102b85:	c3                   	ret    
80102b86:	8d 76 00             	lea    0x0(%esi),%esi
80102b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b90 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	57                   	push   %edi
80102b94:	56                   	push   %esi
80102b95:	53                   	push   %ebx
80102b96:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102b99:	68 80 37 11 80       	push   $0x80113780
80102b9e:	e8 4d 1c 00 00       	call   801047f0 <acquire>
  log.outstanding -= 1;
80102ba3:	a1 bc 37 11 80       	mov    0x801137bc,%eax
  if(log.committing)
80102ba8:	8b 1d c0 37 11 80    	mov    0x801137c0,%ebx
80102bae:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102bb1:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102bb4:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102bb6:	a3 bc 37 11 80       	mov    %eax,0x801137bc
  if(log.committing)
80102bbb:	0f 85 23 01 00 00    	jne    80102ce4 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102bc1:	85 c0                	test   %eax,%eax
80102bc3:	0f 85 f7 00 00 00    	jne    80102cc0 <end_op+0x130>
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102bc9:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102bcc:	c7 05 c0 37 11 80 01 	movl   $0x1,0x801137c0
80102bd3:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102bd6:	31 db                	xor    %ebx,%ebx
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102bd8:	68 80 37 11 80       	push   $0x80113780
80102bdd:	e8 3e 1d 00 00       	call   80104920 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102be2:	8b 0d c8 37 11 80    	mov    0x801137c8,%ecx
80102be8:	83 c4 10             	add    $0x10,%esp
80102beb:	85 c9                	test   %ecx,%ecx
80102bed:	0f 8e 8a 00 00 00    	jle    80102c7d <end_op+0xed>
80102bf3:	90                   	nop
80102bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102bf8:	a1 b4 37 11 80       	mov    0x801137b4,%eax
80102bfd:	83 ec 08             	sub    $0x8,%esp
80102c00:	01 d8                	add    %ebx,%eax
80102c02:	83 c0 01             	add    $0x1,%eax
80102c05:	50                   	push   %eax
80102c06:	ff 35 c4 37 11 80    	pushl  0x801137c4
80102c0c:	e8 bf d4 ff ff       	call   801000d0 <bread>
80102c11:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c13:	58                   	pop    %eax
80102c14:	5a                   	pop    %edx
80102c15:	ff 34 9d cc 37 11 80 	pushl  -0x7feec834(,%ebx,4)
80102c1c:	ff 35 c4 37 11 80    	pushl  0x801137c4
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c22:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c25:	e8 a6 d4 ff ff       	call   801000d0 <bread>
80102c2a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c2c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c2f:	83 c4 0c             	add    $0xc,%esp
80102c32:	68 00 02 00 00       	push   $0x200
80102c37:	50                   	push   %eax
80102c38:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c3b:	50                   	push   %eax
80102c3c:	e8 df 1d 00 00       	call   80104a20 <memmove>
    bwrite(to);  // write the log
80102c41:	89 34 24             	mov    %esi,(%esp)
80102c44:	e8 57 d5 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102c49:	89 3c 24             	mov    %edi,(%esp)
80102c4c:	e8 8f d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102c51:	89 34 24             	mov    %esi,(%esp)
80102c54:	e8 87 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c59:	83 c4 10             	add    $0x10,%esp
80102c5c:	3b 1d c8 37 11 80    	cmp    0x801137c8,%ebx
80102c62:	7c 94                	jl     80102bf8 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102c64:	e8 b7 fd ff ff       	call   80102a20 <write_head>
    install_trans(); // Now install writes to home locations
80102c69:	e8 22 fd ff ff       	call   80102990 <install_trans>
    log.lh.n = 0;
80102c6e:	c7 05 c8 37 11 80 00 	movl   $0x0,0x801137c8
80102c75:	00 00 00 
    write_head();    // Erase the transaction from the log
80102c78:	e8 a3 fd ff ff       	call   80102a20 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102c7d:	83 ec 0c             	sub    $0xc,%esp
80102c80:	68 80 37 11 80       	push   $0x80113780
80102c85:	e8 66 1b 00 00       	call   801047f0 <acquire>
    log.committing = 0;
    wakeup(&log);
80102c8a:	c7 04 24 80 37 11 80 	movl   $0x80113780,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102c91:	c7 05 c0 37 11 80 00 	movl   $0x0,0x801137c0
80102c98:	00 00 00 
    wakeup(&log);
80102c9b:	e8 60 13 00 00       	call   80104000 <wakeup>
    release(&log.lock);
80102ca0:	c7 04 24 80 37 11 80 	movl   $0x80113780,(%esp)
80102ca7:	e8 74 1c 00 00       	call   80104920 <release>
80102cac:	83 c4 10             	add    $0x10,%esp
  }
}
80102caf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cb2:	5b                   	pop    %ebx
80102cb3:	5e                   	pop    %esi
80102cb4:	5f                   	pop    %edi
80102cb5:	5d                   	pop    %ebp
80102cb6:	c3                   	ret    
80102cb7:	89 f6                	mov    %esi,%esi
80102cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
80102cc0:	83 ec 0c             	sub    $0xc,%esp
80102cc3:	68 80 37 11 80       	push   $0x80113780
80102cc8:	e8 33 13 00 00       	call   80104000 <wakeup>
  }
  release(&log.lock);
80102ccd:	c7 04 24 80 37 11 80 	movl   $0x80113780,(%esp)
80102cd4:	e8 47 1c 00 00       	call   80104920 <release>
80102cd9:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102cdc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cdf:	5b                   	pop    %ebx
80102ce0:	5e                   	pop    %esi
80102ce1:	5f                   	pop    %edi
80102ce2:	5d                   	pop    %ebp
80102ce3:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102ce4:	83 ec 0c             	sub    $0xc,%esp
80102ce7:	68 40 7b 10 80       	push   $0x80107b40
80102cec:	e8 7f d6 ff ff       	call   80100370 <panic>
80102cf1:	eb 0d                	jmp    80102d00 <log_write>
80102cf3:	90                   	nop
80102cf4:	90                   	nop
80102cf5:	90                   	nop
80102cf6:	90                   	nop
80102cf7:	90                   	nop
80102cf8:	90                   	nop
80102cf9:	90                   	nop
80102cfa:	90                   	nop
80102cfb:	90                   	nop
80102cfc:	90                   	nop
80102cfd:	90                   	nop
80102cfe:	90                   	nop
80102cff:	90                   	nop

80102d00 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d00:	55                   	push   %ebp
80102d01:	89 e5                	mov    %esp,%ebp
80102d03:	53                   	push   %ebx
80102d04:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d07:	8b 15 c8 37 11 80    	mov    0x801137c8,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d0d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d10:	83 fa 1d             	cmp    $0x1d,%edx
80102d13:	0f 8f 97 00 00 00    	jg     80102db0 <log_write+0xb0>
80102d19:	a1 b8 37 11 80       	mov    0x801137b8,%eax
80102d1e:	83 e8 01             	sub    $0x1,%eax
80102d21:	39 c2                	cmp    %eax,%edx
80102d23:	0f 8d 87 00 00 00    	jge    80102db0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d29:	a1 bc 37 11 80       	mov    0x801137bc,%eax
80102d2e:	85 c0                	test   %eax,%eax
80102d30:	0f 8e 87 00 00 00    	jle    80102dbd <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d36:	83 ec 0c             	sub    $0xc,%esp
80102d39:	68 80 37 11 80       	push   $0x80113780
80102d3e:	e8 ad 1a 00 00       	call   801047f0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d43:	8b 15 c8 37 11 80    	mov    0x801137c8,%edx
80102d49:	83 c4 10             	add    $0x10,%esp
80102d4c:	83 fa 00             	cmp    $0x0,%edx
80102d4f:	7e 50                	jle    80102da1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d51:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d54:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d56:	39 0d cc 37 11 80    	cmp    %ecx,0x801137cc
80102d5c:	75 0b                	jne    80102d69 <log_write+0x69>
80102d5e:	eb 38                	jmp    80102d98 <log_write+0x98>
80102d60:	39 0c 85 cc 37 11 80 	cmp    %ecx,-0x7feec834(,%eax,4)
80102d67:	74 2f                	je     80102d98 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d69:	83 c0 01             	add    $0x1,%eax
80102d6c:	39 d0                	cmp    %edx,%eax
80102d6e:	75 f0                	jne    80102d60 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102d70:	89 0c 95 cc 37 11 80 	mov    %ecx,-0x7feec834(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102d77:	83 c2 01             	add    $0x1,%edx
80102d7a:	89 15 c8 37 11 80    	mov    %edx,0x801137c8
  b->flags |= B_DIRTY; // prevent eviction
80102d80:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102d83:	c7 45 08 80 37 11 80 	movl   $0x80113780,0x8(%ebp)
}
80102d8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d8d:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102d8e:	e9 8d 1b 00 00       	jmp    80104920 <release>
80102d93:	90                   	nop
80102d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102d98:	89 0c 85 cc 37 11 80 	mov    %ecx,-0x7feec834(,%eax,4)
80102d9f:	eb df                	jmp    80102d80 <log_write+0x80>
80102da1:	8b 43 08             	mov    0x8(%ebx),%eax
80102da4:	a3 cc 37 11 80       	mov    %eax,0x801137cc
  if (i == log.lh.n)
80102da9:	75 d5                	jne    80102d80 <log_write+0x80>
80102dab:	eb ca                	jmp    80102d77 <log_write+0x77>
80102dad:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102db0:	83 ec 0c             	sub    $0xc,%esp
80102db3:	68 4f 7b 10 80       	push   $0x80107b4f
80102db8:	e8 b3 d5 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102dbd:	83 ec 0c             	sub    $0xc,%esp
80102dc0:	68 65 7b 10 80       	push   $0x80107b65
80102dc5:	e8 a6 d5 ff ff       	call   80100370 <panic>
80102dca:	66 90                	xchg   %ax,%ax
80102dcc:	66 90                	xchg   %ax,%ax
80102dce:	66 90                	xchg   %ax,%ax

80102dd0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102dd0:	55                   	push   %ebp
80102dd1:	89 e5                	mov    %esp,%ebp
80102dd3:	83 ec 08             	sub    $0x8,%esp
  cprintf("cpu%d: starting\n", cpunum());
80102dd6:	e8 35 f9 ff ff       	call   80102710 <cpunum>
80102ddb:	83 ec 08             	sub    $0x8,%esp
80102dde:	50                   	push   %eax
80102ddf:	68 80 7b 10 80       	push   $0x80107b80
80102de4:	e8 77 d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102de9:	e8 e2 2f 00 00       	call   80105dd0 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102dee:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102df5:	b8 01 00 00 00       	mov    $0x1,%eax
80102dfa:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80102e01:	e8 fa 0d 00 00       	call   80103c00 <scheduler>
80102e06:	8d 76 00             	lea    0x0(%esi),%esi
80102e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102e10 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e10:	55                   	push   %ebp
80102e11:	89 e5                	mov    %esp,%ebp
80102e13:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e16:	e8 e5 41 00 00       	call   80107000 <switchkvm>
  seginit();
80102e1b:	e8 e0 3f 00 00       	call   80106e00 <seginit>
  lapicinit();
80102e20:	e8 eb f7 ff ff       	call   80102610 <lapicinit>
  mpmain();
80102e25:	e8 a6 ff ff ff       	call   80102dd0 <mpmain>
80102e2a:	66 90                	xchg   %ax,%ax
80102e2c:	66 90                	xchg   %ax,%ax
80102e2e:	66 90                	xchg   %ax,%ax

80102e30 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e30:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e34:	83 e4 f0             	and    $0xfffffff0,%esp
80102e37:	ff 71 fc             	pushl  -0x4(%ecx)
80102e3a:	55                   	push   %ebp
80102e3b:	89 e5                	mov    %esp,%ebp
80102e3d:	53                   	push   %ebx
80102e3e:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e3f:	83 ec 08             	sub    $0x8,%esp
80102e42:	68 00 00 40 80       	push   $0x80400000
80102e47:	68 48 69 11 80       	push   $0x80116948
80102e4c:	e8 7f f5 ff ff       	call   801023d0 <kinit1>
  kvmalloc();      // kernel page table
80102e51:	e8 8a 41 00 00       	call   80106fe0 <kvmalloc>
  mpinit();        // detect other processors
80102e56:	e8 b5 01 00 00       	call   80103010 <mpinit>
  lapicinit();     // interrupt controller
80102e5b:	e8 b0 f7 ff ff       	call   80102610 <lapicinit>
  seginit();       // segment descriptors
80102e60:	e8 9b 3f 00 00       	call   80106e00 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80102e65:	e8 a6 f8 ff ff       	call   80102710 <cpunum>
80102e6a:	5a                   	pop    %edx
80102e6b:	59                   	pop    %ecx
80102e6c:	50                   	push   %eax
80102e6d:	68 91 7b 10 80       	push   $0x80107b91
80102e72:	e8 e9 d7 ff ff       	call   80100660 <cprintf>
  picinit();       // another interrupt controller
80102e77:	e8 94 03 00 00       	call   80103210 <picinit>
  ioapicinit();    // another interrupt controller
80102e7c:	e8 3f f3 ff ff       	call   801021c0 <ioapicinit>
  consoleinit();   // console hardware
80102e81:	e8 fa da ff ff       	call   80100980 <consoleinit>
  uartinit();      // serial port
80102e86:	e8 45 32 00 00       	call   801060d0 <uartinit>
  pinit();         // process table
80102e8b:	e8 40 09 00 00       	call   801037d0 <pinit>
  tvinit();        // trap vectors
80102e90:	e8 9b 2e 00 00       	call   80105d30 <tvinit>
  binit();         // buffer cache
80102e95:	e8 a6 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102e9a:	e8 91 de ff ff       	call   80100d30 <fileinit>
  ideinit();       // disk
80102e9f:	e8 ec f0 ff ff       	call   80101f90 <ideinit>
  if(!ismp)
80102ea4:	8b 1d 84 38 11 80    	mov    0x80113884,%ebx
80102eaa:	83 c4 10             	add    $0x10,%esp
80102ead:	85 db                	test   %ebx,%ebx
80102eaf:	0f 84 ca 00 00 00    	je     80102f7f <main+0x14f>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102eb5:	83 ec 04             	sub    $0x4,%esp

  for(c = cpus; c < cpus+ncpu; c++){
80102eb8:	bb c0 38 11 80       	mov    $0x801138c0,%ebx

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ebd:	68 8a 00 00 00       	push   $0x8a
80102ec2:	68 ac b4 10 80       	push   $0x8010b4ac
80102ec7:	68 00 70 00 80       	push   $0x80007000
80102ecc:	e8 4f 1b 00 00       	call   80104a20 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102ed1:	69 05 a0 3e 11 80 bc 	imul   $0xbc,0x80113ea0,%eax
80102ed8:	00 00 00 
80102edb:	83 c4 10             	add    $0x10,%esp
80102ede:	05 c0 38 11 80       	add    $0x801138c0,%eax
80102ee3:	39 d8                	cmp    %ebx,%eax
80102ee5:	76 7c                	jbe    80102f63 <main+0x133>
80102ee7:	89 f6                	mov    %esi,%esi
80102ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == cpus+cpunum())  // We've started already.
80102ef0:	e8 1b f8 ff ff       	call   80102710 <cpunum>
80102ef5:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102efb:	05 c0 38 11 80       	add    $0x801138c0,%eax
80102f00:	39 c3                	cmp    %eax,%ebx
80102f02:	74 46                	je     80102f4a <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f04:	e8 27 f5 ff ff       	call   80102430 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f09:	83 ec 08             	sub    $0x8,%esp

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f0c:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80102f11:	c7 05 f8 6f 00 80 10 	movl   $0x80102e10,0x80006ff8
80102f18:	2e 10 80 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f1b:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f20:	c7 05 f4 6f 00 80 00 	movl   $0x10a000,0x80006ff4
80102f27:	a0 10 00 

    lapicstartap(c->apicid, V2P(code));
80102f2a:	68 00 70 00 00       	push   $0x7000
80102f2f:	0f b6 03             	movzbl (%ebx),%eax
80102f32:	50                   	push   %eax
80102f33:	e8 a8 f8 ff ff       	call   801027e0 <lapicstartap>
80102f38:	83 c4 10             	add    $0x10,%esp
80102f3b:	90                   	nop
80102f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f40:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80102f46:	85 c0                	test   %eax,%eax
80102f48:	74 f6                	je     80102f40 <main+0x110>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f4a:	69 05 a0 3e 11 80 bc 	imul   $0xbc,0x80113ea0,%eax
80102f51:	00 00 00 
80102f54:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
80102f5a:	05 c0 38 11 80       	add    $0x801138c0,%eax
80102f5f:	39 c3                	cmp    %eax,%ebx
80102f61:	72 8d                	jb     80102ef0 <main+0xc0>
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f63:	83 ec 08             	sub    $0x8,%esp
80102f66:	68 00 00 00 8e       	push   $0x8e000000
80102f6b:	68 00 00 40 80       	push   $0x80400000
80102f70:	e8 9b f4 ff ff       	call   80102410 <kinit2>
  userinit();      // first user process
80102f75:	e8 76 08 00 00       	call   801037f0 <userinit>
  mpmain();        // finish this processor's setup
80102f7a:	e8 51 fe ff ff       	call   80102dd0 <mpmain>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
80102f7f:	e8 4c 2d 00 00       	call   80105cd0 <timerinit>
80102f84:	e9 2c ff ff ff       	jmp    80102eb5 <main+0x85>
80102f89:	66 90                	xchg   %ax,%ax
80102f8b:	66 90                	xchg   %ax,%ax
80102f8d:	66 90                	xchg   %ax,%ax
80102f8f:	90                   	nop

80102f90 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f90:	55                   	push   %ebp
80102f91:	89 e5                	mov    %esp,%ebp
80102f93:	57                   	push   %edi
80102f94:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102f95:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f9b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102f9c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f9f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fa2:	39 de                	cmp    %ebx,%esi
80102fa4:	73 48                	jae    80102fee <mpsearch1+0x5e>
80102fa6:	8d 76 00             	lea    0x0(%esi),%esi
80102fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fb0:	83 ec 04             	sub    $0x4,%esp
80102fb3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fb6:	6a 04                	push   $0x4
80102fb8:	68 a8 7b 10 80       	push   $0x80107ba8
80102fbd:	56                   	push   %esi
80102fbe:	e8 fd 19 00 00       	call   801049c0 <memcmp>
80102fc3:	83 c4 10             	add    $0x10,%esp
80102fc6:	85 c0                	test   %eax,%eax
80102fc8:	75 1e                	jne    80102fe8 <mpsearch1+0x58>
80102fca:	8d 7e 10             	lea    0x10(%esi),%edi
80102fcd:	89 f2                	mov    %esi,%edx
80102fcf:	31 c9                	xor    %ecx,%ecx
80102fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102fd8:	0f b6 02             	movzbl (%edx),%eax
80102fdb:	83 c2 01             	add    $0x1,%edx
80102fde:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fe0:	39 fa                	cmp    %edi,%edx
80102fe2:	75 f4                	jne    80102fd8 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fe4:	84 c9                	test   %cl,%cl
80102fe6:	74 10                	je     80102ff8 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fe8:	39 fb                	cmp    %edi,%ebx
80102fea:	89 fe                	mov    %edi,%esi
80102fec:	77 c2                	ja     80102fb0 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80102fee:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80102ff1:	31 c0                	xor    %eax,%eax
}
80102ff3:	5b                   	pop    %ebx
80102ff4:	5e                   	pop    %esi
80102ff5:	5f                   	pop    %edi
80102ff6:	5d                   	pop    %ebp
80102ff7:	c3                   	ret    
80102ff8:	8d 65 f4             	lea    -0xc(%ebp),%esp

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
80102ffb:	89 f0                	mov    %esi,%eax
  return 0;
}
80102ffd:	5b                   	pop    %ebx
80102ffe:	5e                   	pop    %esi
80102fff:	5f                   	pop    %edi
80103000:	5d                   	pop    %ebp
80103001:	c3                   	ret    
80103002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103010 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103010:	55                   	push   %ebp
80103011:	89 e5                	mov    %esp,%ebp
80103013:	57                   	push   %edi
80103014:	56                   	push   %esi
80103015:	53                   	push   %ebx
80103016:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103019:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103020:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103027:	c1 e0 08             	shl    $0x8,%eax
8010302a:	09 d0                	or     %edx,%eax
8010302c:	c1 e0 04             	shl    $0x4,%eax
8010302f:	85 c0                	test   %eax,%eax
80103031:	75 1b                	jne    8010304e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103033:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010303a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103041:	c1 e0 08             	shl    $0x8,%eax
80103044:	09 d0                	or     %edx,%eax
80103046:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103049:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010304e:	ba 00 04 00 00       	mov    $0x400,%edx
80103053:	e8 38 ff ff ff       	call   80102f90 <mpsearch1>
80103058:	85 c0                	test   %eax,%eax
8010305a:	89 c7                	mov    %eax,%edi
8010305c:	0f 84 5e 01 00 00    	je     801031c0 <mpinit+0x1b0>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103062:	8b 77 04             	mov    0x4(%edi),%esi
80103065:	85 f6                	test   %esi,%esi
80103067:	0f 84 de 00 00 00    	je     8010314b <mpinit+0x13b>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010306d:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103073:	83 ec 04             	sub    $0x4,%esp
80103076:	6a 04                	push   $0x4
80103078:	68 ad 7b 10 80       	push   $0x80107bad
8010307d:	50                   	push   %eax
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010307e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103081:	e8 3a 19 00 00       	call   801049c0 <memcmp>
80103086:	83 c4 10             	add    $0x10,%esp
80103089:	85 c0                	test   %eax,%eax
8010308b:	0f 85 ba 00 00 00    	jne    8010314b <mpinit+0x13b>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103091:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
80103098:	3c 04                	cmp    $0x4,%al
8010309a:	74 08                	je     801030a4 <mpinit+0x94>
8010309c:	3c 01                	cmp    $0x1,%al
8010309e:	0f 85 a7 00 00 00    	jne    8010314b <mpinit+0x13b>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030a4:	0f b7 86 04 00 00 80 	movzwl -0x7ffffffc(%esi),%eax
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030ab:	66 85 c0             	test   %ax,%ax
801030ae:	74 24                	je     801030d4 <mpinit+0xc4>
801030b0:	89 f2                	mov    %esi,%edx
801030b2:	01 f0                	add    %esi,%eax
801030b4:	31 c9                	xor    %ecx,%ecx
801030b6:	8d 76 00             	lea    0x0(%esi),%esi
801030b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    sum += addr[i];
801030c0:	0f b6 9a 00 00 00 80 	movzbl -0x80000000(%edx),%ebx
801030c7:	83 c2 01             	add    $0x1,%edx
801030ca:	01 d9                	add    %ebx,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030cc:	39 c2                	cmp    %eax,%edx
801030ce:	75 f0                	jne    801030c0 <mpinit+0xb0>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030d0:	84 c9                	test   %cl,%cl
801030d2:	75 77                	jne    8010314b <mpinit+0x13b>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030d4:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801030d7:	85 db                	test   %ebx,%ebx
801030d9:	74 70                	je     8010314b <mpinit+0x13b>
    return;
  ismp = 1;
801030db:	c7 05 84 38 11 80 01 	movl   $0x1,0x80113884
801030e2:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
801030e5:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
801030eb:	a3 60 37 11 80       	mov    %eax,0x80113760
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030f0:	0f b7 8e 04 00 00 80 	movzwl -0x7ffffffc(%esi),%ecx
801030f7:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
801030fd:	01 d9                	add    %ebx,%ecx
801030ff:	39 c8                	cmp    %ecx,%eax
80103101:	0f 83 99 00 00 00    	jae    801031a0 <mpinit+0x190>
80103107:	89 f6                	mov    %esi,%esi
80103109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    switch(*p){
80103110:	80 38 04             	cmpb   $0x4,(%eax)
80103113:	77 7b                	ja     80103190 <mpinit+0x180>
80103115:	0f b6 10             	movzbl (%eax),%edx
80103118:	ff 24 95 b4 7b 10 80 	jmp    *-0x7fef844c(,%edx,4)
8010311f:	90                   	nop
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103120:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103123:	39 c1                	cmp    %eax,%ecx
80103125:	77 e9                	ja     80103110 <mpinit+0x100>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
80103127:	a1 84 38 11 80       	mov    0x80113884,%eax
8010312c:	85 c0                	test   %eax,%eax
8010312e:	75 70                	jne    801031a0 <mpinit+0x190>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
80103130:	c7 05 a0 3e 11 80 01 	movl   $0x1,0x80113ea0
80103137:	00 00 00 
    lapic = 0;
8010313a:	c7 05 60 37 11 80 00 	movl   $0x0,0x80113760
80103141:	00 00 00 
    ioapicid = 0;
80103144:	c6 05 80 38 11 80 00 	movb   $0x0,0x80113880
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010314b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010314e:	5b                   	pop    %ebx
8010314f:	5e                   	pop    %esi
80103150:	5f                   	pop    %edi
80103151:	5d                   	pop    %ebp
80103152:	c3                   	ret    
80103153:	90                   	nop
80103154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103158:	8b 15 a0 3e 11 80    	mov    0x80113ea0,%edx
8010315e:	83 fa 07             	cmp    $0x7,%edx
80103161:	7f 17                	jg     8010317a <mpinit+0x16a>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103163:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
        ncpu++;
80103167:	83 05 a0 3e 11 80 01 	addl   $0x1,0x80113ea0
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010316e:	69 d2 bc 00 00 00    	imul   $0xbc,%edx,%edx
80103174:	88 9a c0 38 11 80    	mov    %bl,-0x7feec740(%edx)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010317a:	83 c0 14             	add    $0x14,%eax
      continue;
8010317d:	eb a4                	jmp    80103123 <mpinit+0x113>
8010317f:	90                   	nop
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103180:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
80103184:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103187:	88 15 80 38 11 80    	mov    %dl,0x80113880
      p += sizeof(struct mpioapic);
      continue;
8010318d:	eb 94                	jmp    80103123 <mpinit+0x113>
8010318f:	90                   	nop
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
80103190:	c7 05 84 38 11 80 00 	movl   $0x0,0x80113884
80103197:	00 00 00 
      break;
8010319a:	eb 87                	jmp    80103123 <mpinit+0x113>
8010319c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
801031a0:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
801031a4:	74 a5                	je     8010314b <mpinit+0x13b>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031a6:	ba 22 00 00 00       	mov    $0x22,%edx
801031ab:	b8 70 00 00 00       	mov    $0x70,%eax
801031b0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801031b1:	b2 23                	mov    $0x23,%dl
801031b3:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801031b4:	83 c8 01             	or     $0x1,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801031b7:	ee                   	out    %al,(%dx)
  }
}
801031b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031bb:	5b                   	pop    %ebx
801031bc:	5e                   	pop    %esi
801031bd:	5f                   	pop    %edi
801031be:	5d                   	pop    %ebp
801031bf:	c3                   	ret    
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031c0:	ba 00 00 01 00       	mov    $0x10000,%edx
801031c5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031ca:	e8 c1 fd ff ff       	call   80102f90 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031cf:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801031d1:	89 c7                	mov    %eax,%edi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801031d3:	0f 85 89 fe ff ff    	jne    80103062 <mpinit+0x52>
801031d9:	e9 6d ff ff ff       	jmp    8010314b <mpinit+0x13b>
801031de:	66 90                	xchg   %ax,%ax

801031e0 <picenable>:
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
801031e0:	55                   	push   %ebp
  picsetmask(irqmask & ~(1<<irq));
801031e1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
801031e6:	ba 21 00 00 00       	mov    $0x21,%edx
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
801031eb:	89 e5                	mov    %esp,%ebp
  picsetmask(irqmask & ~(1<<irq));
801031ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
801031f0:	d3 c0                	rol    %cl,%eax
801031f2:	66 23 05 00 b0 10 80 	and    0x8010b000,%ax
static ushort irqmask = 0xFFFF & ~(1<<IRQ_SLAVE);

static void
picsetmask(ushort mask)
{
  irqmask = mask;
801031f9:	66 a3 00 b0 10 80    	mov    %ax,0x8010b000
801031ff:	ee                   	out    %al,(%dx)
  outb(IO_PIC1+1, mask);
  outb(IO_PIC2+1, mask >> 8);
80103200:	66 c1 e8 08          	shr    $0x8,%ax
80103204:	b2 a1                	mov    $0xa1,%dl
80103206:	ee                   	out    %al,(%dx)

void
picenable(int irq)
{
  picsetmask(irqmask & ~(1<<irq));
}
80103207:	5d                   	pop    %ebp
80103208:	c3                   	ret    
80103209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103210 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
80103210:	55                   	push   %ebp
80103211:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103216:	89 e5                	mov    %esp,%ebp
80103218:	57                   	push   %edi
80103219:	56                   	push   %esi
8010321a:	53                   	push   %ebx
8010321b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103220:	89 da                	mov    %ebx,%edx
80103222:	ee                   	out    %al,(%dx)
80103223:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103228:	89 ca                	mov    %ecx,%edx
8010322a:	ee                   	out    %al,(%dx)
8010322b:	bf 11 00 00 00       	mov    $0x11,%edi
80103230:	be 20 00 00 00       	mov    $0x20,%esi
80103235:	89 f8                	mov    %edi,%eax
80103237:	89 f2                	mov    %esi,%edx
80103239:	ee                   	out    %al,(%dx)
8010323a:	b8 20 00 00 00       	mov    $0x20,%eax
8010323f:	89 da                	mov    %ebx,%edx
80103241:	ee                   	out    %al,(%dx)
80103242:	b8 04 00 00 00       	mov    $0x4,%eax
80103247:	ee                   	out    %al,(%dx)
80103248:	b8 03 00 00 00       	mov    $0x3,%eax
8010324d:	ee                   	out    %al,(%dx)
8010324e:	b3 a0                	mov    $0xa0,%bl
80103250:	89 f8                	mov    %edi,%eax
80103252:	89 da                	mov    %ebx,%edx
80103254:	ee                   	out    %al,(%dx)
80103255:	b8 28 00 00 00       	mov    $0x28,%eax
8010325a:	89 ca                	mov    %ecx,%edx
8010325c:	ee                   	out    %al,(%dx)
8010325d:	b8 02 00 00 00       	mov    $0x2,%eax
80103262:	ee                   	out    %al,(%dx)
80103263:	b8 03 00 00 00       	mov    $0x3,%eax
80103268:	ee                   	out    %al,(%dx)
80103269:	bf 68 00 00 00       	mov    $0x68,%edi
8010326e:	89 f2                	mov    %esi,%edx
80103270:	89 f8                	mov    %edi,%eax
80103272:	ee                   	out    %al,(%dx)
80103273:	b9 0a 00 00 00       	mov    $0xa,%ecx
80103278:	89 c8                	mov    %ecx,%eax
8010327a:	ee                   	out    %al,(%dx)
8010327b:	89 f8                	mov    %edi,%eax
8010327d:	89 da                	mov    %ebx,%edx
8010327f:	ee                   	out    %al,(%dx)
80103280:	89 c8                	mov    %ecx,%eax
80103282:	ee                   	out    %al,(%dx)
  outb(IO_PIC1, 0x0a);             // read IRR by default

  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
80103283:	0f b7 05 00 b0 10 80 	movzwl 0x8010b000,%eax
8010328a:	66 83 f8 ff          	cmp    $0xffff,%ax
8010328e:	74 0a                	je     8010329a <picinit+0x8a>
80103290:	b2 21                	mov    $0x21,%dl
80103292:	ee                   	out    %al,(%dx)
static void
picsetmask(ushort mask)
{
  irqmask = mask;
  outb(IO_PIC1+1, mask);
  outb(IO_PIC2+1, mask >> 8);
80103293:	66 c1 e8 08          	shr    $0x8,%ax
80103297:	b2 a1                	mov    $0xa1,%dl
80103299:	ee                   	out    %al,(%dx)
  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
    picsetmask(irqmask);
}
8010329a:	5b                   	pop    %ebx
8010329b:	5e                   	pop    %esi
8010329c:	5f                   	pop    %edi
8010329d:	5d                   	pop    %ebp
8010329e:	c3                   	ret    
8010329f:	90                   	nop

801032a0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801032a0:	55                   	push   %ebp
801032a1:	89 e5                	mov    %esp,%ebp
801032a3:	57                   	push   %edi
801032a4:	56                   	push   %esi
801032a5:	53                   	push   %ebx
801032a6:	83 ec 0c             	sub    $0xc,%esp
801032a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032ac:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801032af:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801032b5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801032bb:	e8 90 da ff ff       	call   80100d50 <filealloc>
801032c0:	85 c0                	test   %eax,%eax
801032c2:	89 03                	mov    %eax,(%ebx)
801032c4:	0f 84 a8 00 00 00    	je     80103372 <pipealloc+0xd2>
801032ca:	e8 81 da ff ff       	call   80100d50 <filealloc>
801032cf:	85 c0                	test   %eax,%eax
801032d1:	89 06                	mov    %eax,(%esi)
801032d3:	0f 84 87 00 00 00    	je     80103360 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801032d9:	e8 52 f1 ff ff       	call   80102430 <kalloc>
801032de:	85 c0                	test   %eax,%eax
801032e0:	89 c7                	mov    %eax,%edi
801032e2:	0f 84 b0 00 00 00    	je     80103398 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
801032e8:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
801032eb:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801032f2:	00 00 00 
  p->writeopen = 1;
801032f5:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801032fc:	00 00 00 
  p->nwrite = 0;
801032ff:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103306:	00 00 00 
  p->nread = 0;
80103309:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103310:	00 00 00 
  initlock(&p->lock, "pipe");
80103313:	68 c8 7b 10 80       	push   $0x80107bc8
80103318:	50                   	push   %eax
80103319:	e8 52 14 00 00       	call   80104770 <initlock>
  (*f0)->type = FD_PIPE;
8010331e:	8b 03                	mov    (%ebx),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103320:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103323:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103329:	8b 03                	mov    (%ebx),%eax
8010332b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010332f:	8b 03                	mov    (%ebx),%eax
80103331:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103335:	8b 03                	mov    (%ebx),%eax
80103337:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010333a:	8b 06                	mov    (%esi),%eax
8010333c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103342:	8b 06                	mov    (%esi),%eax
80103344:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103348:	8b 06                	mov    (%esi),%eax
8010334a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010334e:	8b 06                	mov    (%esi),%eax
80103350:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103353:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103356:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103358:	5b                   	pop    %ebx
80103359:	5e                   	pop    %esi
8010335a:	5f                   	pop    %edi
8010335b:	5d                   	pop    %ebp
8010335c:	c3                   	ret    
8010335d:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103360:	8b 03                	mov    (%ebx),%eax
80103362:	85 c0                	test   %eax,%eax
80103364:	74 1e                	je     80103384 <pipealloc+0xe4>
    fileclose(*f0);
80103366:	83 ec 0c             	sub    $0xc,%esp
80103369:	50                   	push   %eax
8010336a:	e8 a1 da ff ff       	call   80100e10 <fileclose>
8010336f:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103372:	8b 06                	mov    (%esi),%eax
80103374:	85 c0                	test   %eax,%eax
80103376:	74 0c                	je     80103384 <pipealloc+0xe4>
    fileclose(*f1);
80103378:	83 ec 0c             	sub    $0xc,%esp
8010337b:	50                   	push   %eax
8010337c:	e8 8f da ff ff       	call   80100e10 <fileclose>
80103381:	83 c4 10             	add    $0x10,%esp
  return -1;
}
80103384:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
80103387:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010338c:	5b                   	pop    %ebx
8010338d:	5e                   	pop    %esi
8010338e:	5f                   	pop    %edi
8010338f:	5d                   	pop    %ebp
80103390:	c3                   	ret    
80103391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103398:	8b 03                	mov    (%ebx),%eax
8010339a:	85 c0                	test   %eax,%eax
8010339c:	75 c8                	jne    80103366 <pipealloc+0xc6>
8010339e:	eb d2                	jmp    80103372 <pipealloc+0xd2>

801033a0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801033a0:	55                   	push   %ebp
801033a1:	89 e5                	mov    %esp,%ebp
801033a3:	56                   	push   %esi
801033a4:	53                   	push   %ebx
801033a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033a8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801033ab:	83 ec 0c             	sub    $0xc,%esp
801033ae:	53                   	push   %ebx
801033af:	e8 3c 14 00 00       	call   801047f0 <acquire>
  if(writable){
801033b4:	83 c4 10             	add    $0x10,%esp
801033b7:	85 f6                	test   %esi,%esi
801033b9:	74 45                	je     80103400 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
801033bb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801033c1:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
801033c4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801033cb:	00 00 00 
    wakeup(&p->nread);
801033ce:	50                   	push   %eax
801033cf:	e8 2c 0c 00 00       	call   80104000 <wakeup>
801033d4:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801033d7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801033dd:	85 d2                	test   %edx,%edx
801033df:	75 0a                	jne    801033eb <pipeclose+0x4b>
801033e1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801033e7:	85 c0                	test   %eax,%eax
801033e9:	74 35                	je     80103420 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801033eb:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801033ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033f1:	5b                   	pop    %ebx
801033f2:	5e                   	pop    %esi
801033f3:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801033f4:	e9 27 15 00 00       	jmp    80104920 <release>
801033f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103400:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103406:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103409:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103410:	00 00 00 
    wakeup(&p->nwrite);
80103413:	50                   	push   %eax
80103414:	e8 e7 0b 00 00       	call   80104000 <wakeup>
80103419:	83 c4 10             	add    $0x10,%esp
8010341c:	eb b9                	jmp    801033d7 <pipeclose+0x37>
8010341e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103420:	83 ec 0c             	sub    $0xc,%esp
80103423:	53                   	push   %ebx
80103424:	e8 f7 14 00 00       	call   80104920 <release>
    kfree((char*)p);
80103429:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010342c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010342f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103432:	5b                   	pop    %ebx
80103433:	5e                   	pop    %esi
80103434:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103435:	e9 86 ee ff ff       	jmp    801022c0 <kfree>
8010343a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103440 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103440:	55                   	push   %ebp
80103441:	89 e5                	mov    %esp,%ebp
80103443:	57                   	push   %edi
80103444:	56                   	push   %esi
80103445:	53                   	push   %ebx
80103446:	83 ec 28             	sub    $0x28,%esp
80103449:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
8010344c:	57                   	push   %edi
8010344d:	e8 9e 13 00 00       	call   801047f0 <acquire>
  for(i = 0; i < n; i++){
80103452:	8b 45 10             	mov    0x10(%ebp),%eax
80103455:	83 c4 10             	add    $0x10,%esp
80103458:	85 c0                	test   %eax,%eax
8010345a:	0f 8e c6 00 00 00    	jle    80103526 <pipewrite+0xe6>
80103460:	8b 45 0c             	mov    0xc(%ebp),%eax
80103463:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
80103469:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
8010346f:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103475:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103478:	03 45 10             	add    0x10(%ebp),%eax
8010347b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010347e:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103484:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010348a:	39 d1                	cmp    %edx,%ecx
8010348c:	0f 85 cf 00 00 00    	jne    80103561 <pipewrite+0x121>
      if(p->readopen == 0 || proc->killed){
80103492:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
80103498:	85 d2                	test   %edx,%edx
8010349a:	0f 84 a8 00 00 00    	je     80103548 <pipewrite+0x108>
801034a0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801034a7:	8b 42 24             	mov    0x24(%edx),%eax
801034aa:	85 c0                	test   %eax,%eax
801034ac:	74 25                	je     801034d3 <pipewrite+0x93>
801034ae:	e9 95 00 00 00       	jmp    80103548 <pipewrite+0x108>
801034b3:	90                   	nop
801034b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034b8:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
801034be:	85 c0                	test   %eax,%eax
801034c0:	0f 84 82 00 00 00    	je     80103548 <pipewrite+0x108>
801034c6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801034cc:	8b 40 24             	mov    0x24(%eax),%eax
801034cf:	85 c0                	test   %eax,%eax
801034d1:	75 75                	jne    80103548 <pipewrite+0x108>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801034d3:	83 ec 0c             	sub    $0xc,%esp
801034d6:	56                   	push   %esi
801034d7:	e8 24 0b 00 00       	call   80104000 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801034dc:	59                   	pop    %ecx
801034dd:	58                   	pop    %eax
801034de:	57                   	push   %edi
801034df:	53                   	push   %ebx
801034e0:	e8 6b 09 00 00       	call   80103e50 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034e5:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801034eb:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
801034f1:	83 c4 10             	add    $0x10,%esp
801034f4:	05 00 02 00 00       	add    $0x200,%eax
801034f9:	39 c2                	cmp    %eax,%edx
801034fb:	74 bb                	je     801034b8 <pipewrite+0x78>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801034fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103500:	8d 4a 01             	lea    0x1(%edx),%ecx
80103503:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103507:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010350d:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
80103513:	0f b6 00             	movzbl (%eax),%eax
80103516:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
8010351a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
8010351d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80103520:	0f 85 58 ff ff ff    	jne    8010347e <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103526:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
8010352c:	83 ec 0c             	sub    $0xc,%esp
8010352f:	52                   	push   %edx
80103530:	e8 cb 0a 00 00       	call   80104000 <wakeup>
  release(&p->lock);
80103535:	89 3c 24             	mov    %edi,(%esp)
80103538:	e8 e3 13 00 00       	call   80104920 <release>
  return n;
8010353d:	83 c4 10             	add    $0x10,%esp
80103540:	8b 45 10             	mov    0x10(%ebp),%eax
80103543:	eb 14                	jmp    80103559 <pipewrite+0x119>
80103545:	8d 76 00             	lea    0x0(%esi),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
80103548:	83 ec 0c             	sub    $0xc,%esp
8010354b:	57                   	push   %edi
8010354c:	e8 cf 13 00 00       	call   80104920 <release>
        return -1;
80103551:	83 c4 10             	add    $0x10,%esp
80103554:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103559:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010355c:	5b                   	pop    %ebx
8010355d:	5e                   	pop    %esi
8010355e:	5f                   	pop    %edi
8010355f:	5d                   	pop    %ebp
80103560:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103561:	89 ca                	mov    %ecx,%edx
80103563:	eb 98                	jmp    801034fd <pipewrite+0xbd>
80103565:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103570 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103570:	55                   	push   %ebp
80103571:	89 e5                	mov    %esp,%ebp
80103573:	57                   	push   %edi
80103574:	56                   	push   %esi
80103575:	53                   	push   %ebx
80103576:	83 ec 18             	sub    $0x18,%esp
80103579:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010357c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010357f:	53                   	push   %ebx
80103580:	e8 6b 12 00 00       	call   801047f0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103585:	83 c4 10             	add    $0x10,%esp
80103588:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010358e:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103594:	0f 85 96 00 00 00    	jne    80103630 <piperead+0xc0>
8010359a:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801035a0:	85 f6                	test   %esi,%esi
801035a2:	74 5c                	je     80103600 <piperead+0x90>
801035a4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801035aa:	eb 29                	jmp    801035d5 <piperead+0x65>
801035ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801035b0:	83 ec 08             	sub    $0x8,%esp
801035b3:	53                   	push   %ebx
801035b4:	56                   	push   %esi
801035b5:	e8 96 08 00 00       	call   80103e50 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801035ba:	83 c4 10             	add    $0x10,%esp
801035bd:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
801035c3:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
801035c9:	75 65                	jne    80103630 <piperead+0xc0>
801035cb:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801035d1:	85 d2                	test   %edx,%edx
801035d3:	74 2b                	je     80103600 <piperead+0x90>
    if(proc->killed){
801035d5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801035dc:	8b 4a 24             	mov    0x24(%edx),%ecx
801035df:	85 c9                	test   %ecx,%ecx
801035e1:	74 cd                	je     801035b0 <piperead+0x40>
      release(&p->lock);
801035e3:	83 ec 0c             	sub    $0xc,%esp
801035e6:	53                   	push   %ebx
801035e7:	e8 34 13 00 00       	call   80104920 <release>
      return -1;
801035ec:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801035ef:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
      return -1;
801035f2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801035f7:	5b                   	pop    %ebx
801035f8:	5e                   	pop    %esi
801035f9:	5f                   	pop    %edi
801035fa:	5d                   	pop    %ebp
801035fb:	c3                   	ret    
801035fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103600:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103607:	8d 93 38 02 00 00    	lea    0x238(%ebx),%edx
8010360d:	83 ec 0c             	sub    $0xc,%esp
80103610:	52                   	push   %edx
80103611:	e8 ea 09 00 00       	call   80104000 <wakeup>
  release(&p->lock);
80103616:	89 1c 24             	mov    %ebx,(%esp)
80103619:	e8 02 13 00 00       	call   80104920 <release>
  return i;
8010361e:	8b 45 10             	mov    0x10(%ebp),%eax
80103621:	83 c4 10             	add    $0x10,%esp
}
80103624:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103627:	5b                   	pop    %ebx
80103628:	5e                   	pop    %esi
80103629:	5f                   	pop    %edi
8010362a:	5d                   	pop    %ebp
8010362b:	c3                   	ret    
8010362c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103630:	8b 45 10             	mov    0x10(%ebp),%eax
    if(p->nread == p->nwrite)
80103633:	31 c9                	xor    %ecx,%ecx
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103635:	85 c0                	test   %eax,%eax
80103637:	7e c7                	jle    80103600 <piperead+0x90>
80103639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103640:	8d 72 01             	lea    0x1(%edx),%esi
80103643:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103649:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
8010364f:	0f b6 54 13 34       	movzbl 0x34(%ebx,%edx,1),%edx
80103654:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103657:	83 c1 01             	add    $0x1,%ecx
8010365a:	3b 4d 10             	cmp    0x10(%ebp),%ecx
8010365d:	74 a8                	je     80103607 <piperead+0x97>
    if(p->nread == p->nwrite)
8010365f:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
80103665:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
8010366b:	75 d3                	jne    80103640 <piperead+0xd0>
8010366d:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103670:	eb 95                	jmp    80103607 <piperead+0x97>
80103672:	66 90                	xchg   %ax,%ax
80103674:	66 90                	xchg   %ax,%ax
80103676:	66 90                	xchg   %ax,%ax
80103678:	66 90                	xchg   %ax,%ax
8010367a:	66 90                	xchg   %ax,%ax
8010367c:	66 90                	xchg   %ax,%ax
8010367e:	66 90                	xchg   %ax,%ax

80103680 <allocproc>:
//  If found, change state to EMBRYO and initialize
//  state required to run in the kernel.
//  Otherwise return 0.
static struct proc *
allocproc(void)
{
80103680:	55                   	push   %ebp
80103681:	89 e5                	mov    %esp,%ebp
80103683:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103684:	bb f4 3e 11 80       	mov    $0x80113ef4,%ebx
//  If found, change state to EMBRYO and initialize
//  state required to run in the kernel.
//  Otherwise return 0.
static struct proc *
allocproc(void)
{
80103689:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010368c:	68 c0 3e 11 80       	push   $0x80113ec0
80103691:	e8 5a 11 00 00       	call   801047f0 <acquire>
80103696:	83 c4 10             	add    $0x10,%esp
80103699:	eb 17                	jmp    801036b2 <allocproc+0x32>
8010369b:	90                   	nop
8010369c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801036a0:	81 c3 88 00 00 00    	add    $0x88,%ebx
801036a6:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
801036ac:	0f 84 7e 00 00 00    	je     80103730 <allocproc+0xb0>
    if (p->state == UNUSED)
801036b2:	8b 43 0c             	mov    0xc(%ebx),%eax
801036b5:	85 c0                	test   %eax,%eax
801036b7:	75 e7                	jne    801036a0 <allocproc+0x20>
  return 0;

found:
  // assign default priority to process
  p->state = EMBRYO;
  p->pid = nextpid++;
801036b9:	a1 08 b0 10 80       	mov    0x8010b008,%eax
  p->priority = DEFAULT_PRIOR;

  release(&ptable.lock);
801036be:	83 ec 0c             	sub    $0xc,%esp
  release(&ptable.lock);
  return 0;

found:
  // assign default priority to process
  p->state = EMBRYO;
801036c1:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
  p->priority = DEFAULT_PRIOR;

  release(&ptable.lock);
801036c8:	68 c0 3e 11 80       	push   $0x80113ec0

found:
  // assign default priority to process
  p->state = EMBRYO;
  p->pid = nextpid++;
  p->priority = DEFAULT_PRIOR;
801036cd:	c7 43 7c 14 00 00 00 	movl   $0x14,0x7c(%ebx)
  return 0;

found:
  // assign default priority to process
  p->state = EMBRYO;
  p->pid = nextpid++;
801036d4:	8d 50 01             	lea    0x1(%eax),%edx
801036d7:	89 43 10             	mov    %eax,0x10(%ebx)
801036da:	89 15 08 b0 10 80    	mov    %edx,0x8010b008
  p->priority = DEFAULT_PRIOR;

  release(&ptable.lock);
801036e0:	e8 3b 12 00 00       	call   80104920 <release>

  // Allocate kernel stack.
  if ((p->kstack = kalloc()) == 0)
801036e5:	e8 46 ed ff ff       	call   80102430 <kalloc>
801036ea:	83 c4 10             	add    $0x10,%esp
801036ed:	85 c0                	test   %eax,%eax
801036ef:	89 43 08             	mov    %eax,0x8(%ebx)
801036f2:	74 53                	je     80103747 <allocproc+0xc7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801036f4:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
801036fa:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
801036fd:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103702:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe *)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint *)sp = (uint)trapret;
80103705:	c7 40 14 1b 5d 10 80 	movl   $0x80105d1b,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
8010370c:	6a 14                	push   $0x14
8010370e:	6a 00                	push   $0x0
80103710:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context *)sp;
80103711:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103714:	e8 57 12 00 00       	call   80104970 <memset>
  p->context->eip = (uint)forkret;
80103719:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010371c:	83 c4 10             	add    $0x10,%esp
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
8010371f:	c7 40 10 50 37 10 80 	movl   $0x80103750,0x10(%eax)

  return p;
80103726:	89 d8                	mov    %ebx,%eax
}
80103728:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010372b:	c9                   	leave  
8010372c:	c3                   	ret    
8010372d:	8d 76 00             	lea    0x0(%esi),%esi

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103730:	83 ec 0c             	sub    $0xc,%esp
80103733:	68 c0 3e 11 80       	push   $0x80113ec0
80103738:	e8 e3 11 00 00       	call   80104920 <release>
  return 0;
8010373d:	83 c4 10             	add    $0x10,%esp
80103740:	31 c0                	xor    %eax,%eax
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103742:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103745:	c9                   	leave  
80103746:	c3                   	ret    
  release(&ptable.lock);

  // Allocate kernel stack.
  if ((p->kstack = kalloc()) == 0)
  {
    p->state = UNUSED;
80103747:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010374e:	eb d8                	jmp    80103728 <allocproc+0xa8>

80103750 <forkret>:
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void)
{
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103756:	68 c0 3e 11 80       	push   $0x80113ec0
8010375b:	e8 c0 11 00 00       	call   80104920 <release>

  if (first)
80103760:	a1 04 b0 10 80       	mov    0x8010b004,%eax
80103765:	83 c4 10             	add    $0x10,%esp
80103768:	85 c0                	test   %eax,%eax
8010376a:	75 04                	jne    80103770 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010376c:	c9                   	leave  
8010376d:	c3                   	ret    
8010376e:	66 90                	xchg   %ax,%ax
  {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103770:	83 ec 0c             	sub    $0xc,%esp
  if (first)
  {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103773:	c7 05 04 b0 10 80 00 	movl   $0x0,0x8010b004
8010377a:	00 00 00 
    iinit(ROOTDEV);
8010377d:	6a 01                	push   $0x1
8010377f:	e8 cc dc ff ff       	call   80101450 <iinit>
    initlog(ROOTDEV);
80103784:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010378b:	e8 f0 f2 ff ff       	call   80102a80 <initlog>
80103790:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103793:	c9                   	leave  
80103794:	c3                   	ret    
80103795:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037a0 <myproc>:
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

struct proc *myproc(void)
{
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	53                   	push   %ebx
801037a4:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  pushcli();
801037a7:	e8 f4 10 00 00       	call   801048a0 <pushcli>
  // disable interrupts
  c = &cpus[cpunum()];
801037ac:	e8 5f ef ff ff       	call   80102710 <cpunum>
801037b1:	89 c3                	mov    %eax,%ebx
  // renable interrupts again
  popcli();
  return c->proc;
801037b3:	69 db bc 00 00 00    	imul   $0xbc,%ebx,%ebx
  struct cpu *c;
  pushcli();
  // disable interrupts
  c = &cpus[cpunum()];
  // renable interrupts again
  popcli();
801037b9:	e8 12 11 00 00       	call   801048d0 <popcli>
  return c->proc;
801037be:	8b 83 78 39 11 80    	mov    -0x7feec688(%ebx),%eax
}
801037c4:	83 c4 04             	add    $0x4,%esp
801037c7:	5b                   	pop    %ebx
801037c8:	5d                   	pop    %ebp
801037c9:	c3                   	ret    
801037ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801037d0 <pinit>:
extern void trapret(void);

static void wakeup1(void *chan);

void pinit(void)
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801037d6:	68 cd 7b 10 80       	push   $0x80107bcd
801037db:	68 c0 3e 11 80       	push   $0x80113ec0
801037e0:	e8 8b 0f 00 00       	call   80104770 <initlock>
801037e5:	83 c4 10             	add    $0x10,%esp
}
801037e8:	c9                   	leave  
801037e9:	c3                   	ret    
801037ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801037f0 <userinit>:
}

// PAGEBREAK: 32
//  Set up first user process.
void userinit(void)
{
801037f0:	55                   	push   %ebp
801037f1:	89 e5                	mov    %esp,%ebp
801037f3:	53                   	push   %ebx
801037f4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801037f7:	e8 84 fe ff ff       	call   80103680 <allocproc>
801037fc:	89 c3                	mov    %eax,%ebx

  initproc = p;
801037fe:	a3 dc b5 10 80       	mov    %eax,0x8010b5dc
  if ((p->pgdir = setupkvm()) == 0)
80103803:	e8 68 37 00 00       	call   80106f70 <setupkvm>
80103808:	85 c0                	test   %eax,%eax
8010380a:	89 43 04             	mov    %eax,0x4(%ebx)
8010380d:	0f 84 bd 00 00 00    	je     801038d0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103813:	83 ec 04             	sub    $0x4,%esp
80103816:	68 2c 00 00 00       	push   $0x2c
8010381b:	68 80 b4 10 80       	push   $0x8010b480
80103820:	50                   	push   %eax
80103821:	e8 9a 38 00 00       	call   801070c0 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103826:	83 c4 0c             	add    $0xc,%esp

  initproc = p;
  if ((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103829:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010382f:	6a 4c                	push   $0x4c
80103831:	6a 00                	push   $0x0
80103833:	ff 73 18             	pushl  0x18(%ebx)
80103836:	e8 35 11 00 00       	call   80104970 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010383b:	8b 43 18             	mov    0x18(%ebx),%eax
8010383e:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103843:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0; // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103848:	83 c4 0c             	add    $0xc,%esp
  if ((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010384b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010384f:	8b 43 18             	mov    0x18(%ebx),%eax
80103852:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103856:	8b 43 18             	mov    0x18(%ebx),%eax
80103859:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010385d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103861:	8b 43 18             	mov    0x18(%ebx),%eax
80103864:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103868:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010386c:	8b 43 18             	mov    0x18(%ebx),%eax
8010386f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103876:	8b 43 18             	mov    0x18(%ebx),%eax
80103879:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0; // beginning of initcode.S
80103880:	8b 43 18             	mov    0x18(%ebx),%eax
80103883:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010388a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010388d:	6a 10                	push   $0x10
8010388f:	68 ed 7b 10 80       	push   $0x80107bed
80103894:	50                   	push   %eax
80103895:	e8 d6 12 00 00       	call   80104b70 <safestrcpy>
  p->cwd = namei("/");
8010389a:	c7 04 24 f6 7b 10 80 	movl   $0x80107bf6,(%esp)
801038a1:	e8 ea e5 ff ff       	call   80101e90 <namei>
801038a6:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
801038a9:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
801038b0:	e8 3b 0f 00 00       	call   801047f0 <acquire>

  p->state = RUNNABLE;
801038b5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
801038bc:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
801038c3:	e8 58 10 00 00       	call   80104920 <release>
801038c8:	83 c4 10             	add    $0x10,%esp
}
801038cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038ce:	c9                   	leave  
801038cf:	c3                   	ret    

  p = allocproc();

  initproc = p;
  if ((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801038d0:	83 ec 0c             	sub    $0xc,%esp
801038d3:	68 d4 7b 10 80       	push   $0x80107bd4
801038d8:	e8 93 ca ff ff       	call   80100370 <panic>
801038dd:	8d 76 00             	lea    0x0(%esi),%esi

801038e0 <growproc>:
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n)
{
801038e0:	55                   	push   %ebp
801038e1:	89 e5                	mov    %esp,%ebp
801038e3:	83 ec 08             	sub    $0x8,%esp
  uint sz;

  sz = proc->sz;
801038e6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n)
{
801038ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
801038f0:	8b 02                	mov    (%edx),%eax
  if (n > 0)
801038f2:	83 f9 00             	cmp    $0x0,%ecx
801038f5:	7e 39                	jle    80103930 <growproc+0x50>
  {
    if ((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
801038f7:	83 ec 04             	sub    $0x4,%esp
801038fa:	01 c1                	add    %eax,%ecx
801038fc:	51                   	push   %ecx
801038fd:	50                   	push   %eax
801038fe:	ff 72 04             	pushl  0x4(%edx)
80103901:	e8 fa 38 00 00       	call   80107200 <allocuvm>
80103906:	83 c4 10             	add    $0x10,%esp
80103909:	85 c0                	test   %eax,%eax
8010390b:	74 43                	je     80103950 <growproc+0x70>
8010390d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  else if (n < 0)
  {
    if ((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
80103914:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103916:	83 ec 0c             	sub    $0xc,%esp
80103919:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
80103920:	e8 fb 36 00 00       	call   80107020 <switchuvm>
  return 0;
80103925:	83 c4 10             	add    $0x10,%esp
80103928:	31 c0                	xor    %eax,%eax
}
8010392a:	c9                   	leave  
8010392b:	c3                   	ret    
8010392c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (n > 0)
  {
    if ((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  else if (n < 0)
80103930:	74 e2                	je     80103914 <growproc+0x34>
  {
    if ((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103932:	83 ec 04             	sub    $0x4,%esp
80103935:	01 c1                	add    %eax,%ecx
80103937:	51                   	push   %ecx
80103938:	50                   	push   %eax
80103939:	ff 72 04             	pushl  0x4(%edx)
8010393c:	e8 af 39 00 00       	call   801072f0 <deallocuvm>
80103941:	83 c4 10             	add    $0x10,%esp
80103944:	85 c0                	test   %eax,%eax
80103946:	75 c5                	jne    8010390d <growproc+0x2d>
80103948:	90                   	nop
80103949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if (n > 0)
  {
    if ((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
80103950:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
80103955:	c9                   	leave  
80103956:	c3                   	ret    
80103957:	89 f6                	mov    %esi,%esi
80103959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103960 <fork>:

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int fork(void)
{
80103960:	55                   	push   %ebp
80103961:	89 e5                	mov    %esp,%ebp
80103963:	57                   	push   %edi
80103964:	56                   	push   %esi
80103965:	53                   	push   %ebx
80103966:	83 ec 0c             	sub    $0xc,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if ((np = allocproc()) == 0)
80103969:	e8 12 fd ff ff       	call   80103680 <allocproc>
8010396e:	85 c0                	test   %eax,%eax
80103970:	89 c3                	mov    %eax,%ebx
80103972:	0f 84 dc 00 00 00    	je     80103a54 <fork+0xf4>
  {
    return -1;
  }

  // Copy process state from p.
  if ((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0)
80103978:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010397e:	83 ec 08             	sub    $0x8,%esp
80103981:	ff 30                	pushl  (%eax)
80103983:	ff 70 04             	pushl  0x4(%eax)
80103986:	e8 45 3a 00 00       	call   801073d0 <copyuvm>
8010398b:	83 c4 10             	add    $0x10,%esp
8010398e:	85 c0                	test   %eax,%eax
80103990:	89 43 04             	mov    %eax,0x4(%ebx)
80103993:	0f 84 c2 00 00 00    	je     80103a5b <fork+0xfb>
    return -1;
  }
  // NOTE: this was done for lab2, which specifies to modify the priority
  // value to have a default of 20
  np->priority = DEFAULT_PRIOR;
  np->sz = proc->sz;
80103999:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    np->state = UNUSED;
    return -1;
  }
  // NOTE: this was done for lab2, which specifies to modify the priority
  // value to have a default of 20
  np->priority = DEFAULT_PRIOR;
8010399f:	c7 43 7c 14 00 00 00 	movl   $0x14,0x7c(%ebx)
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;
801039a6:	b9 13 00 00 00       	mov    $0x13,%ecx
801039ab:	8b 7b 18             	mov    0x18(%ebx),%edi
    return -1;
  }
  // NOTE: this was done for lab2, which specifies to modify the priority
  // value to have a default of 20
  np->priority = DEFAULT_PRIOR;
  np->sz = proc->sz;
801039ae:	8b 00                	mov    (%eax),%eax
801039b0:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
801039b2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801039b8:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
801039bb:	8b 70 18             	mov    0x18(%eax),%esi
801039be:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for (i = 0; i < NOFILE; i++)
801039c0:	31 f6                	xor    %esi,%esi
  np->priority = DEFAULT_PRIOR;
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;
  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
801039c2:	8b 43 18             	mov    0x18(%ebx),%eax
801039c5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801039cc:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801039d3:	90                   	nop
801039d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for (i = 0; i < NOFILE; i++)
    if (proc->ofile[i])
801039d8:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
801039dc:	85 c0                	test   %eax,%eax
801039de:	74 17                	je     801039f7 <fork+0x97>
      np->ofile[i] = filedup(proc->ofile[i]);
801039e0:	83 ec 0c             	sub    $0xc,%esp
801039e3:	50                   	push   %eax
801039e4:	e8 d7 d3 ff ff       	call   80100dc0 <filedup>
801039e9:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
801039ed:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801039f4:	83 c4 10             	add    $0x10,%esp
  np->parent = proc;
  *np->tf = *proc->tf;
  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for (i = 0; i < NOFILE; i++)
801039f7:	83 c6 01             	add    $0x1,%esi
801039fa:	83 fe 10             	cmp    $0x10,%esi
801039fd:	75 d9                	jne    801039d8 <fork+0x78>
    if (proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
801039ff:	83 ec 0c             	sub    $0xc,%esp
80103a02:	ff 72 68             	pushl  0x68(%edx)
80103a05:	e8 16 dc ff ff       	call   80101620 <idup>
80103a0a:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103a0d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a13:	83 c4 0c             	add    $0xc,%esp
80103a16:	6a 10                	push   $0x10
80103a18:	83 c0 6c             	add    $0x6c,%eax
80103a1b:	50                   	push   %eax
80103a1c:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a1f:	50                   	push   %eax
80103a20:	e8 4b 11 00 00       	call   80104b70 <safestrcpy>

  pid = np->pid;
80103a25:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103a28:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80103a2f:	e8 bc 0d 00 00       	call   801047f0 <acquire>

  np->state = RUNNABLE;
80103a34:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103a3b:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80103a42:	e8 d9 0e 00 00       	call   80104920 <release>

  return pid;
80103a47:	83 c4 10             	add    $0x10,%esp
80103a4a:	89 f0                	mov    %esi,%eax
}
80103a4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a4f:	5b                   	pop    %ebx
80103a50:	5e                   	pop    %esi
80103a51:	5f                   	pop    %edi
80103a52:	5d                   	pop    %ebp
80103a53:	c3                   	ret    
  struct proc *np;

  // Allocate process.
  if ((np = allocproc()) == 0)
  {
    return -1;
80103a54:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a59:	eb f1                	jmp    80103a4c <fork+0xec>
  }

  // Copy process state from p.
  if ((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0)
  {
    kfree(np->kstack);
80103a5b:	83 ec 0c             	sub    $0xc,%esp
80103a5e:	ff 73 08             	pushl  0x8(%ebx)
80103a61:	e8 5a e8 ff ff       	call   801022c0 <kfree>
    np->kstack = 0;
80103a66:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103a6d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103a74:	83 c4 10             	add    $0x10,%esp
80103a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a7c:	eb ce                	jmp    80103a4c <fork+0xec>
80103a7e:	66 90                	xchg   %ax,%ax

80103a80 <round_robin>:
//   - choose a process to run
//   - swtch to start running that process
//   - eventually that process transfers control
//       via swtch back to the scheduler.
void round_robin(void)
{
80103a80:	55                   	push   %ebp
80103a81:	89 e5                	mov    %esp,%ebp
80103a83:	53                   	push   %ebx
  acquire(&ptable.lock);
  struct proc *p;
  // loop over the proceses table and find somehting that is runnable
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103a84:	bb f4 3e 11 80       	mov    $0x80113ef4,%ebx
//   - choose a process to run
//   - swtch to start running that process
//   - eventually that process transfers control
//       via swtch back to the scheduler.
void round_robin(void)
{
80103a89:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
80103a8c:	68 c0 3e 11 80       	push   $0x80113ec0
80103a91:	e8 5a 0d 00 00       	call   801047f0 <acquire>
80103a96:	83 c4 10             	add    $0x10,%esp
80103a99:	eb 13                	jmp    80103aae <round_robin+0x2e>
80103a9b:	90                   	nop
80103a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct proc *p;
  // loop over the proceses table and find somehting that is runnable
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103aa0:	81 c3 88 00 00 00    	add    $0x88,%ebx
80103aa6:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
80103aac:	74 52                	je     80103b00 <round_robin+0x80>
  {
    if (p->state != RUNNABLE)
80103aae:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103ab2:	75 ec                	jne    80103aa0 <round_robin+0x20>

    // Switch to chosen process.  It is the process's job
    // to release ptable.lock and then reacquire it
    // before jumping back to us.
    proc = p;
    switchuvm(p);
80103ab4:	83 ec 0c             	sub    $0xc,%esp
      continue;

    // Switch to chosen process.  It is the process's job
    // to release ptable.lock and then reacquire it
    // before jumping back to us.
    proc = p;
80103ab7:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
    switchuvm(p);
80103abe:	53                   	push   %ebx
void round_robin(void)
{
  acquire(&ptable.lock);
  struct proc *p;
  // loop over the proceses table and find somehting that is runnable
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103abf:	81 c3 88 00 00 00    	add    $0x88,%ebx

    // Switch to chosen process.  It is the process's job
    // to release ptable.lock and then reacquire it
    // before jumping back to us.
    proc = p;
    switchuvm(p);
80103ac5:	e8 56 35 00 00       	call   80107020 <switchuvm>
    p->state = RUNNING;
    swtch(&cpu->scheduler, p->context);
80103aca:	58                   	pop    %eax
80103acb:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
    // Switch to chosen process.  It is the process's job
    // to release ptable.lock and then reacquire it
    // before jumping back to us.
    proc = p;
    switchuvm(p);
    p->state = RUNNING;
80103ad1:	c7 43 84 04 00 00 00 	movl   $0x4,-0x7c(%ebx)
    swtch(&cpu->scheduler, p->context);
80103ad8:	5a                   	pop    %edx
80103ad9:	ff 73 94             	pushl  -0x6c(%ebx)
80103adc:	83 c0 04             	add    $0x4,%eax
80103adf:	50                   	push   %eax
80103ae0:	e8 e6 10 00 00       	call   80104bcb <swtch>
    switchkvm();
80103ae5:	e8 16 35 00 00       	call   80107000 <switchkvm>

    // Process is done running for now.
    // It should have changed its p->state before coming back.
    proc = 0;
80103aea:	83 c4 10             	add    $0x10,%esp
void round_robin(void)
{
  acquire(&ptable.lock);
  struct proc *p;
  // loop over the proceses table and find somehting that is runnable
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103aed:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
    swtch(&cpu->scheduler, p->context);
    switchkvm();

    // Process is done running for now.
    // It should have changed its p->state before coming back.
    proc = 0;
80103af3:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103afa:	00 00 00 00 
void round_robin(void)
{
  acquire(&ptable.lock);
  struct proc *p;
  // loop over the proceses table and find somehting that is runnable
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103afe:	75 ae                	jne    80103aae <round_robin+0x2e>

    // Process is done running for now.
    // It should have changed its p->state before coming back.
    proc = 0;
  }
  release(&ptable.lock);
80103b00:	83 ec 0c             	sub    $0xc,%esp
80103b03:	68 c0 3e 11 80       	push   $0x80113ec0
80103b08:	e8 13 0e 00 00       	call   80104920 <release>
80103b0d:	83 c4 10             	add    $0x10,%esp
}
80103b10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b13:	c9                   	leave  
80103b14:	c3                   	ret    
80103b15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b20 <priority>:

void priority(void)
{
80103b20:	55                   	push   %ebp
80103b21:	89 e5                	mov    %esp,%ebp
80103b23:	53                   	push   %ebx
  acquire(&ptable.lock);
  struct proc *p;  // process picked via round_robin
  struct proc *hp; // high priority process (might be prioritized if runnable)
  // first part is just like round robin
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b24:	bb f4 3e 11 80       	mov    $0x80113ef4,%ebx
  }
  release(&ptable.lock);
}

void priority(void)
{
80103b29:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
80103b2c:	68 c0 3e 11 80       	push   $0x80113ec0
80103b31:	e8 ba 0c 00 00       	call   801047f0 <acquire>
80103b36:	83 c4 10             	add    $0x10,%esp
80103b39:	eb 17                	jmp    80103b52 <priority+0x32>
80103b3b:	90                   	nop
80103b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct proc *p;  // process picked via round_robin
  struct proc *hp; // high priority process (might be prioritized if runnable)
  // first part is just like round robin
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b40:	81 c3 88 00 00 00    	add    $0x88,%ebx
80103b46:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
80103b4c:	0f 83 8e 00 00 00    	jae    80103be0 <priority+0xc0>
  {
    if (p->state != RUNNABLE)
80103b52:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103b56:	75 e8                	jne    80103b40 <priority+0x20>
80103b58:	b8 f4 3e 11 80       	mov    $0x80113ef4,%eax
80103b5d:	eb 0d                	jmp    80103b6c <priority+0x4c>
80103b5f:	90                   	nop
      continue;
    // now try to find a high priority process than the runnable process we just pick
    // if so, scheduler that process instead, neglecting/starving the lower priority process
    for (hp = ptable.proc; hp < &ptable.proc[NPROC]; hp++)
80103b60:	05 88 00 00 00       	add    $0x88,%eax
80103b65:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
80103b6a:	74 24                	je     80103b90 <priority+0x70>
    {
      if (hp->priority < p->priority && hp->state == RUNNABLE)
80103b6c:	8b 53 7c             	mov    0x7c(%ebx),%edx
80103b6f:	39 50 7c             	cmp    %edx,0x7c(%eax)
80103b72:	7d ec                	jge    80103b60 <priority+0x40>
80103b74:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103b78:	75 e6                	jne    80103b60 <priority+0x40>
80103b7a:	89 c3                	mov    %eax,%ebx
  {
    if (p->state != RUNNABLE)
      continue;
    // now try to find a high priority process than the runnable process we just pick
    // if so, scheduler that process instead, neglecting/starving the lower priority process
    for (hp = ptable.proc; hp < &ptable.proc[NPROC]; hp++)
80103b7c:	05 88 00 00 00       	add    $0x88,%eax
80103b81:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
80103b86:	75 e4                	jne    80103b6c <priority+0x4c>
80103b88:	90                   	nop
80103b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        p = hp;
      }
    }
    proc = p;
    // preform the context switch, load user virtual mem
    switchuvm(p);
80103b90:	83 ec 0c             	sub    $0xc,%esp
      if (hp->priority < p->priority && hp->state == RUNNABLE)
      {
        p = hp;
      }
    }
    proc = p;
80103b93:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
    // preform the context switch, load user virtual mem
    switchuvm(p);
80103b9a:	53                   	push   %ebx
{
  acquire(&ptable.lock);
  struct proc *p;  // process picked via round_robin
  struct proc *hp; // high priority process (might be prioritized if runnable)
  // first part is just like round robin
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b9b:	81 c3 88 00 00 00    	add    $0x88,%ebx
        p = hp;
      }
    }
    proc = p;
    // preform the context switch, load user virtual mem
    switchuvm(p);
80103ba1:	e8 7a 34 00 00       	call   80107020 <switchuvm>
    p->state = RUNNING;
80103ba6:	c7 43 84 04 00 00 00 	movl   $0x4,-0x7c(%ebx)
    swtch(&cpu->scheduler, p->context);
80103bad:	58                   	pop    %eax
80103bae:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103bb4:	5a                   	pop    %edx
80103bb5:	ff 73 94             	pushl  -0x6c(%ebx)
80103bb8:	83 c0 04             	add    $0x4,%eax
80103bbb:	50                   	push   %eax
80103bbc:	e8 0a 10 00 00       	call   80104bcb <swtch>
    // switch back to kernel mode, load kernel virtual mem
    switchkvm();
80103bc1:	e8 3a 34 00 00       	call   80107000 <switchkvm>
    // Process is done running for now.
    // It should have changed its p->state before coming back.
    proc = 0;
80103bc6:	83 c4 10             	add    $0x10,%esp
{
  acquire(&ptable.lock);
  struct proc *p;  // process picked via round_robin
  struct proc *hp; // high priority process (might be prioritized if runnable)
  // first part is just like round robin
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103bc9:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
    swtch(&cpu->scheduler, p->context);
    // switch back to kernel mode, load kernel virtual mem
    switchkvm();
    // Process is done running for now.
    // It should have changed its p->state before coming back.
    proc = 0;
80103bcf:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103bd6:	00 00 00 00 
{
  acquire(&ptable.lock);
  struct proc *p;  // process picked via round_robin
  struct proc *hp; // high priority process (might be prioritized if runnable)
  // first part is just like round robin
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103bda:	0f 82 72 ff ff ff    	jb     80103b52 <priority+0x32>
    switchkvm();
    // Process is done running for now.
    // It should have changed its p->state before coming back.
    proc = 0;
  }
  release(&ptable.lock);
80103be0:	83 ec 0c             	sub    $0xc,%esp
80103be3:	68 c0 3e 11 80       	push   $0x80113ec0
80103be8:	e8 33 0d 00 00       	call   80104920 <release>
80103bed:	83 c4 10             	add    $0x10,%esp
}
80103bf0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103bf3:	c9                   	leave  
80103bf4:	c3                   	ret    
80103bf5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c00 <scheduler>:

void scheduler(void)
{
80103c00:	55                   	push   %ebp
80103c01:	89 e5                	mov    %esp,%ebp
80103c03:	83 ec 08             	sub    $0x8,%esp
80103c06:	8d 76 00             	lea    0x0(%esi),%esi
80103c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103c10:	fb                   	sti    
  for (;;)
  {
    // Enable interrupts on this processor.
    sti();
    priority();
80103c11:	e8 0a ff ff ff       	call   80103b20 <priority>
  }
80103c16:	eb f8                	jmp    80103c10 <scheduler+0x10>
80103c18:	90                   	nop
80103c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103c20 <sched>:
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void sched(void)
{
80103c20:	55                   	push   %ebp
80103c21:	89 e5                	mov    %esp,%ebp
80103c23:	53                   	push   %ebx
80103c24:	83 ec 10             	sub    $0x10,%esp
  int intena;

  if (!holding(&ptable.lock))
80103c27:	68 c0 3e 11 80       	push   $0x80113ec0
80103c2c:	e8 4f 0c 00 00       	call   80104880 <holding>
80103c31:	83 c4 10             	add    $0x10,%esp
80103c34:	85 c0                	test   %eax,%eax
80103c36:	74 4c                	je     80103c84 <sched+0x64>
    panic("sched ptable.lock");
  if (cpu->ncli != 1)
80103c38:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103c3f:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103c46:	75 63                	jne    80103cab <sched+0x8b>
    panic("sched locks");
  if (proc->state == RUNNING)
80103c48:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c4e:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103c52:	74 4a                	je     80103c9e <sched+0x7e>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103c54:	9c                   	pushf  
80103c55:	59                   	pop    %ecx
    panic("sched running");
  if (readeflags() & FL_IF)
80103c56:	80 e5 02             	and    $0x2,%ch
80103c59:	75 36                	jne    80103c91 <sched+0x71>
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
80103c5b:	83 ec 08             	sub    $0x8,%esp
80103c5e:	83 c0 1c             	add    $0x1c,%eax
    panic("sched locks");
  if (proc->state == RUNNING)
    panic("sched running");
  if (readeflags() & FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
80103c61:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103c67:	ff 72 04             	pushl  0x4(%edx)
80103c6a:	50                   	push   %eax
80103c6b:	e8 5b 0f 00 00       	call   80104bcb <swtch>
  cpu->intena = intena;
80103c70:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103c76:	83 c4 10             	add    $0x10,%esp
80103c79:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103c7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c82:	c9                   	leave  
80103c83:	c3                   	ret    
void sched(void)
{
  int intena;

  if (!holding(&ptable.lock))
    panic("sched ptable.lock");
80103c84:	83 ec 0c             	sub    $0xc,%esp
80103c87:	68 f8 7b 10 80       	push   $0x80107bf8
80103c8c:	e8 df c6 ff ff       	call   80100370 <panic>
  if (cpu->ncli != 1)
    panic("sched locks");
  if (proc->state == RUNNING)
    panic("sched running");
  if (readeflags() & FL_IF)
    panic("sched interruptible");
80103c91:	83 ec 0c             	sub    $0xc,%esp
80103c94:	68 24 7c 10 80       	push   $0x80107c24
80103c99:	e8 d2 c6 ff ff       	call   80100370 <panic>
  if (!holding(&ptable.lock))
    panic("sched ptable.lock");
  if (cpu->ncli != 1)
    panic("sched locks");
  if (proc->state == RUNNING)
    panic("sched running");
80103c9e:	83 ec 0c             	sub    $0xc,%esp
80103ca1:	68 16 7c 10 80       	push   $0x80107c16
80103ca6:	e8 c5 c6 ff ff       	call   80100370 <panic>
  int intena;

  if (!holding(&ptable.lock))
    panic("sched ptable.lock");
  if (cpu->ncli != 1)
    panic("sched locks");
80103cab:	83 ec 0c             	sub    $0xc,%esp
80103cae:	68 0a 7c 10 80       	push   $0x80107c0a
80103cb3:	e8 b8 c6 ff ff       	call   80100370 <panic>
80103cb8:	90                   	nop
80103cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103cc0 <exit>:
void exit(void)
{
  struct proc *p;
  int fd;

  if (proc == initproc)
80103cc0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103cc7:	3b 15 dc b5 10 80    	cmp    0x8010b5dc,%edx

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(void)
{
80103ccd:	55                   	push   %ebp
80103cce:	89 e5                	mov    %esp,%ebp
80103cd0:	56                   	push   %esi
80103cd1:	53                   	push   %ebx
  struct proc *p;
  int fd;

  if (proc == initproc)
80103cd2:	0f 84 29 01 00 00    	je     80103e01 <exit+0x141>
80103cd8:	31 db                	xor    %ebx,%ebx
80103cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for (fd = 0; fd < NOFILE; fd++)
  {
    if (proc->ofile[fd])
80103ce0:	8d 73 08             	lea    0x8(%ebx),%esi
80103ce3:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103ce7:	85 c0                	test   %eax,%eax
80103ce9:	74 1b                	je     80103d06 <exit+0x46>
    {
      fileclose(proc->ofile[fd]);
80103ceb:	83 ec 0c             	sub    $0xc,%esp
80103cee:	50                   	push   %eax
80103cef:	e8 1c d1 ff ff       	call   80100e10 <fileclose>
      proc->ofile[fd] = 0;
80103cf4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103cfb:	83 c4 10             	add    $0x10,%esp
80103cfe:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103d05:	00 

  if (proc == initproc)
    panic("init exiting");

  // Close all open files.
  for (fd = 0; fd < NOFILE; fd++)
80103d06:	83 c3 01             	add    $0x1,%ebx
80103d09:	83 fb 10             	cmp    $0x10,%ebx
80103d0c:	75 d2                	jne    80103ce0 <exit+0x20>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103d0e:	e8 0d ee ff ff       	call   80102b20 <begin_op>
  iput(proc->cwd);
80103d13:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d19:	83 ec 0c             	sub    $0xc,%esp
80103d1c:	ff 70 68             	pushl  0x68(%eax)
80103d1f:	e8 5c da ff ff       	call   80101780 <iput>
  end_op();
80103d24:	e8 67 ee ff ff       	call   80102b90 <end_op>
  proc->cwd = 0;
80103d29:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d2f:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103d36:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80103d3d:	e8 ae 0a 00 00       	call   801047f0 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103d42:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103d49:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d4c:	b8 f4 3e 11 80       	mov    $0x80113ef4,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103d51:	8b 51 14             	mov    0x14(%ecx),%edx
80103d54:	eb 16                	jmp    80103d6c <exit+0xac>
80103d56:	8d 76 00             	lea    0x0(%esi),%esi
80103d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d60:	05 88 00 00 00       	add    $0x88,%eax
80103d65:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
80103d6a:	74 1e                	je     80103d8a <exit+0xca>
    if (p->state == SLEEPING && p->chan == chan)
80103d6c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d70:	75 ee                	jne    80103d60 <exit+0xa0>
80103d72:	3b 50 20             	cmp    0x20(%eax),%edx
80103d75:	75 e9                	jne    80103d60 <exit+0xa0>
      p->state = RUNNABLE;
80103d77:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d7e:	05 88 00 00 00       	add    $0x88,%eax
80103d83:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
80103d88:	75 e2                	jne    80103d6c <exit+0xac>
  // Pass abandoned children to init.
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->parent == proc)
    {
      p->parent = initproc;
80103d8a:	8b 1d dc b5 10 80    	mov    0x8010b5dc,%ebx
80103d90:	ba f4 3e 11 80       	mov    $0x80113ef4,%edx
80103d95:	eb 17                	jmp    80103dae <exit+0xee>
80103d97:	89 f6                	mov    %esi,%esi
80103d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103da0:	81 c2 88 00 00 00    	add    $0x88,%edx
80103da6:	81 fa f4 60 11 80    	cmp    $0x801160f4,%edx
80103dac:	74 3a                	je     80103de8 <exit+0x128>
  {
    if (p->parent == proc)
80103dae:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103db1:	75 ed                	jne    80103da0 <exit+0xe0>
    {
      p->parent = initproc;
      if (p->state == ZOMBIE)
80103db3:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  // Pass abandoned children to init.
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->parent == proc)
    {
      p->parent = initproc;
80103db7:	89 5a 14             	mov    %ebx,0x14(%edx)
      if (p->state == ZOMBIE)
80103dba:	75 e4                	jne    80103da0 <exit+0xe0>
80103dbc:	b8 f4 3e 11 80       	mov    $0x80113ef4,%eax
80103dc1:	eb 11                	jmp    80103dd4 <exit+0x114>
80103dc3:	90                   	nop
80103dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dc8:	05 88 00 00 00       	add    $0x88,%eax
80103dcd:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
80103dd2:	74 cc                	je     80103da0 <exit+0xe0>
    if (p->state == SLEEPING && p->chan == chan)
80103dd4:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103dd8:	75 ee                	jne    80103dc8 <exit+0x108>
80103dda:	3b 58 20             	cmp    0x20(%eax),%ebx
80103ddd:	75 e9                	jne    80103dc8 <exit+0x108>
      p->state = RUNNABLE;
80103ddf:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103de6:	eb e0                	jmp    80103dc8 <exit+0x108>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103de8:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103def:	e8 2c fe ff ff       	call   80103c20 <sched>
  panic("zombie exit");
80103df4:	83 ec 0c             	sub    $0xc,%esp
80103df7:	68 45 7c 10 80       	push   $0x80107c45
80103dfc:	e8 6f c5 ff ff       	call   80100370 <panic>
{
  struct proc *p;
  int fd;

  if (proc == initproc)
    panic("init exiting");
80103e01:	83 ec 0c             	sub    $0xc,%esp
80103e04:	68 38 7c 10 80       	push   $0x80107c38
80103e09:	e8 62 c5 ff ff       	call   80100370 <panic>
80103e0e:	66 90                	xchg   %ax,%ax

80103e10 <yield>:
  cpu->intena = intena;
}

// Give up the CPU for one scheduling round.
void yield(void)
{
80103e10:	55                   	push   %ebp
80103e11:	89 e5                	mov    %esp,%ebp
80103e13:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock); // DOC: yieldlock
80103e16:	68 c0 3e 11 80       	push   $0x80113ec0
80103e1b:	e8 d0 09 00 00       	call   801047f0 <acquire>
  proc->state = RUNNABLE;
80103e20:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e26:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103e2d:	e8 ee fd ff ff       	call   80103c20 <sched>
  release(&ptable.lock);
80103e32:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80103e39:	e8 e2 0a 00 00       	call   80104920 <release>
80103e3e:	83 c4 10             	add    $0x10,%esp
}
80103e41:	c9                   	leave  
80103e42:	c3                   	ret    
80103e43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103e50 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
  if (proc == 0)
80103e50:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
80103e56:	55                   	push   %ebp
80103e57:	89 e5                	mov    %esp,%ebp
80103e59:	56                   	push   %esi
80103e5a:	53                   	push   %ebx
  if (proc == 0)
80103e5b:	85 c0                	test   %eax,%eax
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
80103e5d:	8b 75 08             	mov    0x8(%ebp),%esi
80103e60:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if (proc == 0)
80103e63:	0f 84 97 00 00 00    	je     80103f00 <sleep+0xb0>
    panic("sleep");

  if (lk == 0)
80103e69:	85 db                	test   %ebx,%ebx
80103e6b:	0f 84 82 00 00 00    	je     80103ef3 <sleep+0xa3>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if (lk != &ptable.lock)
80103e71:	81 fb c0 3e 11 80    	cmp    $0x80113ec0,%ebx
80103e77:	74 57                	je     80103ed0 <sleep+0x80>
  {                        // DOC: sleeplock0
    acquire(&ptable.lock); // DOC: sleeplock1
80103e79:	83 ec 0c             	sub    $0xc,%esp
80103e7c:	68 c0 3e 11 80       	push   $0x80113ec0
80103e81:	e8 6a 09 00 00       	call   801047f0 <acquire>
    release(lk);
80103e86:	89 1c 24             	mov    %ebx,(%esp)
80103e89:	e8 92 0a 00 00       	call   80104920 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103e8e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e94:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103e97:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103e9e:	e8 7d fd ff ff       	call   80103c20 <sched>

  // Tidy up.
  proc->chan = 0;
80103ea3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ea9:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if (lk != &ptable.lock)
  { // DOC: sleeplock2
    release(&ptable.lock);
80103eb0:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80103eb7:	e8 64 0a 00 00       	call   80104920 <release>
    acquire(lk);
80103ebc:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103ebf:	83 c4 10             	add    $0x10,%esp
  }
}
80103ec2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ec5:	5b                   	pop    %ebx
80103ec6:	5e                   	pop    %esi
80103ec7:	5d                   	pop    %ebp

  // Reacquire original lock.
  if (lk != &ptable.lock)
  { // DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103ec8:	e9 23 09 00 00       	jmp    801047f0 <acquire>
80103ecd:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&ptable.lock); // DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103ed0:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103ed3:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103eda:	e8 41 fd ff ff       	call   80103c20 <sched>

  // Tidy up.
  proc->chan = 0;
80103edf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ee5:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  if (lk != &ptable.lock)
  { // DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103eec:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103eef:	5b                   	pop    %ebx
80103ef0:	5e                   	pop    %esi
80103ef1:	5d                   	pop    %ebp
80103ef2:	c3                   	ret    
{
  if (proc == 0)
    panic("sleep");

  if (lk == 0)
    panic("sleep without lk");
80103ef3:	83 ec 0c             	sub    $0xc,%esp
80103ef6:	68 57 7c 10 80       	push   $0x80107c57
80103efb:	e8 70 c4 ff ff       	call   80100370 <panic>
// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
  if (proc == 0)
    panic("sleep");
80103f00:	83 ec 0c             	sub    $0xc,%esp
80103f03:	68 51 7c 10 80       	push   $0x80107c51
80103f08:	e8 63 c4 ff ff       	call   80100370 <panic>
80103f0d:	8d 76 00             	lea    0x0(%esi),%esi

80103f10 <wait>:
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int wait(void)
{
80103f10:	55                   	push   %ebp
80103f11:	89 e5                	mov    %esp,%ebp
80103f13:	56                   	push   %esi
80103f14:	53                   	push   %ebx
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80103f15:	83 ec 0c             	sub    $0xc,%esp
80103f18:	68 c0 3e 11 80       	push   $0x80113ec0
80103f1d:	e8 ce 08 00 00       	call   801047f0 <acquire>
80103f22:	83 c4 10             	add    $0x10,%esp
80103f25:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for (;;)
  {
    // Scan through table looking for exited children.
    havekids = 0;
80103f2b:	31 d2                	xor    %edx,%edx
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f2d:	bb f4 3e 11 80       	mov    $0x80113ef4,%ebx
80103f32:	eb 12                	jmp    80103f46 <wait+0x36>
80103f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f38:	81 c3 88 00 00 00    	add    $0x88,%ebx
80103f3e:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
80103f44:	74 22                	je     80103f68 <wait+0x58>
    {
      if (p->parent != proc)
80103f46:	3b 43 14             	cmp    0x14(%ebx),%eax
80103f49:	75 ed                	jne    80103f38 <wait+0x28>
        continue;
      havekids = 1;
      if (p->state == ZOMBIE)
80103f4b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103f4f:	74 35                	je     80103f86 <wait+0x76>
  acquire(&ptable.lock);
  for (;;)
  {
    // Scan through table looking for exited children.
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f51:	81 c3 88 00 00 00    	add    $0x88,%ebx
    {
      if (p->parent != proc)
        continue;
      havekids = 1;
80103f57:	ba 01 00 00 00       	mov    $0x1,%edx
  acquire(&ptable.lock);
  for (;;)
  {
    // Scan through table looking for exited children.
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f5c:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
80103f62:	75 e2                	jne    80103f46 <wait+0x36>
80103f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if (!havekids || proc->killed)
80103f68:	85 d2                	test   %edx,%edx
80103f6a:	74 70                	je     80103fdc <wait+0xcc>
80103f6c:	8b 50 24             	mov    0x24(%eax),%edx
80103f6f:	85 d2                	test   %edx,%edx
80103f71:	75 69                	jne    80103fdc <wait+0xcc>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock); // DOC: wait-sleep
80103f73:	83 ec 08             	sub    $0x8,%esp
80103f76:	68 c0 3e 11 80       	push   $0x80113ec0
80103f7b:	50                   	push   %eax
80103f7c:	e8 cf fe ff ff       	call   80103e50 <sleep>
  }
80103f81:	83 c4 10             	add    $0x10,%esp
80103f84:	eb 9f                	jmp    80103f25 <wait+0x15>
      havekids = 1;
      if (p->state == ZOMBIE)
      {
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103f86:	83 ec 0c             	sub    $0xc,%esp
80103f89:	ff 73 08             	pushl  0x8(%ebx)
        continue;
      havekids = 1;
      if (p->state == ZOMBIE)
      {
        // Found one.
        pid = p->pid;
80103f8c:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103f8f:	e8 2c e3 ff ff       	call   801022c0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103f94:	59                   	pop    %ecx
80103f95:	ff 73 04             	pushl  0x4(%ebx)
      if (p->state == ZOMBIE)
      {
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103f98:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103f9f:	e8 7c 33 00 00       	call   80107320 <freevm>
        p->pid = 0;
80103fa4:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103fab:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103fb2:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103fb6:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103fbd:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103fc4:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80103fcb:	e8 50 09 00 00       	call   80104920 <release>
        return pid;
80103fd0:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock); // DOC: wait-sleep
  }
}
80103fd3:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103fd6:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock); // DOC: wait-sleep
  }
}
80103fd8:	5b                   	pop    %ebx
80103fd9:	5e                   	pop    %esi
80103fda:	5d                   	pop    %ebp
80103fdb:	c3                   	ret    
    }

    // No point waiting if we don't have any children.
    if (!havekids || proc->killed)
    {
      release(&ptable.lock);
80103fdc:	83 ec 0c             	sub    $0xc,%esp
80103fdf:	68 c0 3e 11 80       	push   $0x80113ec0
80103fe4:	e8 37 09 00 00       	call   80104920 <release>
      return -1;
80103fe9:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock); // DOC: wait-sleep
  }
}
80103fec:	8d 65 f8             	lea    -0x8(%ebp),%esp

    // No point waiting if we don't have any children.
    if (!havekids || proc->killed)
    {
      release(&ptable.lock);
      return -1;
80103fef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock); // DOC: wait-sleep
  }
}
80103ff4:	5b                   	pop    %ebx
80103ff5:	5e                   	pop    %esi
80103ff6:	5d                   	pop    %ebp
80103ff7:	c3                   	ret    
80103ff8:	90                   	nop
80103ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104000 <wakeup>:
      p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
80104000:	55                   	push   %ebp
80104001:	89 e5                	mov    %esp,%ebp
80104003:	53                   	push   %ebx
80104004:	83 ec 10             	sub    $0x10,%esp
80104007:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010400a:	68 c0 3e 11 80       	push   $0x80113ec0
8010400f:	e8 dc 07 00 00       	call   801047f0 <acquire>
80104014:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104017:	b8 f4 3e 11 80       	mov    $0x80113ef4,%eax
8010401c:	eb 0e                	jmp    8010402c <wakeup+0x2c>
8010401e:	66 90                	xchg   %ax,%ax
80104020:	05 88 00 00 00       	add    $0x88,%eax
80104025:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
8010402a:	74 24                	je     80104050 <wakeup+0x50>
    if (p->state == SLEEPING && p->chan == chan)
8010402c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104030:	75 ee                	jne    80104020 <wakeup+0x20>
80104032:	3b 58 20             	cmp    0x20(%eax),%ebx
80104035:	75 e9                	jne    80104020 <wakeup+0x20>
      p->state = RUNNABLE;
80104037:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010403e:	05 88 00 00 00       	add    $0x88,%eax
80104043:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
80104048:	75 e2                	jne    8010402c <wakeup+0x2c>
8010404a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104050:	c7 45 08 c0 3e 11 80 	movl   $0x80113ec0,0x8(%ebp)
}
80104057:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010405a:	c9                   	leave  
// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
8010405b:	e9 c0 08 00 00       	jmp    80104920 <release>

80104060 <kill>:

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid)
{
80104060:	55                   	push   %ebp
80104061:	89 e5                	mov    %esp,%ebp
80104063:	53                   	push   %ebx
80104064:	83 ec 10             	sub    $0x10,%esp
80104067:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010406a:	68 c0 3e 11 80       	push   $0x80113ec0
8010406f:	e8 7c 07 00 00       	call   801047f0 <acquire>
80104074:	83 c4 10             	add    $0x10,%esp
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104077:	b8 f4 3e 11 80       	mov    $0x80113ef4,%eax
8010407c:	eb 0e                	jmp    8010408c <kill+0x2c>
8010407e:	66 90                	xchg   %ax,%ax
80104080:	05 88 00 00 00       	add    $0x88,%eax
80104085:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
8010408a:	74 3c                	je     801040c8 <kill+0x68>
  {
    if (p->pid == pid)
8010408c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010408f:	75 ef                	jne    80104080 <kill+0x20>
    {
      p->killed = 1;
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING)
80104091:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->pid == pid)
    {
      p->killed = 1;
80104095:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING)
8010409c:	74 1a                	je     801040b8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
8010409e:	83 ec 0c             	sub    $0xc,%esp
801040a1:	68 c0 3e 11 80       	push   $0x80113ec0
801040a6:	e8 75 08 00 00       	call   80104920 <release>
      return 0;
801040ab:	83 c4 10             	add    $0x10,%esp
801040ae:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
801040b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040b3:	c9                   	leave  
801040b4:	c3                   	ret    
801040b5:	8d 76 00             	lea    0x0(%esi),%esi
    if (p->pid == pid)
    {
      p->killed = 1;
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING)
        p->state = RUNNABLE;
801040b8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801040bf:	eb dd                	jmp    8010409e <kill+0x3e>
801040c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
801040c8:	83 ec 0c             	sub    $0xc,%esp
801040cb:	68 c0 3e 11 80       	push   $0x80113ec0
801040d0:	e8 4b 08 00 00       	call   80104920 <release>
  return -1;
801040d5:	83 c4 10             	add    $0x10,%esp
801040d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801040dd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040e0:	c9                   	leave  
801040e1:	c3                   	ret    
801040e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801040e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040f0 <procdump>:
// PAGEBREAK: 36
//  Print a process listing to console.  For debugging.
//  Runs when user types ^P on console.
//  No lock to avoid wedging a stuck machine further.
void procdump(void)
{
801040f0:	55                   	push   %ebp
801040f1:	89 e5                	mov    %esp,%ebp
801040f3:	57                   	push   %edi
801040f4:	56                   	push   %esi
801040f5:	53                   	push   %ebx
801040f6:	8d 75 e8             	lea    -0x18(%ebp),%esi
801040f9:	bb 60 3f 11 80       	mov    $0x80113f60,%ebx
801040fe:	83 ec 3c             	sub    $0x3c,%esp
80104101:	eb 27                	jmp    8010412a <procdump+0x3a>
80104103:	90                   	nop
80104104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
      for (i = 0; i < 10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104108:	83 ec 0c             	sub    $0xc,%esp
8010410b:	68 a6 7b 10 80       	push   $0x80107ba6
80104110:	e8 4b c5 ff ff       	call   80100660 <cprintf>
80104115:	83 c4 10             	add    $0x10,%esp
80104118:	81 c3 88 00 00 00    	add    $0x88,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010411e:	81 fb 60 61 11 80    	cmp    $0x80116160,%ebx
80104124:	0f 84 86 00 00 00    	je     801041b0 <procdump+0xc0>
  {
    if (p->state == UNUSED)
8010412a:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010412d:	85 c0                	test   %eax,%eax
8010412f:	74 e7                	je     80104118 <procdump+0x28>
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104131:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104134:	ba 68 7c 10 80       	mov    $0x80107c68,%edx

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104139:	77 0b                	ja     80104146 <procdump+0x56>
8010413b:	8b 14 85 ec 7c 10 80 	mov    -0x7fef8314(,%eax,4),%edx
80104142:	85 d2                	test   %edx,%edx
80104144:	74 62                	je     801041a8 <procdump+0xb8>
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
80104146:	53                   	push   %ebx
80104147:	52                   	push   %edx
80104148:	ff 73 a4             	pushl  -0x5c(%ebx)
8010414b:	68 6c 7c 10 80       	push   $0x80107c6c
80104150:	e8 0b c5 ff ff       	call   80100660 <cprintf>
    if (p->state == SLEEPING)
80104155:	83 c4 10             	add    $0x10,%esp
80104158:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010415c:	75 aa                	jne    80104108 <procdump+0x18>
    {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
8010415e:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104161:	83 ec 08             	sub    $0x8,%esp
80104164:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104167:	50                   	push   %eax
80104168:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010416b:	8b 40 0c             	mov    0xc(%eax),%eax
8010416e:	83 c0 08             	add    $0x8,%eax
80104171:	50                   	push   %eax
80104172:	e8 19 06 00 00       	call   80104790 <getcallerpcs>
80104177:	83 c4 10             	add    $0x10,%esp
8010417a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      for (i = 0; i < 10 && pc[i] != 0; i++)
80104180:	8b 17                	mov    (%edi),%edx
80104182:	85 d2                	test   %edx,%edx
80104184:	74 82                	je     80104108 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104186:	83 ec 08             	sub    $0x8,%esp
80104189:	83 c7 04             	add    $0x4,%edi
8010418c:	52                   	push   %edx
8010418d:	68 89 76 10 80       	push   $0x80107689
80104192:	e8 c9 c4 ff ff       	call   80100660 <cprintf>
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if (p->state == SLEEPING)
    {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
      for (i = 0; i < 10 && pc[i] != 0; i++)
80104197:	83 c4 10             	add    $0x10,%esp
8010419a:	39 f7                	cmp    %esi,%edi
8010419c:	75 e2                	jne    80104180 <procdump+0x90>
8010419e:	e9 65 ff ff ff       	jmp    80104108 <procdump+0x18>
801041a3:	90                   	nop
801041a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
801041a8:	ba 68 7c 10 80       	mov    $0x80107c68,%edx
801041ad:	eb 97                	jmp    80104146 <procdump+0x56>
801041af:	90                   	nop
      for (i = 0; i < 10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801041b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041b3:	5b                   	pop    %ebx
801041b4:	5e                   	pop    %esi
801041b5:	5f                   	pop    %edi
801041b6:	5d                   	pop    %ebp
801041b7:	c3                   	ret    
801041b8:	90                   	nop
801041b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801041c0 <set_priority>:

int set_priority(int pid, int priority)
{
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	56                   	push   %esi
801041c4:	53                   	push   %ebx
801041c5:	8b 75 0c             	mov    0xc(%ebp),%esi
801041c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // pointer to process (need to use pid to actually obtain it)
  struct proc *proc;
  // acquire mutex lock for process table
  // since we modify information, we won't to make sure process info will not change
  // before we have set the our proceess priority
  acquire(&ptable.lock);
801041cb:	83 ec 0c             	sub    $0xc,%esp
801041ce:	68 c0 3e 11 80       	push   $0x80113ec0
801041d3:	e8 18 06 00 00       	call   801047f0 <acquire>
801041d8:	83 c4 10             	add    $0x10,%esp

  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
801041db:	b9 f4 3e 11 80       	mov    $0x80113ef4,%ecx
801041e0:	eb 14                	jmp    801041f6 <set_priority+0x36>
801041e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041e8:	81 c1 88 00 00 00    	add    $0x88,%ecx
801041ee:	81 f9 f4 60 11 80    	cmp    $0x801160f4,%ecx
801041f4:	74 5a                	je     80104250 <set_priority+0x90>
  {
    // loop through ptable entries and find our process
    // using the pid given
    if (proc->pid == pid)
801041f6:	39 59 10             	cmp    %ebx,0x10(%ecx)
801041f9:	75 ed                	jne    801041e8 <set_priority+0x28>
    {
      // use a mod to clamp values to range [0,39] for the priority
      priority = (priority % MAX_PRIOR + MAX_PRIOR) % MAX_PRIOR;
801041fb:	bb 67 66 66 66       	mov    $0x66666667,%ebx
80104200:	89 f0                	mov    %esi,%eax
      // set the priority
      proc->priority = priority;
      // release the mutex lock on process table
      release(&ptable.lock);
80104202:	83 ec 0c             	sub    $0xc,%esp
    // loop through ptable entries and find our process
    // using the pid given
    if (proc->pid == pid)
    {
      // use a mod to clamp values to range [0,39] for the priority
      priority = (priority % MAX_PRIOR + MAX_PRIOR) % MAX_PRIOR;
80104205:	f7 eb                	imul   %ebx
80104207:	89 f0                	mov    %esi,%eax
80104209:	c1 f8 1f             	sar    $0x1f,%eax
8010420c:	c1 fa 04             	sar    $0x4,%edx
8010420f:	29 c2                	sub    %eax,%edx
80104211:	8d 04 92             	lea    (%edx,%edx,4),%eax
80104214:	c1 e0 03             	shl    $0x3,%eax
80104217:	29 c6                	sub    %eax,%esi
80104219:	83 c6 28             	add    $0x28,%esi
8010421c:	89 f0                	mov    %esi,%eax
8010421e:	f7 eb                	imul   %ebx
80104220:	89 f0                	mov    %esi,%eax
80104222:	c1 f8 1f             	sar    $0x1f,%eax
80104225:	c1 fa 04             	sar    $0x4,%edx
80104228:	29 c2                	sub    %eax,%edx
8010422a:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010422d:	c1 e0 03             	shl    $0x3,%eax
80104230:	29 c6                	sub    %eax,%esi
80104232:	89 71 7c             	mov    %esi,0x7c(%ecx)
      // set the priority
      proc->priority = priority;
      // release the mutex lock on process table
      release(&ptable.lock);
80104235:	68 c0 3e 11 80       	push   $0x80113ec0
8010423a:	e8 e1 06 00 00       	call   80104920 <release>
      // exit out with a success val
      return 0;
8010423f:	83 c4 10             	add    $0x10,%esp
    }
  }
  // if we can't find the process just return an error and release mutex
  release(&ptable.lock);
  return -1;
}
80104242:	8d 65 f8             	lea    -0x8(%ebp),%esp
      // set the priority
      proc->priority = priority;
      // release the mutex lock on process table
      release(&ptable.lock);
      // exit out with a success val
      return 0;
80104245:	31 c0                	xor    %eax,%eax
    }
  }
  // if we can't find the process just return an error and release mutex
  release(&ptable.lock);
  return -1;
}
80104247:	5b                   	pop    %ebx
80104248:	5e                   	pop    %esi
80104249:	5d                   	pop    %ebp
8010424a:	c3                   	ret    
8010424b:	90                   	nop
8010424c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      // exit out with a success val
      return 0;
    }
  }
  // if we can't find the process just return an error and release mutex
  release(&ptable.lock);
80104250:	83 ec 0c             	sub    $0xc,%esp
80104253:	68 c0 3e 11 80       	push   $0x80113ec0
80104258:	e8 c3 06 00 00       	call   80104920 <release>
  return -1;
8010425d:	83 c4 10             	add    $0x10,%esp
}
80104260:	8d 65 f8             	lea    -0x8(%ebp),%esp
      return 0;
    }
  }
  // if we can't find the process just return an error and release mutex
  release(&ptable.lock);
  return -1;
80104263:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104268:	5b                   	pop    %ebx
80104269:	5e                   	pop    %esi
8010426a:	5d                   	pop    %ebp
8010426b:	c3                   	ret    
8010426c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104270 <get_priority>:

int get_priority(int pid)
{
80104270:	55                   	push   %ebp
80104271:	89 e5                	mov    %esp,%ebp
80104273:	53                   	push   %ebx
80104274:	83 ec 10             	sub    $0x10,%esp
80104277:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // pointer to process info
  struct proc *proc;
  acquire(&ptable.lock);
8010427a:	68 c0 3e 11 80       	push   $0x80113ec0
8010427f:	e8 6c 05 00 00       	call   801047f0 <acquire>
80104284:	83 c4 10             	add    $0x10,%esp
  // loop through process table until we find our process id
  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
80104287:	b8 f4 3e 11 80       	mov    $0x80113ef4,%eax
8010428c:	eb 0e                	jmp    8010429c <get_priority+0x2c>
8010428e:	66 90                	xchg   %ax,%ax
80104290:	05 88 00 00 00       	add    $0x88,%eax
80104295:	3d f4 60 11 80       	cmp    $0x801160f4,%eax
8010429a:	74 24                	je     801042c0 <get_priority+0x50>
  {
    // found our process!
    if (proc->pid == pid)
8010429c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010429f:	75 ef                	jne    80104290 <get_priority+0x20>
    {
      int priority = proc->priority;
801042a1:	8b 58 7c             	mov    0x7c(%eax),%ebx
      release(&ptable.lock);
801042a4:	83 ec 0c             	sub    $0xc,%esp
801042a7:	68 c0 3e 11 80       	push   $0x80113ec0
801042ac:	e8 6f 06 00 00       	call   80104920 <release>
      // return back the priority of the matched process
      return priority;
801042b1:	89 d8                	mov    %ebx,%eax
801042b3:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ptable.lock);
  // if we can't find the process by the pid, just return error val
  return -1;
}
801042b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042b9:	c9                   	leave  
801042ba:	c3                   	ret    
801042bb:	90                   	nop
801042bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      // return back the priority of the matched process
      return priority;
    }
  }
  release(&ptable.lock);
801042c0:	83 ec 0c             	sub    $0xc,%esp
801042c3:	68 c0 3e 11 80       	push   $0x80113ec0
801042c8:	e8 53 06 00 00       	call   80104920 <release>
  // if we can't find the process by the pid, just return error val
  return -1;
801042cd:	83 c4 10             	add    $0x10,%esp
801042d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801042d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042d8:	c9                   	leave  
801042d9:	c3                   	ret    
801042da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801042e0 <cps>:

int cps(void)
{
801042e0:	55                   	push   %ebp
801042e1:	89 e5                	mov    %esp,%ebp
801042e3:	53                   	push   %ebx
801042e4:	bb 60 3f 11 80       	mov    $0x80113f60,%ebx
801042e9:	83 ec 10             	sub    $0x10,%esp
  struct proc *proc;
  // acquire to mutex of process table to avoid
  // concurrency issue with writers messing up reads
  acquire(&ptable.lock);
801042ec:	68 c0 3e 11 80       	push   $0x80113ec0
801042f1:	e8 fa 04 00 00       	call   801047f0 <acquire>
801042f6:	83 c4 10             	add    $0x10,%esp
801042f9:	eb 1d                	jmp    80104318 <cps+0x38>
801042fb:	90                   	nop
801042fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  // loop over the process table using pid
  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
  {
    if (proc->state == SLEEPING)
      cprintf("%s \t %d \t SLEEPING \t %d \n", proc->name, proc->pid, proc->priority);
    else if (proc->state == RUNNING)
80104300:	83 f8 04             	cmp    $0x4,%eax
80104303:	74 5b                	je     80104360 <cps+0x80>
      cprintf("%s \t %d \t RUNNING \t %d \n", proc->name, proc->pid, proc->priority);
    else if (proc->state == RUNNABLE)
80104305:	83 f8 03             	cmp    $0x3,%eax
80104308:	74 76                	je     80104380 <cps+0xa0>
8010430a:	81 c3 88 00 00 00    	add    $0x88,%ebx
  struct proc *proc;
  // acquire to mutex of process table to avoid
  // concurrency issue with writers messing up reads
  acquire(&ptable.lock);
  // loop over the process table using pid
  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
80104310:	81 fb 60 61 11 80    	cmp    $0x80116160,%ebx
80104316:	74 30                	je     80104348 <cps+0x68>
  {
    if (proc->state == SLEEPING)
80104318:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010431b:	83 f8 02             	cmp    $0x2,%eax
8010431e:	75 e0                	jne    80104300 <cps+0x20>
      cprintf("%s \t %d \t SLEEPING \t %d \n", proc->name, proc->pid, proc->priority);
80104320:	ff 73 10             	pushl  0x10(%ebx)
80104323:	ff 73 a4             	pushl  -0x5c(%ebx)
80104326:	53                   	push   %ebx
80104327:	68 75 7c 10 80       	push   $0x80107c75
8010432c:	81 c3 88 00 00 00    	add    $0x88,%ebx
80104332:	e8 29 c3 ff ff       	call   80100660 <cprintf>
80104337:	83 c4 10             	add    $0x10,%esp
  struct proc *proc;
  // acquire to mutex of process table to avoid
  // concurrency issue with writers messing up reads
  acquire(&ptable.lock);
  // loop over the process table using pid
  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
8010433a:	81 fb 60 61 11 80    	cmp    $0x80116160,%ebx
80104340:	75 d6                	jne    80104318 <cps+0x38>
80104342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cprintf("%s \t %d \t RUNNING \t %d \n", proc->name, proc->pid, proc->priority);
    else if (proc->state == RUNNABLE)
      cprintf("%s \t %d \t RUNNABLE \t %d \n", proc->name, proc->pid, proc->priority);
  }
  // release the mutex
  release(&ptable.lock);
80104348:	83 ec 0c             	sub    $0xc,%esp
8010434b:	68 c0 3e 11 80       	push   $0x80113ec0
80104350:	e8 cb 05 00 00       	call   80104920 <release>
  return 0;
}
80104355:	31 c0                	xor    %eax,%eax
80104357:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010435a:	c9                   	leave  
8010435b:	c3                   	ret    
8010435c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for (proc = ptable.proc; proc < &ptable.proc[NPROC]; proc++)
  {
    if (proc->state == SLEEPING)
      cprintf("%s \t %d \t SLEEPING \t %d \n", proc->name, proc->pid, proc->priority);
    else if (proc->state == RUNNING)
      cprintf("%s \t %d \t RUNNING \t %d \n", proc->name, proc->pid, proc->priority);
80104360:	ff 73 10             	pushl  0x10(%ebx)
80104363:	ff 73 a4             	pushl  -0x5c(%ebx)
80104366:	53                   	push   %ebx
80104367:	68 8f 7c 10 80       	push   $0x80107c8f
8010436c:	e8 ef c2 ff ff       	call   80100660 <cprintf>
80104371:	83 c4 10             	add    $0x10,%esp
80104374:	eb 94                	jmp    8010430a <cps+0x2a>
80104376:	8d 76 00             	lea    0x0(%esi),%esi
80104379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    else if (proc->state == RUNNABLE)
      cprintf("%s \t %d \t RUNNABLE \t %d \n", proc->name, proc->pid, proc->priority);
80104380:	ff 73 10             	pushl  0x10(%ebx)
80104383:	ff 73 a4             	pushl  -0x5c(%ebx)
80104386:	53                   	push   %ebx
80104387:	68 a8 7c 10 80       	push   $0x80107ca8
8010438c:	e8 cf c2 ff ff       	call   80100660 <cprintf>
80104391:	83 c4 10             	add    $0x10,%esp
80104394:	e9 71 ff ff ff       	jmp    8010430a <cps+0x2a>
80104399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801043a0 <thread_create>:
  release(&ptable.lock);
  return 0;
}

int thread_create(void (*fn)(void *), void *stack, void *arg)
{
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	57                   	push   %edi
801043a4:	56                   	push   %esi
801043a5:	53                   	push   %ebx
801043a6:	83 ec 1c             	sub    $0x1c,%esp
801043a9:	8b 55 0c             	mov    0xc(%ebp),%edx
801043ac:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int i;
  struct proc *np;
  struct proc *curproc = myproc();
801043af:	e8 ec f3 ff ff       	call   801037a0 <myproc>
801043b4:	89 c7                	mov    %eax,%edi
801043b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)

  // allocate the process
  if ((np = allocproc()) == 0)
801043b9:	e8 c2 f2 ff ff       	call   80103680 <allocproc>
801043be:	85 c0                	test   %eax,%eax
801043c0:	89 c3                	mov    %eax,%ebx
801043c2:	0f 84 d2 00 00 00    	je     8010449a <thread_create+0xfa>
    return -1;

  // make it so that the space is shared with the parent
  np->pgdir = curproc->pgdir;
801043c8:	8b 47 04             	mov    0x4(%edi),%eax
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // create user stack
  np->ustack = stack;
801043cb:	8b 55 e0             	mov    -0x20(%ebp),%edx

  // make it so that the space is shared with the parent
  np->pgdir = curproc->pgdir;
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;
801043ce:	b9 13 00 00 00       	mov    $0x13,%ecx
801043d3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  // allocate the process
  if ((np = allocproc()) == 0)
    return -1;

  // make it so that the space is shared with the parent
  np->pgdir = curproc->pgdir;
801043d6:	89 43 04             	mov    %eax,0x4(%ebx)
  np->sz = curproc->sz;
801043d9:	8b 07                	mov    (%edi),%eax
  np->parent = curproc;
801043db:	89 7b 14             	mov    %edi,0x14(%ebx)
  if ((np = allocproc()) == 0)
    return -1;

  // make it so that the space is shared with the parent
  np->pgdir = curproc->pgdir;
  np->sz = curproc->sz;
801043de:	89 03                	mov    %eax,(%ebx)
  np->ustack = stack;
  uint sp = (uint)stack + PGSIZE;

  // push argument onto the stack
  sp -= sizeof(arg);
  *(uint *)sp = (uint)arg;
801043e0:	8b 45 10             	mov    0x10(%ebp),%eax

  // make it so that the space is shared with the parent
  np->pgdir = curproc->pgdir;
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;
801043e3:	8b 77 18             	mov    0x18(%edi),%esi
801043e6:	8b 7b 18             	mov    0x18(%ebx),%edi
801043e9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // create user stack
  np->ustack = stack;
801043eb:	89 93 80 00 00 00    	mov    %edx,0x80(%ebx)
  // push argument onto the stack
  sp -= sizeof(arg);
  *(uint *)sp = (uint)arg;

  // push fake return address (0xFFFFFFFF, as given in lab)
  sp -= sizeof(uint);
801043f1:	8d 8a f8 0f 00 00    	lea    0xff8(%edx),%ecx
  np->ustack = stack;
  uint sp = (uint)stack + PGSIZE;

  // push argument onto the stack
  sp -= sizeof(arg);
  *(uint *)sp = (uint)arg;
801043f7:	89 82 fc 0f 00 00    	mov    %eax,0xffc(%edx)

  // push fake return address (0xFFFFFFFF, as given in lab)
  sp -= sizeof(uint);
  *(uint *)sp = 0xFFFFFFFF;
801043fd:	c7 82 f8 0f 00 00 ff 	movl   $0xffffffff,0xff8(%edx)
80104404:	ff ff ff 

  // set up the trap for the new thread
  np->tf->eip = (uint)fn;
80104407:	8b 55 08             	mov    0x8(%ebp),%edx

  // mark this process as a thread.
  np->isthread = 1;

  // inherit parents attributes
  for (i = 0; i < NOFILE; i++)
8010440a:	31 f6                	xor    %esi,%esi
  // push fake return address (0xFFFFFFFF, as given in lab)
  sp -= sizeof(uint);
  *(uint *)sp = 0xFFFFFFFF;

  // set up the trap for the new thread
  np->tf->eip = (uint)fn;
8010440c:	8b 43 18             	mov    0x18(%ebx),%eax

  // mark this process as a thread.
  np->isthread = 1;

  // inherit parents attributes
  for (i = 0; i < NOFILE; i++)
8010440f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  // push fake return address (0xFFFFFFFF, as given in lab)
  sp -= sizeof(uint);
  *(uint *)sp = 0xFFFFFFFF;

  // set up the trap for the new thread
  np->tf->eip = (uint)fn;
80104412:	89 50 38             	mov    %edx,0x38(%eax)
  np->tf->esp = sp;
80104415:	8b 43 18             	mov    0x18(%ebx),%eax
80104418:	89 48 44             	mov    %ecx,0x44(%eax)

  // mark this process as a thread.
  np->isthread = 1;
8010441b:	c7 83 84 00 00 00 01 	movl   $0x1,0x84(%ebx)
80104422:	00 00 00 
80104425:	8d 76 00             	lea    0x0(%esi),%esi

  // inherit parents attributes
  for (i = 0; i < NOFILE; i++)
    if (curproc->ofile[i])
80104428:	8b 44 b7 28          	mov    0x28(%edi,%esi,4),%eax
8010442c:	85 c0                	test   %eax,%eax
8010442e:	74 10                	je     80104440 <thread_create+0xa0>
      np->ofile[i] = filedup(curproc->ofile[i]);
80104430:	83 ec 0c             	sub    $0xc,%esp
80104433:	50                   	push   %eax
80104434:	e8 87 c9 ff ff       	call   80100dc0 <filedup>
80104439:	83 c4 10             	add    $0x10,%esp
8010443c:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)

  // mark this process as a thread.
  np->isthread = 1;

  // inherit parents attributes
  for (i = 0; i < NOFILE; i++)
80104440:	83 c6 01             	add    $0x1,%esi
80104443:	83 fe 10             	cmp    $0x10,%esi
80104446:	75 e0                	jne    80104428 <thread_create+0x88>
    if (curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80104448:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010444b:	83 ec 0c             	sub    $0xc,%esp
8010444e:	ff 77 68             	pushl  0x68(%edi)
80104451:	e8 ca d1 ff ff       	call   80101620 <idup>
80104456:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80104459:	89 f8                	mov    %edi,%eax
8010445b:	83 c4 0c             	add    $0xc,%esp
8010445e:	83 c0 6c             	add    $0x6c,%eax
80104461:	6a 10                	push   $0x10
80104463:	50                   	push   %eax
80104464:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104467:	50                   	push   %eax
80104468:	e8 03 07 00 00       	call   80104b70 <safestrcpy>

  acquire(&ptable.lock);
8010446d:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80104474:	e8 77 03 00 00       	call   801047f0 <acquire>
  np->state = RUNNABLE;
80104479:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80104480:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80104487:	e8 94 04 00 00       	call   80104920 <release>

  return np->pid;
8010448c:	8b 43 10             	mov    0x10(%ebx),%eax
8010448f:	83 c4 10             	add    $0x10,%esp
}
80104492:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104495:	5b                   	pop    %ebx
80104496:	5e                   	pop    %esi
80104497:	5f                   	pop    %edi
80104498:	5d                   	pop    %ebp
80104499:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // allocate the process
  if ((np = allocproc()) == 0)
    return -1;
8010449a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010449f:	eb f1                	jmp    80104492 <thread_create+0xf2>
801044a1:	eb 0d                	jmp    801044b0 <thread_exit>
801044a3:	90                   	nop
801044a4:	90                   	nop
801044a5:	90                   	nop
801044a6:	90                   	nop
801044a7:	90                   	nop
801044a8:	90                   	nop
801044a9:	90                   	nop
801044aa:	90                   	nop
801044ab:	90                   	nop
801044ac:	90                   	nop
801044ad:	90                   	nop
801044ae:	90                   	nop
801044af:	90                   	nop

801044b0 <thread_exit>:

  return np->pid;
}

void thread_exit(void)
{
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	57                   	push   %edi
801044b4:	56                   	push   %esi
801044b5:	53                   	push   %ebx
801044b6:	83 ec 0c             	sub    $0xc,%esp
  struct proc *curproc = myproc();
801044b9:	e8 e2 f2 ff ff       	call   801037a0 <myproc>

  if (curproc == initproc)
801044be:	3b 05 dc b5 10 80    	cmp    0x8010b5dc,%eax
  return np->pid;
}

void thread_exit(void)
{
  struct proc *curproc = myproc();
801044c4:	89 c6                	mov    %eax,%esi
801044c6:	8d 58 28             	lea    0x28(%eax),%ebx
801044c9:	8d 78 68             	lea    0x68(%eax),%edi

  if (curproc == initproc)
801044cc:	0f 84 a7 00 00 00    	je     80104579 <thread_exit+0xc9>
801044d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // close all open files
  int fd;
  for (fd = 0; fd < NOFILE; fd++)
  {
    if (curproc->ofile[fd])
801044d8:	8b 03                	mov    (%ebx),%eax
801044da:	85 c0                	test   %eax,%eax
801044dc:	74 12                	je     801044f0 <thread_exit+0x40>
    {
      fileclose(curproc->ofile[fd]);
801044de:	83 ec 0c             	sub    $0xc,%esp
801044e1:	50                   	push   %eax
801044e2:	e8 29 c9 ff ff       	call   80100e10 <fileclose>
      curproc->ofile[fd] = 0;
801044e7:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801044ed:	83 c4 10             	add    $0x10,%esp
801044f0:	83 c3 04             	add    $0x4,%ebx
  if (curproc == initproc)
    panic("init exiting");

  // close all open files
  int fd;
  for (fd = 0; fd < NOFILE; fd++)
801044f3:	39 fb                	cmp    %edi,%ebx
801044f5:	75 e1                	jne    801044d8 <thread_exit+0x28>
      curproc->ofile[fd] = 0;
    }
  }

  // release current directory
  begin_op();
801044f7:	e8 24 e6 ff ff       	call   80102b20 <begin_op>
  iput(curproc->cwd);
801044fc:	83 ec 0c             	sub    $0xc,%esp
801044ff:	ff 76 68             	pushl  0x68(%esi)
80104502:	e8 79 d2 ff ff       	call   80101780 <iput>
  end_op();
80104507:	e8 84 e6 ff ff       	call   80102b90 <end_op>
  curproc->cwd = 0;
8010450c:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80104513:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
8010451a:	e8 d1 02 00 00       	call   801047f0 <acquire>

  // Wake up the parent thread if the thread is complete
  wakeup1(curproc->parent);
8010451f:	8b 46 14             	mov    0x14(%esi),%eax
80104522:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104525:	ba f4 3e 11 80       	mov    $0x80113ef4,%edx
8010452a:	eb 12                	jmp    8010453e <thread_exit+0x8e>
8010452c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104530:	81 c2 88 00 00 00    	add    $0x88,%edx
80104536:	81 fa f4 60 11 80    	cmp    $0x801160f4,%edx
8010453c:	74 22                	je     80104560 <thread_exit+0xb0>
    if (p->state == SLEEPING && p->chan == chan)
8010453e:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80104542:	75 ec                	jne    80104530 <thread_exit+0x80>
80104544:	3b 42 20             	cmp    0x20(%edx),%eax
80104547:	75 e7                	jne    80104530 <thread_exit+0x80>
      p->state = RUNNABLE;
80104549:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104550:	81 c2 88 00 00 00    	add    $0x88,%edx
80104556:	81 fa f4 60 11 80    	cmp    $0x801160f4,%edx
8010455c:	75 e0                	jne    8010453e <thread_exit+0x8e>
8010455e:	66 90                	xchg   %ax,%ax

  // Wake up the parent thread if the thread is complete
  wakeup1(curproc->parent);

  // mark process as ZOMBIE and schedule more
  curproc->state = ZOMBIE;
80104560:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)

  // jump into the scheduler, and don't return
  sched();
80104567:	e8 b4 f6 ff ff       	call   80103c20 <sched>
  panic("zombie exit");
8010456c:	83 ec 0c             	sub    $0xc,%esp
8010456f:	68 45 7c 10 80       	push   $0x80107c45
80104574:	e8 f7 bd ff ff       	call   80100370 <panic>
void thread_exit(void)
{
  struct proc *curproc = myproc();

  if (curproc == initproc)
    panic("init exiting");
80104579:	83 ec 0c             	sub    $0xc,%esp
8010457c:	68 38 7c 10 80       	push   $0x80107c38
80104581:	e8 ea bd ff ff       	call   80100370 <panic>
80104586:	8d 76 00             	lea    0x0(%esi),%esi
80104589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104590 <thread_join>:
  sched();
  panic("zombie exit");
}

int thread_join(void)
{
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	56                   	push   %esi
80104594:	53                   	push   %ebx
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
80104595:	e8 06 f2 ff ff       	call   801037a0 <myproc>

  acquire(&ptable.lock);
8010459a:	83 ec 0c             	sub    $0xc,%esp

int thread_join(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
8010459d:	89 c6                	mov    %eax,%esi

  acquire(&ptable.lock);
8010459f:	68 c0 3e 11 80       	push   $0x80113ec0
801045a4:	e8 47 02 00 00       	call   801047f0 <acquire>
801045a9:	83 c4 10             	add    $0x10,%esp
  for (;;)
  {
    // look for ZOMBIE thread
    havekids = 0;
801045ac:	31 c0                	xor    %eax,%eax
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801045ae:	bb f4 3e 11 80       	mov    $0x80113ef4,%ebx
801045b3:	eb 11                	jmp    801045c6 <thread_join+0x36>
801045b5:	8d 76 00             	lea    0x0(%esi),%esi
801045b8:	81 c3 88 00 00 00    	add    $0x88,%ebx
801045be:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
801045c4:	74 2a                	je     801045f0 <thread_join+0x60>
    {
      if (p->parent != curproc || !p->isthread)
801045c6:	39 73 14             	cmp    %esi,0x14(%ebx)
801045c9:	75 ed                	jne    801045b8 <thread_join+0x28>
801045cb:	8b 93 84 00 00 00    	mov    0x84(%ebx),%edx
801045d1:	85 d2                	test   %edx,%edx
801045d3:	74 e3                	je     801045b8 <thread_join+0x28>
        continue;
      havekids = 1;
      if (p->state == ZOMBIE)
801045d5:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801045d9:	74 33                	je     8010460e <thread_join+0x7e>
  acquire(&ptable.lock);
  for (;;)
  {
    // look for ZOMBIE thread
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801045db:	81 c3 88 00 00 00    	add    $0x88,%ebx
    {
      if (p->parent != curproc || !p->isthread)
        continue;
      havekids = 1;
801045e1:	b8 01 00 00 00       	mov    $0x1,%eax
  acquire(&ptable.lock);
  for (;;)
  {
    // look for ZOMBIE thread
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801045e6:	81 fb f4 60 11 80    	cmp    $0x801160f4,%ebx
801045ec:	75 d8                	jne    801045c6 <thread_join+0x36>
801045ee:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // wait only if childs exists
    if (!havekids || curproc->killed)
801045f0:	85 c0                	test   %eax,%eax
801045f2:	74 4e                	je     80104642 <thread_join+0xb2>
801045f4:	8b 46 24             	mov    0x24(%esi),%eax
801045f7:	85 c0                	test   %eax,%eax
801045f9:	75 47                	jne    80104642 <thread_join+0xb2>
      release(&ptable.lock);
      return -1;
    }

    // wait for children to exit.
    sleep(curproc, &ptable.lock);
801045fb:	83 ec 08             	sub    $0x8,%esp
801045fe:	68 c0 3e 11 80       	push   $0x80113ec0
80104603:	56                   	push   %esi
80104604:	e8 47 f8 ff ff       	call   80103e50 <sleep>
  }
80104609:	83 c4 10             	add    $0x10,%esp
8010460c:	eb 9e                	jmp    801045ac <thread_join+0x1c>
      havekids = 1;
      if (p->state == ZOMBIE)
      {
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
8010460e:	83 ec 0c             	sub    $0xc,%esp
80104611:	ff 73 08             	pushl  0x8(%ebx)
        continue;
      havekids = 1;
      if (p->state == ZOMBIE)
      {
        // Found one.
        pid = p->pid;
80104614:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104617:	e8 a4 dc ff ff       	call   801022c0 <kfree>
        p->kstack = 0;
8010461c:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        p->state = UNUSED;
80104623:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
8010462a:	c7 04 24 c0 3e 11 80 	movl   $0x80113ec0,(%esp)
80104631:	e8 ea 02 00 00       	call   80104920 <release>
        return pid;
80104636:	83 c4 10             	add    $0x10,%esp
    }

    // wait for children to exit.
    sleep(curproc, &ptable.lock);
  }
}
80104639:	8d 65 f8             	lea    -0x8(%ebp),%esp
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
8010463c:	89 f0                	mov    %esi,%eax
    }

    // wait for children to exit.
    sleep(curproc, &ptable.lock);
  }
}
8010463e:	5b                   	pop    %ebx
8010463f:	5e                   	pop    %esi
80104640:	5d                   	pop    %ebp
80104641:	c3                   	ret    
    }

    // wait only if childs exists
    if (!havekids || curproc->killed)
    {
      release(&ptable.lock);
80104642:	83 ec 0c             	sub    $0xc,%esp
80104645:	68 c0 3e 11 80       	push   $0x80113ec0
8010464a:	e8 d1 02 00 00       	call   80104920 <release>
      return -1;
8010464f:	83 c4 10             	add    $0x10,%esp
    }

    // wait for children to exit.
    sleep(curproc, &ptable.lock);
  }
}
80104652:	8d 65 f8             	lea    -0x8(%ebp),%esp

    // wait only if childs exists
    if (!havekids || curproc->killed)
    {
      release(&ptable.lock);
      return -1;
80104655:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // wait for children to exit.
    sleep(curproc, &ptable.lock);
  }
}
8010465a:	5b                   	pop    %ebx
8010465b:	5e                   	pop    %esi
8010465c:	5d                   	pop    %ebp
8010465d:	c3                   	ret    
8010465e:	66 90                	xchg   %ax,%ax

80104660 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104660:	55                   	push   %ebp
80104661:	89 e5                	mov    %esp,%ebp
80104663:	53                   	push   %ebx
80104664:	83 ec 0c             	sub    $0xc,%esp
80104667:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010466a:	68 04 7d 10 80       	push   $0x80107d04
8010466f:	8d 43 04             	lea    0x4(%ebx),%eax
80104672:	50                   	push   %eax
80104673:	e8 f8 00 00 00       	call   80104770 <initlock>
  lk->name = name;
80104678:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010467b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80104681:	83 c4 10             	add    $0x10,%esp
80104684:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010468b:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
8010468e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104691:	c9                   	leave  
80104692:	c3                   	ret    
80104693:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046a0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801046a0:	55                   	push   %ebp
801046a1:	89 e5                	mov    %esp,%ebp
801046a3:	56                   	push   %esi
801046a4:	53                   	push   %ebx
801046a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801046a8:	83 ec 0c             	sub    $0xc,%esp
801046ab:	8d 73 04             	lea    0x4(%ebx),%esi
801046ae:	56                   	push   %esi
801046af:	e8 3c 01 00 00       	call   801047f0 <acquire>
  while (lk->locked) {
801046b4:	8b 13                	mov    (%ebx),%edx
801046b6:	83 c4 10             	add    $0x10,%esp
801046b9:	85 d2                	test   %edx,%edx
801046bb:	74 16                	je     801046d3 <acquiresleep+0x33>
801046bd:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801046c0:	83 ec 08             	sub    $0x8,%esp
801046c3:	56                   	push   %esi
801046c4:	53                   	push   %ebx
801046c5:	e8 86 f7 ff ff       	call   80103e50 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
801046ca:	8b 03                	mov    (%ebx),%eax
801046cc:	83 c4 10             	add    $0x10,%esp
801046cf:	85 c0                	test   %eax,%eax
801046d1:	75 ed                	jne    801046c0 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
801046d3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
801046d9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801046df:	8b 40 10             	mov    0x10(%eax),%eax
801046e2:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801046e5:	89 75 08             	mov    %esi,0x8(%ebp)
}
801046e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801046eb:	5b                   	pop    %ebx
801046ec:	5e                   	pop    %esi
801046ed:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
801046ee:	e9 2d 02 00 00       	jmp    80104920 <release>
801046f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104700 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104700:	55                   	push   %ebp
80104701:	89 e5                	mov    %esp,%ebp
80104703:	56                   	push   %esi
80104704:	53                   	push   %ebx
80104705:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104708:	83 ec 0c             	sub    $0xc,%esp
8010470b:	8d 73 04             	lea    0x4(%ebx),%esi
8010470e:	56                   	push   %esi
8010470f:	e8 dc 00 00 00       	call   801047f0 <acquire>
  lk->locked = 0;
80104714:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010471a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104721:	89 1c 24             	mov    %ebx,(%esp)
80104724:	e8 d7 f8 ff ff       	call   80104000 <wakeup>
  release(&lk->lk);
80104729:	89 75 08             	mov    %esi,0x8(%ebp)
8010472c:	83 c4 10             	add    $0x10,%esp
}
8010472f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104732:	5b                   	pop    %ebx
80104733:	5e                   	pop    %esi
80104734:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104735:	e9 e6 01 00 00       	jmp    80104920 <release>
8010473a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104740 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	56                   	push   %esi
80104744:	53                   	push   %ebx
80104745:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
80104748:	83 ec 0c             	sub    $0xc,%esp
8010474b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010474e:	53                   	push   %ebx
8010474f:	e8 9c 00 00 00       	call   801047f0 <acquire>
  r = lk->locked;
80104754:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
80104756:	89 1c 24             	mov    %ebx,(%esp)
80104759:	e8 c2 01 00 00       	call   80104920 <release>
  return r;
}
8010475e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104761:	89 f0                	mov    %esi,%eax
80104763:	5b                   	pop    %ebx
80104764:	5e                   	pop    %esi
80104765:	5d                   	pop    %ebp
80104766:	c3                   	ret    
80104767:	66 90                	xchg   %ax,%ax
80104769:	66 90                	xchg   %ax,%ax
8010476b:	66 90                	xchg   %ax,%ax
8010476d:	66 90                	xchg   %ax,%ax
8010476f:	90                   	nop

80104770 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104776:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104779:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
8010477f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104782:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104789:	5d                   	pop    %ebp
8010478a:	c3                   	ret    
8010478b:	90                   	nop
8010478c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104790 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104790:	55                   	push   %ebp
80104791:	89 e5                	mov    %esp,%ebp
80104793:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104794:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104797:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010479a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010479d:	31 c0                	xor    %eax,%eax
8010479f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801047a0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801047a6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801047ac:	77 1a                	ja     801047c8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801047ae:	8b 5a 04             	mov    0x4(%edx),%ebx
801047b1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801047b4:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801047b7:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801047b9:	83 f8 0a             	cmp    $0xa,%eax
801047bc:	75 e2                	jne    801047a0 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801047be:	5b                   	pop    %ebx
801047bf:	5d                   	pop    %ebp
801047c0:	c3                   	ret    
801047c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801047c8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801047cf:	83 c0 01             	add    $0x1,%eax
801047d2:	83 f8 0a             	cmp    $0xa,%eax
801047d5:	74 e7                	je     801047be <getcallerpcs+0x2e>
    pcs[i] = 0;
801047d7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801047de:	83 c0 01             	add    $0x1,%eax
801047e1:	83 f8 0a             	cmp    $0xa,%eax
801047e4:	75 e2                	jne    801047c8 <getcallerpcs+0x38>
801047e6:	eb d6                	jmp    801047be <getcallerpcs+0x2e>
801047e8:	90                   	nop
801047e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801047f0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801047f0:	55                   	push   %ebp
801047f1:	89 e5                	mov    %esp,%ebp
801047f3:	83 ec 08             	sub    $0x8,%esp
801047f6:	9c                   	pushf  
801047f7:	5a                   	pop    %edx
}

static inline void
cli(void)
{
  asm volatile("cli");
801047f8:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801047f9:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104800:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
80104806:	85 c0                	test   %eax,%eax
80104808:	75 0c                	jne    80104816 <acquire+0x26>
    cpu->intena = eflags & FL_IF;
8010480a:	81 e2 00 02 00 00    	and    $0x200,%edx
80104810:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
80104816:	8b 55 08             	mov    0x8(%ebp),%edx

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
    cpu->intena = eflags & FL_IF;
  cpu->ncli += 1;
80104819:	83 c0 01             	add    $0x1,%eax
8010481c:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104822:	8b 02                	mov    (%edx),%eax
80104824:	85 c0                	test   %eax,%eax
80104826:	74 05                	je     8010482d <acquire+0x3d>
80104828:	3b 4a 08             	cmp    0x8(%edx),%ecx
8010482b:	74 38                	je     80104865 <acquire+0x75>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010482d:	b9 01 00 00 00       	mov    $0x1,%ecx
80104832:	eb 07                	jmp    8010483b <acquire+0x4b>
80104834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104838:	8b 55 08             	mov    0x8(%ebp),%edx
8010483b:	89 c8                	mov    %ecx,%eax
8010483d:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104840:	85 c0                	test   %eax,%eax
80104842:	75 f4                	jne    80104838 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
80104844:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104849:	8b 45 08             	mov    0x8(%ebp),%eax
8010484c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  getcallerpcs(&lk, lk->pcs);
80104853:	83 c0 0c             	add    $0xc,%eax
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104856:	89 50 fc             	mov    %edx,-0x4(%eax)
  getcallerpcs(&lk, lk->pcs);
80104859:	50                   	push   %eax
8010485a:	8d 45 08             	lea    0x8(%ebp),%eax
8010485d:	50                   	push   %eax
8010485e:	e8 2d ff ff ff       	call   80104790 <getcallerpcs>
}
80104863:	c9                   	leave  
80104864:	c3                   	ret    
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
80104865:	83 ec 0c             	sub    $0xc,%esp
80104868:	68 0f 7d 10 80       	push   $0x80107d0f
8010486d:	e8 fe ba ff ff       	call   80100370 <panic>
80104872:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104880 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104880:	55                   	push   %ebp
  return lock->locked && lock->cpu == cpu;
80104881:	31 c0                	xor    %eax,%eax
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104883:	89 e5                	mov    %esp,%ebp
80104885:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
80104888:	8b 0a                	mov    (%edx),%ecx
8010488a:	85 c9                	test   %ecx,%ecx
8010488c:	74 0f                	je     8010489d <holding+0x1d>
8010488e:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104894:	39 42 08             	cmp    %eax,0x8(%edx)
80104897:	0f 94 c0             	sete   %al
8010489a:	0f b6 c0             	movzbl %al,%eax
}
8010489d:	5d                   	pop    %ebp
8010489e:	c3                   	ret    
8010489f:	90                   	nop

801048a0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801048a3:	9c                   	pushf  
801048a4:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
801048a5:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801048a6:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801048ad:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
801048b3:	85 c0                	test   %eax,%eax
801048b5:	75 0c                	jne    801048c3 <pushcli+0x23>
    cpu->intena = eflags & FL_IF;
801048b7:	81 e1 00 02 00 00    	and    $0x200,%ecx
801048bd:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
  cpu->ncli += 1;
801048c3:	83 c0 01             	add    $0x1,%eax
801048c6:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
}
801048cc:	5d                   	pop    %ebp
801048cd:	c3                   	ret    
801048ce:	66 90                	xchg   %ax,%ax

801048d0 <popcli>:

void
popcli(void)
{
801048d0:	55                   	push   %ebp
801048d1:	89 e5                	mov    %esp,%ebp
801048d3:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801048d6:	9c                   	pushf  
801048d7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801048d8:	f6 c4 02             	test   $0x2,%ah
801048db:	75 2c                	jne    80104909 <popcli+0x39>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
801048dd:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801048e4:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
801048eb:	78 0f                	js     801048fc <popcli+0x2c>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
801048ed:	75 0b                	jne    801048fa <popcli+0x2a>
801048ef:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
801048f5:	85 c0                	test   %eax,%eax
801048f7:	74 01                	je     801048fa <popcli+0x2a>
}

static inline void
sti(void)
{
  asm volatile("sti");
801048f9:	fb                   	sti    
    sti();
}
801048fa:	c9                   	leave  
801048fb:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
801048fc:	83 ec 0c             	sub    $0xc,%esp
801048ff:	68 2e 7d 10 80       	push   $0x80107d2e
80104904:	e8 67 ba ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
80104909:	83 ec 0c             	sub    $0xc,%esp
8010490c:	68 17 7d 10 80       	push   $0x80107d17
80104911:	e8 5a ba ff ff       	call   80100370 <panic>
80104916:	8d 76 00             	lea    0x0(%esi),%esi
80104919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104920 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104920:	55                   	push   %ebp
80104921:	89 e5                	mov    %esp,%ebp
80104923:	83 ec 08             	sub    $0x8,%esp
80104926:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104929:	8b 10                	mov    (%eax),%edx
8010492b:	85 d2                	test   %edx,%edx
8010492d:	74 0c                	je     8010493b <release+0x1b>
8010492f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104936:	39 50 08             	cmp    %edx,0x8(%eax)
80104939:	74 15                	je     80104950 <release+0x30>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
8010493b:	83 ec 0c             	sub    $0xc,%esp
8010493e:	68 35 7d 10 80       	push   $0x80107d35
80104943:	e8 28 ba ff ff       	call   80100370 <panic>
80104948:	90                   	nop
80104949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  lk->pcs[0] = 0;
80104950:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104957:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
8010495e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104963:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
80104969:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
8010496a:	e9 61 ff ff ff       	jmp    801048d0 <popcli>
8010496f:	90                   	nop

80104970 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104970:	55                   	push   %ebp
80104971:	89 e5                	mov    %esp,%ebp
80104973:	57                   	push   %edi
80104974:	53                   	push   %ebx
80104975:	8b 55 08             	mov    0x8(%ebp),%edx
80104978:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
8010497b:	f6 c2 03             	test   $0x3,%dl
8010497e:	75 05                	jne    80104985 <memset+0x15>
80104980:	f6 c1 03             	test   $0x3,%cl
80104983:	74 13                	je     80104998 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104985:	89 d7                	mov    %edx,%edi
80104987:	8b 45 0c             	mov    0xc(%ebp),%eax
8010498a:	fc                   	cld    
8010498b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010498d:	5b                   	pop    %ebx
8010498e:	89 d0                	mov    %edx,%eax
80104990:	5f                   	pop    %edi
80104991:	5d                   	pop    %ebp
80104992:	c3                   	ret    
80104993:	90                   	nop
80104994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104998:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010499c:	c1 e9 02             	shr    $0x2,%ecx
8010499f:	89 fb                	mov    %edi,%ebx
801049a1:	89 f8                	mov    %edi,%eax
801049a3:	c1 e3 18             	shl    $0x18,%ebx
801049a6:	c1 e0 10             	shl    $0x10,%eax
801049a9:	09 d8                	or     %ebx,%eax
801049ab:	09 f8                	or     %edi,%eax
801049ad:	c1 e7 08             	shl    $0x8,%edi
801049b0:	09 f8                	or     %edi,%eax
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
801049b2:	89 d7                	mov    %edx,%edi
801049b4:	fc                   	cld    
801049b5:	f3 ab                	rep stos %eax,%es:(%edi)
  } else
    stosb(dst, c, n);
  return dst;
}
801049b7:	5b                   	pop    %ebx
801049b8:	89 d0                	mov    %edx,%eax
801049ba:	5f                   	pop    %edi
801049bb:	5d                   	pop    %ebp
801049bc:	c3                   	ret    
801049bd:	8d 76 00             	lea    0x0(%esi),%esi

801049c0 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
801049c0:	55                   	push   %ebp
801049c1:	89 e5                	mov    %esp,%ebp
801049c3:	57                   	push   %edi
801049c4:	56                   	push   %esi
801049c5:	8b 45 10             	mov    0x10(%ebp),%eax
801049c8:	53                   	push   %ebx
801049c9:	8b 75 0c             	mov    0xc(%ebp),%esi
801049cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801049cf:	85 c0                	test   %eax,%eax
801049d1:	8d 78 ff             	lea    -0x1(%eax),%edi
801049d4:	74 26                	je     801049fc <memcmp+0x3c>
    if(*s1 != *s2)
801049d6:	0f b6 13             	movzbl (%ebx),%edx
801049d9:	0f b6 0e             	movzbl (%esi),%ecx
801049dc:	38 ca                	cmp    %cl,%dl
801049de:	75 28                	jne    80104a08 <memcmp+0x48>
801049e0:	31 c0                	xor    %eax,%eax
801049e2:	eb 14                	jmp    801049f8 <memcmp+0x38>
801049e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801049e8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
801049ed:	83 c0 01             	add    $0x1,%eax
801049f0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801049f4:	38 ca                	cmp    %cl,%dl
801049f6:	75 10                	jne    80104a08 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801049f8:	39 f8                	cmp    %edi,%eax
801049fa:	75 ec                	jne    801049e8 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
801049fc:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
801049fd:	31 c0                	xor    %eax,%eax
}
801049ff:	5e                   	pop    %esi
80104a00:	5f                   	pop    %edi
80104a01:	5d                   	pop    %ebp
80104a02:	c3                   	ret    
80104a03:	90                   	nop
80104a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
80104a08:	0f b6 c2             	movzbl %dl,%eax
    s1++, s2++;
  }

  return 0;
}
80104a0b:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
80104a0c:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
80104a0e:	5e                   	pop    %esi
80104a0f:	5f                   	pop    %edi
80104a10:	5d                   	pop    %ebp
80104a11:	c3                   	ret    
80104a12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a20 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104a20:	55                   	push   %ebp
80104a21:	89 e5                	mov    %esp,%ebp
80104a23:	56                   	push   %esi
80104a24:	53                   	push   %ebx
80104a25:	8b 45 08             	mov    0x8(%ebp),%eax
80104a28:	8b 75 0c             	mov    0xc(%ebp),%esi
80104a2b:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
80104a2e:	39 c6                	cmp    %eax,%esi
80104a30:	73 2e                	jae    80104a60 <memmove+0x40>
80104a32:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104a35:	39 c8                	cmp    %ecx,%eax
80104a37:	73 27                	jae    80104a60 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
80104a39:	85 db                	test   %ebx,%ebx
80104a3b:	8d 53 ff             	lea    -0x1(%ebx),%edx
80104a3e:	74 17                	je     80104a57 <memmove+0x37>
80104a40:	29 d9                	sub    %ebx,%ecx
80104a42:	89 cb                	mov    %ecx,%ebx
80104a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *--d = *--s;
80104a48:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104a4c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
80104a4f:	83 ea 01             	sub    $0x1,%edx
80104a52:	83 fa ff             	cmp    $0xffffffff,%edx
80104a55:	75 f1                	jne    80104a48 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104a57:	5b                   	pop    %ebx
80104a58:	5e                   	pop    %esi
80104a59:	5d                   	pop    %ebp
80104a5a:	c3                   	ret    
80104a5b:	90                   	nop
80104a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104a60:	31 d2                	xor    %edx,%edx
80104a62:	85 db                	test   %ebx,%ebx
80104a64:	74 f1                	je     80104a57 <memmove+0x37>
80104a66:	8d 76 00             	lea    0x0(%esi),%esi
80104a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      *d++ = *s++;
80104a70:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104a74:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104a77:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104a7a:	39 da                	cmp    %ebx,%edx
80104a7c:	75 f2                	jne    80104a70 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
80104a7e:	5b                   	pop    %ebx
80104a7f:	5e                   	pop    %esi
80104a80:	5d                   	pop    %ebp
80104a81:	c3                   	ret    
80104a82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a90 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104a90:	55                   	push   %ebp
80104a91:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104a93:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104a94:	e9 87 ff ff ff       	jmp    80104a20 <memmove>
80104a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104aa0 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	57                   	push   %edi
80104aa4:	56                   	push   %esi
80104aa5:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104aa8:	53                   	push   %ebx
80104aa9:	8b 7d 08             	mov    0x8(%ebp),%edi
80104aac:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
80104aaf:	85 c9                	test   %ecx,%ecx
80104ab1:	74 37                	je     80104aea <strncmp+0x4a>
80104ab3:	0f b6 17             	movzbl (%edi),%edx
80104ab6:	0f b6 1e             	movzbl (%esi),%ebx
80104ab9:	84 d2                	test   %dl,%dl
80104abb:	74 49                	je     80104b06 <strncmp+0x66>
80104abd:	38 da                	cmp    %bl,%dl
80104abf:	75 3b                	jne    80104afc <strncmp+0x5c>
80104ac1:	8d 47 01             	lea    0x1(%edi),%eax
80104ac4:	01 cf                	add    %ecx,%edi
80104ac6:	eb 1b                	jmp    80104ae3 <strncmp+0x43>
80104ac8:	90                   	nop
80104ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ad0:	0f b6 10             	movzbl (%eax),%edx
80104ad3:	84 d2                	test   %dl,%dl
80104ad5:	74 21                	je     80104af8 <strncmp+0x58>
80104ad7:	0f b6 19             	movzbl (%ecx),%ebx
80104ada:	83 c0 01             	add    $0x1,%eax
80104add:	89 ce                	mov    %ecx,%esi
80104adf:	38 da                	cmp    %bl,%dl
80104ae1:	75 19                	jne    80104afc <strncmp+0x5c>
80104ae3:	39 f8                	cmp    %edi,%eax
    n--, p++, q++;
80104ae5:	8d 4e 01             	lea    0x1(%esi),%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
80104ae8:	75 e6                	jne    80104ad0 <strncmp+0x30>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104aea:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
80104aeb:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
80104aed:	5e                   	pop    %esi
80104aee:	5f                   	pop    %edi
80104aef:	5d                   	pop    %ebp
80104af0:	c3                   	ret    
80104af1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104af8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
80104afc:	0f b6 c2             	movzbl %dl,%eax
80104aff:	29 d8                	sub    %ebx,%eax
}
80104b01:	5b                   	pop    %ebx
80104b02:	5e                   	pop    %esi
80104b03:	5f                   	pop    %edi
80104b04:	5d                   	pop    %ebp
80104b05:	c3                   	ret    
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
80104b06:	31 d2                	xor    %edx,%edx
80104b08:	eb f2                	jmp    80104afc <strncmp+0x5c>
80104b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104b10 <strncpy>:
  return (uchar)*p - (uchar)*q;
}

char*
strncpy(char *s, const char *t, int n)
{
80104b10:	55                   	push   %ebp
80104b11:	89 e5                	mov    %esp,%ebp
80104b13:	57                   	push   %edi
80104b14:	56                   	push   %esi
80104b15:	8b 7d 08             	mov    0x8(%ebp),%edi
80104b18:	53                   	push   %ebx
80104b19:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104b1c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
80104b1f:	89 fa                	mov    %edi,%edx
80104b21:	eb 16                	jmp    80104b39 <strncpy+0x29>
80104b23:	90                   	nop
80104b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b28:	83 c3 01             	add    $0x1,%ebx
80104b2b:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
80104b2f:	83 c2 01             	add    $0x1,%edx
80104b32:	84 c0                	test   %al,%al
80104b34:	88 42 ff             	mov    %al,-0x1(%edx)
80104b37:	74 0a                	je     80104b43 <strncpy+0x33>
80104b39:	83 e9 01             	sub    $0x1,%ecx
80104b3c:	8d 71 01             	lea    0x1(%ecx),%esi
80104b3f:	85 f6                	test   %esi,%esi
80104b41:	7f e5                	jg     80104b28 <strncpy+0x18>
    ;
  while(n-- > 0)
80104b43:	85 c9                	test   %ecx,%ecx
80104b45:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
80104b48:	7e 11                	jle    80104b5b <strncpy+0x4b>
80104b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *s++ = 0;
80104b50:	83 c2 01             	add    $0x1,%edx
80104b53:	c6 42 ff 00          	movb   $0x0,-0x1(%edx)
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
80104b57:	39 c2                	cmp    %eax,%edx
80104b59:	75 f5                	jne    80104b50 <strncpy+0x40>
    *s++ = 0;
  return os;
}
80104b5b:	5b                   	pop    %ebx
80104b5c:	89 f8                	mov    %edi,%eax
80104b5e:	5e                   	pop    %esi
80104b5f:	5f                   	pop    %edi
80104b60:	5d                   	pop    %ebp
80104b61:	c3                   	ret    
80104b62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b70 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104b70:	55                   	push   %ebp
80104b71:	89 e5                	mov    %esp,%ebp
80104b73:	56                   	push   %esi
80104b74:	53                   	push   %ebx
80104b75:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104b78:	8b 45 08             	mov    0x8(%ebp),%eax
80104b7b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
80104b7e:	85 c9                	test   %ecx,%ecx
80104b80:	7e 26                	jle    80104ba8 <safestrcpy+0x38>
80104b82:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104b86:	89 c1                	mov    %eax,%ecx
80104b88:	eb 17                	jmp    80104ba1 <safestrcpy+0x31>
80104b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104b90:	83 c2 01             	add    $0x1,%edx
80104b93:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104b97:	83 c1 01             	add    $0x1,%ecx
80104b9a:	84 db                	test   %bl,%bl
80104b9c:	88 59 ff             	mov    %bl,-0x1(%ecx)
80104b9f:	74 04                	je     80104ba5 <safestrcpy+0x35>
80104ba1:	39 f2                	cmp    %esi,%edx
80104ba3:	75 eb                	jne    80104b90 <safestrcpy+0x20>
    ;
  *s = 0;
80104ba5:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104ba8:	5b                   	pop    %ebx
80104ba9:	5e                   	pop    %esi
80104baa:	5d                   	pop    %ebp
80104bab:	c3                   	ret    
80104bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104bb0 <strlen>:

int
strlen(const char *s)
{
80104bb0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104bb1:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104bb3:	89 e5                	mov    %esp,%ebp
80104bb5:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104bb8:	80 3a 00             	cmpb   $0x0,(%edx)
80104bbb:	74 0c                	je     80104bc9 <strlen+0x19>
80104bbd:	8d 76 00             	lea    0x0(%esi),%esi
80104bc0:	83 c0 01             	add    $0x1,%eax
80104bc3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104bc7:	75 f7                	jne    80104bc0 <strlen+0x10>
    ;
  return n;
}
80104bc9:	5d                   	pop    %ebp
80104bca:	c3                   	ret    

80104bcb <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104bcb:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104bcf:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104bd3:	55                   	push   %ebp
  pushl %ebx
80104bd4:	53                   	push   %ebx
  pushl %esi
80104bd5:	56                   	push   %esi
  pushl %edi
80104bd6:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104bd7:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104bd9:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
80104bdb:	5f                   	pop    %edi
  popl %esi
80104bdc:	5e                   	pop    %esi
  popl %ebx
80104bdd:	5b                   	pop    %ebx
  popl %ebp
80104bde:	5d                   	pop    %ebp
  ret
80104bdf:	c3                   	ret    

80104be0 <fetchint>:
// to a saved program counter, and then the first argument.
struct proc* myproc(void);
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104be0:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80104be1:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.
struct proc* myproc(void);
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104be8:	89 e5                	mov    %esp,%ebp
80104bea:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
80104bed:	8b 12                	mov    (%edx),%edx
80104bef:	39 c2                	cmp    %eax,%edx
80104bf1:	76 15                	jbe    80104c08 <fetchint+0x28>
80104bf3:	8d 48 04             	lea    0x4(%eax),%ecx
80104bf6:	39 ca                	cmp    %ecx,%edx
80104bf8:	72 0e                	jb     80104c08 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
80104bfa:	8b 10                	mov    (%eax),%edx
80104bfc:	8b 45 0c             	mov    0xc(%ebp),%eax
80104bff:	89 10                	mov    %edx,(%eax)
  return 0;
80104c01:	31 c0                	xor    %eax,%eax
}
80104c03:	5d                   	pop    %ebp
80104c04:	c3                   	ret    
80104c05:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104c08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
80104c0d:	5d                   	pop    %ebp
80104c0e:	c3                   	ret    
80104c0f:	90                   	nop

80104c10 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104c10:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
80104c11:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104c17:	89 e5                	mov    %esp,%ebp
80104c19:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
80104c1c:	39 08                	cmp    %ecx,(%eax)
80104c1e:	76 2c                	jbe    80104c4c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104c20:	8b 55 0c             	mov    0xc(%ebp),%edx
80104c23:	89 c8                	mov    %ecx,%eax
80104c25:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104c27:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104c2e:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104c30:	39 d1                	cmp    %edx,%ecx
80104c32:	73 18                	jae    80104c4c <fetchstr+0x3c>
    if(*s == 0)
80104c34:	80 39 00             	cmpb   $0x0,(%ecx)
80104c37:	75 0c                	jne    80104c45 <fetchstr+0x35>
80104c39:	eb 1d                	jmp    80104c58 <fetchstr+0x48>
80104c3b:	90                   	nop
80104c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c40:	80 38 00             	cmpb   $0x0,(%eax)
80104c43:	74 13                	je     80104c58 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104c45:	83 c0 01             	add    $0x1,%eax
80104c48:	39 c2                	cmp    %eax,%edx
80104c4a:	77 f4                	ja     80104c40 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
80104c4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
80104c51:	5d                   	pop    %ebp
80104c52:	c3                   	ret    
80104c53:	90                   	nop
80104c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
80104c58:	29 c8                	sub    %ecx,%eax
  return -1;
}
80104c5a:	5d                   	pop    %ebp
80104c5b:	c3                   	ret    
80104c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104c60 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104c60:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104c67:	55                   	push   %ebp
80104c68:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104c6a:	8b 42 18             	mov    0x18(%edx),%eax
80104c6d:	8b 4d 08             	mov    0x8(%ebp),%ecx
struct proc* myproc(void);
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104c70:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104c72:	8b 40 44             	mov    0x44(%eax),%eax
80104c75:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104c78:	8d 48 04             	lea    0x4(%eax),%ecx
struct proc* myproc(void);
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104c7b:	39 d1                	cmp    %edx,%ecx
80104c7d:	73 19                	jae    80104c98 <argint+0x38>
80104c7f:	8d 48 08             	lea    0x8(%eax),%ecx
80104c82:	39 ca                	cmp    %ecx,%edx
80104c84:	72 12                	jb     80104c98 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
80104c86:	8b 50 04             	mov    0x4(%eax),%edx
80104c89:	8b 45 0c             	mov    0xc(%ebp),%eax
80104c8c:	89 10                	mov    %edx,(%eax)
  return 0;
80104c8e:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104c90:	5d                   	pop    %ebp
80104c91:	c3                   	ret    
80104c92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104c98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104c9d:	5d                   	pop    %ebp
80104c9e:	c3                   	ret    
80104c9f:	90                   	nop

80104ca0 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104ca0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104ca6:	55                   	push   %ebp
80104ca7:	89 e5                	mov    %esp,%ebp
80104ca9:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104caa:	8b 50 18             	mov    0x18(%eax),%edx
80104cad:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104cb0:	8b 52 44             	mov    0x44(%edx),%edx
80104cb3:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
struct proc* myproc(void);
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104cb6:	8b 10                	mov    (%eax),%edx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
80104cb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104cbd:	8d 59 04             	lea    0x4(%ecx),%ebx
struct proc* myproc(void);
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104cc0:	39 d3                	cmp    %edx,%ebx
80104cc2:	73 25                	jae    80104ce9 <argptr+0x49>
80104cc4:	8d 59 08             	lea    0x8(%ecx),%ebx
80104cc7:	39 da                	cmp    %ebx,%edx
80104cc9:	72 1e                	jb     80104ce9 <argptr+0x49>
    return -1;
  *ip = *(int*)(addr);
80104ccb:	8b 59 04             	mov    0x4(%ecx),%ebx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104cce:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104cd1:	85 c9                	test   %ecx,%ecx
80104cd3:	78 14                	js     80104ce9 <argptr+0x49>
80104cd5:	39 d3                	cmp    %edx,%ebx
80104cd7:	73 10                	jae    80104ce9 <argptr+0x49>
80104cd9:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104cdc:	01 d9                	add    %ebx,%ecx
80104cde:	39 d1                	cmp    %edx,%ecx
80104ce0:	77 07                	ja     80104ce9 <argptr+0x49>
    return -1;
  *pp = (char*)i;
80104ce2:	8b 45 0c             	mov    0xc(%ebp),%eax
80104ce5:	89 18                	mov    %ebx,(%eax)
  return 0;
80104ce7:	31 c0                	xor    %eax,%eax
}
80104ce9:	5b                   	pop    %ebx
80104cea:	5d                   	pop    %ebp
80104ceb:	c3                   	ret    
80104cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104cf0 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104cf0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104cf6:	55                   	push   %ebp
80104cf7:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104cf9:	8b 50 18             	mov    0x18(%eax),%edx
80104cfc:	8b 4d 08             	mov    0x8(%ebp),%ecx
struct proc* myproc(void);
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104cff:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104d01:	8b 52 44             	mov    0x44(%edx),%edx
80104d04:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104d07:	8d 4a 04             	lea    0x4(%edx),%ecx
struct proc* myproc(void);
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104d0a:	39 c1                	cmp    %eax,%ecx
80104d0c:	73 07                	jae    80104d15 <argstr+0x25>
80104d0e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104d11:	39 c8                	cmp    %ecx,%eax
80104d13:	73 0b                	jae    80104d20 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104d15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104d1a:	5d                   	pop    %ebp
80104d1b:	c3                   	ret    
80104d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104d20:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
80104d23:	39 c1                	cmp    %eax,%ecx
80104d25:	73 ee                	jae    80104d15 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
80104d27:	8b 55 0c             	mov    0xc(%ebp),%edx
80104d2a:	89 c8                	mov    %ecx,%eax
80104d2c:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104d2e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104d35:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104d37:	39 d1                	cmp    %edx,%ecx
80104d39:	73 da                	jae    80104d15 <argstr+0x25>
    if(*s == 0)
80104d3b:	80 39 00             	cmpb   $0x0,(%ecx)
80104d3e:	75 0d                	jne    80104d4d <argstr+0x5d>
80104d40:	eb 1e                	jmp    80104d60 <argstr+0x70>
80104d42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104d48:	80 38 00             	cmpb   $0x0,(%eax)
80104d4b:	74 13                	je     80104d60 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104d4d:	83 c0 01             	add    $0x1,%eax
80104d50:	39 c2                	cmp    %eax,%edx
80104d52:	77 f4                	ja     80104d48 <argstr+0x58>
80104d54:	eb bf                	jmp    80104d15 <argstr+0x25>
80104d56:	8d 76 00             	lea    0x0(%esi),%esi
80104d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(*s == 0)
      return s - *pp;
80104d60:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104d62:	5d                   	pop    %ebp
80104d63:	c3                   	ret    
80104d64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104d6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104d70 <syscall>:
//  [SYS_mkdir]   "mkdir",
//  [SYS_close]   "close",
// };
void
syscall(void)
{
80104d70:	55                   	push   %ebp
80104d71:	89 e5                	mov    %esp,%ebp
80104d73:	53                   	push   %ebx
80104d74:	83 ec 04             	sub    $0x4,%esp
  int num;
  // extracts the current process return val?
  num = proc->tf->eax;
80104d77:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104d7e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104d81:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104d84:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104d87:	83 f9 1b             	cmp    $0x1b,%ecx
80104d8a:	77 1c                	ja     80104da8 <syscall+0x38>
80104d8c:	8b 0c 85 80 7d 10 80 	mov    -0x7fef8280(,%eax,4),%ecx
80104d93:	85 c9                	test   %ecx,%ecx
80104d95:	74 11                	je     80104da8 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
80104d97:	ff d1                	call   *%ecx
80104d99:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
80104d9c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d9f:	c9                   	leave  
80104da0:	c3                   	ret    
80104da1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
    // int sys_num = proc->tf->eax;
    // cprintf("%s -> %d\n", sysnames[num],sys_num);
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104da8:	50                   	push   %eax
            proc->pid, proc->name, num);
80104da9:	8d 42 6c             	lea    0x6c(%edx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
    // int sys_num = proc->tf->eax;
    // cprintf("%s -> %d\n", sysnames[num],sys_num);
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104dac:	50                   	push   %eax
80104dad:	ff 72 10             	pushl  0x10(%edx)
80104db0:	68 3d 7d 10 80       	push   $0x80107d3d
80104db5:	e8 a6 b8 ff ff       	call   80100660 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80104dba:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104dc0:	83 c4 10             	add    $0x10,%esp
80104dc3:	8b 40 18             	mov    0x18(%eax),%eax
80104dc6:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104dcd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104dd0:	c9                   	leave  
80104dd1:	c3                   	ret    
80104dd2:	66 90                	xchg   %ax,%ax
80104dd4:	66 90                	xchg   %ax,%ax
80104dd6:	66 90                	xchg   %ax,%ax
80104dd8:	66 90                	xchg   %ax,%ax
80104dda:	66 90                	xchg   %ax,%ax
80104ddc:	66 90                	xchg   %ax,%ax
80104dde:	66 90                	xchg   %ax,%ax

80104de0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104de0:	55                   	push   %ebp
80104de1:	89 e5                	mov    %esp,%ebp
80104de3:	57                   	push   %edi
80104de4:	56                   	push   %esi
80104de5:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104de6:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104de9:	83 ec 44             	sub    $0x44,%esp
80104dec:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104def:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104df2:	56                   	push   %esi
80104df3:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104df4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104df7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104dfa:	e8 b1 d0 ff ff       	call   80101eb0 <nameiparent>
80104dff:	83 c4 10             	add    $0x10,%esp
80104e02:	85 c0                	test   %eax,%eax
80104e04:	89 c7                	mov    %eax,%edi
80104e06:	0f 84 f4 00 00 00    	je     80104f00 <create+0x120>
    return 0;
  ilock(dp);
80104e0c:	83 ec 0c             	sub    $0xc,%esp
80104e0f:	50                   	push   %eax
80104e10:	e8 3b c8 ff ff       	call   80101650 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104e15:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104e18:	83 c4 0c             	add    $0xc,%esp
80104e1b:	50                   	push   %eax
80104e1c:	56                   	push   %esi
80104e1d:	57                   	push   %edi
80104e1e:	e8 4d cd ff ff       	call   80101b70 <dirlookup>
80104e23:	83 c4 10             	add    $0x10,%esp
80104e26:	85 c0                	test   %eax,%eax
80104e28:	89 c3                	mov    %eax,%ebx
80104e2a:	74 54                	je     80104e80 <create+0xa0>
    iunlockput(dp);
80104e2c:	83 ec 0c             	sub    $0xc,%esp
80104e2f:	57                   	push   %edi
80104e30:	e8 8b ca ff ff       	call   801018c0 <iunlockput>
    ilock(ip);
80104e35:	89 1c 24             	mov    %ebx,(%esp)
80104e38:	e8 13 c8 ff ff       	call   80101650 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104e3d:	83 c4 10             	add    $0x10,%esp
80104e40:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104e45:	75 19                	jne    80104e60 <create+0x80>
80104e47:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104e4c:	89 d8                	mov    %ebx,%eax
80104e4e:	75 10                	jne    80104e60 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104e50:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e53:	5b                   	pop    %ebx
80104e54:	5e                   	pop    %esi
80104e55:	5f                   	pop    %edi
80104e56:	5d                   	pop    %ebp
80104e57:	c3                   	ret    
80104e58:	90                   	nop
80104e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104e60:	83 ec 0c             	sub    $0xc,%esp
80104e63:	53                   	push   %ebx
80104e64:	e8 57 ca ff ff       	call   801018c0 <iunlockput>
    return 0;
80104e69:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104e6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104e6f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104e71:	5b                   	pop    %ebx
80104e72:	5e                   	pop    %esi
80104e73:	5f                   	pop    %edi
80104e74:	5d                   	pop    %ebp
80104e75:	c3                   	ret    
80104e76:	8d 76 00             	lea    0x0(%esi),%esi
80104e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104e80:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104e84:	83 ec 08             	sub    $0x8,%esp
80104e87:	50                   	push   %eax
80104e88:	ff 37                	pushl  (%edi)
80104e8a:	e8 51 c6 ff ff       	call   801014e0 <ialloc>
80104e8f:	83 c4 10             	add    $0x10,%esp
80104e92:	85 c0                	test   %eax,%eax
80104e94:	89 c3                	mov    %eax,%ebx
80104e96:	0f 84 cc 00 00 00    	je     80104f68 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104e9c:	83 ec 0c             	sub    $0xc,%esp
80104e9f:	50                   	push   %eax
80104ea0:	e8 ab c7 ff ff       	call   80101650 <ilock>
  ip->major = major;
80104ea5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104ea9:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104ead:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104eb1:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104eb5:	b8 01 00 00 00       	mov    $0x1,%eax
80104eba:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104ebe:	89 1c 24             	mov    %ebx,(%esp)
80104ec1:	e8 da c6 ff ff       	call   801015a0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104ec6:	83 c4 10             	add    $0x10,%esp
80104ec9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104ece:	74 40                	je     80104f10 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104ed0:	83 ec 04             	sub    $0x4,%esp
80104ed3:	ff 73 04             	pushl  0x4(%ebx)
80104ed6:	56                   	push   %esi
80104ed7:	57                   	push   %edi
80104ed8:	e8 f3 ce ff ff       	call   80101dd0 <dirlink>
80104edd:	83 c4 10             	add    $0x10,%esp
80104ee0:	85 c0                	test   %eax,%eax
80104ee2:	78 77                	js     80104f5b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104ee4:	83 ec 0c             	sub    $0xc,%esp
80104ee7:	57                   	push   %edi
80104ee8:	e8 d3 c9 ff ff       	call   801018c0 <iunlockput>

  return ip;
80104eed:	83 c4 10             	add    $0x10,%esp
}
80104ef0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104ef3:	89 d8                	mov    %ebx,%eax
}
80104ef5:	5b                   	pop    %ebx
80104ef6:	5e                   	pop    %esi
80104ef7:	5f                   	pop    %edi
80104ef8:	5d                   	pop    %ebp
80104ef9:	c3                   	ret    
80104efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104f00:	31 c0                	xor    %eax,%eax
80104f02:	e9 49 ff ff ff       	jmp    80104e50 <create+0x70>
80104f07:	89 f6                	mov    %esi,%esi
80104f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104f10:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104f15:	83 ec 0c             	sub    $0xc,%esp
80104f18:	57                   	push   %edi
80104f19:	e8 82 c6 ff ff       	call   801015a0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104f1e:	83 c4 0c             	add    $0xc,%esp
80104f21:	ff 73 04             	pushl  0x4(%ebx)
80104f24:	68 10 7e 10 80       	push   $0x80107e10
80104f29:	53                   	push   %ebx
80104f2a:	e8 a1 ce ff ff       	call   80101dd0 <dirlink>
80104f2f:	83 c4 10             	add    $0x10,%esp
80104f32:	85 c0                	test   %eax,%eax
80104f34:	78 18                	js     80104f4e <create+0x16e>
80104f36:	83 ec 04             	sub    $0x4,%esp
80104f39:	ff 77 04             	pushl  0x4(%edi)
80104f3c:	68 0f 7e 10 80       	push   $0x80107e0f
80104f41:	53                   	push   %ebx
80104f42:	e8 89 ce ff ff       	call   80101dd0 <dirlink>
80104f47:	83 c4 10             	add    $0x10,%esp
80104f4a:	85 c0                	test   %eax,%eax
80104f4c:	79 82                	jns    80104ed0 <create+0xf0>
      panic("create dots");
80104f4e:	83 ec 0c             	sub    $0xc,%esp
80104f51:	68 03 7e 10 80       	push   $0x80107e03
80104f56:	e8 15 b4 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104f5b:	83 ec 0c             	sub    $0xc,%esp
80104f5e:	68 12 7e 10 80       	push   $0x80107e12
80104f63:	e8 08 b4 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104f68:	83 ec 0c             	sub    $0xc,%esp
80104f6b:	68 f4 7d 10 80       	push   $0x80107df4
80104f70:	e8 fb b3 ff ff       	call   80100370 <panic>
80104f75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f80 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104f80:	55                   	push   %ebp
80104f81:	89 e5                	mov    %esp,%ebp
80104f83:	56                   	push   %esi
80104f84:	53                   	push   %ebx
80104f85:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104f87:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104f8a:	89 d3                	mov    %edx,%ebx
80104f8c:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104f8f:	50                   	push   %eax
80104f90:	6a 00                	push   $0x0
80104f92:	e8 c9 fc ff ff       	call   80104c60 <argint>
80104f97:	83 c4 10             	add    $0x10,%esp
80104f9a:	85 c0                	test   %eax,%eax
80104f9c:	78 3a                	js     80104fd8 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104f9e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80104fa1:	83 f9 0f             	cmp    $0xf,%ecx
80104fa4:	77 32                	ja     80104fd8 <argfd.constprop.0+0x58>
80104fa6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104fac:	8b 44 88 28          	mov    0x28(%eax,%ecx,4),%eax
80104fb0:	85 c0                	test   %eax,%eax
80104fb2:	74 24                	je     80104fd8 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
80104fb4:	85 f6                	test   %esi,%esi
80104fb6:	74 02                	je     80104fba <argfd.constprop.0+0x3a>
    *pfd = fd;
80104fb8:	89 0e                	mov    %ecx,(%esi)
  if(pf)
80104fba:	85 db                	test   %ebx,%ebx
80104fbc:	74 12                	je     80104fd0 <argfd.constprop.0+0x50>
    *pf = f;
80104fbe:	89 03                	mov    %eax,(%ebx)
  return 0;
80104fc0:	31 c0                	xor    %eax,%eax
}
80104fc2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104fc5:	5b                   	pop    %ebx
80104fc6:	5e                   	pop    %esi
80104fc7:	5d                   	pop    %ebp
80104fc8:	c3                   	ret    
80104fc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104fd0:	31 c0                	xor    %eax,%eax
80104fd2:	eb ee                	jmp    80104fc2 <argfd.constprop.0+0x42>
80104fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104fd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fdd:	eb e3                	jmp    80104fc2 <argfd.constprop.0+0x42>
80104fdf:	90                   	nop

80104fe0 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104fe0:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104fe1:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104fe3:	89 e5                	mov    %esp,%ebp
80104fe5:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104fe6:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104fe9:	83 ec 14             	sub    $0x14,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104fec:	e8 8f ff ff ff       	call   80104f80 <argfd.constprop.0>
80104ff1:	85 c0                	test   %eax,%eax
80104ff3:	78 1b                	js     80105010 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104ff5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104ff8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104ffe:	31 db                	xor    %ebx,%ebx
    if(proc->ofile[fd] == 0){
80105000:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80105004:	85 c9                	test   %ecx,%ecx
80105006:	74 18                	je     80105020 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105008:	83 c3 01             	add    $0x1,%ebx
8010500b:	83 fb 10             	cmp    $0x10,%ebx
8010500e:	75 f0                	jne    80105000 <sys_dup+0x20>
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80105010:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80105015:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105018:	c9                   	leave  
80105019:	c3                   	ret    
8010501a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80105020:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105023:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80105027:	52                   	push   %edx
80105028:	e8 93 bd ff ff       	call   80100dc0 <filedup>
  return fd;
8010502d:	89 d8                	mov    %ebx,%eax
8010502f:	83 c4 10             	add    $0x10,%esp
}
80105032:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105035:	c9                   	leave  
80105036:	c3                   	ret    
80105037:	89 f6                	mov    %esi,%esi
80105039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105040 <sys_read>:

int
sys_read(void)
{
80105040:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105041:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80105043:	89 e5                	mov    %esp,%ebp
80105045:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105048:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010504b:	e8 30 ff ff ff       	call   80104f80 <argfd.constprop.0>
80105050:	85 c0                	test   %eax,%eax
80105052:	78 4c                	js     801050a0 <sys_read+0x60>
80105054:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105057:	83 ec 08             	sub    $0x8,%esp
8010505a:	50                   	push   %eax
8010505b:	6a 02                	push   $0x2
8010505d:	e8 fe fb ff ff       	call   80104c60 <argint>
80105062:	83 c4 10             	add    $0x10,%esp
80105065:	85 c0                	test   %eax,%eax
80105067:	78 37                	js     801050a0 <sys_read+0x60>
80105069:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010506c:	83 ec 04             	sub    $0x4,%esp
8010506f:	ff 75 f0             	pushl  -0x10(%ebp)
80105072:	50                   	push   %eax
80105073:	6a 01                	push   $0x1
80105075:	e8 26 fc ff ff       	call   80104ca0 <argptr>
8010507a:	83 c4 10             	add    $0x10,%esp
8010507d:	85 c0                	test   %eax,%eax
8010507f:	78 1f                	js     801050a0 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80105081:	83 ec 04             	sub    $0x4,%esp
80105084:	ff 75 f0             	pushl  -0x10(%ebp)
80105087:	ff 75 f4             	pushl  -0xc(%ebp)
8010508a:	ff 75 ec             	pushl  -0x14(%ebp)
8010508d:	e8 9e be ff ff       	call   80100f30 <fileread>
80105092:	83 c4 10             	add    $0x10,%esp
}
80105095:	c9                   	leave  
80105096:	c3                   	ret    
80105097:	89 f6                	mov    %esi,%esi
80105099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
801050a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
801050a5:	c9                   	leave  
801050a6:	c3                   	ret    
801050a7:	89 f6                	mov    %esi,%esi
801050a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801050b0 <sys_write>:

int
sys_write(void)
{
801050b0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801050b1:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
801050b3:	89 e5                	mov    %esp,%ebp
801050b5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801050b8:	8d 55 ec             	lea    -0x14(%ebp),%edx
801050bb:	e8 c0 fe ff ff       	call   80104f80 <argfd.constprop.0>
801050c0:	85 c0                	test   %eax,%eax
801050c2:	78 4c                	js     80105110 <sys_write+0x60>
801050c4:	8d 45 f0             	lea    -0x10(%ebp),%eax
801050c7:	83 ec 08             	sub    $0x8,%esp
801050ca:	50                   	push   %eax
801050cb:	6a 02                	push   $0x2
801050cd:	e8 8e fb ff ff       	call   80104c60 <argint>
801050d2:	83 c4 10             	add    $0x10,%esp
801050d5:	85 c0                	test   %eax,%eax
801050d7:	78 37                	js     80105110 <sys_write+0x60>
801050d9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801050dc:	83 ec 04             	sub    $0x4,%esp
801050df:	ff 75 f0             	pushl  -0x10(%ebp)
801050e2:	50                   	push   %eax
801050e3:	6a 01                	push   $0x1
801050e5:	e8 b6 fb ff ff       	call   80104ca0 <argptr>
801050ea:	83 c4 10             	add    $0x10,%esp
801050ed:	85 c0                	test   %eax,%eax
801050ef:	78 1f                	js     80105110 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
801050f1:	83 ec 04             	sub    $0x4,%esp
801050f4:	ff 75 f0             	pushl  -0x10(%ebp)
801050f7:	ff 75 f4             	pushl  -0xc(%ebp)
801050fa:	ff 75 ec             	pushl  -0x14(%ebp)
801050fd:	e8 be be ff ff       	call   80100fc0 <filewrite>
80105102:	83 c4 10             	add    $0x10,%esp
}
80105105:	c9                   	leave  
80105106:	c3                   	ret    
80105107:	89 f6                	mov    %esi,%esi
80105109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80105110:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80105115:	c9                   	leave  
80105116:	c3                   	ret    
80105117:	89 f6                	mov    %esi,%esi
80105119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105120 <sys_close>:

int
sys_close(void)
{
80105120:	55                   	push   %ebp
80105121:	89 e5                	mov    %esp,%ebp
80105123:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80105126:	8d 55 f4             	lea    -0xc(%ebp),%edx
80105129:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010512c:	e8 4f fe ff ff       	call   80104f80 <argfd.constprop.0>
80105131:	85 c0                	test   %eax,%eax
80105133:	78 2b                	js     80105160 <sys_close+0x40>
    return -1;
  proc->ofile[fd] = 0;
80105135:	8b 55 f0             	mov    -0x10(%ebp),%edx
80105138:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  fileclose(f);
8010513e:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  proc->ofile[fd] = 0;
80105141:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80105148:	00 
  fileclose(f);
80105149:	ff 75 f4             	pushl  -0xc(%ebp)
8010514c:	e8 bf bc ff ff       	call   80100e10 <fileclose>
  return 0;
80105151:	83 c4 10             	add    $0x10,%esp
80105154:	31 c0                	xor    %eax,%eax
}
80105156:	c9                   	leave  
80105157:	c3                   	ret    
80105158:	90                   	nop
80105159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80105160:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80105165:	c9                   	leave  
80105166:	c3                   	ret    
80105167:	89 f6                	mov    %esi,%esi
80105169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105170 <sys_fstat>:

int
sys_fstat(void)
{
80105170:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80105171:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80105173:	89 e5                	mov    %esp,%ebp
80105175:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80105178:	8d 55 f0             	lea    -0x10(%ebp),%edx
8010517b:	e8 00 fe ff ff       	call   80104f80 <argfd.constprop.0>
80105180:	85 c0                	test   %eax,%eax
80105182:	78 2c                	js     801051b0 <sys_fstat+0x40>
80105184:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105187:	83 ec 04             	sub    $0x4,%esp
8010518a:	6a 14                	push   $0x14
8010518c:	50                   	push   %eax
8010518d:	6a 01                	push   $0x1
8010518f:	e8 0c fb ff ff       	call   80104ca0 <argptr>
80105194:	83 c4 10             	add    $0x10,%esp
80105197:	85 c0                	test   %eax,%eax
80105199:	78 15                	js     801051b0 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
8010519b:	83 ec 08             	sub    $0x8,%esp
8010519e:	ff 75 f4             	pushl  -0xc(%ebp)
801051a1:	ff 75 f0             	pushl  -0x10(%ebp)
801051a4:	e8 37 bd ff ff       	call   80100ee0 <filestat>
801051a9:	83 c4 10             	add    $0x10,%esp
}
801051ac:	c9                   	leave  
801051ad:	c3                   	ret    
801051ae:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
801051b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
801051b5:	c9                   	leave  
801051b6:	c3                   	ret    
801051b7:	89 f6                	mov    %esi,%esi
801051b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801051c0 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
801051c0:	55                   	push   %ebp
801051c1:	89 e5                	mov    %esp,%ebp
801051c3:	57                   	push   %edi
801051c4:	56                   	push   %esi
801051c5:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
801051c6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
801051c9:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
801051cc:	50                   	push   %eax
801051cd:	6a 00                	push   $0x0
801051cf:	e8 1c fb ff ff       	call   80104cf0 <argstr>
801051d4:	83 c4 10             	add    $0x10,%esp
801051d7:	85 c0                	test   %eax,%eax
801051d9:	0f 88 fb 00 00 00    	js     801052da <sys_link+0x11a>
801051df:	8d 45 d0             	lea    -0x30(%ebp),%eax
801051e2:	83 ec 08             	sub    $0x8,%esp
801051e5:	50                   	push   %eax
801051e6:	6a 01                	push   $0x1
801051e8:	e8 03 fb ff ff       	call   80104cf0 <argstr>
801051ed:	83 c4 10             	add    $0x10,%esp
801051f0:	85 c0                	test   %eax,%eax
801051f2:	0f 88 e2 00 00 00    	js     801052da <sys_link+0x11a>
    return -1;

  begin_op();
801051f8:	e8 23 d9 ff ff       	call   80102b20 <begin_op>
  if((ip = namei(old)) == 0){
801051fd:	83 ec 0c             	sub    $0xc,%esp
80105200:	ff 75 d4             	pushl  -0x2c(%ebp)
80105203:	e8 88 cc ff ff       	call   80101e90 <namei>
80105208:	83 c4 10             	add    $0x10,%esp
8010520b:	85 c0                	test   %eax,%eax
8010520d:	89 c3                	mov    %eax,%ebx
8010520f:	0f 84 f3 00 00 00    	je     80105308 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80105215:	83 ec 0c             	sub    $0xc,%esp
80105218:	50                   	push   %eax
80105219:	e8 32 c4 ff ff       	call   80101650 <ilock>
  if(ip->type == T_DIR){
8010521e:	83 c4 10             	add    $0x10,%esp
80105221:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105226:	0f 84 c4 00 00 00    	je     801052f0 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
8010522c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80105231:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80105234:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80105237:	53                   	push   %ebx
80105238:	e8 63 c3 ff ff       	call   801015a0 <iupdate>
  iunlock(ip);
8010523d:	89 1c 24             	mov    %ebx,(%esp)
80105240:	e8 eb c4 ff ff       	call   80101730 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80105245:	58                   	pop    %eax
80105246:	5a                   	pop    %edx
80105247:	57                   	push   %edi
80105248:	ff 75 d0             	pushl  -0x30(%ebp)
8010524b:	e8 60 cc ff ff       	call   80101eb0 <nameiparent>
80105250:	83 c4 10             	add    $0x10,%esp
80105253:	85 c0                	test   %eax,%eax
80105255:	89 c6                	mov    %eax,%esi
80105257:	74 5b                	je     801052b4 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80105259:	83 ec 0c             	sub    $0xc,%esp
8010525c:	50                   	push   %eax
8010525d:	e8 ee c3 ff ff       	call   80101650 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105262:	83 c4 10             	add    $0x10,%esp
80105265:	8b 03                	mov    (%ebx),%eax
80105267:	39 06                	cmp    %eax,(%esi)
80105269:	75 3d                	jne    801052a8 <sys_link+0xe8>
8010526b:	83 ec 04             	sub    $0x4,%esp
8010526e:	ff 73 04             	pushl  0x4(%ebx)
80105271:	57                   	push   %edi
80105272:	56                   	push   %esi
80105273:	e8 58 cb ff ff       	call   80101dd0 <dirlink>
80105278:	83 c4 10             	add    $0x10,%esp
8010527b:	85 c0                	test   %eax,%eax
8010527d:	78 29                	js     801052a8 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
8010527f:	83 ec 0c             	sub    $0xc,%esp
80105282:	56                   	push   %esi
80105283:	e8 38 c6 ff ff       	call   801018c0 <iunlockput>
  iput(ip);
80105288:	89 1c 24             	mov    %ebx,(%esp)
8010528b:	e8 f0 c4 ff ff       	call   80101780 <iput>

  end_op();
80105290:	e8 fb d8 ff ff       	call   80102b90 <end_op>

  return 0;
80105295:	83 c4 10             	add    $0x10,%esp
80105298:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
8010529a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010529d:	5b                   	pop    %ebx
8010529e:	5e                   	pop    %esi
8010529f:	5f                   	pop    %edi
801052a0:	5d                   	pop    %ebp
801052a1:	c3                   	ret    
801052a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
801052a8:	83 ec 0c             	sub    $0xc,%esp
801052ab:	56                   	push   %esi
801052ac:	e8 0f c6 ff ff       	call   801018c0 <iunlockput>
    goto bad;
801052b1:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
801052b4:	83 ec 0c             	sub    $0xc,%esp
801052b7:	53                   	push   %ebx
801052b8:	e8 93 c3 ff ff       	call   80101650 <ilock>
  ip->nlink--;
801052bd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801052c2:	89 1c 24             	mov    %ebx,(%esp)
801052c5:	e8 d6 c2 ff ff       	call   801015a0 <iupdate>
  iunlockput(ip);
801052ca:	89 1c 24             	mov    %ebx,(%esp)
801052cd:	e8 ee c5 ff ff       	call   801018c0 <iunlockput>
  end_op();
801052d2:	e8 b9 d8 ff ff       	call   80102b90 <end_op>
  return -1;
801052d7:	83 c4 10             	add    $0x10,%esp
}
801052da:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
801052dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801052e2:	5b                   	pop    %ebx
801052e3:	5e                   	pop    %esi
801052e4:	5f                   	pop    %edi
801052e5:	5d                   	pop    %ebp
801052e6:	c3                   	ret    
801052e7:	89 f6                	mov    %esi,%esi
801052e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
801052f0:	83 ec 0c             	sub    $0xc,%esp
801052f3:	53                   	push   %ebx
801052f4:	e8 c7 c5 ff ff       	call   801018c0 <iunlockput>
    end_op();
801052f9:	e8 92 d8 ff ff       	call   80102b90 <end_op>
    return -1;
801052fe:	83 c4 10             	add    $0x10,%esp
80105301:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105306:	eb 92                	jmp    8010529a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80105308:	e8 83 d8 ff ff       	call   80102b90 <end_op>
    return -1;
8010530d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105312:	eb 86                	jmp    8010529a <sys_link+0xda>
80105314:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010531a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105320 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80105320:	55                   	push   %ebp
80105321:	89 e5                	mov    %esp,%ebp
80105323:	57                   	push   %edi
80105324:	56                   	push   %esi
80105325:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80105326:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80105329:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
8010532c:	50                   	push   %eax
8010532d:	6a 00                	push   $0x0
8010532f:	e8 bc f9 ff ff       	call   80104cf0 <argstr>
80105334:	83 c4 10             	add    $0x10,%esp
80105337:	85 c0                	test   %eax,%eax
80105339:	0f 88 82 01 00 00    	js     801054c1 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
8010533f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80105342:	e8 d9 d7 ff ff       	call   80102b20 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105347:	83 ec 08             	sub    $0x8,%esp
8010534a:	53                   	push   %ebx
8010534b:	ff 75 c0             	pushl  -0x40(%ebp)
8010534e:	e8 5d cb ff ff       	call   80101eb0 <nameiparent>
80105353:	83 c4 10             	add    $0x10,%esp
80105356:	85 c0                	test   %eax,%eax
80105358:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010535b:	0f 84 6a 01 00 00    	je     801054cb <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80105361:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105364:	83 ec 0c             	sub    $0xc,%esp
80105367:	56                   	push   %esi
80105368:	e8 e3 c2 ff ff       	call   80101650 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
8010536d:	58                   	pop    %eax
8010536e:	5a                   	pop    %edx
8010536f:	68 10 7e 10 80       	push   $0x80107e10
80105374:	53                   	push   %ebx
80105375:	e8 d6 c7 ff ff       	call   80101b50 <namecmp>
8010537a:	83 c4 10             	add    $0x10,%esp
8010537d:	85 c0                	test   %eax,%eax
8010537f:	0f 84 fc 00 00 00    	je     80105481 <sys_unlink+0x161>
80105385:	83 ec 08             	sub    $0x8,%esp
80105388:	68 0f 7e 10 80       	push   $0x80107e0f
8010538d:	53                   	push   %ebx
8010538e:	e8 bd c7 ff ff       	call   80101b50 <namecmp>
80105393:	83 c4 10             	add    $0x10,%esp
80105396:	85 c0                	test   %eax,%eax
80105398:	0f 84 e3 00 00 00    	je     80105481 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
8010539e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801053a1:	83 ec 04             	sub    $0x4,%esp
801053a4:	50                   	push   %eax
801053a5:	53                   	push   %ebx
801053a6:	56                   	push   %esi
801053a7:	e8 c4 c7 ff ff       	call   80101b70 <dirlookup>
801053ac:	83 c4 10             	add    $0x10,%esp
801053af:	85 c0                	test   %eax,%eax
801053b1:	89 c3                	mov    %eax,%ebx
801053b3:	0f 84 c8 00 00 00    	je     80105481 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
801053b9:	83 ec 0c             	sub    $0xc,%esp
801053bc:	50                   	push   %eax
801053bd:	e8 8e c2 ff ff       	call   80101650 <ilock>

  if(ip->nlink < 1)
801053c2:	83 c4 10             	add    $0x10,%esp
801053c5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801053ca:	0f 8e 24 01 00 00    	jle    801054f4 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
801053d0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801053d5:	8d 75 d8             	lea    -0x28(%ebp),%esi
801053d8:	74 66                	je     80105440 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
801053da:	83 ec 04             	sub    $0x4,%esp
801053dd:	6a 10                	push   $0x10
801053df:	6a 00                	push   $0x0
801053e1:	56                   	push   %esi
801053e2:	e8 89 f5 ff ff       	call   80104970 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801053e7:	6a 10                	push   $0x10
801053e9:	ff 75 c4             	pushl  -0x3c(%ebp)
801053ec:	56                   	push   %esi
801053ed:	ff 75 b4             	pushl  -0x4c(%ebp)
801053f0:	e8 2b c6 ff ff       	call   80101a20 <writei>
801053f5:	83 c4 20             	add    $0x20,%esp
801053f8:	83 f8 10             	cmp    $0x10,%eax
801053fb:	0f 85 e6 00 00 00    	jne    801054e7 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80105401:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105406:	0f 84 9c 00 00 00    	je     801054a8 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
8010540c:	83 ec 0c             	sub    $0xc,%esp
8010540f:	ff 75 b4             	pushl  -0x4c(%ebp)
80105412:	e8 a9 c4 ff ff       	call   801018c0 <iunlockput>

  ip->nlink--;
80105417:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
8010541c:	89 1c 24             	mov    %ebx,(%esp)
8010541f:	e8 7c c1 ff ff       	call   801015a0 <iupdate>
  iunlockput(ip);
80105424:	89 1c 24             	mov    %ebx,(%esp)
80105427:	e8 94 c4 ff ff       	call   801018c0 <iunlockput>

  end_op();
8010542c:	e8 5f d7 ff ff       	call   80102b90 <end_op>

  return 0;
80105431:	83 c4 10             	add    $0x10,%esp
80105434:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80105436:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105439:	5b                   	pop    %ebx
8010543a:	5e                   	pop    %esi
8010543b:	5f                   	pop    %edi
8010543c:	5d                   	pop    %ebp
8010543d:	c3                   	ret    
8010543e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105440:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105444:	76 94                	jbe    801053da <sys_unlink+0xba>
80105446:	bf 20 00 00 00       	mov    $0x20,%edi
8010544b:	eb 0f                	jmp    8010545c <sys_unlink+0x13c>
8010544d:	8d 76 00             	lea    0x0(%esi),%esi
80105450:	83 c7 10             	add    $0x10,%edi
80105453:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105456:	0f 83 7e ff ff ff    	jae    801053da <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010545c:	6a 10                	push   $0x10
8010545e:	57                   	push   %edi
8010545f:	56                   	push   %esi
80105460:	53                   	push   %ebx
80105461:	e8 aa c4 ff ff       	call   80101910 <readi>
80105466:	83 c4 10             	add    $0x10,%esp
80105469:	83 f8 10             	cmp    $0x10,%eax
8010546c:	75 6c                	jne    801054da <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010546e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105473:	74 db                	je     80105450 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105475:	83 ec 0c             	sub    $0xc,%esp
80105478:	53                   	push   %ebx
80105479:	e8 42 c4 ff ff       	call   801018c0 <iunlockput>
    goto bad;
8010547e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80105481:	83 ec 0c             	sub    $0xc,%esp
80105484:	ff 75 b4             	pushl  -0x4c(%ebp)
80105487:	e8 34 c4 ff ff       	call   801018c0 <iunlockput>
  end_op();
8010548c:	e8 ff d6 ff ff       	call   80102b90 <end_op>
  return -1;
80105491:	83 c4 10             	add    $0x10,%esp
}
80105494:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80105497:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010549c:	5b                   	pop    %ebx
8010549d:	5e                   	pop    %esi
8010549e:	5f                   	pop    %edi
8010549f:	5d                   	pop    %ebp
801054a0:	c3                   	ret    
801054a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801054a8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
801054ab:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801054ae:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
801054b3:	50                   	push   %eax
801054b4:	e8 e7 c0 ff ff       	call   801015a0 <iupdate>
801054b9:	83 c4 10             	add    $0x10,%esp
801054bc:	e9 4b ff ff ff       	jmp    8010540c <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
801054c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054c6:	e9 6b ff ff ff       	jmp    80105436 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
801054cb:	e8 c0 d6 ff ff       	call   80102b90 <end_op>
    return -1;
801054d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054d5:	e9 5c ff ff ff       	jmp    80105436 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
801054da:	83 ec 0c             	sub    $0xc,%esp
801054dd:	68 34 7e 10 80       	push   $0x80107e34
801054e2:	e8 89 ae ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
801054e7:	83 ec 0c             	sub    $0xc,%esp
801054ea:	68 46 7e 10 80       	push   $0x80107e46
801054ef:	e8 7c ae ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
801054f4:	83 ec 0c             	sub    $0xc,%esp
801054f7:	68 22 7e 10 80       	push   $0x80107e22
801054fc:	e8 6f ae ff ff       	call   80100370 <panic>
80105501:	eb 0d                	jmp    80105510 <sys_open>
80105503:	90                   	nop
80105504:	90                   	nop
80105505:	90                   	nop
80105506:	90                   	nop
80105507:	90                   	nop
80105508:	90                   	nop
80105509:	90                   	nop
8010550a:	90                   	nop
8010550b:	90                   	nop
8010550c:	90                   	nop
8010550d:	90                   	nop
8010550e:	90                   	nop
8010550f:	90                   	nop

80105510 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	57                   	push   %edi
80105514:	56                   	push   %esi
80105515:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105516:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80105519:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010551c:	50                   	push   %eax
8010551d:	6a 00                	push   $0x0
8010551f:	e8 cc f7 ff ff       	call   80104cf0 <argstr>
80105524:	83 c4 10             	add    $0x10,%esp
80105527:	85 c0                	test   %eax,%eax
80105529:	0f 88 9e 00 00 00    	js     801055cd <sys_open+0xbd>
8010552f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105532:	83 ec 08             	sub    $0x8,%esp
80105535:	50                   	push   %eax
80105536:	6a 01                	push   $0x1
80105538:	e8 23 f7 ff ff       	call   80104c60 <argint>
8010553d:	83 c4 10             	add    $0x10,%esp
80105540:	85 c0                	test   %eax,%eax
80105542:	0f 88 85 00 00 00    	js     801055cd <sys_open+0xbd>
    return -1;

  begin_op();
80105548:	e8 d3 d5 ff ff       	call   80102b20 <begin_op>

  if(omode & O_CREATE){
8010554d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105551:	0f 85 89 00 00 00    	jne    801055e0 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105557:	83 ec 0c             	sub    $0xc,%esp
8010555a:	ff 75 e0             	pushl  -0x20(%ebp)
8010555d:	e8 2e c9 ff ff       	call   80101e90 <namei>
80105562:	83 c4 10             	add    $0x10,%esp
80105565:	85 c0                	test   %eax,%eax
80105567:	89 c7                	mov    %eax,%edi
80105569:	0f 84 8e 00 00 00    	je     801055fd <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010556f:	83 ec 0c             	sub    $0xc,%esp
80105572:	50                   	push   %eax
80105573:	e8 d8 c0 ff ff       	call   80101650 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105578:	83 c4 10             	add    $0x10,%esp
8010557b:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80105580:	0f 84 d2 00 00 00    	je     80105658 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105586:	e8 c5 b7 ff ff       	call   80100d50 <filealloc>
8010558b:	85 c0                	test   %eax,%eax
8010558d:	89 c6                	mov    %eax,%esi
8010558f:	74 2b                	je     801055bc <sys_open+0xac>
80105591:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105598:	31 db                	xor    %ebx,%ebx
8010559a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
801055a0:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
801055a4:	85 c0                	test   %eax,%eax
801055a6:	74 68                	je     80105610 <sys_open+0x100>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801055a8:	83 c3 01             	add    $0x1,%ebx
801055ab:	83 fb 10             	cmp    $0x10,%ebx
801055ae:	75 f0                	jne    801055a0 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
801055b0:	83 ec 0c             	sub    $0xc,%esp
801055b3:	56                   	push   %esi
801055b4:	e8 57 b8 ff ff       	call   80100e10 <fileclose>
801055b9:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801055bc:	83 ec 0c             	sub    $0xc,%esp
801055bf:	57                   	push   %edi
801055c0:	e8 fb c2 ff ff       	call   801018c0 <iunlockput>
    end_op();
801055c5:	e8 c6 d5 ff ff       	call   80102b90 <end_op>
    return -1;
801055ca:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801055cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
801055d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
801055d5:	5b                   	pop    %ebx
801055d6:	5e                   	pop    %esi
801055d7:	5f                   	pop    %edi
801055d8:	5d                   	pop    %ebp
801055d9:	c3                   	ret    
801055da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801055e0:	83 ec 0c             	sub    $0xc,%esp
801055e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801055e6:	31 c9                	xor    %ecx,%ecx
801055e8:	6a 00                	push   $0x0
801055ea:	ba 02 00 00 00       	mov    $0x2,%edx
801055ef:	e8 ec f7 ff ff       	call   80104de0 <create>
    if(ip == 0){
801055f4:	83 c4 10             	add    $0x10,%esp
801055f7:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801055f9:	89 c7                	mov    %eax,%edi
    if(ip == 0){
801055fb:	75 89                	jne    80105586 <sys_open+0x76>
      end_op();
801055fd:	e8 8e d5 ff ff       	call   80102b90 <end_op>
      return -1;
80105602:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105607:	eb 43                	jmp    8010564c <sys_open+0x13c>
80105609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105610:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105613:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105617:	57                   	push   %edi
80105618:	e8 13 c1 ff ff       	call   80101730 <iunlock>
  end_op();
8010561d:	e8 6e d5 ff ff       	call   80102b90 <end_op>

  f->type = FD_INODE;
80105622:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105628:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010562b:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
8010562e:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
80105631:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
80105638:	89 d0                	mov    %edx,%eax
8010563a:	83 e0 01             	and    $0x1,%eax
8010563d:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105640:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105643:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105646:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
8010564a:	89 d8                	mov    %ebx,%eax
}
8010564c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010564f:	5b                   	pop    %ebx
80105650:	5e                   	pop    %esi
80105651:	5f                   	pop    %edi
80105652:	5d                   	pop    %ebp
80105653:	c3                   	ret    
80105654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105658:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010565b:	85 d2                	test   %edx,%edx
8010565d:	0f 84 23 ff ff ff    	je     80105586 <sys_open+0x76>
80105663:	e9 54 ff ff ff       	jmp    801055bc <sys_open+0xac>
80105668:	90                   	nop
80105669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105670 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105670:	55                   	push   %ebp
80105671:	89 e5                	mov    %esp,%ebp
80105673:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105676:	e8 a5 d4 ff ff       	call   80102b20 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010567b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010567e:	83 ec 08             	sub    $0x8,%esp
80105681:	50                   	push   %eax
80105682:	6a 00                	push   $0x0
80105684:	e8 67 f6 ff ff       	call   80104cf0 <argstr>
80105689:	83 c4 10             	add    $0x10,%esp
8010568c:	85 c0                	test   %eax,%eax
8010568e:	78 30                	js     801056c0 <sys_mkdir+0x50>
80105690:	83 ec 0c             	sub    $0xc,%esp
80105693:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105696:	31 c9                	xor    %ecx,%ecx
80105698:	6a 00                	push   $0x0
8010569a:	ba 01 00 00 00       	mov    $0x1,%edx
8010569f:	e8 3c f7 ff ff       	call   80104de0 <create>
801056a4:	83 c4 10             	add    $0x10,%esp
801056a7:	85 c0                	test   %eax,%eax
801056a9:	74 15                	je     801056c0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801056ab:	83 ec 0c             	sub    $0xc,%esp
801056ae:	50                   	push   %eax
801056af:	e8 0c c2 ff ff       	call   801018c0 <iunlockput>
  end_op();
801056b4:	e8 d7 d4 ff ff       	call   80102b90 <end_op>
  return 0;
801056b9:	83 c4 10             	add    $0x10,%esp
801056bc:	31 c0                	xor    %eax,%eax
}
801056be:	c9                   	leave  
801056bf:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
801056c0:	e8 cb d4 ff ff       	call   80102b90 <end_op>
    return -1;
801056c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801056ca:	c9                   	leave  
801056cb:	c3                   	ret    
801056cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056d0 <sys_mknod>:

int
sys_mknod(void)
{
801056d0:	55                   	push   %ebp
801056d1:	89 e5                	mov    %esp,%ebp
801056d3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801056d6:	e8 45 d4 ff ff       	call   80102b20 <begin_op>
  if((argstr(0, &path)) < 0 ||
801056db:	8d 45 ec             	lea    -0x14(%ebp),%eax
801056de:	83 ec 08             	sub    $0x8,%esp
801056e1:	50                   	push   %eax
801056e2:	6a 00                	push   $0x0
801056e4:	e8 07 f6 ff ff       	call   80104cf0 <argstr>
801056e9:	83 c4 10             	add    $0x10,%esp
801056ec:	85 c0                	test   %eax,%eax
801056ee:	78 60                	js     80105750 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801056f0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801056f3:	83 ec 08             	sub    $0x8,%esp
801056f6:	50                   	push   %eax
801056f7:	6a 01                	push   $0x1
801056f9:	e8 62 f5 ff ff       	call   80104c60 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
801056fe:	83 c4 10             	add    $0x10,%esp
80105701:	85 c0                	test   %eax,%eax
80105703:	78 4b                	js     80105750 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105705:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105708:	83 ec 08             	sub    $0x8,%esp
8010570b:	50                   	push   %eax
8010570c:	6a 02                	push   $0x2
8010570e:	e8 4d f5 ff ff       	call   80104c60 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
80105713:	83 c4 10             	add    $0x10,%esp
80105716:	85 c0                	test   %eax,%eax
80105718:	78 36                	js     80105750 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
8010571a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
8010571e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105721:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105725:	ba 03 00 00 00       	mov    $0x3,%edx
8010572a:	50                   	push   %eax
8010572b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010572e:	e8 ad f6 ff ff       	call   80104de0 <create>
80105733:	83 c4 10             	add    $0x10,%esp
80105736:	85 c0                	test   %eax,%eax
80105738:	74 16                	je     80105750 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010573a:	83 ec 0c             	sub    $0xc,%esp
8010573d:	50                   	push   %eax
8010573e:	e8 7d c1 ff ff       	call   801018c0 <iunlockput>
  end_op();
80105743:	e8 48 d4 ff ff       	call   80102b90 <end_op>
  return 0;
80105748:	83 c4 10             	add    $0x10,%esp
8010574b:	31 c0                	xor    %eax,%eax
}
8010574d:	c9                   	leave  
8010574e:	c3                   	ret    
8010574f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105750:	e8 3b d4 ff ff       	call   80102b90 <end_op>
    return -1;
80105755:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010575a:	c9                   	leave  
8010575b:	c3                   	ret    
8010575c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105760 <sys_chdir>:

int
sys_chdir(void)
{
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
80105763:	53                   	push   %ebx
80105764:	83 ec 14             	sub    $0x14,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105767:	e8 b4 d3 ff ff       	call   80102b20 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
8010576c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010576f:	83 ec 08             	sub    $0x8,%esp
80105772:	50                   	push   %eax
80105773:	6a 00                	push   $0x0
80105775:	e8 76 f5 ff ff       	call   80104cf0 <argstr>
8010577a:	83 c4 10             	add    $0x10,%esp
8010577d:	85 c0                	test   %eax,%eax
8010577f:	78 7f                	js     80105800 <sys_chdir+0xa0>
80105781:	83 ec 0c             	sub    $0xc,%esp
80105784:	ff 75 f4             	pushl  -0xc(%ebp)
80105787:	e8 04 c7 ff ff       	call   80101e90 <namei>
8010578c:	83 c4 10             	add    $0x10,%esp
8010578f:	85 c0                	test   %eax,%eax
80105791:	89 c3                	mov    %eax,%ebx
80105793:	74 6b                	je     80105800 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
80105795:	83 ec 0c             	sub    $0xc,%esp
80105798:	50                   	push   %eax
80105799:	e8 b2 be ff ff       	call   80101650 <ilock>
  if(ip->type != T_DIR){
8010579e:	83 c4 10             	add    $0x10,%esp
801057a1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801057a6:	75 38                	jne    801057e0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801057a8:	83 ec 0c             	sub    $0xc,%esp
801057ab:	53                   	push   %ebx
801057ac:	e8 7f bf ff ff       	call   80101730 <iunlock>
  iput(proc->cwd);
801057b1:	58                   	pop    %eax
801057b2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801057b8:	ff 70 68             	pushl  0x68(%eax)
801057bb:	e8 c0 bf ff ff       	call   80101780 <iput>
  end_op();
801057c0:	e8 cb d3 ff ff       	call   80102b90 <end_op>
  proc->cwd = ip;
801057c5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return 0;
801057cb:	83 c4 10             	add    $0x10,%esp
    return -1;
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
801057ce:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
801057d1:	31 c0                	xor    %eax,%eax
}
801057d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057d6:	c9                   	leave  
801057d7:	c3                   	ret    
801057d8:	90                   	nop
801057d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
801057e0:	83 ec 0c             	sub    $0xc,%esp
801057e3:	53                   	push   %ebx
801057e4:	e8 d7 c0 ff ff       	call   801018c0 <iunlockput>
    end_op();
801057e9:	e8 a2 d3 ff ff       	call   80102b90 <end_op>
    return -1;
801057ee:	83 c4 10             	add    $0x10,%esp
801057f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057f6:	eb db                	jmp    801057d3 <sys_chdir+0x73>
801057f8:	90                   	nop
801057f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
80105800:	e8 8b d3 ff ff       	call   80102b90 <end_op>
    return -1;
80105805:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010580a:	eb c7                	jmp    801057d3 <sys_chdir+0x73>
8010580c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105810 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
80105810:	55                   	push   %ebp
80105811:	89 e5                	mov    %esp,%ebp
80105813:	57                   	push   %edi
80105814:	56                   	push   %esi
80105815:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105816:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
8010581c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105822:	50                   	push   %eax
80105823:	6a 00                	push   $0x0
80105825:	e8 c6 f4 ff ff       	call   80104cf0 <argstr>
8010582a:	83 c4 10             	add    $0x10,%esp
8010582d:	85 c0                	test   %eax,%eax
8010582f:	0f 88 86 00 00 00    	js     801058bb <sys_exec+0xab>
80105835:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010583b:	83 ec 08             	sub    $0x8,%esp
8010583e:	50                   	push   %eax
8010583f:	6a 01                	push   $0x1
80105841:	e8 1a f4 ff ff       	call   80104c60 <argint>
80105846:	83 c4 10             	add    $0x10,%esp
80105849:	85 c0                	test   %eax,%eax
8010584b:	78 6e                	js     801058bb <sys_exec+0xab>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010584d:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105853:	83 ec 04             	sub    $0x4,%esp
80105856:	31 ff                	xor    %edi,%edi
80105858:	68 80 00 00 00       	push   $0x80
8010585d:	6a 00                	push   $0x0
8010585f:	31 db                	xor    %ebx,%ebx
80105861:	56                   	push   %esi
80105862:	e8 09 f1 ff ff       	call   80104970 <memset>
80105867:	83 c4 10             	add    $0x10,%esp
8010586a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105870:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80105876:	83 ec 08             	sub    $0x8,%esp
80105879:	50                   	push   %eax
8010587a:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105880:	01 f8                	add    %edi,%eax
80105882:	50                   	push   %eax
80105883:	e8 58 f3 ff ff       	call   80104be0 <fetchint>
80105888:	83 c4 10             	add    $0x10,%esp
8010588b:	85 c0                	test   %eax,%eax
8010588d:	78 2c                	js     801058bb <sys_exec+0xab>
      return -1;
    if(uarg == 0){
8010588f:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105895:	85 c0                	test   %eax,%eax
80105897:	74 37                	je     801058d0 <sys_exec+0xc0>
80105899:	8d 0c 3e             	lea    (%esi,%edi,1),%ecx
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
8010589c:	83 ec 08             	sub    $0x8,%esp
8010589f:	51                   	push   %ecx
801058a0:	50                   	push   %eax
801058a1:	e8 6a f3 ff ff       	call   80104c10 <fetchstr>
801058a6:	83 c4 10             	add    $0x10,%esp
801058a9:	85 c0                	test   %eax,%eax
801058ab:	78 0e                	js     801058bb <sys_exec+0xab>
801058ad:	83 c7 04             	add    $0x4,%edi

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801058b0:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
801058b3:	81 ff 80 00 00 00    	cmp    $0x80,%edi
801058b9:	75 b5                	jne    80105870 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801058bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801058be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801058c3:	5b                   	pop    %ebx
801058c4:	5e                   	pop    %esi
801058c5:	5f                   	pop    %edi
801058c6:	5d                   	pop    %ebp
801058c7:	c3                   	ret    
801058c8:	90                   	nop
801058c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801058d0:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
801058d3:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801058da:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801058de:	56                   	push   %esi
801058df:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801058e5:	e8 e6 b0 ff ff       	call   801009d0 <exec>
801058ea:	83 c4 10             	add    $0x10,%esp
}
801058ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058f0:	5b                   	pop    %ebx
801058f1:	5e                   	pop    %esi
801058f2:	5f                   	pop    %edi
801058f3:	5d                   	pop    %ebp
801058f4:	c3                   	ret    
801058f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801058f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105900 <sys_pipe>:

int
sys_pipe(void)
{
80105900:	55                   	push   %ebp
80105901:	89 e5                	mov    %esp,%ebp
80105903:	57                   	push   %edi
80105904:	56                   	push   %esi
80105905:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105906:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
80105909:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010590c:	6a 08                	push   $0x8
8010590e:	50                   	push   %eax
8010590f:	6a 00                	push   $0x0
80105911:	e8 8a f3 ff ff       	call   80104ca0 <argptr>
80105916:	83 c4 10             	add    $0x10,%esp
80105919:	85 c0                	test   %eax,%eax
8010591b:	78 48                	js     80105965 <sys_pipe+0x65>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010591d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105920:	83 ec 08             	sub    $0x8,%esp
80105923:	50                   	push   %eax
80105924:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105927:	50                   	push   %eax
80105928:	e8 73 d9 ff ff       	call   801032a0 <pipealloc>
8010592d:	83 c4 10             	add    $0x10,%esp
80105930:	85 c0                	test   %eax,%eax
80105932:	78 31                	js     80105965 <sys_pipe+0x65>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105934:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80105937:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010593e:	31 c0                	xor    %eax,%eax
    if(proc->ofile[fd] == 0){
80105940:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105944:	85 d2                	test   %edx,%edx
80105946:	74 28                	je     80105970 <sys_pipe+0x70>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105948:	83 c0 01             	add    $0x1,%eax
8010594b:	83 f8 10             	cmp    $0x10,%eax
8010594e:	75 f0                	jne    80105940 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
80105950:	83 ec 0c             	sub    $0xc,%esp
80105953:	53                   	push   %ebx
80105954:	e8 b7 b4 ff ff       	call   80100e10 <fileclose>
    fileclose(wf);
80105959:	58                   	pop    %eax
8010595a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010595d:	e8 ae b4 ff ff       	call   80100e10 <fileclose>
    return -1;
80105962:	83 c4 10             	add    $0x10,%esp
80105965:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010596a:	eb 45                	jmp    801059b1 <sys_pipe+0xb1>
8010596c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105970:	8d 70 08             	lea    0x8(%eax),%esi
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105973:	8b 7d e4             	mov    -0x1c(%ebp),%edi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105976:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105978:	89 5c b1 08          	mov    %ebx,0x8(%ecx,%esi,4)
8010597c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105980:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
80105985:	74 19                	je     801059a0 <sys_pipe+0xa0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105987:	83 c2 01             	add    $0x1,%edx
8010598a:	83 fa 10             	cmp    $0x10,%edx
8010598d:	75 f1                	jne    80105980 <sys_pipe+0x80>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
8010598f:	c7 44 b1 08 00 00 00 	movl   $0x0,0x8(%ecx,%esi,4)
80105996:	00 
80105997:	eb b7                	jmp    80105950 <sys_pipe+0x50>
80105999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801059a0:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801059a4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801059a7:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
801059a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801059ac:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801059af:	31 c0                	xor    %eax,%eax
}
801059b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059b4:	5b                   	pop    %ebx
801059b5:	5e                   	pop    %esi
801059b6:	5f                   	pop    %edi
801059b7:	5d                   	pop    %ebp
801059b8:	c3                   	ret    
801059b9:	66 90                	xchg   %ax,%ax
801059bb:	66 90                	xchg   %ax,%ax
801059bd:	66 90                	xchg   %ax,%ax
801059bf:	90                   	nop

801059c0 <sys_fork>:
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int sys_fork(void)
{
801059c0:	55                   	push   %ebp
801059c1:	89 e5                	mov    %esp,%ebp
  return fork();
}
801059c3:	5d                   	pop    %ebp
#include "mmu.h"
#include "proc.h"

int sys_fork(void)
{
  return fork();
801059c4:	e9 97 df ff ff       	jmp    80103960 <fork>
801059c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801059d0 <sys_exit>:
}

int sys_exit(void)
{
801059d0:	55                   	push   %ebp
801059d1:	89 e5                	mov    %esp,%ebp
801059d3:	83 ec 08             	sub    $0x8,%esp
  exit();
801059d6:	e8 e5 e2 ff ff       	call   80103cc0 <exit>
  return 0; // not reached
}
801059db:	31 c0                	xor    %eax,%eax
801059dd:	c9                   	leave  
801059de:	c3                   	ret    
801059df:	90                   	nop

801059e0 <sys_wait>:

int sys_wait(void)
{
801059e0:	55                   	push   %ebp
801059e1:	89 e5                	mov    %esp,%ebp
  return wait();
}
801059e3:	5d                   	pop    %ebp
  return 0; // not reached
}

int sys_wait(void)
{
  return wait();
801059e4:	e9 27 e5 ff ff       	jmp    80103f10 <wait>
801059e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801059f0 <sys_kill>:
}

int sys_kill(void)
{
801059f0:	55                   	push   %ebp
801059f1:	89 e5                	mov    %esp,%ebp
801059f3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if (argint(0, &pid) < 0)
801059f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801059f9:	50                   	push   %eax
801059fa:	6a 00                	push   $0x0
801059fc:	e8 5f f2 ff ff       	call   80104c60 <argint>
80105a01:	83 c4 10             	add    $0x10,%esp
80105a04:	85 c0                	test   %eax,%eax
80105a06:	78 18                	js     80105a20 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105a08:	83 ec 0c             	sub    $0xc,%esp
80105a0b:	ff 75 f4             	pushl  -0xc(%ebp)
80105a0e:	e8 4d e6 ff ff       	call   80104060 <kill>
80105a13:	83 c4 10             	add    $0x10,%esp
}
80105a16:	c9                   	leave  
80105a17:	c3                   	ret    
80105a18:	90                   	nop
80105a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int sys_kill(void)
{
  int pid;

  if (argint(0, &pid) < 0)
    return -1;
80105a20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105a25:	c9                   	leave  
80105a26:	c3                   	ret    
80105a27:	89 f6                	mov    %esi,%esi
80105a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a30 <sys_getpid>:

int sys_getpid(void)
{
  return proc->pid;
80105a30:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    return -1;
  return kill(pid);
}

int sys_getpid(void)
{
80105a36:	55                   	push   %ebp
80105a37:	89 e5                	mov    %esp,%ebp
  return proc->pid;
80105a39:	8b 40 10             	mov    0x10(%eax),%eax
}
80105a3c:	5d                   	pop    %ebp
80105a3d:	c3                   	ret    
80105a3e:	66 90                	xchg   %ax,%ax

80105a40 <sys_sbrk>:

int sys_sbrk(void)
{
80105a40:	55                   	push   %ebp
80105a41:	89 e5                	mov    %esp,%ebp
80105a43:	53                   	push   %ebx
  int addr;
  int n;

  if (argint(0, &n) < 0)
80105a44:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
  return proc->pid;
}

int sys_sbrk(void)
{
80105a47:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if (argint(0, &n) < 0)
80105a4a:	50                   	push   %eax
80105a4b:	6a 00                	push   $0x0
80105a4d:	e8 0e f2 ff ff       	call   80104c60 <argint>
80105a52:	83 c4 10             	add    $0x10,%esp
80105a55:	85 c0                	test   %eax,%eax
80105a57:	78 27                	js     80105a80 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
80105a59:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if (growproc(n) < 0)
80105a5f:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if (argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
80105a62:	8b 18                	mov    (%eax),%ebx
  if (growproc(n) < 0)
80105a64:	ff 75 f4             	pushl  -0xc(%ebp)
80105a67:	e8 74 de ff ff       	call   801038e0 <growproc>
80105a6c:	83 c4 10             	add    $0x10,%esp
80105a6f:	85 c0                	test   %eax,%eax
80105a71:	78 0d                	js     80105a80 <sys_sbrk+0x40>
    return -1;
  return addr;
80105a73:	89 d8                	mov    %ebx,%eax
}
80105a75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a78:	c9                   	leave  
80105a79:	c3                   	ret    
80105a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if (argint(0, &n) < 0)
    return -1;
80105a80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a85:	eb ee                	jmp    80105a75 <sys_sbrk+0x35>
80105a87:	89 f6                	mov    %esi,%esi
80105a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a90 <sys_sleep>:
    return -1;
  return addr;
}

int sys_sleep(void)
{
80105a90:	55                   	push   %ebp
80105a91:	89 e5                	mov    %esp,%ebp
80105a93:	53                   	push   %ebx
  int n;
  uint ticks0;

  if (argint(0, &n) < 0)
80105a94:	8d 45 f4             	lea    -0xc(%ebp),%eax
    return -1;
  return addr;
}

int sys_sleep(void)
{
80105a97:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if (argint(0, &n) < 0)
80105a9a:	50                   	push   %eax
80105a9b:	6a 00                	push   $0x0
80105a9d:	e8 be f1 ff ff       	call   80104c60 <argint>
80105aa2:	83 c4 10             	add    $0x10,%esp
80105aa5:	85 c0                	test   %eax,%eax
80105aa7:	0f 88 8a 00 00 00    	js     80105b37 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
80105aad:	83 ec 0c             	sub    $0xc,%esp
80105ab0:	68 00 61 11 80       	push   $0x80116100
80105ab5:	e8 36 ed ff ff       	call   801047f0 <acquire>
  ticks0 = ticks;
  while (ticks - ticks0 < n)
80105aba:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105abd:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if (argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105ac0:	8b 1d 40 69 11 80    	mov    0x80116940,%ebx
  while (ticks - ticks0 < n)
80105ac6:	85 d2                	test   %edx,%edx
80105ac8:	75 27                	jne    80105af1 <sys_sleep+0x61>
80105aca:	eb 54                	jmp    80105b20 <sys_sleep+0x90>
80105acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (proc->killed)
    {
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105ad0:	83 ec 08             	sub    $0x8,%esp
80105ad3:	68 00 61 11 80       	push   $0x80116100
80105ad8:	68 40 69 11 80       	push   $0x80116940
80105add:	e8 6e e3 ff ff       	call   80103e50 <sleep>

  if (argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while (ticks - ticks0 < n)
80105ae2:	a1 40 69 11 80       	mov    0x80116940,%eax
80105ae7:	83 c4 10             	add    $0x10,%esp
80105aea:	29 d8                	sub    %ebx,%eax
80105aec:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105aef:	73 2f                	jae    80105b20 <sys_sleep+0x90>
  {
    if (proc->killed)
80105af1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105af7:	8b 40 24             	mov    0x24(%eax),%eax
80105afa:	85 c0                	test   %eax,%eax
80105afc:	74 d2                	je     80105ad0 <sys_sleep+0x40>
    {
      release(&tickslock);
80105afe:	83 ec 0c             	sub    $0xc,%esp
80105b01:	68 00 61 11 80       	push   $0x80116100
80105b06:	e8 15 ee ff ff       	call   80104920 <release>
      return -1;
80105b0b:	83 c4 10             	add    $0x10,%esp
80105b0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105b13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105b16:	c9                   	leave  
80105b17:	c3                   	ret    
80105b18:	90                   	nop
80105b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105b20:	83 ec 0c             	sub    $0xc,%esp
80105b23:	68 00 61 11 80       	push   $0x80116100
80105b28:	e8 f3 ed ff ff       	call   80104920 <release>
  return 0;
80105b2d:	83 c4 10             	add    $0x10,%esp
80105b30:	31 c0                	xor    %eax,%eax
}
80105b32:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105b35:	c9                   	leave  
80105b36:	c3                   	ret    
{
  int n;
  uint ticks0;

  if (argint(0, &n) < 0)
    return -1;
80105b37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b3c:	eb d5                	jmp    80105b13 <sys_sleep+0x83>
80105b3e:	66 90                	xchg   %ax,%ax

80105b40 <sys_uptime>:
}

// return how many clock tick interrupts have occurred
// since start.
int sys_uptime(void)
{
80105b40:	55                   	push   %ebp
80105b41:	89 e5                	mov    %esp,%ebp
80105b43:	53                   	push   %ebx
80105b44:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105b47:	68 00 61 11 80       	push   $0x80116100
80105b4c:	e8 9f ec ff ff       	call   801047f0 <acquire>
  xticks = ticks;
80105b51:	8b 1d 40 69 11 80    	mov    0x80116940,%ebx
  release(&tickslock);
80105b57:	c7 04 24 00 61 11 80 	movl   $0x80116100,(%esp)
80105b5e:	e8 bd ed ff ff       	call   80104920 <release>
  return xticks;
}
80105b63:	89 d8                	mov    %ebx,%eax
80105b65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105b68:	c9                   	leave  
80105b69:	c3                   	ret    
80105b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105b70 <sys_set_priority>:
// the actual implementation
// (defintions are provided in defs.h and user.h,
// to provide an interface for the user)
int sys_set_priority(void)
{
80105b70:	55                   	push   %ebp
80105b71:	89 e5                	mov    %esp,%ebp
80105b73:	83 ec 20             	sub    $0x20,%esp
  int pid;
  int priority;
  if (argint(0, &pid) < 0)
80105b76:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105b79:	50                   	push   %eax
80105b7a:	6a 00                	push   $0x0
80105b7c:	e8 df f0 ff ff       	call   80104c60 <argint>
80105b81:	83 c4 10             	add    $0x10,%esp
80105b84:	85 c0                	test   %eax,%eax
80105b86:	78 28                	js     80105bb0 <sys_set_priority+0x40>
  {
    // sys call fails if args are not passed
    return -1;
  }
  if (argint(1, &priority) < 0)
80105b88:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b8b:	83 ec 08             	sub    $0x8,%esp
80105b8e:	50                   	push   %eax
80105b8f:	6a 01                	push   $0x1
80105b91:	e8 ca f0 ff ff       	call   80104c60 <argint>
80105b96:	83 c4 10             	add    $0x10,%esp
80105b99:	85 c0                	test   %eax,%eax
80105b9b:	78 13                	js     80105bb0 <sys_set_priority+0x40>
  {
    // sys call fails also if second arg not passed
    return -1;
  }
  // preform syscall routine with args
  return set_priority(pid, priority);
80105b9d:	83 ec 08             	sub    $0x8,%esp
80105ba0:	ff 75 f4             	pushl  -0xc(%ebp)
80105ba3:	ff 75 f0             	pushl  -0x10(%ebp)
80105ba6:	e8 15 e6 ff ff       	call   801041c0 <set_priority>
80105bab:	83 c4 10             	add    $0x10,%esp
}
80105bae:	c9                   	leave  
80105baf:	c3                   	ret    
  int pid;
  int priority;
  if (argint(0, &pid) < 0)
  {
    // sys call fails if args are not passed
    return -1;
80105bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    // sys call fails also if second arg not passed
    return -1;
  }
  // preform syscall routine with args
  return set_priority(pid, priority);
}
80105bb5:	c9                   	leave  
80105bb6:	c3                   	ret    
80105bb7:	89 f6                	mov    %esi,%esi
80105bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105bc0 <sys_get_priority>:

int sys_get_priority(void)
{
80105bc0:	55                   	push   %ebp
80105bc1:	89 e5                	mov    %esp,%ebp
80105bc3:	83 ec 20             	sub    $0x20,%esp
  int pid;
  if (argint(0, &pid) < 0)
80105bc6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105bc9:	50                   	push   %eax
80105bca:	6a 00                	push   $0x0
80105bcc:	e8 8f f0 ff ff       	call   80104c60 <argint>
80105bd1:	83 c4 10             	add    $0x10,%esp
80105bd4:	85 c0                	test   %eax,%eax
80105bd6:	78 18                	js     80105bf0 <sys_get_priority+0x30>
  {
    // sys call will fail if args aren't passed or can't be retrieved
    return -1;
  }
  return get_priority(pid);
80105bd8:	83 ec 0c             	sub    $0xc,%esp
80105bdb:	ff 75 f4             	pushl  -0xc(%ebp)
80105bde:	e8 8d e6 ff ff       	call   80104270 <get_priority>
80105be3:	83 c4 10             	add    $0x10,%esp
}
80105be6:	c9                   	leave  
80105be7:	c3                   	ret    
80105be8:	90                   	nop
80105be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int pid;
  if (argint(0, &pid) < 0)
  {
    // sys call will fail if args aren't passed or can't be retrieved
    return -1;
80105bf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return get_priority(pid);
}
80105bf5:	c9                   	leave  
80105bf6:	c3                   	ret    
80105bf7:	89 f6                	mov    %esi,%esi
80105bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c00 <sys_cps>:

int sys_cps(void)
{
80105c00:	55                   	push   %ebp
80105c01:	89 e5                	mov    %esp,%ebp
  return cps();
}
80105c03:	5d                   	pop    %ebp
  return get_priority(pid);
}

int sys_cps(void)
{
  return cps();
80105c04:	e9 d7 e6 ff ff       	jmp    801042e0 <cps>
80105c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105c10 <sys_thread_create>:
}

int sys_thread_create(void)
{
80105c10:	55                   	push   %ebp
80105c11:	89 e5                	mov    %esp,%ebp
80105c13:	83 ec 20             	sub    $0x20,%esp
  void (*fn)(void *);
  void *stack;
  void *arg;

  // fetch arguments from user space
  if (argint(0, (int *)&fn) < 0 || argint(1, (int *)&stack) < 0 || argint(2, (int *)&arg) < 0)
80105c16:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105c19:	50                   	push   %eax
80105c1a:	6a 00                	push   $0x0
80105c1c:	e8 3f f0 ff ff       	call   80104c60 <argint>
80105c21:	83 c4 10             	add    $0x10,%esp
80105c24:	85 c0                	test   %eax,%eax
80105c26:	78 48                	js     80105c70 <sys_thread_create+0x60>
80105c28:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105c2b:	83 ec 08             	sub    $0x8,%esp
80105c2e:	50                   	push   %eax
80105c2f:	6a 01                	push   $0x1
80105c31:	e8 2a f0 ff ff       	call   80104c60 <argint>
80105c36:	83 c4 10             	add    $0x10,%esp
80105c39:	85 c0                	test   %eax,%eax
80105c3b:	78 33                	js     80105c70 <sys_thread_create+0x60>
80105c3d:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105c40:	83 ec 08             	sub    $0x8,%esp
80105c43:	50                   	push   %eax
80105c44:	6a 02                	push   $0x2
80105c46:	e8 15 f0 ff ff       	call   80104c60 <argint>
80105c4b:	83 c4 10             	add    $0x10,%esp
80105c4e:	85 c0                	test   %eax,%eax
80105c50:	78 1e                	js     80105c70 <sys_thread_create+0x60>
    // fetch failure
    return -1;
  }

  // create the thread
  return thread_create(fn, stack, arg);
80105c52:	83 ec 04             	sub    $0x4,%esp
80105c55:	ff 75 f4             	pushl  -0xc(%ebp)
80105c58:	ff 75 f0             	pushl  -0x10(%ebp)
80105c5b:	ff 75 ec             	pushl  -0x14(%ebp)
80105c5e:	e8 3d e7 ff ff       	call   801043a0 <thread_create>
80105c63:	83 c4 10             	add    $0x10,%esp
}
80105c66:	c9                   	leave  
80105c67:	c3                   	ret    
80105c68:	90                   	nop
80105c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  // fetch arguments from user space
  if (argint(0, (int *)&fn) < 0 || argint(1, (int *)&stack) < 0 || argint(2, (int *)&arg) < 0)
  {
    // fetch failure
    return -1;
80105c70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }

  // create the thread
  return thread_create(fn, stack, arg);
}
80105c75:	c9                   	leave  
80105c76:	c3                   	ret    
80105c77:	89 f6                	mov    %esi,%esi
80105c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c80 <sys_thread_exit>:

int sys_thread_exit(void)
{
80105c80:	55                   	push   %ebp
80105c81:	89 e5                	mov    %esp,%ebp
80105c83:	83 ec 08             	sub    $0x8,%esp
  // call the kernel function to exit the thread
  thread_exit();
80105c86:	e8 25 e8 ff ff       	call   801044b0 <thread_exit>
  return 0;
}
80105c8b:	31 c0                	xor    %eax,%eax
80105c8d:	c9                   	leave  
80105c8e:	c3                   	ret    
80105c8f:	90                   	nop

80105c90 <sys_thread_join>:

int sys_thread_join(void)
{
80105c90:	55                   	push   %ebp
80105c91:	89 e5                	mov    %esp,%ebp
80105c93:	83 ec 20             	sub    $0x20,%esp
  int thread_id;

  // fetch the thread ID argument from user space
  if (argint(0, &thread_id) < 0)
80105c96:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105c99:	50                   	push   %eax
80105c9a:	6a 00                	push   $0x0
80105c9c:	e8 bf ef ff ff       	call   80104c60 <argint>
80105ca1:	83 c4 10             	add    $0x10,%esp
80105ca4:	85 c0                	test   %eax,%eax
80105ca6:	78 08                	js     80105cb0 <sys_thread_join+0x20>
  {
    return -1;
  }

  // join the specified thread
  return thread_join();
80105ca8:	e8 e3 e8 ff ff       	call   80104590 <thread_join>
}
80105cad:	c9                   	leave  
80105cae:	c3                   	ret    
80105caf:	90                   	nop
  int thread_id;

  // fetch the thread ID argument from user space
  if (argint(0, &thread_id) < 0)
  {
    return -1;
80105cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }

  // join the specified thread
  return thread_join();
}
80105cb5:	c9                   	leave  
80105cb6:	c3                   	ret    
80105cb7:	89 f6                	mov    %esi,%esi
80105cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105cc0 <sys_getNumFreePages>:

int
sys_getNumFreePages(void)
{
80105cc0:	55                   	push   %ebp
return numFreePages;
}
80105cc1:	a1 5c 37 11 80       	mov    0x8011375c,%eax
  return thread_join();
}

int
sys_getNumFreePages(void)
{
80105cc6:	89 e5                	mov    %esp,%ebp
return numFreePages;
}
80105cc8:	5d                   	pop    %ebp
80105cc9:	c3                   	ret    
80105cca:	66 90                	xchg   %ax,%ax
80105ccc:	66 90                	xchg   %ax,%ax
80105cce:	66 90                	xchg   %ax,%ax

80105cd0 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
80105cd0:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105cd1:	ba 43 00 00 00       	mov    $0x43,%edx
80105cd6:	b8 34 00 00 00       	mov    $0x34,%eax
80105cdb:	89 e5                	mov    %esp,%ebp
80105cdd:	83 ec 14             	sub    $0x14,%esp
80105ce0:	ee                   	out    %al,(%dx)
80105ce1:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
80105ce6:	b2 40                	mov    $0x40,%dl
80105ce8:	ee                   	out    %al,(%dx)
80105ce9:	b8 2e 00 00 00       	mov    $0x2e,%eax
80105cee:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
80105cef:	6a 00                	push   $0x0
80105cf1:	e8 ea d4 ff ff       	call   801031e0 <picenable>
80105cf6:	83 c4 10             	add    $0x10,%esp
}
80105cf9:	c9                   	leave  
80105cfa:	c3                   	ret    

80105cfb <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105cfb:	1e                   	push   %ds
  pushl %es
80105cfc:	06                   	push   %es
  pushl %fs
80105cfd:	0f a0                	push   %fs
  pushl %gs
80105cff:	0f a8                	push   %gs
  pushal
80105d01:	60                   	pusha  
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
80105d02:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105d06:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105d08:	8e c0                	mov    %eax,%es
  movw $(SEG_KCPU<<3), %ax
80105d0a:	66 b8 18 00          	mov    $0x18,%ax
  movw %ax, %fs
80105d0e:	8e e0                	mov    %eax,%fs
  movw %ax, %gs
80105d10:	8e e8                	mov    %eax,%gs

  # Call trap(tf), where tf=%esp
  pushl %esp
80105d12:	54                   	push   %esp
  call trap
80105d13:	e8 e8 00 00 00       	call   80105e00 <trap>
  addl $4, %esp
80105d18:	83 c4 04             	add    $0x4,%esp

80105d1b <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105d1b:	61                   	popa   
  popl %gs
80105d1c:	0f a9                	pop    %gs
  popl %fs
80105d1e:	0f a1                	pop    %fs
  popl %es
80105d20:	07                   	pop    %es
  popl %ds
80105d21:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105d22:	83 c4 08             	add    $0x8,%esp
  iret
80105d25:	cf                   	iret   
80105d26:	66 90                	xchg   %ax,%ax
80105d28:	66 90                	xchg   %ax,%ax
80105d2a:	66 90                	xchg   %ax,%ax
80105d2c:	66 90                	xchg   %ax,%ax
80105d2e:	66 90                	xchg   %ax,%ax

80105d30 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105d30:	31 c0                	xor    %eax,%eax
80105d32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105d38:	8b 14 85 0c b0 10 80 	mov    -0x7fef4ff4(,%eax,4),%edx
80105d3f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105d44:	c6 04 c5 44 61 11 80 	movb   $0x0,-0x7fee9ebc(,%eax,8)
80105d4b:	00 
80105d4c:	66 89 0c c5 42 61 11 	mov    %cx,-0x7fee9ebe(,%eax,8)
80105d53:	80 
80105d54:	c6 04 c5 45 61 11 80 	movb   $0x8e,-0x7fee9ebb(,%eax,8)
80105d5b:	8e 
80105d5c:	66 89 14 c5 40 61 11 	mov    %dx,-0x7fee9ec0(,%eax,8)
80105d63:	80 
80105d64:	c1 ea 10             	shr    $0x10,%edx
80105d67:	66 89 14 c5 46 61 11 	mov    %dx,-0x7fee9eba(,%eax,8)
80105d6e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105d6f:	83 c0 01             	add    $0x1,%eax
80105d72:	3d 00 01 00 00       	cmp    $0x100,%eax
80105d77:	75 bf                	jne    80105d38 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105d79:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105d7a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105d7f:	89 e5                	mov    %esp,%ebp
80105d81:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105d84:	a1 0c b1 10 80       	mov    0x8010b10c,%eax

  initlock(&tickslock, "time");
80105d89:	68 55 7e 10 80       	push   $0x80107e55
80105d8e:	68 00 61 11 80       	push   $0x80116100
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105d93:	66 89 15 42 63 11 80 	mov    %dx,0x80116342
80105d9a:	c6 05 44 63 11 80 00 	movb   $0x0,0x80116344
80105da1:	66 a3 40 63 11 80    	mov    %ax,0x80116340
80105da7:	c1 e8 10             	shr    $0x10,%eax
80105daa:	c6 05 45 63 11 80 ef 	movb   $0xef,0x80116345
80105db1:	66 a3 46 63 11 80    	mov    %ax,0x80116346

  initlock(&tickslock, "time");
80105db7:	e8 b4 e9 ff ff       	call   80104770 <initlock>
80105dbc:	83 c4 10             	add    $0x10,%esp
}
80105dbf:	c9                   	leave  
80105dc0:	c3                   	ret    
80105dc1:	eb 0d                	jmp    80105dd0 <idtinit>
80105dc3:	90                   	nop
80105dc4:	90                   	nop
80105dc5:	90                   	nop
80105dc6:	90                   	nop
80105dc7:	90                   	nop
80105dc8:	90                   	nop
80105dc9:	90                   	nop
80105dca:	90                   	nop
80105dcb:	90                   	nop
80105dcc:	90                   	nop
80105dcd:	90                   	nop
80105dce:	90                   	nop
80105dcf:	90                   	nop

80105dd0 <idtinit>:

void
idtinit(void)
{
80105dd0:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105dd1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105dd6:	89 e5                	mov    %esp,%ebp
80105dd8:	83 ec 10             	sub    $0x10,%esp
80105ddb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105ddf:	b8 40 61 11 80       	mov    $0x80116140,%eax
80105de4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105de8:	c1 e8 10             	shr    $0x10,%eax
80105deb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80105def:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105df2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105df5:	c9                   	leave  
80105df6:	c3                   	ret    
80105df7:	89 f6                	mov    %esi,%esi
80105df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e00 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105e00:	55                   	push   %ebp
80105e01:	89 e5                	mov    %esp,%ebp
80105e03:	57                   	push   %edi
80105e04:	56                   	push   %esi
80105e05:	53                   	push   %ebx
80105e06:	83 ec 0c             	sub    $0xc,%esp
80105e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105e0c:	8b 43 30             	mov    0x30(%ebx),%eax
80105e0f:	83 f8 40             	cmp    $0x40,%eax
80105e12:	74 7c                	je     80105e90 <trap+0x90>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105e14:	83 e8 20             	sub    $0x20,%eax
80105e17:	83 f8 1f             	cmp    $0x1f,%eax
80105e1a:	0f 87 30 01 00 00    	ja     80105f50 <trap+0x150>
80105e20:	ff 24 85 fc 7e 10 80 	jmp    *-0x7fef8104(,%eax,4)
80105e27:	89 f6                	mov    %esi,%esi
80105e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105e30:	e8 db c8 ff ff       	call   80102710 <cpunum>
80105e35:	85 c0                	test   %eax,%eax
80105e37:	0f 84 b3 01 00 00    	je     80105ff0 <trap+0x1f0>
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
80105e3d:	e8 6e c9 ff ff       	call   801027b0 <lapiceoi>
80105e42:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105e48:	85 c0                	test   %eax,%eax
80105e4a:	74 36                	je     80105e82 <trap+0x82>
80105e4c:	8b 50 24             	mov    0x24(%eax),%edx
80105e4f:	85 d2                	test   %edx,%edx
80105e51:	74 11                	je     80105e64 <trap+0x64>
80105e53:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105e57:	83 e2 03             	and    $0x3,%edx
80105e5a:	66 83 fa 03          	cmp    $0x3,%dx
80105e5e:	0f 84 74 01 00 00    	je     80105fd8 <trap+0x1d8>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105e64:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105e68:	0f 84 42 01 00 00    	je     80105fb0 <trap+0x1b0>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105e6e:	8b 40 24             	mov    0x24(%eax),%eax
80105e71:	85 c0                	test   %eax,%eax
80105e73:	74 0d                	je     80105e82 <trap+0x82>
80105e75:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105e79:	83 e0 03             	and    $0x3,%eax
80105e7c:	66 83 f8 03          	cmp    $0x3,%ax
80105e80:	74 34                	je     80105eb6 <trap+0xb6>
    exit();
}
80105e82:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e85:	5b                   	pop    %ebx
80105e86:	5e                   	pop    %esi
80105e87:	5f                   	pop    %edi
80105e88:	5d                   	pop    %ebp
80105e89:	c3                   	ret    
80105e8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105e90:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105e96:	8b 70 24             	mov    0x24(%eax),%esi
80105e99:	85 f6                	test   %esi,%esi
80105e9b:	0f 85 9f 00 00 00    	jne    80105f40 <trap+0x140>
      exit();
    proc->tf = tf;
80105ea1:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105ea4:	e8 c7 ee ff ff       	call   80104d70 <syscall>
    if(proc->killed)
80105ea9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105eaf:	8b 58 24             	mov    0x24(%eax),%ebx
80105eb2:	85 db                	test   %ebx,%ebx
80105eb4:	74 cc                	je     80105e82 <trap+0x82>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105eb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105eb9:	5b                   	pop    %ebx
80105eba:	5e                   	pop    %esi
80105ebb:	5f                   	pop    %edi
80105ebc:	5d                   	pop    %ebp
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
80105ebd:	e9 fe dd ff ff       	jmp    80103cc0 <exit>
80105ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105ec8:	e8 53 c1 ff ff       	call   80102020 <ideintr>
    lapiceoi();
80105ecd:	e8 de c8 ff ff       	call   801027b0 <lapiceoi>
80105ed2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105ed8:	e9 6b ff ff ff       	jmp    80105e48 <trap+0x48>
80105edd:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105ee0:	e8 8b c6 ff ff       	call   80102570 <kbdintr>
    lapiceoi();
80105ee5:	e8 c6 c8 ff ff       	call   801027b0 <lapiceoi>
80105eea:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105ef0:	e9 53 ff ff ff       	jmp    80105e48 <trap+0x48>
80105ef5:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105ef8:	e8 c3 02 00 00       	call   801061c0 <uartintr>
    lapiceoi();
80105efd:	e8 ae c8 ff ff       	call   801027b0 <lapiceoi>
80105f02:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105f08:	e9 3b ff ff ff       	jmp    80105e48 <trap+0x48>
80105f0d:	8d 76 00             	lea    0x0(%esi),%esi
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105f10:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105f14:	8b 7b 38             	mov    0x38(%ebx),%edi
80105f17:	e8 f4 c7 ff ff       	call   80102710 <cpunum>
80105f1c:	57                   	push   %edi
80105f1d:	56                   	push   %esi
80105f1e:	50                   	push   %eax
80105f1f:	68 60 7e 10 80       	push   $0x80107e60
80105f24:	e8 37 a7 ff ff       	call   80100660 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
80105f29:	e8 82 c8 ff ff       	call   801027b0 <lapiceoi>
80105f2e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    break;
80105f34:	83 c4 10             	add    $0x10,%esp
80105f37:	e9 0c ff ff ff       	jmp    80105e48 <trap+0x48>
80105f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
80105f40:	e8 7b dd ff ff       	call   80103cc0 <exit>
80105f45:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105f4b:	e9 51 ff ff ff       	jmp    80105ea1 <trap+0xa1>
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80105f50:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105f57:	85 c9                	test   %ecx,%ecx
80105f59:	0f 84 c5 00 00 00    	je     80106024 <trap+0x224>
80105f5f:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105f63:	0f 84 bb 00 00 00    	je     80106024 <trap+0x224>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105f69:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105f6c:	8b 73 38             	mov    0x38(%ebx),%esi
80105f6f:	e8 9c c7 ff ff       	call   80102710 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105f74:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105f7b:	57                   	push   %edi
80105f7c:	56                   	push   %esi
80105f7d:	50                   	push   %eax
80105f7e:	ff 73 34             	pushl  0x34(%ebx)
80105f81:	ff 73 30             	pushl  0x30(%ebx)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105f84:	8d 42 6c             	lea    0x6c(%edx),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105f87:	50                   	push   %eax
80105f88:	ff 72 10             	pushl  0x10(%edx)
80105f8b:	68 b8 7e 10 80       	push   $0x80107eb8
80105f90:	e8 cb a6 ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
80105f95:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105f9b:	83 c4 20             	add    $0x20,%esp
80105f9e:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105fa5:	e9 a9 fe ff ff       	jmp    80105e53 <trap+0x53>
80105faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105fb0:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105fb4:	0f 85 b4 fe ff ff    	jne    80105e6e <trap+0x6e>
    yield();
80105fba:	e8 51 de ff ff       	call   80103e10 <yield>
80105fbf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105fc5:	85 c0                	test   %eax,%eax
80105fc7:	0f 85 a1 fe ff ff    	jne    80105e6e <trap+0x6e>
80105fcd:	e9 b0 fe ff ff       	jmp    80105e82 <trap+0x82>
80105fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
80105fd8:	e8 e3 dc ff ff       	call   80103cc0 <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105fdd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105fe3:	85 c0                	test   %eax,%eax
80105fe5:	0f 85 79 fe ff ff    	jne    80105e64 <trap+0x64>
80105feb:	e9 92 fe ff ff       	jmp    80105e82 <trap+0x82>
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105ff0:	83 ec 0c             	sub    $0xc,%esp
80105ff3:	68 00 61 11 80       	push   $0x80116100
80105ff8:	e8 f3 e7 ff ff       	call   801047f0 <acquire>
      ticks++;
      wakeup(&ticks);
80105ffd:	c7 04 24 40 69 11 80 	movl   $0x80116940,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80106004:	83 05 40 69 11 80 01 	addl   $0x1,0x80116940
      wakeup(&ticks);
8010600b:	e8 f0 df ff ff       	call   80104000 <wakeup>
      release(&tickslock);
80106010:	c7 04 24 00 61 11 80 	movl   $0x80116100,(%esp)
80106017:	e8 04 e9 ff ff       	call   80104920 <release>
8010601c:	83 c4 10             	add    $0x10,%esp
8010601f:	e9 19 fe ff ff       	jmp    80105e3d <trap+0x3d>
80106024:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106027:	8b 73 38             	mov    0x38(%ebx),%esi
8010602a:	e8 e1 c6 ff ff       	call   80102710 <cpunum>
8010602f:	83 ec 0c             	sub    $0xc,%esp
80106032:	57                   	push   %edi
80106033:	56                   	push   %esi
80106034:	50                   	push   %eax
80106035:	ff 73 30             	pushl  0x30(%ebx)
80106038:	68 84 7e 10 80       	push   $0x80107e84
8010603d:	e8 1e a6 ff ff       	call   80100660 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
80106042:	83 c4 14             	add    $0x14,%esp
80106045:	68 5a 7e 10 80       	push   $0x80107e5a
8010604a:	e8 21 a3 ff ff       	call   80100370 <panic>
8010604f:	90                   	nop

80106050 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80106050:	a1 e0 b5 10 80       	mov    0x8010b5e0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80106055:	55                   	push   %ebp
80106056:	89 e5                	mov    %esp,%ebp
  if(!uart)
80106058:	85 c0                	test   %eax,%eax
8010605a:	74 14                	je     80106070 <uartgetc+0x20>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010605c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106061:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80106062:	a8 01                	test   $0x1,%al
80106064:	74 0a                	je     80106070 <uartgetc+0x20>
80106066:	b2 f8                	mov    $0xf8,%dl
80106068:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80106069:	0f b6 c0             	movzbl %al,%eax
}
8010606c:	5d                   	pop    %ebp
8010606d:	c3                   	ret    
8010606e:	66 90                	xchg   %ax,%ax

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80106070:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80106075:	5d                   	pop    %ebp
80106076:	c3                   	ret    
80106077:	89 f6                	mov    %esi,%esi
80106079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106080 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80106080:	55                   	push   %ebp
80106081:	89 e5                	mov    %esp,%ebp
80106083:	57                   	push   %edi
80106084:	56                   	push   %esi
80106085:	53                   	push   %ebx
80106086:	89 c7                	mov    %eax,%edi
80106088:	bb 80 00 00 00       	mov    $0x80,%ebx
8010608d:	be fd 03 00 00       	mov    $0x3fd,%esi
80106092:	83 ec 0c             	sub    $0xc,%esp
80106095:	eb 1b                	jmp    801060b2 <uartputc.part.0+0x32>
80106097:	89 f6                	mov    %esi,%esi
80106099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
801060a0:	83 ec 0c             	sub    $0xc,%esp
801060a3:	6a 0a                	push   $0xa
801060a5:	e8 26 c7 ff ff       	call   801027d0 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801060aa:	83 c4 10             	add    $0x10,%esp
801060ad:	83 eb 01             	sub    $0x1,%ebx
801060b0:	74 07                	je     801060b9 <uartputc.part.0+0x39>
801060b2:	89 f2                	mov    %esi,%edx
801060b4:	ec                   	in     (%dx),%al
801060b5:	a8 20                	test   $0x20,%al
801060b7:	74 e7                	je     801060a0 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801060b9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801060be:	89 f8                	mov    %edi,%eax
801060c0:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
801060c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801060c4:	5b                   	pop    %ebx
801060c5:	5e                   	pop    %esi
801060c6:	5f                   	pop    %edi
801060c7:	5d                   	pop    %ebp
801060c8:	c3                   	ret    
801060c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801060d0 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
801060d0:	55                   	push   %ebp
801060d1:	31 c9                	xor    %ecx,%ecx
801060d3:	89 c8                	mov    %ecx,%eax
801060d5:	89 e5                	mov    %esp,%ebp
801060d7:	57                   	push   %edi
801060d8:	56                   	push   %esi
801060d9:	53                   	push   %ebx
801060da:	bb fa 03 00 00       	mov    $0x3fa,%ebx
801060df:	89 da                	mov    %ebx,%edx
801060e1:	83 ec 0c             	sub    $0xc,%esp
801060e4:	ee                   	out    %al,(%dx)
801060e5:	bf fb 03 00 00       	mov    $0x3fb,%edi
801060ea:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801060ef:	89 fa                	mov    %edi,%edx
801060f1:	ee                   	out    %al,(%dx)
801060f2:	b8 0c 00 00 00       	mov    $0xc,%eax
801060f7:	b2 f8                	mov    $0xf8,%dl
801060f9:	ee                   	out    %al,(%dx)
801060fa:	be f9 03 00 00       	mov    $0x3f9,%esi
801060ff:	89 c8                	mov    %ecx,%eax
80106101:	89 f2                	mov    %esi,%edx
80106103:	ee                   	out    %al,(%dx)
80106104:	b8 03 00 00 00       	mov    $0x3,%eax
80106109:	89 fa                	mov    %edi,%edx
8010610b:	ee                   	out    %al,(%dx)
8010610c:	b2 fc                	mov    $0xfc,%dl
8010610e:	89 c8                	mov    %ecx,%eax
80106110:	ee                   	out    %al,(%dx)
80106111:	b8 01 00 00 00       	mov    $0x1,%eax
80106116:	89 f2                	mov    %esi,%edx
80106118:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80106119:	b2 fd                	mov    $0xfd,%dl
8010611b:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
8010611c:	3c ff                	cmp    $0xff,%al
8010611e:	74 60                	je     80106180 <uartinit+0xb0>
    return;
  uart = 1;
80106120:	c7 05 e0 b5 10 80 01 	movl   $0x1,0x8010b5e0
80106127:	00 00 00 
8010612a:	89 da                	mov    %ebx,%edx
8010612c:	ec                   	in     (%dx),%al
8010612d:	b2 f8                	mov    $0xf8,%dl
8010612f:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80106130:	83 ec 0c             	sub    $0xc,%esp
80106133:	6a 04                	push   $0x4
80106135:	e8 a6 d0 ff ff       	call   801031e0 <picenable>
  ioapicenable(IRQ_COM1, 0);
8010613a:	59                   	pop    %ecx
8010613b:	5b                   	pop    %ebx
8010613c:	6a 00                	push   $0x0
8010613e:	6a 04                	push   $0x4
80106140:	bb 7c 7f 10 80       	mov    $0x80107f7c,%ebx
80106145:	e8 36 c1 ff ff       	call   80102280 <ioapicenable>
8010614a:	83 c4 10             	add    $0x10,%esp
8010614d:	b8 78 00 00 00       	mov    $0x78,%eax
80106152:	eb 0e                	jmp    80106162 <uartinit+0x92>
80106154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80106158:	83 c3 01             	add    $0x1,%ebx
8010615b:	0f be 03             	movsbl (%ebx),%eax
8010615e:	84 c0                	test   %al,%al
80106160:	74 1e                	je     80106180 <uartinit+0xb0>
void
uartputc(int c)
{
  int i;

  if(!uart)
80106162:	8b 15 e0 b5 10 80    	mov    0x8010b5e0,%edx
80106168:	85 d2                	test   %edx,%edx
8010616a:	74 ec                	je     80106158 <uartinit+0x88>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
8010616c:	83 c3 01             	add    $0x1,%ebx
8010616f:	e8 0c ff ff ff       	call   80106080 <uartputc.part.0>
80106174:	0f be 03             	movsbl (%ebx),%eax
80106177:	84 c0                	test   %al,%al
80106179:	75 e7                	jne    80106162 <uartinit+0x92>
8010617b:	90                   	nop
8010617c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uartputc(*p);
}
80106180:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106183:	5b                   	pop    %ebx
80106184:	5e                   	pop    %esi
80106185:	5f                   	pop    %edi
80106186:	5d                   	pop    %ebp
80106187:	c3                   	ret    
80106188:	90                   	nop
80106189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106190 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80106190:	8b 15 e0 b5 10 80    	mov    0x8010b5e0,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80106196:	55                   	push   %ebp
80106197:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80106199:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
8010619b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
8010619e:	74 10                	je     801061b0 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
801061a0:	5d                   	pop    %ebp
801061a1:	e9 da fe ff ff       	jmp    80106080 <uartputc.part.0>
801061a6:	8d 76 00             	lea    0x0(%esi),%esi
801061a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801061b0:	5d                   	pop    %ebp
801061b1:	c3                   	ret    
801061b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801061b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801061c0 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
801061c0:	55                   	push   %ebp
801061c1:	89 e5                	mov    %esp,%ebp
801061c3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
801061c6:	68 50 60 10 80       	push   $0x80106050
801061cb:	e8 00 a6 ff ff       	call   801007d0 <consoleintr>
801061d0:	83 c4 10             	add    $0x10,%esp
}
801061d3:	c9                   	leave  
801061d4:	c3                   	ret    

801061d5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
801061d5:	6a 00                	push   $0x0
  pushl $0
801061d7:	6a 00                	push   $0x0
  jmp alltraps
801061d9:	e9 1d fb ff ff       	jmp    80105cfb <alltraps>

801061de <vector1>:
.globl vector1
vector1:
  pushl $0
801061de:	6a 00                	push   $0x0
  pushl $1
801061e0:	6a 01                	push   $0x1
  jmp alltraps
801061e2:	e9 14 fb ff ff       	jmp    80105cfb <alltraps>

801061e7 <vector2>:
.globl vector2
vector2:
  pushl $0
801061e7:	6a 00                	push   $0x0
  pushl $2
801061e9:	6a 02                	push   $0x2
  jmp alltraps
801061eb:	e9 0b fb ff ff       	jmp    80105cfb <alltraps>

801061f0 <vector3>:
.globl vector3
vector3:
  pushl $0
801061f0:	6a 00                	push   $0x0
  pushl $3
801061f2:	6a 03                	push   $0x3
  jmp alltraps
801061f4:	e9 02 fb ff ff       	jmp    80105cfb <alltraps>

801061f9 <vector4>:
.globl vector4
vector4:
  pushl $0
801061f9:	6a 00                	push   $0x0
  pushl $4
801061fb:	6a 04                	push   $0x4
  jmp alltraps
801061fd:	e9 f9 fa ff ff       	jmp    80105cfb <alltraps>

80106202 <vector5>:
.globl vector5
vector5:
  pushl $0
80106202:	6a 00                	push   $0x0
  pushl $5
80106204:	6a 05                	push   $0x5
  jmp alltraps
80106206:	e9 f0 fa ff ff       	jmp    80105cfb <alltraps>

8010620b <vector6>:
.globl vector6
vector6:
  pushl $0
8010620b:	6a 00                	push   $0x0
  pushl $6
8010620d:	6a 06                	push   $0x6
  jmp alltraps
8010620f:	e9 e7 fa ff ff       	jmp    80105cfb <alltraps>

80106214 <vector7>:
.globl vector7
vector7:
  pushl $0
80106214:	6a 00                	push   $0x0
  pushl $7
80106216:	6a 07                	push   $0x7
  jmp alltraps
80106218:	e9 de fa ff ff       	jmp    80105cfb <alltraps>

8010621d <vector8>:
.globl vector8
vector8:
  pushl $8
8010621d:	6a 08                	push   $0x8
  jmp alltraps
8010621f:	e9 d7 fa ff ff       	jmp    80105cfb <alltraps>

80106224 <vector9>:
.globl vector9
vector9:
  pushl $0
80106224:	6a 00                	push   $0x0
  pushl $9
80106226:	6a 09                	push   $0x9
  jmp alltraps
80106228:	e9 ce fa ff ff       	jmp    80105cfb <alltraps>

8010622d <vector10>:
.globl vector10
vector10:
  pushl $10
8010622d:	6a 0a                	push   $0xa
  jmp alltraps
8010622f:	e9 c7 fa ff ff       	jmp    80105cfb <alltraps>

80106234 <vector11>:
.globl vector11
vector11:
  pushl $11
80106234:	6a 0b                	push   $0xb
  jmp alltraps
80106236:	e9 c0 fa ff ff       	jmp    80105cfb <alltraps>

8010623b <vector12>:
.globl vector12
vector12:
  pushl $12
8010623b:	6a 0c                	push   $0xc
  jmp alltraps
8010623d:	e9 b9 fa ff ff       	jmp    80105cfb <alltraps>

80106242 <vector13>:
.globl vector13
vector13:
  pushl $13
80106242:	6a 0d                	push   $0xd
  jmp alltraps
80106244:	e9 b2 fa ff ff       	jmp    80105cfb <alltraps>

80106249 <vector14>:
.globl vector14
vector14:
  pushl $14
80106249:	6a 0e                	push   $0xe
  jmp alltraps
8010624b:	e9 ab fa ff ff       	jmp    80105cfb <alltraps>

80106250 <vector15>:
.globl vector15
vector15:
  pushl $0
80106250:	6a 00                	push   $0x0
  pushl $15
80106252:	6a 0f                	push   $0xf
  jmp alltraps
80106254:	e9 a2 fa ff ff       	jmp    80105cfb <alltraps>

80106259 <vector16>:
.globl vector16
vector16:
  pushl $0
80106259:	6a 00                	push   $0x0
  pushl $16
8010625b:	6a 10                	push   $0x10
  jmp alltraps
8010625d:	e9 99 fa ff ff       	jmp    80105cfb <alltraps>

80106262 <vector17>:
.globl vector17
vector17:
  pushl $17
80106262:	6a 11                	push   $0x11
  jmp alltraps
80106264:	e9 92 fa ff ff       	jmp    80105cfb <alltraps>

80106269 <vector18>:
.globl vector18
vector18:
  pushl $0
80106269:	6a 00                	push   $0x0
  pushl $18
8010626b:	6a 12                	push   $0x12
  jmp alltraps
8010626d:	e9 89 fa ff ff       	jmp    80105cfb <alltraps>

80106272 <vector19>:
.globl vector19
vector19:
  pushl $0
80106272:	6a 00                	push   $0x0
  pushl $19
80106274:	6a 13                	push   $0x13
  jmp alltraps
80106276:	e9 80 fa ff ff       	jmp    80105cfb <alltraps>

8010627b <vector20>:
.globl vector20
vector20:
  pushl $0
8010627b:	6a 00                	push   $0x0
  pushl $20
8010627d:	6a 14                	push   $0x14
  jmp alltraps
8010627f:	e9 77 fa ff ff       	jmp    80105cfb <alltraps>

80106284 <vector21>:
.globl vector21
vector21:
  pushl $0
80106284:	6a 00                	push   $0x0
  pushl $21
80106286:	6a 15                	push   $0x15
  jmp alltraps
80106288:	e9 6e fa ff ff       	jmp    80105cfb <alltraps>

8010628d <vector22>:
.globl vector22
vector22:
  pushl $0
8010628d:	6a 00                	push   $0x0
  pushl $22
8010628f:	6a 16                	push   $0x16
  jmp alltraps
80106291:	e9 65 fa ff ff       	jmp    80105cfb <alltraps>

80106296 <vector23>:
.globl vector23
vector23:
  pushl $0
80106296:	6a 00                	push   $0x0
  pushl $23
80106298:	6a 17                	push   $0x17
  jmp alltraps
8010629a:	e9 5c fa ff ff       	jmp    80105cfb <alltraps>

8010629f <vector24>:
.globl vector24
vector24:
  pushl $0
8010629f:	6a 00                	push   $0x0
  pushl $24
801062a1:	6a 18                	push   $0x18
  jmp alltraps
801062a3:	e9 53 fa ff ff       	jmp    80105cfb <alltraps>

801062a8 <vector25>:
.globl vector25
vector25:
  pushl $0
801062a8:	6a 00                	push   $0x0
  pushl $25
801062aa:	6a 19                	push   $0x19
  jmp alltraps
801062ac:	e9 4a fa ff ff       	jmp    80105cfb <alltraps>

801062b1 <vector26>:
.globl vector26
vector26:
  pushl $0
801062b1:	6a 00                	push   $0x0
  pushl $26
801062b3:	6a 1a                	push   $0x1a
  jmp alltraps
801062b5:	e9 41 fa ff ff       	jmp    80105cfb <alltraps>

801062ba <vector27>:
.globl vector27
vector27:
  pushl $0
801062ba:	6a 00                	push   $0x0
  pushl $27
801062bc:	6a 1b                	push   $0x1b
  jmp alltraps
801062be:	e9 38 fa ff ff       	jmp    80105cfb <alltraps>

801062c3 <vector28>:
.globl vector28
vector28:
  pushl $0
801062c3:	6a 00                	push   $0x0
  pushl $28
801062c5:	6a 1c                	push   $0x1c
  jmp alltraps
801062c7:	e9 2f fa ff ff       	jmp    80105cfb <alltraps>

801062cc <vector29>:
.globl vector29
vector29:
  pushl $0
801062cc:	6a 00                	push   $0x0
  pushl $29
801062ce:	6a 1d                	push   $0x1d
  jmp alltraps
801062d0:	e9 26 fa ff ff       	jmp    80105cfb <alltraps>

801062d5 <vector30>:
.globl vector30
vector30:
  pushl $0
801062d5:	6a 00                	push   $0x0
  pushl $30
801062d7:	6a 1e                	push   $0x1e
  jmp alltraps
801062d9:	e9 1d fa ff ff       	jmp    80105cfb <alltraps>

801062de <vector31>:
.globl vector31
vector31:
  pushl $0
801062de:	6a 00                	push   $0x0
  pushl $31
801062e0:	6a 1f                	push   $0x1f
  jmp alltraps
801062e2:	e9 14 fa ff ff       	jmp    80105cfb <alltraps>

801062e7 <vector32>:
.globl vector32
vector32:
  pushl $0
801062e7:	6a 00                	push   $0x0
  pushl $32
801062e9:	6a 20                	push   $0x20
  jmp alltraps
801062eb:	e9 0b fa ff ff       	jmp    80105cfb <alltraps>

801062f0 <vector33>:
.globl vector33
vector33:
  pushl $0
801062f0:	6a 00                	push   $0x0
  pushl $33
801062f2:	6a 21                	push   $0x21
  jmp alltraps
801062f4:	e9 02 fa ff ff       	jmp    80105cfb <alltraps>

801062f9 <vector34>:
.globl vector34
vector34:
  pushl $0
801062f9:	6a 00                	push   $0x0
  pushl $34
801062fb:	6a 22                	push   $0x22
  jmp alltraps
801062fd:	e9 f9 f9 ff ff       	jmp    80105cfb <alltraps>

80106302 <vector35>:
.globl vector35
vector35:
  pushl $0
80106302:	6a 00                	push   $0x0
  pushl $35
80106304:	6a 23                	push   $0x23
  jmp alltraps
80106306:	e9 f0 f9 ff ff       	jmp    80105cfb <alltraps>

8010630b <vector36>:
.globl vector36
vector36:
  pushl $0
8010630b:	6a 00                	push   $0x0
  pushl $36
8010630d:	6a 24                	push   $0x24
  jmp alltraps
8010630f:	e9 e7 f9 ff ff       	jmp    80105cfb <alltraps>

80106314 <vector37>:
.globl vector37
vector37:
  pushl $0
80106314:	6a 00                	push   $0x0
  pushl $37
80106316:	6a 25                	push   $0x25
  jmp alltraps
80106318:	e9 de f9 ff ff       	jmp    80105cfb <alltraps>

8010631d <vector38>:
.globl vector38
vector38:
  pushl $0
8010631d:	6a 00                	push   $0x0
  pushl $38
8010631f:	6a 26                	push   $0x26
  jmp alltraps
80106321:	e9 d5 f9 ff ff       	jmp    80105cfb <alltraps>

80106326 <vector39>:
.globl vector39
vector39:
  pushl $0
80106326:	6a 00                	push   $0x0
  pushl $39
80106328:	6a 27                	push   $0x27
  jmp alltraps
8010632a:	e9 cc f9 ff ff       	jmp    80105cfb <alltraps>

8010632f <vector40>:
.globl vector40
vector40:
  pushl $0
8010632f:	6a 00                	push   $0x0
  pushl $40
80106331:	6a 28                	push   $0x28
  jmp alltraps
80106333:	e9 c3 f9 ff ff       	jmp    80105cfb <alltraps>

80106338 <vector41>:
.globl vector41
vector41:
  pushl $0
80106338:	6a 00                	push   $0x0
  pushl $41
8010633a:	6a 29                	push   $0x29
  jmp alltraps
8010633c:	e9 ba f9 ff ff       	jmp    80105cfb <alltraps>

80106341 <vector42>:
.globl vector42
vector42:
  pushl $0
80106341:	6a 00                	push   $0x0
  pushl $42
80106343:	6a 2a                	push   $0x2a
  jmp alltraps
80106345:	e9 b1 f9 ff ff       	jmp    80105cfb <alltraps>

8010634a <vector43>:
.globl vector43
vector43:
  pushl $0
8010634a:	6a 00                	push   $0x0
  pushl $43
8010634c:	6a 2b                	push   $0x2b
  jmp alltraps
8010634e:	e9 a8 f9 ff ff       	jmp    80105cfb <alltraps>

80106353 <vector44>:
.globl vector44
vector44:
  pushl $0
80106353:	6a 00                	push   $0x0
  pushl $44
80106355:	6a 2c                	push   $0x2c
  jmp alltraps
80106357:	e9 9f f9 ff ff       	jmp    80105cfb <alltraps>

8010635c <vector45>:
.globl vector45
vector45:
  pushl $0
8010635c:	6a 00                	push   $0x0
  pushl $45
8010635e:	6a 2d                	push   $0x2d
  jmp alltraps
80106360:	e9 96 f9 ff ff       	jmp    80105cfb <alltraps>

80106365 <vector46>:
.globl vector46
vector46:
  pushl $0
80106365:	6a 00                	push   $0x0
  pushl $46
80106367:	6a 2e                	push   $0x2e
  jmp alltraps
80106369:	e9 8d f9 ff ff       	jmp    80105cfb <alltraps>

8010636e <vector47>:
.globl vector47
vector47:
  pushl $0
8010636e:	6a 00                	push   $0x0
  pushl $47
80106370:	6a 2f                	push   $0x2f
  jmp alltraps
80106372:	e9 84 f9 ff ff       	jmp    80105cfb <alltraps>

80106377 <vector48>:
.globl vector48
vector48:
  pushl $0
80106377:	6a 00                	push   $0x0
  pushl $48
80106379:	6a 30                	push   $0x30
  jmp alltraps
8010637b:	e9 7b f9 ff ff       	jmp    80105cfb <alltraps>

80106380 <vector49>:
.globl vector49
vector49:
  pushl $0
80106380:	6a 00                	push   $0x0
  pushl $49
80106382:	6a 31                	push   $0x31
  jmp alltraps
80106384:	e9 72 f9 ff ff       	jmp    80105cfb <alltraps>

80106389 <vector50>:
.globl vector50
vector50:
  pushl $0
80106389:	6a 00                	push   $0x0
  pushl $50
8010638b:	6a 32                	push   $0x32
  jmp alltraps
8010638d:	e9 69 f9 ff ff       	jmp    80105cfb <alltraps>

80106392 <vector51>:
.globl vector51
vector51:
  pushl $0
80106392:	6a 00                	push   $0x0
  pushl $51
80106394:	6a 33                	push   $0x33
  jmp alltraps
80106396:	e9 60 f9 ff ff       	jmp    80105cfb <alltraps>

8010639b <vector52>:
.globl vector52
vector52:
  pushl $0
8010639b:	6a 00                	push   $0x0
  pushl $52
8010639d:	6a 34                	push   $0x34
  jmp alltraps
8010639f:	e9 57 f9 ff ff       	jmp    80105cfb <alltraps>

801063a4 <vector53>:
.globl vector53
vector53:
  pushl $0
801063a4:	6a 00                	push   $0x0
  pushl $53
801063a6:	6a 35                	push   $0x35
  jmp alltraps
801063a8:	e9 4e f9 ff ff       	jmp    80105cfb <alltraps>

801063ad <vector54>:
.globl vector54
vector54:
  pushl $0
801063ad:	6a 00                	push   $0x0
  pushl $54
801063af:	6a 36                	push   $0x36
  jmp alltraps
801063b1:	e9 45 f9 ff ff       	jmp    80105cfb <alltraps>

801063b6 <vector55>:
.globl vector55
vector55:
  pushl $0
801063b6:	6a 00                	push   $0x0
  pushl $55
801063b8:	6a 37                	push   $0x37
  jmp alltraps
801063ba:	e9 3c f9 ff ff       	jmp    80105cfb <alltraps>

801063bf <vector56>:
.globl vector56
vector56:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $56
801063c1:	6a 38                	push   $0x38
  jmp alltraps
801063c3:	e9 33 f9 ff ff       	jmp    80105cfb <alltraps>

801063c8 <vector57>:
.globl vector57
vector57:
  pushl $0
801063c8:	6a 00                	push   $0x0
  pushl $57
801063ca:	6a 39                	push   $0x39
  jmp alltraps
801063cc:	e9 2a f9 ff ff       	jmp    80105cfb <alltraps>

801063d1 <vector58>:
.globl vector58
vector58:
  pushl $0
801063d1:	6a 00                	push   $0x0
  pushl $58
801063d3:	6a 3a                	push   $0x3a
  jmp alltraps
801063d5:	e9 21 f9 ff ff       	jmp    80105cfb <alltraps>

801063da <vector59>:
.globl vector59
vector59:
  pushl $0
801063da:	6a 00                	push   $0x0
  pushl $59
801063dc:	6a 3b                	push   $0x3b
  jmp alltraps
801063de:	e9 18 f9 ff ff       	jmp    80105cfb <alltraps>

801063e3 <vector60>:
.globl vector60
vector60:
  pushl $0
801063e3:	6a 00                	push   $0x0
  pushl $60
801063e5:	6a 3c                	push   $0x3c
  jmp alltraps
801063e7:	e9 0f f9 ff ff       	jmp    80105cfb <alltraps>

801063ec <vector61>:
.globl vector61
vector61:
  pushl $0
801063ec:	6a 00                	push   $0x0
  pushl $61
801063ee:	6a 3d                	push   $0x3d
  jmp alltraps
801063f0:	e9 06 f9 ff ff       	jmp    80105cfb <alltraps>

801063f5 <vector62>:
.globl vector62
vector62:
  pushl $0
801063f5:	6a 00                	push   $0x0
  pushl $62
801063f7:	6a 3e                	push   $0x3e
  jmp alltraps
801063f9:	e9 fd f8 ff ff       	jmp    80105cfb <alltraps>

801063fe <vector63>:
.globl vector63
vector63:
  pushl $0
801063fe:	6a 00                	push   $0x0
  pushl $63
80106400:	6a 3f                	push   $0x3f
  jmp alltraps
80106402:	e9 f4 f8 ff ff       	jmp    80105cfb <alltraps>

80106407 <vector64>:
.globl vector64
vector64:
  pushl $0
80106407:	6a 00                	push   $0x0
  pushl $64
80106409:	6a 40                	push   $0x40
  jmp alltraps
8010640b:	e9 eb f8 ff ff       	jmp    80105cfb <alltraps>

80106410 <vector65>:
.globl vector65
vector65:
  pushl $0
80106410:	6a 00                	push   $0x0
  pushl $65
80106412:	6a 41                	push   $0x41
  jmp alltraps
80106414:	e9 e2 f8 ff ff       	jmp    80105cfb <alltraps>

80106419 <vector66>:
.globl vector66
vector66:
  pushl $0
80106419:	6a 00                	push   $0x0
  pushl $66
8010641b:	6a 42                	push   $0x42
  jmp alltraps
8010641d:	e9 d9 f8 ff ff       	jmp    80105cfb <alltraps>

80106422 <vector67>:
.globl vector67
vector67:
  pushl $0
80106422:	6a 00                	push   $0x0
  pushl $67
80106424:	6a 43                	push   $0x43
  jmp alltraps
80106426:	e9 d0 f8 ff ff       	jmp    80105cfb <alltraps>

8010642b <vector68>:
.globl vector68
vector68:
  pushl $0
8010642b:	6a 00                	push   $0x0
  pushl $68
8010642d:	6a 44                	push   $0x44
  jmp alltraps
8010642f:	e9 c7 f8 ff ff       	jmp    80105cfb <alltraps>

80106434 <vector69>:
.globl vector69
vector69:
  pushl $0
80106434:	6a 00                	push   $0x0
  pushl $69
80106436:	6a 45                	push   $0x45
  jmp alltraps
80106438:	e9 be f8 ff ff       	jmp    80105cfb <alltraps>

8010643d <vector70>:
.globl vector70
vector70:
  pushl $0
8010643d:	6a 00                	push   $0x0
  pushl $70
8010643f:	6a 46                	push   $0x46
  jmp alltraps
80106441:	e9 b5 f8 ff ff       	jmp    80105cfb <alltraps>

80106446 <vector71>:
.globl vector71
vector71:
  pushl $0
80106446:	6a 00                	push   $0x0
  pushl $71
80106448:	6a 47                	push   $0x47
  jmp alltraps
8010644a:	e9 ac f8 ff ff       	jmp    80105cfb <alltraps>

8010644f <vector72>:
.globl vector72
vector72:
  pushl $0
8010644f:	6a 00                	push   $0x0
  pushl $72
80106451:	6a 48                	push   $0x48
  jmp alltraps
80106453:	e9 a3 f8 ff ff       	jmp    80105cfb <alltraps>

80106458 <vector73>:
.globl vector73
vector73:
  pushl $0
80106458:	6a 00                	push   $0x0
  pushl $73
8010645a:	6a 49                	push   $0x49
  jmp alltraps
8010645c:	e9 9a f8 ff ff       	jmp    80105cfb <alltraps>

80106461 <vector74>:
.globl vector74
vector74:
  pushl $0
80106461:	6a 00                	push   $0x0
  pushl $74
80106463:	6a 4a                	push   $0x4a
  jmp alltraps
80106465:	e9 91 f8 ff ff       	jmp    80105cfb <alltraps>

8010646a <vector75>:
.globl vector75
vector75:
  pushl $0
8010646a:	6a 00                	push   $0x0
  pushl $75
8010646c:	6a 4b                	push   $0x4b
  jmp alltraps
8010646e:	e9 88 f8 ff ff       	jmp    80105cfb <alltraps>

80106473 <vector76>:
.globl vector76
vector76:
  pushl $0
80106473:	6a 00                	push   $0x0
  pushl $76
80106475:	6a 4c                	push   $0x4c
  jmp alltraps
80106477:	e9 7f f8 ff ff       	jmp    80105cfb <alltraps>

8010647c <vector77>:
.globl vector77
vector77:
  pushl $0
8010647c:	6a 00                	push   $0x0
  pushl $77
8010647e:	6a 4d                	push   $0x4d
  jmp alltraps
80106480:	e9 76 f8 ff ff       	jmp    80105cfb <alltraps>

80106485 <vector78>:
.globl vector78
vector78:
  pushl $0
80106485:	6a 00                	push   $0x0
  pushl $78
80106487:	6a 4e                	push   $0x4e
  jmp alltraps
80106489:	e9 6d f8 ff ff       	jmp    80105cfb <alltraps>

8010648e <vector79>:
.globl vector79
vector79:
  pushl $0
8010648e:	6a 00                	push   $0x0
  pushl $79
80106490:	6a 4f                	push   $0x4f
  jmp alltraps
80106492:	e9 64 f8 ff ff       	jmp    80105cfb <alltraps>

80106497 <vector80>:
.globl vector80
vector80:
  pushl $0
80106497:	6a 00                	push   $0x0
  pushl $80
80106499:	6a 50                	push   $0x50
  jmp alltraps
8010649b:	e9 5b f8 ff ff       	jmp    80105cfb <alltraps>

801064a0 <vector81>:
.globl vector81
vector81:
  pushl $0
801064a0:	6a 00                	push   $0x0
  pushl $81
801064a2:	6a 51                	push   $0x51
  jmp alltraps
801064a4:	e9 52 f8 ff ff       	jmp    80105cfb <alltraps>

801064a9 <vector82>:
.globl vector82
vector82:
  pushl $0
801064a9:	6a 00                	push   $0x0
  pushl $82
801064ab:	6a 52                	push   $0x52
  jmp alltraps
801064ad:	e9 49 f8 ff ff       	jmp    80105cfb <alltraps>

801064b2 <vector83>:
.globl vector83
vector83:
  pushl $0
801064b2:	6a 00                	push   $0x0
  pushl $83
801064b4:	6a 53                	push   $0x53
  jmp alltraps
801064b6:	e9 40 f8 ff ff       	jmp    80105cfb <alltraps>

801064bb <vector84>:
.globl vector84
vector84:
  pushl $0
801064bb:	6a 00                	push   $0x0
  pushl $84
801064bd:	6a 54                	push   $0x54
  jmp alltraps
801064bf:	e9 37 f8 ff ff       	jmp    80105cfb <alltraps>

801064c4 <vector85>:
.globl vector85
vector85:
  pushl $0
801064c4:	6a 00                	push   $0x0
  pushl $85
801064c6:	6a 55                	push   $0x55
  jmp alltraps
801064c8:	e9 2e f8 ff ff       	jmp    80105cfb <alltraps>

801064cd <vector86>:
.globl vector86
vector86:
  pushl $0
801064cd:	6a 00                	push   $0x0
  pushl $86
801064cf:	6a 56                	push   $0x56
  jmp alltraps
801064d1:	e9 25 f8 ff ff       	jmp    80105cfb <alltraps>

801064d6 <vector87>:
.globl vector87
vector87:
  pushl $0
801064d6:	6a 00                	push   $0x0
  pushl $87
801064d8:	6a 57                	push   $0x57
  jmp alltraps
801064da:	e9 1c f8 ff ff       	jmp    80105cfb <alltraps>

801064df <vector88>:
.globl vector88
vector88:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $88
801064e1:	6a 58                	push   $0x58
  jmp alltraps
801064e3:	e9 13 f8 ff ff       	jmp    80105cfb <alltraps>

801064e8 <vector89>:
.globl vector89
vector89:
  pushl $0
801064e8:	6a 00                	push   $0x0
  pushl $89
801064ea:	6a 59                	push   $0x59
  jmp alltraps
801064ec:	e9 0a f8 ff ff       	jmp    80105cfb <alltraps>

801064f1 <vector90>:
.globl vector90
vector90:
  pushl $0
801064f1:	6a 00                	push   $0x0
  pushl $90
801064f3:	6a 5a                	push   $0x5a
  jmp alltraps
801064f5:	e9 01 f8 ff ff       	jmp    80105cfb <alltraps>

801064fa <vector91>:
.globl vector91
vector91:
  pushl $0
801064fa:	6a 00                	push   $0x0
  pushl $91
801064fc:	6a 5b                	push   $0x5b
  jmp alltraps
801064fe:	e9 f8 f7 ff ff       	jmp    80105cfb <alltraps>

80106503 <vector92>:
.globl vector92
vector92:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $92
80106505:	6a 5c                	push   $0x5c
  jmp alltraps
80106507:	e9 ef f7 ff ff       	jmp    80105cfb <alltraps>

8010650c <vector93>:
.globl vector93
vector93:
  pushl $0
8010650c:	6a 00                	push   $0x0
  pushl $93
8010650e:	6a 5d                	push   $0x5d
  jmp alltraps
80106510:	e9 e6 f7 ff ff       	jmp    80105cfb <alltraps>

80106515 <vector94>:
.globl vector94
vector94:
  pushl $0
80106515:	6a 00                	push   $0x0
  pushl $94
80106517:	6a 5e                	push   $0x5e
  jmp alltraps
80106519:	e9 dd f7 ff ff       	jmp    80105cfb <alltraps>

8010651e <vector95>:
.globl vector95
vector95:
  pushl $0
8010651e:	6a 00                	push   $0x0
  pushl $95
80106520:	6a 5f                	push   $0x5f
  jmp alltraps
80106522:	e9 d4 f7 ff ff       	jmp    80105cfb <alltraps>

80106527 <vector96>:
.globl vector96
vector96:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $96
80106529:	6a 60                	push   $0x60
  jmp alltraps
8010652b:	e9 cb f7 ff ff       	jmp    80105cfb <alltraps>

80106530 <vector97>:
.globl vector97
vector97:
  pushl $0
80106530:	6a 00                	push   $0x0
  pushl $97
80106532:	6a 61                	push   $0x61
  jmp alltraps
80106534:	e9 c2 f7 ff ff       	jmp    80105cfb <alltraps>

80106539 <vector98>:
.globl vector98
vector98:
  pushl $0
80106539:	6a 00                	push   $0x0
  pushl $98
8010653b:	6a 62                	push   $0x62
  jmp alltraps
8010653d:	e9 b9 f7 ff ff       	jmp    80105cfb <alltraps>

80106542 <vector99>:
.globl vector99
vector99:
  pushl $0
80106542:	6a 00                	push   $0x0
  pushl $99
80106544:	6a 63                	push   $0x63
  jmp alltraps
80106546:	e9 b0 f7 ff ff       	jmp    80105cfb <alltraps>

8010654b <vector100>:
.globl vector100
vector100:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $100
8010654d:	6a 64                	push   $0x64
  jmp alltraps
8010654f:	e9 a7 f7 ff ff       	jmp    80105cfb <alltraps>

80106554 <vector101>:
.globl vector101
vector101:
  pushl $0
80106554:	6a 00                	push   $0x0
  pushl $101
80106556:	6a 65                	push   $0x65
  jmp alltraps
80106558:	e9 9e f7 ff ff       	jmp    80105cfb <alltraps>

8010655d <vector102>:
.globl vector102
vector102:
  pushl $0
8010655d:	6a 00                	push   $0x0
  pushl $102
8010655f:	6a 66                	push   $0x66
  jmp alltraps
80106561:	e9 95 f7 ff ff       	jmp    80105cfb <alltraps>

80106566 <vector103>:
.globl vector103
vector103:
  pushl $0
80106566:	6a 00                	push   $0x0
  pushl $103
80106568:	6a 67                	push   $0x67
  jmp alltraps
8010656a:	e9 8c f7 ff ff       	jmp    80105cfb <alltraps>

8010656f <vector104>:
.globl vector104
vector104:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $104
80106571:	6a 68                	push   $0x68
  jmp alltraps
80106573:	e9 83 f7 ff ff       	jmp    80105cfb <alltraps>

80106578 <vector105>:
.globl vector105
vector105:
  pushl $0
80106578:	6a 00                	push   $0x0
  pushl $105
8010657a:	6a 69                	push   $0x69
  jmp alltraps
8010657c:	e9 7a f7 ff ff       	jmp    80105cfb <alltraps>

80106581 <vector106>:
.globl vector106
vector106:
  pushl $0
80106581:	6a 00                	push   $0x0
  pushl $106
80106583:	6a 6a                	push   $0x6a
  jmp alltraps
80106585:	e9 71 f7 ff ff       	jmp    80105cfb <alltraps>

8010658a <vector107>:
.globl vector107
vector107:
  pushl $0
8010658a:	6a 00                	push   $0x0
  pushl $107
8010658c:	6a 6b                	push   $0x6b
  jmp alltraps
8010658e:	e9 68 f7 ff ff       	jmp    80105cfb <alltraps>

80106593 <vector108>:
.globl vector108
vector108:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $108
80106595:	6a 6c                	push   $0x6c
  jmp alltraps
80106597:	e9 5f f7 ff ff       	jmp    80105cfb <alltraps>

8010659c <vector109>:
.globl vector109
vector109:
  pushl $0
8010659c:	6a 00                	push   $0x0
  pushl $109
8010659e:	6a 6d                	push   $0x6d
  jmp alltraps
801065a0:	e9 56 f7 ff ff       	jmp    80105cfb <alltraps>

801065a5 <vector110>:
.globl vector110
vector110:
  pushl $0
801065a5:	6a 00                	push   $0x0
  pushl $110
801065a7:	6a 6e                	push   $0x6e
  jmp alltraps
801065a9:	e9 4d f7 ff ff       	jmp    80105cfb <alltraps>

801065ae <vector111>:
.globl vector111
vector111:
  pushl $0
801065ae:	6a 00                	push   $0x0
  pushl $111
801065b0:	6a 6f                	push   $0x6f
  jmp alltraps
801065b2:	e9 44 f7 ff ff       	jmp    80105cfb <alltraps>

801065b7 <vector112>:
.globl vector112
vector112:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $112
801065b9:	6a 70                	push   $0x70
  jmp alltraps
801065bb:	e9 3b f7 ff ff       	jmp    80105cfb <alltraps>

801065c0 <vector113>:
.globl vector113
vector113:
  pushl $0
801065c0:	6a 00                	push   $0x0
  pushl $113
801065c2:	6a 71                	push   $0x71
  jmp alltraps
801065c4:	e9 32 f7 ff ff       	jmp    80105cfb <alltraps>

801065c9 <vector114>:
.globl vector114
vector114:
  pushl $0
801065c9:	6a 00                	push   $0x0
  pushl $114
801065cb:	6a 72                	push   $0x72
  jmp alltraps
801065cd:	e9 29 f7 ff ff       	jmp    80105cfb <alltraps>

801065d2 <vector115>:
.globl vector115
vector115:
  pushl $0
801065d2:	6a 00                	push   $0x0
  pushl $115
801065d4:	6a 73                	push   $0x73
  jmp alltraps
801065d6:	e9 20 f7 ff ff       	jmp    80105cfb <alltraps>

801065db <vector116>:
.globl vector116
vector116:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $116
801065dd:	6a 74                	push   $0x74
  jmp alltraps
801065df:	e9 17 f7 ff ff       	jmp    80105cfb <alltraps>

801065e4 <vector117>:
.globl vector117
vector117:
  pushl $0
801065e4:	6a 00                	push   $0x0
  pushl $117
801065e6:	6a 75                	push   $0x75
  jmp alltraps
801065e8:	e9 0e f7 ff ff       	jmp    80105cfb <alltraps>

801065ed <vector118>:
.globl vector118
vector118:
  pushl $0
801065ed:	6a 00                	push   $0x0
  pushl $118
801065ef:	6a 76                	push   $0x76
  jmp alltraps
801065f1:	e9 05 f7 ff ff       	jmp    80105cfb <alltraps>

801065f6 <vector119>:
.globl vector119
vector119:
  pushl $0
801065f6:	6a 00                	push   $0x0
  pushl $119
801065f8:	6a 77                	push   $0x77
  jmp alltraps
801065fa:	e9 fc f6 ff ff       	jmp    80105cfb <alltraps>

801065ff <vector120>:
.globl vector120
vector120:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $120
80106601:	6a 78                	push   $0x78
  jmp alltraps
80106603:	e9 f3 f6 ff ff       	jmp    80105cfb <alltraps>

80106608 <vector121>:
.globl vector121
vector121:
  pushl $0
80106608:	6a 00                	push   $0x0
  pushl $121
8010660a:	6a 79                	push   $0x79
  jmp alltraps
8010660c:	e9 ea f6 ff ff       	jmp    80105cfb <alltraps>

80106611 <vector122>:
.globl vector122
vector122:
  pushl $0
80106611:	6a 00                	push   $0x0
  pushl $122
80106613:	6a 7a                	push   $0x7a
  jmp alltraps
80106615:	e9 e1 f6 ff ff       	jmp    80105cfb <alltraps>

8010661a <vector123>:
.globl vector123
vector123:
  pushl $0
8010661a:	6a 00                	push   $0x0
  pushl $123
8010661c:	6a 7b                	push   $0x7b
  jmp alltraps
8010661e:	e9 d8 f6 ff ff       	jmp    80105cfb <alltraps>

80106623 <vector124>:
.globl vector124
vector124:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $124
80106625:	6a 7c                	push   $0x7c
  jmp alltraps
80106627:	e9 cf f6 ff ff       	jmp    80105cfb <alltraps>

8010662c <vector125>:
.globl vector125
vector125:
  pushl $0
8010662c:	6a 00                	push   $0x0
  pushl $125
8010662e:	6a 7d                	push   $0x7d
  jmp alltraps
80106630:	e9 c6 f6 ff ff       	jmp    80105cfb <alltraps>

80106635 <vector126>:
.globl vector126
vector126:
  pushl $0
80106635:	6a 00                	push   $0x0
  pushl $126
80106637:	6a 7e                	push   $0x7e
  jmp alltraps
80106639:	e9 bd f6 ff ff       	jmp    80105cfb <alltraps>

8010663e <vector127>:
.globl vector127
vector127:
  pushl $0
8010663e:	6a 00                	push   $0x0
  pushl $127
80106640:	6a 7f                	push   $0x7f
  jmp alltraps
80106642:	e9 b4 f6 ff ff       	jmp    80105cfb <alltraps>

80106647 <vector128>:
.globl vector128
vector128:
  pushl $0
80106647:	6a 00                	push   $0x0
  pushl $128
80106649:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010664e:	e9 a8 f6 ff ff       	jmp    80105cfb <alltraps>

80106653 <vector129>:
.globl vector129
vector129:
  pushl $0
80106653:	6a 00                	push   $0x0
  pushl $129
80106655:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010665a:	e9 9c f6 ff ff       	jmp    80105cfb <alltraps>

8010665f <vector130>:
.globl vector130
vector130:
  pushl $0
8010665f:	6a 00                	push   $0x0
  pushl $130
80106661:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106666:	e9 90 f6 ff ff       	jmp    80105cfb <alltraps>

8010666b <vector131>:
.globl vector131
vector131:
  pushl $0
8010666b:	6a 00                	push   $0x0
  pushl $131
8010666d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80106672:	e9 84 f6 ff ff       	jmp    80105cfb <alltraps>

80106677 <vector132>:
.globl vector132
vector132:
  pushl $0
80106677:	6a 00                	push   $0x0
  pushl $132
80106679:	68 84 00 00 00       	push   $0x84
  jmp alltraps
8010667e:	e9 78 f6 ff ff       	jmp    80105cfb <alltraps>

80106683 <vector133>:
.globl vector133
vector133:
  pushl $0
80106683:	6a 00                	push   $0x0
  pushl $133
80106685:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010668a:	e9 6c f6 ff ff       	jmp    80105cfb <alltraps>

8010668f <vector134>:
.globl vector134
vector134:
  pushl $0
8010668f:	6a 00                	push   $0x0
  pushl $134
80106691:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106696:	e9 60 f6 ff ff       	jmp    80105cfb <alltraps>

8010669b <vector135>:
.globl vector135
vector135:
  pushl $0
8010669b:	6a 00                	push   $0x0
  pushl $135
8010669d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801066a2:	e9 54 f6 ff ff       	jmp    80105cfb <alltraps>

801066a7 <vector136>:
.globl vector136
vector136:
  pushl $0
801066a7:	6a 00                	push   $0x0
  pushl $136
801066a9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801066ae:	e9 48 f6 ff ff       	jmp    80105cfb <alltraps>

801066b3 <vector137>:
.globl vector137
vector137:
  pushl $0
801066b3:	6a 00                	push   $0x0
  pushl $137
801066b5:	68 89 00 00 00       	push   $0x89
  jmp alltraps
801066ba:	e9 3c f6 ff ff       	jmp    80105cfb <alltraps>

801066bf <vector138>:
.globl vector138
vector138:
  pushl $0
801066bf:	6a 00                	push   $0x0
  pushl $138
801066c1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801066c6:	e9 30 f6 ff ff       	jmp    80105cfb <alltraps>

801066cb <vector139>:
.globl vector139
vector139:
  pushl $0
801066cb:	6a 00                	push   $0x0
  pushl $139
801066cd:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801066d2:	e9 24 f6 ff ff       	jmp    80105cfb <alltraps>

801066d7 <vector140>:
.globl vector140
vector140:
  pushl $0
801066d7:	6a 00                	push   $0x0
  pushl $140
801066d9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801066de:	e9 18 f6 ff ff       	jmp    80105cfb <alltraps>

801066e3 <vector141>:
.globl vector141
vector141:
  pushl $0
801066e3:	6a 00                	push   $0x0
  pushl $141
801066e5:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801066ea:	e9 0c f6 ff ff       	jmp    80105cfb <alltraps>

801066ef <vector142>:
.globl vector142
vector142:
  pushl $0
801066ef:	6a 00                	push   $0x0
  pushl $142
801066f1:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
801066f6:	e9 00 f6 ff ff       	jmp    80105cfb <alltraps>

801066fb <vector143>:
.globl vector143
vector143:
  pushl $0
801066fb:	6a 00                	push   $0x0
  pushl $143
801066fd:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106702:	e9 f4 f5 ff ff       	jmp    80105cfb <alltraps>

80106707 <vector144>:
.globl vector144
vector144:
  pushl $0
80106707:	6a 00                	push   $0x0
  pushl $144
80106709:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010670e:	e9 e8 f5 ff ff       	jmp    80105cfb <alltraps>

80106713 <vector145>:
.globl vector145
vector145:
  pushl $0
80106713:	6a 00                	push   $0x0
  pushl $145
80106715:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010671a:	e9 dc f5 ff ff       	jmp    80105cfb <alltraps>

8010671f <vector146>:
.globl vector146
vector146:
  pushl $0
8010671f:	6a 00                	push   $0x0
  pushl $146
80106721:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106726:	e9 d0 f5 ff ff       	jmp    80105cfb <alltraps>

8010672b <vector147>:
.globl vector147
vector147:
  pushl $0
8010672b:	6a 00                	push   $0x0
  pushl $147
8010672d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106732:	e9 c4 f5 ff ff       	jmp    80105cfb <alltraps>

80106737 <vector148>:
.globl vector148
vector148:
  pushl $0
80106737:	6a 00                	push   $0x0
  pushl $148
80106739:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010673e:	e9 b8 f5 ff ff       	jmp    80105cfb <alltraps>

80106743 <vector149>:
.globl vector149
vector149:
  pushl $0
80106743:	6a 00                	push   $0x0
  pushl $149
80106745:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010674a:	e9 ac f5 ff ff       	jmp    80105cfb <alltraps>

8010674f <vector150>:
.globl vector150
vector150:
  pushl $0
8010674f:	6a 00                	push   $0x0
  pushl $150
80106751:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106756:	e9 a0 f5 ff ff       	jmp    80105cfb <alltraps>

8010675b <vector151>:
.globl vector151
vector151:
  pushl $0
8010675b:	6a 00                	push   $0x0
  pushl $151
8010675d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106762:	e9 94 f5 ff ff       	jmp    80105cfb <alltraps>

80106767 <vector152>:
.globl vector152
vector152:
  pushl $0
80106767:	6a 00                	push   $0x0
  pushl $152
80106769:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010676e:	e9 88 f5 ff ff       	jmp    80105cfb <alltraps>

80106773 <vector153>:
.globl vector153
vector153:
  pushl $0
80106773:	6a 00                	push   $0x0
  pushl $153
80106775:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010677a:	e9 7c f5 ff ff       	jmp    80105cfb <alltraps>

8010677f <vector154>:
.globl vector154
vector154:
  pushl $0
8010677f:	6a 00                	push   $0x0
  pushl $154
80106781:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106786:	e9 70 f5 ff ff       	jmp    80105cfb <alltraps>

8010678b <vector155>:
.globl vector155
vector155:
  pushl $0
8010678b:	6a 00                	push   $0x0
  pushl $155
8010678d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106792:	e9 64 f5 ff ff       	jmp    80105cfb <alltraps>

80106797 <vector156>:
.globl vector156
vector156:
  pushl $0
80106797:	6a 00                	push   $0x0
  pushl $156
80106799:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010679e:	e9 58 f5 ff ff       	jmp    80105cfb <alltraps>

801067a3 <vector157>:
.globl vector157
vector157:
  pushl $0
801067a3:	6a 00                	push   $0x0
  pushl $157
801067a5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801067aa:	e9 4c f5 ff ff       	jmp    80105cfb <alltraps>

801067af <vector158>:
.globl vector158
vector158:
  pushl $0
801067af:	6a 00                	push   $0x0
  pushl $158
801067b1:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801067b6:	e9 40 f5 ff ff       	jmp    80105cfb <alltraps>

801067bb <vector159>:
.globl vector159
vector159:
  pushl $0
801067bb:	6a 00                	push   $0x0
  pushl $159
801067bd:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801067c2:	e9 34 f5 ff ff       	jmp    80105cfb <alltraps>

801067c7 <vector160>:
.globl vector160
vector160:
  pushl $0
801067c7:	6a 00                	push   $0x0
  pushl $160
801067c9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801067ce:	e9 28 f5 ff ff       	jmp    80105cfb <alltraps>

801067d3 <vector161>:
.globl vector161
vector161:
  pushl $0
801067d3:	6a 00                	push   $0x0
  pushl $161
801067d5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801067da:	e9 1c f5 ff ff       	jmp    80105cfb <alltraps>

801067df <vector162>:
.globl vector162
vector162:
  pushl $0
801067df:	6a 00                	push   $0x0
  pushl $162
801067e1:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801067e6:	e9 10 f5 ff ff       	jmp    80105cfb <alltraps>

801067eb <vector163>:
.globl vector163
vector163:
  pushl $0
801067eb:	6a 00                	push   $0x0
  pushl $163
801067ed:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801067f2:	e9 04 f5 ff ff       	jmp    80105cfb <alltraps>

801067f7 <vector164>:
.globl vector164
vector164:
  pushl $0
801067f7:	6a 00                	push   $0x0
  pushl $164
801067f9:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801067fe:	e9 f8 f4 ff ff       	jmp    80105cfb <alltraps>

80106803 <vector165>:
.globl vector165
vector165:
  pushl $0
80106803:	6a 00                	push   $0x0
  pushl $165
80106805:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010680a:	e9 ec f4 ff ff       	jmp    80105cfb <alltraps>

8010680f <vector166>:
.globl vector166
vector166:
  pushl $0
8010680f:	6a 00                	push   $0x0
  pushl $166
80106811:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106816:	e9 e0 f4 ff ff       	jmp    80105cfb <alltraps>

8010681b <vector167>:
.globl vector167
vector167:
  pushl $0
8010681b:	6a 00                	push   $0x0
  pushl $167
8010681d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106822:	e9 d4 f4 ff ff       	jmp    80105cfb <alltraps>

80106827 <vector168>:
.globl vector168
vector168:
  pushl $0
80106827:	6a 00                	push   $0x0
  pushl $168
80106829:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010682e:	e9 c8 f4 ff ff       	jmp    80105cfb <alltraps>

80106833 <vector169>:
.globl vector169
vector169:
  pushl $0
80106833:	6a 00                	push   $0x0
  pushl $169
80106835:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010683a:	e9 bc f4 ff ff       	jmp    80105cfb <alltraps>

8010683f <vector170>:
.globl vector170
vector170:
  pushl $0
8010683f:	6a 00                	push   $0x0
  pushl $170
80106841:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106846:	e9 b0 f4 ff ff       	jmp    80105cfb <alltraps>

8010684b <vector171>:
.globl vector171
vector171:
  pushl $0
8010684b:	6a 00                	push   $0x0
  pushl $171
8010684d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106852:	e9 a4 f4 ff ff       	jmp    80105cfb <alltraps>

80106857 <vector172>:
.globl vector172
vector172:
  pushl $0
80106857:	6a 00                	push   $0x0
  pushl $172
80106859:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010685e:	e9 98 f4 ff ff       	jmp    80105cfb <alltraps>

80106863 <vector173>:
.globl vector173
vector173:
  pushl $0
80106863:	6a 00                	push   $0x0
  pushl $173
80106865:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010686a:	e9 8c f4 ff ff       	jmp    80105cfb <alltraps>

8010686f <vector174>:
.globl vector174
vector174:
  pushl $0
8010686f:	6a 00                	push   $0x0
  pushl $174
80106871:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106876:	e9 80 f4 ff ff       	jmp    80105cfb <alltraps>

8010687b <vector175>:
.globl vector175
vector175:
  pushl $0
8010687b:	6a 00                	push   $0x0
  pushl $175
8010687d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106882:	e9 74 f4 ff ff       	jmp    80105cfb <alltraps>

80106887 <vector176>:
.globl vector176
vector176:
  pushl $0
80106887:	6a 00                	push   $0x0
  pushl $176
80106889:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010688e:	e9 68 f4 ff ff       	jmp    80105cfb <alltraps>

80106893 <vector177>:
.globl vector177
vector177:
  pushl $0
80106893:	6a 00                	push   $0x0
  pushl $177
80106895:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010689a:	e9 5c f4 ff ff       	jmp    80105cfb <alltraps>

8010689f <vector178>:
.globl vector178
vector178:
  pushl $0
8010689f:	6a 00                	push   $0x0
  pushl $178
801068a1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801068a6:	e9 50 f4 ff ff       	jmp    80105cfb <alltraps>

801068ab <vector179>:
.globl vector179
vector179:
  pushl $0
801068ab:	6a 00                	push   $0x0
  pushl $179
801068ad:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801068b2:	e9 44 f4 ff ff       	jmp    80105cfb <alltraps>

801068b7 <vector180>:
.globl vector180
vector180:
  pushl $0
801068b7:	6a 00                	push   $0x0
  pushl $180
801068b9:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801068be:	e9 38 f4 ff ff       	jmp    80105cfb <alltraps>

801068c3 <vector181>:
.globl vector181
vector181:
  pushl $0
801068c3:	6a 00                	push   $0x0
  pushl $181
801068c5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801068ca:	e9 2c f4 ff ff       	jmp    80105cfb <alltraps>

801068cf <vector182>:
.globl vector182
vector182:
  pushl $0
801068cf:	6a 00                	push   $0x0
  pushl $182
801068d1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801068d6:	e9 20 f4 ff ff       	jmp    80105cfb <alltraps>

801068db <vector183>:
.globl vector183
vector183:
  pushl $0
801068db:	6a 00                	push   $0x0
  pushl $183
801068dd:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801068e2:	e9 14 f4 ff ff       	jmp    80105cfb <alltraps>

801068e7 <vector184>:
.globl vector184
vector184:
  pushl $0
801068e7:	6a 00                	push   $0x0
  pushl $184
801068e9:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801068ee:	e9 08 f4 ff ff       	jmp    80105cfb <alltraps>

801068f3 <vector185>:
.globl vector185
vector185:
  pushl $0
801068f3:	6a 00                	push   $0x0
  pushl $185
801068f5:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801068fa:	e9 fc f3 ff ff       	jmp    80105cfb <alltraps>

801068ff <vector186>:
.globl vector186
vector186:
  pushl $0
801068ff:	6a 00                	push   $0x0
  pushl $186
80106901:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106906:	e9 f0 f3 ff ff       	jmp    80105cfb <alltraps>

8010690b <vector187>:
.globl vector187
vector187:
  pushl $0
8010690b:	6a 00                	push   $0x0
  pushl $187
8010690d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106912:	e9 e4 f3 ff ff       	jmp    80105cfb <alltraps>

80106917 <vector188>:
.globl vector188
vector188:
  pushl $0
80106917:	6a 00                	push   $0x0
  pushl $188
80106919:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010691e:	e9 d8 f3 ff ff       	jmp    80105cfb <alltraps>

80106923 <vector189>:
.globl vector189
vector189:
  pushl $0
80106923:	6a 00                	push   $0x0
  pushl $189
80106925:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010692a:	e9 cc f3 ff ff       	jmp    80105cfb <alltraps>

8010692f <vector190>:
.globl vector190
vector190:
  pushl $0
8010692f:	6a 00                	push   $0x0
  pushl $190
80106931:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106936:	e9 c0 f3 ff ff       	jmp    80105cfb <alltraps>

8010693b <vector191>:
.globl vector191
vector191:
  pushl $0
8010693b:	6a 00                	push   $0x0
  pushl $191
8010693d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106942:	e9 b4 f3 ff ff       	jmp    80105cfb <alltraps>

80106947 <vector192>:
.globl vector192
vector192:
  pushl $0
80106947:	6a 00                	push   $0x0
  pushl $192
80106949:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010694e:	e9 a8 f3 ff ff       	jmp    80105cfb <alltraps>

80106953 <vector193>:
.globl vector193
vector193:
  pushl $0
80106953:	6a 00                	push   $0x0
  pushl $193
80106955:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010695a:	e9 9c f3 ff ff       	jmp    80105cfb <alltraps>

8010695f <vector194>:
.globl vector194
vector194:
  pushl $0
8010695f:	6a 00                	push   $0x0
  pushl $194
80106961:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106966:	e9 90 f3 ff ff       	jmp    80105cfb <alltraps>

8010696b <vector195>:
.globl vector195
vector195:
  pushl $0
8010696b:	6a 00                	push   $0x0
  pushl $195
8010696d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106972:	e9 84 f3 ff ff       	jmp    80105cfb <alltraps>

80106977 <vector196>:
.globl vector196
vector196:
  pushl $0
80106977:	6a 00                	push   $0x0
  pushl $196
80106979:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010697e:	e9 78 f3 ff ff       	jmp    80105cfb <alltraps>

80106983 <vector197>:
.globl vector197
vector197:
  pushl $0
80106983:	6a 00                	push   $0x0
  pushl $197
80106985:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010698a:	e9 6c f3 ff ff       	jmp    80105cfb <alltraps>

8010698f <vector198>:
.globl vector198
vector198:
  pushl $0
8010698f:	6a 00                	push   $0x0
  pushl $198
80106991:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106996:	e9 60 f3 ff ff       	jmp    80105cfb <alltraps>

8010699b <vector199>:
.globl vector199
vector199:
  pushl $0
8010699b:	6a 00                	push   $0x0
  pushl $199
8010699d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801069a2:	e9 54 f3 ff ff       	jmp    80105cfb <alltraps>

801069a7 <vector200>:
.globl vector200
vector200:
  pushl $0
801069a7:	6a 00                	push   $0x0
  pushl $200
801069a9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801069ae:	e9 48 f3 ff ff       	jmp    80105cfb <alltraps>

801069b3 <vector201>:
.globl vector201
vector201:
  pushl $0
801069b3:	6a 00                	push   $0x0
  pushl $201
801069b5:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
801069ba:	e9 3c f3 ff ff       	jmp    80105cfb <alltraps>

801069bf <vector202>:
.globl vector202
vector202:
  pushl $0
801069bf:	6a 00                	push   $0x0
  pushl $202
801069c1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801069c6:	e9 30 f3 ff ff       	jmp    80105cfb <alltraps>

801069cb <vector203>:
.globl vector203
vector203:
  pushl $0
801069cb:	6a 00                	push   $0x0
  pushl $203
801069cd:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801069d2:	e9 24 f3 ff ff       	jmp    80105cfb <alltraps>

801069d7 <vector204>:
.globl vector204
vector204:
  pushl $0
801069d7:	6a 00                	push   $0x0
  pushl $204
801069d9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801069de:	e9 18 f3 ff ff       	jmp    80105cfb <alltraps>

801069e3 <vector205>:
.globl vector205
vector205:
  pushl $0
801069e3:	6a 00                	push   $0x0
  pushl $205
801069e5:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801069ea:	e9 0c f3 ff ff       	jmp    80105cfb <alltraps>

801069ef <vector206>:
.globl vector206
vector206:
  pushl $0
801069ef:	6a 00                	push   $0x0
  pushl $206
801069f1:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801069f6:	e9 00 f3 ff ff       	jmp    80105cfb <alltraps>

801069fb <vector207>:
.globl vector207
vector207:
  pushl $0
801069fb:	6a 00                	push   $0x0
  pushl $207
801069fd:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106a02:	e9 f4 f2 ff ff       	jmp    80105cfb <alltraps>

80106a07 <vector208>:
.globl vector208
vector208:
  pushl $0
80106a07:	6a 00                	push   $0x0
  pushl $208
80106a09:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80106a0e:	e9 e8 f2 ff ff       	jmp    80105cfb <alltraps>

80106a13 <vector209>:
.globl vector209
vector209:
  pushl $0
80106a13:	6a 00                	push   $0x0
  pushl $209
80106a15:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80106a1a:	e9 dc f2 ff ff       	jmp    80105cfb <alltraps>

80106a1f <vector210>:
.globl vector210
vector210:
  pushl $0
80106a1f:	6a 00                	push   $0x0
  pushl $210
80106a21:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106a26:	e9 d0 f2 ff ff       	jmp    80105cfb <alltraps>

80106a2b <vector211>:
.globl vector211
vector211:
  pushl $0
80106a2b:	6a 00                	push   $0x0
  pushl $211
80106a2d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106a32:	e9 c4 f2 ff ff       	jmp    80105cfb <alltraps>

80106a37 <vector212>:
.globl vector212
vector212:
  pushl $0
80106a37:	6a 00                	push   $0x0
  pushl $212
80106a39:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80106a3e:	e9 b8 f2 ff ff       	jmp    80105cfb <alltraps>

80106a43 <vector213>:
.globl vector213
vector213:
  pushl $0
80106a43:	6a 00                	push   $0x0
  pushl $213
80106a45:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106a4a:	e9 ac f2 ff ff       	jmp    80105cfb <alltraps>

80106a4f <vector214>:
.globl vector214
vector214:
  pushl $0
80106a4f:	6a 00                	push   $0x0
  pushl $214
80106a51:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106a56:	e9 a0 f2 ff ff       	jmp    80105cfb <alltraps>

80106a5b <vector215>:
.globl vector215
vector215:
  pushl $0
80106a5b:	6a 00                	push   $0x0
  pushl $215
80106a5d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106a62:	e9 94 f2 ff ff       	jmp    80105cfb <alltraps>

80106a67 <vector216>:
.globl vector216
vector216:
  pushl $0
80106a67:	6a 00                	push   $0x0
  pushl $216
80106a69:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80106a6e:	e9 88 f2 ff ff       	jmp    80105cfb <alltraps>

80106a73 <vector217>:
.globl vector217
vector217:
  pushl $0
80106a73:	6a 00                	push   $0x0
  pushl $217
80106a75:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106a7a:	e9 7c f2 ff ff       	jmp    80105cfb <alltraps>

80106a7f <vector218>:
.globl vector218
vector218:
  pushl $0
80106a7f:	6a 00                	push   $0x0
  pushl $218
80106a81:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106a86:	e9 70 f2 ff ff       	jmp    80105cfb <alltraps>

80106a8b <vector219>:
.globl vector219
vector219:
  pushl $0
80106a8b:	6a 00                	push   $0x0
  pushl $219
80106a8d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106a92:	e9 64 f2 ff ff       	jmp    80105cfb <alltraps>

80106a97 <vector220>:
.globl vector220
vector220:
  pushl $0
80106a97:	6a 00                	push   $0x0
  pushl $220
80106a99:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106a9e:	e9 58 f2 ff ff       	jmp    80105cfb <alltraps>

80106aa3 <vector221>:
.globl vector221
vector221:
  pushl $0
80106aa3:	6a 00                	push   $0x0
  pushl $221
80106aa5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106aaa:	e9 4c f2 ff ff       	jmp    80105cfb <alltraps>

80106aaf <vector222>:
.globl vector222
vector222:
  pushl $0
80106aaf:	6a 00                	push   $0x0
  pushl $222
80106ab1:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106ab6:	e9 40 f2 ff ff       	jmp    80105cfb <alltraps>

80106abb <vector223>:
.globl vector223
vector223:
  pushl $0
80106abb:	6a 00                	push   $0x0
  pushl $223
80106abd:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106ac2:	e9 34 f2 ff ff       	jmp    80105cfb <alltraps>

80106ac7 <vector224>:
.globl vector224
vector224:
  pushl $0
80106ac7:	6a 00                	push   $0x0
  pushl $224
80106ac9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106ace:	e9 28 f2 ff ff       	jmp    80105cfb <alltraps>

80106ad3 <vector225>:
.globl vector225
vector225:
  pushl $0
80106ad3:	6a 00                	push   $0x0
  pushl $225
80106ad5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106ada:	e9 1c f2 ff ff       	jmp    80105cfb <alltraps>

80106adf <vector226>:
.globl vector226
vector226:
  pushl $0
80106adf:	6a 00                	push   $0x0
  pushl $226
80106ae1:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106ae6:	e9 10 f2 ff ff       	jmp    80105cfb <alltraps>

80106aeb <vector227>:
.globl vector227
vector227:
  pushl $0
80106aeb:	6a 00                	push   $0x0
  pushl $227
80106aed:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106af2:	e9 04 f2 ff ff       	jmp    80105cfb <alltraps>

80106af7 <vector228>:
.globl vector228
vector228:
  pushl $0
80106af7:	6a 00                	push   $0x0
  pushl $228
80106af9:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106afe:	e9 f8 f1 ff ff       	jmp    80105cfb <alltraps>

80106b03 <vector229>:
.globl vector229
vector229:
  pushl $0
80106b03:	6a 00                	push   $0x0
  pushl $229
80106b05:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106b0a:	e9 ec f1 ff ff       	jmp    80105cfb <alltraps>

80106b0f <vector230>:
.globl vector230
vector230:
  pushl $0
80106b0f:	6a 00                	push   $0x0
  pushl $230
80106b11:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106b16:	e9 e0 f1 ff ff       	jmp    80105cfb <alltraps>

80106b1b <vector231>:
.globl vector231
vector231:
  pushl $0
80106b1b:	6a 00                	push   $0x0
  pushl $231
80106b1d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106b22:	e9 d4 f1 ff ff       	jmp    80105cfb <alltraps>

80106b27 <vector232>:
.globl vector232
vector232:
  pushl $0
80106b27:	6a 00                	push   $0x0
  pushl $232
80106b29:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80106b2e:	e9 c8 f1 ff ff       	jmp    80105cfb <alltraps>

80106b33 <vector233>:
.globl vector233
vector233:
  pushl $0
80106b33:	6a 00                	push   $0x0
  pushl $233
80106b35:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80106b3a:	e9 bc f1 ff ff       	jmp    80105cfb <alltraps>

80106b3f <vector234>:
.globl vector234
vector234:
  pushl $0
80106b3f:	6a 00                	push   $0x0
  pushl $234
80106b41:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106b46:	e9 b0 f1 ff ff       	jmp    80105cfb <alltraps>

80106b4b <vector235>:
.globl vector235
vector235:
  pushl $0
80106b4b:	6a 00                	push   $0x0
  pushl $235
80106b4d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106b52:	e9 a4 f1 ff ff       	jmp    80105cfb <alltraps>

80106b57 <vector236>:
.globl vector236
vector236:
  pushl $0
80106b57:	6a 00                	push   $0x0
  pushl $236
80106b59:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80106b5e:	e9 98 f1 ff ff       	jmp    80105cfb <alltraps>

80106b63 <vector237>:
.globl vector237
vector237:
  pushl $0
80106b63:	6a 00                	push   $0x0
  pushl $237
80106b65:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106b6a:	e9 8c f1 ff ff       	jmp    80105cfb <alltraps>

80106b6f <vector238>:
.globl vector238
vector238:
  pushl $0
80106b6f:	6a 00                	push   $0x0
  pushl $238
80106b71:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106b76:	e9 80 f1 ff ff       	jmp    80105cfb <alltraps>

80106b7b <vector239>:
.globl vector239
vector239:
  pushl $0
80106b7b:	6a 00                	push   $0x0
  pushl $239
80106b7d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106b82:	e9 74 f1 ff ff       	jmp    80105cfb <alltraps>

80106b87 <vector240>:
.globl vector240
vector240:
  pushl $0
80106b87:	6a 00                	push   $0x0
  pushl $240
80106b89:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106b8e:	e9 68 f1 ff ff       	jmp    80105cfb <alltraps>

80106b93 <vector241>:
.globl vector241
vector241:
  pushl $0
80106b93:	6a 00                	push   $0x0
  pushl $241
80106b95:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106b9a:	e9 5c f1 ff ff       	jmp    80105cfb <alltraps>

80106b9f <vector242>:
.globl vector242
vector242:
  pushl $0
80106b9f:	6a 00                	push   $0x0
  pushl $242
80106ba1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106ba6:	e9 50 f1 ff ff       	jmp    80105cfb <alltraps>

80106bab <vector243>:
.globl vector243
vector243:
  pushl $0
80106bab:	6a 00                	push   $0x0
  pushl $243
80106bad:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106bb2:	e9 44 f1 ff ff       	jmp    80105cfb <alltraps>

80106bb7 <vector244>:
.globl vector244
vector244:
  pushl $0
80106bb7:	6a 00                	push   $0x0
  pushl $244
80106bb9:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106bbe:	e9 38 f1 ff ff       	jmp    80105cfb <alltraps>

80106bc3 <vector245>:
.globl vector245
vector245:
  pushl $0
80106bc3:	6a 00                	push   $0x0
  pushl $245
80106bc5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106bca:	e9 2c f1 ff ff       	jmp    80105cfb <alltraps>

80106bcf <vector246>:
.globl vector246
vector246:
  pushl $0
80106bcf:	6a 00                	push   $0x0
  pushl $246
80106bd1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106bd6:	e9 20 f1 ff ff       	jmp    80105cfb <alltraps>

80106bdb <vector247>:
.globl vector247
vector247:
  pushl $0
80106bdb:	6a 00                	push   $0x0
  pushl $247
80106bdd:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106be2:	e9 14 f1 ff ff       	jmp    80105cfb <alltraps>

80106be7 <vector248>:
.globl vector248
vector248:
  pushl $0
80106be7:	6a 00                	push   $0x0
  pushl $248
80106be9:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106bee:	e9 08 f1 ff ff       	jmp    80105cfb <alltraps>

80106bf3 <vector249>:
.globl vector249
vector249:
  pushl $0
80106bf3:	6a 00                	push   $0x0
  pushl $249
80106bf5:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106bfa:	e9 fc f0 ff ff       	jmp    80105cfb <alltraps>

80106bff <vector250>:
.globl vector250
vector250:
  pushl $0
80106bff:	6a 00                	push   $0x0
  pushl $250
80106c01:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106c06:	e9 f0 f0 ff ff       	jmp    80105cfb <alltraps>

80106c0b <vector251>:
.globl vector251
vector251:
  pushl $0
80106c0b:	6a 00                	push   $0x0
  pushl $251
80106c0d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106c12:	e9 e4 f0 ff ff       	jmp    80105cfb <alltraps>

80106c17 <vector252>:
.globl vector252
vector252:
  pushl $0
80106c17:	6a 00                	push   $0x0
  pushl $252
80106c19:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106c1e:	e9 d8 f0 ff ff       	jmp    80105cfb <alltraps>

80106c23 <vector253>:
.globl vector253
vector253:
  pushl $0
80106c23:	6a 00                	push   $0x0
  pushl $253
80106c25:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106c2a:	e9 cc f0 ff ff       	jmp    80105cfb <alltraps>

80106c2f <vector254>:
.globl vector254
vector254:
  pushl $0
80106c2f:	6a 00                	push   $0x0
  pushl $254
80106c31:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106c36:	e9 c0 f0 ff ff       	jmp    80105cfb <alltraps>

80106c3b <vector255>:
.globl vector255
vector255:
  pushl $0
80106c3b:	6a 00                	push   $0x0
  pushl $255
80106c3d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106c42:	e9 b4 f0 ff ff       	jmp    80105cfb <alltraps>
80106c47:	66 90                	xchg   %ax,%ax
80106c49:	66 90                	xchg   %ax,%ax
80106c4b:	66 90                	xchg   %ax,%ax
80106c4d:	66 90                	xchg   %ax,%ax
80106c4f:	90                   	nop

80106c50 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106c50:	55                   	push   %ebp
80106c51:	89 e5                	mov    %esp,%ebp
80106c53:	57                   	push   %edi
80106c54:	56                   	push   %esi
80106c55:	53                   	push   %ebx
80106c56:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106c58:	c1 ea 16             	shr    $0x16,%edx
80106c5b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106c5e:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106c61:	8b 07                	mov    (%edi),%eax
80106c63:	a8 01                	test   $0x1,%al
80106c65:	74 29                	je     80106c90 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106c67:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c6c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106c72:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106c75:	c1 eb 0a             	shr    $0xa,%ebx
80106c78:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
80106c7e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106c81:	5b                   	pop    %ebx
80106c82:	5e                   	pop    %esi
80106c83:	5f                   	pop    %edi
80106c84:	5d                   	pop    %ebp
80106c85:	c3                   	ret    
80106c86:	8d 76 00             	lea    0x0(%esi),%esi
80106c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106c90:	85 c9                	test   %ecx,%ecx
80106c92:	74 2c                	je     80106cc0 <walkpgdir+0x70>
80106c94:	e8 97 b7 ff ff       	call   80102430 <kalloc>
80106c99:	85 c0                	test   %eax,%eax
80106c9b:	89 c6                	mov    %eax,%esi
80106c9d:	74 21                	je     80106cc0 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
80106c9f:	83 ec 04             	sub    $0x4,%esp
80106ca2:	68 00 10 00 00       	push   $0x1000
80106ca7:	6a 00                	push   $0x0
80106ca9:	50                   	push   %eax
80106caa:	e8 c1 dc ff ff       	call   80104970 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106caf:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106cb5:	83 c4 10             	add    $0x10,%esp
80106cb8:	83 c8 07             	or     $0x7,%eax
80106cbb:	89 07                	mov    %eax,(%edi)
80106cbd:	eb b3                	jmp    80106c72 <walkpgdir+0x22>
80106cbf:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106cc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106cc3:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106cc5:	5b                   	pop    %ebx
80106cc6:	5e                   	pop    %esi
80106cc7:	5f                   	pop    %edi
80106cc8:	5d                   	pop    %ebp
80106cc9:	c3                   	ret    
80106cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106cd0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106cd0:	55                   	push   %ebp
80106cd1:	89 e5                	mov    %esp,%ebp
80106cd3:	57                   	push   %edi
80106cd4:	56                   	push   %esi
80106cd5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106cd6:	89 d3                	mov    %edx,%ebx
80106cd8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106cde:	83 ec 1c             	sub    $0x1c,%esp
80106ce1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106ce4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106ce8:	8b 7d 08             	mov    0x8(%ebp),%edi
80106ceb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106cf0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106cf3:	8b 45 0c             	mov    0xc(%ebp),%eax
80106cf6:	29 df                	sub    %ebx,%edi
80106cf8:	83 c8 01             	or     $0x1,%eax
80106cfb:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106cfe:	eb 15                	jmp    80106d15 <mappages+0x45>
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106d00:	f6 00 01             	testb  $0x1,(%eax)
80106d03:	75 45                	jne    80106d4a <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106d05:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106d08:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106d0b:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106d0d:	74 31                	je     80106d40 <mappages+0x70>
      break;
    a += PGSIZE;
80106d0f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106d15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d18:	b9 01 00 00 00       	mov    $0x1,%ecx
80106d1d:	89 da                	mov    %ebx,%edx
80106d1f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106d22:	e8 29 ff ff ff       	call   80106c50 <walkpgdir>
80106d27:	85 c0                	test   %eax,%eax
80106d29:	75 d5                	jne    80106d00 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106d2b:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
80106d2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106d33:	5b                   	pop    %ebx
80106d34:	5e                   	pop    %esi
80106d35:	5f                   	pop    %edi
80106d36:	5d                   	pop    %ebp
80106d37:	c3                   	ret    
80106d38:	90                   	nop
80106d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d40:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80106d43:	31 c0                	xor    %eax,%eax
}
80106d45:	5b                   	pop    %ebx
80106d46:	5e                   	pop    %esi
80106d47:	5f                   	pop    %edi
80106d48:	5d                   	pop    %ebp
80106d49:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106d4a:	83 ec 0c             	sub    $0xc,%esp
80106d4d:	68 84 7f 10 80       	push   $0x80107f84
80106d52:	e8 19 96 ff ff       	call   80100370 <panic>
80106d57:	89 f6                	mov    %esi,%esi
80106d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d60 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106d66:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d6c:	89 c7                	mov    %eax,%edi
80106d6e:	89 d6                	mov    %edx,%esi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106d70:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d76:	83 ec 1c             	sub    $0x1c,%esp
80106d79:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106d7c:	39 d3                	cmp    %edx,%ebx
80106d7e:	72 3f                	jb     80106dbf <deallocuvm.part.0+0x5f>
80106d80:	eb 5e                	jmp    80106de0 <deallocuvm.part.0+0x80>
80106d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
80106d88:	8b 10                	mov    (%eax),%edx
80106d8a:	f6 c2 01             	test   $0x1,%dl
80106d8d:	74 26                	je     80106db5 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106d8f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106d95:	74 54                	je     80106deb <deallocuvm.part.0+0x8b>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106d97:	83 ec 0c             	sub    $0xc,%esp
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
      char *v = P2V(pa);
80106d9a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106da0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(v);
80106da3:	52                   	push   %edx
80106da4:	e8 17 b5 ff ff       	call   801022c0 <kfree>
      *pte = 0;
80106da9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106dac:	83 c4 10             	add    $0x10,%esp
80106daf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106db5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106dbb:	39 f3                	cmp    %esi,%ebx
80106dbd:	73 21                	jae    80106de0 <deallocuvm.part.0+0x80>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106dbf:	31 c9                	xor    %ecx,%ecx
80106dc1:	89 da                	mov    %ebx,%edx
80106dc3:	89 f8                	mov    %edi,%eax
80106dc5:	e8 86 fe ff ff       	call   80106c50 <walkpgdir>
    if(!pte)
80106dca:	85 c0                	test   %eax,%eax
80106dcc:	75 ba                	jne    80106d88 <deallocuvm.part.0+0x28>
      a += (NPTENTRIES - 1) * PGSIZE;
80106dce:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106dd4:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106dda:	39 f3                	cmp    %esi,%ebx
80106ddc:	72 e1                	jb     80106dbf <deallocuvm.part.0+0x5f>
80106dde:	66 90                	xchg   %ax,%ax
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106de0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106de3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106de6:	5b                   	pop    %ebx
80106de7:	5e                   	pop    %esi
80106de8:	5f                   	pop    %edi
80106de9:	5d                   	pop    %ebp
80106dea:	c3                   	ret    
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
80106deb:	83 ec 0c             	sub    $0xc,%esp
80106dee:	68 92 78 10 80       	push   $0x80107892
80106df3:	e8 78 95 ff ff       	call   80100370 <panic>
80106df8:	90                   	nop
80106df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106e00 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106e00:	55                   	push   %ebp
80106e01:	89 e5                	mov    %esp,%ebp
80106e03:	53                   	push   %ebx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106e04:	bb ff ff ff ff       	mov    $0xffffffff,%ebx

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106e09:	83 ec 14             	sub    $0x14,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106e0c:	e8 ff b8 ff ff       	call   80102710 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106e11:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106e17:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106e1c:	8d 48 78             	lea    0x78(%eax),%ecx
80106e1f:	66 89 91 c0 38 11 80 	mov    %dx,-0x7feec740(%ecx)
80106e26:	31 c9                	xor    %ecx,%ecx
80106e28:	66 89 88 3a 39 11 80 	mov    %cx,-0x7feec6c6(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106e2f:	8d 88 80 00 00 00    	lea    0x80(%eax),%ecx
80106e35:	31 d2                	xor    %edx,%edx
80106e37:	66 89 99 c0 38 11 80 	mov    %bx,-0x7feec740(%ecx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106e3e:	8d 88 90 00 00 00    	lea    0x90(%eax),%ecx
80106e44:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106e49:	66 89 90 42 39 11 80 	mov    %dx,-0x7feec6be(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106e50:	31 d2                	xor    %edx,%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106e52:	c6 80 3d 39 11 80 9a 	movb   $0x9a,-0x7feec6c3(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106e59:	66 89 99 c0 38 11 80 	mov    %bx,-0x7feec740(%ecx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106e60:	8d 88 98 00 00 00    	lea    0x98(%eax),%ecx
80106e66:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106e6b:	66 89 90 52 39 11 80 	mov    %dx,-0x7feec6ae(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106e72:	31 d2                	xor    %edx,%edx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106e74:	c6 80 3e 39 11 80 cf 	movb   $0xcf,-0x7feec6c2(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106e7b:	66 89 99 c0 38 11 80 	mov    %bx,-0x7feec740(%ecx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106e82:	8d 88 74 39 11 80    	lea    -0x7feec68c(%eax),%ecx
80106e88:	8d 98 88 00 00 00    	lea    0x88(%eax),%ebx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106e8e:	66 89 90 5a 39 11 80 	mov    %dx,-0x7feec6a6(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106e95:	66 c7 83 c0 38 11 80 	movw   $0x0,-0x7feec740(%ebx)
80106e9c:	00 00 
80106e9e:	8d 93 c0 38 11 80    	lea    -0x7feec740(%ebx),%edx
80106ea4:	89 cb                	mov    %ecx,%ebx
80106ea6:	66 89 88 4a 39 11 80 	mov    %cx,-0x7feec6b6(%eax)
80106ead:	c1 eb 10             	shr    $0x10,%ebx
80106eb0:	c1 e9 18             	shr    $0x18,%ecx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106eb3:	c6 80 45 39 11 80 92 	movb   $0x92,-0x7feec6bb(%eax)
80106eba:	c6 80 46 39 11 80 cf 	movb   $0xcf,-0x7feec6ba(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106ec1:	c6 80 55 39 11 80 fa 	movb   $0xfa,-0x7feec6ab(%eax)
80106ec8:	c6 80 56 39 11 80 cf 	movb   $0xcf,-0x7feec6aa(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106ecf:	c6 80 5d 39 11 80 f2 	movb   $0xf2,-0x7feec6a3(%eax)
80106ed6:	c6 80 5e 39 11 80 cf 	movb   $0xcf,-0x7feec6a2(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106edd:	c6 80 3c 39 11 80 00 	movb   $0x0,-0x7feec6c4(%eax)
80106ee4:	c6 80 3f 39 11 80 00 	movb   $0x0,-0x7feec6c1(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106eeb:	c6 80 44 39 11 80 00 	movb   $0x0,-0x7feec6bc(%eax)
80106ef2:	c6 80 47 39 11 80 00 	movb   $0x0,-0x7feec6b9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106ef9:	c6 80 54 39 11 80 00 	movb   $0x0,-0x7feec6ac(%eax)
80106f00:	c6 80 57 39 11 80 00 	movb   $0x0,-0x7feec6a9(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106f07:	c6 80 5c 39 11 80 00 	movb   $0x0,-0x7feec6a4(%eax)
80106f0e:	c6 80 5f 39 11 80 00 	movb   $0x0,-0x7feec6a1(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106f15:	88 5a 04             	mov    %bl,0x4(%edx)
80106f18:	88 4a 07             	mov    %cl,0x7(%edx)
80106f1b:	c6 42 05 92          	movb   $0x92,0x5(%edx)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106f1f:	b9 37 00 00 00       	mov    $0x37,%ecx
80106f24:	c6 42 06 c0          	movb   $0xc0,0x6(%edx)

  lgdt(c->gdt, sizeof(c->gdt));
80106f28:	8d 90 30 39 11 80    	lea    -0x7feec6d0(%eax),%edx
80106f2e:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  pd[1] = (uint)p;
80106f32:	66 89 55 f4          	mov    %dx,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106f36:	c1 ea 10             	shr    $0x10,%edx
80106f39:	66 89 55 f6          	mov    %dx,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106f3d:	8d 55 f2             	lea    -0xe(%ebp),%edx
80106f40:	0f 01 12             	lgdtl  (%edx)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
80106f43:	ba 18 00 00 00       	mov    $0x18,%edx
80106f48:	8e ea                	mov    %edx,%gs

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106f4a:	05 c0 38 11 80       	add    $0x801138c0,%eax
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106f4f:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106f56:	00 00 00 00 

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106f5a:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
}
80106f60:	83 c4 14             	add    $0x14,%esp
80106f63:	5b                   	pop    %ebx
80106f64:	5d                   	pop    %ebp
80106f65:	c3                   	ret    
80106f66:	8d 76 00             	lea    0x0(%esi),%esi
80106f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f70 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106f70:	55                   	push   %ebp
80106f71:	89 e5                	mov    %esp,%ebp
80106f73:	56                   	push   %esi
80106f74:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106f75:	e8 b6 b4 ff ff       	call   80102430 <kalloc>
80106f7a:	85 c0                	test   %eax,%eax
80106f7c:	89 c6                	mov    %eax,%esi
80106f7e:	74 50                	je     80106fd0 <setupkvm+0x60>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106f80:	83 ec 04             	sub    $0x4,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106f83:	bb 40 b4 10 80       	mov    $0x8010b440,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106f88:	68 00 10 00 00       	push   $0x1000
80106f8d:	6a 00                	push   $0x0
80106f8f:	50                   	push   %eax
80106f90:	e8 db d9 ff ff       	call   80104970 <memset>
80106f95:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106f98:	8b 43 04             	mov    0x4(%ebx),%eax
80106f9b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106f9e:	83 ec 08             	sub    $0x8,%esp
80106fa1:	8b 13                	mov    (%ebx),%edx
80106fa3:	ff 73 0c             	pushl  0xc(%ebx)
80106fa6:	50                   	push   %eax
80106fa7:	29 c1                	sub    %eax,%ecx
80106fa9:	89 f0                	mov    %esi,%eax
80106fab:	e8 20 fd ff ff       	call   80106cd0 <mappages>
80106fb0:	83 c4 10             	add    $0x10,%esp
80106fb3:	85 c0                	test   %eax,%eax
80106fb5:	78 19                	js     80106fd0 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106fb7:	83 c3 10             	add    $0x10,%ebx
80106fba:	81 fb 80 b4 10 80    	cmp    $0x8010b480,%ebx
80106fc0:	72 d6                	jb     80106f98 <setupkvm+0x28>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106fc2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106fc5:	89 f0                	mov    %esi,%eax
80106fc7:	5b                   	pop    %ebx
80106fc8:	5e                   	pop    %esi
80106fc9:	5d                   	pop    %ebp
80106fca:	c3                   	ret    
80106fcb:	90                   	nop
80106fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106fd0:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106fd3:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106fd5:	5b                   	pop    %ebx
80106fd6:	5e                   	pop    %esi
80106fd7:	5d                   	pop    %ebp
80106fd8:	c3                   	ret    
80106fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106fe0 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106fe0:	55                   	push   %ebp
80106fe1:	89 e5                	mov    %esp,%ebp
80106fe3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106fe6:	e8 85 ff ff ff       	call   80106f70 <setupkvm>
80106feb:	a3 44 69 11 80       	mov    %eax,0x80116944
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106ff0:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106ff5:	0f 22 d8             	mov    %eax,%cr3
void
kvmalloc(void)
{
  kpgdir = setupkvm();
  switchkvm();
}
80106ff8:	c9                   	leave  
80106ff9:	c3                   	ret    
80106ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107000 <switchkvm>:
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107000:	a1 44 69 11 80       	mov    0x80116944,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80107005:	55                   	push   %ebp
80107006:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107008:	05 00 00 00 80       	add    $0x80000000,%eax
8010700d:	0f 22 d8             	mov    %eax,%cr3
}
80107010:	5d                   	pop    %ebp
80107011:	c3                   	ret    
80107012:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107020 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80107020:	55                   	push   %ebp
80107021:	89 e5                	mov    %esp,%ebp
80107023:	53                   	push   %ebx
80107024:	83 ec 04             	sub    $0x4,%esp
80107027:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
8010702a:	e8 71 d8 ff ff       	call   801048a0 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
8010702f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107035:	b9 67 00 00 00       	mov    $0x67,%ecx
8010703a:	8d 50 08             	lea    0x8(%eax),%edx
8010703d:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80107044:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
8010704b:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80107052:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80107059:	89 d1                	mov    %edx,%ecx
8010705b:	c1 ea 18             	shr    $0x18,%edx
8010705e:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80107064:	ba 10 00 00 00       	mov    $0x10,%edx
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80107069:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
8010706c:	66 89 50 10          	mov    %dx,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80107070:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80107077:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
8010707d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80107082:	8b 52 08             	mov    0x8(%edx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80107085:	66 89 48 6e          	mov    %cx,0x6e(%eax)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80107089:	81 c2 00 10 00 00    	add    $0x1000,%edx
8010708f:	89 50 0c             	mov    %edx,0xc(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80107092:	b8 30 00 00 00       	mov    $0x30,%eax
80107097:	0f 00 d8             	ltr    %ax
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
8010709a:	8b 43 04             	mov    0x4(%ebx),%eax
8010709d:	85 c0                	test   %eax,%eax
8010709f:	74 11                	je     801070b2 <switchuvm+0x92>
    panic("switchuvm: no pgdir");
  lcr3(V2P(p->pgdir));  // switch to process's address space
801070a1:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801070a6:	0f 22 d8             	mov    %eax,%cr3
  popcli();
}
801070a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801070ac:	c9                   	leave  
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
801070ad:	e9 1e d8 ff ff       	jmp    801048d0 <popcli>
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
801070b2:	83 ec 0c             	sub    $0xc,%esp
801070b5:	68 8a 7f 10 80       	push   $0x80107f8a
801070ba:	e8 b1 92 ff ff       	call   80100370 <panic>
801070bf:	90                   	nop

801070c0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
801070c0:	55                   	push   %ebp
801070c1:	89 e5                	mov    %esp,%ebp
801070c3:	57                   	push   %edi
801070c4:	56                   	push   %esi
801070c5:	53                   	push   %ebx
801070c6:	83 ec 1c             	sub    $0x1c,%esp
801070c9:	8b 75 10             	mov    0x10(%ebp),%esi
801070cc:	8b 45 08             	mov    0x8(%ebp),%eax
801070cf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
801070d2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
801070d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
801070db:	77 49                	ja     80107126 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
801070dd:	e8 4e b3 ff ff       	call   80102430 <kalloc>
  memset(mem, 0, PGSIZE);
801070e2:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
801070e5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
801070e7:	68 00 10 00 00       	push   $0x1000
801070ec:	6a 00                	push   $0x0
801070ee:	50                   	push   %eax
801070ef:	e8 7c d8 ff ff       	call   80104970 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
801070f4:	58                   	pop    %eax
801070f5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801070fb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107100:	5a                   	pop    %edx
80107101:	6a 06                	push   $0x6
80107103:	50                   	push   %eax
80107104:	31 d2                	xor    %edx,%edx
80107106:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107109:	e8 c2 fb ff ff       	call   80106cd0 <mappages>
  memmove(mem, init, sz);
8010710e:	89 75 10             	mov    %esi,0x10(%ebp)
80107111:	89 7d 0c             	mov    %edi,0xc(%ebp)
80107114:	83 c4 10             	add    $0x10,%esp
80107117:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010711a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010711d:	5b                   	pop    %ebx
8010711e:	5e                   	pop    %esi
8010711f:	5f                   	pop    %edi
80107120:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80107121:	e9 fa d8 ff ff       	jmp    80104a20 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80107126:	83 ec 0c             	sub    $0xc,%esp
80107129:	68 9e 7f 10 80       	push   $0x80107f9e
8010712e:	e8 3d 92 ff ff       	call   80100370 <panic>
80107133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107140 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80107140:	55                   	push   %ebp
80107141:	89 e5                	mov    %esp,%ebp
80107143:	57                   	push   %edi
80107144:	56                   	push   %esi
80107145:	53                   	push   %ebx
80107146:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80107149:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80107150:	0f 85 91 00 00 00    	jne    801071e7 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80107156:	8b 75 18             	mov    0x18(%ebp),%esi
80107159:	31 db                	xor    %ebx,%ebx
8010715b:	85 f6                	test   %esi,%esi
8010715d:	75 1a                	jne    80107179 <loaduvm+0x39>
8010715f:	eb 6f                	jmp    801071d0 <loaduvm+0x90>
80107161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107168:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010716e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80107174:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80107177:	76 57                	jbe    801071d0 <loaduvm+0x90>
80107179:	8b 55 0c             	mov    0xc(%ebp),%edx
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
8010717c:	8b 45 08             	mov    0x8(%ebp),%eax
8010717f:	31 c9                	xor    %ecx,%ecx
80107181:	01 da                	add    %ebx,%edx
80107183:	e8 c8 fa ff ff       	call   80106c50 <walkpgdir>
80107188:	85 c0                	test   %eax,%eax
8010718a:	74 4e                	je     801071da <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
8010718c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
8010718e:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80107193:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80107198:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
8010719e:	77 02                	ja     801071a2 <loaduvm+0x62>
801071a0:	89 f7                	mov    %esi,%edi
801071a2:	8b 4d 14             	mov    0x14(%ebp),%ecx
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
801071a5:	05 00 00 00 80       	add    $0x80000000,%eax
801071aa:	57                   	push   %edi
801071ab:	01 d9                	add    %ebx,%ecx
801071ad:	51                   	push   %ecx
801071ae:	50                   	push   %eax
801071af:	ff 75 10             	pushl  0x10(%ebp)
801071b2:	e8 59 a7 ff ff       	call   80101910 <readi>
801071b7:	83 c4 10             	add    $0x10,%esp
801071ba:	39 f8                	cmp    %edi,%eax
801071bc:	74 aa                	je     80107168 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
801071be:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
801071c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
801071c6:	5b                   	pop    %ebx
801071c7:	5e                   	pop    %esi
801071c8:	5f                   	pop    %edi
801071c9:	5d                   	pop    %ebp
801071ca:	c3                   	ret    
801071cb:	90                   	nop
801071cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801071d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
801071d3:	31 c0                	xor    %eax,%eax
}
801071d5:	5b                   	pop    %ebx
801071d6:	5e                   	pop    %esi
801071d7:	5f                   	pop    %edi
801071d8:	5d                   	pop    %ebp
801071d9:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
801071da:	83 ec 0c             	sub    $0xc,%esp
801071dd:	68 b8 7f 10 80       	push   $0x80107fb8
801071e2:	e8 89 91 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
801071e7:	83 ec 0c             	sub    $0xc,%esp
801071ea:	68 5c 80 10 80       	push   $0x8010805c
801071ef:	e8 7c 91 ff ff       	call   80100370 <panic>
801071f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801071fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107200 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80107200:	55                   	push   %ebp
80107201:	89 e5                	mov    %esp,%ebp
80107203:	57                   	push   %edi
80107204:	56                   	push   %esi
80107205:	53                   	push   %ebx
80107206:	83 ec 0c             	sub    $0xc,%esp
80107209:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
8010720c:	85 ff                	test   %edi,%edi
8010720e:	78 7b                	js     8010728b <allocuvm+0x8b>
    return 0;
  if(newsz < oldsz)
80107210:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80107213:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80107216:	72 75                	jb     8010728d <allocuvm+0x8d>
    return oldsz;

  a = PGROUNDUP(oldsz);
80107218:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
8010721e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80107224:	39 df                	cmp    %ebx,%edi
80107226:	77 43                	ja     8010726b <allocuvm+0x6b>
80107228:	eb 6e                	jmp    80107298 <allocuvm+0x98>
8010722a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80107230:	83 ec 04             	sub    $0x4,%esp
80107233:	68 00 10 00 00       	push   $0x1000
80107238:	6a 00                	push   $0x0
8010723a:	50                   	push   %eax
8010723b:	e8 30 d7 ff ff       	call   80104970 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80107240:	58                   	pop    %eax
80107241:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80107247:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010724c:	5a                   	pop    %edx
8010724d:	6a 06                	push   $0x6
8010724f:	50                   	push   %eax
80107250:	89 da                	mov    %ebx,%edx
80107252:	8b 45 08             	mov    0x8(%ebp),%eax
80107255:	e8 76 fa ff ff       	call   80106cd0 <mappages>
8010725a:	83 c4 10             	add    $0x10,%esp
8010725d:	85 c0                	test   %eax,%eax
8010725f:	78 47                	js     801072a8 <allocuvm+0xa8>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80107261:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107267:	39 df                	cmp    %ebx,%edi
80107269:	76 2d                	jbe    80107298 <allocuvm+0x98>
    mem = kalloc();
8010726b:	e8 c0 b1 ff ff       	call   80102430 <kalloc>
    if(mem == 0){
80107270:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80107272:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80107274:	75 ba                	jne    80107230 <allocuvm+0x30>
      cprintf("allocuvm out of memory\n");
80107276:	83 ec 0c             	sub    $0xc,%esp
80107279:	68 d6 7f 10 80       	push   $0x80107fd6
8010727e:	e8 dd 93 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80107283:	83 c4 10             	add    $0x10,%esp
80107286:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107289:	77 4f                	ja     801072da <allocuvm+0xda>
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
8010728b:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
8010728d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107290:	5b                   	pop    %ebx
80107291:	5e                   	pop    %esi
80107292:	5f                   	pop    %edi
80107293:	5d                   	pop    %ebp
80107294:	c3                   	ret    
80107295:	8d 76 00             	lea    0x0(%esi),%esi
80107298:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
8010729b:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
8010729d:	5b                   	pop    %ebx
8010729e:	5e                   	pop    %esi
8010729f:	5f                   	pop    %edi
801072a0:	5d                   	pop    %ebp
801072a1:	c3                   	ret    
801072a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
801072a8:	83 ec 0c             	sub    $0xc,%esp
801072ab:	68 ee 7f 10 80       	push   $0x80107fee
801072b0:	e8 ab 93 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
801072b5:	83 c4 10             	add    $0x10,%esp
801072b8:	3b 7d 0c             	cmp    0xc(%ebp),%edi
801072bb:	76 0d                	jbe    801072ca <allocuvm+0xca>
801072bd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801072c0:	8b 45 08             	mov    0x8(%ebp),%eax
801072c3:	89 fa                	mov    %edi,%edx
801072c5:	e8 96 fa ff ff       	call   80106d60 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
801072ca:	83 ec 0c             	sub    $0xc,%esp
801072cd:	56                   	push   %esi
801072ce:	e8 ed af ff ff       	call   801022c0 <kfree>
      return 0;
801072d3:	83 c4 10             	add    $0x10,%esp
801072d6:	31 c0                	xor    %eax,%eax
801072d8:	eb b3                	jmp    8010728d <allocuvm+0x8d>
801072da:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801072dd:	8b 45 08             	mov    0x8(%ebp),%eax
801072e0:	89 fa                	mov    %edi,%edx
801072e2:	e8 79 fa ff ff       	call   80106d60 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
801072e7:	31 c0                	xor    %eax,%eax
801072e9:	eb a2                	jmp    8010728d <allocuvm+0x8d>
801072eb:	90                   	nop
801072ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801072f0 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
801072f0:	55                   	push   %ebp
801072f1:	89 e5                	mov    %esp,%ebp
801072f3:	8b 55 0c             	mov    0xc(%ebp),%edx
801072f6:	8b 4d 10             	mov    0x10(%ebp),%ecx
801072f9:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
801072fc:	39 d1                	cmp    %edx,%ecx
801072fe:	73 10                	jae    80107310 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80107300:	5d                   	pop    %ebp
80107301:	e9 5a fa ff ff       	jmp    80106d60 <deallocuvm.part.0>
80107306:	8d 76 00             	lea    0x0(%esi),%esi
80107309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107310:	89 d0                	mov    %edx,%eax
80107312:	5d                   	pop    %ebp
80107313:	c3                   	ret    
80107314:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010731a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107320 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107320:	55                   	push   %ebp
80107321:	89 e5                	mov    %esp,%ebp
80107323:	57                   	push   %edi
80107324:	56                   	push   %esi
80107325:	53                   	push   %ebx
80107326:	83 ec 0c             	sub    $0xc,%esp
80107329:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010732c:	85 f6                	test   %esi,%esi
8010732e:	74 5c                	je     8010738c <freevm+0x6c>
80107330:	31 c9                	xor    %ecx,%ecx
80107332:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107337:	89 f0                	mov    %esi,%eax
80107339:	e8 22 fa ff ff       	call   80106d60 <deallocuvm.part.0>
8010733e:	89 f3                	mov    %esi,%ebx
80107340:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107346:	eb 0f                	jmp    80107357 <freevm+0x37>
80107348:	90                   	nop
80107349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107350:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107353:	39 fb                	cmp    %edi,%ebx
80107355:	74 26                	je     8010737d <freevm+0x5d>
    if(pgdir[i] & PTE_P){
80107357:	8b 13                	mov    (%ebx),%edx
80107359:	f6 c2 01             	test   $0x1,%dl
8010735c:	74 f2                	je     80107350 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
8010735e:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
      kfree(v);
80107364:	83 ec 0c             	sub    $0xc,%esp
80107367:	83 c3 04             	add    $0x4,%ebx
  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
8010736a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
80107370:	52                   	push   %edx
80107371:	e8 4a af ff ff       	call   801022c0 <kfree>
80107376:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107379:	39 fb                	cmp    %edi,%ebx
8010737b:	75 da                	jne    80107357 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
8010737d:	89 75 08             	mov    %esi,0x8(%ebp)
}
80107380:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107383:	5b                   	pop    %ebx
80107384:	5e                   	pop    %esi
80107385:	5f                   	pop    %edi
80107386:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80107387:	e9 34 af ff ff       	jmp    801022c0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
8010738c:	83 ec 0c             	sub    $0xc,%esp
8010738f:	68 0a 80 10 80       	push   $0x8010800a
80107394:	e8 d7 8f ff ff       	call   80100370 <panic>
80107399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801073a0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801073a0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801073a1:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801073a3:	89 e5                	mov    %esp,%ebp
801073a5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801073a8:	8b 55 0c             	mov    0xc(%ebp),%edx
801073ab:	8b 45 08             	mov    0x8(%ebp),%eax
801073ae:	e8 9d f8 ff ff       	call   80106c50 <walkpgdir>
  if(pte == 0)
801073b3:	85 c0                	test   %eax,%eax
801073b5:	74 05                	je     801073bc <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801073b7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801073ba:	c9                   	leave  
801073bb:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
801073bc:	83 ec 0c             	sub    $0xc,%esp
801073bf:	68 1b 80 10 80       	push   $0x8010801b
801073c4:	e8 a7 8f ff ff       	call   80100370 <panic>
801073c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801073d0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801073d0:	55                   	push   %ebp
801073d1:	89 e5                	mov    %esp,%ebp
801073d3:	57                   	push   %edi
801073d4:	56                   	push   %esi
801073d5:	53                   	push   %ebx
801073d6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801073d9:	e8 92 fb ff ff       	call   80106f70 <setupkvm>
801073de:	85 c0                	test   %eax,%eax
801073e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801073e3:	0f 84 b2 00 00 00    	je     8010749b <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801073e9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801073ec:	85 c9                	test   %ecx,%ecx
801073ee:	0f 84 9c 00 00 00    	je     80107490 <copyuvm+0xc0>
801073f4:	31 f6                	xor    %esi,%esi
801073f6:	eb 4a                	jmp    80107442 <copyuvm+0x72>
801073f8:	90                   	nop
801073f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107400:	83 ec 04             	sub    $0x4,%esp
80107403:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107409:	68 00 10 00 00       	push   $0x1000
8010740e:	57                   	push   %edi
8010740f:	50                   	push   %eax
80107410:	e8 0b d6 ff ff       	call   80104a20 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80107415:	58                   	pop    %eax
80107416:	5a                   	pop    %edx
80107417:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
8010741d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107420:	ff 75 e4             	pushl  -0x1c(%ebp)
80107423:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107428:	52                   	push   %edx
80107429:	89 f2                	mov    %esi,%edx
8010742b:	e8 a0 f8 ff ff       	call   80106cd0 <mappages>
80107430:	83 c4 10             	add    $0x10,%esp
80107433:	85 c0                	test   %eax,%eax
80107435:	78 3e                	js     80107475 <copyuvm+0xa5>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107437:	81 c6 00 10 00 00    	add    $0x1000,%esi
8010743d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80107440:	76 4e                	jbe    80107490 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107442:	8b 45 08             	mov    0x8(%ebp),%eax
80107445:	31 c9                	xor    %ecx,%ecx
80107447:	89 f2                	mov    %esi,%edx
80107449:	e8 02 f8 ff ff       	call   80106c50 <walkpgdir>
8010744e:	85 c0                	test   %eax,%eax
80107450:	74 5a                	je     801074ac <copyuvm+0xdc>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80107452:	8b 18                	mov    (%eax),%ebx
80107454:	f6 c3 01             	test   $0x1,%bl
80107457:	74 46                	je     8010749f <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80107459:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
8010745b:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80107461:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80107464:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
8010746a:	e8 c1 af ff ff       	call   80102430 <kalloc>
8010746f:	85 c0                	test   %eax,%eax
80107471:	89 c3                	mov    %eax,%ebx
80107473:	75 8b                	jne    80107400 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80107475:	83 ec 0c             	sub    $0xc,%esp
80107478:	ff 75 e0             	pushl  -0x20(%ebp)
8010747b:	e8 a0 fe ff ff       	call   80107320 <freevm>
  return 0;
80107480:	83 c4 10             	add    $0x10,%esp
80107483:	31 c0                	xor    %eax,%eax
}
80107485:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107488:	5b                   	pop    %ebx
80107489:	5e                   	pop    %esi
8010748a:	5f                   	pop    %edi
8010748b:	5d                   	pop    %ebp
8010748c:	c3                   	ret    
8010748d:	8d 76 00             	lea    0x0(%esi),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107490:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80107493:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107496:	5b                   	pop    %ebx
80107497:	5e                   	pop    %esi
80107498:	5f                   	pop    %edi
80107499:	5d                   	pop    %ebp
8010749a:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
8010749b:	31 c0                	xor    %eax,%eax
8010749d:	eb e6                	jmp    80107485 <copyuvm+0xb5>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
8010749f:	83 ec 0c             	sub    $0xc,%esp
801074a2:	68 3f 80 10 80       	push   $0x8010803f
801074a7:	e8 c4 8e ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
801074ac:	83 ec 0c             	sub    $0xc,%esp
801074af:	68 25 80 10 80       	push   $0x80108025
801074b4:	e8 b7 8e ff ff       	call   80100370 <panic>
801074b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801074c0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801074c0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801074c1:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801074c3:	89 e5                	mov    %esp,%ebp
801074c5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801074c8:	8b 55 0c             	mov    0xc(%ebp),%edx
801074cb:	8b 45 08             	mov    0x8(%ebp),%eax
801074ce:	e8 7d f7 ff ff       	call   80106c50 <walkpgdir>
  if((*pte & PTE_P) == 0)
801074d3:	8b 00                	mov    (%eax),%eax
801074d5:	89 c2                	mov    %eax,%edx
801074d7:	83 e2 05             	and    $0x5,%edx
    return 0;
  if((*pte & PTE_U) == 0)
801074da:	83 fa 05             	cmp    $0x5,%edx
801074dd:	75 11                	jne    801074f0 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
801074df:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
801074e4:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
801074e5:	05 00 00 00 80       	add    $0x80000000,%eax
}
801074ea:	c3                   	ret    
801074eb:	90                   	nop
801074ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
801074f0:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
801074f2:	c9                   	leave  
801074f3:	c3                   	ret    
801074f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801074fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107500 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107500:	55                   	push   %ebp
80107501:	89 e5                	mov    %esp,%ebp
80107503:	57                   	push   %edi
80107504:	56                   	push   %esi
80107505:	53                   	push   %ebx
80107506:	83 ec 1c             	sub    $0x1c,%esp
80107509:	8b 75 14             	mov    0x14(%ebp),%esi
8010750c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010750f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107512:	85 f6                	test   %esi,%esi
80107514:	75 41                	jne    80107557 <copyout+0x57>
80107516:	eb 70                	jmp    80107588 <copyout+0x88>
80107518:	90                   	nop
80107519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107520:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107523:	89 d9                	mov    %ebx,%ecx
80107525:	29 d1                	sub    %edx,%ecx
80107527:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010752d:	39 f1                	cmp    %esi,%ecx
8010752f:	76 02                	jbe    80107533 <copyout+0x33>
80107531:	89 f1                	mov    %esi,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107533:	29 da                	sub    %ebx,%edx
80107535:	83 ec 04             	sub    $0x4,%esp
80107538:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010753b:	01 d0                	add    %edx,%eax
8010753d:	51                   	push   %ecx
8010753e:	57                   	push   %edi
8010753f:	50                   	push   %eax
80107540:	e8 db d4 ff ff       	call   80104a20 <memmove>
    len -= n;
    buf += n;
80107545:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107548:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
8010754b:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80107551:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107553:	29 ce                	sub    %ecx,%esi
80107555:	74 31                	je     80107588 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107557:	89 d3                	mov    %edx,%ebx
    pa0 = uva2ka(pgdir, (char*)va0);
80107559:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
8010755c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010755f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    pa0 = uva2ka(pgdir, (char*)va0);
80107565:	53                   	push   %ebx
80107566:	ff 75 08             	pushl  0x8(%ebp)
80107569:	e8 52 ff ff ff       	call   801074c0 <uva2ka>
    if(pa0 == 0)
8010756e:	83 c4 10             	add    $0x10,%esp
80107571:	85 c0                	test   %eax,%eax
80107573:	75 ab                	jne    80107520 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80107575:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80107578:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
8010757d:	5b                   	pop    %ebx
8010757e:	5e                   	pop    %esi
8010757f:	5f                   	pop    %edi
80107580:	5d                   	pop    %ebp
80107581:	c3                   	ret    
80107582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107588:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
8010758b:	31 c0                	xor    %eax,%eax
}
8010758d:	5b                   	pop    %ebx
8010758e:	5e                   	pop    %esi
8010758f:	5f                   	pop    %edi
80107590:	5d                   	pop    %ebp
80107591:	c3                   	ret    
80107592:	66 90                	xchg   %ax,%ax
80107594:	66 90                	xchg   %ax,%ax
80107596:	66 90                	xchg   %ax,%ax
80107598:	66 90                	xchg   %ax,%ax
8010759a:	66 90                	xchg   %ax,%ax
8010759c:	66 90                	xchg   %ax,%ax
8010759e:	66 90                	xchg   %ax,%ax

801075a0 <lock_init>:
  // the xchg function swaps the values of two variables
  // this primitive operation serves as the locking mechanism
  return result;
}

int lock_init(struct lock_t *lk) { 
801075a0:	55                   	push   %ebp
801075a1:	89 e5                	mov    %esp,%ebp
801075a3:	8b 45 08             	mov    0x8(%ebp),%eax
  // initialize the lock
  if (lk) {
801075a6:	85 c0                	test   %eax,%eax
801075a8:	74 0d                	je     801075b7 <lock_init+0x17>
    lk->lock = 0;
801075aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    return 1;
801075b0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    // just return an error, if lock ref is null
    return -1; 
  }
}
801075b5:	5d                   	pop    %ebp
801075b6:	c3                   	ret    
  if (lk) {
    lk->lock = 0;
    return 1;
  } else {
    // just return an error, if lock ref is null
    return -1; 
801075b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
801075bc:	5d                   	pop    %ebp
801075bd:	c3                   	ret    
801075be:	66 90                	xchg   %ax,%ax

801075c0 <lock_acquire>:

int lock_acquire(struct lock_t *lk) {
801075c0:	55                   	push   %ebp

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801075c1:	b8 01 00 00 00       	mov    $0x1,%eax
    // just return an error, if lock ref is null
    return -1; 
  }
}

int lock_acquire(struct lock_t *lk) {
801075c6:	89 e5                	mov    %esp,%ebp
801075c8:	56                   	push   %esi
801075c9:	53                   	push   %ebx
801075ca:	8b 5d 08             	mov    0x8(%ebp),%ebx

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801075cd:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
801075d0:	85 c0                	test   %eax,%eax

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801075d2:	be 01 00 00 00       	mov    $0x1,%esi
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
801075d7:	74 1d                	je     801075f6 <lock_acquire+0x36>
801075d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // use sleep to yield to the scheduler
    sleep(1);
801075e0:	83 ec 0c             	sub    $0xc,%esp
801075e3:	6a 01                	push   $0x1
801075e5:	e8 66 c8 ff ff       	call   80103e50 <sleep>

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801075ea:	89 f0                	mov    %esi,%eax
801075ec:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
801075ef:	83 c4 10             	add    $0x10,%esp
801075f2:	85 c0                	test   %eax,%eax
801075f4:	75 ea                	jne    801075e0 <lock_acquire+0x20>
    // use sleep to yield to the scheduler
    sleep(1);
  }
  return 1;
}
801075f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801075f9:	b8 01 00 00 00       	mov    $0x1,%eax
801075fe:	5b                   	pop    %ebx
801075ff:	5e                   	pop    %esi
80107600:	5d                   	pop    %ebp
80107601:	c3                   	ret    
80107602:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107610 <lock_release>:

int lock_release(struct lock_t *lk) {
80107610:	55                   	push   %ebp
80107611:	89 e5                	mov    %esp,%ebp
  // release lock by setting binary val to zero
  lk->lock = 0;
80107613:	8b 45 08             	mov    0x8(%ebp),%eax
80107616:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 1;
}
8010761c:	b8 01 00 00 00       	mov    $0x1,%eax
80107621:	5d                   	pop    %ebp
80107622:	c3                   	ret    
