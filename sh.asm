
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f c9 00 00 00    	jg     ea <main+0xea>
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 95 12 00 00       	push   $0x1295
      2b:	e8 c2 0c 00 00       	call   cf2 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 25                	jmp    5e <main+0x5e>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 42 19 00 00 20 	cmpb   $0x20,0x1942
      47:	74 60                	je     a9 <main+0xa9>
      49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      50:	e8 1b 01 00 00       	call   170 <fork1>
      55:	85 c0                	test   %eax,%eax
      57:	74 36                	je     8f <main+0x8f>
      runcmd(parsecmd(buf));
    wait();
      59:	e8 5c 0c 00 00       	call   cba <wait>
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      5e:	83 ec 08             	sub    $0x8,%esp
      61:	6a 64                	push   $0x64
      63:	68 40 19 00 00       	push   $0x1940
      68:	e8 93 00 00 00       	call   100 <getcmd>
      6d:	83 c4 10             	add    $0x10,%esp
      70:	85 c0                	test   %eax,%eax
      72:	78 30                	js     a4 <main+0xa4>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      74:	80 3d 40 19 00 00 63 	cmpb   $0x63,0x1940
      7b:	75 d3                	jne    50 <main+0x50>
      7d:	80 3d 41 19 00 00 64 	cmpb   $0x64,0x1941
      84:	74 ba                	je     40 <main+0x40>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      86:	e8 e5 00 00 00       	call   170 <fork1>
      8b:	85 c0                	test   %eax,%eax
      8d:	75 ca                	jne    59 <main+0x59>
      runcmd(parsecmd(buf));
      8f:	83 ec 0c             	sub    $0xc,%esp
      92:	68 40 19 00 00       	push   $0x1940
      97:	e8 64 09 00 00       	call   a00 <parsecmd>
      9c:	89 04 24             	mov    %eax,(%esp)
      9f:	e8 ec 00 00 00       	call   190 <runcmd>
    wait();
  }
  exit();
      a4:	e8 09 0c 00 00       	call   cb2 <exit>

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      a9:	83 ec 0c             	sub    $0xc,%esp
      ac:	68 40 19 00 00       	push   $0x1940
      b1:	e8 3a 0a 00 00       	call   af0 <strlen>
      if(chdir(buf+3) < 0)
      b6:	c7 04 24 43 19 00 00 	movl   $0x1943,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      bd:	c6 80 3f 19 00 00 00 	movb   $0x0,0x193f(%eax)
      if(chdir(buf+3) < 0)
      c4:	e8 59 0c 00 00       	call   d22 <chdir>
      c9:	83 c4 10             	add    $0x10,%esp
      cc:	85 c0                	test   %eax,%eax
      ce:	79 8e                	jns    5e <main+0x5e>
        printf(2, "cannot cd %s\n", buf+3);
      d0:	50                   	push   %eax
      d1:	68 43 19 00 00       	push   $0x1943
      d6:	68 9d 12 00 00       	push   $0x129d
      db:	6a 02                	push   $0x2
      dd:	e8 4e 0d 00 00       	call   e30 <printf>
      e2:	83 c4 10             	add    $0x10,%esp
      e5:	e9 74 ff ff ff       	jmp    5e <main+0x5e>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      ea:	83 ec 0c             	sub    $0xc,%esp
      ed:	50                   	push   %eax
      ee:	e8 e7 0b 00 00       	call   cda <close>
      break;
      f3:	83 c4 10             	add    $0x10,%esp
      f6:	e9 63 ff ff ff       	jmp    5e <main+0x5e>
      fb:	66 90                	xchg   %ax,%ax
      fd:	66 90                	xchg   %ax,%ax
      ff:	90                   	nop

00000100 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	8b 75 0c             	mov    0xc(%ebp),%esi
     108:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     10b:	83 ec 08             	sub    $0x8,%esp
     10e:	68 f4 11 00 00       	push   $0x11f4
     113:	6a 02                	push   $0x2
     115:	e8 16 0d 00 00       	call   e30 <printf>
  memset(buf, 0, nbuf);
     11a:	83 c4 0c             	add    $0xc,%esp
     11d:	56                   	push   %esi
     11e:	6a 00                	push   $0x0
     120:	53                   	push   %ebx
     121:	e8 fa 09 00 00       	call   b20 <memset>
  gets(buf, nbuf);
     126:	58                   	pop    %eax
     127:	5a                   	pop    %edx
     128:	56                   	push   %esi
     129:	53                   	push   %ebx
     12a:	e8 51 0a 00 00       	call   b80 <gets>
  if(buf[0] == 0) // EOF
     12f:	83 c4 10             	add    $0x10,%esp
     132:	31 c0                	xor    %eax,%eax
     134:	80 3b 00             	cmpb   $0x0,(%ebx)
     137:	0f 94 c0             	sete   %al
    return -1;
  return 0;
}
     13a:	8d 65 f8             	lea    -0x8(%ebp),%esp
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
     13d:	f7 d8                	neg    %eax
    return -1;
  return 0;
}
     13f:	5b                   	pop    %ebx
     140:	5e                   	pop    %esi
     141:	5d                   	pop    %ebp
     142:	c3                   	ret    
     143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <panic>:
  exit();
}

void
panic(char *s)
{
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     156:	ff 75 08             	pushl  0x8(%ebp)
     159:	68 91 12 00 00       	push   $0x1291
     15e:	6a 02                	push   $0x2
     160:	e8 cb 0c 00 00       	call   e30 <printf>
  exit();
     165:	e8 48 0b 00 00       	call   cb2 <exit>
     16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <fork1>:
}

int
fork1(void)
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     176:	e8 2f 0b 00 00       	call   caa <fork>
  if(pid == -1)
     17b:	83 f8 ff             	cmp    $0xffffffff,%eax
     17e:	74 02                	je     182 <fork1+0x12>
    panic("fork");
  return pid;
}
     180:	c9                   	leave  
     181:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     182:	83 ec 0c             	sub    $0xc,%esp
     185:	68 f7 11 00 00       	push   $0x11f7
     18a:	e8 c1 ff ff ff       	call   150 <panic>
     18f:	90                   	nop

