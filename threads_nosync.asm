
_threads_nosync:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "Done s:%x\n", b->name);
    thread_exit();
    return;
}

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  struct balance b1 = {"b1", 3200};
   7:	31 c0                	xor    %eax,%eax
    printf(1, "Done s:%x\n", b->name);
    thread_exit();
    return;
}

int main(int argc, char *argv[]) {
   9:	ff 71 fc             	pushl  -0x4(%ecx)
   c:	55                   	push   %ebp
   d:	89 e5                	mov    %esp,%ebp
   f:	57                   	push   %edi
  10:	56                   	push   %esi
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  13:	83 ec 58             	sub    $0x58,%esp
  struct balance b1 = {"b1", 3200};
  16:	c7 45 a0 62 31 00 00 	movl   $0x3162,-0x60(%ebp)
  1d:	c7 44 05 a4 00 00 00 	movl   $0x0,-0x5c(%ebp,%eax,1)
  24:	00 
  25:	83 c0 04             	add    $0x4,%eax
  28:	83 f8 1c             	cmp    $0x1c,%eax
  2b:	72 f0                	jb     1d <main+0x1d>
  2d:	c7 45 c0 80 0c 00 00 	movl   $0xc80,-0x40(%ebp)
  struct balance b2 = {"b2", 2800};
  34:	c7 45 c4 62 32 00 00 	movl   $0x3262,-0x3c(%ebp)
  3b:	31 c0                	xor    %eax,%eax
  3d:	c7 44 05 c8 00 00 00 	movl   $0x0,-0x38(%ebp,%eax,1)
  44:	00 
  45:	83 c0 04             	add    $0x4,%eax
  48:	83 f8 1c             	cmp    $0x1c,%eax
  4b:	72 f0                	jb     3d <main+0x3d>
  void *s1, *s2;
  int t1, t2, r1, r2;
  s1 = malloc(4096);
  4d:	83 ec 0c             	sub    $0xc,%esp
    return;
}

