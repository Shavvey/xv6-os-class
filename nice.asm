
_nice:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "syscall.h"
#define NUM_ARGS 2
#define PID 1
#define PRIOR 2

int main(int argc, char **argv) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
  if(argc < NUM_ARGS) {
  13:	83 39 01             	cmpl   $0x1,(%ecx)
#include "syscall.h"
#define NUM_ARGS 2
#define PID 1
#define PRIOR 2

int main(int argc, char **argv) {
  16:	8b 51 04             	mov    0x4(%ecx),%edx
  if(argc < NUM_ARGS) {
  19:	0f 8e 8a 00 00 00    	jle    a9 <main+0xa9>
    printf(2,"USAGE: nice [pid] [priority]");
    exit();
  } else {
    int priority;
    char const *prior = argv[PRIOR];
  1f:	8b 42 08             	mov    0x8(%edx),%eax
    char const *id = argv[PID];
  22:	8b 5a 04             	mov    0x4(%edx),%ebx
    // make sure negative is decoded correctly
    if(*prior == '-') {
  25:	80 38 2d             	cmpb   $0x2d,(%eax)
  28:	74 57                	je     81 <main+0x81>
      prior = prior + 1; 
      priority = atoi(prior);
      // invert parsed int, it's stupid I know 
      priority *= -1;
     } else {
      priority = atoi(prior);
  2a:	83 ec 0c             	sub    $0xc,%esp
  2d:	50                   	push   %eax
  2e:	e8 5d 02 00 00       	call   290 <atoi>
  33:	83 c4 10             	add    $0x10,%esp
  36:	89 c6                	mov    %eax,%esi
    }
    int pid = atoi(id);
  38:	83 ec 0c             	sub    $0xc,%esp
  3b:	53                   	push   %ebx
  3c:	e8 4f 02 00 00       	call   290 <atoi>
    printf(1,"Setting new priority: %d for process ID: %d\n",priority,pid);
  41:	50                   	push   %eax
  42:	56                   	push   %esi
      // invert parsed int, it's stupid I know 
      priority *= -1;
     } else {
      priority = atoi(prior);
    }
    int pid = atoi(id);
  43:	89 c3                	mov    %eax,%ebx
    printf(1,"Setting new priority: %d for process ID: %d\n",priority,pid);
  45:	68 a0 08 00 00       	push   $0x8a0
  4a:	6a 01                	push   $0x1
  4c:	e8 2f 04 00 00       	call   480 <printf>
    int ret = set_priority(pid, priority);
  51:	83 c4 18             	add    $0x18,%esp
  54:	56                   	push   %esi
  55:	53                   	push   %ebx
  56:	e8 47 03 00 00       	call   3a2 <set_priority>
    if(ret < 0) {
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	85 c0                	test   %eax,%eax
  60:	78 34                	js     96 <main+0x96>
      printf(2,"set_priority syscall failed!\n");
      exit();
    }
    // get new priority set
    int new_priority = get_priority(pid);
  62:	83 ec 0c             	sub    $0xc,%esp
  65:	53                   	push   %ebx
  66:	e8 3f 03 00 00       	call   3aa <get_priority>
    printf(1,"New priority: %d for PID: %d\n", new_priority,pid);
  6b:	53                   	push   %ebx
  6c:	50                   	push   %eax
  6d:	68 7f 08 00 00       	push   $0x87f
  72:	6a 01                	push   $0x1
  74:	e8 07 04 00 00       	call   480 <printf>
  }
  exit();
  79:	83 c4 20             	add    $0x20,%esp
  7c:	e8 81 02 00 00       	call   302 <exit>
    char const *prior = argv[PRIOR];
    char const *id = argv[PID];
    // make sure negative is decoded correctly
    if(*prior == '-') {
      prior = prior + 1; 
      priority = atoi(prior);
  81:	83 ec 0c             	sub    $0xc,%esp
    int priority;
    char const *prior = argv[PRIOR];
    char const *id = argv[PID];
    // make sure negative is decoded correctly
    if(*prior == '-') {
      prior = prior + 1; 
  84:	83 c0 01             	add    $0x1,%eax
      priority = atoi(prior);
  87:	50                   	push   %eax
  88:	e8 03 02 00 00       	call   290 <atoi>
      // invert parsed int, it's stupid I know 
      priority *= -1;
  8d:	f7 d8                	neg    %eax
  8f:	83 c4 10             	add    $0x10,%esp
  92:	89 c6                	mov    %eax,%esi
  94:	eb a2                	jmp    38 <main+0x38>
    }
    int pid = atoi(id);
    printf(1,"Setting new priority: %d for process ID: %d\n",priority,pid);
    int ret = set_priority(pid, priority);
    if(ret < 0) {
      printf(2,"set_priority syscall failed!\n");
  96:	50                   	push   %eax
  97:	50                   	push   %eax
  98:	68 61 08 00 00       	push   $0x861
  9d:	6a 02                	push   $0x2
  9f:	e8 dc 03 00 00       	call   480 <printf>
      exit();
  a4:	e8 59 02 00 00       	call   302 <exit>
#define PID 1
#define PRIOR 2

int main(int argc, char **argv) {
  if(argc < NUM_ARGS) {
    printf(2,"USAGE: nice [pid] [priority]");
  a9:	52                   	push   %edx
  aa:	52                   	push   %edx
  ab:	68 44 08 00 00       	push   $0x844
  b0:	6a 02                	push   $0x2
  b2:	e8 c9 03 00 00       	call   480 <printf>
    exit();
  b7:	e8 46 02 00 00       	call   302 <exit>
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	53                   	push   %ebx
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ca:	89 c2                	mov    %eax,%edx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  d0:	83 c1 01             	add    $0x1,%ecx
  d3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  d7:	83 c2 01             	add    $0x1,%edx
  da:	84 db                	test   %bl,%bl
  dc:	88 5a ff             	mov    %bl,-0x1(%edx)
  df:	75 ef                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  e1:	5b                   	pop    %ebx
  e2:	5d                   	pop    %ebp
  e3:	c3                   	ret    
  e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	56                   	push   %esi
  f4:	53                   	push   %ebx
  f5:	8b 55 08             	mov    0x8(%ebp),%edx
  f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fb:	0f b6 02             	movzbl (%edx),%eax
  fe:	0f b6 19             	movzbl (%ecx),%ebx
 101:	84 c0                	test   %al,%al
 103:	75 1e                	jne    123 <strcmp+0x33>
 105:	eb 29                	jmp    130 <strcmp+0x40>
 107:	89 f6                	mov    %esi,%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 110:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 113:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 116:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 119:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 11d:	84 c0                	test   %al,%al
 11f:	74 0f                	je     130 <strcmp+0x40>
 121:	89 f1                	mov    %esi,%ecx
 123:	38 d8                	cmp    %bl,%al
 125:	74 e9                	je     110 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 127:	29 d8                	sub    %ebx,%eax
}
 129:	5b                   	pop    %ebx
 12a:	5e                   	pop    %esi
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    
 12d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 130:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 132:	29 d8                	sub    %ebx,%eax
}
 134:	5b                   	pop    %ebx
 135:	5e                   	pop    %esi
 136:	5d                   	pop    %ebp
 137:	c3                   	ret    
 138:	90                   	nop
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strlen>:

uint
strlen(char *s)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 146:	80 39 00             	cmpb   $0x0,(%ecx)
 149:	74 12                	je     15d <strlen+0x1d>
 14b:	31 d2                	xor    %edx,%edx
 14d:	8d 76 00             	lea    0x0(%esi),%esi
 150:	83 c2 01             	add    $0x1,%edx
 153:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 157:	89 d0                	mov    %edx,%eax
 159:	75 f5                	jne    150 <strlen+0x10>
    ;
  return n;
}
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 15d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    
 161:	eb 0d                	jmp    170 <memset>
 163:	90                   	nop
 164:	90                   	nop
 165:	90                   	nop
 166:	90                   	nop
 167:	90                   	nop
 168:	90                   	nop
 169:	90                   	nop
 16a:	90                   	nop
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
 16f:	90                   	nop

00000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 177:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17a:	8b 45 0c             	mov    0xc(%ebp),%eax
 17d:	89 d7                	mov    %edx,%edi
 17f:	fc                   	cld    
 180:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 182:	89 d0                	mov    %edx,%eax
 184:	5f                   	pop    %edi
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <strchr>:

char*
strchr(const char *s, char c)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 19a:	0f b6 18             	movzbl (%eax),%ebx
 19d:	84 db                	test   %bl,%bl
 19f:	74 1d                	je     1be <strchr+0x2e>
    if(*s == c)
 1a1:	38 d3                	cmp    %dl,%bl
 1a3:	89 d1                	mov    %edx,%ecx
 1a5:	75 0d                	jne    1b4 <strchr+0x24>
 1a7:	eb 17                	jmp    1c0 <strchr+0x30>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b0:	38 ca                	cmp    %cl,%dl
 1b2:	74 0c                	je     1c0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1b4:	83 c0 01             	add    $0x1,%eax
 1b7:	0f b6 10             	movzbl (%eax),%edx
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1be:	31 c0                	xor    %eax,%eax
}
 1c0:	5b                   	pop    %ebx
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 1d8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 1db:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1de:	eb 29                	jmp    209 <gets+0x39>
    cc = read(0, &c, 1);
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	6a 01                	push   $0x1
 1e5:	57                   	push   %edi
 1e6:	6a 00                	push   $0x0
 1e8:	e8 2d 01 00 00       	call   31a <read>
    if(cc < 1)
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	85 c0                	test   %eax,%eax
 1f2:	7e 1d                	jle    211 <gets+0x41>
      break;
    buf[i++] = c;
 1f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f8:	8b 55 08             	mov    0x8(%ebp),%edx
 1fb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 1fd:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1ff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 203:	74 1b                	je     220 <gets+0x50>
 205:	3c 0a                	cmp    $0xa,%al
 207:	74 17                	je     220 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 209:	8d 5e 01             	lea    0x1(%esi),%ebx
 20c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20f:	7c cf                	jl     1e0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 218:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21b:	5b                   	pop    %ebx
 21c:	5e                   	pop    %esi
 21d:	5f                   	pop    %edi
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	89 de                	mov    %ebx,%esi
 225:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 229:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22c:	5b                   	pop    %ebx
 22d:	5e                   	pop    %esi
 22e:	5f                   	pop    %edi
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    
 231:	eb 0d                	jmp    240 <stat>
 233:	90                   	nop
 234:	90                   	nop
 235:	90                   	nop
 236:	90                   	nop
 237:	90                   	nop
 238:	90                   	nop
 239:	90                   	nop
 23a:	90                   	nop
 23b:	90                   	nop
 23c:	90                   	nop
 23d:	90                   	nop
 23e:	90                   	nop
 23f:	90                   	nop

00000240 <stat>:

int
stat(char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	pushl  0x8(%ebp)
 24d:	e8 f0 00 00 00       	call   342 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 257:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 259:	78 25                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 25b:	83 ec 08             	sub    $0x8,%esp
 25e:	ff 75 0c             	pushl  0xc(%ebp)
 261:	50                   	push   %eax
 262:	e8 f3 00 00 00       	call   35a <fstat>
 267:	89 c6                	mov    %eax,%esi
  close(fd);
 269:	89 1c 24             	mov    %ebx,(%esp)
 26c:	e8 b9 00 00 00       	call   32a <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
 274:	89 f0                	mov    %esi,%eax
}
 276:	8d 65 f8             	lea    -0x8(%ebp),%esp
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 280:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 285:	eb ef                	jmp    276 <stat+0x36>
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 11             	movsbl (%ecx),%edx
 29a:	8d 42 d0             	lea    -0x30(%edx),%eax
 29d:	3c 09                	cmp    $0x9,%al
 29f:	b8 00 00 00 00       	mov    $0x0,%eax
 2a4:	77 1f                	ja     2c5 <atoi+0x35>
 2a6:	8d 76 00             	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2b3:	83 c1 01             	add    $0x1,%ecx
 2b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ba:	0f be 11             	movsbl (%ecx),%edx
 2bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 2c5:	5b                   	pop    %ebx
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    
 2c8:	90                   	nop
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d1:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	56                   	push   %esi
 2d6:	53                   	push   %ebx
 2d7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2e0:	85 db                	test   %ebx,%ebx
 2e2:	7e 12                	jle    2f6 <memmove+0x26>
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2ef:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f2:	39 da                	cmp    %ebx,%edx
 2f4:	75 f2                	jne    2e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fa:	b8 01 00 00 00       	mov    $0x1,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <exit>:
SYSCALL(exit)
 302:	b8 02 00 00 00       	mov    $0x2,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <wait>:
SYSCALL(wait)
 30a:	b8 03 00 00 00       	mov    $0x3,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <pipe>:
SYSCALL(pipe)
 312:	b8 04 00 00 00       	mov    $0x4,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <read>:
SYSCALL(read)
 31a:	b8 05 00 00 00       	mov    $0x5,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <write>:
SYSCALL(write)
 322:	b8 10 00 00 00       	mov    $0x10,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <close>:
SYSCALL(close)
 32a:	b8 15 00 00 00       	mov    $0x15,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <kill>:
SYSCALL(kill)
 332:	b8 06 00 00 00       	mov    $0x6,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <exec>:
SYSCALL(exec)
 33a:	b8 07 00 00 00       	mov    $0x7,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <open>:
SYSCALL(open)
 342:	b8 0f 00 00 00       	mov    $0xf,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <mknod>:
SYSCALL(mknod)
 34a:	b8 11 00 00 00       	mov    $0x11,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <unlink>:
SYSCALL(unlink)
 352:	b8 12 00 00 00       	mov    $0x12,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <fstat>:
SYSCALL(fstat)
 35a:	b8 08 00 00 00       	mov    $0x8,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <link>:
SYSCALL(link)
 362:	b8 13 00 00 00       	mov    $0x13,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mkdir>:
SYSCALL(mkdir)
 36a:	b8 14 00 00 00       	mov    $0x14,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <chdir>:
SYSCALL(chdir)
 372:	b8 09 00 00 00       	mov    $0x9,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <dup>:
SYSCALL(dup)
 37a:	b8 0a 00 00 00       	mov    $0xa,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <getpid>:
SYSCALL(getpid)
 382:	b8 0b 00 00 00       	mov    $0xb,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <sbrk>:
SYSCALL(sbrk)
 38a:	b8 0c 00 00 00       	mov    $0xc,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <sleep>:
SYSCALL(sleep)
 392:	b8 0d 00 00 00       	mov    $0xd,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <uptime>:
SYSCALL(uptime)
 39a:	b8 0e 00 00 00       	mov    $0xe,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <set_priority>:
// jump to syscall routine I create
// uses trap instruction 'int' in x86 asm
SYSCALL(set_priority)
 3a2:	b8 16 00 00 00       	mov    $0x16,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <get_priority>:
SYSCALL(get_priority)
 3aa:	b8 17 00 00 00       	mov    $0x17,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <cps>:
SYSCALL(cps)
 3b2:	b8 18 00 00 00       	mov    $0x18,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <thread_create>:
SYSCALL(thread_create)
 3ba:	b8 19 00 00 00       	mov    $0x19,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <thread_exit>:
SYSCALL(thread_exit)
 3c2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <thread_join>:
SYSCALL(thread_join)
 3ca:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <getNumFreePages>:
SYSCALL(getNumFreePages)
 3d2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    
 3da:	66 90                	xchg   %ax,%ax
 3dc:	66 90                	xchg   %ax,%ax
 3de:	66 90                	xchg   %ax,%ax

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	89 c7                	mov    %eax,%edi
 3e8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3ee:	85 db                	test   %ebx,%ebx
 3f0:	74 76                	je     468 <printint+0x88>
 3f2:	89 d0                	mov    %edx,%eax
 3f4:	c1 e8 1f             	shr    $0x1f,%eax
 3f7:	84 c0                	test   %al,%al
 3f9:	74 6d                	je     468 <printint+0x88>
    neg = 1;
    x = -xx;
 3fb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3fd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 404:	f7 d8                	neg    %eax
 406:	8d 75 d7             	lea    -0x29(%ebp),%esi
  } else {
    x = xx;
  }

  i = 0;
 409:	31 db                	xor    %ebx,%ebx
 40b:	90                   	nop
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 410:	31 d2                	xor    %edx,%edx
 412:	83 c3 01             	add    $0x1,%ebx
 415:	f7 f1                	div    %ecx
 417:	0f b6 92 d7 08 00 00 	movzbl 0x8d7(%edx),%edx
  }while((x /= base) != 0);
 41e:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 420:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 423:	75 eb                	jne    410 <printint+0x30>
  if(neg)
 425:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 428:	89 d8                	mov    %ebx,%eax
  }while((x /= base) != 0);
  if(neg)
 42a:	85 d2                	test   %edx,%edx
 42c:	74 08                	je     436 <printint+0x56>
    buf[i++] = '-';
 42e:	83 c3 01             	add    $0x1,%ebx
 431:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 436:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 440:	0f b6 03             	movzbl (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 443:	83 ec 04             	sub    $0x4,%esp
 446:	83 eb 01             	sub    $0x1,%ebx
 449:	6a 01                	push   $0x1
 44b:	56                   	push   %esi
 44c:	57                   	push   %edi
 44d:	88 45 d7             	mov    %al,-0x29(%ebp)
 450:	e8 cd fe ff ff       	call   322 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 455:	83 c4 10             	add    $0x10,%esp
 458:	39 f3                	cmp    %esi,%ebx
 45a:	75 e4                	jne    440 <printint+0x60>
    putc(fd, buf[i]);
}
 45c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45f:	5b                   	pop    %ebx
 460:	5e                   	pop    %esi
 461:	5f                   	pop    %edi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    
 464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 468:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 46a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 471:	eb 93                	jmp    406 <printint+0x26>
 473:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000480 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 486:	8d 45 10             	lea    0x10(%ebp),%eax
 489:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 48b:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 48e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 491:	8b 75 08             	mov    0x8(%ebp),%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 494:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 497:	0f b6 13             	movzbl (%ebx),%edx
 49a:	83 c3 01             	add    $0x1,%ebx
 49d:	84 d2                	test   %dl,%dl
 49f:	75 38                	jne    4d9 <printf+0x59>
 4a1:	e9 b2 00 00 00       	jmp    558 <printf+0xd8>
 4a6:	8d 76 00             	lea    0x0(%esi),%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4b0:	83 fa 25             	cmp    $0x25,%edx
 4b3:	0f 84 a7 00 00 00    	je     560 <printf+0xe0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4b9:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4bc:	83 ec 04             	sub    $0x4,%esp
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4bf:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4c2:	6a 01                	push   $0x1
 4c4:	50                   	push   %eax
 4c5:	56                   	push   %esi
 4c6:	e8 57 fe ff ff       	call   322 <write>
 4cb:	83 c4 10             	add    $0x10,%esp
 4ce:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4d5:	84 d2                	test   %dl,%dl
 4d7:	74 7f                	je     558 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 4d9:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4db:	0f be c2             	movsbl %dl,%eax
 4de:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 4e1:	74 cd                	je     4b0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4e3:	83 ff 25             	cmp    $0x25,%edi
 4e6:	75 e6                	jne    4ce <printf+0x4e>
      if(c == 'd'){
 4e8:	83 fa 64             	cmp    $0x64,%edx
 4eb:	0f 84 17 01 00 00    	je     608 <printf+0x188>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4f1:	25 f7 00 00 00       	and    $0xf7,%eax
 4f6:	83 f8 70             	cmp    $0x70,%eax
 4f9:	74 75                	je     570 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4fb:	83 fa 73             	cmp    $0x73,%edx
 4fe:	0f 84 9c 00 00 00    	je     5a0 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 504:	83 fa 63             	cmp    $0x63,%edx
 507:	0f 84 0a 01 00 00    	je     617 <printf+0x197>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 50d:	83 fa 25             	cmp    $0x25,%edx
 510:	0f 84 da 00 00 00    	je     5f0 <printf+0x170>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 516:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 519:	83 ec 04             	sub    $0x4,%esp
 51c:	89 55 d0             	mov    %edx,-0x30(%ebp)
 51f:	6a 01                	push   $0x1
 521:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 525:	50                   	push   %eax
 526:	56                   	push   %esi
 527:	e8 f6 fd ff ff       	call   322 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 52c:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 52f:	83 c4 0c             	add    $0xc,%esp
 532:	8d 45 e7             	lea    -0x19(%ebp),%eax
 535:	6a 01                	push   $0x1
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 537:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 53a:	50                   	push   %eax
 53b:	56                   	push   %esi
 53c:	83 c3 01             	add    $0x1,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 53f:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 541:	e8 dc fd ff ff       	call   322 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 546:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 54a:	83 c4 10             	add    $0x10,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 54d:	84 d2                	test   %dl,%dl
 54f:	75 88                	jne    4d9 <printf+0x59>
 551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 558:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55b:	5b                   	pop    %ebx
 55c:	5e                   	pop    %esi
 55d:	5f                   	pop    %edi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 560:	bf 25 00 00 00       	mov    $0x25,%edi
 565:	e9 64 ff ff ff       	jmp    4ce <printf+0x4e>
 56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 570:	83 ec 0c             	sub    $0xc,%esp
 573:	b9 10 00 00 00       	mov    $0x10,%ecx
 578:	6a 00                	push   $0x0
 57a:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 57d:	89 f0                	mov    %esi,%eax
 57f:	8b 17                	mov    (%edi),%edx
 581:	e8 5a fe ff ff       	call   3e0 <printint>
        ap++;
 586:	89 f8                	mov    %edi,%eax
 588:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 58b:	31 ff                	xor    %edi,%edi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 58d:	83 c0 04             	add    $0x4,%eax
 590:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 593:	e9 36 ff ff ff       	jmp    4ce <printf+0x4e>
 598:	90                   	nop
 599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5a3:	8b 38                	mov    (%eax),%edi
        ap++;
 5a5:	83 c0 04             	add    $0x4,%eax
 5a8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 5ab:	85 ff                	test   %edi,%edi
 5ad:	0f 84 80 00 00 00    	je     633 <printf+0x1b3>
          s = "(null)";
        while(*s != 0){
 5b3:	0f b6 07             	movzbl (%edi),%eax
 5b6:	84 c0                	test   %al,%al
 5b8:	74 25                	je     5df <printf+0x15f>
 5ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5c0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5c3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5c6:	83 ec 04             	sub    $0x4,%esp
 5c9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5cb:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ce:	50                   	push   %eax
 5cf:	56                   	push   %esi
 5d0:	e8 4d fd ff ff       	call   322 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5d5:	0f b6 07             	movzbl (%edi),%eax
 5d8:	83 c4 10             	add    $0x10,%esp
 5db:	84 c0                	test   %al,%al
 5dd:	75 e1                	jne    5c0 <printf+0x140>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5df:	31 ff                	xor    %edi,%edi
 5e1:	e9 e8 fe ff ff       	jmp    4ce <printf+0x4e>
 5e6:	8d 76 00             	lea    0x0(%esi),%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 5f7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5fa:	6a 01                	push   $0x1
 5fc:	e9 39 ff ff ff       	jmp    53a <printf+0xba>
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 608:	83 ec 0c             	sub    $0xc,%esp
 60b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 610:	6a 01                	push   $0x1
 612:	e9 63 ff ff ff       	jmp    57a <printf+0xfa>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 617:	8b 7d d4             	mov    -0x2c(%ebp),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 61a:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 61d:	8b 07                	mov    (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 61f:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 621:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 624:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 627:	50                   	push   %eax
 628:	56                   	push   %esi
 629:	e8 f4 fc ff ff       	call   322 <write>
 62e:	e9 53 ff ff ff       	jmp    586 <printf+0x106>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 633:	bf d0 08 00 00       	mov    $0x8d0,%edi
 638:	e9 76 ff ff ff       	jmp    5b3 <printf+0x133>
 63d:	66 90                	xchg   %ax,%ax
 63f:	90                   	nop

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	a1 e4 0b 00 00       	mov    0xbe4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 646:	89 e5                	mov    %esp,%ebp
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	53                   	push   %ebx
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 658:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 65a:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65c:	73 32                	jae    690 <free+0x50>
 65e:	39 d1                	cmp    %edx,%ecx
 660:	72 04                	jb     666 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 662:	39 d0                	cmp    %edx,%eax
 664:	72 32                	jb     698 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 666:	8b 73 fc             	mov    -0x4(%ebx),%esi
 669:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66c:	39 d7                	cmp    %edx,%edi
 66e:	74 2c                	je     69c <free+0x5c>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 670:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 673:	8b 50 04             	mov    0x4(%eax),%edx
 676:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 679:	39 f1                	cmp    %esi,%ecx
 67b:	74 36                	je     6b3 <free+0x73>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 67d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 67f:	a3 e4 0b 00 00       	mov    %eax,0xbe4
}
 684:	5b                   	pop    %ebx
 685:	5e                   	pop    %esi
 686:	5f                   	pop    %edi
 687:	5d                   	pop    %ebp
 688:	c3                   	ret    
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 690:	39 d0                	cmp    %edx,%eax
 692:	72 04                	jb     698 <free+0x58>
 694:	39 d1                	cmp    %edx,%ecx
 696:	72 ce                	jb     666 <free+0x26>
static Header base;
static Header *freep;

void
free(void *ap)
{
 698:	89 d0                	mov    %edx,%eax
 69a:	eb bc                	jmp    658 <free+0x18>
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 69c:	03 72 04             	add    0x4(%edx),%esi
 69f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a2:	8b 10                	mov    (%eax),%edx
 6a4:	8b 12                	mov    (%edx),%edx
 6a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6a9:	8b 50 04             	mov    0x4(%eax),%edx
 6ac:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6af:	39 f1                	cmp    %esi,%ecx
 6b1:	75 ca                	jne    67d <free+0x3d>
    p->s.size += bp->s.size;
 6b3:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 6b6:	a3 e4 0b 00 00       	mov    %eax,0xbe4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6bb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6be:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6c1:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6c3:	5b                   	pop    %ebx
 6c4:	5e                   	pop    %esi
 6c5:	5f                   	pop    %edi
 6c6:	5d                   	pop    %ebp
 6c7:	c3                   	ret    
 6c8:	90                   	nop
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6dc:	8b 15 e4 0b 00 00    	mov    0xbe4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e2:	8d 70 07             	lea    0x7(%eax),%esi
 6e5:	c1 ee 03             	shr    $0x3,%esi
 6e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6eb:	85 d2                	test   %edx,%edx
 6ed:	0f 84 a3 00 00 00    	je     796 <malloc+0xc6>
 6f3:	8b 02                	mov    (%edx),%eax
 6f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6f8:	39 ce                	cmp    %ecx,%esi
 6fa:	76 64                	jbe    760 <malloc+0x90>
 6fc:	8d 1c f5 00 00 00 00 	lea    0x0(,%esi,8),%ebx
 703:	eb 0c                	jmp    711 <malloc+0x41>
 705:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 708:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 70a:	8b 48 04             	mov    0x4(%eax),%ecx
 70d:	39 ce                	cmp    %ecx,%esi
 70f:	76 4f                	jbe    760 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 711:	3b 05 e4 0b 00 00    	cmp    0xbe4,%eax
 717:	89 c2                	mov    %eax,%edx
 719:	75 ed                	jne    708 <malloc+0x38>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 71b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
 721:	77 5d                	ja     780 <malloc+0xb0>
 723:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
 728:	bf 00 10 00 00       	mov    $0x1000,%edi
  p = sbrk(nu * sizeof(Header));
 72d:	83 ec 0c             	sub    $0xc,%esp
 730:	50                   	push   %eax
 731:	e8 54 fc ff ff       	call   38a <sbrk>
  if(p == (char*)-1)
 736:	83 c4 10             	add    $0x10,%esp
 739:	83 f8 ff             	cmp    $0xffffffff,%eax
 73c:	74 1c                	je     75a <malloc+0x8a>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 73e:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 741:	83 ec 0c             	sub    $0xc,%esp
 744:	83 c0 08             	add    $0x8,%eax
 747:	50                   	push   %eax
 748:	e8 f3 fe ff ff       	call   640 <free>
  return freep;
 74d:	8b 15 e4 0b 00 00    	mov    0xbe4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 753:	83 c4 10             	add    $0x10,%esp
 756:	85 d2                	test   %edx,%edx
 758:	75 ae                	jne    708 <malloc+0x38>
        return 0;
 75a:	31 c0                	xor    %eax,%eax
 75c:	eb 1a                	jmp    778 <malloc+0xa8>
 75e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 760:	39 ce                	cmp    %ecx,%esi
 762:	74 2c                	je     790 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 764:	29 f1                	sub    %esi,%ecx
 766:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 769:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 76c:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 76f:	89 15 e4 0b 00 00    	mov    %edx,0xbe4
      return (void*)(p + 1);
 775:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 778:	8d 65 f4             	lea    -0xc(%ebp),%esp
 77b:	5b                   	pop    %ebx
 77c:	5e                   	pop    %esi
 77d:	5f                   	pop    %edi
 77e:	5d                   	pop    %ebp
 77f:	c3                   	ret    
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 780:	89 d8                	mov    %ebx,%eax
 782:	89 f7                	mov    %esi,%edi
 784:	eb a7                	jmp    72d <malloc+0x5d>
 786:	8d 76 00             	lea    0x0(%esi),%esi
 789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb d9                	jmp    76f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 796:	c7 05 e4 0b 00 00 e8 	movl   $0xbe8,0xbe4
 79d:	0b 00 00 
 7a0:	c7 05 e8 0b 00 00 e8 	movl   $0xbe8,0xbe8
 7a7:	0b 00 00 
    base.s.size = 0;
 7aa:	b8 e8 0b 00 00       	mov    $0xbe8,%eax
 7af:	c7 05 ec 0b 00 00 00 	movl   $0x0,0xbec
 7b6:	00 00 00 
 7b9:	e9 3e ff ff ff       	jmp    6fc <malloc+0x2c>
 7be:	66 90                	xchg   %ax,%ax

000007c0 <lock_init>:
  // the xchg function swaps the values of two variables
  // this primitive operation serves as the locking mechanism
  return result;
}

int lock_init(struct lock_t *lk) { 
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	8b 45 08             	mov    0x8(%ebp),%eax
  // initialize the lock
  if (lk) {
 7c6:	85 c0                	test   %eax,%eax
 7c8:	74 0d                	je     7d7 <lock_init+0x17>
    lk->lock = 0;
 7ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    return 1;
 7d0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    // just return an error, if lock ref is null
    return -1; 
  }
}
 7d5:	5d                   	pop    %ebp
 7d6:	c3                   	ret    
  if (lk) {
    lk->lock = 0;
    return 1;
  } else {
    // just return an error, if lock ref is null
    return -1; 
 7d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
 7dc:	5d                   	pop    %ebp
 7dd:	c3                   	ret    
 7de:	66 90                	xchg   %ax,%ax

000007e0 <lock_acquire>:

int lock_acquire(struct lock_t *lk) {
 7e0:	55                   	push   %ebp

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 7e1:	b8 01 00 00 00       	mov    $0x1,%eax
    // just return an error, if lock ref is null
    return -1; 
  }
}

int lock_acquire(struct lock_t *lk) {
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	56                   	push   %esi
 7e9:	53                   	push   %ebx
 7ea:	8b 5d 08             	mov    0x8(%ebp),%ebx

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 7ed:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 7f0:	85 c0                	test   %eax,%eax

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 7f2:	be 01 00 00 00       	mov    $0x1,%esi
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 7f7:	74 1d                	je     816 <lock_acquire+0x36>
 7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // use sleep to yield to the scheduler
    sleep(1);
 800:	83 ec 0c             	sub    $0xc,%esp
 803:	6a 01                	push   $0x1
 805:	e8 88 fb ff ff       	call   392 <sleep>

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 80a:	89 f0                	mov    %esi,%eax
 80c:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 80f:	83 c4 10             	add    $0x10,%esp
 812:	85 c0                	test   %eax,%eax
 814:	75 ea                	jne    800 <lock_acquire+0x20>
    // use sleep to yield to the scheduler
    sleep(1);
  }
  return 1;
}
 816:	8d 65 f8             	lea    -0x8(%ebp),%esp
 819:	b8 01 00 00 00       	mov    $0x1,%eax
 81e:	5b                   	pop    %ebx
 81f:	5e                   	pop    %esi
 820:	5d                   	pop    %ebp
 821:	c3                   	ret    
 822:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000830 <lock_release>:

int lock_release(struct lock_t *lk) {
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
  // release lock by setting binary val to zero
  lk->lock = 0;
 833:	8b 45 08             	mov    0x8(%ebp),%eax
 836:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 1;
}
 83c:	b8 01 00 00 00       	mov    $0x1,%eax
 841:	5d                   	pop    %ebp
 842:	c3                   	ret    