00000190 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	53                   	push   %ebx
     194:	83 ec 14             	sub    $0x14,%esp
     197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     19a:	85 db                	test   %ebx,%ebx
     19c:	74 64                	je     202 <runcmd+0x72>
    exit();

  switch(cmd->type){
     19e:	83 3b 05             	cmpl   $0x5,(%ebx)
     1a1:	0f 87 d8 00 00 00    	ja     27f <runcmd+0xef>
     1a7:	8b 03                	mov    (%ebx),%eax
     1a9:	ff 24 85 ac 12 00 00 	jmp    *0x12ac(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     1b0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1b3:	83 ec 0c             	sub    $0xc,%esp
     1b6:	50                   	push   %eax
     1b7:	e8 06 0b 00 00       	call   cc2 <pipe>
     1bc:	83 c4 10             	add    $0x10,%esp
     1bf:	85 c0                	test   %eax,%eax
     1c1:	0f 88 c5 00 00 00    	js     28c <runcmd+0xfc>
      panic("pipe");
    if(fork1() == 0){
     1c7:	e8 a4 ff ff ff       	call   170 <fork1>
     1cc:	85 c0                	test   %eax,%eax
     1ce:	0f 84 08 01 00 00    	je     2dc <runcmd+0x14c>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     1d4:	e8 97 ff ff ff       	call   170 <fork1>
     1d9:	85 c0                	test   %eax,%eax
     1db:	0f 84 cd 00 00 00    	je     2ae <runcmd+0x11e>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1e1:	83 ec 0c             	sub    $0xc,%esp
     1e4:	ff 75 f0             	pushl  -0x10(%ebp)
     1e7:	e8 ee 0a 00 00       	call   cda <close>
    close(p[1]);
     1ec:	58                   	pop    %eax
     1ed:	ff 75 f4             	pushl  -0xc(%ebp)
     1f0:	e8 e5 0a 00 00       	call   cda <close>
    wait();
     1f5:	e8 c0 0a 00 00       	call   cba <wait>
    wait();
     1fa:	e8 bb 0a 00 00       	call   cba <wait>
    break;
     1ff:	83 c4 10             	add    $0x10,%esp
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();
     202:	e8 ab 0a 00 00       	call   cb2 <exit>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     207:	e8 64 ff ff ff       	call   170 <fork1>
     20c:	85 c0                	test   %eax,%eax
     20e:	75 f2                	jne    202 <runcmd+0x72>
     210:	eb 62                	jmp    274 <runcmd+0xe4>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     212:	8b 43 04             	mov    0x4(%ebx),%eax
     215:	85 c0                	test   %eax,%eax
     217:	74 e9                	je     202 <runcmd+0x72>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     219:	52                   	push   %edx
     21a:	52                   	push   %edx
     21b:	8d 53 04             	lea    0x4(%ebx),%edx
     21e:	52                   	push   %edx
     21f:	50                   	push   %eax
     220:	e8 c5 0a 00 00       	call   cea <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     225:	83 c4 0c             	add    $0xc,%esp
     228:	ff 73 04             	pushl  0x4(%ebx)
     22b:	68 03 12 00 00       	push   $0x1203
     230:	6a 02                	push   $0x2
     232:	e8 f9 0b 00 00       	call   e30 <printf>
    break;
     237:	83 c4 10             	add    $0x10,%esp
     23a:	eb c6                	jmp    202 <runcmd+0x72>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     23c:	e8 2f ff ff ff       	call   170 <fork1>
     241:	85 c0                	test   %eax,%eax
     243:	74 2f                	je     274 <runcmd+0xe4>
      runcmd(lcmd->left);
    wait();
     245:	e8 70 0a 00 00       	call   cba <wait>
    runcmd(lcmd->right);
     24a:	83 ec 0c             	sub    $0xc,%esp
     24d:	ff 73 08             	pushl  0x8(%ebx)
     250:	e8 3b ff ff ff       	call   190 <runcmd>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     255:	83 ec 0c             	sub    $0xc,%esp
     258:	ff 73 14             	pushl  0x14(%ebx)
     25b:	e8 7a 0a 00 00       	call   cda <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     260:	59                   	pop    %ecx
     261:	58                   	pop    %eax
     262:	ff 73 10             	pushl  0x10(%ebx)
     265:	ff 73 08             	pushl  0x8(%ebx)
     268:	e8 85 0a 00 00       	call   cf2 <open>
     26d:	83 c4 10             	add    $0x10,%esp
     270:	85 c0                	test   %eax,%eax
     272:	78 25                	js     299 <runcmd+0x109>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     274:	83 ec 0c             	sub    $0xc,%esp
     277:	ff 73 04             	pushl  0x4(%ebx)
     27a:	e8 11 ff ff ff       	call   190 <runcmd>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
     27f:	83 ec 0c             	sub    $0xc,%esp
     282:	68 fc 11 00 00       	push   $0x11fc
     287:	e8 c4 fe ff ff       	call   150 <panic>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     28c:	83 ec 0c             	sub    $0xc,%esp
     28f:	68 23 12 00 00       	push   $0x1223
     294:	e8 b7 fe ff ff       	call   150 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     299:	52                   	push   %edx
     29a:	ff 73 08             	pushl  0x8(%ebx)
     29d:	68 13 12 00 00       	push   $0x1213
     2a2:	6a 02                	push   $0x2
     2a4:	e8 87 0b 00 00       	call   e30 <printf>
      exit();
     2a9:	e8 04 0a 00 00       	call   cb2 <exit>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     2ae:	83 ec 0c             	sub    $0xc,%esp
     2b1:	6a 00                	push   $0x0
     2b3:	e8 22 0a 00 00       	call   cda <close>
      dup(p[0]);
     2b8:	5a                   	pop    %edx
     2b9:	ff 75 f0             	pushl  -0x10(%ebp)
     2bc:	e8 69 0a 00 00       	call   d2a <dup>
      close(p[0]);
     2c1:	59                   	pop    %ecx
     2c2:	ff 75 f0             	pushl  -0x10(%ebp)
     2c5:	e8 10 0a 00 00       	call   cda <close>
      close(p[1]);
     2ca:	58                   	pop    %eax
     2cb:	ff 75 f4             	pushl  -0xc(%ebp)
     2ce:	e8 07 0a 00 00       	call   cda <close>
      runcmd(pcmd->right);
     2d3:	58                   	pop    %eax
     2d4:	ff 73 08             	pushl  0x8(%ebx)
     2d7:	e8 b4 fe ff ff       	call   190 <runcmd>
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     2dc:	83 ec 0c             	sub    $0xc,%esp
     2df:	6a 01                	push   $0x1
     2e1:	e8 f4 09 00 00       	call   cda <close>
      dup(p[1]);
     2e6:	58                   	pop    %eax
     2e7:	ff 75 f4             	pushl  -0xc(%ebp)
     2ea:	e8 3b 0a 00 00       	call   d2a <dup>
      close(p[0]);
     2ef:	58                   	pop    %eax
     2f0:	ff 75 f0             	pushl  -0x10(%ebp)
     2f3:	e8 e2 09 00 00       	call   cda <close>
      close(p[1]);
     2f8:	58                   	pop    %eax
     2f9:	ff 75 f4             	pushl  -0xc(%ebp)
     2fc:	e8 d9 09 00 00       	call   cda <close>
      runcmd(pcmd->left);
     301:	58                   	pop    %eax
     302:	ff 73 04             	pushl  0x4(%ebx)
     305:	e8 86 fe ff ff       	call   190 <runcmd>
     30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	53                   	push   %ebx
     314:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     317:	6a 54                	push   $0x54
     319:	e8 62 0d 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     31e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     321:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     323:	6a 54                	push   $0x54
     325:	6a 00                	push   $0x0
     327:	50                   	push   %eax
     328:	e8 f3 07 00 00       	call   b20 <memset>
  cmd->type = EXEC;
     32d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     333:	89 d8                	mov    %ebx,%eax
     335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     338:	c9                   	leave  
     339:	c3                   	ret    
     33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 18                	push   $0x18
     349:	e8 32 0d 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     351:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     353:	6a 18                	push   $0x18
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 c3 07 00 00       	call   b20 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     35d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     360:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     366:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     369:	8b 45 0c             	mov    0xc(%ebp),%eax
     36c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     36f:	8b 45 10             	mov    0x10(%ebp),%eax
     372:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     375:	8b 45 14             	mov    0x14(%ebp),%eax
     378:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     37b:	8b 45 18             	mov    0x18(%ebp),%eax
     37e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     381:	89 d8                	mov    %ebx,%eax
     383:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     386:	c9                   	leave  
     387:	c3                   	ret    
     388:	90                   	nop
     389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	53                   	push   %ebx
     394:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     397:	6a 0c                	push   $0xc
     399:	e8 e2 0c 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     39e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3a3:	6a 0c                	push   $0xc
     3a5:	6a 00                	push   $0x0
     3a7:	50                   	push   %eax
     3a8:	e8 73 07 00 00       	call   b20 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3ad:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     3b0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3b6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3bc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3bf:	89 d8                	mov    %ebx,%eax
     3c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c4:	c9                   	leave  
     3c5:	c3                   	ret    
     3c6:	8d 76 00             	lea    0x0(%esi),%esi
     3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	53                   	push   %ebx
     3d4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3d7:	6a 0c                	push   $0xc
     3d9:	e8 a2 0c 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3de:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3e3:	6a 0c                	push   $0xc
     3e5:	6a 00                	push   $0x0
     3e7:	50                   	push   %eax
     3e8:	e8 33 07 00 00       	call   b20 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3ed:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     3f0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     3f6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3fc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ff:	89 d8                	mov    %ebx,%eax
     401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     404:	c9                   	leave  
     405:	c3                   	ret    
     406:	8d 76 00             	lea    0x0(%esi),%esi
     409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	53                   	push   %ebx
     414:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     417:	6a 08                	push   $0x8
     419:	e8 62 0c 00 00       	call   1080 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     41e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     421:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     423:	6a 08                	push   $0x8
     425:	6a 00                	push   $0x0
     427:	50                   	push   %eax
     428:	e8 f3 06 00 00       	call   b20 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     42d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     430:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     436:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     439:	89 d8                	mov    %ebx,%eax
     43b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     43e:	c9                   	leave  
     43f:	c3                   	ret    

00000440 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	57                   	push   %edi
     444:	56                   	push   %esi
     445:	53                   	push   %ebx
     446:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     449:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     44c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     44f:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     452:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     454:	39 df                	cmp    %ebx,%edi
     456:	72 0f                	jb     467 <gettoken+0x27>
     458:	eb 25                	jmp    47f <gettoken+0x3f>
     45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     460:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     463:	39 df                	cmp    %ebx,%edi
     465:	74 18                	je     47f <gettoken+0x3f>
     467:	0f be 07             	movsbl (%edi),%eax
     46a:	83 ec 08             	sub    $0x8,%esp
     46d:	50                   	push   %eax
     46e:	68 08 19 00 00       	push   $0x1908
     473:	e8 c8 06 00 00       	call   b40 <strchr>
     478:	83 c4 10             	add    $0x10,%esp
     47b:	85 c0                	test   %eax,%eax
     47d:	75 e1                	jne    460 <gettoken+0x20>
    s++;
  if(q)
     47f:	85 f6                	test   %esi,%esi
     481:	74 02                	je     485 <gettoken+0x45>
    *q = s;
     483:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     485:	0f be 37             	movsbl (%edi),%esi
     488:	89 f1                	mov    %esi,%ecx
     48a:	89 f0                	mov    %esi,%eax
  switch(*s){
     48c:	80 f9 29             	cmp    $0x29,%cl
     48f:	7f 4f                	jg     4e0 <gettoken+0xa0>
     491:	80 f9 28             	cmp    $0x28,%cl
     494:	7d 55                	jge    4eb <gettoken+0xab>
     496:	84 c9                	test   %cl,%cl
     498:	0f 85 c2 00 00 00    	jne    560 <gettoken+0x120>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     49e:	8b 55 14             	mov    0x14(%ebp),%edx
     4a1:	85 d2                	test   %edx,%edx
     4a3:	74 05                	je     4aa <gettoken+0x6a>
    *eq = s;
     4a5:	8b 45 14             	mov    0x14(%ebp),%eax
     4a8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4aa:	39 fb                	cmp    %edi,%ebx
     4ac:	77 09                	ja     4b7 <gettoken+0x77>
     4ae:	eb 1f                	jmp    4cf <gettoken+0x8f>
    s++;
     4b0:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     4b3:	39 df                	cmp    %ebx,%edi
     4b5:	74 18                	je     4cf <gettoken+0x8f>
     4b7:	0f be 07             	movsbl (%edi),%eax
     4ba:	83 ec 08             	sub    $0x8,%esp
     4bd:	50                   	push   %eax
     4be:	68 08 19 00 00       	push   $0x1908
     4c3:	e8 78 06 00 00       	call   b40 <strchr>
     4c8:	83 c4 10             	add    $0x10,%esp
     4cb:	85 c0                	test   %eax,%eax
     4cd:	75 e1                	jne    4b0 <gettoken+0x70>
    s++;
  *ps = s;
     4cf:	8b 45 08             	mov    0x8(%ebp),%eax
     4d2:	89 38                	mov    %edi,(%eax)
  return ret;
}
     4d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4d7:	89 f0                	mov    %esi,%eax
     4d9:	5b                   	pop    %ebx
     4da:	5e                   	pop    %esi
     4db:	5f                   	pop    %edi
     4dc:	5d                   	pop    %ebp
     4dd:	c3                   	ret    
     4de:	66 90                	xchg   %ax,%ax
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     4e0:	80 f9 3e             	cmp    $0x3e,%cl
     4e3:	75 0b                	jne    4f0 <gettoken+0xb0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     4e5:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     4e9:	74 65                	je     550 <gettoken+0x110>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     4eb:	83 c7 01             	add    $0x1,%edi
     4ee:	eb ae                	jmp    49e <gettoken+0x5e>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     4f0:	7f 56                	jg     548 <gettoken+0x108>
     4f2:	83 e9 3b             	sub    $0x3b,%ecx
     4f5:	80 f9 01             	cmp    $0x1,%cl
     4f8:	76 f1                	jbe    4eb <gettoken+0xab>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4fa:	39 fb                	cmp    %edi,%ebx
     4fc:	77 24                	ja     522 <gettoken+0xe2>
     4fe:	eb 67                	jmp    567 <gettoken+0x127>
     500:	0f be 07             	movsbl (%edi),%eax
     503:	83 ec 08             	sub    $0x8,%esp
     506:	50                   	push   %eax
     507:	68 00 19 00 00       	push   $0x1900
     50c:	e8 2f 06 00 00       	call   b40 <strchr>
     511:	83 c4 10             	add    $0x10,%esp
     514:	85 c0                	test   %eax,%eax
     516:	75 1f                	jne    537 <gettoken+0xf7>
      s++;
     518:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     51b:	39 df                	cmp    %ebx,%edi
     51d:	74 48                	je     567 <gettoken+0x127>
     51f:	0f be 07             	movsbl (%edi),%eax
     522:	83 ec 08             	sub    $0x8,%esp
     525:	50                   	push   %eax
     526:	68 08 19 00 00       	push   $0x1908
     52b:	e8 10 06 00 00       	call   b40 <strchr>
     530:	83 c4 10             	add    $0x10,%esp
     533:	85 c0                	test   %eax,%eax
     535:	74 c9                	je     500 <gettoken+0xc0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     537:	be 61 00 00 00       	mov    $0x61,%esi
     53c:	e9 5d ff ff ff       	jmp    49e <gettoken+0x5e>
     541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     548:	80 f9 7c             	cmp    $0x7c,%cl
     54b:	74 9e                	je     4eb <gettoken+0xab>
     54d:	eb ab                	jmp    4fa <gettoken+0xba>
     54f:	90                   	nop
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     550:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     553:	be 2b 00 00 00       	mov    $0x2b,%esi
     558:	e9 41 ff ff ff       	jmp    49e <gettoken+0x5e>
     55d:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     560:	80 f9 26             	cmp    $0x26,%cl
     563:	75 95                	jne    4fa <gettoken+0xba>
     565:	eb 84                	jmp    4eb <gettoken+0xab>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     567:	8b 45 14             	mov    0x14(%ebp),%eax
     56a:	be 61 00 00 00       	mov    $0x61,%esi
     56f:	85 c0                	test   %eax,%eax
     571:	0f 85 2e ff ff ff    	jne    4a5 <gettoken+0x65>
     577:	e9 53 ff ff ff       	jmp    4cf <gettoken+0x8f>
     57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000580 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     580:	55                   	push   %ebp
     581:	89 e5                	mov    %esp,%ebp
     583:	57                   	push   %edi
     584:	56                   	push   %esi
     585:	53                   	push   %ebx
     586:	83 ec 0c             	sub    $0xc,%esp
     589:	8b 7d 08             	mov    0x8(%ebp),%edi
     58c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     58f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     591:	39 f3                	cmp    %esi,%ebx
     593:	72 12                	jb     5a7 <peek+0x27>
     595:	eb 28                	jmp    5bf <peek+0x3f>
     597:	89 f6                	mov    %esi,%esi
     599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     5a0:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     5a3:	39 f3                	cmp    %esi,%ebx
     5a5:	74 18                	je     5bf <peek+0x3f>
     5a7:	0f be 03             	movsbl (%ebx),%eax
     5aa:	83 ec 08             	sub    $0x8,%esp
     5ad:	50                   	push   %eax
     5ae:	68 08 19 00 00       	push   $0x1908
     5b3:	e8 88 05 00 00       	call   b40 <strchr>
     5b8:	83 c4 10             	add    $0x10,%esp
     5bb:	85 c0                	test   %eax,%eax
     5bd:	75 e1                	jne    5a0 <peek+0x20>
    s++;
  *ps = s;
     5bf:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     5c1:	0f be 13             	movsbl (%ebx),%edx
     5c4:	31 c0                	xor    %eax,%eax
     5c6:	84 d2                	test   %dl,%dl
     5c8:	74 17                	je     5e1 <peek+0x61>
     5ca:	83 ec 08             	sub    $0x8,%esp
     5cd:	52                   	push   %edx
     5ce:	ff 75 10             	pushl  0x10(%ebp)
     5d1:	e8 6a 05 00 00       	call   b40 <strchr>
     5d6:	83 c4 10             	add    $0x10,%esp
     5d9:	85 c0                	test   %eax,%eax
     5db:	0f 95 c0             	setne  %al
     5de:	0f b6 c0             	movzbl %al,%eax
}
     5e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5e4:	5b                   	pop    %ebx
     5e5:	5e                   	pop    %esi
     5e6:	5f                   	pop    %edi
     5e7:	5d                   	pop    %ebp
     5e8:	c3                   	ret    
     5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005f0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     5f0:	55                   	push   %ebp
     5f1:	89 e5                	mov    %esp,%ebp
     5f3:	57                   	push   %edi
     5f4:	56                   	push   %esi
     5f5:	53                   	push   %ebx
     5f6:	83 ec 1c             	sub    $0x1c,%esp
     5f9:	8b 75 0c             	mov    0xc(%ebp),%esi
     5fc:	8b 5d 10             	mov    0x10(%ebp),%ebx
     5ff:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     600:	83 ec 04             	sub    $0x4,%esp
     603:	68 45 12 00 00       	push   $0x1245
     608:	53                   	push   %ebx
     609:	56                   	push   %esi
     60a:	e8 71 ff ff ff       	call   580 <peek>
     60f:	83 c4 10             	add    $0x10,%esp
     612:	85 c0                	test   %eax,%eax
     614:	74 6a                	je     680 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     616:	6a 00                	push   $0x0
     618:	6a 00                	push   $0x0
     61a:	53                   	push   %ebx
     61b:	56                   	push   %esi
     61c:	e8 1f fe ff ff       	call   440 <gettoken>
     621:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     623:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     626:	50                   	push   %eax
     627:	8d 45 e0             	lea    -0x20(%ebp),%eax
     62a:	50                   	push   %eax
     62b:	53                   	push   %ebx
     62c:	56                   	push   %esi
     62d:	e8 0e fe ff ff       	call   440 <gettoken>
     632:	83 c4 20             	add    $0x20,%esp
     635:	83 f8 61             	cmp    $0x61,%eax
     638:	75 51                	jne    68b <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     63a:	83 ff 3c             	cmp    $0x3c,%edi
     63d:	74 31                	je     670 <parseredirs+0x80>
     63f:	83 ff 3e             	cmp    $0x3e,%edi
     642:	74 05                	je     649 <parseredirs+0x59>
     644:	83 ff 2b             	cmp    $0x2b,%edi
     647:	75 b7                	jne    600 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     649:	83 ec 0c             	sub    $0xc,%esp
     64c:	6a 01                	push   $0x1
     64e:	68 01 02 00 00       	push   $0x201
     653:	ff 75 e4             	pushl  -0x1c(%ebp)
     656:	ff 75 e0             	pushl  -0x20(%ebp)
     659:	ff 75 08             	pushl  0x8(%ebp)
     65c:	e8 df fc ff ff       	call   340 <redircmd>
      break;
     661:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     664:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     667:	eb 97                	jmp    600 <parseredirs+0x10>
     669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     670:	83 ec 0c             	sub    $0xc,%esp
     673:	6a 00                	push   $0x0
     675:	6a 00                	push   $0x0
     677:	eb da                	jmp    653 <parseredirs+0x63>
     679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     680:	8b 45 08             	mov    0x8(%ebp),%eax
     683:	8d 65 f4             	lea    -0xc(%ebp),%esp
     686:	5b                   	pop    %ebx
     687:	5e                   	pop    %esi
     688:	5f                   	pop    %edi
     689:	5d                   	pop    %ebp
     68a:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     68b:	83 ec 0c             	sub    $0xc,%esp
     68e:	68 28 12 00 00       	push   $0x1228
     693:	e8 b8 fa ff ff       	call   150 <panic>
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006a0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     6a0:	55                   	push   %ebp
     6a1:	89 e5                	mov    %esp,%ebp
     6a3:	57                   	push   %edi
     6a4:	56                   	push   %esi
     6a5:	53                   	push   %ebx
     6a6:	83 ec 30             	sub    $0x30,%esp
     6a9:	8b 75 08             	mov    0x8(%ebp),%esi
     6ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     6af:	68 48 12 00 00       	push   $0x1248
     6b4:	57                   	push   %edi
     6b5:	56                   	push   %esi
     6b6:	e8 c5 fe ff ff       	call   580 <peek>
     6bb:	83 c4 10             	add    $0x10,%esp
     6be:	85 c0                	test   %eax,%eax
     6c0:	0f 85 9a 00 00 00    	jne    760 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
     6c6:	e8 45 fc ff ff       	call   310 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     6cb:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     6ce:	89 c3                	mov    %eax,%ebx
     6d0:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     6d3:	57                   	push   %edi
     6d4:	56                   	push   %esi
     6d5:	8d 5b 04             	lea    0x4(%ebx),%ebx
     6d8:	50                   	push   %eax
     6d9:	e8 12 ff ff ff       	call   5f0 <parseredirs>
     6de:	83 c4 10             	add    $0x10,%esp
     6e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     6e4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     6eb:	eb 16                	jmp    703 <parseexec+0x63>
     6ed:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     6f0:	83 ec 04             	sub    $0x4,%esp
     6f3:	57                   	push   %edi
     6f4:	56                   	push   %esi
     6f5:	ff 75 d0             	pushl  -0x30(%ebp)
     6f8:	e8 f3 fe ff ff       	call   5f0 <parseredirs>
     6fd:	83 c4 10             	add    $0x10,%esp
     700:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     703:	83 ec 04             	sub    $0x4,%esp
     706:	68 5f 12 00 00       	push   $0x125f
     70b:	57                   	push   %edi
     70c:	56                   	push   %esi
     70d:	e8 6e fe ff ff       	call   580 <peek>
     712:	83 c4 10             	add    $0x10,%esp
     715:	85 c0                	test   %eax,%eax
     717:	75 5f                	jne    778 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     719:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     71c:	50                   	push   %eax
     71d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     720:	50                   	push   %eax
     721:	57                   	push   %edi
     722:	56                   	push   %esi
     723:	e8 18 fd ff ff       	call   440 <gettoken>
     728:	83 c4 10             	add    $0x10,%esp
     72b:	85 c0                	test   %eax,%eax
     72d:	74 49                	je     778 <parseexec+0xd8>
      break;
    if(tok != 'a')
     72f:	83 f8 61             	cmp    $0x61,%eax
     732:	75 66                	jne    79a <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
     734:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     737:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     73b:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     73e:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
     741:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     744:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
     747:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
     74a:	83 f8 0a             	cmp    $0xa,%eax
     74d:	75 a1                	jne    6f0 <parseexec+0x50>
      panic("too many args");
     74f:	83 ec 0c             	sub    $0xc,%esp
     752:	68 51 12 00 00       	push   $0x1251
     757:	e8 f4 f9 ff ff       	call   150 <panic>
     75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     760:	83 ec 08             	sub    $0x8,%esp
     763:	57                   	push   %edi
     764:	56                   	push   %esi
     765:	e8 56 01 00 00       	call   8c0 <parseblock>
     76a:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     76d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     770:	5b                   	pop    %ebx
     771:	5e                   	pop    %esi
     772:	5f                   	pop    %edi
     773:	5d                   	pop    %ebp
     774:	c3                   	ret    
     775:	8d 76 00             	lea    0x0(%esi),%esi
     778:	8b 45 cc             	mov    -0x34(%ebp),%eax
     77b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     77e:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     781:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     788:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     78f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
     792:	8d 65 f4             	lea    -0xc(%ebp),%esp
     795:	5b                   	pop    %ebx
     796:	5e                   	pop    %esi
     797:	5f                   	pop    %edi
     798:	5d                   	pop    %ebp
     799:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     79a:	83 ec 0c             	sub    $0xc,%esp
     79d:	68 4a 12 00 00       	push   $0x124a
     7a2:	e8 a9 f9 ff ff       	call   150 <panic>
     7a7:	89 f6                	mov    %esi,%esi
     7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007b0 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     7b0:	55                   	push   %ebp
     7b1:	89 e5                	mov    %esp,%ebp
     7b3:	57                   	push   %edi
     7b4:	56                   	push   %esi
     7b5:	53                   	push   %ebx
     7b6:	83 ec 14             	sub    $0x14,%esp
     7b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     7bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     7bf:	56                   	push   %esi
     7c0:	53                   	push   %ebx
     7c1:	e8 da fe ff ff       	call   6a0 <parseexec>
  if(peek(ps, es, "|")){
     7c6:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     7c9:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     7cb:	68 64 12 00 00       	push   $0x1264
     7d0:	56                   	push   %esi
     7d1:	53                   	push   %ebx
     7d2:	e8 a9 fd ff ff       	call   580 <peek>
     7d7:	83 c4 10             	add    $0x10,%esp
     7da:	85 c0                	test   %eax,%eax
     7dc:	75 12                	jne    7f0 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     7de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7e1:	89 f8                	mov    %edi,%eax
     7e3:	5b                   	pop    %ebx
     7e4:	5e                   	pop    %esi
     7e5:	5f                   	pop    %edi
     7e6:	5d                   	pop    %ebp
     7e7:	c3                   	ret    
     7e8:	90                   	nop
     7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     7f0:	6a 00                	push   $0x0
     7f2:	6a 00                	push   $0x0
     7f4:	56                   	push   %esi
     7f5:	53                   	push   %ebx
     7f6:	e8 45 fc ff ff       	call   440 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     7fb:	58                   	pop    %eax
     7fc:	5a                   	pop    %edx
     7fd:	56                   	push   %esi
     7fe:	53                   	push   %ebx
     7ff:	e8 ac ff ff ff       	call   7b0 <parsepipe>
     804:	89 7d 08             	mov    %edi,0x8(%ebp)
     807:	89 45 0c             	mov    %eax,0xc(%ebp)
     80a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     80d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     810:	5b                   	pop    %ebx
     811:	5e                   	pop    %esi
     812:	5f                   	pop    %edi
     813:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     814:	e9 77 fb ff ff       	jmp    390 <pipecmd>
     819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000820 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	57                   	push   %edi
     824:	56                   	push   %esi
     825:	53                   	push   %ebx
     826:	83 ec 14             	sub    $0x14,%esp
     829:	8b 5d 08             	mov    0x8(%ebp),%ebx
     82c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     82f:	56                   	push   %esi
     830:	53                   	push   %ebx
     831:	e8 7a ff ff ff       	call   7b0 <parsepipe>
  while(peek(ps, es, "&")){
     836:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     839:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     83b:	eb 1b                	jmp    858 <parseline+0x38>
     83d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     840:	6a 00                	push   $0x0
     842:	6a 00                	push   $0x0
     844:	56                   	push   %esi
     845:	53                   	push   %ebx
     846:	e8 f5 fb ff ff       	call   440 <gettoken>
    cmd = backcmd(cmd);
     84b:	89 3c 24             	mov    %edi,(%esp)
     84e:	e8 bd fb ff ff       	call   410 <backcmd>
     853:	83 c4 10             	add    $0x10,%esp
     856:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     858:	83 ec 04             	sub    $0x4,%esp
     85b:	68 66 12 00 00       	push   $0x1266
     860:	56                   	push   %esi
     861:	53                   	push   %ebx
     862:	e8 19 fd ff ff       	call   580 <peek>
     867:	83 c4 10             	add    $0x10,%esp
     86a:	85 c0                	test   %eax,%eax
     86c:	75 d2                	jne    840 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     86e:	83 ec 04             	sub    $0x4,%esp
     871:	68 62 12 00 00       	push   $0x1262
     876:	56                   	push   %esi
     877:	53                   	push   %ebx
     878:	e8 03 fd ff ff       	call   580 <peek>
     87d:	83 c4 10             	add    $0x10,%esp
     880:	85 c0                	test   %eax,%eax
     882:	75 0c                	jne    890 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     884:	8d 65 f4             	lea    -0xc(%ebp),%esp
     887:	89 f8                	mov    %edi,%eax
     889:	5b                   	pop    %ebx
     88a:	5e                   	pop    %esi
     88b:	5f                   	pop    %edi
     88c:	5d                   	pop    %ebp
     88d:	c3                   	ret    
     88e:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     890:	6a 00                	push   $0x0
     892:	6a 00                	push   $0x0
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	e8 a5 fb ff ff       	call   440 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     89b:	58                   	pop    %eax
     89c:	5a                   	pop    %edx
     89d:	56                   	push   %esi
     89e:	53                   	push   %ebx
     89f:	e8 7c ff ff ff       	call   820 <parseline>
     8a4:	89 7d 08             	mov    %edi,0x8(%ebp)
     8a7:	89 45 0c             	mov    %eax,0xc(%ebp)
     8aa:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     8ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8b0:	5b                   	pop    %ebx
     8b1:	5e                   	pop    %esi
     8b2:	5f                   	pop    %edi
     8b3:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     8b4:	e9 17 fb ff ff       	jmp    3d0 <listcmd>
     8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008c0 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	57                   	push   %edi
     8c4:	56                   	push   %esi
     8c5:	53                   	push   %ebx
     8c6:	83 ec 10             	sub    $0x10,%esp
     8c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     8cf:	68 48 12 00 00       	push   $0x1248
     8d4:	56                   	push   %esi
     8d5:	53                   	push   %ebx
     8d6:	e8 a5 fc ff ff       	call   580 <peek>
     8db:	83 c4 10             	add    $0x10,%esp
     8de:	85 c0                	test   %eax,%eax
     8e0:	74 4a                	je     92c <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     8e2:	6a 00                	push   $0x0
     8e4:	6a 00                	push   $0x0
     8e6:	56                   	push   %esi
     8e7:	53                   	push   %ebx
     8e8:	e8 53 fb ff ff       	call   440 <gettoken>
  cmd = parseline(ps, es);
     8ed:	58                   	pop    %eax
     8ee:	5a                   	pop    %edx
     8ef:	56                   	push   %esi
     8f0:	53                   	push   %ebx
     8f1:	e8 2a ff ff ff       	call   820 <parseline>
  if(!peek(ps, es, ")"))
     8f6:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     8f9:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     8fb:	68 84 12 00 00       	push   $0x1284
     900:	56                   	push   %esi
     901:	53                   	push   %ebx
     902:	e8 79 fc ff ff       	call   580 <peek>
     907:	83 c4 10             	add    $0x10,%esp
     90a:	85 c0                	test   %eax,%eax
     90c:	74 2b                	je     939 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     90e:	6a 00                	push   $0x0
     910:	6a 00                	push   $0x0
     912:	56                   	push   %esi
     913:	53                   	push   %ebx
     914:	e8 27 fb ff ff       	call   440 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     919:	83 c4 0c             	add    $0xc,%esp
     91c:	56                   	push   %esi
     91d:	53                   	push   %ebx
     91e:	57                   	push   %edi
     91f:	e8 cc fc ff ff       	call   5f0 <parseredirs>
  return cmd;
}
     924:	8d 65 f4             	lea    -0xc(%ebp),%esp
     927:	5b                   	pop    %ebx
     928:	5e                   	pop    %esi
     929:	5f                   	pop    %edi
     92a:	5d                   	pop    %ebp
     92b:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     92c:	83 ec 0c             	sub    $0xc,%esp
     92f:	68 68 12 00 00       	push   $0x1268
     934:	e8 17 f8 ff ff       	call   150 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     939:	83 ec 0c             	sub    $0xc,%esp
     93c:	68 73 12 00 00       	push   $0x1273
     941:	e8 0a f8 ff ff       	call   150 <panic>
     946:	8d 76 00             	lea    0x0(%esi),%esi
     949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000950 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     950:	55                   	push   %ebp
     951:	89 e5                	mov    %esp,%ebp
     953:	53                   	push   %ebx
     954:	83 ec 04             	sub    $0x4,%esp
     957:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     95a:	85 db                	test   %ebx,%ebx
     95c:	0f 84 96 00 00 00    	je     9f8 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
     962:	83 3b 05             	cmpl   $0x5,(%ebx)
     965:	77 48                	ja     9af <nulterminate+0x5f>
     967:	8b 03                	mov    (%ebx),%eax
     969:	ff 24 85 c4 12 00 00 	jmp    *0x12c4(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     970:	83 ec 0c             	sub    $0xc,%esp
     973:	ff 73 04             	pushl  0x4(%ebx)
     976:	e8 d5 ff ff ff       	call   950 <nulterminate>
    nulterminate(lcmd->right);
     97b:	58                   	pop    %eax
     97c:	ff 73 08             	pushl  0x8(%ebx)
     97f:	e8 cc ff ff ff       	call   950 <nulterminate>
    break;
     984:	83 c4 10             	add    $0x10,%esp
     987:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     989:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     98c:	c9                   	leave  
     98d:	c3                   	ret    
     98e:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     990:	8b 4b 04             	mov    0x4(%ebx),%ecx
     993:	8d 43 2c             	lea    0x2c(%ebx),%eax
     996:	85 c9                	test   %ecx,%ecx
     998:	74 15                	je     9af <nulterminate+0x5f>
     99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     9a0:	8b 10                	mov    (%eax),%edx
     9a2:	83 c0 04             	add    $0x4,%eax
     9a5:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     9a8:	8b 50 d8             	mov    -0x28(%eax),%edx
     9ab:	85 d2                	test   %edx,%edx
     9ad:	75 f1                	jne    9a0 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     9af:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     9b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9b4:	c9                   	leave  
     9b5:	c3                   	ret    
     9b6:	8d 76 00             	lea    0x0(%esi),%esi
     9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     9c0:	83 ec 0c             	sub    $0xc,%esp
     9c3:	ff 73 04             	pushl  0x4(%ebx)
     9c6:	e8 85 ff ff ff       	call   950 <nulterminate>
    break;
     9cb:	89 d8                	mov    %ebx,%eax
     9cd:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     9d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9d3:	c9                   	leave  
     9d4:	c3                   	ret    
     9d5:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     9d8:	83 ec 0c             	sub    $0xc,%esp
     9db:	ff 73 04             	pushl  0x4(%ebx)
     9de:	e8 6d ff ff ff       	call   950 <nulterminate>
    *rcmd->efile = 0;
     9e3:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     9e6:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     9e9:	c6 00 00             	movb   $0x0,(%eax)
    break;
     9ec:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     9ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9f1:	c9                   	leave  
     9f2:	c3                   	ret    
     9f3:	90                   	nop
     9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     9f8:	31 c0                	xor    %eax,%eax
     9fa:	eb 8d                	jmp    989 <nulterminate+0x39>
     9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a00 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     a00:	55                   	push   %ebp
     a01:	89 e5                	mov    %esp,%ebp
     a03:	56                   	push   %esi
     a04:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     a05:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a08:	83 ec 0c             	sub    $0xc,%esp
     a0b:	53                   	push   %ebx
     a0c:	e8 df 00 00 00       	call   af0 <strlen>
  cmd = parseline(&s, es);
     a11:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     a12:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     a14:	8d 45 08             	lea    0x8(%ebp),%eax
     a17:	5e                   	pop    %esi
     a18:	53                   	push   %ebx
     a19:	50                   	push   %eax
     a1a:	e8 01 fe ff ff       	call   820 <parseline>
     a1f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     a21:	8d 45 08             	lea    0x8(%ebp),%eax
     a24:	83 c4 0c             	add    $0xc,%esp
     a27:	68 12 12 00 00       	push   $0x1212
     a2c:	53                   	push   %ebx
     a2d:	50                   	push   %eax
     a2e:	e8 4d fb ff ff       	call   580 <peek>
  if(s != es){
     a33:	8b 45 08             	mov    0x8(%ebp),%eax
     a36:	83 c4 10             	add    $0x10,%esp
     a39:	39 d8                	cmp    %ebx,%eax
     a3b:	75 12                	jne    a4f <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     a3d:	83 ec 0c             	sub    $0xc,%esp
     a40:	56                   	push   %esi
     a41:	e8 0a ff ff ff       	call   950 <nulterminate>
  return cmd;
}
     a46:	8d 65 f8             	lea    -0x8(%ebp),%esp
     a49:	89 f0                	mov    %esi,%eax
     a4b:	5b                   	pop    %ebx
     a4c:	5e                   	pop    %esi
     a4d:	5d                   	pop    %ebp
     a4e:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     a4f:	52                   	push   %edx
     a50:	50                   	push   %eax
     a51:	68 86 12 00 00       	push   $0x1286
     a56:	6a 02                	push   $0x2
     a58:	e8 d3 03 00 00       	call   e30 <printf>
    panic("syntax");
     a5d:	c7 04 24 4a 12 00 00 	movl   $0x124a,(%esp)
     a64:	e8 e7 f6 ff ff       	call   150 <panic>
     a69:	66 90                	xchg   %ax,%ax
     a6b:	66 90                	xchg   %ax,%ax
     a6d:	66 90                	xchg   %ax,%ax
     a6f:	90                   	nop

00000a70 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	53                   	push   %ebx
     a74:	8b 45 08             	mov    0x8(%ebp),%eax
     a77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     a7a:	89 c2                	mov    %eax,%edx
     a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a80:	83 c1 01             	add    $0x1,%ecx
     a83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     a87:	83 c2 01             	add    $0x1,%edx
     a8a:	84 db                	test   %bl,%bl
     a8c:	88 5a ff             	mov    %bl,-0x1(%edx)
     a8f:	75 ef                	jne    a80 <strcpy+0x10>
    ;
  return os;
}
     a91:	5b                   	pop    %ebx
     a92:	5d                   	pop    %ebp
     a93:	c3                   	ret    
     a94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000aa0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	56                   	push   %esi
     aa4:	53                   	push   %ebx
     aa5:	8b 55 08             	mov    0x8(%ebp),%edx
     aa8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     aab:	0f b6 02             	movzbl (%edx),%eax
     aae:	0f b6 19             	movzbl (%ecx),%ebx
     ab1:	84 c0                	test   %al,%al
     ab3:	75 1e                	jne    ad3 <strcmp+0x33>
     ab5:	eb 29                	jmp    ae0 <strcmp+0x40>
     ab7:	89 f6                	mov    %esi,%esi
     ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     ac0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     ac3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     ac6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     ac9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     acd:	84 c0                	test   %al,%al
     acf:	74 0f                	je     ae0 <strcmp+0x40>
     ad1:	89 f1                	mov    %esi,%ecx
     ad3:	38 d8                	cmp    %bl,%al
     ad5:	74 e9                	je     ac0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     ad7:	29 d8                	sub    %ebx,%eax
}
     ad9:	5b                   	pop    %ebx
     ada:	5e                   	pop    %esi
     adb:	5d                   	pop    %ebp
     adc:	c3                   	ret    
     add:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     ae0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     ae2:	29 d8                	sub    %ebx,%eax
}
     ae4:	5b                   	pop    %ebx
     ae5:	5e                   	pop    %esi
     ae6:	5d                   	pop    %ebp
     ae7:	c3                   	ret    
     ae8:	90                   	nop
     ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000af0 <strlen>:

uint
strlen(char *s)
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     af6:	80 39 00             	cmpb   $0x0,(%ecx)
     af9:	74 12                	je     b0d <strlen+0x1d>
     afb:	31 d2                	xor    %edx,%edx
     afd:	8d 76 00             	lea    0x0(%esi),%esi
     b00:	83 c2 01             	add    $0x1,%edx
     b03:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     b07:	89 d0                	mov    %edx,%eax
     b09:	75 f5                	jne    b00 <strlen+0x10>
    ;
  return n;
}
     b0b:	5d                   	pop    %ebp
     b0c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     b0d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     b0f:	5d                   	pop    %ebp
     b10:	c3                   	ret    
     b11:	eb 0d                	jmp    b20 <memset>
     b13:	90                   	nop
     b14:	90                   	nop
     b15:	90                   	nop
     b16:	90                   	nop
     b17:	90                   	nop
     b18:	90                   	nop
     b19:	90                   	nop
     b1a:	90                   	nop
     b1b:	90                   	nop
     b1c:	90                   	nop
     b1d:	90                   	nop
     b1e:	90                   	nop
     b1f:	90                   	nop

