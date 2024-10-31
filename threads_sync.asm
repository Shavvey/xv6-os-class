
_threads_sync:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "Done s:%x\n", b->name);
    thread_exit();
   return;
}

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 64             	sub    $0x64,%esp
  // initialize lock and zero out balance
  total.balance = 0;
  14:	c7 05 10 0d 00 00 00 	movl   $0x0,0xd10
  1b:	00 00 00 
  if(lock_init(&total.lock) < 0) {
  1e:	68 14 0d 00 00       	push   $0xd14
  23:	e8 88 08 00 00       	call   8b0 <lock_init>
  28:	83 c4 10             	add    $0x10,%esp
  2b:	85 c0                	test   %eax,%eax
  2d:	0f 88 b2 00 00 00    	js     e5 <main+0xe5>
    printf(2,"Could not intialize mutex!");
    exit();
  }
  struct balance b1 = {"b1", 3200};
  33:	c7 45 a0 62 31 00 00 	movl   $0x3162,-0x60(%ebp)
  3a:	31 c0                	xor    %eax,%eax
  3c:	c7 44 05 a4 00 00 00 	movl   $0x0,-0x5c(%ebp,%eax,1)
  43:	00 
  44:	83 c0 04             	add    $0x4,%eax
  47:	83 f8 1c             	cmp    $0x1c,%eax
  4a:	72 f0                	jb     3c <main+0x3c>
  4c:	c7 45 c0 80 0c 00 00 	movl   $0xc80,-0x40(%ebp)
  struct balance b2 = {"b2", 2800};
  53:	c7 45 c4 62 32 00 00 	movl   $0x3262,-0x3c(%ebp)
  5a:	31 c0                	xor    %eax,%eax
  5c:	c7 44 05 c8 00 00 00 	movl   $0x0,-0x38(%ebp,%eax,1)
  63:	00 
  64:	83 c0 04             	add    $0x4,%eax
  67:	83 f8 1c             	cmp    $0x1c,%eax
  6a:	72 f0                	jb     5c <main+0x5c>
  void *s1, *s2;
  int t1, t2, r1, r2;
  s1 = malloc(4096);
  6c:	83 ec 0c             	sub    $0xc,%esp
  if(lock_init(&total.lock) < 0) {
    printf(2,"Could not intialize mutex!");
    exit();
  }
  struct balance b1 = {"b1", 3200};
  struct balance b2 = {"b2", 2800};
  6f:	c7 45 e4 f0 0a 00 00 	movl   $0xaf0,-0x1c(%ebp)
  void *s1, *s2;
  int t1, t2, r1, r2;
  s1 = malloc(4096);
  76:	68 00 10 00 00       	push   $0x1000
  7b:	e8 40 07 00 00       	call   7c0 <malloc>
  s2 = malloc(4096);
  80:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  }
  struct balance b1 = {"b1", 3200};
  struct balance b2 = {"b2", 2800};
  void *s1, *s2;
  int t1, t2, r1, r2;
  s1 = malloc(4096);
  87:	89 c3                	mov    %eax,%ebx
  s2 = malloc(4096);
  89:	e8 32 07 00 00       	call   7c0 <malloc>
  8e:	89 c6                	mov    %eax,%esi
  t1 = thread_create(do_work, s1, (void*)&b1);
  90:	8d 45 a0             	lea    -0x60(%ebp),%eax
  93:	83 c4 0c             	add    $0xc,%esp
  96:	50                   	push   %eax
  97:	53                   	push   %ebx
  98:	68 00 01 00 00       	push   $0x100
  9d:	e8 08 04 00 00       	call   4aa <thread_create>
  a2:	89 c3                	mov    %eax,%ebx
  t2 = thread_create(do_work, s2, (void*)&b2); 
  a4:	8d 45 c4             	lea    -0x3c(%ebp),%eax
  a7:	83 c4 0c             	add    $0xc,%esp
  aa:	50                   	push   %eax
  ab:	56                   	push   %esi
  ac:	68 00 01 00 00       	push   $0x100
  b1:	e8 f4 03 00 00       	call   4aa <thread_create>
  b6:	89 c7                	mov    %eax,%edi
  r1 = thread_join();
  b8:	e8 fd 03 00 00       	call   4ba <thread_join>
  bd:	89 c6                	mov    %eax,%esi
  r2 = thread_join();
  bf:	e8 f6 03 00 00       	call   4ba <thread_join>
  printf(1, "Threads finished: (%d):%d, (%d):%d, shared balance:%d\n", 
  c4:	83 c4 0c             	add    $0xc,%esp
  c7:	ff 35 10 0d 00 00    	pushl  0xd10
  cd:	50                   	push   %eax
  ce:	57                   	push   %edi
  cf:	56                   	push   %esi
  d0:	53                   	push   %ebx
  d1:	68 74 09 00 00       	push   $0x974
  d6:	6a 01                	push   $0x1
  d8:	e8 93 04 00 00       	call   570 <printf>
      t1, r1, t2, r2, total.balance);
  exit();
  dd:	83 c4 20             	add    $0x20,%esp
  e0:	e8 0d 03 00 00       	call   3f2 <exit>