int main(int argc, char *argv[]) {
  struct balance b1 = {"b1", 3200};
  struct balance b2 = {"b2", 2800};
  50:	c7 45 e4 f0 0a 00 00 	movl   $0xaf0,-0x1c(%ebp)
  void *s1, *s2;
  int t1, t2, r1, r2;
  s1 = malloc(4096);
  57:	68 00 10 00 00       	push   $0x1000
  5c:	e8 0f 07 00 00       	call   770 <malloc>
  s2 = malloc(4096);
  61:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
int main(int argc, char *argv[]) {
  struct balance b1 = {"b1", 3200};
  struct balance b2 = {"b2", 2800};
  void *s1, *s2;
  int t1, t2, r1, r2;
  s1 = malloc(4096);
  68:	89 c3                	mov    %eax,%ebx
  s2 = malloc(4096);
  6a:	e8 01 07 00 00       	call   770 <malloc>
  6f:	89 c6                	mov    %eax,%esi
  t1 = thread_create(do_work, s1, (void*)&b1);
  71:	8d 45 a0             	lea    -0x60(%ebp),%eax
  74:	83 c4 0c             	add    $0xc,%esp
  77:	50                   	push   %eax
  78:	53                   	push   %ebx
  79:	68 d0 00 00 00       	push   $0xd0
  7e:	e8 d7 03 00 00       	call   45a <thread_create>
  83:	89 c3                	mov    %eax,%ebx
  t2 = thread_create(do_work, s2, (void*)&b2); 
  85:	8d 45 c4             	lea    -0x3c(%ebp),%eax
  88:	83 c4 0c             	add    $0xc,%esp
  8b:	50                   	push   %eax
  8c:	56                   	push   %esi
  8d:	68 d0 00 00 00       	push   $0xd0
  92:	e8 c3 03 00 00       	call   45a <thread_create>
  97:	89 c7                	mov    %eax,%edi
  r1 = thread_join();
  99:	e8 cc 03 00 00       	call   46a <thread_join>
  9e:	89 c6                	mov    %eax,%esi
  r2 = thread_join();
  a0:	e8 c5 03 00 00       	call   46a <thread_join>
  printf(1, "Threads finished: (%d):%d, (%d):%d, shared balance:%d\n", 
  a5:	8b 15 98 0c 00 00    	mov    0xc98,%edx
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	52                   	push   %edx
  af:	50                   	push   %eax
  b0:	57                   	push   %edi
  b1:	56                   	push   %esi
  b2:	53                   	push   %ebx
  b3:	68 08 09 00 00       	push   $0x908
  b8:	6a 01                	push   $0x1
  ba:	e8 61 04 00 00       	call   520 <printf>
      t1, r1, t2, r2, total_balance);
  exit();
  bf:	83 c4 20             	add    $0x20,%esp
  c2:	e8 db 02 00 00       	call   3a2 <exit>
  c7:	66 90                	xchg   %ax,%ax
  c9:	66 90                	xchg   %ax,%ax
  cb:	66 90                	xchg   %ax,%ax
  cd:	66 90                	xchg   %ax,%ax
  cf:	90                   	nop

000000d0 <do_work>:
   for (i = 0; i < d; i++) {
       __asm volatile( "nop" ::: );
   }
   return i;   
}
void do_work(void *arg){
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	56                   	push   %esi
  d4:	53                   	push   %ebx
  d5:	8b 75 08             	mov    0x8(%ebp),%esi
    int i; 
    int old;
    struct balance *b = (struct balance*) arg; 
    printf(1, "Starting do_work: s:%s\n", b->name);
  d8:	83 ec 04             	sub    $0x4,%esp
  db:	56                   	push   %esi
  dc:	68 e4 08 00 00       	push   $0x8e4
  e1:	6a 01                	push   $0x1
  e3:	e8 38 04 00 00       	call   520 <printf>

    for (i = 0; i < b->amount; i++) { 
  e8:	8b 5e 20             	mov    0x20(%esi),%ebx
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	31 c9                	xor    %ecx,%ecx
  f0:	85 db                	test   %ebx,%ebx
  f2:	7e 29                	jle    11d <do_work+0x4d>
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
         old = total_balance;
  f8:	8b 15 98 0c 00 00    	mov    0xc98,%edx
  fe:	b8 a0 86 01 00       	mov    $0x186a0,%eax
 103:	90                   	nop
 104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
volatile int total_balance = 0;

volatile unsigned int delay (unsigned int d) {
   unsigned int i; 
   for (i = 0; i < d; i++) {
       __asm volatile( "nop" ::: );
 108:	90                   	nop

volatile int total_balance = 0;

volatile unsigned int delay (unsigned int d) {
   unsigned int i; 
   for (i = 0; i < d; i++) {
 109:	83 e8 01             	sub    $0x1,%eax
 10c:	75 fa                	jne    108 <do_work+0x38>
    printf(1, "Starting do_work: s:%s\n", b->name);

    for (i = 0; i < b->amount; i++) { 
         old = total_balance;
         delay(100000);
         total_balance = old + 1;
 10e:	8d 42 01             	lea    0x1(%edx),%eax
    int i; 
    int old;
    struct balance *b = (struct balance*) arg; 
    printf(1, "Starting do_work: s:%s\n", b->name);

    for (i = 0; i < b->amount; i++) { 
 111:	83 c1 01             	add    $0x1,%ecx
 114:	39 d9                	cmp    %ebx,%ecx
         old = total_balance;
         delay(100000);
         total_balance = old + 1;
 116:	a3 98 0c 00 00       	mov    %eax,0xc98
    int i; 
    int old;
    struct balance *b = (struct balance*) arg; 
    printf(1, "Starting do_work: s:%s\n", b->name);

    for (i = 0; i < b->amount; i++) { 
 11b:	75 db                	jne    f8 <do_work+0x28>
         old = total_balance;
         delay(100000);
         total_balance = old + 1;
    }
    printf(1, "Done s:%x\n", b->name);
 11d:	83 ec 04             	sub    $0x4,%esp
 120:	56                   	push   %esi
 121:	68 fc 08 00 00       	push   $0x8fc
 126:	6a 01                	push   $0x1
 128:	e8 f3 03 00 00       	call   520 <printf>
    thread_exit();
 12d:	e8 30 03 00 00       	call   462 <thread_exit>
 132:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <delay>:
    int amount;
};

volatile int total_balance = 0;

volatile unsigned int delay (unsigned int d) {
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
   unsigned int i; 
   for (i = 0; i < d; i++) {
 146:	85 c0                	test   %eax,%eax
 148:	74 0e                	je     158 <delay+0x18>
 14a:	31 d2                	xor    %edx,%edx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
       __asm volatile( "nop" ::: );
 150:	90                   	nop

volatile int total_balance = 0;

volatile unsigned int delay (unsigned int d) {
   unsigned int i; 
   for (i = 0; i < d; i++) {
 151:	83 c2 01             	add    $0x1,%edx
 154:	39 c2                	cmp    %eax,%edx
 156:	75 f8                	jne    150 <delay+0x10>
       __asm volatile( "nop" ::: );
   }
   return i;   
}
 158:	5d                   	pop    %ebp
 159:	c3                   	ret    
 15a:	66 90                	xchg   %ax,%ax
 15c:	66 90                	xchg   %ax,%ax
 15e:	66 90                	xchg   %ax,%ax

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16a:	89 c2                	mov    %eax,%edx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	83 c1 01             	add    $0x1,%ecx
 173:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 177:	83 c2 01             	add    $0x1,%edx
 17a:	84 db                	test   %bl,%bl
 17c:	88 5a ff             	mov    %bl,-0x1(%edx)
 17f:	75 ef                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 181:	5b                   	pop    %ebx
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 18a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	8b 55 08             	mov    0x8(%ebp),%edx
 198:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 19b:	0f b6 02             	movzbl (%edx),%eax
 19e:	0f b6 19             	movzbl (%ecx),%ebx
 1a1:	84 c0                	test   %al,%al
 1a3:	75 1e                	jne    1c3 <strcmp+0x33>
 1a5:	eb 29                	jmp    1d0 <strcmp+0x40>
 1a7:	89 f6                	mov    %esi,%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1b0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1b6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1bd:	84 c0                	test   %al,%al
 1bf:	74 0f                	je     1d0 <strcmp+0x40>
 1c1:	89 f1                	mov    %esi,%ecx
 1c3:	38 d8                	cmp    %bl,%al
 1c5:	74 e9                	je     1b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1c7:	29 d8                	sub    %ebx,%eax
}
 1c9:	5b                   	pop    %ebx
 1ca:	5e                   	pop    %esi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1d0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1d2:	29 d8                	sub    %ebx,%eax
}
 1d4:	5b                   	pop    %ebx
 1d5:	5e                   	pop    %esi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    
 1d8:	90                   	nop
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strlen>:

uint
strlen(char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1e6:	80 39 00             	cmpb   $0x0,(%ecx)
 1e9:	74 12                	je     1fd <strlen+0x1d>
 1eb:	31 d2                	xor    %edx,%edx
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
 1f0:	83 c2 01             	add    $0x1,%edx
 1f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1f7:	89 d0                	mov    %edx,%eax
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
    ;
  return n;
}
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1fd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	eb 0d                	jmp    210 <memset>
 203:	90                   	nop
 204:	90                   	nop
 205:	90                   	nop
 206:	90                   	nop
 207:	90                   	nop
 208:	90                   	nop
 209:	90                   	nop
 20a:	90                   	nop
 20b:	90                   	nop
 20c:	90                   	nop
 20d:	90                   	nop
 20e:	90                   	nop
 20f:	90                   	nop

00000210 <memset>:

void*
memset(void *dst, int c, uint n)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 217:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 d7                	mov    %edx,%edi
 21f:	fc                   	cld    
 220:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 222:	89 d0                	mov    %edx,%eax
 224:	5f                   	pop    %edi
 225:	5d                   	pop    %ebp
 226:	c3                   	ret    
 227:	89 f6                	mov    %esi,%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 23a:	0f b6 18             	movzbl (%eax),%ebx
 23d:	84 db                	test   %bl,%bl
 23f:	74 1d                	je     25e <strchr+0x2e>
    if(*s == c)
 241:	38 d3                	cmp    %dl,%bl
 243:	89 d1                	mov    %edx,%ecx
 245:	75 0d                	jne    254 <strchr+0x24>
 247:	eb 17                	jmp    260 <strchr+0x30>
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 250:	38 ca                	cmp    %cl,%dl
 252:	74 0c                	je     260 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 254:	83 c0 01             	add    $0x1,%eax
 257:	0f b6 10             	movzbl (%eax),%edx
 25a:	84 d2                	test   %dl,%dl
 25c:	75 f2                	jne    250 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 25e:	31 c0                	xor    %eax,%eax
}
 260:	5b                   	pop    %ebx
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <gets>:

char*
gets(char *buf, int max)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 276:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 278:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 27b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 27e:	eb 29                	jmp    2a9 <gets+0x39>
    cc = read(0, &c, 1);
 280:	83 ec 04             	sub    $0x4,%esp
 283:	6a 01                	push   $0x1
 285:	57                   	push   %edi
 286:	6a 00                	push   $0x0
 288:	e8 2d 01 00 00       	call   3ba <read>
    if(cc < 1)
 28d:	83 c4 10             	add    $0x10,%esp
 290:	85 c0                	test   %eax,%eax
 292:	7e 1d                	jle    2b1 <gets+0x41>
      break;
    buf[i++] = c;
 294:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 298:	8b 55 08             	mov    0x8(%ebp),%edx
 29b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 29d:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 29f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2a3:	74 1b                	je     2c0 <gets+0x50>
 2a5:	3c 0a                	cmp    $0xa,%al
 2a7:	74 17                	je     2c0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a9:	8d 5e 01             	lea    0x1(%esi),%ebx
 2ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2af:	7c cf                	jl     280 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2b1:	8b 45 08             	mov    0x8(%ebp),%eax
 2b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bb:	5b                   	pop    %ebx
 2bc:	5e                   	pop    %esi
 2bd:	5f                   	pop    %edi
 2be:	5d                   	pop    %ebp
 2bf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2c0:	8b 45 08             	mov    0x8(%ebp),%eax
 2c3:	89 de                	mov    %ebx,%esi
 2c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2cc:	5b                   	pop    %ebx
 2cd:	5e                   	pop    %esi
 2ce:	5f                   	pop    %edi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    
 2d1:	eb 0d                	jmp    2e0 <stat>
 2d3:	90                   	nop
 2d4:	90                   	nop
 2d5:	90                   	nop
 2d6:	90                   	nop
 2d7:	90                   	nop
 2d8:	90                   	nop
 2d9:	90                   	nop
 2da:	90                   	nop
 2db:	90                   	nop
 2dc:	90                   	nop
 2dd:	90                   	nop
 2de:	90                   	nop
 2df:	90                   	nop

000002e0 <stat>:

int
stat(char *n, struct stat *st)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e5:	83 ec 08             	sub    $0x8,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	ff 75 08             	pushl  0x8(%ebp)
 2ed:	e8 f0 00 00 00       	call   3e2 <open>
  if(fd < 0)
 2f2:	83 c4 10             	add    $0x10,%esp
 2f5:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f7:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2f9:	78 25                	js     320 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2fb:	83 ec 08             	sub    $0x8,%esp
 2fe:	ff 75 0c             	pushl  0xc(%ebp)
 301:	50                   	push   %eax
 302:	e8 f3 00 00 00       	call   3fa <fstat>
 307:	89 c6                	mov    %eax,%esi
  close(fd);
 309:	89 1c 24             	mov    %ebx,(%esp)
 30c:	e8 b9 00 00 00       	call   3ca <close>
  return r;
 311:	83 c4 10             	add    $0x10,%esp
 314:	89 f0                	mov    %esi,%eax
}
 316:	8d 65 f8             	lea    -0x8(%ebp),%esp
 319:	5b                   	pop    %ebx
 31a:	5e                   	pop    %esi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    
 31d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 320:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 325:	eb ef                	jmp    316 <stat+0x36>
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 337:	0f be 11             	movsbl (%ecx),%edx
 33a:	8d 42 d0             	lea    -0x30(%edx),%eax
 33d:	3c 09                	cmp    $0x9,%al
 33f:	b8 00 00 00 00       	mov    $0x0,%eax
 344:	77 1f                	ja     365 <atoi+0x35>
 346:	8d 76 00             	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 350:	8d 04 80             	lea    (%eax,%eax,4),%eax
 353:	83 c1 01             	add    $0x1,%ecx
 356:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 35a:	0f be 11             	movsbl (%ecx),%edx
 35d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 365:	5b                   	pop    %ebx
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    
 368:	90                   	nop
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 370:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 371:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 373:	89 e5                	mov    %esp,%ebp
 375:	56                   	push   %esi
 376:	53                   	push   %ebx
 377:	8b 5d 10             	mov    0x10(%ebp),%ebx
 37a:	8b 45 08             	mov    0x8(%ebp),%eax
 37d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 380:	85 db                	test   %ebx,%ebx
 382:	7e 12                	jle    396 <memmove+0x26>
 384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 388:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 38c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 38f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 392:	39 da                	cmp    %ebx,%edx
 394:	75 f2                	jne    388 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 396:	5b                   	pop    %ebx
 397:	5e                   	pop    %esi
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 39a:	b8 01 00 00 00       	mov    $0x1,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <exit>:
SYSCALL(exit)
 3a2:	b8 02 00 00 00       	mov    $0x2,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <wait>:
SYSCALL(wait)
 3aa:	b8 03 00 00 00       	mov    $0x3,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <pipe>:
SYSCALL(pipe)
 3b2:	b8 04 00 00 00       	mov    $0x4,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <read>:
SYSCALL(read)
 3ba:	b8 05 00 00 00       	mov    $0x5,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <write>:
SYSCALL(write)
 3c2:	b8 10 00 00 00       	mov    $0x10,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <close>:
SYSCALL(close)
 3ca:	b8 15 00 00 00       	mov    $0x15,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <kill>:
SYSCALL(kill)
 3d2:	b8 06 00 00 00       	mov    $0x6,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <exec>:
SYSCALL(exec)
 3da:	b8 07 00 00 00       	mov    $0x7,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <open>:
SYSCALL(open)
 3e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <mknod>:
SYSCALL(mknod)
 3ea:	b8 11 00 00 00       	mov    $0x11,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <unlink>:
SYSCALL(unlink)
 3f2:	b8 12 00 00 00       	mov    $0x12,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <fstat>:
SYSCALL(fstat)
 3fa:	b8 08 00 00 00       	mov    $0x8,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <link>:
SYSCALL(link)
 402:	b8 13 00 00 00       	mov    $0x13,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <mkdir>:
SYSCALL(mkdir)
 40a:	b8 14 00 00 00       	mov    $0x14,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <chdir>:
SYSCALL(chdir)
 412:	b8 09 00 00 00       	mov    $0x9,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <dup>:
SYSCALL(dup)
 41a:	b8 0a 00 00 00       	mov    $0xa,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <getpid>:
SYSCALL(getpid)
 422:	b8 0b 00 00 00       	mov    $0xb,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <sbrk>:
SYSCALL(sbrk)
 42a:	b8 0c 00 00 00       	mov    $0xc,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <sleep>:
SYSCALL(sleep)
 432:	b8 0d 00 00 00       	mov    $0xd,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <uptime>:
SYSCALL(uptime)
 43a:	b8 0e 00 00 00       	mov    $0xe,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <set_priority>:
// jump to syscall routine I create
// uses trap instruction 'int' in x86 asm
SYSCALL(set_priority)
 442:	b8 16 00 00 00       	mov    $0x16,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <get_priority>:
SYSCALL(get_priority)
 44a:	b8 17 00 00 00       	mov    $0x17,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <cps>:
SYSCALL(cps)
 452:	b8 18 00 00 00       	mov    $0x18,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <thread_create>:
SYSCALL(thread_create)
 45a:	b8 19 00 00 00       	mov    $0x19,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <thread_exit>:
SYSCALL(thread_exit)
 462:	b8 1a 00 00 00       	mov    $0x1a,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <thread_join>:
SYSCALL(thread_join)
 46a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <getNumFreePages>:
SYSCALL(getNumFreePages)
 472:	b8 1c 00 00 00       	mov    $0x1c,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    
 47a:	66 90                	xchg   %ax,%ax
 47c:	66 90                	xchg   %ax,%ax
 47e:	66 90                	xchg   %ax,%ax

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	89 c7                	mov    %eax,%edi
 488:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 48b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 48e:	85 db                	test   %ebx,%ebx
 490:	74 76                	je     508 <printint+0x88>
 492:	89 d0                	mov    %edx,%eax
 494:	c1 e8 1f             	shr    $0x1f,%eax
 497:	84 c0                	test   %al,%al
 499:	74 6d                	je     508 <printint+0x88>
    neg = 1;
    x = -xx;
 49b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 49d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 4a4:	f7 d8                	neg    %eax
 4a6:	8d 75 d7             	lea    -0x29(%ebp),%esi
  } else {
    x = xx;
  }

  i = 0;
 4a9:	31 db                	xor    %ebx,%ebx
 4ab:	90                   	nop
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 4b0:	31 d2                	xor    %edx,%edx
 4b2:	83 c3 01             	add    $0x1,%ebx
 4b5:	f7 f1                	div    %ecx
 4b7:	0f b6 92 47 09 00 00 	movzbl 0x947(%edx),%edx
  }while((x /= base) != 0);
 4be:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4c0:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4c3:	75 eb                	jne    4b0 <printint+0x30>
  if(neg)
 4c5:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4c8:	89 d8                	mov    %ebx,%eax
  }while((x /= base) != 0);
  if(neg)
 4ca:	85 d2                	test   %edx,%edx
 4cc:	74 08                	je     4d6 <printint+0x56>
    buf[i++] = '-';
 4ce:	83 c3 01             	add    $0x1,%ebx
 4d1:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 4d6:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4e0:	0f b6 03             	movzbl (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4e3:	83 ec 04             	sub    $0x4,%esp
 4e6:	83 eb 01             	sub    $0x1,%ebx
 4e9:	6a 01                	push   $0x1
 4eb:	56                   	push   %esi
 4ec:	57                   	push   %edi
 4ed:	88 45 d7             	mov    %al,-0x29(%ebp)
 4f0:	e8 cd fe ff ff       	call   3c2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4f5:	83 c4 10             	add    $0x10,%esp
 4f8:	39 f3                	cmp    %esi,%ebx
 4fa:	75 e4                	jne    4e0 <printint+0x60>
    putc(fd, buf[i]);
}
 4fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ff:	5b                   	pop    %ebx
 500:	5e                   	pop    %esi
 501:	5f                   	pop    %edi
 502:	5d                   	pop    %ebp
 503:	c3                   	ret    
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 508:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 50a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 511:	eb 93                	jmp    4a6 <printint+0x26>
 513:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000520 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 526:	8d 45 10             	lea    0x10(%ebp),%eax
 529:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 52b:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 52e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 531:	8b 75 08             	mov    0x8(%ebp),%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 534:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 537:	0f b6 13             	movzbl (%ebx),%edx
 53a:	83 c3 01             	add    $0x1,%ebx
 53d:	84 d2                	test   %dl,%dl
 53f:	75 38                	jne    579 <printf+0x59>
 541:	e9 b2 00 00 00       	jmp    5f8 <printf+0xd8>
 546:	8d 76 00             	lea    0x0(%esi),%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 550:	83 fa 25             	cmp    $0x25,%edx
 553:	0f 84 a7 00 00 00    	je     600 <printf+0xe0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 559:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 55c:	83 ec 04             	sub    $0x4,%esp
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 55f:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 562:	6a 01                	push   $0x1
 564:	50                   	push   %eax
 565:	56                   	push   %esi
 566:	e8 57 fe ff ff       	call   3c2 <write>
 56b:	83 c4 10             	add    $0x10,%esp
 56e:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 571:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 575:	84 d2                	test   %dl,%dl
 577:	74 7f                	je     5f8 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 579:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 57b:	0f be c2             	movsbl %dl,%eax
 57e:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 581:	74 cd                	je     550 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 583:	83 ff 25             	cmp    $0x25,%edi
 586:	75 e6                	jne    56e <printf+0x4e>
      if(c == 'd'){
 588:	83 fa 64             	cmp    $0x64,%edx
 58b:	0f 84 17 01 00 00    	je     6a8 <printf+0x188>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 591:	25 f7 00 00 00       	and    $0xf7,%eax
 596:	83 f8 70             	cmp    $0x70,%eax
 599:	74 75                	je     610 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 59b:	83 fa 73             	cmp    $0x73,%edx
 59e:	0f 84 9c 00 00 00    	je     640 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5a4:	83 fa 63             	cmp    $0x63,%edx
 5a7:	0f 84 0a 01 00 00    	je     6b7 <printf+0x197>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5ad:	83 fa 25             	cmp    $0x25,%edx
 5b0:	0f 84 da 00 00 00    	je     690 <printf+0x170>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5b6:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5b9:	83 ec 04             	sub    $0x4,%esp
 5bc:	89 55 d0             	mov    %edx,-0x30(%ebp)
 5bf:	6a 01                	push   $0x1
 5c1:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 5c5:	50                   	push   %eax
 5c6:	56                   	push   %esi
 5c7:	e8 f6 fd ff ff       	call   3c2 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5cc:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5cf:	83 c4 0c             	add    $0xc,%esp
 5d2:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5d5:	6a 01                	push   $0x1
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5d7:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5da:	50                   	push   %eax
 5db:	56                   	push   %esi
 5dc:	83 c3 01             	add    $0x1,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5df:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5e1:	e8 dc fd ff ff       	call   3c2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e6:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ea:	83 c4 10             	add    $0x10,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ed:	84 d2                	test   %dl,%dl
 5ef:	75 88                	jne    579 <printf+0x59>
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 600:	bf 25 00 00 00       	mov    $0x25,%edi
 605:	e9 64 ff ff ff       	jmp    56e <printf+0x4e>
 60a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 610:	83 ec 0c             	sub    $0xc,%esp
 613:	b9 10 00 00 00       	mov    $0x10,%ecx
 618:	6a 00                	push   $0x0
 61a:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 61d:	89 f0                	mov    %esi,%eax
 61f:	8b 17                	mov    (%edi),%edx
 621:	e8 5a fe ff ff       	call   480 <printint>
        ap++;
 626:	89 f8                	mov    %edi,%eax
 628:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 62b:	31 ff                	xor    %edi,%edi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 62d:	83 c0 04             	add    $0x4,%eax
 630:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 633:	e9 36 ff ff ff       	jmp    56e <printf+0x4e>
 638:	90                   	nop
 639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 640:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 643:	8b 38                	mov    (%eax),%edi
        ap++;
 645:	83 c0 04             	add    $0x4,%eax
 648:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 64b:	85 ff                	test   %edi,%edi
 64d:	0f 84 80 00 00 00    	je     6d3 <printf+0x1b3>
          s = "(null)";
        while(*s != 0){
 653:	0f b6 07             	movzbl (%edi),%eax
 656:	84 c0                	test   %al,%al
 658:	74 25                	je     67f <printf+0x15f>
 65a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 660:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 663:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 666:	83 ec 04             	sub    $0x4,%esp
 669:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 66b:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 66e:	50                   	push   %eax
 66f:	56                   	push   %esi
 670:	e8 4d fd ff ff       	call   3c2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 675:	0f b6 07             	movzbl (%edi),%eax
 678:	83 c4 10             	add    $0x10,%esp
 67b:	84 c0                	test   %al,%al
 67d:	75 e1                	jne    660 <printf+0x140>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 67f:	31 ff                	xor    %edi,%edi
 681:	e9 e8 fe ff ff       	jmp    56e <printf+0x4e>
 686:	8d 76 00             	lea    0x0(%esi),%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 697:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 69a:	6a 01                	push   $0x1
 69c:	e9 39 ff ff ff       	jmp    5da <printf+0xba>
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6a8:	83 ec 0c             	sub    $0xc,%esp
 6ab:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b0:	6a 01                	push   $0x1
 6b2:	e9 63 ff ff ff       	jmp    61a <printf+0xfa>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6b7:	8b 7d d4             	mov    -0x2c(%ebp),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6ba:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6bd:	8b 07                	mov    (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6bf:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6c1:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6c4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6c7:	50                   	push   %eax
 6c8:	56                   	push   %esi
 6c9:	e8 f4 fc ff ff       	call   3c2 <write>
 6ce:	e9 53 ff ff ff       	jmp    626 <printf+0x106>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 6d3:	bf 40 09 00 00       	mov    $0x940,%edi
 6d8:	e9 76 ff ff ff       	jmp    653 <printf+0x133>
 6dd:	66 90                	xchg   %ax,%ax
 6df:	90                   	nop

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 9c 0c 00 00       	mov    0xc9c,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f8:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6fa:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fc:	73 32                	jae    730 <free+0x50>
 6fe:	39 d1                	cmp    %edx,%ecx
 700:	72 04                	jb     706 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 702:	39 d0                	cmp    %edx,%eax
 704:	72 32                	jb     738 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 706:	8b 73 fc             	mov    -0x4(%ebx),%esi
 709:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70c:	39 d7                	cmp    %edx,%edi
 70e:	74 2c                	je     73c <free+0x5c>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 710:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 713:	8b 50 04             	mov    0x4(%eax),%edx
 716:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 719:	39 f1                	cmp    %esi,%ecx
 71b:	74 36                	je     753 <free+0x73>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 71d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 71f:	a3 9c 0c 00 00       	mov    %eax,0xc9c
}
 724:	5b                   	pop    %ebx
 725:	5e                   	pop    %esi
 726:	5f                   	pop    %edi
 727:	5d                   	pop    %ebp
 728:	c3                   	ret    
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 730:	39 d0                	cmp    %edx,%eax
 732:	72 04                	jb     738 <free+0x58>
 734:	39 d1                	cmp    %edx,%ecx
 736:	72 ce                	jb     706 <free+0x26>
static Header base;
static Header *freep;

void
free(void *ap)
{
 738:	89 d0                	mov    %edx,%eax
 73a:	eb bc                	jmp    6f8 <free+0x18>
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 73c:	03 72 04             	add    0x4(%edx),%esi
 73f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 742:	8b 10                	mov    (%eax),%edx
 744:	8b 12                	mov    (%edx),%edx
 746:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 749:	8b 50 04             	mov    0x4(%eax),%edx
 74c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 74f:	39 f1                	cmp    %esi,%ecx
 751:	75 ca                	jne    71d <free+0x3d>
    p->s.size += bp->s.size;
 753:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 756:	a3 9c 0c 00 00       	mov    %eax,0xc9c
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 75b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 75e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 761:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 763:	5b                   	pop    %ebx
 764:	5e                   	pop    %esi
 765:	5f                   	pop    %edi
 766:	5d                   	pop    %ebp
 767:	c3                   	ret    
 768:	90                   	nop
 769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 77c:	8b 15 9c 0c 00 00    	mov    0xc9c,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8d 70 07             	lea    0x7(%eax),%esi
 785:	c1 ee 03             	shr    $0x3,%esi
 788:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 78b:	85 d2                	test   %edx,%edx
 78d:	0f 84 a3 00 00 00    	je     836 <malloc+0xc6>
 793:	8b 02                	mov    (%edx),%eax
 795:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 798:	39 ce                	cmp    %ecx,%esi
 79a:	76 64                	jbe    800 <malloc+0x90>
 79c:	8d 1c f5 00 00 00 00 	lea    0x0(,%esi,8),%ebx
 7a3:	eb 0c                	jmp    7b1 <malloc+0x41>
 7a5:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7aa:	8b 48 04             	mov    0x4(%eax),%ecx
 7ad:	39 ce                	cmp    %ecx,%esi
 7af:	76 4f                	jbe    800 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7b1:	3b 05 9c 0c 00 00    	cmp    0xc9c,%eax
 7b7:	89 c2                	mov    %eax,%edx
 7b9:	75 ed                	jne    7a8 <malloc+0x38>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7bb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
 7c1:	77 5d                	ja     820 <malloc+0xb0>
 7c3:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
 7c8:	bf 00 10 00 00       	mov    $0x1000,%edi
  p = sbrk(nu * sizeof(Header));
 7cd:	83 ec 0c             	sub    $0xc,%esp
 7d0:	50                   	push   %eax
 7d1:	e8 54 fc ff ff       	call   42a <sbrk>
  if(p == (char*)-1)
 7d6:	83 c4 10             	add    $0x10,%esp
 7d9:	83 f8 ff             	cmp    $0xffffffff,%eax
 7dc:	74 1c                	je     7fa <malloc+0x8a>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7de:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7e1:	83 ec 0c             	sub    $0xc,%esp
 7e4:	83 c0 08             	add    $0x8,%eax
 7e7:	50                   	push   %eax
 7e8:	e8 f3 fe ff ff       	call   6e0 <free>
  return freep;
 7ed:	8b 15 9c 0c 00 00    	mov    0xc9c,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 7f3:	83 c4 10             	add    $0x10,%esp
 7f6:	85 d2                	test   %edx,%edx
 7f8:	75 ae                	jne    7a8 <malloc+0x38>
        return 0;
 7fa:	31 c0                	xor    %eax,%eax
 7fc:	eb 1a                	jmp    818 <malloc+0xa8>
 7fe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 800:	39 ce                	cmp    %ecx,%esi
 802:	74 2c                	je     830 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 804:	29 f1                	sub    %esi,%ecx
 806:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 809:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 80c:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 80f:	89 15 9c 0c 00 00    	mov    %edx,0xc9c
      return (void*)(p + 1);
 815:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 818:	8d 65 f4             	lea    -0xc(%ebp),%esp
 81b:	5b                   	pop    %ebx
 81c:	5e                   	pop    %esi
 81d:	5f                   	pop    %edi
 81e:	5d                   	pop    %ebp
 81f:	c3                   	ret    
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 820:	89 d8                	mov    %ebx,%eax
 822:	89 f7                	mov    %esi,%edi
 824:	eb a7                	jmp    7cd <malloc+0x5d>
 826:	8d 76 00             	lea    0x0(%esi),%esi
 829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 830:	8b 08                	mov    (%eax),%ecx
 832:	89 0a                	mov    %ecx,(%edx)
 834:	eb d9                	jmp    80f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 836:	c7 05 9c 0c 00 00 a0 	movl   $0xca0,0xc9c
 83d:	0c 00 00 
 840:	c7 05 a0 0c 00 00 a0 	movl   $0xca0,0xca0
 847:	0c 00 00 
    base.s.size = 0;
 84a:	b8 a0 0c 00 00       	mov    $0xca0,%eax
 84f:	c7 05 a4 0c 00 00 00 	movl   $0x0,0xca4
 856:	00 00 00 
 859:	e9 3e ff ff ff       	jmp    79c <malloc+0x2c>
 85e:	66 90                	xchg   %ax,%ax

00000860 <lock_init>:
  // the xchg function swaps the values of two variables
  // this primitive operation serves as the locking mechanism
  return result;
}

int lock_init(struct lock_t *lk) { 
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	8b 45 08             	mov    0x8(%ebp),%eax
  // initialize the lock
  if (lk) {
 866:	85 c0                	test   %eax,%eax
 868:	74 0d                	je     877 <lock_init+0x17>
    lk->lock = 0;
 86a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    return 1;
 870:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    // just return an error, if lock ref is null
    return -1; 
  }
}
 875:	5d                   	pop    %ebp
 876:	c3                   	ret    
  if (lk) {
    lk->lock = 0;
    return 1;
  } else {
    // just return an error, if lock ref is null
    return -1; 
 877:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
 87c:	5d                   	pop    %ebp
 87d:	c3                   	ret    
 87e:	66 90                	xchg   %ax,%ax

00000880 <lock_acquire>:

int lock_acquire(struct lock_t *lk) {
 880:	55                   	push   %ebp

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 881:	b8 01 00 00 00       	mov    $0x1,%eax
    // just return an error, if lock ref is null
    return -1; 
  }
}

int lock_acquire(struct lock_t *lk) {
 886:	89 e5                	mov    %esp,%ebp
 888:	56                   	push   %esi
 889:	53                   	push   %ebx
 88a:	8b 5d 08             	mov    0x8(%ebp),%ebx

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 88d:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 890:	85 c0                	test   %eax,%eax

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 892:	be 01 00 00 00       	mov    $0x1,%esi
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 897:	74 1d                	je     8b6 <lock_acquire+0x36>
 899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // use sleep to yield to the scheduler
    sleep(1);
 8a0:	83 ec 0c             	sub    $0xc,%esp
 8a3:	6a 01                	push   $0x1
 8a5:	e8 88 fb ff ff       	call   432 <sleep>

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8aa:	89 f0                	mov    %esi,%eax
 8ac:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 8af:	83 c4 10             	add    $0x10,%esp
 8b2:	85 c0                	test   %eax,%eax
 8b4:	75 ea                	jne    8a0 <lock_acquire+0x20>
    // use sleep to yield to the scheduler
    sleep(1);
  }
  return 1;
}
 8b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8b9:	b8 01 00 00 00       	mov    $0x1,%eax
 8be:	5b                   	pop    %ebx
 8bf:	5e                   	pop    %esi
 8c0:	5d                   	pop    %ebp
 8c1:	c3                   	ret    
 8c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008d0 <lock_release>:

int lock_release(struct lock_t *lk) {
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
  // release lock by setting binary val to zero
  lk->lock = 0;
 8d3:	8b 45 08             	mov    0x8(%ebp),%eax
 8d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 1;
}
 8dc:	b8 01 00 00 00       	mov    $0x1,%eax
 8e1:	5d                   	pop    %ebp
 8e2:	c3                   	ret    