00000b20 <memset>:

void*
memset(void *dst, int c, uint n)
{
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	57                   	push   %edi
     b24:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     b27:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b2a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b2d:	89 d7                	mov    %edx,%edi
     b2f:	fc                   	cld    
     b30:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b32:	89 d0                	mov    %edx,%eax
     b34:	5f                   	pop    %edi
     b35:	5d                   	pop    %ebp
     b36:	c3                   	ret    
     b37:	89 f6                	mov    %esi,%esi
     b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b40 <strchr>:

char*
strchr(const char *s, char c)
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	53                   	push   %ebx
     b44:	8b 45 08             	mov    0x8(%ebp),%eax
     b47:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
     b4a:	0f b6 18             	movzbl (%eax),%ebx
     b4d:	84 db                	test   %bl,%bl
     b4f:	74 1d                	je     b6e <strchr+0x2e>
    if(*s == c)
     b51:	38 d3                	cmp    %dl,%bl
     b53:	89 d1                	mov    %edx,%ecx
     b55:	75 0d                	jne    b64 <strchr+0x24>
     b57:	eb 17                	jmp    b70 <strchr+0x30>
     b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b60:	38 ca                	cmp    %cl,%dl
     b62:	74 0c                	je     b70 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     b64:	83 c0 01             	add    $0x1,%eax
     b67:	0f b6 10             	movzbl (%eax),%edx
     b6a:	84 d2                	test   %dl,%dl
     b6c:	75 f2                	jne    b60 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     b6e:	31 c0                	xor    %eax,%eax
}
     b70:	5b                   	pop    %ebx
     b71:	5d                   	pop    %ebp
     b72:	c3                   	ret    
     b73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b80 <gets>:

