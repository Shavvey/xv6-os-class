
_lab3test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
	int k, n, id;
	double x = 0, z;
	
	if(argc < 2)
  14:	83 39 01             	cmpl   $0x1,(%ecx)
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{
  17:	8b 41 04             	mov    0x4(%ecx),%eax
	int k, n, id;
	double x = 0, z;
	
	if(argc < 2)
  1a:	7e 79                	jle    95 <main+0x95>
		n = 1;		// default value
	else
		n = atoi(argv[1]);  // from command line
  1c:	83 ec 0c             	sub    $0xc,%esp
  1f:	ff 70 04             	pushl  0x4(%eax)
  22:	e8 89 02 00 00       	call   2b0 <atoi>
	
	if(n < 0 || n > 20)
  27:	83 c4 10             	add    $0x10,%esp
  2a:	83 f8 14             	cmp    $0x14,%eax
	double x = 0, z;
	
	if(argc < 2)
		n = 1;		// default value
	else
		n = atoi(argv[1]);  // from command line
  2d:	89 c7                	mov    %eax,%edi
	
	if(n < 0 || n > 20)
  2f:	0f 86 a0 00 00 00    	jbe    d5 <main+0xd5>
		n = 2;
  35:	bf 02 00 00 00       	mov    $0x2,%edi
{
	int k, n, id;
	double x = 0, z;
	
	if(argc < 2)
		n = 1;		// default value
  3a:	31 db                	xor    %ebx,%ebx
  3c:	eb 26                	jmp    64 <main+0x64>
  3e:	66 90                	xchg   %ax,%ax
	for(k = 0; k < n; k++){
		id = fork();
		if(id < 0){
			printf(1, "%d failed in fork!\n", getpid());
		}
		else if(id > 0){ // parent
  40:	74 5a                	je     9c <main+0x9c>
			printf(1, "Parent %d creating child %d\n", getpid(), id);
  42:	e8 5b 03 00 00       	call   3a2 <getpid>
  47:	56                   	push   %esi
  48:	50                   	push   %eax
	
	if(n < 0 || n > 20)
		n = 2;
	
	id = 0;
	for(k = 0; k < n; k++){
  49:	83 c3 01             	add    $0x1,%ebx
		id = fork();
		if(id < 0){
			printf(1, "%d failed in fork!\n", getpid());
		}
		else if(id > 0){ // parent
			printf(1, "Parent %d creating child %d\n", getpid(), id);
  4c:	68 7c 08 00 00       	push   $0x87c
  51:	6a 01                	push   $0x1
  53:	e8 48 04 00 00       	call   4a0 <printf>
      wait(); // wait for child process
  58:	e8 cd 02 00 00       	call   32a <wait>
  5d:	83 c4 10             	add    $0x10,%esp
	
	if(n < 0 || n > 20)
		n = 2;
	
	id = 0;
	for(k = 0; k < n; k++){
  60:	39 df                	cmp    %ebx,%edi
  62:	7e 2c                	jle    90 <main+0x90>
		id = fork();
  64:	e8 b1 02 00 00       	call   31a <fork>
		if(id < 0){
  69:	85 c0                	test   %eax,%eax
	if(n < 0 || n > 20)
		n = 2;
	
	id = 0;
	for(k = 0; k < n; k++){
		id = fork();
  6b:	89 c6                	mov    %eax,%esi
		if(id < 0){
  6d:	79 d1                	jns    40 <main+0x40>
			printf(1, "%d failed in fork!\n", getpid());
  6f:	e8 2e 03 00 00       	call   3a2 <getpid>
  74:	83 ec 04             	sub    $0x4,%esp
	
	if(n < 0 || n > 20)
		n = 2;
	
	id = 0;
	for(k = 0; k < n; k++){
  77:	83 c3 01             	add    $0x1,%ebx
		id = fork();
		if(id < 0){
			printf(1, "%d failed in fork!\n", getpid());
  7a:	50                   	push   %eax
  7b:	68 68 08 00 00       	push   $0x868
  80:	6a 01                	push   $0x1
  82:	e8 19 04 00 00       	call   4a0 <printf>
  87:	83 c4 10             	add    $0x10,%esp
	
	if(n < 0 || n > 20)
		n = 2;
	
	id = 0;
	for(k = 0; k < n; k++){
  8a:	39 df                	cmp    %ebx,%edi
  8c:	7f d6                	jg     64 <main+0x64>
  8e:	66 90                	xchg   %ax,%ax
			for(z = 0; z < 80000000.0; z += 0.01)
				x = x + 1;		
			break;	
		}
	}
	exit();
  90:	e8 8d 02 00 00       	call   322 <exit>
{
	int k, n, id;
	double x = 0, z;
	
	if(argc < 2)
		n = 1;		// default value
  95:	bf 01 00 00 00       	mov    $0x1,%edi
  9a:	eb 9e                	jmp    3a <main+0x3a>
		}
		else if(id > 0){ // parent
			printf(1, "Parent %d creating child %d\n", getpid(), id);
      wait(); // wait for child process
		} else{ // child
			printf(1, "Child %d created\n", getpid());
  9c:	e8 01 03 00 00       	call   3a2 <getpid>
  a1:	52                   	push   %edx
  a2:	50                   	push   %eax
  a3:	68 99 08 00 00       	push   $0x899
  a8:	6a 01                	push   $0x1
  aa:	e8 f1 03 00 00       	call   4a0 <printf>
			for(z = 0; z < 80000000.0; z += 0.01)
  af:	d9 ee                	fldz   
		}
		else if(id > 0){ // parent
			printf(1, "Parent %d creating child %d\n", getpid(), id);
      wait(); // wait for child process
		} else{ // child
			printf(1, "Child %d created\n", getpid());
  b1:	83 c4 10             	add    $0x10,%esp
			for(z = 0; z < 80000000.0; z += 0.01)
  b4:	dd 05 b0 08 00 00    	fldl   0x8b0
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	dc c1                	fadd   %st,%st(1)
  c2:	d9 05 b8 08 00 00    	flds   0x8b8
  c8:	dd ea                	fucomp %st(2)
  ca:	df e0                	fnstsw %ax
  cc:	9e                   	sahf   
  cd:	77 f1                	ja     c0 <main+0xc0>
  cf:	dd d8                	fstp   %st(0)
  d1:	dd d8                	fstp   %st(0)
  d3:	eb bb                	jmp    90 <main+0x90>
	
	if(n < 0 || n > 20)
		n = 2;
	
	id = 0;
	for(k = 0; k < n; k++){
  d5:	85 c0                	test   %eax,%eax
  d7:	74 b7                	je     90 <main+0x90>
  d9:	e9 5c ff ff ff       	jmp    3a <main+0x3a>
  de:	66 90                	xchg   %ax,%ax

000000e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	53                   	push   %ebx
  e4:	8b 45 08             	mov    0x8(%ebp),%eax
  e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ea:	89 c2                	mov    %eax,%edx
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f0:	83 c1 01             	add    $0x1,%ecx
  f3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  f7:	83 c2 01             	add    $0x1,%edx
  fa:	84 db                	test   %bl,%bl
  fc:	88 5a ff             	mov    %bl,-0x1(%edx)
  ff:	75 ef                	jne    f0 <strcpy+0x10>
    ;
  return os;
}
 101:	5b                   	pop    %ebx
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    
 104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 10a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	56                   	push   %esi
 114:	53                   	push   %ebx
 115:	8b 55 08             	mov    0x8(%ebp),%edx
 118:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 11b:	0f b6 02             	movzbl (%edx),%eax
 11e:	0f b6 19             	movzbl (%ecx),%ebx
 121:	84 c0                	test   %al,%al
 123:	75 1e                	jne    143 <strcmp+0x33>
 125:	eb 29                	jmp    150 <strcmp+0x40>
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 130:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 133:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 136:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 139:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 13d:	84 c0                	test   %al,%al
 13f:	74 0f                	je     150 <strcmp+0x40>
 141:	89 f1                	mov    %esi,%ecx
 143:	38 d8                	cmp    %bl,%al
 145:	74 e9                	je     130 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 147:	29 d8                	sub    %ebx,%eax
}
 149:	5b                   	pop    %ebx
 14a:	5e                   	pop    %esi
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    
 14d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 150:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 152:	29 d8                	sub    %ebx,%eax
}
 154:	5b                   	pop    %ebx
 155:	5e                   	pop    %esi
 156:	5d                   	pop    %ebp
 157:	c3                   	ret    
 158:	90                   	nop
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <strlen>:

uint
strlen(char *s)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 166:	80 39 00             	cmpb   $0x0,(%ecx)
 169:	74 12                	je     17d <strlen+0x1d>
 16b:	31 d2                	xor    %edx,%edx
 16d:	8d 76 00             	lea    0x0(%esi),%esi
 170:	83 c2 01             	add    $0x1,%edx
 173:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 177:	89 d0                	mov    %edx,%eax
 179:	75 f5                	jne    170 <strlen+0x10>
    ;
  return n;
}
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 17d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	eb 0d                	jmp    190 <memset>
 183:	90                   	nop
 184:	90                   	nop
 185:	90                   	nop
 186:	90                   	nop
 187:	90                   	nop
 188:	90                   	nop
 189:	90                   	nop
 18a:	90                   	nop
 18b:	90                   	nop
 18c:	90                   	nop
 18d:	90                   	nop
 18e:	90                   	nop
 18f:	90                   	nop

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 197:	8b 4d 10             	mov    0x10(%ebp),%ecx
 19a:	8b 45 0c             	mov    0xc(%ebp),%eax
 19d:	89 d7                	mov    %edx,%edi
 19f:	fc                   	cld    
 1a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a2:	89 d0                	mov    %edx,%eax
 1a4:	5f                   	pop    %edi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
 1a7:	89 f6                	mov    %esi,%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <strchr>:

char*
strchr(const char *s, char c)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 1ba:	0f b6 18             	movzbl (%eax),%ebx
 1bd:	84 db                	test   %bl,%bl
 1bf:	74 1d                	je     1de <strchr+0x2e>
    if(*s == c)
 1c1:	38 d3                	cmp    %dl,%bl
 1c3:	89 d1                	mov    %edx,%ecx
 1c5:	75 0d                	jne    1d4 <strchr+0x24>
 1c7:	eb 17                	jmp    1e0 <strchr+0x30>
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d0:	38 ca                	cmp    %cl,%dl
 1d2:	74 0c                	je     1e0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1d4:	83 c0 01             	add    $0x1,%eax
 1d7:	0f b6 10             	movzbl (%eax),%edx
 1da:	84 d2                	test   %dl,%dl
 1dc:	75 f2                	jne    1d0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1de:	31 c0                	xor    %eax,%eax
}
 1e0:	5b                   	pop    %ebx
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <gets>:

char*
gets(char *buf, int max)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	56                   	push   %esi
 1f5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 1f8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 1fb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fe:	eb 29                	jmp    229 <gets+0x39>
    cc = read(0, &c, 1);
 200:	83 ec 04             	sub    $0x4,%esp
 203:	6a 01                	push   $0x1
 205:	57                   	push   %edi
 206:	6a 00                	push   $0x0
 208:	e8 2d 01 00 00       	call   33a <read>
    if(cc < 1)
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	7e 1d                	jle    231 <gets+0x41>
      break;
    buf[i++] = c;
 214:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 218:	8b 55 08             	mov    0x8(%ebp),%edx
 21b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 21d:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 21f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 223:	74 1b                	je     240 <gets+0x50>
 225:	3c 0a                	cmp    $0xa,%al
 227:	74 17                	je     240 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 229:	8d 5e 01             	lea    0x1(%esi),%ebx
 22c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 22f:	7c cf                	jl     200 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 238:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23b:	5b                   	pop    %ebx
 23c:	5e                   	pop    %esi
 23d:	5f                   	pop    %edi
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	89 de                	mov    %ebx,%esi
 245:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 249:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5f                   	pop    %edi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	eb 0d                	jmp    260 <stat>
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

00000260 <stat>:

int
stat(char *n, struct stat *st)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 265:	83 ec 08             	sub    $0x8,%esp
 268:	6a 00                	push   $0x0
 26a:	ff 75 08             	pushl  0x8(%ebp)
 26d:	e8 f0 00 00 00       	call   362 <open>
  if(fd < 0)
 272:	83 c4 10             	add    $0x10,%esp
 275:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 277:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 279:	78 25                	js     2a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 27b:	83 ec 08             	sub    $0x8,%esp
 27e:	ff 75 0c             	pushl  0xc(%ebp)
 281:	50                   	push   %eax
 282:	e8 f3 00 00 00       	call   37a <fstat>
 287:	89 c6                	mov    %eax,%esi
  close(fd);
 289:	89 1c 24             	mov    %ebx,(%esp)
 28c:	e8 b9 00 00 00       	call   34a <close>
  return r;
 291:	83 c4 10             	add    $0x10,%esp
 294:	89 f0                	mov    %esi,%eax
}
 296:	8d 65 f8             	lea    -0x8(%ebp),%esp
 299:	5b                   	pop    %ebx
 29a:	5e                   	pop    %esi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a5:	eb ef                	jmp    296 <stat+0x36>
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b7:	0f be 11             	movsbl (%ecx),%edx
 2ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 2bd:	3c 09                	cmp    $0x9,%al
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
 2c4:	77 1f                	ja     2e5 <atoi+0x35>
 2c6:	8d 76 00             	lea    0x0(%esi),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2d3:	83 c1 01             	add    $0x1,%ecx
 2d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2da:	0f be 11             	movsbl (%ecx),%edx
 2dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2e0:	80 fb 09             	cmp    $0x9,%bl
 2e3:	76 eb                	jbe    2d0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 2e5:	5b                   	pop    %ebx
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    
 2e8:	90                   	nop
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f1:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	56                   	push   %esi
 2f6:	53                   	push   %ebx
 2f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2fa:	8b 45 08             	mov    0x8(%ebp),%eax
 2fd:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 300:	85 db                	test   %ebx,%ebx
 302:	7e 12                	jle    316 <memmove+0x26>
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 30c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 30f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 312:	39 da                	cmp    %ebx,%edx
 314:	75 f2                	jne    308 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31a:	b8 01 00 00 00       	mov    $0x1,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <exit>:
SYSCALL(exit)
 322:	b8 02 00 00 00       	mov    $0x2,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <wait>:
SYSCALL(wait)
 32a:	b8 03 00 00 00       	mov    $0x3,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <pipe>:
SYSCALL(pipe)
 332:	b8 04 00 00 00       	mov    $0x4,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <read>:
SYSCALL(read)
 33a:	b8 05 00 00 00       	mov    $0x5,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <write>:
SYSCALL(write)
 342:	b8 10 00 00 00       	mov    $0x10,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <close>:
SYSCALL(close)
 34a:	b8 15 00 00 00       	mov    $0x15,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <kill>:
SYSCALL(kill)
 352:	b8 06 00 00 00       	mov    $0x6,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <exec>:
SYSCALL(exec)
 35a:	b8 07 00 00 00       	mov    $0x7,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <open>:
SYSCALL(open)
 362:	b8 0f 00 00 00       	mov    $0xf,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mknod>:
SYSCALL(mknod)
 36a:	b8 11 00 00 00       	mov    $0x11,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <unlink>:
SYSCALL(unlink)
 372:	b8 12 00 00 00       	mov    $0x12,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <fstat>:
SYSCALL(fstat)
 37a:	b8 08 00 00 00       	mov    $0x8,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <link>:
SYSCALL(link)
 382:	b8 13 00 00 00       	mov    $0x13,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <mkdir>:
SYSCALL(mkdir)
 38a:	b8 14 00 00 00       	mov    $0x14,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <chdir>:
SYSCALL(chdir)
 392:	b8 09 00 00 00       	mov    $0x9,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <dup>:
SYSCALL(dup)
 39a:	b8 0a 00 00 00       	mov    $0xa,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getpid>:
SYSCALL(getpid)
 3a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <sbrk>:
SYSCALL(sbrk)
 3aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <sleep>:
SYSCALL(sleep)
 3b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <uptime>:
SYSCALL(uptime)
 3ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <set_priority>:
// jump to syscall routine I create
// uses trap instruction 'int' in x86 asm
SYSCALL(set_priority)
 3c2:	b8 16 00 00 00       	mov    $0x16,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <get_priority>:
SYSCALL(get_priority)
 3ca:	b8 17 00 00 00       	mov    $0x17,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <cps>:
SYSCALL(cps)
 3d2:	b8 18 00 00 00       	mov    $0x18,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <thread_create>:
SYSCALL(thread_create)
 3da:	b8 19 00 00 00       	mov    $0x19,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <thread_exit>:
SYSCALL(thread_exit)
 3e2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <thread_join>:
SYSCALL(thread_join)
 3ea:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <getNumFreePages>:
SYSCALL(getNumFreePages)
 3f2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    
 3fa:	66 90                	xchg   %ax,%ax
 3fc:	66 90                	xchg   %ax,%ax
 3fe:	66 90                	xchg   %ax,%ax

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	89 c7                	mov    %eax,%edi
 408:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 40b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 40e:	85 db                	test   %ebx,%ebx
 410:	74 76                	je     488 <printint+0x88>
 412:	89 d0                	mov    %edx,%eax
 414:	c1 e8 1f             	shr    $0x1f,%eax
 417:	84 c0                	test   %al,%al
 419:	74 6d                	je     488 <printint+0x88>
    neg = 1;
    x = -xx;
 41b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 41d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 424:	f7 d8                	neg    %eax
 426:	8d 75 d7             	lea    -0x29(%ebp),%esi
  } else {
    x = xx;
  }

  i = 0;
 429:	31 db                	xor    %ebx,%ebx
 42b:	90                   	nop
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 430:	31 d2                	xor    %edx,%edx
 432:	83 c3 01             	add    $0x1,%ebx
 435:	f7 f1                	div    %ecx
 437:	0f b6 92 c3 08 00 00 	movzbl 0x8c3(%edx),%edx
  }while((x /= base) != 0);
 43e:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 440:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 443:	75 eb                	jne    430 <printint+0x30>
  if(neg)
 445:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 448:	89 d8                	mov    %ebx,%eax
  }while((x /= base) != 0);
  if(neg)
 44a:	85 d2                	test   %edx,%edx
 44c:	74 08                	je     456 <printint+0x56>
    buf[i++] = '-';
 44e:	83 c3 01             	add    $0x1,%ebx
 451:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 456:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 460:	0f b6 03             	movzbl (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 463:	83 ec 04             	sub    $0x4,%esp
 466:	83 eb 01             	sub    $0x1,%ebx
 469:	6a 01                	push   $0x1
 46b:	56                   	push   %esi
 46c:	57                   	push   %edi
 46d:	88 45 d7             	mov    %al,-0x29(%ebp)
 470:	e8 cd fe ff ff       	call   342 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 475:	83 c4 10             	add    $0x10,%esp
 478:	39 f3                	cmp    %esi,%ebx
 47a:	75 e4                	jne    460 <printint+0x60>
    putc(fd, buf[i]);
}
 47c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47f:	5b                   	pop    %ebx
 480:	5e                   	pop    %esi
 481:	5f                   	pop    %edi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 488:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 48a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 491:	eb 93                	jmp    426 <printint+0x26>
 493:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a6:	8d 45 10             	lea    0x10(%ebp),%eax
 4a9:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4ab:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4ae:	8b 5d 0c             	mov    0xc(%ebp),%ebx
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4b1:	8b 75 08             	mov    0x8(%ebp),%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4b7:	0f b6 13             	movzbl (%ebx),%edx
 4ba:	83 c3 01             	add    $0x1,%ebx
 4bd:	84 d2                	test   %dl,%dl
 4bf:	75 38                	jne    4f9 <printf+0x59>
 4c1:	e9 b2 00 00 00       	jmp    578 <printf+0xd8>
 4c6:	8d 76 00             	lea    0x0(%esi),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d0:	83 fa 25             	cmp    $0x25,%edx
 4d3:	0f 84 a7 00 00 00    	je     580 <printf+0xe0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4d9:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4dc:	83 ec 04             	sub    $0x4,%esp
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4df:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4e2:	6a 01                	push   $0x1
 4e4:	50                   	push   %eax
 4e5:	56                   	push   %esi
 4e6:	e8 57 fe ff ff       	call   342 <write>
 4eb:	83 c4 10             	add    $0x10,%esp
 4ee:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4f1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4f5:	84 d2                	test   %dl,%dl
 4f7:	74 7f                	je     578 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 4f9:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4fb:	0f be c2             	movsbl %dl,%eax
 4fe:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 501:	74 cd                	je     4d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 503:	83 ff 25             	cmp    $0x25,%edi
 506:	75 e6                	jne    4ee <printf+0x4e>
      if(c == 'd'){
 508:	83 fa 64             	cmp    $0x64,%edx
 50b:	0f 84 17 01 00 00    	je     628 <printf+0x188>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 511:	25 f7 00 00 00       	and    $0xf7,%eax
 516:	83 f8 70             	cmp    $0x70,%eax
 519:	74 75                	je     590 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 51b:	83 fa 73             	cmp    $0x73,%edx
 51e:	0f 84 9c 00 00 00    	je     5c0 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 524:	83 fa 63             	cmp    $0x63,%edx
 527:	0f 84 0a 01 00 00    	je     637 <printf+0x197>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 52d:	83 fa 25             	cmp    $0x25,%edx
 530:	0f 84 da 00 00 00    	je     610 <printf+0x170>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 536:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 539:	83 ec 04             	sub    $0x4,%esp
 53c:	89 55 d0             	mov    %edx,-0x30(%ebp)
 53f:	6a 01                	push   $0x1
 541:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 545:	50                   	push   %eax
 546:	56                   	push   %esi
 547:	e8 f6 fd ff ff       	call   342 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 54c:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 54f:	83 c4 0c             	add    $0xc,%esp
 552:	8d 45 e7             	lea    -0x19(%ebp),%eax
 555:	6a 01                	push   $0x1
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 557:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 55a:	50                   	push   %eax
 55b:	56                   	push   %esi
 55c:	83 c3 01             	add    $0x1,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 55f:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 561:	e8 dc fd ff ff       	call   342 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 566:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 56a:	83 c4 10             	add    $0x10,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 56d:	84 d2                	test   %dl,%dl
 56f:	75 88                	jne    4f9 <printf+0x59>
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 578:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57b:	5b                   	pop    %ebx
 57c:	5e                   	pop    %esi
 57d:	5f                   	pop    %edi
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 580:	bf 25 00 00 00       	mov    $0x25,%edi
 585:	e9 64 ff ff ff       	jmp    4ee <printf+0x4e>
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 10 00 00 00       	mov    $0x10,%ecx
 598:	6a 00                	push   $0x0
 59a:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 59d:	89 f0                	mov    %esi,%eax
 59f:	8b 17                	mov    (%edi),%edx
 5a1:	e8 5a fe ff ff       	call   400 <printint>
        ap++;
 5a6:	89 f8                	mov    %edi,%eax
 5a8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ab:	31 ff                	xor    %edi,%edi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 5ad:	83 c0 04             	add    $0x4,%eax
 5b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5b3:	e9 36 ff ff ff       	jmp    4ee <printf+0x4e>
 5b8:	90                   	nop
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5c3:	8b 38                	mov    (%eax),%edi
        ap++;
 5c5:	83 c0 04             	add    $0x4,%eax
 5c8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 5cb:	85 ff                	test   %edi,%edi
 5cd:	0f 84 80 00 00 00    	je     653 <printf+0x1b3>
          s = "(null)";
        while(*s != 0){
 5d3:	0f b6 07             	movzbl (%edi),%eax
 5d6:	84 c0                	test   %al,%al
 5d8:	74 25                	je     5ff <printf+0x15f>
 5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5eb:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ee:	50                   	push   %eax
 5ef:	56                   	push   %esi
 5f0:	e8 4d fd ff ff       	call   342 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5f5:	0f b6 07             	movzbl (%edi),%eax
 5f8:	83 c4 10             	add    $0x10,%esp
 5fb:	84 c0                	test   %al,%al
 5fd:	75 e1                	jne    5e0 <printf+0x140>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ff:	31 ff                	xor    %edi,%edi
 601:	e9 e8 fe ff ff       	jmp    4ee <printf+0x4e>
 606:	8d 76 00             	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 617:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 61a:	6a 01                	push   $0x1
 61c:	e9 39 ff ff ff       	jmp    55a <printf+0xba>
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 628:	83 ec 0c             	sub    $0xc,%esp
 62b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 630:	6a 01                	push   $0x1
 632:	e9 63 ff ff ff       	jmp    59a <printf+0xfa>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 637:	8b 7d d4             	mov    -0x2c(%ebp),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 63a:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 63d:	8b 07                	mov    (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 63f:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 641:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 644:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 647:	50                   	push   %eax
 648:	56                   	push   %esi
 649:	e8 f4 fc ff ff       	call   342 <write>
 64e:	e9 53 ff ff ff       	jmp    5a6 <printf+0x106>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 653:	bf bc 08 00 00       	mov    $0x8bc,%edi
 658:	e9 76 ff ff ff       	jmp    5d3 <printf+0x133>
 65d:	66 90                	xchg   %ax,%ax
 65f:	90                   	nop

00000660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 d4 0b 00 00       	mov    0xbd4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 66e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 678:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 67a:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67c:	73 32                	jae    6b0 <free+0x50>
 67e:	39 d1                	cmp    %edx,%ecx
 680:	72 04                	jb     686 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 682:	39 d0                	cmp    %edx,%eax
 684:	72 32                	jb     6b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 686:	8b 73 fc             	mov    -0x4(%ebx),%esi
 689:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68c:	39 d7                	cmp    %edx,%edi
 68e:	74 2c                	je     6bc <free+0x5c>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 690:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 693:	8b 50 04             	mov    0x4(%eax),%edx
 696:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 699:	39 f1                	cmp    %esi,%ecx
 69b:	74 36                	je     6d3 <free+0x73>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 69d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 69f:	a3 d4 0b 00 00       	mov    %eax,0xbd4
}
 6a4:	5b                   	pop    %ebx
 6a5:	5e                   	pop    %esi
 6a6:	5f                   	pop    %edi
 6a7:	5d                   	pop    %ebp
 6a8:	c3                   	ret    
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b0:	39 d0                	cmp    %edx,%eax
 6b2:	72 04                	jb     6b8 <free+0x58>
 6b4:	39 d1                	cmp    %edx,%ecx
 6b6:	72 ce                	jb     686 <free+0x26>
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b8:	89 d0                	mov    %edx,%eax
 6ba:	eb bc                	jmp    678 <free+0x18>
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6bc:	03 72 04             	add    0x4(%edx),%esi
 6bf:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c2:	8b 10                	mov    (%eax),%edx
 6c4:	8b 12                	mov    (%edx),%edx
 6c6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6c9:	8b 50 04             	mov    0x4(%eax),%edx
 6cc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6cf:	39 f1                	cmp    %esi,%ecx
 6d1:	75 ca                	jne    69d <free+0x3d>
    p->s.size += bp->s.size;
 6d3:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 6d6:	a3 d4 0b 00 00       	mov    %eax,0xbd4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6db:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6de:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6e1:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6e3:	5b                   	pop    %ebx
 6e4:	5e                   	pop    %esi
 6e5:	5f                   	pop    %edi
 6e6:	5d                   	pop    %ebp
 6e7:	c3                   	ret    
 6e8:	90                   	nop
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6fc:	8b 15 d4 0b 00 00    	mov    0xbd4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 702:	8d 70 07             	lea    0x7(%eax),%esi
 705:	c1 ee 03             	shr    $0x3,%esi
 708:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 70b:	85 d2                	test   %edx,%edx
 70d:	0f 84 a3 00 00 00    	je     7b6 <malloc+0xc6>
 713:	8b 02                	mov    (%edx),%eax
 715:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 718:	39 ce                	cmp    %ecx,%esi
 71a:	76 64                	jbe    780 <malloc+0x90>
 71c:	8d 1c f5 00 00 00 00 	lea    0x0(,%esi,8),%ebx
 723:	eb 0c                	jmp    731 <malloc+0x41>
 725:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 72a:	8b 48 04             	mov    0x4(%eax),%ecx
 72d:	39 ce                	cmp    %ecx,%esi
 72f:	76 4f                	jbe    780 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 731:	3b 05 d4 0b 00 00    	cmp    0xbd4,%eax
 737:	89 c2                	mov    %eax,%edx
 739:	75 ed                	jne    728 <malloc+0x38>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 73b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
 741:	77 5d                	ja     7a0 <malloc+0xb0>
 743:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
 748:	bf 00 10 00 00       	mov    $0x1000,%edi
  p = sbrk(nu * sizeof(Header));
 74d:	83 ec 0c             	sub    $0xc,%esp
 750:	50                   	push   %eax
 751:	e8 54 fc ff ff       	call   3aa <sbrk>
  if(p == (char*)-1)
 756:	83 c4 10             	add    $0x10,%esp
 759:	83 f8 ff             	cmp    $0xffffffff,%eax
 75c:	74 1c                	je     77a <malloc+0x8a>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 75e:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 761:	83 ec 0c             	sub    $0xc,%esp
 764:	83 c0 08             	add    $0x8,%eax
 767:	50                   	push   %eax
 768:	e8 f3 fe ff ff       	call   660 <free>
  return freep;
 76d:	8b 15 d4 0b 00 00    	mov    0xbd4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 773:	83 c4 10             	add    $0x10,%esp
 776:	85 d2                	test   %edx,%edx
 778:	75 ae                	jne    728 <malloc+0x38>
        return 0;
 77a:	31 c0                	xor    %eax,%eax
 77c:	eb 1a                	jmp    798 <malloc+0xa8>
 77e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 780:	39 ce                	cmp    %ecx,%esi
 782:	74 2c                	je     7b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 784:	29 f1                	sub    %esi,%ecx
 786:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 789:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 78c:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 78f:	89 15 d4 0b 00 00    	mov    %edx,0xbd4
      return (void*)(p + 1);
 795:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 798:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7a0:	89 d8                	mov    %ebx,%eax
 7a2:	89 f7                	mov    %esi,%edi
 7a4:	eb a7                	jmp    74d <malloc+0x5d>
 7a6:	8d 76 00             	lea    0x0(%esi),%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7b0:	8b 08                	mov    (%eax),%ecx
 7b2:	89 0a                	mov    %ecx,(%edx)
 7b4:	eb d9                	jmp    78f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7b6:	c7 05 d4 0b 00 00 d8 	movl   $0xbd8,0xbd4
 7bd:	0b 00 00 
 7c0:	c7 05 d8 0b 00 00 d8 	movl   $0xbd8,0xbd8
 7c7:	0b 00 00 
    base.s.size = 0;
 7ca:	b8 d8 0b 00 00       	mov    $0xbd8,%eax
 7cf:	c7 05 dc 0b 00 00 00 	movl   $0x0,0xbdc
 7d6:	00 00 00 
 7d9:	e9 3e ff ff ff       	jmp    71c <malloc+0x2c>
 7de:	66 90                	xchg   %ax,%ax

000007e0 <lock_init>:
  // the xchg function swaps the values of two variables
  // this primitive operation serves as the locking mechanism
  return result;
}

int lock_init(struct lock_t *lk) { 
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	8b 45 08             	mov    0x8(%ebp),%eax
  // initialize the lock
  if (lk) {
 7e6:	85 c0                	test   %eax,%eax
 7e8:	74 0d                	je     7f7 <lock_init+0x17>
    lk->lock = 0;
 7ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    return 1;
 7f0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    // just return an error, if lock ref is null
    return -1; 
  }
}
 7f5:	5d                   	pop    %ebp
 7f6:	c3                   	ret    
  if (lk) {
    lk->lock = 0;
    return 1;
  } else {
    // just return an error, if lock ref is null
    return -1; 
 7f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
 7fc:	5d                   	pop    %ebp
 7fd:	c3                   	ret    
 7fe:	66 90                	xchg   %ax,%ax

00000800 <lock_acquire>:

int lock_acquire(struct lock_t *lk) {
 800:	55                   	push   %ebp

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 801:	b8 01 00 00 00       	mov    $0x1,%eax
    // just return an error, if lock ref is null
    return -1; 
  }
}

int lock_acquire(struct lock_t *lk) {
 806:	89 e5                	mov    %esp,%ebp
 808:	56                   	push   %esi
 809:	53                   	push   %ebx
 80a:	8b 5d 08             	mov    0x8(%ebp),%ebx

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 80d:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 810:	85 c0                	test   %eax,%eax

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 812:	be 01 00 00 00       	mov    $0x1,%esi
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 817:	74 1d                	je     836 <lock_acquire+0x36>
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // use sleep to yield to the scheduler
    sleep(1);
 820:	83 ec 0c             	sub    $0xc,%esp
 823:	6a 01                	push   $0x1
 825:	e8 88 fb ff ff       	call   3b2 <sleep>

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 82a:	89 f0                	mov    %esi,%eax
 82c:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
 82f:	83 c4 10             	add    $0x10,%esp
 832:	85 c0                	test   %eax,%eax
 834:	75 ea                	jne    820 <lock_acquire+0x20>
    // use sleep to yield to the scheduler
    sleep(1);
  }
  return 1;
}
 836:	8d 65 f8             	lea    -0x8(%ebp),%esp
 839:	b8 01 00 00 00       	mov    $0x1,%eax
 83e:	5b                   	pop    %ebx
 83f:	5e                   	pop    %esi
 840:	5d                   	pop    %ebp
 841:	c3                   	ret    
 842:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000850 <lock_release>:

int lock_release(struct lock_t *lk) {
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
  // release lock by setting binary val to zero
  lk->lock = 0;
 853:	8b 45 08             	mov    0x8(%ebp),%eax
 856:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 1;
}
 85c:	b8 01 00 00 00       	mov    $0x1,%eax
 861:	5d                   	pop    %ebp
 862:	c3                   	ret    