int main(int argc, char *argv[]) {
  // initialize lock and zero out balance
  total.balance = 0;
  if(lock_init(&total.lock) < 0) {
    printf(2,"Could not intialize mutex!");
  e5:	50                   	push   %eax
  e6:	50                   	push   %eax
  e7:	68 57 09 00 00       	push   $0x957
  ec:	6a 02                	push   $0x2
  ee:	e8 7d 04 00 00       	call   570 <printf>
    exit();
  f3:	e8 fa 02 00 00       	call   3f2 <exit>
  f8:	66 90                	xchg   %ax,%ax
  fa:	66 90                	xchg   %ax,%ax
  fc:	66 90                	xchg   %ax,%ax
  fe:	66 90                	xchg   %ax,%ax

00000100 <do_work>:
   for (i = 0; i < d; i++) {
       __asm volatile( "nop" ::: );
   }
   return i;   
}
void do_work(void *arg){
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	56                   	push   %esi
 104:	53                   	push   %ebx
 105:	8b 75 08             	mov    0x8(%ebp),%esi
    int i; 
    int old;
    struct balance *b = (struct balance*) arg; 
    printf(1, "Starting do_work: s:%s\n", b->name);

    for (i = 0; i < b->amount; i++) { 
 108:	31 db                	xor    %ebx,%ebx
}
void do_work(void *arg){
    int i; 
    int old;
    struct balance *b = (struct balance*) arg; 
    printf(1, "Starting do_work: s:%s\n", b->name);
 10a:	83 ec 04             	sub    $0x4,%esp
 10d:	56                   	push   %esi
 10e:	68 34 09 00 00       	push   $0x934
 113:	6a 01                	push   $0x1
 115:	e8 56 04 00 00       	call   570 <printf>

    for (i = 0; i < b->amount; i++) { 
 11a:	8b 46 20             	mov    0x20(%esi),%eax
 11d:	83 c4 10             	add    $0x10,%esp
 120:	85 c0                	test   %eax,%eax
 122:	7e 4a                	jle    16e <do_work+0x6e>
 124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
         lock_acquire(&total.lock);
 128:	83 ec 0c             	sub    $0xc,%esp
 12b:	68 14 0d 00 00       	push   $0xd14
 130:	e8 9b 07 00 00       	call   8d0 <lock_acquire>
         old = total.balance;
 135:	8b 15 10 0d 00 00    	mov    0xd10,%edx
 13b:	83 c4 10             	add    $0x10,%esp
 13e:	b8 a0 86 01 00       	mov    $0x186a0,%eax
 143:	90                   	nop
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
struct total_balance total;

volatile unsigned int delay (unsigned int d) {
   unsigned int i; 
   for (i = 0; i < d; i++) {
       __asm volatile( "nop" ::: );
 148:	90                   	nop

struct total_balance total;

volatile unsigned int delay (unsigned int d) {
   unsigned int i; 
   for (i = 0; i < d; i++) {
 149:	83 e8 01             	sub    $0x1,%eax
 14c:	75 fa                	jne    148 <do_work+0x48>
    for (i = 0; i < b->amount; i++) { 
         lock_acquire(&total.lock);
         old = total.balance;
         delay(100000);
         total.balance = old + 1;
         lock_release(&total.lock);
 14e:	83 ec 0c             	sub    $0xc,%esp

    for (i = 0; i < b->amount; i++) { 
         lock_acquire(&total.lock);
         old = total.balance;
         delay(100000);
         total.balance = old + 1;
 151:	8d 42 01             	lea    0x1(%edx),%eax
    int i; 
    int old;
    struct balance *b = (struct balance*) arg; 
    printf(1, "Starting do_work: s:%s\n", b->name);

    for (i = 0; i < b->amount; i++) { 
 154:	83 c3 01             	add    $0x1,%ebx
         lock_acquire(&total.lock);
         old = total.balance;
         delay(100000);
         total.balance = old + 1;
         lock_release(&total.lock);
 157:	68 14 0d 00 00       	push   $0xd14

    for (i = 0; i < b->amount; i++) { 
         lock_acquire(&total.lock);
         old = total.balance;
         delay(100000);
         total.balance = old + 1;
 15c:	a3 10 0d 00 00       	mov    %eax,0xd10
         lock_release(&total.lock);
 161:	e8 ba 07 00 00       	call   920 <lock_release>
    int i; 
    int old;
    struct balance *b = (struct balance*) arg; 
    printf(1, "Starting do_work: s:%s\n", b->name);

    for (i = 0; i < b->amount; i++) { 
 166:	83 c4 10             	add    $0x10,%esp
 169:	39 5e 20             	cmp    %ebx,0x20(%esi)
 16c:	7f ba                	jg     128 <do_work+0x28>
         old = total.balance;
         delay(100000);
         total.balance = old + 1;
         lock_release(&total.lock);
    }
    printf(1, "Done s:%x\n", b->name);
 16e:	83 ec 04             	sub    $0x4,%esp
 171:	56                   	push   %esi
 172:	68 4c 09 00 00       	push   $0x94c
 177:	6a 01                	push   $0x1
 179:	e8 f2 03 00 00       	call   570 <printf>
    thread_exit();
 17e:	e8 2f 03 00 00       	call   4b2 <thread_exit>
 183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <delay>:
  struct lock_t lock;
};

struct total_balance total;

volatile unsigned int delay (unsigned int d) {
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 45 08             	mov    0x8(%ebp),%eax
   unsigned int i; 
   for (i = 0; i < d; i++) {
 196:	85 c0                	test   %eax,%eax
 198:	74 0e                	je     1a8 <delay+0x18>
 19a:	31 d2                	xor    %edx,%edx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
       __asm volatile( "nop" ::: );
 1a0:	90                   	nop

struct total_balance total;

volatile unsigned int delay (unsigned int d) {
   unsigned int i; 
   for (i = 0; i < d; i++) {
 1a1:	83 c2 01             	add    $0x1,%edx
 1a4:	39 c2                	cmp    %eax,%edx
 1a6:	75 f8                	jne    1a0 <delay+0x10>
       __asm volatile( "nop" ::: );
   }
   return i;   
}
 1a8:	5d                   	pop    %ebp
 1a9:	c3                   	ret    
 1aa:	66 90                	xchg   %ax,%ax
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ba:	89 c2                	mov    %eax,%edx
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c0:	83 c1 01             	add    $0x1,%ecx
 1c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1c7:	83 c2 01             	add    $0x1,%edx
 1ca:	84 db                	test   %bl,%bl
 1cc:	88 5a ff             	mov    %bl,-0x1(%edx)
 1cf:	75 ef                	jne    1c0 <strcpy+0x10>
    ;
  return os;
}
 1d1:	5b                   	pop    %ebx
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
 1d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
 1e5:	8b 55 08             	mov    0x8(%ebp),%edx
 1e8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1eb:	0f b6 02             	movzbl (%edx),%eax
 1ee:	0f b6 19             	movzbl (%ecx),%ebx
 1f1:	84 c0                	test   %al,%al
 1f3:	75 1e                	jne    213 <strcmp+0x33>
 1f5:	eb 29                	jmp    220 <strcmp+0x40>
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 200:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 203:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 206:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 209:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 20d:	84 c0                	test   %al,%al
 20f:	74 0f                	je     220 <strcmp+0x40>
 211:	89 f1                	mov    %esi,%ecx
 213:	38 d8                	cmp    %bl,%al
 215:	74 e9                	je     200 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 217:	29 d8                	sub    %ebx,%eax
}
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 220:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 222:	29 d8                	sub    %ebx,%eax
}
 224:	5b                   	pop    %ebx
 225:	5e                   	pop    %esi
 226:	5d                   	pop    %ebp
 227:	c3                   	ret    
 228:	90                   	nop
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <strlen>:

uint
strlen(char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 236:	80 39 00             	cmpb   $0x0,(%ecx)
 239:	74 12                	je     24d <strlen+0x1d>
 23b:	31 d2                	xor    %edx,%edx
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c2 01             	add    $0x1,%edx
 243:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 247:	89 d0                	mov    %edx,%eax
 249:	75 f5                	jne    240 <strlen+0x10>
    ;
  return n;
}
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 24d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	eb 0d                	jmp    260 <memset>
 253:	90                   	nop
 254:	90                   	nop
 255:	90                   	nop
 256:	90                   	nop
 257:	90                   	nop
 258:	90                   	nop
 259:	90                   	nop
 25a:	90                   	nop
 25b:	90                   	nop
 25c:	90                   	nop
 25d:	90                   	nop
 25e:	90                   	nop
 25f:	90                   	nop

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 272:	89 d0                	mov    %edx,%eax
 274:	5f                   	pop    %edi
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 45 08             	mov    0x8(%ebp),%eax
 287:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 28a:	0f b6 18             	movzbl (%eax),%ebx
 28d:	84 db                	test   %bl,%bl
 28f:	74 1d                	je     2ae <strchr+0x2e>
    if(*s == c)
 291:	38 d3                	cmp    %dl,%bl
 293:	89 d1                	mov    %edx,%ecx
 295:	75 0d                	jne    2a4 <strchr+0x24>
 297:	eb 17                	jmp    2b0 <strchr+0x30>
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a0:	38 ca                	cmp    %cl,%dl
 2a2:	74 0c                	je     2b0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2a4:	83 c0 01             	add    $0x1,%eax
 2a7:	0f b6 10             	movzbl (%eax),%edx
 2aa:	84 d2                	test   %dl,%dl
 2ac:	75 f2                	jne    2a0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2ae:	31 c0                	xor    %eax,%eax
}
 2b0:	5b                   	pop    %ebx
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
 2c5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 2c8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 2cb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ce:	eb 29                	jmp    2f9 <gets+0x39>
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	6a 01                	push   $0x1
 2d5:	57                   	push   %edi
 2d6:	6a 00                	push   $0x0
 2d8:	e8 2d 01 00 00       	call   40a <read>
    if(cc < 1)
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	85 c0                	test   %eax,%eax
 2e2:	7e 1d                	jle    301 <gets+0x41>
      break;
    buf[i++] = c;
 2e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
 2eb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 2ed:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2ef:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2f3:	74 1b                	je     310 <gets+0x50>
 2f5:	3c 0a                	cmp    $0xa,%al
 2f7:	74 17                	je     310 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f9:	8d 5e 01             	lea    0x1(%esi),%ebx
 2fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ff:	7c cf                	jl     2d0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 308:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5f                   	pop    %edi
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	89 de                	mov    %ebx,%esi
 315:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 319:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31c:	5b                   	pop    %ebx
 31d:	5e                   	pop    %esi
 31e:	5f                   	pop    %edi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	eb 0d                	jmp    330 <stat>
 323:	90                   	nop
 324:	90                   	nop
 325:	90                   	nop
 326:	90                   	nop
 327:	90                   	nop
 328:	90                   	nop
 329:	90                   	nop
 32a:	90                   	nop
 32b:	90                   	nop
 32c:	90                   	nop
 32d:	90                   	nop
 32e:	90                   	nop
 32f:	90                   	nop

00000330 <stat>:

int
stat(char *n, struct stat *st)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	pushl  0x8(%ebp)
 33d:	e8 f0 00 00 00       	call   432 <open>
  if(fd < 0)
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 347:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 349:	78 25                	js     370 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 34b:	83 ec 08             	sub    $0x8,%esp
 34e:	ff 75 0c             	pushl  0xc(%ebp)
 351:	50                   	push   %eax
 352:	e8 f3 00 00 00       	call   44a <fstat>
 357:	89 c6                	mov    %eax,%esi
  close(fd);
 359:	89 1c 24             	mov    %ebx,(%esp)
 35c:	e8 b9 00 00 00       	call   41a <close>
  return r;
 361:	83 c4 10             	add    $0x10,%esp
 364:	89 f0                	mov    %esi,%eax
}
 366:	8d 65 f8             	lea    -0x8(%ebp),%esp
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 370:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 375:	eb ef                	jmp    366 <stat+0x36>
 377:	89 f6                	mov    %esi,%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 387:	0f be 11             	movsbl (%ecx),%edx
 38a:	8d 42 d0             	lea    -0x30(%edx),%eax
 38d:	3c 09                	cmp    $0x9,%al
 38f:	b8 00 00 00 00       	mov    $0x0,%eax
 394:	77 1f                	ja     3b5 <atoi+0x35>
 396:	8d 76 00             	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3a3:	83 c1 01             	add    $0x1,%ecx
 3a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3aa:	0f be 11             	movsbl (%ecx),%edx
 3ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3b5:	5b                   	pop    %ebx
 3b6:	5d                   	pop    %ebp
 3b7:	c3                   	ret    
 3b8:	90                   	nop
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3c0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c1:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	56                   	push   %esi
 3c6:	53                   	push   %ebx
 3c7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ca:	8b 45 08             	mov    0x8(%ebp),%eax
 3cd:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d0:	85 db                	test   %ebx,%ebx
 3d2:	7e 12                	jle    3e6 <memmove+0x26>
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3df:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3e2:	39 da                	cmp    %ebx,%edx
 3e4:	75 f2                	jne    3d8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3e6:	5b                   	pop    %ebx
 3e7:	5e                   	pop    %esi
 3e8:	5d                   	pop    %ebp
 3e9:	c3                   	ret    

000003ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ea:	b8 01 00 00 00       	mov    $0x1,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <exit>:
SYSCALL(exit)
 3f2:	b8 02 00 00 00       	mov    $0x2,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <wait>:
SYSCALL(wait)
 3fa:	b8 03 00 00 00       	mov    $0x3,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <pipe>:
SYSCALL(pipe)
 402:	b8 04 00 00 00       	mov    $0x4,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <read>:
SYSCALL(read)
 40a:	b8 05 00 00 00       	mov    $0x5,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <write>:
SYSCALL(write)
 412:	b8 10 00 00 00       	mov    $0x10,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <close>:
SYSCALL(close)
 41a:	b8 15 00 00 00       	mov    $0x15,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <kill>:
SYSCALL(kill)
 422:	b8 06 00 00 00       	mov    $0x6,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <exec>:
SYSCALL(exec)
 42a:	b8 07 00 00 00       	mov    $0x7,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <open>:
SYSCALL(open)
 432:	b8 0f 00 00 00       	mov    $0xf,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <mknod>:
SYSCALL(mknod)
 43a:	b8 11 00 00 00       	mov    $0x11,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <unlink>:
SYSCALL(unlink)
 442:	b8 12 00 00 00       	mov    $0x12,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <fstat>:
SYSCALL(fstat)
 44a:	b8 08 00 00 00       	mov    $0x8,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <link>:
SYSCALL(link)
 452:	b8 13 00 00 00       	mov    $0x13,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <mkdir>:
SYSCALL(mkdir)
 45a:	b8 14 00 00 00       	mov    $0x14,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <chdir>:
SYSCALL(chdir)
 462:	b8 09 00 00 00       	mov    $0x9,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <dup>:
SYSCALL(dup)
 46a:	b8 0a 00 00 00       	mov    $0xa,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <getpid>:
SYSCALL(getpid)
 472:	b8 0b 00 00 00       	mov    $0xb,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <sbrk>:
SYSCALL(sbrk)
 47a:	b8 0c 00 00 00       	mov    $0xc,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <sleep>:
SYSCALL(sleep)
 482:	b8 0d 00 00 00       	mov    $0xd,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <uptime>:
SYSCALL(uptime)
 48a:	b8 0e 00 00 00       	mov    $0xe,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <set_priority>:
// jump to syscall routine I create
// uses trap instruction 'int' in x86 asm
SYSCALL(set_priority)
 492:	b8 16 00 00 00       	mov    $0x16,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <get_priority>:
SYSCALL(get_priority)
 49a:	b8 17 00 00 00       	mov    $0x17,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <cps>:
SYSCALL(cps)
 4a2:	b8 18 00 00 00       	mov    $0x18,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <thread_create>:
SYSCALL(thread_create)
 4aa:	b8 19 00 00 00       	mov    $0x19,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <thread_exit>:
SYSCALL(thread_exit)
 4b2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <thread_join>:
SYSCALL(thread_join)
 4ba:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <getNumFreePages>:
SYSCALL(getNumFreePages)
 4c2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    
 4ca:	66 90                	xchg   %ax,%ax
 4cc:	66 90                	xchg   %ax,%ax
 4ce:	66 90                	xchg   %ax,%ax

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	89 c7                	mov    %eax,%edi
 4d8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4de:	85 db                	test   %ebx,%ebx
 4e0:	74 76                	je     558 <printint+0x88>
 4e2:	89 d0                	mov    %edx,%eax
 4e4:	c1 e8 1f             	shr    $0x1f,%eax
 4e7:	84 c0                	test   %al,%al
 4e9:	74 6d                	je     558 <printint+0x88>
    neg = 1;
    x = -xx;
 4eb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 4ed:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 4f4:	f7 d8                	neg    %eax
 4f6:	8d 75 d7             	lea    -0x29(%ebp),%esi
  } else {
    x = xx;
  }

  i = 0;
 4f9:	31 db                	xor    %ebx,%ebx
 4fb:	90                   	nop
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 500:	31 d2                	xor    %edx,%edx
 502:	83 c3 01             	add    $0x1,%ebx
 505:	f7 f1                	div    %ecx
 507:	0f b6 92 b3 09 00 00 	movzbl 0x9b3(%edx),%edx
  }while((x /= base) != 0);
 50e:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 510:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 513:	75 eb                	jne    500 <printint+0x30>
  if(neg)
 515:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 518:	89 d8                	mov    %ebx,%eax
  }while((x /= base) != 0);
  if(neg)
 51a:	85 d2                	test   %edx,%edx
 51c:	74 08                	je     526 <printint+0x56>
    buf[i++] = '-';
 51e:	83 c3 01             	add    $0x1,%ebx
 521:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 526:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 530:	0f b6 03             	movzbl (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 533:	83 ec 04             	sub    $0x4,%esp
 536:	83 eb 01             	sub    $0x1,%ebx
 539:	6a 01                	push   $0x1
 53b:	56                   	push   %esi
 53c:	57                   	push   %edi
 53d:	88 45 d7             	mov    %al,-0x29(%ebp)
 540:	e8 cd fe ff ff       	call   412 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 545:	83 c4 10             	add    $0x10,%esp
 548:	39 f3                	cmp    %esi,%ebx
 54a:	75 e4                	jne    530 <printint+0x60>
    putc(fd, buf[i]);
}
 54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54f:	5b                   	pop    %ebx
 550:	5e                   	pop    %esi
 551:	5f                   	pop    %edi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 558:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 55a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 561:	eb 93                	jmp    4f6 <printint+0x26>
 563:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000570 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 576:	8d 45 10             	lea    0x10(%ebp),%eax
 579:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 57b:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 57e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 581:	8b 75 08             	mov    0x8(%ebp),%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 584:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 587:	0f b6 13             	movzbl (%ebx),%edx
 58a:	83 c3 01             	add    $0x1,%ebx
 58d:	84 d2                	test   %dl,%dl
 58f:	75 38                	jne    5c9 <printf+0x59>
 591:	e9 b2 00 00 00       	jmp    648 <printf+0xd8>
 596:	8d 76 00             	lea    0x0(%esi),%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5a0:	83 fa 25             	cmp    $0x25,%edx
 5a3:	0f 84 a7 00 00 00    	je     650 <printf+0xe0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5a9:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5ac:	83 ec 04             	sub    $0x4,%esp
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5af:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5b2:	6a 01                	push   $0x1
 5b4:	50                   	push   %eax
 5b5:	56                   	push   %esi
 5b6:	e8 57 fe ff ff       	call   412 <write>
 5bb:	83 c4 10             	add    $0x10,%esp
 5be:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5c5:	84 d2                	test   %dl,%dl
 5c7:	74 7f                	je     648 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 5c9:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 5cb:	0f be c2             	movsbl %dl,%eax
 5ce:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 5d1:	74 cd                	je     5a0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5d3:	83 ff 25             	cmp    $0x25,%edi
 5d6:	75 e6                	jne    5be <printf+0x4e>
      if(c == 'd'){
 5d8:	83 fa 64             	cmp    $0x64,%edx
 5db:	0f 84 17 01 00 00    	je     6f8 <printf+0x188>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5e1:	25 f7 00 00 00       	and    $0xf7,%eax
 5e6:	83 f8 70             	cmp    $0x70,%eax
 5e9:	74 75                	je     660 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5eb:	83 fa 73             	cmp    $0x73,%edx
 5ee:	0f 84 9c 00 00 00    	je     690 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5f4:	83 fa 63             	cmp    $0x63,%edx
 5f7:	0f 84 0a 01 00 00    	je     707 <printf+0x197>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5fd:	83 fa 25             	cmp    $0x25,%edx
 600:	0f 84 da 00 00 00    	je     6e0 <printf+0x170>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 606:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 609:	83 ec 04             	sub    $0x4,%esp
 60c:	89 55 d0             	mov    %edx,-0x30(%ebp)
 60f:	6a 01                	push   $0x1
 611:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 615:	50                   	push   %eax
 616:	56                   	push   %esi
 617:	e8 f6 fd ff ff       	call   412 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 61c:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 61f:	83 c4 0c             	add    $0xc,%esp
 622:	8d 45 e7             	lea    -0x19(%ebp),%eax
 625:	6a 01                	push   $0x1
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 627:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 62a:	50                   	push   %eax
 62b:	56                   	push   %esi
 62c:	83 c3 01             	add    $0x1,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 62f:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 631:	e8 dc fd ff ff       	call   412 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 636:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 63a:	83 c4 10             	add    $0x10,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 63d:	84 d2                	test   %dl,%dl
 63f:	75 88                	jne    5c9 <printf+0x59>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 648:	8d 65 f4             	lea    -0xc(%ebp),%esp
 64b:	5b                   	pop    %ebx
 64c:	5e                   	pop    %esi
 64d:	5f                   	pop    %edi
 64e:	5d                   	pop    %ebp
 64f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 650:	bf 25 00 00 00       	mov    $0x25,%edi
 655:	e9 64 ff ff ff       	jmp    5be <printf+0x4e>
 65a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 10 00 00 00       	mov    $0x10,%ecx
 668:	6a 00                	push   $0x0
 66a:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 66d:	89 f0                	mov    %esi,%eax
 66f:	8b 17                	mov    (%edi),%edx
 671:	e8 5a fe ff ff       	call   4d0 <printint>
        ap++;
 676:	89 f8                	mov    %edi,%eax
 678:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 67b:	31 ff                	xor    %edi,%edi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 67d:	83 c0 04             	add    $0x4,%eax
 680:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 683:	e9 36 ff ff ff       	jmp    5be <printf+0x4e>
 688:	90                   	nop
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 690:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 693:	8b 38                	mov    (%eax),%edi
        ap++;
 695:	83 c0 04             	add    $0x4,%eax
 698:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 69b:	85 ff                	test   %edi,%edi
 69d:	0f 84 80 00 00 00    	je     723 <printf+0x1b3>
          s = "(null)";
        while(*s != 0){
 6a3:	0f b6 07             	movzbl (%edi),%eax
 6a6:	84 c0                	test   %al,%al
 6a8:	74 25                	je     6cf <printf+0x15f>
 6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 6b6:	83 ec 04             	sub    $0x4,%esp
 6b9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 6bb:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6be:	50                   	push   %eax
 6bf:	56                   	push   %esi
 6c0:	e8 4d fd ff ff       	call   412 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6c5:	0f b6 07             	movzbl (%edi),%eax
 6c8:	83 c4 10             	add    $0x10,%esp
 6cb:	84 c0                	test   %al,%al
 6cd:	75 e1                	jne    6b0 <printf+0x140>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6cf:	31 ff                	xor    %edi,%edi
 6d1:	e9 e8 fe ff ff       	jmp    5be <printf+0x4e>
 6d6:	8d 76 00             	lea    0x0(%esi),%esi
 6d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 6e7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6ea:	6a 01                	push   $0x1
 6ec:	e9 39 ff ff ff       	jmp    62a <printf+0xba>
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6f8:	83 ec 0c             	sub    $0xc,%esp
 6fb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 700:	6a 01                	push   $0x1
 702:	e9 63 ff ff ff       	jmp    66a <printf+0xfa>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 707:	8b 7d d4             	mov    -0x2c(%ebp),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 70a:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 70d:	8b 07                	mov    (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 70f:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 711:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 714:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 717:	50                   	push   %eax
 718:	56                   	push   %esi
 719:	e8 f4 fc ff ff       	call   412 <write>
 71e:	e9 53 ff ff ff       	jmp    676 <printf+0x106>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 723:	bf ac 09 00 00       	mov    $0x9ac,%edi
 728:	e9 76 ff ff ff       	jmp    6a3 <printf+0x133>
 72d:	66 90                	xchg   %ax,%ax
 72f:	90                   	nop

00000730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 04 0d 00 00       	mov    0xd04,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 73e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 748:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74a:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74c:	73 32                	jae    780 <free+0x50>
 74e:	39 d1                	cmp    %edx,%ecx
 750:	72 04                	jb     756 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	39 d0                	cmp    %edx,%eax
 754:	72 32                	jb     788 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 756:	8b 73 fc             	mov    -0x4(%ebx),%esi
 759:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75c:	39 d7                	cmp    %edx,%edi
 75e:	74 2c                	je     78c <free+0x5c>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 760:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 763:	8b 50 04             	mov    0x4(%eax),%edx
 766:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 769:	39 f1                	cmp    %esi,%ecx
 76b:	74 36                	je     7a3 <free+0x73>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 76d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 76f:	a3 04 0d 00 00       	mov    %eax,0xd04
}
 774:	5b                   	pop    %ebx
 775:	5e                   	pop    %esi
 776:	5f                   	pop    %edi
 777:	5d                   	pop    %ebp
 778:	c3                   	ret    
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	39 d0                	cmp    %edx,%eax
 782:	72 04                	jb     788 <free+0x58>
 784:	39 d1                	cmp    %edx,%ecx
 786:	72 ce                	jb     756 <free+0x26>
static Header base;
static Header *freep;

void
free(void *ap)
{
 788:	89 d0                	mov    %edx,%eax
 78a:	eb bc                	jmp    748 <free+0x18>
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 78c:	03 72 04             	add    0x4(%edx),%esi
 78f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 792:	8b 10                	mov    (%eax),%edx
 794:	8b 12                	mov    (%edx),%edx
 796:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 799:	8b 50 04             	mov    0x4(%eax),%edx
 79c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 79f:	39 f1                	cmp    %esi,%ecx
 7a1:	75 ca                	jne    76d <free+0x3d>
    p->s.size += bp->s.size;
 7a3:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 7a6:	a3 04 0d 00 00       	mov    %eax,0xd04
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7ab:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ae:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7b1:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7b3:	5b                   	pop    %ebx
 7b4:	5e                   	pop    %esi
 7b5:	5f                   	pop    %edi
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
 7b8:	90                   	nop
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 15 04 0d 00 00    	mov    0xd04,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 70 07             	lea    0x7(%eax),%esi
 7d5:	c1 ee 03             	shr    $0x3,%esi
 7d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7db:	85 d2                	test   %edx,%edx
 7dd:	0f 84 a3 00 00 00    	je     886 <malloc+0xc6>
 7e3:	8b 02                	mov    (%edx),%eax
 7e5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7e8:	39 ce                	cmp    %ecx,%esi
 7ea:	76 64                	jbe    850 <malloc+0x90>
 7ec:	8d 1c f5 00 00 00 00 	lea    0x0(,%esi,8),%ebx
 7f3:	eb 0c                	jmp    801 <malloc+0x41>
 7f5:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7fa:	8b 48 04             	mov    0x4(%eax),%ecx
 7fd:	39 ce                	cmp    %ecx,%esi
 7ff:	76 4f                	jbe    850 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 801:	3b 05 04 0d 00 00    	cmp    0xd04,%eax
 807:	89 c2                	mov    %eax,%edx
 809:	75 ed                	jne    7f8 <malloc+0x38>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 80b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
 811:	77 5d                	ja     870 <malloc+0xb0>
 813:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
 818:	bf 00 10 00 00       	mov    $0x1000,%edi
  p = sbrk(nu * sizeof(Header));
 81d:	83 ec 0c             	sub    $0xc,%esp
 820:	50                   	push   %eax
 821:	e8 54 fc ff ff       	call   47a <sbrk>
  if(p == (char*)-1)
 826:	83 c4 10             	add    $0x10,%esp
 829:	83 f8 ff             	cmp    $0xffffffff,%eax
 82c:	74 1c                	je     84a <malloc+0x8a>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 82e:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 831:	83 ec 0c             	sub    $0xc,%esp
 834:	83 c0 08             	add    $0x8,%eax
 837:	50                   	push   %eax
 838:	e8 f3 fe ff ff       	call   730 <free>
  return freep;
 83d:	8b 15 04 0d 00 00    	mov    0xd04,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 843:	83 c4 10             	add    $0x10,%esp
 846:	85 d2                	test   %edx,%edx
 848:	75 ae                	jne    7f8 <malloc+0x38>
        return 0;
 84a:	31 c0                	xor    %eax,%eax
 84c:	eb 1a                	jmp    868 <malloc+0xa8>
 84e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 850:	39 ce                	cmp    %ecx,%esi
 852:	74 2c                	je     880 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 854:	29 f1                	sub    %esi,%ecx
 856:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 859:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 85c:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 85f:	89 15 04 0d 00 00    	mov    %edx,0xd04
      return (void*)(p + 1);
 865:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 868:	8d 65 f4             	lea    -0xc(%ebp),%esp
 86b:	5b                   	pop    %ebx
 86c:	5e                   	pop    %esi
 86d:	5f                   	pop    %edi
 86e:	5d                   	pop    %ebp
 86f:	c3                   	ret    
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 870:	89 d8                	mov    %ebx,%eax
 872:	89 f7                	mov    %esi,%edi
 874:	eb a7                	jmp    81d <malloc+0x5d>
 876:	8d 76 00             	lea    0x0(%esi),%esi
 879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 880:	8b 08                	mov    (%eax),%ecx
 882:	89 0a                	mov    %ecx,(%edx)
 884:	eb d9                	jmp    85f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 886:	c7 05 04 0d 00 00 08 	movl   $0xd08,0xd04
 88d:	0d 00 00 
 890:	c7 05 08 0d 00 00 08 	movl   $0xd08,0xd08
 897:	0d 00 00 
    base.s.size = 0;
 89a:	b8 08 0d 00 00       	mov    $0xd08,%eax
 89f:	c7 05 0c 0d 00 00 00 	movl   $0x0,0xd0c
 8a6:	00 00 00 
 8a9:	e9 3e ff ff ff       	jmp    7ec <malloc+0x2c>
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <lock_init>:
  // the xchg function swaps the values of two variables
  // this primitive operation serves as the locking mechanism
  return result;
}

int lock_init(struct lock_t *lk) { 
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	8b 45 08             	mov    0x8(%ebp),%eax
  // initialize the lock
  if (lk) {
 8b6:	85 c0                	test   %eax,%eax
 8b8:	74 0d                	je     8c7 <lock_init+0x17>
    lk->lock = 0;
 8ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    return 1;
 8c0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    // just return an error, if lock ref is null
    return -1; 
  }
}
 8c5:	5d                   	pop    %ebp
 8c6:	c3                   	ret    
  if (lk) {
    lk->lock = 0;
    return 1;
  } else {
    // just return an error, if lock ref is null
    return -1; 
 8c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
 8cc:	5d                   	pop    %ebp
 8cd:	c3                   	ret    
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <lock_acquire>:

int lock_acquire(struct lock_t *lk) {
 8d0:	55                   	push   %ebp

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8d1:	b8 01 00 00 00       	mov    $0x1,%eax
    // just return an error, if lock ref is null
    return -1; 
  }
}

int lock_acquire(struct lock_t *lk) {
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	56                   	push   %esi
 8d9:	53                   	push   %ebx
 8da:	8b 5d 08             	mov    0x8(%ebp),%ebx

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8dd:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 8e0:	85 c0                	test   %eax,%eax

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8e2:	be 01 00 00 00       	mov    $0x1,%esi
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 8e7:	74 1d                	je     906 <lock_acquire+0x36>
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // use sleep to yield to the scheduler
    sleep(1);
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	6a 01                	push   $0x1
 8f5:	e8 88 fb ff ff       	call   482 <sleep>

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8fa:	89 f0                	mov    %esi,%eax
 8fc:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 8ff:	83 c4 10             	add    $0x10,%esp
 902:	85 c0                	test   %eax,%eax
 904:	75 ea                	jne    8f0 <lock_acquire+0x20>
    // use sleep to yield to the scheduler
    sleep(1);
  }
  return 1;
}
 906:	8d 65 f8             	lea    -0x8(%ebp),%esp
 909:	b8 01 00 00 00       	mov    $0x1,%eax
 90e:	5b                   	pop    %ebx
 90f:	5e                   	pop    %esi
 910:	5d                   	pop    %ebp
 911:	c3                   	ret    
 912:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000920 <lock_release>:

int lock_release(struct lock_t *lk) {
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
  // release lock by setting binary val to zero
  lk->lock = 0;
 923:	8b 45 08             	mov    0x8(%ebp),%eax
 926:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 1;
}
 92c:	b8 01 00 00 00       	mov    $0x1,%eax
 931:	5d                   	pop    %ebp
 932:	c3                   	ret    