char*
gets(char *buf, int max)
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	57                   	push   %edi
     b84:	56                   	push   %esi
     b85:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b86:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     b88:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     b8b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b8e:	eb 29                	jmp    bb9 <gets+0x39>
    cc = read(0, &c, 1);
     b90:	83 ec 04             	sub    $0x4,%esp
     b93:	6a 01                	push   $0x1
     b95:	57                   	push   %edi
     b96:	6a 00                	push   $0x0
     b98:	e8 2d 01 00 00       	call   cca <read>
    if(cc < 1)
     b9d:	83 c4 10             	add    $0x10,%esp
     ba0:	85 c0                	test   %eax,%eax
     ba2:	7e 1d                	jle    bc1 <gets+0x41>
      break;
    buf[i++] = c;
     ba4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     ba8:	8b 55 08             	mov    0x8(%ebp),%edx
     bab:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     bad:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     baf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     bb3:	74 1b                	je     bd0 <gets+0x50>
     bb5:	3c 0a                	cmp    $0xa,%al
     bb7:	74 17                	je     bd0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     bb9:	8d 5e 01             	lea    0x1(%esi),%ebx
     bbc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     bbf:	7c cf                	jl     b90 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     bc1:	8b 45 08             	mov    0x8(%ebp),%eax
     bc4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     bc8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bcb:	5b                   	pop    %ebx
     bcc:	5e                   	pop    %esi
     bcd:	5f                   	pop    %edi
     bce:	5d                   	pop    %ebp
     bcf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     bd0:	8b 45 08             	mov    0x8(%ebp),%eax
     bd3:	89 de                	mov    %ebx,%esi
     bd5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     bd9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bdc:	5b                   	pop    %ebx
     bdd:	5e                   	pop    %esi
     bde:	5f                   	pop    %edi
     bdf:	5d                   	pop    %ebp
     be0:	c3                   	ret    
     be1:	eb 0d                	jmp    bf0 <stat>
     be3:	90                   	nop
     be4:	90                   	nop
     be5:	90                   	nop
     be6:	90                   	nop
     be7:	90                   	nop
     be8:	90                   	nop
     be9:	90                   	nop
     bea:	90                   	nop
     beb:	90                   	nop
     bec:	90                   	nop
     bed:	90                   	nop
     bee:	90                   	nop
     bef:	90                   	nop

00000bf0 <stat>:

int
stat(char *n, struct stat *st)
{
     bf0:	55                   	push   %ebp
     bf1:	89 e5                	mov    %esp,%ebp
     bf3:	56                   	push   %esi
     bf4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     bf5:	83 ec 08             	sub    $0x8,%esp
     bf8:	6a 00                	push   $0x0
     bfa:	ff 75 08             	pushl  0x8(%ebp)
     bfd:	e8 f0 00 00 00       	call   cf2 <open>
  if(fd < 0)
     c02:	83 c4 10             	add    $0x10,%esp
     c05:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c07:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     c09:	78 25                	js     c30 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     c0b:	83 ec 08             	sub    $0x8,%esp
     c0e:	ff 75 0c             	pushl  0xc(%ebp)
     c11:	50                   	push   %eax
     c12:	e8 f3 00 00 00       	call   d0a <fstat>
     c17:	89 c6                	mov    %eax,%esi
  close(fd);
     c19:	89 1c 24             	mov    %ebx,(%esp)
     c1c:	e8 b9 00 00 00       	call   cda <close>
  return r;
     c21:	83 c4 10             	add    $0x10,%esp
     c24:	89 f0                	mov    %esi,%eax
}
     c26:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c29:	5b                   	pop    %ebx
     c2a:	5e                   	pop    %esi
     c2b:	5d                   	pop    %ebp
     c2c:	c3                   	ret    
     c2d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     c30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     c35:	eb ef                	jmp    c26 <stat+0x36>
     c37:	89 f6                	mov    %esi,%esi
     c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c40 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	53                   	push   %ebx
     c44:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c47:	0f be 11             	movsbl (%ecx),%edx
     c4a:	8d 42 d0             	lea    -0x30(%edx),%eax
     c4d:	3c 09                	cmp    $0x9,%al
     c4f:	b8 00 00 00 00       	mov    $0x0,%eax
     c54:	77 1f                	ja     c75 <atoi+0x35>
     c56:	8d 76 00             	lea    0x0(%esi),%esi
     c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     c60:	8d 04 80             	lea    (%eax,%eax,4),%eax
     c63:	83 c1 01             	add    $0x1,%ecx
     c66:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c6a:	0f be 11             	movsbl (%ecx),%edx
     c6d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     c70:	80 fb 09             	cmp    $0x9,%bl
     c73:	76 eb                	jbe    c60 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     c75:	5b                   	pop    %ebx
     c76:	5d                   	pop    %ebp
     c77:	c3                   	ret    
     c78:	90                   	nop
     c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c80 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     c80:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c81:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
     c83:	89 e5                	mov    %esp,%ebp
     c85:	56                   	push   %esi
     c86:	53                   	push   %ebx
     c87:	8b 5d 10             	mov    0x10(%ebp),%ebx
     c8a:	8b 45 08             	mov    0x8(%ebp),%eax
     c8d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c90:	85 db                	test   %ebx,%ebx
     c92:	7e 12                	jle    ca6 <memmove+0x26>
     c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     c98:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     c9c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     c9f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     ca2:	39 da                	cmp    %ebx,%edx
     ca4:	75 f2                	jne    c98 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     ca6:	5b                   	pop    %ebx
     ca7:	5e                   	pop    %esi
     ca8:	5d                   	pop    %ebp
     ca9:	c3                   	ret    

00000caa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     caa:	b8 01 00 00 00       	mov    $0x1,%eax
     caf:	cd 40                	int    $0x40
     cb1:	c3                   	ret    

00000cb2 <exit>:
SYSCALL(exit)
     cb2:	b8 02 00 00 00       	mov    $0x2,%eax
     cb7:	cd 40                	int    $0x40
     cb9:	c3                   	ret    

00000cba <wait>:
SYSCALL(wait)
     cba:	b8 03 00 00 00       	mov    $0x3,%eax
     cbf:	cd 40                	int    $0x40
     cc1:	c3                   	ret    

00000cc2 <pipe>:
SYSCALL(pipe)
     cc2:	b8 04 00 00 00       	mov    $0x4,%eax
     cc7:	cd 40                	int    $0x40
     cc9:	c3                   	ret    

00000cca <read>:
SYSCALL(read)
     cca:	b8 05 00 00 00       	mov    $0x5,%eax
     ccf:	cd 40                	int    $0x40
     cd1:	c3                   	ret    

00000cd2 <write>:
SYSCALL(write)
     cd2:	b8 10 00 00 00       	mov    $0x10,%eax
     cd7:	cd 40                	int    $0x40
     cd9:	c3                   	ret    

00000cda <close>:
SYSCALL(close)
     cda:	b8 15 00 00 00       	mov    $0x15,%eax
     cdf:	cd 40                	int    $0x40
     ce1:	c3                   	ret    

00000ce2 <kill>:
SYSCALL(kill)
     ce2:	b8 06 00 00 00       	mov    $0x6,%eax
     ce7:	cd 40                	int    $0x40
     ce9:	c3                   	ret    

00000cea <exec>:
SYSCALL(exec)
     cea:	b8 07 00 00 00       	mov    $0x7,%eax
     cef:	cd 40                	int    $0x40
     cf1:	c3                   	ret    

00000cf2 <open>:
SYSCALL(open)
     cf2:	b8 0f 00 00 00       	mov    $0xf,%eax
     cf7:	cd 40                	int    $0x40
     cf9:	c3                   	ret    

00000cfa <mknod>:
SYSCALL(mknod)
     cfa:	b8 11 00 00 00       	mov    $0x11,%eax
     cff:	cd 40                	int    $0x40
     d01:	c3                   	ret    

00000d02 <unlink>:
SYSCALL(unlink)
     d02:	b8 12 00 00 00       	mov    $0x12,%eax
     d07:	cd 40                	int    $0x40
     d09:	c3                   	ret    

00000d0a <fstat>:
SYSCALL(fstat)
     d0a:	b8 08 00 00 00       	mov    $0x8,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <link>:
SYSCALL(link)
     d12:	b8 13 00 00 00       	mov    $0x13,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <mkdir>:
SYSCALL(mkdir)
     d1a:	b8 14 00 00 00       	mov    $0x14,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <chdir>:
SYSCALL(chdir)
     d22:	b8 09 00 00 00       	mov    $0x9,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <dup>:
SYSCALL(dup)
     d2a:	b8 0a 00 00 00       	mov    $0xa,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <getpid>:
SYSCALL(getpid)
     d32:	b8 0b 00 00 00       	mov    $0xb,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <sbrk>:
SYSCALL(sbrk)
     d3a:	b8 0c 00 00 00       	mov    $0xc,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <sleep>:
SYSCALL(sleep)
     d42:	b8 0d 00 00 00       	mov    $0xd,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <uptime>:
SYSCALL(uptime)
     d4a:	b8 0e 00 00 00       	mov    $0xe,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <set_priority>:
// jump to syscall routine I create
// uses trap instruction 'int' in x86 asm
SYSCALL(set_priority)
     d52:	b8 16 00 00 00       	mov    $0x16,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <get_priority>:
SYSCALL(get_priority)
     d5a:	b8 17 00 00 00       	mov    $0x17,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <cps>:
SYSCALL(cps)
     d62:	b8 18 00 00 00       	mov    $0x18,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <thread_create>:
SYSCALL(thread_create)
     d6a:	b8 19 00 00 00       	mov    $0x19,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <thread_exit>:
SYSCALL(thread_exit)
     d72:	b8 1a 00 00 00       	mov    $0x1a,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <thread_join>:
SYSCALL(thread_join)
     d7a:	b8 1b 00 00 00       	mov    $0x1b,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <getNumFreePages>:
SYSCALL(getNumFreePages)
     d82:	b8 1c 00 00 00       	mov    $0x1c,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    
     d8a:	66 90                	xchg   %ax,%ax
     d8c:	66 90                	xchg   %ax,%ax
     d8e:	66 90                	xchg   %ax,%ax

00000d90 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	57                   	push   %edi
     d94:	56                   	push   %esi
     d95:	53                   	push   %ebx
     d96:	89 c7                	mov    %eax,%edi
     d98:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     d9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d9e:	85 db                	test   %ebx,%ebx
     da0:	74 76                	je     e18 <printint+0x88>
     da2:	89 d0                	mov    %edx,%eax
     da4:	c1 e8 1f             	shr    $0x1f,%eax
     da7:	84 c0                	test   %al,%al
     da9:	74 6d                	je     e18 <printint+0x88>
    neg = 1;
    x = -xx;
     dab:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     dad:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     db4:	f7 d8                	neg    %eax
     db6:	8d 75 d7             	lea    -0x29(%ebp),%esi
  } else {
    x = xx;
  }

  i = 0;
     db9:	31 db                	xor    %ebx,%ebx
     dbb:	90                   	nop
     dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
     dc0:	31 d2                	xor    %edx,%edx
     dc2:	83 c3 01             	add    $0x1,%ebx
     dc5:	f7 f1                	div    %ecx
     dc7:	0f b6 92 e3 12 00 00 	movzbl 0x12e3(%edx),%edx
  }while((x /= base) != 0);
     dce:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     dd0:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     dd3:	75 eb                	jne    dc0 <printint+0x30>
  if(neg)
     dd5:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     dd8:	89 d8                	mov    %ebx,%eax
  }while((x /= base) != 0);
  if(neg)
     dda:	85 d2                	test   %edx,%edx
     ddc:	74 08                	je     de6 <printint+0x56>
    buf[i++] = '-';
     dde:	83 c3 01             	add    $0x1,%ebx
     de1:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
     de6:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
     dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     df0:	0f b6 03             	movzbl (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     df3:	83 ec 04             	sub    $0x4,%esp
     df6:	83 eb 01             	sub    $0x1,%ebx
     df9:	6a 01                	push   $0x1
     dfb:	56                   	push   %esi
     dfc:	57                   	push   %edi
     dfd:	88 45 d7             	mov    %al,-0x29(%ebp)
     e00:	e8 cd fe ff ff       	call   cd2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     e05:	83 c4 10             	add    $0x10,%esp
     e08:	39 f3                	cmp    %esi,%ebx
     e0a:	75 e4                	jne    df0 <printint+0x60>
    putc(fd, buf[i]);
}
     e0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e0f:	5b                   	pop    %ebx
     e10:	5e                   	pop    %esi
     e11:	5f                   	pop    %edi
     e12:	5d                   	pop    %ebp
     e13:	c3                   	ret    
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     e18:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     e1a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     e21:	eb 93                	jmp    db6 <printint+0x26>
     e23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e30 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	57                   	push   %edi
     e34:	56                   	push   %esi
     e35:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e36:	8d 45 10             	lea    0x10(%ebp),%eax
     e39:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e3b:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e3e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e41:	8b 75 08             	mov    0x8(%ebp),%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e44:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     e47:	0f b6 13             	movzbl (%ebx),%edx
     e4a:	83 c3 01             	add    $0x1,%ebx
     e4d:	84 d2                	test   %dl,%dl
     e4f:	75 38                	jne    e89 <printf+0x59>
     e51:	e9 b2 00 00 00       	jmp    f08 <printf+0xd8>
     e56:	8d 76 00             	lea    0x0(%esi),%esi
     e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     e60:	83 fa 25             	cmp    $0x25,%edx
     e63:	0f 84 a7 00 00 00    	je     f10 <printf+0xe0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     e69:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     e6c:	83 ec 04             	sub    $0x4,%esp
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
     e6f:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     e72:	6a 01                	push   $0x1
     e74:	50                   	push   %eax
     e75:	56                   	push   %esi
     e76:	e8 57 fe ff ff       	call   cd2 <write>
     e7b:	83 c4 10             	add    $0x10,%esp
     e7e:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e81:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
     e85:	84 d2                	test   %dl,%dl
     e87:	74 7f                	je     f08 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
     e89:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     e8b:	0f be c2             	movsbl %dl,%eax
     e8e:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
     e91:	74 cd                	je     e60 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     e93:	83 ff 25             	cmp    $0x25,%edi
     e96:	75 e6                	jne    e7e <printf+0x4e>
      if(c == 'd'){
     e98:	83 fa 64             	cmp    $0x64,%edx
     e9b:	0f 84 17 01 00 00    	je     fb8 <printf+0x188>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     ea1:	25 f7 00 00 00       	and    $0xf7,%eax
     ea6:	83 f8 70             	cmp    $0x70,%eax
     ea9:	74 75                	je     f20 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     eab:	83 fa 73             	cmp    $0x73,%edx
     eae:	0f 84 9c 00 00 00    	je     f50 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     eb4:	83 fa 63             	cmp    $0x63,%edx
     eb7:	0f 84 0a 01 00 00    	je     fc7 <printf+0x197>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     ebd:	83 fa 25             	cmp    $0x25,%edx
     ec0:	0f 84 da 00 00 00    	je     fa0 <printf+0x170>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     ec6:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     ec9:	83 ec 04             	sub    $0x4,%esp
     ecc:	89 55 d0             	mov    %edx,-0x30(%ebp)
     ecf:	6a 01                	push   $0x1
     ed1:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
     ed5:	50                   	push   %eax
     ed6:	56                   	push   %esi
     ed7:	e8 f6 fd ff ff       	call   cd2 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
     edc:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     edf:	83 c4 0c             	add    $0xc,%esp
     ee2:	8d 45 e7             	lea    -0x19(%ebp),%eax
     ee5:	6a 01                	push   $0x1
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
     ee7:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     eea:	50                   	push   %eax
     eeb:	56                   	push   %esi
     eec:	83 c3 01             	add    $0x1,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     eef:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     ef1:	e8 dc fd ff ff       	call   cd2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ef6:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     efa:	83 c4 10             	add    $0x10,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     efd:	84 d2                	test   %dl,%dl
     eff:	75 88                	jne    e89 <printf+0x59>
     f01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     f08:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f0b:	5b                   	pop    %ebx
     f0c:	5e                   	pop    %esi
     f0d:	5f                   	pop    %edi
     f0e:	5d                   	pop    %ebp
     f0f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     f10:	bf 25 00 00 00       	mov    $0x25,%edi
     f15:	e9 64 ff ff ff       	jmp    e7e <printf+0x4e>
     f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     f20:	83 ec 0c             	sub    $0xc,%esp
     f23:	b9 10 00 00 00       	mov    $0x10,%ecx
     f28:	6a 00                	push   $0x0
     f2a:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     f2d:	89 f0                	mov    %esi,%eax
     f2f:	8b 17                	mov    (%edi),%edx
     f31:	e8 5a fe ff ff       	call   d90 <printint>
        ap++;
     f36:	89 f8                	mov    %edi,%eax
     f38:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f3b:	31 ff                	xor    %edi,%edi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     f3d:	83 c0 04             	add    $0x4,%eax
     f40:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     f43:	e9 36 ff ff ff       	jmp    e7e <printf+0x4e>
     f48:	90                   	nop
     f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     f50:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     f53:	8b 38                	mov    (%eax),%edi
        ap++;
     f55:	83 c0 04             	add    $0x4,%eax
     f58:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
     f5b:	85 ff                	test   %edi,%edi
     f5d:	0f 84 80 00 00 00    	je     fe3 <printf+0x1b3>
          s = "(null)";
        while(*s != 0){
     f63:	0f b6 07             	movzbl (%edi),%eax
     f66:	84 c0                	test   %al,%al
     f68:	74 25                	je     f8f <printf+0x15f>
     f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f70:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f73:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     f76:	83 ec 04             	sub    $0x4,%esp
     f79:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     f7b:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f7e:	50                   	push   %eax
     f7f:	56                   	push   %esi
     f80:	e8 4d fd ff ff       	call   cd2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     f85:	0f b6 07             	movzbl (%edi),%eax
     f88:	83 c4 10             	add    $0x10,%esp
     f8b:	84 c0                	test   %al,%al
     f8d:	75 e1                	jne    f70 <printf+0x140>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f8f:	31 ff                	xor    %edi,%edi
     f91:	e9 e8 fe ff ff       	jmp    e7e <printf+0x4e>
     f96:	8d 76 00             	lea    0x0(%esi),%esi
     f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fa0:	83 ec 04             	sub    $0x4,%esp
     fa3:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
     fa7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     faa:	6a 01                	push   $0x1
     fac:	e9 39 ff ff ff       	jmp    eea <printf+0xba>
     fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     fb8:	83 ec 0c             	sub    $0xc,%esp
     fbb:	b9 0a 00 00 00       	mov    $0xa,%ecx
     fc0:	6a 01                	push   $0x1
     fc2:	e9 63 ff ff ff       	jmp    f2a <printf+0xfa>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
     fc7:	8b 7d d4             	mov    -0x2c(%ebp),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fca:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
     fcd:	8b 07                	mov    (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fcf:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
     fd1:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fd4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     fd7:	50                   	push   %eax
     fd8:	56                   	push   %esi
     fd9:	e8 f4 fc ff ff       	call   cd2 <write>
     fde:	e9 53 ff ff ff       	jmp    f36 <printf+0x106>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
     fe3:	bf dc 12 00 00       	mov    $0x12dc,%edi
     fe8:	e9 76 ff ff ff       	jmp    f63 <printf+0x133>
     fed:	66 90                	xchg   %ax,%ax
     fef:	90                   	nop

00000ff0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ff0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ff1:	a1 a4 19 00 00       	mov    0x19a4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     ff6:	89 e5                	mov    %esp,%ebp
     ff8:	57                   	push   %edi
     ff9:	56                   	push   %esi
     ffa:	53                   	push   %ebx
     ffb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
     ffe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1001:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1008:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    100a:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    100c:	73 32                	jae    1040 <free+0x50>
    100e:	39 d1                	cmp    %edx,%ecx
    1010:	72 04                	jb     1016 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1012:	39 d0                	cmp    %edx,%eax
    1014:	72 32                	jb     1048 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1016:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1019:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    101c:	39 d7                	cmp    %edx,%edi
    101e:	74 2c                	je     104c <free+0x5c>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1020:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1023:	8b 50 04             	mov    0x4(%eax),%edx
    1026:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1029:	39 f1                	cmp    %esi,%ecx
    102b:	74 36                	je     1063 <free+0x73>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    102d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    102f:	a3 a4 19 00 00       	mov    %eax,0x19a4
}
    1034:	5b                   	pop    %ebx
    1035:	5e                   	pop    %esi
    1036:	5f                   	pop    %edi
    1037:	5d                   	pop    %ebp
    1038:	c3                   	ret    
    1039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1040:	39 d0                	cmp    %edx,%eax
    1042:	72 04                	jb     1048 <free+0x58>
    1044:	39 d1                	cmp    %edx,%ecx
    1046:	72 ce                	jb     1016 <free+0x26>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1048:	89 d0                	mov    %edx,%eax
    104a:	eb bc                	jmp    1008 <free+0x18>
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    104c:	03 72 04             	add    0x4(%edx),%esi
    104f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1052:	8b 10                	mov    (%eax),%edx
    1054:	8b 12                	mov    (%edx),%edx
    1056:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1059:	8b 50 04             	mov    0x4(%eax),%edx
    105c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    105f:	39 f1                	cmp    %esi,%ecx
    1061:	75 ca                	jne    102d <free+0x3d>
    p->s.size += bp->s.size;
    1063:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1066:	a3 a4 19 00 00       	mov    %eax,0x19a4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    106b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    106e:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1071:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1073:	5b                   	pop    %ebx
    1074:	5e                   	pop    %esi
    1075:	5f                   	pop    %edi
    1076:	5d                   	pop    %ebp
    1077:	c3                   	ret    
    1078:	90                   	nop
    1079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001080 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	57                   	push   %edi
    1084:	56                   	push   %esi
    1085:	53                   	push   %ebx
    1086:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1089:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    108c:	8b 15 a4 19 00 00    	mov    0x19a4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1092:	8d 70 07             	lea    0x7(%eax),%esi
    1095:	c1 ee 03             	shr    $0x3,%esi
    1098:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    109b:	85 d2                	test   %edx,%edx
    109d:	0f 84 a3 00 00 00    	je     1146 <malloc+0xc6>
    10a3:	8b 02                	mov    (%edx),%eax
    10a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    10a8:	39 ce                	cmp    %ecx,%esi
    10aa:	76 64                	jbe    1110 <malloc+0x90>
    10ac:	8d 1c f5 00 00 00 00 	lea    0x0(,%esi,8),%ebx
    10b3:	eb 0c                	jmp    10c1 <malloc+0x41>
    10b5:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    10ba:	8b 48 04             	mov    0x4(%eax),%ecx
    10bd:	39 ce                	cmp    %ecx,%esi
    10bf:	76 4f                	jbe    1110 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    10c1:	3b 05 a4 19 00 00    	cmp    0x19a4,%eax
    10c7:	89 c2                	mov    %eax,%edx
    10c9:	75 ed                	jne    10b8 <malloc+0x38>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    10cb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
    10d1:	77 5d                	ja     1130 <malloc+0xb0>
    10d3:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
    10d8:	bf 00 10 00 00       	mov    $0x1000,%edi
  p = sbrk(nu * sizeof(Header));
    10dd:	83 ec 0c             	sub    $0xc,%esp
    10e0:	50                   	push   %eax
    10e1:	e8 54 fc ff ff       	call   d3a <sbrk>
  if(p == (char*)-1)
    10e6:	83 c4 10             	add    $0x10,%esp
    10e9:	83 f8 ff             	cmp    $0xffffffff,%eax
    10ec:	74 1c                	je     110a <malloc+0x8a>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    10ee:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    10f1:	83 ec 0c             	sub    $0xc,%esp
    10f4:	83 c0 08             	add    $0x8,%eax
    10f7:	50                   	push   %eax
    10f8:	e8 f3 fe ff ff       	call   ff0 <free>
  return freep;
    10fd:	8b 15 a4 19 00 00    	mov    0x19a4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1103:	83 c4 10             	add    $0x10,%esp
    1106:	85 d2                	test   %edx,%edx
    1108:	75 ae                	jne    10b8 <malloc+0x38>
        return 0;
    110a:	31 c0                	xor    %eax,%eax
    110c:	eb 1a                	jmp    1128 <malloc+0xa8>
    110e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1110:	39 ce                	cmp    %ecx,%esi
    1112:	74 2c                	je     1140 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1114:	29 f1                	sub    %esi,%ecx
    1116:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1119:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    111c:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
    111f:	89 15 a4 19 00 00    	mov    %edx,0x19a4
      return (void*)(p + 1);
    1125:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1128:	8d 65 f4             	lea    -0xc(%ebp),%esp
    112b:	5b                   	pop    %ebx
    112c:	5e                   	pop    %esi
    112d:	5f                   	pop    %edi
    112e:	5d                   	pop    %ebp
    112f:	c3                   	ret    
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1130:	89 d8                	mov    %ebx,%eax
    1132:	89 f7                	mov    %esi,%edi
    1134:	eb a7                	jmp    10dd <malloc+0x5d>
    1136:	8d 76 00             	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1140:	8b 08                	mov    (%eax),%ecx
    1142:	89 0a                	mov    %ecx,(%edx)
    1144:	eb d9                	jmp    111f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1146:	c7 05 a4 19 00 00 a8 	movl   $0x19a8,0x19a4
    114d:	19 00 00 
    1150:	c7 05 a8 19 00 00 a8 	movl   $0x19a8,0x19a8
    1157:	19 00 00 
    base.s.size = 0;
    115a:	b8 a8 19 00 00       	mov    $0x19a8,%eax
    115f:	c7 05 ac 19 00 00 00 	movl   $0x0,0x19ac
    1166:	00 00 00 
    1169:	e9 3e ff ff ff       	jmp    10ac <malloc+0x2c>
    116e:	66 90                	xchg   %ax,%ax

00001170 <lock_init>:
  // the xchg function swaps the values of two variables
  // this primitive operation serves as the locking mechanism
  return result;
}

int lock_init(struct lock_t *lk) { 
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	8b 45 08             	mov    0x8(%ebp),%eax
  // initialize the lock
  if (lk) {
    1176:	85 c0                	test   %eax,%eax
    1178:	74 0d                	je     1187 <lock_init+0x17>
    lk->lock = 0;
    117a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    return 1;
    1180:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    // just return an error, if lock ref is null
    return -1; 
  }
}
    1185:	5d                   	pop    %ebp
    1186:	c3                   	ret    
  if (lk) {
    lk->lock = 0;
    return 1;
  } else {
    // just return an error, if lock ref is null
    return -1; 
    1187:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
    118c:	5d                   	pop    %ebp
    118d:	c3                   	ret    
    118e:	66 90                	xchg   %ax,%ax

00001190 <lock_acquire>:

int lock_acquire(struct lock_t *lk) {
    1190:	55                   	push   %ebp

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1191:	b8 01 00 00 00       	mov    $0x1,%eax
    // just return an error, if lock ref is null
    return -1; 
  }
}

int lock_acquire(struct lock_t *lk) {
    1196:	89 e5                	mov    %esp,%ebp
    1198:	56                   	push   %esi
    1199:	53                   	push   %ebx
    119a:	8b 5d 08             	mov    0x8(%ebp),%ebx

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    119d:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
    11a0:	85 c0                	test   %eax,%eax

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    11a2:	be 01 00 00 00       	mov    $0x1,%esi
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
    11a7:	74 1d                	je     11c6 <lock_acquire+0x36>
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // use sleep to yield to the scheduler
    sleep(1);
    11b0:	83 ec 0c             	sub    $0xc,%esp
    11b3:	6a 01                	push   $0x1
    11b5:	e8 88 fb ff ff       	call   d42 <sleep>

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    11ba:	89 f0                	mov    %esi,%eax
    11bc:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
    11bf:	83 c4 10             	add    $0x10,%esp
    11c2:	85 c0                	test   %eax,%eax
    11c4:	75 ea                	jne    11b0 <lock_acquire+0x20>
    // use sleep to yield to the scheduler
    sleep(1);
  }
  return 1;
}
    11c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11c9:	b8 01 00 00 00       	mov    $0x1,%eax
    11ce:	5b                   	pop    %ebx
    11cf:	5e                   	pop    %esi
    11d0:	5d                   	pop    %ebp
    11d1:	c3                   	ret    
    11d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <lock_release>:

int lock_release(struct lock_t *lk) {
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
  // release lock by setting binary val to zero
  lk->lock = 0;
    11e3:	8b 45 08             	mov    0x8(%ebp),%eax
    11e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 1;
}
    11ec:	b8 01 00 00 00       	mov    $0x1,%eax
    11f1:	5d                   	pop    %ebp
    11f2:	c3                   	ret    
