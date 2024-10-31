
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 12 4e 00 00       	push   $0x4e12
      16:	6a 01                	push   $0x1
      18:	e8 43 3a 00 00       	call   3a60 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 26 4e 00 00       	push   $0x4e26
      26:	e8 f7 38 00 00       	call   3922 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 90 55 00 00       	push   $0x5590
      3a:	6a 01                	push   $0x1
      3c:	e8 1f 3a 00 00       	call   3a60 <printf>
    exit();
      41:	e8 9c 38 00 00       	call   38e2 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 26 4e 00 00       	push   $0x4e26
      52:	e8 cb 38 00 00       	call   3922 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 ab 38 00 00       	call   390a <close>

  argptest();
      5f:	e8 ac 35 00 00       	call   3610 <argptest>
  createdelete();
      64:	e8 97 11 00 00       	call   1200 <createdelete>
  linkunlink();
      69:	e8 72 1a 00 00       	call   1ae0 <linkunlink>
  concreate();
      6e:	e8 3d 17 00 00       	call   17b0 <concreate>
  fourfiles();
      73:	e8 98 0f 00 00       	call   1010 <fourfiles>
  sharedfd();
      78:	e8 d3 0d 00 00       	call   e50 <sharedfd>

  bigargtest();
      7d:	e8 2e 32 00 00       	call   32b0 <bigargtest>
  bigwrite();
      82:	e8 89 23 00 00       	call   2410 <bigwrite>
  bigargtest();
      87:	e8 24 32 00 00       	call   32b0 <bigargtest>
  bsstest();
      8c:	e8 af 31 00 00       	call   3240 <bsstest>
  sbrktest();
      91:	e8 ca 2c 00 00       	call   2d60 <sbrktest>
  validatetest();
      96:	e8 f5 30 00 00       	call   3190 <validatetest>

  opentest();
      9b:	e8 50 03 00 00       	call   3f0 <opentest>
  writetest();
      a0:	e8 db 03 00 00       	call   480 <writetest>
  writetest1();
      a5:	e8 b6 05 00 00       	call   660 <writetest1>
  createtest();
      aa:	e8 81 07 00 00       	call   830 <createtest>

  openiputtest();
      af:	e8 3c 02 00 00       	call   2f0 <openiputtest>
  exitiputtest();
      b4:	e8 47 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b9:	e8 62 00 00 00       	call   120 <iputtest>

  mem();
      be:	e8 bd 0c 00 00       	call   d80 <mem>
  pipe1();
      c3:	e8 48 09 00 00       	call   a10 <pipe1>
  preempt();
      c8:	e8 e3 0a 00 00       	call   bb0 <preempt>
  exitwait();
      cd:	e8 1e 0c 00 00       	call   cf0 <exitwait>

  rmdot();
      d2:	e8 29 27 00 00       	call   2800 <rmdot>
  fourteen();
      d7:	e8 e4 25 00 00       	call   26c0 <fourteen>
  bigfile();
      dc:	e8 0f 24 00 00       	call   24f0 <bigfile>
  subdir();
      e1:	e8 4a 1c 00 00       	call   1d30 <subdir>
  linktest();
      e6:	e8 b5 14 00 00       	call   15a0 <linktest>
  unlinkread();
      eb:	e8 20 13 00 00       	call   1410 <unlinkread>
  dirfile();
      f0:	e8 8b 28 00 00       	call   2980 <dirfile>
  iref();
      f5:	e8 86 2a 00 00       	call   2b80 <iref>
  forktest();
      fa:	e8 a1 2b 00 00       	call   2ca0 <forktest>
  bigdir(); // slow
      ff:	e8 ec 1a 00 00       	call   1bf0 <bigdir>

  uio();
     104:	e8 97 34 00 00       	call   35a0 <uio>

  exectest();
     109:	e8 b2 08 00 00       	call   9c0 <exectest>

  exit();
     10e:	e8 cf 37 00 00       	call   38e2 <exit>
     113:	66 90                	xchg   %ax,%ax
     115:	66 90                	xchg   %ax,%ax
     117:	66 90                	xchg   %ax,%ax
     119:	66 90                	xchg   %ax,%ax
     11b:	66 90                	xchg   %ax,%ax
     11d:	66 90                	xchg   %ax,%ax
     11f:	90                   	nop

00000120 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 b8 3e 00 00       	push   $0x3eb8
     12b:	ff 35 20 5f 00 00    	pushl  0x5f20
     131:	e8 2a 39 00 00       	call   3a60 <printf>

  if(mkdir("iputdir") < 0){
     136:	c7 04 24 4b 3e 00 00 	movl   $0x3e4b,(%esp)
     13d:	e8 08 38 00 00       	call   394a <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 4b 3e 00 00       	push   $0x3e4b
     151:	e8 fc 37 00 00       	call   3952 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 48 3e 00 00       	push   $0x3e48
     169:	e8 c4 37 00 00       	call   3932 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 6d 3e 00 00       	push   $0x3e6d
     17d:	e8 d0 37 00 00       	call   3952 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 f0 3e 00 00       	push   $0x3ef0
     191:	ff 35 20 5f 00 00    	pushl  0x5f20
     197:	e8 c4 38 00 00       	call   3a60 <printf>
     19c:	83 c4 10             	add    $0x10,%esp
}
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 24 3e 00 00       	push   $0x3e24
     1a8:	ff 35 20 5f 00 00    	pushl  0x5f20
     1ae:	e8 ad 38 00 00       	call   3a60 <printf>
    exit();
     1b3:	e8 2a 37 00 00       	call   38e2 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 6f 3e 00 00       	push   $0x3e6f
     1bf:	ff 35 20 5f 00 00    	pushl  0x5f20
     1c5:	e8 96 38 00 00       	call   3a60 <printf>
    exit();
     1ca:	e8 13 37 00 00       	call   38e2 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 53 3e 00 00       	push   $0x3e53
     1d6:	ff 35 20 5f 00 00    	pushl  0x5f20
     1dc:	e8 7f 38 00 00       	call   3a60 <printf>
    exit();
     1e1:	e8 fc 36 00 00       	call   38e2 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 32 3e 00 00       	push   $0x3e32
     1ed:	ff 35 20 5f 00 00    	pushl  0x5f20
     1f3:	e8 68 38 00 00       	call   3a60 <printf>
    exit();
     1f8:	e8 e5 36 00 00       	call   38e2 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     206:	68 7f 3e 00 00       	push   $0x3e7f
     20b:	ff 35 20 5f 00 00    	pushl  0x5f20
     211:	e8 4a 38 00 00       	call   3a60 <printf>

  pid = fork();
     216:	e8 bf 36 00 00       	call   38da <fork>
  if(pid < 0){
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 82 00 00 00    	js     2a8 <exitiputtest+0xa8>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     226:	75 48                	jne    270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 4b 3e 00 00       	push   $0x3e4b
     230:	e8 15 37 00 00       	call   394a <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 96 00 00 00    	js     2d6 <exitiputtest+0xd6>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 4b 3e 00 00       	push   $0x3e4b
     248:	e8 05 37 00 00       	call   3952 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	78 6b                	js     2bf <exitiputtest+0xbf>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 48 3e 00 00       	push   $0x3e48
     25c:	e8 d1 36 00 00       	call   3932 <unlink>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	78 28                	js     290 <exitiputtest+0x90>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     268:	e8 75 36 00 00       	call   38e2 <exit>
     26d:	8d 76 00             	lea    0x0(%esi),%esi
  }
  wait();
     270:	e8 75 36 00 00       	call   38ea <wait>
  printf(stdout, "exitiput test ok\n");
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 a2 3e 00 00       	push   $0x3ea2
     27d:	ff 35 20 5f 00 00    	pushl  0x5f20
     283:	e8 d8 37 00 00       	call   3a60 <printf>
     288:	83 c4 10             	add    $0x10,%esp
}
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 53 3e 00 00       	push   $0x3e53
     298:	ff 35 20 5f 00 00    	pushl  0x5f20
     29e:	e8 bd 37 00 00       	call   3a60 <printf>
      exit();
     2a3:	e8 3a 36 00 00       	call   38e2 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 65 4d 00 00       	push   $0x4d65
     2af:	ff 35 20 5f 00 00    	pushl  0x5f20
     2b5:	e8 a6 37 00 00       	call   3a60 <printf>
    exit();
     2ba:	e8 23 36 00 00       	call   38e2 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 8e 3e 00 00       	push   $0x3e8e
     2c6:	ff 35 20 5f 00 00    	pushl  0x5f20
     2cc:	e8 8f 37 00 00       	call   3a60 <printf>
      exit();
     2d1:	e8 0c 36 00 00       	call   38e2 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 24 3e 00 00       	push   $0x3e24
     2dd:	ff 35 20 5f 00 00    	pushl  0x5f20
     2e3:	e8 78 37 00 00       	call   3a60 <printf>
      exit();
     2e8:	e8 f5 35 00 00       	call   38e2 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     2f6:	68 b4 3e 00 00       	push   $0x3eb4
     2fb:	ff 35 20 5f 00 00    	pushl  0x5f20
     301:	e8 5a 37 00 00       	call   3a60 <printf>
  if(mkdir("oidir") < 0){
     306:	c7 04 24 c3 3e 00 00 	movl   $0x3ec3,(%esp)
     30d:	e8 38 36 00 00       	call   394a <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 88 00 00 00    	js     3a5 <openiputtest+0xb5>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     31d:	e8 b8 35 00 00       	call   38da <fork>
  if(pid < 0){
     322:	85 c0                	test   %eax,%eax
     324:	0f 88 92 00 00 00    	js     3bc <openiputtest+0xcc>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     32a:	75 34                	jne    360 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     32c:	83 ec 08             	sub    $0x8,%esp
     32f:	6a 02                	push   $0x2
     331:	68 c3 3e 00 00       	push   $0x3ec3
     336:	e8 e7 35 00 00       	call   3922 <open>
    if(fd >= 0){
     33b:	83 c4 10             	add    $0x10,%esp
     33e:	85 c0                	test   %eax,%eax
     340:	78 5e                	js     3a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 48 4e 00 00       	push   $0x4e48
     34a:	ff 35 20 5f 00 00    	pushl  0x5f20
     350:	e8 0b 37 00 00       	call   3a60 <printf>
      exit();
     355:	e8 88 35 00 00       	call   38e2 <exit>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    exit();
  }
  sleep(1);
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 01                	push   $0x1
     365:	e8 08 36 00 00       	call   3972 <sleep>
  if(unlink("oidir") != 0){
     36a:	c7 04 24 c3 3e 00 00 	movl   $0x3ec3,(%esp)
     371:	e8 bc 35 00 00       	call   3932 <unlink>
     376:	83 c4 10             	add    $0x10,%esp
     379:	85 c0                	test   %eax,%eax
     37b:	75 56                	jne    3d3 <openiputtest+0xe3>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     37d:	e8 68 35 00 00       	call   38ea <wait>
  printf(stdout, "openiput test ok\n");
     382:	83 ec 08             	sub    $0x8,%esp
     385:	68 ec 3e 00 00       	push   $0x3eec
     38a:	ff 35 20 5f 00 00    	pushl  0x5f20
     390:	e8 cb 36 00 00       	call   3a60 <printf>
     395:	83 c4 10             	add    $0x10,%esp
}
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit();
    }
    exit();
     3a0:	e8 3d 35 00 00       	call   38e2 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     3a5:	51                   	push   %ecx
     3a6:	51                   	push   %ecx
     3a7:	68 c9 3e 00 00       	push   $0x3ec9
     3ac:	ff 35 20 5f 00 00    	pushl  0x5f20
     3b2:	e8 a9 36 00 00       	call   3a60 <printf>
    exit();
     3b7:	e8 26 35 00 00       	call   38e2 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     3bc:	52                   	push   %edx
     3bd:	52                   	push   %edx
     3be:	68 65 4d 00 00       	push   $0x4d65
     3c3:	ff 35 20 5f 00 00    	pushl  0x5f20
     3c9:	e8 92 36 00 00       	call   3a60 <printf>
    exit();
     3ce:	e8 0f 35 00 00       	call   38e2 <exit>
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     3d3:	50                   	push   %eax
     3d4:	50                   	push   %eax
     3d5:	68 dd 3e 00 00       	push   $0x3edd
     3da:	ff 35 20 5f 00 00    	pushl  0x5f20
     3e0:	e8 7b 36 00 00       	call   3a60 <printf>
    exit();
     3e5:	e8 f8 34 00 00       	call   38e2 <exit>
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <opentest>:

// simple file system tests

void
opentest(void)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     3f6:	68 fe 3e 00 00       	push   $0x3efe
     3fb:	ff 35 20 5f 00 00    	pushl  0x5f20
     401:	e8 5a 36 00 00       	call   3a60 <printf>
  fd = open("echo", 0);
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 09 3f 00 00       	push   $0x3f09
     40f:	e8 0e 35 00 00       	call   3922 <open>
  if(fd < 0){
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 e6 34 00 00       	call   390a <close>
  fd = open("doesnotexist", 0);
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 21 3f 00 00       	push   $0x3f21
     42d:	e8 f0 34 00 00       	call   3922 <open>
  if(fd >= 0){
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 4c 3f 00 00       	push   $0x3f4c
     441:	ff 35 20 5f 00 00    	pushl  0x5f20
     447:	e8 14 36 00 00       	call   3a60 <printf>
     44c:	83 c4 10             	add    $0x10,%esp
}
     44f:	c9                   	leave  
     450:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 0e 3f 00 00       	push   $0x3f0e
     458:	ff 35 20 5f 00 00    	pushl  0x5f20
     45e:	e8 fd 35 00 00       	call   3a60 <printf>
    exit();
     463:	e8 7a 34 00 00       	call   38e2 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 2e 3f 00 00       	push   $0x3f2e
     46f:	ff 35 20 5f 00 00    	pushl  0x5f20
     475:	e8 e6 35 00 00       	call   3a60 <printf>
    exit();
     47a:	e8 63 34 00 00       	call   38e2 <exit>
     47f:	90                   	nop

00000480 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 5a 3f 00 00       	push   $0x3f5a
     48d:	ff 35 20 5f 00 00    	pushl  0x5f20
     493:	e8 c8 35 00 00       	call   3a60 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     498:	59                   	pop    %ecx
     499:	5b                   	pop    %ebx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 6b 3f 00 00       	push   $0x3f6b
     4a4:	e8 79 34 00 00       	call   3922 <open>
  if(fd >= 0){
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
{
  int fd;
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
     4ae:	89 c6                	mov    %eax,%esi
  if(fd >= 0){
     4b0:	0f 88 89 01 00 00    	js     63f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4b6:	83 ec 08             	sub    $0x8,%esp
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4b9:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     4bb:	68 71 3f 00 00       	push   $0x3f71
     4c0:	ff 35 20 5f 00 00    	pushl  0x5f20
     4c6:	e8 95 35 00 00       	call   3a60 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 a8 3f 00 00       	push   $0x3fa8
     4da:	56                   	push   %esi
     4db:	e8 22 34 00 00       	call   3902 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 b3 3f 00 00       	push   $0x3fb3
     4f6:	56                   	push   %esi
     4f7:	e8 06 34 00 00       	call   3902 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 be 3f 00 00       	push   $0x3fbe
     518:	ff 35 20 5f 00 00    	pushl  0x5f20
     51e:	e8 3d 35 00 00       	call   3a60 <printf>
  close(fd);
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 df 33 00 00       	call   390a <close>
  fd = open("small", O_RDONLY);
     52b:	58                   	pop    %eax
     52c:	5a                   	pop    %edx
     52d:	6a 00                	push   $0x0
     52f:	68 6b 3f 00 00       	push   $0x3f6b
     534:	e8 e9 33 00 00       	call   3922 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     53e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 c9 3f 00 00       	push   $0x3fc9
     54e:	ff 35 20 5f 00 00    	pushl  0x5f20
     554:	e8 07 35 00 00       	call   3a60 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 40 87 00 00       	push   $0x8740
     566:	53                   	push   %ebx
     567:	e8 8e 33 00 00       	call   38fa <read>
  if(i == 2000){
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 95 00 00 00    	jne    60f <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 fd 3f 00 00       	push   $0x3ffd
     582:	ff 35 20 5f 00 00    	pushl  0x5f20
     588:	e8 d3 34 00 00       	call   3a60 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 75 33 00 00       	call   390a <close>

  if(unlink("small") < 0){
     595:	c7 04 24 6b 3f 00 00 	movl   $0x3f6b,(%esp)
     59c:	e8 91 33 00 00       	call   3932 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7f                	js     627 <writetest+0x1a7>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 25 40 00 00       	push   $0x4025
     5b0:	ff 35 20 5f 00 00    	pushl  0x5f20
     5b6:	e8 a5 34 00 00       	call   3a60 <printf>
     5bb:	83 c4 10             	add    $0x10,%esp
}
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 6c 4e 00 00       	push   $0x4e6c
     5ce:	ff 35 20 5f 00 00    	pushl  0x5f20
     5d4:	e8 87 34 00 00       	call   3a60 <printf>
      exit();
     5d9:	e8 04 33 00 00       	call   38e2 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 90 4e 00 00       	push   $0x4e90
     5e7:	ff 35 20 5f 00 00    	pushl  0x5f20
     5ed:	e8 6e 34 00 00       	call   3a60 <printf>
      exit();
     5f2:	e8 eb 32 00 00       	call   38e2 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     5f7:	83 ec 08             	sub    $0x8,%esp
     5fa:	68 e2 3f 00 00       	push   $0x3fe2
     5ff:	ff 35 20 5f 00 00    	pushl  0x5f20
     605:	e8 56 34 00 00       	call   3a60 <printf>
    exit();
     60a:	e8 d3 32 00 00       	call   38e2 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     60f:	83 ec 08             	sub    $0x8,%esp
     612:	68 29 43 00 00       	push   $0x4329
     617:	ff 35 20 5f 00 00    	pushl  0x5f20
     61d:	e8 3e 34 00 00       	call   3a60 <printf>
    exit();
     622:	e8 bb 32 00 00       	call   38e2 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     627:	83 ec 08             	sub    $0x8,%esp
     62a:	68 10 40 00 00       	push   $0x4010
     62f:	ff 35 20 5f 00 00    	pushl  0x5f20
     635:	e8 26 34 00 00       	call   3a60 <printf>
    exit();
     63a:	e8 a3 32 00 00       	call   38e2 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     63f:	83 ec 08             	sub    $0x8,%esp
     642:	68 8c 3f 00 00       	push   $0x3f8c
     647:	ff 35 20 5f 00 00    	pushl  0x5f20
     64d:	e8 0e 34 00 00       	call   3a60 <printf>
    exit();
     652:	e8 8b 32 00 00       	call   38e2 <exit>
     657:	89 f6                	mov    %esi,%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 39 40 00 00       	push   $0x4039
     66d:	ff 35 20 5f 00 00    	pushl  0x5f20
     673:	e8 e8 33 00 00       	call   3a60 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     678:	59                   	pop    %ecx
     679:	5b                   	pop    %ebx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 b3 40 00 00       	push   $0x40b3
     684:	e8 99 32 00 00       	call   3922 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
{
  int i, fd, n;

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
     68e:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     690:	0f 88 62 01 00 00    	js     7f8 <writetest1+0x198>
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     6a3:	89 1d 40 87 00 00    	mov    %ebx,0x8740
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 40 87 00 00       	push   $0x8740
     6b3:	56                   	push   %esi
     6b4:	e8 49 32 00 00       	call   3902 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 2f 32 00 00       	call   390a <close>

  fd = open("big", O_RDONLY);
     6db:	58                   	pop    %eax
     6dc:	5a                   	pop    %edx
     6dd:	6a 00                	push   $0x0
     6df:	68 b3 40 00 00       	push   $0x40b3
     6e4:	e8 39 32 00 00       	call   3922 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     6ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f0:	0f 88 ea 00 00 00    	js     7e0 <writetest1+0x180>
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     70b:	a1 40 87 00 00       	mov    0x8740,%eax
     710:	39 d8                	cmp    %ebx,%eax
     712:	75 7f                	jne    793 <writetest1+0x133>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     714:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 40 87 00 00       	push   $0x8740
     724:	56                   	push   %esi
     725:	e8 d0 31 00 00       	call   38fa <read>
    if(i == 0){
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 c4 31 00 00       	call   390a <close>
  if(unlink("big") < 0){
     746:	c7 04 24 b3 40 00 00 	movl   $0x40b3,(%esp)
     74d:	e8 e0 31 00 00       	call   3932 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 b3 00 00 00    	js     810 <writetest1+0x1b0>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 da 40 00 00       	push   $0x40da
     765:	ff 35 20 5f 00 00    	pushl  0x5f20
     76b:	e8 f0 32 00 00       	call   3a60 <printf>
     770:	83 c4 10             	add    $0x10,%esp
}
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 63 40 00 00       	push   $0x4063
     783:	ff 35 20 5f 00 00    	pushl  0x5f20
     789:	e8 d2 32 00 00       	call   3a60 <printf>
      exit();
     78e:	e8 4f 31 00 00       	call   38e2 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 b4 4e 00 00       	push   $0x4eb4
     79a:	ff 35 20 5f 00 00    	pushl  0x5f20
     7a0:	e8 bb 32 00 00       	call   3a60 <printf>
             n, ((int*)buf)[0]);
      exit();
     7a5:	e8 38 31 00 00       	call   38e2 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 b7 40 00 00       	push   $0x40b7
     7b3:	ff 35 20 5f 00 00    	pushl  0x5f20
     7b9:	e8 a2 32 00 00       	call   3a60 <printf>
      exit();
     7be:	e8 1f 31 00 00       	call   38e2 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     7c3:	83 ec 04             	sub    $0x4,%esp
     7c6:	68 8b 00 00 00       	push   $0x8b
     7cb:	68 9a 40 00 00       	push   $0x409a
     7d0:	ff 35 20 5f 00 00    	pushl  0x5f20
     7d6:	e8 85 32 00 00       	call   3a60 <printf>
        exit();
     7db:	e8 02 31 00 00       	call   38e2 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     7e0:	83 ec 08             	sub    $0x8,%esp
     7e3:	68 81 40 00 00       	push   $0x4081
     7e8:	ff 35 20 5f 00 00    	pushl  0x5f20
     7ee:	e8 6d 32 00 00       	call   3a60 <printf>
    exit();
     7f3:	e8 ea 30 00 00       	call   38e2 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 49 40 00 00       	push   $0x4049
     800:	ff 35 20 5f 00 00    	pushl  0x5f20
     806:	e8 55 32 00 00       	call   3a60 <printf>
    exit();
     80b:	e8 d2 30 00 00       	call   38e2 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 c7 40 00 00       	push   $0x40c7
     818:	ff 35 20 5f 00 00    	pushl  0x5f20
     81e:	e8 3d 32 00 00       	call   3a60 <printf>
    exit();
     823:	e8 ba 30 00 00       	call   38e2 <exit>
     828:	90                   	nop
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000830 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     839:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 d4 4e 00 00       	push   $0x4ed4
     841:	ff 35 20 5f 00 00    	pushl  0x5f20
     847:	e8 14 32 00 00       	call   3a60 <printf>

  name[0] = 'a';
     84c:	c6 05 40 a7 00 00 61 	movb   $0x61,0xa740
  name[2] = '\0';
     853:	c6 05 42 a7 00 00 00 	movb   $0x0,0xa742
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     863:	88 1d 41 a7 00 00    	mov    %bl,0xa741
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 40 a7 00 00       	push   $0xa740
     876:	e8 a7 30 00 00       	call   3922 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 87 30 00 00       	call   390a <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     88b:	c6 05 40 a7 00 00 61 	movb   $0x61,0xa740
  name[2] = '\0';
     892:	c6 05 42 a7 00 00 00 	movb   $0x0,0xa742
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     8a3:	88 1d 41 a7 00 00    	mov    %bl,0xa741
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 40 a7 00 00       	push   $0xa740
     8b1:	e8 7c 30 00 00       	call   3932 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 fc 4e 00 00       	push   $0x4efc
     8c6:	ff 35 20 5f 00 00    	pushl  0x5f20
     8cc:	e8 8f 31 00 00       	call   3a60 <printf>
     8d1:	83 c4 10             	add    $0x10,%esp
}
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:

void dirtest(void)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 e8 40 00 00       	push   $0x40e8
     8eb:	ff 35 20 5f 00 00    	pushl  0x5f20
     8f1:	e8 6a 31 00 00       	call   3a60 <printf>

  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 f4 40 00 00 	movl   $0x40f4,(%esp)
     8fd:	e8 48 30 00 00       	call   394a <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 f4 40 00 00       	push   $0x40f4
     911:	e8 3c 30 00 00       	call   3952 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 99 46 00 00       	push   $0x4699
     929:	e8 24 30 00 00       	call   3952 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 f4 40 00 00       	push   $0x40f4
     93d:	e8 f0 2f 00 00       	call   3932 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 31 41 00 00       	push   $0x4131
     951:	ff 35 20 5f 00 00    	pushl  0x5f20
     957:	e8 04 31 00 00       	call   3a60 <printf>
     95c:	83 c4 10             	add    $0x10,%esp
}
     95f:	c9                   	leave  
     960:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 24 3e 00 00       	push   $0x3e24
     968:	ff 35 20 5f 00 00    	pushl  0x5f20
     96e:	e8 ed 30 00 00       	call   3a60 <printf>
    exit();
     973:	e8 6a 2f 00 00       	call   38e2 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 1d 41 00 00       	push   $0x411d
     97f:	ff 35 20 5f 00 00    	pushl  0x5f20
     985:	e8 d6 30 00 00       	call   3a60 <printf>
    exit();
     98a:	e8 53 2f 00 00       	call   38e2 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 0c 41 00 00       	push   $0x410c
     996:	ff 35 20 5f 00 00    	pushl  0x5f20
     99c:	e8 bf 30 00 00       	call   3a60 <printf>
    exit();
     9a1:	e8 3c 2f 00 00       	call   38e2 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 f9 40 00 00       	push   $0x40f9
     9ad:	ff 35 20 5f 00 00    	pushl  0x5f20
     9b3:	e8 a8 30 00 00       	call   3a60 <printf>
    exit();
     9b8:	e8 25 2f 00 00       	call   38e2 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 40 41 00 00       	push   $0x4140
     9cb:	ff 35 20 5f 00 00    	pushl  0x5f20
     9d1:	e8 8a 30 00 00       	call   3a60 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 24 5f 00 00       	push   $0x5f24
     9dd:	68 09 3f 00 00       	push   $0x3f09
     9e2:	e8 33 2f 00 00       	call   391a <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 4b 41 00 00       	push   $0x414b
     9f7:	ff 35 20 5f 00 00    	pushl  0x5f20
     9fd:	e8 5e 30 00 00       	call   3a60 <printf>
    exit();
     a02:	e8 db 2e 00 00       	call   38e2 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     a19:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 d0 2e 00 00       	call   38f2 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 3d 01 00 00    	jne    b6a <pipe1+0x15a>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     a2d:	e8 a8 2e 00 00       	call   38da <fork>
  seq = 0;
  if(pid == 0){
     a32:	83 f8 00             	cmp    $0x0,%eax
     a35:	0f 84 8b 00 00 00    	je     ac6 <pipe1+0xb6>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     a3b:	0f 8e 3d 01 00 00    	jle    b7e <pipe1+0x16e>
    close(fds[1]);
     a41:	83 ec 0c             	sub    $0xc,%esp
     a44:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     a47:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     a4c:	31 db                	xor    %ebx,%ebx
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     a4e:	e8 b7 2e 00 00       	call   390a <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a53:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a5d:	83 ec 04             	sub    $0x4,%esp
     a60:	57                   	push   %edi
     a61:	68 40 87 00 00       	push   $0x8740
     a66:	ff 75 e0             	pushl  -0x20(%ebp)
     a69:	e8 8c 2e 00 00       	call   38fa <read>
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	0f 8e ab 00 00 00    	jle    b24 <pipe1+0x114>
     a79:	89 d9                	mov    %ebx,%ecx
     a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a7e:	f7 d9                	neg    %ecx
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a80:	38 9c 0b 40 87 00 00 	cmp    %bl,0x8740(%ebx,%ecx,1)
     a87:	8d 53 01             	lea    0x1(%ebx),%edx
     a8a:	75 17                	jne    aa3 <pipe1+0x93>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     a8c:	39 f2                	cmp    %esi,%edx
     a8e:	89 d3                	mov    %edx,%ebx
     a90:	75 ee                	jne    a80 <pipe1+0x70>
     a92:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a97:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     a9d:	7f 1e                	jg     abd <pipe1+0xad>
     a9f:	89 f3                	mov    %esi,%ebx
     aa1:	eb ba                	jmp    a5d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     aa3:	83 ec 08             	sub    $0x8,%esp
     aa6:	68 7a 41 00 00       	push   $0x417a
     aab:	6a 01                	push   $0x1
     aad:	e8 ae 2f 00 00       	call   3a60 <printf>
          return;
     ab2:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     ab5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ab8:	5b                   	pop    %ebx
     ab9:	5e                   	pop    %esi
     aba:	5f                   	pop    %edi
     abb:	5d                   	pop    %ebp
     abc:	c3                   	ret    
     abd:	bf 00 20 00 00       	mov    $0x2000,%edi
     ac2:	89 f3                	mov    %esi,%ebx
     ac4:	eb 97                	jmp    a5d <pipe1+0x4d>
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     ac6:	83 ec 0c             	sub    $0xc,%esp
     ac9:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     acc:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     ace:	e8 37 2e 00 00       	call   390a <close>
     ad3:	83 c4 10             	add    $0x10,%esp
     ad6:	89 f0                	mov    %esi,%eax
     ad8:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     ade:	89 f3                	mov    %esi,%ebx
     ae0:	f7 d8                	neg    %eax
     ae2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ae8:	88 9c 18 40 87 00 00 	mov    %bl,0x8740(%eax,%ebx,1)
     aef:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     af2:	39 d3                	cmp    %edx,%ebx
     af4:	75 f2                	jne    ae8 <pipe1+0xd8>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     af6:	83 ec 04             	sub    $0x4,%esp
     af9:	89 de                	mov    %ebx,%esi
     afb:	68 09 04 00 00       	push   $0x409
     b00:	68 40 87 00 00       	push   $0x8740
     b05:	ff 75 e4             	pushl  -0x1c(%ebp)
     b08:	e8 f5 2d 00 00       	call   3902 <write>
     b0d:	83 c4 10             	add    $0x10,%esp
     b10:	3d 09 04 00 00       	cmp    $0x409,%eax
     b15:	75 7b                	jne    b92 <pipe1+0x182>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     b17:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b1d:	75 b7                	jne    ad6 <pipe1+0xc6>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     b1f:	e8 be 2d 00 00       	call   38e2 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b24:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b2b:	75 26                	jne    b53 <pipe1+0x143>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     b2d:	83 ec 0c             	sub    $0xc,%esp
     b30:	ff 75 e0             	pushl  -0x20(%ebp)
     b33:	e8 d2 2d 00 00       	call   390a <close>
    wait();
     b38:	e8 ad 2d 00 00       	call   38ea <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b3d:	58                   	pop    %eax
     b3e:	5a                   	pop    %edx
     b3f:	68 9f 41 00 00       	push   $0x419f
     b44:	6a 01                	push   $0x1
     b46:	e8 15 2f 00 00       	call   3a60 <printf>
     b4b:	83 c4 10             	add    $0x10,%esp
     b4e:	e9 62 ff ff ff       	jmp    ab5 <pipe1+0xa5>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     b53:	83 ec 04             	sub    $0x4,%esp
     b56:	ff 75 d4             	pushl  -0x2c(%ebp)
     b59:	68 88 41 00 00       	push   $0x4188
     b5e:	6a 01                	push   $0x1
     b60:	e8 fb 2e 00 00       	call   3a60 <printf>
      exit();
     b65:	e8 78 2d 00 00       	call   38e2 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     b6a:	83 ec 08             	sub    $0x8,%esp
     b6d:	68 5d 41 00 00       	push   $0x415d
     b72:	6a 01                	push   $0x1
     b74:	e8 e7 2e 00 00       	call   3a60 <printf>
    exit();
     b79:	e8 64 2d 00 00       	call   38e2 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b7e:	83 ec 08             	sub    $0x8,%esp
     b81:	68 a9 41 00 00       	push   $0x41a9
     b86:	6a 01                	push   $0x1
     b88:	e8 d3 2e 00 00       	call   3a60 <printf>
    exit();
     b8d:	e8 50 2d 00 00       	call   38e2 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     b92:	83 ec 08             	sub    $0x8,%esp
     b95:	68 6c 41 00 00       	push   $0x416c
     b9a:	6a 01                	push   $0x1
     b9c:	e8 bf 2e 00 00       	call   3a60 <printf>
        exit();
     ba1:	e8 3c 2d 00 00       	call   38e2 <exit>
     ba6:	8d 76 00             	lea    0x0(%esi),%esi
     ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bb0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	57                   	push   %edi
     bb4:	56                   	push   %esi
     bb5:	53                   	push   %ebx
     bb6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     bb9:	68 b8 41 00 00       	push   $0x41b8
     bbe:	6a 01                	push   $0x1
     bc0:	e8 9b 2e 00 00       	call   3a60 <printf>
  pid1 = fork();
     bc5:	e8 10 2d 00 00       	call   38da <fork>
  if(pid1 == 0)
     bca:	83 c4 10             	add    $0x10,%esp
     bcd:	85 c0                	test   %eax,%eax
{
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
  pid1 = fork();
     bcf:	89 c7                	mov    %eax,%edi
  if(pid1 == 0)
     bd1:	75 02                	jne    bd5 <preempt+0x25>
    for(;;)
      ;
     bd3:	eb fe                	jmp    bd3 <preempt+0x23>

  pid2 = fork();
     bd5:	e8 00 2d 00 00       	call   38da <fork>
  if(pid2 == 0)
     bda:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     bdc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bde:	75 02                	jne    be2 <preempt+0x32>
    for(;;)
      ;
     be0:	eb fe                	jmp    be0 <preempt+0x30>

  pipe(pfds);
     be2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     be5:	83 ec 0c             	sub    $0xc,%esp
     be8:	50                   	push   %eax
     be9:	e8 04 2d 00 00       	call   38f2 <pipe>
  pid3 = fork();
     bee:	e8 e7 2c 00 00       	call   38da <fork>
  if(pid3 == 0){
     bf3:	83 c4 10             	add    $0x10,%esp
     bf6:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     bf8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bfa:	75 47                	jne    c43 <preempt+0x93>
    close(pfds[0]);
     bfc:	83 ec 0c             	sub    $0xc,%esp
     bff:	ff 75 e0             	pushl  -0x20(%ebp)
     c02:	e8 03 2d 00 00       	call   390a <close>
    if(write(pfds[1], "x", 1) != 1)
     c07:	83 c4 0c             	add    $0xc,%esp
     c0a:	6a 01                	push   $0x1
     c0c:	68 7d 47 00 00       	push   $0x477d
     c11:	ff 75 e4             	pushl  -0x1c(%ebp)
     c14:	e8 e9 2c 00 00       	call   3902 <write>
     c19:	83 c4 10             	add    $0x10,%esp
     c1c:	83 f8 01             	cmp    $0x1,%eax
     c1f:	74 12                	je     c33 <preempt+0x83>
      printf(1, "preempt write error");
     c21:	83 ec 08             	sub    $0x8,%esp
     c24:	68 c2 41 00 00       	push   $0x41c2
     c29:	6a 01                	push   $0x1
     c2b:	e8 30 2e 00 00       	call   3a60 <printf>
     c30:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c33:	83 ec 0c             	sub    $0xc,%esp
     c36:	ff 75 e4             	pushl  -0x1c(%ebp)
     c39:	e8 cc 2c 00 00       	call   390a <close>
     c3e:	83 c4 10             	add    $0x10,%esp
    for(;;)
      ;
     c41:	eb fe                	jmp    c41 <preempt+0x91>
  }

  close(pfds[1]);
     c43:	83 ec 0c             	sub    $0xc,%esp
     c46:	ff 75 e4             	pushl  -0x1c(%ebp)
     c49:	e8 bc 2c 00 00       	call   390a <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c4e:	83 c4 0c             	add    $0xc,%esp
     c51:	68 00 20 00 00       	push   $0x2000
     c56:	68 40 87 00 00       	push   $0x8740
     c5b:	ff 75 e0             	pushl  -0x20(%ebp)
     c5e:	e8 97 2c 00 00       	call   38fa <read>
     c63:	83 c4 10             	add    $0x10,%esp
     c66:	83 f8 01             	cmp    $0x1,%eax
     c69:	74 1a                	je     c85 <preempt+0xd5>
    printf(1, "preempt read error");
     c6b:	83 ec 08             	sub    $0x8,%esp
     c6e:	68 d6 41 00 00       	push   $0x41d6
     c73:	6a 01                	push   $0x1
     c75:	e8 e6 2d 00 00       	call   3a60 <printf>
    return;
     c7a:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     c7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c80:	5b                   	pop    %ebx
     c81:	5e                   	pop    %esi
     c82:	5f                   	pop    %edi
     c83:	5d                   	pop    %ebp
     c84:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     c85:	83 ec 0c             	sub    $0xc,%esp
     c88:	ff 75 e0             	pushl  -0x20(%ebp)
     c8b:	e8 7a 2c 00 00       	call   390a <close>
  printf(1, "kill... ");
     c90:	58                   	pop    %eax
     c91:	5a                   	pop    %edx
     c92:	68 e9 41 00 00       	push   $0x41e9
     c97:	6a 01                	push   $0x1
     c99:	e8 c2 2d 00 00       	call   3a60 <printf>
  kill(pid1);
     c9e:	89 3c 24             	mov    %edi,(%esp)
     ca1:	e8 6c 2c 00 00       	call   3912 <kill>
  kill(pid2);
     ca6:	89 34 24             	mov    %esi,(%esp)
     ca9:	e8 64 2c 00 00       	call   3912 <kill>
  kill(pid3);
     cae:	89 1c 24             	mov    %ebx,(%esp)
     cb1:	e8 5c 2c 00 00       	call   3912 <kill>
  printf(1, "wait... ");
     cb6:	59                   	pop    %ecx
     cb7:	5b                   	pop    %ebx
     cb8:	68 f2 41 00 00       	push   $0x41f2
     cbd:	6a 01                	push   $0x1
     cbf:	e8 9c 2d 00 00       	call   3a60 <printf>
  wait();
     cc4:	e8 21 2c 00 00       	call   38ea <wait>
  wait();
     cc9:	e8 1c 2c 00 00       	call   38ea <wait>
  wait();
     cce:	e8 17 2c 00 00       	call   38ea <wait>
  printf(1, "preempt ok\n");
     cd3:	5e                   	pop    %esi
     cd4:	5f                   	pop    %edi
     cd5:	68 fb 41 00 00       	push   $0x41fb
     cda:	6a 01                	push   $0x1
     cdc:	e8 7f 2d 00 00       	call   3a60 <printf>
     ce1:	83 c4 10             	add    $0x10,%esp
     ce4:	eb 97                	jmp    c7d <preempt+0xcd>
     ce6:	8d 76 00             	lea    0x0(%esi),%esi
     ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cf0 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	be 64 00 00 00       	mov    $0x64,%esi
     cf9:	53                   	push   %ebx
     cfa:	eb 14                	jmp    d10 <exitwait+0x20>
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     d00:	74 6f                	je     d71 <exitwait+0x81>
      if(wait() != pid){
     d02:	e8 e3 2b 00 00       	call   38ea <wait>
     d07:	39 d8                	cmp    %ebx,%eax
     d09:	75 2d                	jne    d38 <exitwait+0x48>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     d0b:	83 ee 01             	sub    $0x1,%esi
     d0e:	74 48                	je     d58 <exitwait+0x68>
    pid = fork();
     d10:	e8 c5 2b 00 00       	call   38da <fork>
    if(pid < 0){
     d15:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     d17:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d19:	79 e5                	jns    d00 <exitwait+0x10>
      printf(1, "fork failed\n");
     d1b:	83 ec 08             	sub    $0x8,%esp
     d1e:	68 65 4d 00 00       	push   $0x4d65
     d23:	6a 01                	push   $0x1
     d25:	e8 36 2d 00 00       	call   3a60 <printf>
      return;
     d2a:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d30:	5b                   	pop    %ebx
     d31:	5e                   	pop    %esi
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret    
     d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     d38:	83 ec 08             	sub    $0x8,%esp
     d3b:	68 07 42 00 00       	push   $0x4207
     d40:	6a 01                	push   $0x1
     d42:	e8 19 2d 00 00       	call   3a60 <printf>
        return;
     d47:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d4d:	5b                   	pop    %ebx
     d4e:	5e                   	pop    %esi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
     d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d58:	83 ec 08             	sub    $0x8,%esp
     d5b:	68 17 42 00 00       	push   $0x4217
     d60:	6a 01                	push   $0x1
     d62:	e8 f9 2c 00 00       	call   3a60 <printf>
     d67:	83 c4 10             	add    $0x10,%esp
}
     d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d6d:	5b                   	pop    %ebx
     d6e:	5e                   	pop    %esi
     d6f:	5d                   	pop    %ebp
     d70:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     d71:	e8 6c 2b 00 00       	call   38e2 <exit>
     d76:	8d 76 00             	lea    0x0(%esi),%esi
     d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d80 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	56                   	push   %esi
     d84:	53                   	push   %ebx
     d85:	31 db                	xor    %ebx,%ebx
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d87:	83 ec 08             	sub    $0x8,%esp
     d8a:	68 24 42 00 00       	push   $0x4224
     d8f:	6a 01                	push   $0x1
     d91:	e8 ca 2c 00 00       	call   3a60 <printf>
  ppid = getpid();
     d96:	e8 c7 2b 00 00       	call   3962 <getpid>
     d9b:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d9d:	e8 38 2b 00 00       	call   38da <fork>
     da2:	83 c4 10             	add    $0x10,%esp
     da5:	85 c0                	test   %eax,%eax
     da7:	74 0b                	je     db4 <mem+0x34>
     da9:	eb 6d                	jmp    e18 <mem+0x98>
     dab:	90                   	nop
     dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     db0:	89 18                	mov    %ebx,(%eax)
     db2:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     db4:	83 ec 0c             	sub    $0xc,%esp
     db7:	68 11 27 00 00       	push   $0x2711
     dbc:	e8 ef 2e 00 00       	call   3cb0 <malloc>
     dc1:	83 c4 10             	add    $0x10,%esp
     dc4:	85 c0                	test   %eax,%eax
     dc6:	75 e8                	jne    db0 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     dc8:	85 db                	test   %ebx,%ebx
     dca:	89 da                	mov    %ebx,%edx
     dcc:	74 16                	je     de4 <mem+0x64>
     dce:	66 90                	xchg   %ax,%ax
      m2 = *(char**)m1;
     dd0:	8b 1a                	mov    (%edx),%ebx
      free(m1);
     dd2:	83 ec 0c             	sub    $0xc,%esp
     dd5:	52                   	push   %edx
     dd6:	e8 45 2e 00 00       	call   3c20 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ddb:	83 c4 10             	add    $0x10,%esp
     dde:	85 db                	test   %ebx,%ebx
     de0:	89 da                	mov    %ebx,%edx
     de2:	75 ec                	jne    dd0 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     de4:	83 ec 0c             	sub    $0xc,%esp
     de7:	68 00 50 00 00       	push   $0x5000
     dec:	e8 bf 2e 00 00       	call   3cb0 <malloc>
    if(m1 == 0){
     df1:	83 c4 10             	add    $0x10,%esp
     df4:	85 c0                	test   %eax,%eax
     df6:	74 30                	je     e28 <mem+0xa8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     df8:	83 ec 0c             	sub    $0xc,%esp
     dfb:	50                   	push   %eax
     dfc:	e8 1f 2e 00 00       	call   3c20 <free>
    printf(1, "mem ok\n");
     e01:	58                   	pop    %eax
     e02:	5a                   	pop    %edx
     e03:	68 48 42 00 00       	push   $0x4248
     e08:	6a 01                	push   $0x1
     e0a:	e8 51 2c 00 00       	call   3a60 <printf>
    exit();
     e0f:	e8 ce 2a 00 00       	call   38e2 <exit>
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
     e18:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e1b:	5b                   	pop    %ebx
     e1c:	5e                   	pop    %esi
     e1d:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     e1e:	e9 c7 2a 00 00       	jmp    38ea <wait>
     e23:	90                   	nop
     e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     e28:	83 ec 08             	sub    $0x8,%esp
     e2b:	68 2e 42 00 00       	push   $0x422e
     e30:	6a 01                	push   $0x1
     e32:	e8 29 2c 00 00       	call   3a60 <printf>
      kill(ppid);
     e37:	89 34 24             	mov    %esi,(%esp)
     e3a:	e8 d3 2a 00 00       	call   3912 <kill>
      exit();
     e3f:	e8 9e 2a 00 00       	call   38e2 <exit>
     e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e50 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	57                   	push   %edi
     e54:	56                   	push   %esi
     e55:	53                   	push   %ebx
     e56:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e59:	68 50 42 00 00       	push   $0x4250
     e5e:	6a 01                	push   $0x1
     e60:	e8 fb 2b 00 00       	call   3a60 <printf>

  unlink("sharedfd");
     e65:	c7 04 24 5f 42 00 00 	movl   $0x425f,(%esp)
     e6c:	e8 c1 2a 00 00       	call   3932 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e71:	5b                   	pop    %ebx
     e72:	5e                   	pop    %esi
     e73:	68 02 02 00 00       	push   $0x202
     e78:	68 5f 42 00 00       	push   $0x425f
     e7d:	e8 a0 2a 00 00       	call   3922 <open>
  if(fd < 0){
     e82:	83 c4 10             	add    $0x10,%esp
     e85:	85 c0                	test   %eax,%eax
  char buf[10];

  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e87:	89 c7                	mov    %eax,%edi
  if(fd < 0){
     e89:	0f 88 27 01 00 00    	js     fb6 <sharedfd+0x166>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e8f:	e8 46 2a 00 00       	call   38da <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e94:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e97:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e9a:	8d 75 de             	lea    -0x22(%ebp),%esi
     e9d:	19 c0                	sbb    %eax,%eax
     e9f:	83 ec 04             	sub    $0x4,%esp
     ea2:	bb e8 03 00 00       	mov    $0x3e8,%ebx
     ea7:	83 e0 f3             	and    $0xfffffff3,%eax
     eaa:	6a 0a                	push   $0xa
     eac:	83 c0 70             	add    $0x70,%eax
     eaf:	50                   	push   %eax
     eb0:	56                   	push   %esi
     eb1:	e8 9a 28 00 00       	call   3750 <memset>
     eb6:	83 c4 10             	add    $0x10,%esp
     eb9:	eb 0a                	jmp    ec5 <sharedfd+0x75>
     ebb:	90                   	nop
     ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     ec0:	83 eb 01             	sub    $0x1,%ebx
     ec3:	74 26                	je     eeb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ec5:	83 ec 04             	sub    $0x4,%esp
     ec8:	6a 0a                	push   $0xa
     eca:	56                   	push   %esi
     ecb:	57                   	push   %edi
     ecc:	e8 31 2a 00 00       	call   3902 <write>
     ed1:	83 c4 10             	add    $0x10,%esp
     ed4:	83 f8 0a             	cmp    $0xa,%eax
     ed7:	74 e7                	je     ec0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     ed9:	83 ec 08             	sub    $0x8,%esp
     edc:	68 50 4f 00 00       	push   $0x4f50
     ee1:	6a 01                	push   $0x1
     ee3:	e8 78 2b 00 00       	call   3a60 <printf>
      break;
     ee8:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     eeb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     eee:	85 c9                	test   %ecx,%ecx
     ef0:	0f 84 f4 00 00 00    	je     fea <sharedfd+0x19a>
    exit();
  else
    wait();
     ef6:	e8 ef 29 00 00       	call   38ea <wait>
  close(fd);
     efb:	83 ec 0c             	sub    $0xc,%esp
     efe:	31 db                	xor    %ebx,%ebx
     f00:	57                   	push   %edi
     f01:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f04:	e8 01 2a 00 00       	call   390a <close>
  fd = open("sharedfd", 0);
     f09:	58                   	pop    %eax
     f0a:	5a                   	pop    %edx
     f0b:	6a 00                	push   $0x0
     f0d:	68 5f 42 00 00       	push   $0x425f
     f12:	e8 0b 2a 00 00       	call   3922 <open>
  if(fd < 0){
     f17:	83 c4 10             	add    $0x10,%esp
     f1a:	31 d2                	xor    %edx,%edx
     f1c:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
     f1e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f21:	0f 88 a9 00 00 00    	js     fd0 <sharedfd+0x180>
     f27:	89 f6                	mov    %esi,%esi
     f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f30:	83 ec 04             	sub    $0x4,%esp
     f33:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f36:	6a 0a                	push   $0xa
     f38:	56                   	push   %esi
     f39:	ff 75 d0             	pushl  -0x30(%ebp)
     f3c:	e8 b9 29 00 00       	call   38fa <read>
     f41:	83 c4 10             	add    $0x10,%esp
     f44:	85 c0                	test   %eax,%eax
     f46:	7e 27                	jle    f6f <sharedfd+0x11f>
     f48:	89 f0                	mov    %esi,%eax
     f4a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f4d:	eb 13                	jmp    f62 <sharedfd+0x112>
     f4f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
     f50:	80 f9 70             	cmp    $0x70,%cl
     f53:	0f 94 c1             	sete   %cl
     f56:	0f b6 c9             	movzbl %cl,%ecx
     f59:	01 cb                	add    %ecx,%ebx
     f5b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     f5e:	39 f8                	cmp    %edi,%eax
     f60:	74 ce                	je     f30 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f62:	0f b6 08             	movzbl (%eax),%ecx
     f65:	80 f9 63             	cmp    $0x63,%cl
     f68:	75 e6                	jne    f50 <sharedfd+0x100>
        nc++;
     f6a:	83 c2 01             	add    $0x1,%edx
     f6d:	eb ec                	jmp    f5b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     f6f:	83 ec 0c             	sub    $0xc,%esp
     f72:	ff 75 d0             	pushl  -0x30(%ebp)
     f75:	e8 90 29 00 00       	call   390a <close>
  unlink("sharedfd");
     f7a:	c7 04 24 5f 42 00 00 	movl   $0x425f,(%esp)
     f81:	e8 ac 29 00 00       	call   3932 <unlink>
  if(nc == 10000 && np == 10000){
     f86:	83 c4 10             	add    $0x10,%esp
     f89:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     f8f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f92:	75 5b                	jne    fef <sharedfd+0x19f>
     f94:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     f9a:	75 53                	jne    fef <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     f9c:	83 ec 08             	sub    $0x8,%esp
     f9f:	68 68 42 00 00       	push   $0x4268
     fa4:	6a 01                	push   $0x1
     fa6:	e8 b5 2a 00 00       	call   3a60 <printf>
     fab:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fae:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fb1:	5b                   	pop    %ebx
     fb2:	5e                   	pop    %esi
     fb3:	5f                   	pop    %edi
     fb4:	5d                   	pop    %ebp
     fb5:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     fb6:	83 ec 08             	sub    $0x8,%esp
     fb9:	68 24 4f 00 00       	push   $0x4f24
     fbe:	6a 01                	push   $0x1
     fc0:	e8 9b 2a 00 00       	call   3a60 <printf>
    return;
     fc5:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fc8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fcb:	5b                   	pop    %ebx
     fcc:	5e                   	pop    %esi
     fcd:	5f                   	pop    %edi
     fce:	5d                   	pop    %ebp
     fcf:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fd0:	83 ec 08             	sub    $0x8,%esp
     fd3:	68 70 4f 00 00       	push   $0x4f70
     fd8:	6a 01                	push   $0x1
     fda:	e8 81 2a 00 00       	call   3a60 <printf>
    return;
     fdf:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fe2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fe5:	5b                   	pop    %ebx
     fe6:	5e                   	pop    %esi
     fe7:	5f                   	pop    %edi
     fe8:	5d                   	pop    %ebp
     fe9:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit();
     fea:	e8 f3 28 00 00       	call   38e2 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     fef:	53                   	push   %ebx
     ff0:	52                   	push   %edx
     ff1:	68 75 42 00 00       	push   $0x4275
     ff6:	6a 01                	push   $0x1
     ff8:	e8 63 2a 00 00       	call   3a60 <printf>
    exit();
     ffd:	e8 e0 28 00 00       	call   38e2 <exit>
    1002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001010 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	57                   	push   %edi
    1014:	56                   	push   %esi
    1015:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1016:	be 8a 42 00 00       	mov    $0x428a,%esi

  for(pi = 0; pi < 4; pi++){
    101b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    101d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1020:	c7 45 d8 8a 42 00 00 	movl   $0x428a,-0x28(%ebp)
    1027:	c7 45 dc d3 43 00 00 	movl   $0x43d3,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    102e:	68 90 42 00 00       	push   $0x4290
    1033:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1035:	c7 45 e0 d7 43 00 00 	movl   $0x43d7,-0x20(%ebp)
    103c:	c7 45 e4 8d 42 00 00 	movl   $0x428d,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    1043:	e8 18 2a 00 00       	call   3a60 <printf>
    1048:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    104b:	83 ec 0c             	sub    $0xc,%esp
    104e:	56                   	push   %esi
    104f:	e8 de 28 00 00       	call   3932 <unlink>

    pid = fork();
    1054:	e8 81 28 00 00       	call   38da <fork>
    if(pid < 0){
    1059:	83 c4 10             	add    $0x10,%esp
    105c:	85 c0                	test   %eax,%eax
    105e:	0f 88 85 01 00 00    	js     11e9 <fourfiles+0x1d9>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1064:	0f 84 e5 00 00 00    	je     114f <fourfiles+0x13f>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    106a:	83 c3 01             	add    $0x1,%ebx
    106d:	83 fb 04             	cmp    $0x4,%ebx
    1070:	74 06                	je     1078 <fourfiles+0x68>
    1072:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1076:	eb d3                	jmp    104b <fourfiles+0x3b>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    1078:	e8 6d 28 00 00       	call   38ea <wait>
    107d:	bf 30 00 00 00       	mov    $0x30,%edi
    1082:	e8 63 28 00 00       	call   38ea <wait>
    1087:	e8 5e 28 00 00       	call   38ea <wait>
    108c:	e8 59 28 00 00       	call   38ea <wait>
    1091:	c7 45 d4 8a 42 00 00 	movl   $0x428a,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1098:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    109b:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    109d:	6a 00                	push   $0x0
    109f:	ff 75 d4             	pushl  -0x2c(%ebp)
    10a2:	e8 7b 28 00 00       	call   3922 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10a7:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    10aa:	89 c6                	mov    %eax,%esi
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	68 00 20 00 00       	push   $0x2000
    10b8:	68 40 87 00 00       	push   $0x8740
    10bd:	56                   	push   %esi
    10be:	e8 37 28 00 00       	call   38fa <read>
    10c3:	83 c4 10             	add    $0x10,%esp
    10c6:	85 c0                	test   %eax,%eax
    10c8:	7e 1c                	jle    10e6 <fourfiles+0xd6>
    10ca:	31 d2                	xor    %edx,%edx
    10cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    10d0:	0f be 8a 40 87 00 00 	movsbl 0x8740(%edx),%ecx
    10d7:	39 cf                	cmp    %ecx,%edi
    10d9:	75 60                	jne    113b <fourfiles+0x12b>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    10db:	83 c2 01             	add    $0x1,%edx
    10de:	39 c2                	cmp    %eax,%edx
    10e0:	75 ee                	jne    10d0 <fourfiles+0xc0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    10e2:	01 d3                	add    %edx,%ebx
    10e4:	eb ca                	jmp    10b0 <fourfiles+0xa0>
    }
    close(fd);
    10e6:	83 ec 0c             	sub    $0xc,%esp
    10e9:	56                   	push   %esi
    10ea:	e8 1b 28 00 00       	call   390a <close>
    if(total != 12*500){
    10ef:	83 c4 10             	add    $0x10,%esp
    10f2:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    10f8:	0f 85 d6 00 00 00    	jne    11d4 <fourfiles+0x1c4>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    10fe:	83 ec 0c             	sub    $0xc,%esp
    1101:	ff 75 d4             	pushl  -0x2c(%ebp)
    1104:	e8 29 28 00 00       	call   3932 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    1109:	83 c4 10             	add    $0x10,%esp
    110c:	83 ff 31             	cmp    $0x31,%edi
    110f:	75 1a                	jne    112b <fourfiles+0x11b>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    1111:	83 ec 08             	sub    $0x8,%esp
    1114:	68 ce 42 00 00       	push   $0x42ce
    1119:	6a 01                	push   $0x1
    111b:	e8 40 29 00 00       	call   3a60 <printf>
    1120:	83 c4 10             	add    $0x10,%esp
}
    1123:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1126:	5b                   	pop    %ebx
    1127:	5e                   	pop    %esi
    1128:	5f                   	pop    %edi
    1129:	5d                   	pop    %ebp
    112a:	c3                   	ret    
    112b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    112e:	bf 31 00 00 00       	mov    $0x31,%edi
    1133:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1136:	e9 5d ff ff ff       	jmp    1098 <fourfiles+0x88>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    113b:	83 ec 08             	sub    $0x8,%esp
    113e:	68 b1 42 00 00       	push   $0x42b1
    1143:	6a 01                	push   $0x1
    1145:	e8 16 29 00 00       	call   3a60 <printf>
          exit();
    114a:	e8 93 27 00 00       	call   38e2 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    114f:	83 ec 08             	sub    $0x8,%esp
    1152:	68 02 02 00 00       	push   $0x202
    1157:	56                   	push   %esi
    1158:	e8 c5 27 00 00       	call   3922 <open>
      if(fd < 0){
    115d:	83 c4 10             	add    $0x10,%esp
    1160:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1162:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    1164:	78 5a                	js     11c0 <fourfiles+0x1b0>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    1166:	83 ec 04             	sub    $0x4,%esp
    1169:	83 c3 30             	add    $0x30,%ebx
    116c:	68 00 02 00 00       	push   $0x200
    1171:	53                   	push   %ebx
    1172:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1177:	68 40 87 00 00       	push   $0x8740
    117c:	e8 cf 25 00 00       	call   3750 <memset>
    1181:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    1184:	83 ec 04             	sub    $0x4,%esp
    1187:	68 f4 01 00 00       	push   $0x1f4
    118c:	68 40 87 00 00       	push   $0x8740
    1191:	56                   	push   %esi
    1192:	e8 6b 27 00 00       	call   3902 <write>
    1197:	83 c4 10             	add    $0x10,%esp
    119a:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    119f:	75 0a                	jne    11ab <fourfiles+0x19b>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    11a1:	83 eb 01             	sub    $0x1,%ebx
    11a4:	75 de                	jne    1184 <fourfiles+0x174>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    11a6:	e8 37 27 00 00       	call   38e2 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    11ab:	83 ec 04             	sub    $0x4,%esp
    11ae:	50                   	push   %eax
    11af:	68 a0 42 00 00       	push   $0x42a0
    11b4:	6a 01                	push   $0x1
    11b6:	e8 a5 28 00 00       	call   3a60 <printf>
          exit();
    11bb:	e8 22 27 00 00       	call   38e2 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    11c0:	83 ec 08             	sub    $0x8,%esp
    11c3:	68 2b 45 00 00       	push   $0x452b
    11c8:	6a 01                	push   $0x1
    11ca:	e8 91 28 00 00       	call   3a60 <printf>
        exit();
    11cf:	e8 0e 27 00 00       	call   38e2 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    11d4:	83 ec 04             	sub    $0x4,%esp
    11d7:	53                   	push   %ebx
    11d8:	68 bd 42 00 00       	push   $0x42bd
    11dd:	6a 01                	push   $0x1
    11df:	e8 7c 28 00 00       	call   3a60 <printf>
      exit();
    11e4:	e8 f9 26 00 00       	call   38e2 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    11e9:	83 ec 08             	sub    $0x8,%esp
    11ec:	68 65 4d 00 00       	push   $0x4d65
    11f1:	6a 01                	push   $0x1
    11f3:	e8 68 28 00 00       	call   3a60 <printf>
      exit();
    11f8:	e8 e5 26 00 00       	call   38e2 <exit>
    11fd:	8d 76 00             	lea    0x0(%esi),%esi

00001200 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	57                   	push   %edi
    1204:	56                   	push   %esi
    1205:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    1206:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1208:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    120b:	68 dc 42 00 00       	push   $0x42dc
    1210:	6a 01                	push   $0x1
    1212:	e8 49 28 00 00       	call   3a60 <printf>
    1217:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    121a:	e8 bb 26 00 00       	call   38da <fork>
    if(pid < 0){
    121f:	85 c0                	test   %eax,%eax
    1221:	0f 88 b7 01 00 00    	js     13de <createdelete+0x1de>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1227:	0f 84 f6 00 00 00    	je     1323 <createdelete+0x123>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    122d:	83 c3 01             	add    $0x1,%ebx
    1230:	83 fb 04             	cmp    $0x4,%ebx
    1233:	75 e5                	jne    121a <createdelete+0x1a>
    1235:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1238:	31 f6                	xor    %esi,%esi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    123a:	e8 ab 26 00 00       	call   38ea <wait>
    123f:	e8 a6 26 00 00       	call   38ea <wait>
    1244:	e8 a1 26 00 00       	call   38ea <wait>
    1249:	e8 9c 26 00 00       	call   38ea <wait>
  }

  name[0] = name[1] = name[2] = 0;
    124e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1252:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1258:	8d 46 30             	lea    0x30(%esi),%eax
    125b:	83 fe 09             	cmp    $0x9,%esi
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    125e:	bb 70 00 00 00       	mov    $0x70,%ebx
    1263:	0f 9f c2             	setg   %dl
    1266:	85 f6                	test   %esi,%esi
    1268:	88 45 c7             	mov    %al,-0x39(%ebp)
    126b:	0f 94 c0             	sete   %al
    126e:	09 c2                	or     %eax,%edx
    1270:	8d 46 ff             	lea    -0x1(%esi),%eax
    1273:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    1276:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1279:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    127d:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1280:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    1283:	6a 00                	push   $0x0
    1285:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1286:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1289:	e8 94 26 00 00       	call   3922 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    128e:	89 c1                	mov    %eax,%ecx
    1290:	83 c4 10             	add    $0x10,%esp
    1293:	c1 e9 1f             	shr    $0x1f,%ecx
    1296:	84 c9                	test   %cl,%cl
    1298:	74 0a                	je     12a4 <createdelete+0xa4>
    129a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    129e:	0f 85 11 01 00 00    	jne    13b5 <createdelete+0x1b5>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12a4:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    12a8:	0f 86 44 01 00 00    	jbe    13f2 <createdelete+0x1f2>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    12ae:	85 c0                	test   %eax,%eax
    12b0:	78 0c                	js     12be <createdelete+0xbe>
        close(fd);
    12b2:	83 ec 0c             	sub    $0xc,%esp
    12b5:	50                   	push   %eax
    12b6:	e8 4f 26 00 00       	call   390a <close>
    12bb:	83 c4 10             	add    $0x10,%esp
    12be:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12c1:	80 fb 74             	cmp    $0x74,%bl
    12c4:	75 b3                	jne    1279 <createdelete+0x79>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    12c6:	83 c6 01             	add    $0x1,%esi
    12c9:	83 fe 14             	cmp    $0x14,%esi
    12cc:	75 8a                	jne    1258 <createdelete+0x58>
    12ce:	be 70 00 00 00       	mov    $0x70,%esi
    12d3:	90                   	nop
    12d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12d8:	8d 46 c0             	lea    -0x40(%esi),%eax
    12db:	bb 04 00 00 00       	mov    $0x4,%ebx
    12e0:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12e3:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    12e5:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12e8:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12eb:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    12ef:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    12f0:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    12f3:	e8 3a 26 00 00       	call   3932 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12f8:	83 c4 10             	add    $0x10,%esp
    12fb:	83 eb 01             	sub    $0x1,%ebx
    12fe:	75 e3                	jne    12e3 <createdelete+0xe3>
    1300:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    1303:	89 f0                	mov    %esi,%eax
    1305:	3c 84                	cmp    $0x84,%al
    1307:	75 cf                	jne    12d8 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    1309:	83 ec 08             	sub    $0x8,%esp
    130c:	68 ef 42 00 00       	push   $0x42ef
    1311:	6a 01                	push   $0x1
    1313:	e8 48 27 00 00       	call   3a60 <printf>
    1318:	83 c4 10             	add    $0x10,%esp
}
    131b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    131e:	5b                   	pop    %ebx
    131f:	5e                   	pop    %esi
    1320:	5f                   	pop    %edi
    1321:	5d                   	pop    %ebp
    1322:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1323:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1326:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    132a:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    132f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1332:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    1335:	31 db                	xor    %ebx,%ebx
    1337:	eb 12                	jmp    134b <createdelete+0x14b>
    1339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1340:	83 fe 14             	cmp    $0x14,%esi
    1343:	74 6b                	je     13b0 <createdelete+0x1b0>
    1345:	83 c3 01             	add    $0x1,%ebx
    1348:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    134b:	83 ec 08             	sub    $0x8,%esp
    134e:	8d 43 30             	lea    0x30(%ebx),%eax
    1351:	68 02 02 00 00       	push   $0x202
    1356:	57                   	push   %edi
    1357:	88 45 c9             	mov    %al,-0x37(%ebp)
    135a:	e8 c3 25 00 00       	call   3922 <open>
        if(fd < 0){
    135f:	83 c4 10             	add    $0x10,%esp
    1362:	85 c0                	test   %eax,%eax
    1364:	78 64                	js     13ca <createdelete+0x1ca>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    1366:	83 ec 0c             	sub    $0xc,%esp
    1369:	50                   	push   %eax
    136a:	e8 9b 25 00 00       	call   390a <close>
        if(i > 0 && (i % 2 ) == 0){
    136f:	83 c4 10             	add    $0x10,%esp
    1372:	85 db                	test   %ebx,%ebx
    1374:	74 cf                	je     1345 <createdelete+0x145>
    1376:	f6 c3 01             	test   $0x1,%bl
    1379:	75 c5                	jne    1340 <createdelete+0x140>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    137b:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    137e:	89 d8                	mov    %ebx,%eax
    1380:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    1382:	57                   	push   %edi
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    1383:	83 c0 30             	add    $0x30,%eax
    1386:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1389:	e8 a4 25 00 00       	call   3932 <unlink>
    138e:	83 c4 10             	add    $0x10,%esp
    1391:	85 c0                	test   %eax,%eax
    1393:	79 ab                	jns    1340 <createdelete+0x140>
            printf(1, "unlink failed\n");
    1395:	83 ec 08             	sub    $0x8,%esp
    1398:	68 dd 3e 00 00       	push   $0x3edd
    139d:	6a 01                	push   $0x1
    139f:	e8 bc 26 00 00       	call   3a60 <printf>
            exit();
    13a4:	e8 39 25 00 00       	call   38e2 <exit>
    13a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit();
    13b0:	e8 2d 25 00 00       	call   38e2 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    13b5:	83 ec 04             	sub    $0x4,%esp
    13b8:	57                   	push   %edi
    13b9:	68 9c 4f 00 00       	push   $0x4f9c
    13be:	6a 01                	push   $0x1
    13c0:	e8 9b 26 00 00       	call   3a60 <printf>
        exit();
    13c5:	e8 18 25 00 00       	call   38e2 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    13ca:	83 ec 08             	sub    $0x8,%esp
    13cd:	68 2b 45 00 00       	push   $0x452b
    13d2:	6a 01                	push   $0x1
    13d4:	e8 87 26 00 00       	call   3a60 <printf>
          exit();
    13d9:	e8 04 25 00 00       	call   38e2 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    13de:	83 ec 08             	sub    $0x8,%esp
    13e1:	68 65 4d 00 00       	push   $0x4d65
    13e6:	6a 01                	push   $0x1
    13e8:	e8 73 26 00 00       	call   3a60 <printf>
      exit();
    13ed:	e8 f0 24 00 00       	call   38e2 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    13f2:	85 c0                	test   %eax,%eax
    13f4:	0f 88 c4 fe ff ff    	js     12be <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    13fa:	83 ec 04             	sub    $0x4,%esp
    13fd:	57                   	push   %edi
    13fe:	68 c0 4f 00 00       	push   $0x4fc0
    1403:	6a 01                	push   $0x1
    1405:	e8 56 26 00 00       	call   3a60 <printf>
        exit();
    140a:	e8 d3 24 00 00       	call   38e2 <exit>
    140f:	90                   	nop

00001410 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	56                   	push   %esi
    1414:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1415:	83 ec 08             	sub    $0x8,%esp
    1418:	68 00 43 00 00       	push   $0x4300
    141d:	6a 01                	push   $0x1
    141f:	e8 3c 26 00 00       	call   3a60 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1424:	5b                   	pop    %ebx
    1425:	5e                   	pop    %esi
    1426:	68 02 02 00 00       	push   $0x202
    142b:	68 11 43 00 00       	push   $0x4311
    1430:	e8 ed 24 00 00       	call   3922 <open>
  if(fd < 0){
    1435:	83 c4 10             	add    $0x10,%esp
    1438:	85 c0                	test   %eax,%eax
unlinkread(void)
{
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
    143a:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    143c:	0f 88 e4 00 00 00    	js     1526 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1442:	83 ec 04             	sub    $0x4,%esp
    1445:	6a 05                	push   $0x5
    1447:	68 36 43 00 00       	push   $0x4336
    144c:	50                   	push   %eax
    144d:	e8 b0 24 00 00       	call   3902 <write>
  close(fd);
    1452:	89 1c 24             	mov    %ebx,(%esp)
    1455:	e8 b0 24 00 00       	call   390a <close>

  fd = open("unlinkread", O_RDWR);
    145a:	58                   	pop    %eax
    145b:	5a                   	pop    %edx
    145c:	6a 02                	push   $0x2
    145e:	68 11 43 00 00       	push   $0x4311
    1463:	e8 ba 24 00 00       	call   3922 <open>
  if(fd < 0){
    1468:	83 c4 10             	add    $0x10,%esp
    146b:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    146d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    146f:	0f 88 10 01 00 00    	js     1585 <unlinkread+0x175>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    1475:	83 ec 0c             	sub    $0xc,%esp
    1478:	68 11 43 00 00       	push   $0x4311
    147d:	e8 b0 24 00 00       	call   3932 <unlink>
    1482:	83 c4 10             	add    $0x10,%esp
    1485:	85 c0                	test   %eax,%eax
    1487:	0f 85 e5 00 00 00    	jne    1572 <unlinkread+0x162>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    148d:	83 ec 08             	sub    $0x8,%esp
    1490:	68 02 02 00 00       	push   $0x202
    1495:	68 11 43 00 00       	push   $0x4311
    149a:	e8 83 24 00 00       	call   3922 <open>
  write(fd1, "yyy", 3);
    149f:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14a2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    14a4:	6a 03                	push   $0x3
    14a6:	68 6e 43 00 00       	push   $0x436e
    14ab:	50                   	push   %eax
    14ac:	e8 51 24 00 00       	call   3902 <write>
  close(fd1);
    14b1:	89 34 24             	mov    %esi,(%esp)
    14b4:	e8 51 24 00 00       	call   390a <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    14b9:	83 c4 0c             	add    $0xc,%esp
    14bc:	68 00 20 00 00       	push   $0x2000
    14c1:	68 40 87 00 00       	push   $0x8740
    14c6:	53                   	push   %ebx
    14c7:	e8 2e 24 00 00       	call   38fa <read>
    14cc:	83 c4 10             	add    $0x10,%esp
    14cf:	83 f8 05             	cmp    $0x5,%eax
    14d2:	0f 85 87 00 00 00    	jne    155f <unlinkread+0x14f>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    14d8:	80 3d 40 87 00 00 68 	cmpb   $0x68,0x8740
    14df:	75 6b                	jne    154c <unlinkread+0x13c>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    14e1:	83 ec 04             	sub    $0x4,%esp
    14e4:	6a 0a                	push   $0xa
    14e6:	68 40 87 00 00       	push   $0x8740
    14eb:	53                   	push   %ebx
    14ec:	e8 11 24 00 00       	call   3902 <write>
    14f1:	83 c4 10             	add    $0x10,%esp
    14f4:	83 f8 0a             	cmp    $0xa,%eax
    14f7:	75 40                	jne    1539 <unlinkread+0x129>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    14f9:	83 ec 0c             	sub    $0xc,%esp
    14fc:	53                   	push   %ebx
    14fd:	e8 08 24 00 00       	call   390a <close>
  unlink("unlinkread");
    1502:	c7 04 24 11 43 00 00 	movl   $0x4311,(%esp)
    1509:	e8 24 24 00 00       	call   3932 <unlink>
  printf(1, "unlinkread ok\n");
    150e:	58                   	pop    %eax
    150f:	5a                   	pop    %edx
    1510:	68 b9 43 00 00       	push   $0x43b9
    1515:	6a 01                	push   $0x1
    1517:	e8 44 25 00 00       	call   3a60 <printf>
    151c:	83 c4 10             	add    $0x10,%esp
}
    151f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1522:	5b                   	pop    %ebx
    1523:	5e                   	pop    %esi
    1524:	5d                   	pop    %ebp
    1525:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1526:	51                   	push   %ecx
    1527:	51                   	push   %ecx
    1528:	68 1c 43 00 00       	push   $0x431c
    152d:	6a 01                	push   $0x1
    152f:	e8 2c 25 00 00       	call   3a60 <printf>
    exit();
    1534:	e8 a9 23 00 00       	call   38e2 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1539:	51                   	push   %ecx
    153a:	51                   	push   %ecx
    153b:	68 a0 43 00 00       	push   $0x43a0
    1540:	6a 01                	push   $0x1
    1542:	e8 19 25 00 00       	call   3a60 <printf>
    exit();
    1547:	e8 96 23 00 00       	call   38e2 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    154c:	53                   	push   %ebx
    154d:	53                   	push   %ebx
    154e:	68 89 43 00 00       	push   $0x4389
    1553:	6a 01                	push   $0x1
    1555:	e8 06 25 00 00       	call   3a60 <printf>
    exit();
    155a:	e8 83 23 00 00       	call   38e2 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    155f:	56                   	push   %esi
    1560:	56                   	push   %esi
    1561:	68 72 43 00 00       	push   $0x4372
    1566:	6a 01                	push   $0x1
    1568:	e8 f3 24 00 00       	call   3a60 <printf>
    exit();
    156d:	e8 70 23 00 00       	call   38e2 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    1572:	50                   	push   %eax
    1573:	50                   	push   %eax
    1574:	68 54 43 00 00       	push   $0x4354
    1579:	6a 01                	push   $0x1
    157b:	e8 e0 24 00 00       	call   3a60 <printf>
    exit();
    1580:	e8 5d 23 00 00       	call   38e2 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1585:	50                   	push   %eax
    1586:	50                   	push   %eax
    1587:	68 3c 43 00 00       	push   $0x433c
    158c:	6a 01                	push   $0x1
    158e:	e8 cd 24 00 00       	call   3a60 <printf>
    exit();
    1593:	e8 4a 23 00 00       	call   38e2 <exit>
    1598:	90                   	nop
    1599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015a0 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
    15a3:	53                   	push   %ebx
    15a4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    15a7:	68 c8 43 00 00       	push   $0x43c8
    15ac:	6a 01                	push   $0x1
    15ae:	e8 ad 24 00 00       	call   3a60 <printf>

  unlink("lf1");
    15b3:	c7 04 24 d2 43 00 00 	movl   $0x43d2,(%esp)
    15ba:	e8 73 23 00 00       	call   3932 <unlink>
  unlink("lf2");
    15bf:	c7 04 24 d6 43 00 00 	movl   $0x43d6,(%esp)
    15c6:	e8 67 23 00 00       	call   3932 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    15cb:	58                   	pop    %eax
    15cc:	5a                   	pop    %edx
    15cd:	68 02 02 00 00       	push   $0x202
    15d2:	68 d2 43 00 00       	push   $0x43d2
    15d7:	e8 46 23 00 00       	call   3922 <open>
  if(fd < 0){
    15dc:	83 c4 10             	add    $0x10,%esp
    15df:	85 c0                	test   %eax,%eax
  printf(1, "linktest\n");

  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
    15e1:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    15e3:	0f 88 1c 01 00 00    	js     1705 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    15e9:	83 ec 04             	sub    $0x4,%esp
    15ec:	6a 05                	push   $0x5
    15ee:	68 36 43 00 00       	push   $0x4336
    15f3:	50                   	push   %eax
    15f4:	e8 09 23 00 00       	call   3902 <write>
    15f9:	83 c4 10             	add    $0x10,%esp
    15fc:	83 f8 05             	cmp    $0x5,%eax
    15ff:	0f 85 98 01 00 00    	jne    179d <linktest+0x1fd>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1605:	83 ec 0c             	sub    $0xc,%esp
    1608:	53                   	push   %ebx
    1609:	e8 fc 22 00 00       	call   390a <close>

  if(link("lf1", "lf2") < 0){
    160e:	5b                   	pop    %ebx
    160f:	58                   	pop    %eax
    1610:	68 d6 43 00 00       	push   $0x43d6
    1615:	68 d2 43 00 00       	push   $0x43d2
    161a:	e8 23 23 00 00       	call   3942 <link>
    161f:	83 c4 10             	add    $0x10,%esp
    1622:	85 c0                	test   %eax,%eax
    1624:	0f 88 60 01 00 00    	js     178a <linktest+0x1ea>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    162a:	83 ec 0c             	sub    $0xc,%esp
    162d:	68 d2 43 00 00       	push   $0x43d2
    1632:	e8 fb 22 00 00       	call   3932 <unlink>

  if(open("lf1", 0) >= 0){
    1637:	58                   	pop    %eax
    1638:	5a                   	pop    %edx
    1639:	6a 00                	push   $0x0
    163b:	68 d2 43 00 00       	push   $0x43d2
    1640:	e8 dd 22 00 00       	call   3922 <open>
    1645:	83 c4 10             	add    $0x10,%esp
    1648:	85 c0                	test   %eax,%eax
    164a:	0f 89 27 01 00 00    	jns    1777 <linktest+0x1d7>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1650:	83 ec 08             	sub    $0x8,%esp
    1653:	6a 00                	push   $0x0
    1655:	68 d6 43 00 00       	push   $0x43d6
    165a:	e8 c3 22 00 00       	call   3922 <open>
  if(fd < 0){
    165f:	83 c4 10             	add    $0x10,%esp
    1662:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1664:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1666:	0f 88 f8 00 00 00    	js     1764 <linktest+0x1c4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    166c:	83 ec 04             	sub    $0x4,%esp
    166f:	68 00 20 00 00       	push   $0x2000
    1674:	68 40 87 00 00       	push   $0x8740
    1679:	50                   	push   %eax
    167a:	e8 7b 22 00 00       	call   38fa <read>
    167f:	83 c4 10             	add    $0x10,%esp
    1682:	83 f8 05             	cmp    $0x5,%eax
    1685:	0f 85 c6 00 00 00    	jne    1751 <linktest+0x1b1>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    168b:	83 ec 0c             	sub    $0xc,%esp
    168e:	53                   	push   %ebx
    168f:	e8 76 22 00 00       	call   390a <close>

  if(link("lf2", "lf2") >= 0){
    1694:	58                   	pop    %eax
    1695:	5a                   	pop    %edx
    1696:	68 d6 43 00 00       	push   $0x43d6
    169b:	68 d6 43 00 00       	push   $0x43d6
    16a0:	e8 9d 22 00 00       	call   3942 <link>
    16a5:	83 c4 10             	add    $0x10,%esp
    16a8:	85 c0                	test   %eax,%eax
    16aa:	0f 89 8e 00 00 00    	jns    173e <linktest+0x19e>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    16b0:	83 ec 0c             	sub    $0xc,%esp
    16b3:	68 d6 43 00 00       	push   $0x43d6
    16b8:	e8 75 22 00 00       	call   3932 <unlink>
  if(link("lf2", "lf1") >= 0){
    16bd:	59                   	pop    %ecx
    16be:	5b                   	pop    %ebx
    16bf:	68 d2 43 00 00       	push   $0x43d2
    16c4:	68 d6 43 00 00       	push   $0x43d6
    16c9:	e8 74 22 00 00       	call   3942 <link>
    16ce:	83 c4 10             	add    $0x10,%esp
    16d1:	85 c0                	test   %eax,%eax
    16d3:	79 56                	jns    172b <linktest+0x18b>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    16d5:	83 ec 08             	sub    $0x8,%esp
    16d8:	68 d2 43 00 00       	push   $0x43d2
    16dd:	68 9a 46 00 00       	push   $0x469a
    16e2:	e8 5b 22 00 00       	call   3942 <link>
    16e7:	83 c4 10             	add    $0x10,%esp
    16ea:	85 c0                	test   %eax,%eax
    16ec:	79 2a                	jns    1718 <linktest+0x178>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    16ee:	83 ec 08             	sub    $0x8,%esp
    16f1:	68 70 44 00 00       	push   $0x4470
    16f6:	6a 01                	push   $0x1
    16f8:	e8 63 23 00 00       	call   3a60 <printf>
    16fd:	83 c4 10             	add    $0x10,%esp
}
    1700:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1703:	c9                   	leave  
    1704:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1705:	50                   	push   %eax
    1706:	50                   	push   %eax
    1707:	68 da 43 00 00       	push   $0x43da
    170c:	6a 01                	push   $0x1
    170e:	e8 4d 23 00 00       	call   3a60 <printf>
    exit();
    1713:	e8 ca 21 00 00       	call   38e2 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    1718:	50                   	push   %eax
    1719:	50                   	push   %eax
    171a:	68 54 44 00 00       	push   $0x4454
    171f:	6a 01                	push   $0x1
    1721:	e8 3a 23 00 00       	call   3a60 <printf>
    exit();
    1726:	e8 b7 21 00 00       	call   38e2 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    172b:	52                   	push   %edx
    172c:	52                   	push   %edx
    172d:	68 08 50 00 00       	push   $0x5008
    1732:	6a 01                	push   $0x1
    1734:	e8 27 23 00 00       	call   3a60 <printf>
    exit();
    1739:	e8 a4 21 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    173e:	50                   	push   %eax
    173f:	50                   	push   %eax
    1740:	68 36 44 00 00       	push   $0x4436
    1745:	6a 01                	push   $0x1
    1747:	e8 14 23 00 00       	call   3a60 <printf>
    exit();
    174c:	e8 91 21 00 00       	call   38e2 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    1751:	51                   	push   %ecx
    1752:	51                   	push   %ecx
    1753:	68 25 44 00 00       	push   $0x4425
    1758:	6a 01                	push   $0x1
    175a:	e8 01 23 00 00       	call   3a60 <printf>
    exit();
    175f:	e8 7e 21 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    1764:	53                   	push   %ebx
    1765:	53                   	push   %ebx
    1766:	68 14 44 00 00       	push   $0x4414
    176b:	6a 01                	push   $0x1
    176d:	e8 ee 22 00 00       	call   3a60 <printf>
    exit();
    1772:	e8 6b 21 00 00       	call   38e2 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    1777:	50                   	push   %eax
    1778:	50                   	push   %eax
    1779:	68 e0 4f 00 00       	push   $0x4fe0
    177e:	6a 01                	push   $0x1
    1780:	e8 db 22 00 00       	call   3a60 <printf>
    exit();
    1785:	e8 58 21 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    178a:	51                   	push   %ecx
    178b:	51                   	push   %ecx
    178c:	68 ff 43 00 00       	push   $0x43ff
    1791:	6a 01                	push   $0x1
    1793:	e8 c8 22 00 00       	call   3a60 <printf>
    exit();
    1798:	e8 45 21 00 00       	call   38e2 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    179d:	50                   	push   %eax
    179e:	50                   	push   %eax
    179f:	68 ed 43 00 00       	push   $0x43ed
    17a4:	6a 01                	push   $0x1
    17a6:	e8 b5 22 00 00       	call   3a60 <printf>
    exit();
    17ab:	e8 32 21 00 00       	call   38e2 <exit>

000017b0 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17b0:	55                   	push   %ebp
    17b1:	89 e5                	mov    %esp,%ebp
    17b3:	57                   	push   %edi
    17b4:	56                   	push   %esi
    17b5:	53                   	push   %ebx
    17b6:	8d 5d ad             	lea    -0x53(%ebp),%ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17b9:	31 f6                	xor    %esi,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17bb:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17c0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    17c3:	68 7d 44 00 00       	push   $0x447d
    17c8:	6a 01                	push   $0x1
    17ca:	e8 91 22 00 00       	call   3a60 <printf>
  file[0] = 'C';
    17cf:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17d3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17d7:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    17da:	83 ec 0c             	sub    $0xc,%esp
    17dd:	8d 46 30             	lea    0x30(%esi),%eax
    17e0:	53                   	push   %ebx
    17e1:	88 45 ae             	mov    %al,-0x52(%ebp)
    17e4:	e8 49 21 00 00       	call   3932 <unlink>
    pid = fork();
    17e9:	e8 ec 20 00 00       	call   38da <fork>
    if(pid && (i % 3) == 1){
    17ee:	83 c4 10             	add    $0x10,%esp
    17f1:	85 c0                	test   %eax,%eax
    17f3:	0f 84 d7 00 00 00    	je     18d0 <concreate+0x120>
    17f9:	89 f0                	mov    %esi,%eax
    17fb:	89 f1                	mov    %esi,%ecx
    17fd:	f7 ef                	imul   %edi
    17ff:	89 f0                	mov    %esi,%eax
    1801:	c1 f8 1f             	sar    $0x1f,%eax
    1804:	29 c2                	sub    %eax,%edx
    1806:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1809:	29 c1                	sub    %eax,%ecx
    180b:	83 f9 01             	cmp    $0x1,%ecx
    180e:	0f 84 1c 01 00 00    	je     1930 <concreate+0x180>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1814:	83 ec 08             	sub    $0x8,%esp
    1817:	68 02 02 00 00       	push   $0x202
    181c:	53                   	push   %ebx
    181d:	e8 00 21 00 00       	call   3922 <open>
      if(fd < 0){
    1822:	83 c4 10             	add    $0x10,%esp
    1825:	85 c0                	test   %eax,%eax
    1827:	0f 88 3a 02 00 00    	js     1a67 <concreate+0x2b7>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    182d:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1830:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1833:	50                   	push   %eax
    1834:	e8 d1 20 00 00       	call   390a <close>
    1839:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit();
    else
      wait();
    183c:	e8 a9 20 00 00       	call   38ea <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1841:	83 fe 28             	cmp    $0x28,%esi
    1844:	75 94                	jne    17da <concreate+0x2a>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1846:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1849:	83 ec 04             	sub    $0x4,%esp
    184c:	8d 7d b0             	lea    -0x50(%ebp),%edi
    184f:	6a 28                	push   $0x28
    1851:	6a 00                	push   $0x0
    1853:	50                   	push   %eax
    1854:	e8 f7 1e 00 00       	call   3750 <memset>
  fd = open(".", 0);
    1859:	59                   	pop    %ecx
    185a:	5e                   	pop    %esi
    185b:	6a 00                	push   $0x0
    185d:	68 9a 46 00 00       	push   $0x469a
    1862:	e8 bb 20 00 00       	call   3922 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1867:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    186a:	89 c6                	mov    %eax,%esi
  n = 0;
    186c:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1873:	90                   	nop
    1874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1878:	83 ec 04             	sub    $0x4,%esp
    187b:	6a 10                	push   $0x10
    187d:	57                   	push   %edi
    187e:	56                   	push   %esi
    187f:	e8 76 20 00 00       	call   38fa <read>
    1884:	83 c4 10             	add    $0x10,%esp
    1887:	85 c0                	test   %eax,%eax
    1889:	0f 8e d1 00 00 00    	jle    1960 <concreate+0x1b0>
    if(de.inum == 0)
    188f:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1894:	74 e2                	je     1878 <concreate+0xc8>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1896:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    189a:	75 dc                	jne    1878 <concreate+0xc8>
    189c:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    18a0:	75 d6                	jne    1878 <concreate+0xc8>
      i = de.name[1] - '0';
    18a2:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    18a6:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    18a9:	83 f8 27             	cmp    $0x27,%eax
    18ac:	0f 87 0a 02 00 00    	ja     1abc <concreate+0x30c>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    18b2:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    18b7:	0f 85 e7 01 00 00    	jne    1aa4 <concreate+0x2f4>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    18bd:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    18c2:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    18c6:	eb b0                	jmp    1878 <concreate+0xc8>
    18c8:	90                   	nop
    18c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    18d0:	89 f0                	mov    %esi,%eax
    18d2:	ba 67 66 66 66       	mov    $0x66666667,%edx
    18d7:	f7 ea                	imul   %edx
    18d9:	89 f0                	mov    %esi,%eax
    18db:	c1 f8 1f             	sar    $0x1f,%eax
    18de:	d1 fa                	sar    %edx
    18e0:	29 c2                	sub    %eax,%edx
    18e2:	8d 04 92             	lea    (%edx,%edx,4),%eax
    18e5:	29 c6                	sub    %eax,%esi
    18e7:	83 fe 01             	cmp    $0x1,%esi
    18ea:	74 2c                	je     1918 <concreate+0x168>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    18ec:	83 ec 08             	sub    $0x8,%esp
    18ef:	68 02 02 00 00       	push   $0x202
    18f4:	53                   	push   %ebx
    18f5:	e8 28 20 00 00       	call   3922 <open>
      if(fd < 0){
    18fa:	83 c4 10             	add    $0x10,%esp
    18fd:	85 c0                	test   %eax,%eax
    18ff:	0f 88 62 01 00 00    	js     1a67 <concreate+0x2b7>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1905:	83 ec 0c             	sub    $0xc,%esp
    1908:	50                   	push   %eax
    1909:	e8 fc 1f 00 00       	call   390a <close>
    190e:	83 c4 10             	add    $0x10,%esp
    1911:	eb 16                	jmp    1929 <concreate+0x179>
    1913:	90                   	nop
    1914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    1918:	83 ec 08             	sub    $0x8,%esp
    191b:	53                   	push   %ebx
    191c:	68 8d 44 00 00       	push   $0x448d
    1921:	e8 1c 20 00 00       	call   3942 <link>
    1926:	83 c4 10             	add    $0x10,%esp
        exit();
      }
      close(fd);
    }
    if(pid == 0)
      exit();
    1929:	e8 b4 1f 00 00       	call   38e2 <exit>
    192e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1930:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1933:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1936:	53                   	push   %ebx
    1937:	68 8d 44 00 00       	push   $0x448d
    193c:	e8 01 20 00 00       	call   3942 <link>
    1941:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    1944:	e8 a1 1f 00 00       	call   38ea <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1949:	83 fe 28             	cmp    $0x28,%esi
    194c:	0f 85 88 fe ff ff    	jne    17da <concreate+0x2a>
    1952:	e9 ef fe ff ff       	jmp    1846 <concreate+0x96>
    1957:	89 f6                	mov    %esi,%esi
    1959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    1960:	83 ec 0c             	sub    $0xc,%esp
    1963:	56                   	push   %esi
    1964:	e8 a1 1f 00 00       	call   390a <close>

  if(n != 40){
    1969:	83 c4 10             	add    $0x10,%esp
    196c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1970:	0f 85 1a 01 00 00    	jne    1a90 <concreate+0x2e0>
    1976:	31 f6                	xor    %esi,%esi
    1978:	eb 6f                	jmp    19e9 <concreate+0x239>
    197a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1980:	85 ff                	test   %edi,%edi
    1982:	0f 84 9e 00 00 00    	je     1a26 <concreate+0x276>
      close(open(file, 0));
    1988:	83 ec 08             	sub    $0x8,%esp
    198b:	6a 00                	push   $0x0
    198d:	53                   	push   %ebx
    198e:	e8 8f 1f 00 00       	call   3922 <open>
    1993:	89 04 24             	mov    %eax,(%esp)
    1996:	e8 6f 1f 00 00       	call   390a <close>
      close(open(file, 0));
    199b:	58                   	pop    %eax
    199c:	5a                   	pop    %edx
    199d:	6a 00                	push   $0x0
    199f:	53                   	push   %ebx
    19a0:	e8 7d 1f 00 00       	call   3922 <open>
    19a5:	89 04 24             	mov    %eax,(%esp)
    19a8:	e8 5d 1f 00 00       	call   390a <close>
      close(open(file, 0));
    19ad:	59                   	pop    %ecx
    19ae:	58                   	pop    %eax
    19af:	6a 00                	push   $0x0
    19b1:	53                   	push   %ebx
    19b2:	e8 6b 1f 00 00       	call   3922 <open>
    19b7:	89 04 24             	mov    %eax,(%esp)
    19ba:	e8 4b 1f 00 00       	call   390a <close>
      close(open(file, 0));
    19bf:	58                   	pop    %eax
    19c0:	5a                   	pop    %edx
    19c1:	6a 00                	push   $0x0
    19c3:	53                   	push   %ebx
    19c4:	e8 59 1f 00 00       	call   3922 <open>
    19c9:	89 04 24             	mov    %eax,(%esp)
    19cc:	e8 39 1f 00 00       	call   390a <close>
    19d1:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    19d4:	85 ff                	test   %edi,%edi
    19d6:	0f 84 4d ff ff ff    	je     1929 <concreate+0x179>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19dc:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    19df:	e8 06 1f 00 00       	call   38ea <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19e4:	83 fe 28             	cmp    $0x28,%esi
    19e7:	74 67                	je     1a50 <concreate+0x2a0>
    19e9:	8d 46 30             	lea    0x30(%esi),%eax
    19ec:	88 45 ae             	mov    %al,-0x52(%ebp)
    file[1] = '0' + i;
    pid = fork();
    19ef:	e8 e6 1e 00 00       	call   38da <fork>
    if(pid < 0){
    19f4:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    19f6:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    19f8:	0f 88 7e 00 00 00    	js     1a7c <concreate+0x2cc>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    19fe:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1a03:	f7 ee                	imul   %esi
    1a05:	89 f0                	mov    %esi,%eax
    1a07:	c1 f8 1f             	sar    $0x1f,%eax
    1a0a:	29 c2                	sub    %eax,%edx
    1a0c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a0f:	89 f2                	mov    %esi,%edx
    1a11:	29 c2                	sub    %eax,%edx
    1a13:	89 d0                	mov    %edx,%eax
    1a15:	09 f8                	or     %edi,%eax
    1a17:	0f 84 6b ff ff ff    	je     1988 <concreate+0x1d8>
       ((i % 3) == 1 && pid != 0)){
    1a1d:	83 fa 01             	cmp    $0x1,%edx
    1a20:	0f 84 5a ff ff ff    	je     1980 <concreate+0x1d0>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1a26:	83 ec 0c             	sub    $0xc,%esp
    1a29:	53                   	push   %ebx
    1a2a:	e8 03 1f 00 00       	call   3932 <unlink>
      unlink(file);
    1a2f:	89 1c 24             	mov    %ebx,(%esp)
    1a32:	e8 fb 1e 00 00       	call   3932 <unlink>
      unlink(file);
    1a37:	89 1c 24             	mov    %ebx,(%esp)
    1a3a:	e8 f3 1e 00 00       	call   3932 <unlink>
      unlink(file);
    1a3f:	89 1c 24             	mov    %ebx,(%esp)
    1a42:	e8 eb 1e 00 00       	call   3932 <unlink>
    1a47:	83 c4 10             	add    $0x10,%esp
    1a4a:	eb 88                	jmp    19d4 <concreate+0x224>
    1a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a50:	83 ec 08             	sub    $0x8,%esp
    1a53:	68 e2 44 00 00       	push   $0x44e2
    1a58:	6a 01                	push   $0x1
    1a5a:	e8 01 20 00 00       	call   3a60 <printf>
}
    1a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a62:	5b                   	pop    %ebx
    1a63:	5e                   	pop    %esi
    1a64:	5f                   	pop    %edi
    1a65:	5d                   	pop    %ebp
    1a66:	c3                   	ret    
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
    1a67:	83 ec 04             	sub    $0x4,%esp
    1a6a:	53                   	push   %ebx
    1a6b:	68 90 44 00 00       	push   $0x4490
    1a70:	6a 01                	push   $0x1
    1a72:	e8 e9 1f 00 00       	call   3a60 <printf>
        exit();
    1a77:	e8 66 1e 00 00       	call   38e2 <exit>

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1a7c:	83 ec 08             	sub    $0x8,%esp
    1a7f:	68 65 4d 00 00       	push   $0x4d65
    1a84:	6a 01                	push   $0x1
    1a86:	e8 d5 1f 00 00       	call   3a60 <printf>
      exit();
    1a8b:	e8 52 1e 00 00       	call   38e2 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1a90:	83 ec 08             	sub    $0x8,%esp
    1a93:	68 2c 50 00 00       	push   $0x502c
    1a98:	6a 01                	push   $0x1
    1a9a:	e8 c1 1f 00 00       	call   3a60 <printf>
    exit();
    1a9f:	e8 3e 1e 00 00       	call   38e2 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1aa4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1aa7:	83 ec 04             	sub    $0x4,%esp
    1aaa:	50                   	push   %eax
    1aab:	68 c5 44 00 00       	push   $0x44c5
    1ab0:	6a 01                	push   $0x1
    1ab2:	e8 a9 1f 00 00       	call   3a60 <printf>
        exit();
    1ab7:	e8 26 1e 00 00       	call   38e2 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1abc:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1abf:	83 ec 04             	sub    $0x4,%esp
    1ac2:	50                   	push   %eax
    1ac3:	68 ac 44 00 00       	push   $0x44ac
    1ac8:	6a 01                	push   $0x1
    1aca:	e8 91 1f 00 00       	call   3a60 <printf>
        exit();
    1acf:	e8 0e 1e 00 00       	call   38e2 <exit>
    1ad4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ada:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001ae0 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1ae0:	55                   	push   %ebp
    1ae1:	89 e5                	mov    %esp,%ebp
    1ae3:	57                   	push   %edi
    1ae4:	56                   	push   %esi
    1ae5:	53                   	push   %ebx
    1ae6:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1ae9:	68 f0 44 00 00       	push   $0x44f0
    1aee:	6a 01                	push   $0x1
    1af0:	e8 6b 1f 00 00       	call   3a60 <printf>

  unlink("x");
    1af5:	c7 04 24 7d 47 00 00 	movl   $0x477d,(%esp)
    1afc:	e8 31 1e 00 00       	call   3932 <unlink>
  pid = fork();
    1b01:	e8 d4 1d 00 00       	call   38da <fork>
  if(pid < 0){
    1b06:	83 c4 10             	add    $0x10,%esp
    1b09:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1b0b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1b0e:	0f 88 b6 00 00 00    	js     1bca <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1b14:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b18:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1b1d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1b22:	19 ff                	sbb    %edi,%edi
    1b24:	83 e7 60             	and    $0x60,%edi
    1b27:	83 c7 01             	add    $0x1,%edi
    1b2a:	eb 1e                	jmp    1b4a <linkunlink+0x6a>
    1b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1b30:	83 fa 01             	cmp    $0x1,%edx
    1b33:	74 7b                	je     1bb0 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1b35:	83 ec 0c             	sub    $0xc,%esp
    1b38:	68 7d 47 00 00       	push   $0x477d
    1b3d:	e8 f0 1d 00 00       	call   3932 <unlink>
    1b42:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b45:	83 eb 01             	sub    $0x1,%ebx
    1b48:	74 3d                	je     1b87 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b4a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b50:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b56:	89 f8                	mov    %edi,%eax
    1b58:	f7 e6                	mul    %esi
    1b5a:	d1 ea                	shr    %edx
    1b5c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b5f:	89 fa                	mov    %edi,%edx
    1b61:	29 c2                	sub    %eax,%edx
    1b63:	75 cb                	jne    1b30 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b65:	83 ec 08             	sub    $0x8,%esp
    1b68:	68 02 02 00 00       	push   $0x202
    1b6d:	68 7d 47 00 00       	push   $0x477d
    1b72:	e8 ab 1d 00 00       	call   3922 <open>
    1b77:	89 04 24             	mov    %eax,(%esp)
    1b7a:	e8 8b 1d 00 00       	call   390a <close>
    1b7f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b82:	83 eb 01             	sub    $0x1,%ebx
    1b85:	75 c3                	jne    1b4a <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b87:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b8a:	85 c0                	test   %eax,%eax
    1b8c:	74 50                	je     1bde <linkunlink+0xfe>
    wait();
    1b8e:	e8 57 1d 00 00       	call   38ea <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    1b93:	83 ec 08             	sub    $0x8,%esp
    1b96:	68 05 45 00 00       	push   $0x4505
    1b9b:	6a 01                	push   $0x1
    1b9d:	e8 be 1e 00 00       	call   3a60 <printf>
}
    1ba2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ba5:	5b                   	pop    %ebx
    1ba6:	5e                   	pop    %esi
    1ba7:	5f                   	pop    %edi
    1ba8:	5d                   	pop    %ebp
    1ba9:	c3                   	ret    
    1baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1bb0:	83 ec 08             	sub    $0x8,%esp
    1bb3:	68 7d 47 00 00       	push   $0x477d
    1bb8:	68 01 45 00 00       	push   $0x4501
    1bbd:	e8 80 1d 00 00       	call   3942 <link>
    1bc2:	83 c4 10             	add    $0x10,%esp
    1bc5:	e9 7b ff ff ff       	jmp    1b45 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1bca:	83 ec 08             	sub    $0x8,%esp
    1bcd:	68 65 4d 00 00       	push   $0x4d65
    1bd2:	6a 01                	push   $0x1
    1bd4:	e8 87 1e 00 00       	call   3a60 <printf>
    exit();
    1bd9:	e8 04 1d 00 00       	call   38e2 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    1bde:	e8 ff 1c 00 00       	call   38e2 <exit>
    1be3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bf0 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1bf0:	55                   	push   %ebp
    1bf1:	89 e5                	mov    %esp,%ebp
    1bf3:	56                   	push   %esi
    1bf4:	53                   	push   %ebx
    1bf5:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1bf8:	68 14 45 00 00       	push   $0x4514
    1bfd:	6a 01                	push   $0x1
    1bff:	e8 5c 1e 00 00       	call   3a60 <printf>
  unlink("bd");
    1c04:	c7 04 24 21 45 00 00 	movl   $0x4521,(%esp)
    1c0b:	e8 22 1d 00 00       	call   3932 <unlink>

  fd = open("bd", O_CREATE);
    1c10:	58                   	pop    %eax
    1c11:	5a                   	pop    %edx
    1c12:	68 00 02 00 00       	push   $0x200
    1c17:	68 21 45 00 00       	push   $0x4521
    1c1c:	e8 01 1d 00 00       	call   3922 <open>
  if(fd < 0){
    1c21:	83 c4 10             	add    $0x10,%esp
    1c24:	85 c0                	test   %eax,%eax
    1c26:	0f 88 e6 00 00 00    	js     1d12 <bigdir+0x122>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c2c:	83 ec 0c             	sub    $0xc,%esp
    1c2f:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1c32:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c34:	50                   	push   %eax
    1c35:	e8 d0 1c 00 00       	call   390a <close>
    1c3a:	83 c4 10             	add    $0x10,%esp
    1c3d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c40:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c42:	83 ec 08             	sub    $0x8,%esp
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c45:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c49:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c4c:	56                   	push   %esi
    1c4d:	68 21 45 00 00       	push   $0x4521
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c52:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c55:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c59:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c5c:	89 d8                	mov    %ebx,%eax
    1c5e:	83 e0 3f             	and    $0x3f,%eax
    1c61:	83 c0 30             	add    $0x30,%eax
    1c64:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c67:	e8 d6 1c 00 00       	call   3942 <link>
    1c6c:	83 c4 10             	add    $0x10,%esp
    1c6f:	85 c0                	test   %eax,%eax
    1c71:	75 77                	jne    1cea <bigdir+0xfa>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c73:	83 c3 01             	add    $0x1,%ebx
    1c76:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c7c:	75 c2                	jne    1c40 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c7e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1c81:	66 31 db             	xor    %bx,%bx
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c84:	68 21 45 00 00       	push   $0x4521
    1c89:	e8 a4 1c 00 00       	call   3932 <unlink>
    1c8e:	83 c4 10             	add    $0x10,%esp
    1c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c98:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c9a:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c9d:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1ca1:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1ca4:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1ca5:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1ca9:	83 c0 30             	add    $0x30,%eax
    1cac:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1caf:	89 d8                	mov    %ebx,%eax
    1cb1:	83 e0 3f             	and    $0x3f,%eax
    1cb4:	83 c0 30             	add    $0x30,%eax
    1cb7:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1cba:	e8 73 1c 00 00       	call   3932 <unlink>
    1cbf:	83 c4 10             	add    $0x10,%esp
    1cc2:	85 c0                	test   %eax,%eax
    1cc4:	75 38                	jne    1cfe <bigdir+0x10e>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1cc6:	83 c3 01             	add    $0x1,%ebx
    1cc9:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1ccf:	75 c7                	jne    1c98 <bigdir+0xa8>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1cd1:	83 ec 08             	sub    $0x8,%esp
    1cd4:	68 63 45 00 00       	push   $0x4563
    1cd9:	6a 01                	push   $0x1
    1cdb:	e8 80 1d 00 00       	call   3a60 <printf>
    1ce0:	83 c4 10             	add    $0x10,%esp
}
    1ce3:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1ce6:	5b                   	pop    %ebx
    1ce7:	5e                   	pop    %esi
    1ce8:	5d                   	pop    %ebp
    1ce9:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1cea:	83 ec 08             	sub    $0x8,%esp
    1ced:	68 3a 45 00 00       	push   $0x453a
    1cf2:	6a 01                	push   $0x1
    1cf4:	e8 67 1d 00 00       	call   3a60 <printf>
      exit();
    1cf9:	e8 e4 1b 00 00       	call   38e2 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1cfe:	83 ec 08             	sub    $0x8,%esp
    1d01:	68 4e 45 00 00       	push   $0x454e
    1d06:	6a 01                	push   $0x1
    1d08:	e8 53 1d 00 00       	call   3a60 <printf>
      exit();
    1d0d:	e8 d0 1b 00 00       	call   38e2 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1d12:	83 ec 08             	sub    $0x8,%esp
    1d15:	68 24 45 00 00       	push   $0x4524
    1d1a:	6a 01                	push   $0x1
    1d1c:	e8 3f 1d 00 00       	call   3a60 <printf>
    exit();
    1d21:	e8 bc 1b 00 00       	call   38e2 <exit>
    1d26:	8d 76 00             	lea    0x0(%esi),%esi
    1d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001d30 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1d30:	55                   	push   %ebp
    1d31:	89 e5                	mov    %esp,%ebp
    1d33:	53                   	push   %ebx
    1d34:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1d37:	68 6e 45 00 00       	push   $0x456e
    1d3c:	6a 01                	push   $0x1
    1d3e:	e8 1d 1d 00 00       	call   3a60 <printf>

  unlink("ff");
    1d43:	c7 04 24 f7 45 00 00 	movl   $0x45f7,(%esp)
    1d4a:	e8 e3 1b 00 00       	call   3932 <unlink>
  if(mkdir("dd") != 0){
    1d4f:	c7 04 24 94 46 00 00 	movl   $0x4694,(%esp)
    1d56:	e8 ef 1b 00 00       	call   394a <mkdir>
    1d5b:	83 c4 10             	add    $0x10,%esp
    1d5e:	85 c0                	test   %eax,%eax
    1d60:	0f 85 b3 05 00 00    	jne    2319 <subdir+0x5e9>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d66:	83 ec 08             	sub    $0x8,%esp
    1d69:	68 02 02 00 00       	push   $0x202
    1d6e:	68 cd 45 00 00       	push   $0x45cd
    1d73:	e8 aa 1b 00 00       	call   3922 <open>
  if(fd < 0){
    1d78:	83 c4 10             	add    $0x10,%esp
    1d7b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d7d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d7f:	0f 88 81 05 00 00    	js     2306 <subdir+0x5d6>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1d85:	83 ec 04             	sub    $0x4,%esp
    1d88:	6a 02                	push   $0x2
    1d8a:	68 f7 45 00 00       	push   $0x45f7
    1d8f:	50                   	push   %eax
    1d90:	e8 6d 1b 00 00       	call   3902 <write>
  close(fd);
    1d95:	89 1c 24             	mov    %ebx,(%esp)
    1d98:	e8 6d 1b 00 00       	call   390a <close>

  if(unlink("dd") >= 0){
    1d9d:	c7 04 24 94 46 00 00 	movl   $0x4694,(%esp)
    1da4:	e8 89 1b 00 00       	call   3932 <unlink>
    1da9:	83 c4 10             	add    $0x10,%esp
    1dac:	85 c0                	test   %eax,%eax
    1dae:	0f 89 3f 05 00 00    	jns    22f3 <subdir+0x5c3>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1db4:	83 ec 0c             	sub    $0xc,%esp
    1db7:	68 a8 45 00 00       	push   $0x45a8
    1dbc:	e8 89 1b 00 00       	call   394a <mkdir>
    1dc1:	83 c4 10             	add    $0x10,%esp
    1dc4:	85 c0                	test   %eax,%eax
    1dc6:	0f 85 14 05 00 00    	jne    22e0 <subdir+0x5b0>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dcc:	83 ec 08             	sub    $0x8,%esp
    1dcf:	68 02 02 00 00       	push   $0x202
    1dd4:	68 ca 45 00 00       	push   $0x45ca
    1dd9:	e8 44 1b 00 00       	call   3922 <open>
  if(fd < 0){
    1dde:	83 c4 10             	add    $0x10,%esp
    1de1:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1de3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1de5:	0f 88 24 04 00 00    	js     220f <subdir+0x4df>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1deb:	83 ec 04             	sub    $0x4,%esp
    1dee:	6a 02                	push   $0x2
    1df0:	68 eb 45 00 00       	push   $0x45eb
    1df5:	50                   	push   %eax
    1df6:	e8 07 1b 00 00       	call   3902 <write>
  close(fd);
    1dfb:	89 1c 24             	mov    %ebx,(%esp)
    1dfe:	e8 07 1b 00 00       	call   390a <close>

  fd = open("dd/dd/../ff", 0);
    1e03:	58                   	pop    %eax
    1e04:	5a                   	pop    %edx
    1e05:	6a 00                	push   $0x0
    1e07:	68 ee 45 00 00       	push   $0x45ee
    1e0c:	e8 11 1b 00 00       	call   3922 <open>
  if(fd < 0){
    1e11:	83 c4 10             	add    $0x10,%esp
    1e14:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1e16:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e18:	0f 88 de 03 00 00    	js     21fc <subdir+0x4cc>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1e1e:	83 ec 04             	sub    $0x4,%esp
    1e21:	68 00 20 00 00       	push   $0x2000
    1e26:	68 40 87 00 00       	push   $0x8740
    1e2b:	50                   	push   %eax
    1e2c:	e8 c9 1a 00 00       	call   38fa <read>
  if(cc != 2 || buf[0] != 'f'){
    1e31:	83 c4 10             	add    $0x10,%esp
    1e34:	83 f8 02             	cmp    $0x2,%eax
    1e37:	0f 85 3a 03 00 00    	jne    2177 <subdir+0x447>
    1e3d:	80 3d 40 87 00 00 66 	cmpb   $0x66,0x8740
    1e44:	0f 85 2d 03 00 00    	jne    2177 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1e4a:	83 ec 0c             	sub    $0xc,%esp
    1e4d:	53                   	push   %ebx
    1e4e:	e8 b7 1a 00 00       	call   390a <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e53:	5b                   	pop    %ebx
    1e54:	58                   	pop    %eax
    1e55:	68 2e 46 00 00       	push   $0x462e
    1e5a:	68 ca 45 00 00       	push   $0x45ca
    1e5f:	e8 de 1a 00 00       	call   3942 <link>
    1e64:	83 c4 10             	add    $0x10,%esp
    1e67:	85 c0                	test   %eax,%eax
    1e69:	0f 85 c6 03 00 00    	jne    2235 <subdir+0x505>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1e6f:	83 ec 0c             	sub    $0xc,%esp
    1e72:	68 ca 45 00 00       	push   $0x45ca
    1e77:	e8 b6 1a 00 00       	call   3932 <unlink>
    1e7c:	83 c4 10             	add    $0x10,%esp
    1e7f:	85 c0                	test   %eax,%eax
    1e81:	0f 85 16 03 00 00    	jne    219d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e87:	83 ec 08             	sub    $0x8,%esp
    1e8a:	6a 00                	push   $0x0
    1e8c:	68 ca 45 00 00       	push   $0x45ca
    1e91:	e8 8c 1a 00 00       	call   3922 <open>
    1e96:	83 c4 10             	add    $0x10,%esp
    1e99:	85 c0                	test   %eax,%eax
    1e9b:	0f 89 2c 04 00 00    	jns    22cd <subdir+0x59d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1ea1:	83 ec 0c             	sub    $0xc,%esp
    1ea4:	68 94 46 00 00       	push   $0x4694
    1ea9:	e8 a4 1a 00 00       	call   3952 <chdir>
    1eae:	83 c4 10             	add    $0x10,%esp
    1eb1:	85 c0                	test   %eax,%eax
    1eb3:	0f 85 01 04 00 00    	jne    22ba <subdir+0x58a>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1eb9:	83 ec 0c             	sub    $0xc,%esp
    1ebc:	68 62 46 00 00       	push   $0x4662
    1ec1:	e8 8c 1a 00 00       	call   3952 <chdir>
    1ec6:	83 c4 10             	add    $0x10,%esp
    1ec9:	85 c0                	test   %eax,%eax
    1ecb:	0f 85 b9 02 00 00    	jne    218a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1ed1:	83 ec 0c             	sub    $0xc,%esp
    1ed4:	68 88 46 00 00       	push   $0x4688
    1ed9:	e8 74 1a 00 00       	call   3952 <chdir>
    1ede:	83 c4 10             	add    $0x10,%esp
    1ee1:	85 c0                	test   %eax,%eax
    1ee3:	0f 85 a1 02 00 00    	jne    218a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1ee9:	83 ec 0c             	sub    $0xc,%esp
    1eec:	68 97 46 00 00       	push   $0x4697
    1ef1:	e8 5c 1a 00 00       	call   3952 <chdir>
    1ef6:	83 c4 10             	add    $0x10,%esp
    1ef9:	85 c0                	test   %eax,%eax
    1efb:	0f 85 21 03 00 00    	jne    2222 <subdir+0x4f2>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1f01:	83 ec 08             	sub    $0x8,%esp
    1f04:	6a 00                	push   $0x0
    1f06:	68 2e 46 00 00       	push   $0x462e
    1f0b:	e8 12 1a 00 00       	call   3922 <open>
  if(fd < 0){
    1f10:	83 c4 10             	add    $0x10,%esp
    1f13:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1f15:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f17:	0f 88 e0 04 00 00    	js     23fd <subdir+0x6cd>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1f1d:	83 ec 04             	sub    $0x4,%esp
    1f20:	68 00 20 00 00       	push   $0x2000
    1f25:	68 40 87 00 00       	push   $0x8740
    1f2a:	50                   	push   %eax
    1f2b:	e8 ca 19 00 00       	call   38fa <read>
    1f30:	83 c4 10             	add    $0x10,%esp
    1f33:	83 f8 02             	cmp    $0x2,%eax
    1f36:	0f 85 ae 04 00 00    	jne    23ea <subdir+0x6ba>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1f3c:	83 ec 0c             	sub    $0xc,%esp
    1f3f:	53                   	push   %ebx
    1f40:	e8 c5 19 00 00       	call   390a <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f45:	59                   	pop    %ecx
    1f46:	5b                   	pop    %ebx
    1f47:	6a 00                	push   $0x0
    1f49:	68 ca 45 00 00       	push   $0x45ca
    1f4e:	e8 cf 19 00 00       	call   3922 <open>
    1f53:	83 c4 10             	add    $0x10,%esp
    1f56:	85 c0                	test   %eax,%eax
    1f58:	0f 89 65 02 00 00    	jns    21c3 <subdir+0x493>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f5e:	83 ec 08             	sub    $0x8,%esp
    1f61:	68 02 02 00 00       	push   $0x202
    1f66:	68 e2 46 00 00       	push   $0x46e2
    1f6b:	e8 b2 19 00 00       	call   3922 <open>
    1f70:	83 c4 10             	add    $0x10,%esp
    1f73:	85 c0                	test   %eax,%eax
    1f75:	0f 89 35 02 00 00    	jns    21b0 <subdir+0x480>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f7b:	83 ec 08             	sub    $0x8,%esp
    1f7e:	68 02 02 00 00       	push   $0x202
    1f83:	68 07 47 00 00       	push   $0x4707
    1f88:	e8 95 19 00 00       	call   3922 <open>
    1f8d:	83 c4 10             	add    $0x10,%esp
    1f90:	85 c0                	test   %eax,%eax
    1f92:	0f 89 0f 03 00 00    	jns    22a7 <subdir+0x577>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1f98:	83 ec 08             	sub    $0x8,%esp
    1f9b:	68 00 02 00 00       	push   $0x200
    1fa0:	68 94 46 00 00       	push   $0x4694
    1fa5:	e8 78 19 00 00       	call   3922 <open>
    1faa:	83 c4 10             	add    $0x10,%esp
    1fad:	85 c0                	test   %eax,%eax
    1faf:	0f 89 df 02 00 00    	jns    2294 <subdir+0x564>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1fb5:	83 ec 08             	sub    $0x8,%esp
    1fb8:	6a 02                	push   $0x2
    1fba:	68 94 46 00 00       	push   $0x4694
    1fbf:	e8 5e 19 00 00       	call   3922 <open>
    1fc4:	83 c4 10             	add    $0x10,%esp
    1fc7:	85 c0                	test   %eax,%eax
    1fc9:	0f 89 b2 02 00 00    	jns    2281 <subdir+0x551>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1fcf:	83 ec 08             	sub    $0x8,%esp
    1fd2:	6a 01                	push   $0x1
    1fd4:	68 94 46 00 00       	push   $0x4694
    1fd9:	e8 44 19 00 00       	call   3922 <open>
    1fde:	83 c4 10             	add    $0x10,%esp
    1fe1:	85 c0                	test   %eax,%eax
    1fe3:	0f 89 85 02 00 00    	jns    226e <subdir+0x53e>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fe9:	83 ec 08             	sub    $0x8,%esp
    1fec:	68 76 47 00 00       	push   $0x4776
    1ff1:	68 e2 46 00 00       	push   $0x46e2
    1ff6:	e8 47 19 00 00       	call   3942 <link>
    1ffb:	83 c4 10             	add    $0x10,%esp
    1ffe:	85 c0                	test   %eax,%eax
    2000:	0f 84 55 02 00 00    	je     225b <subdir+0x52b>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2006:	83 ec 08             	sub    $0x8,%esp
    2009:	68 76 47 00 00       	push   $0x4776
    200e:	68 07 47 00 00       	push   $0x4707
    2013:	e8 2a 19 00 00       	call   3942 <link>
    2018:	83 c4 10             	add    $0x10,%esp
    201b:	85 c0                	test   %eax,%eax
    201d:	0f 84 25 02 00 00    	je     2248 <subdir+0x518>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2023:	83 ec 08             	sub    $0x8,%esp
    2026:	68 2e 46 00 00       	push   $0x462e
    202b:	68 cd 45 00 00       	push   $0x45cd
    2030:	e8 0d 19 00 00       	call   3942 <link>
    2035:	83 c4 10             	add    $0x10,%esp
    2038:	85 c0                	test   %eax,%eax
    203a:	0f 84 a9 01 00 00    	je     21e9 <subdir+0x4b9>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    2040:	83 ec 0c             	sub    $0xc,%esp
    2043:	68 e2 46 00 00       	push   $0x46e2
    2048:	e8 fd 18 00 00       	call   394a <mkdir>
    204d:	83 c4 10             	add    $0x10,%esp
    2050:	85 c0                	test   %eax,%eax
    2052:	0f 84 7e 01 00 00    	je     21d6 <subdir+0x4a6>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    2058:	83 ec 0c             	sub    $0xc,%esp
    205b:	68 07 47 00 00       	push   $0x4707
    2060:	e8 e5 18 00 00       	call   394a <mkdir>
    2065:	83 c4 10             	add    $0x10,%esp
    2068:	85 c0                	test   %eax,%eax
    206a:	0f 84 67 03 00 00    	je     23d7 <subdir+0x6a7>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    2070:	83 ec 0c             	sub    $0xc,%esp
    2073:	68 2e 46 00 00       	push   $0x462e
    2078:	e8 cd 18 00 00       	call   394a <mkdir>
    207d:	83 c4 10             	add    $0x10,%esp
    2080:	85 c0                	test   %eax,%eax
    2082:	0f 84 3c 03 00 00    	je     23c4 <subdir+0x694>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    2088:	83 ec 0c             	sub    $0xc,%esp
    208b:	68 07 47 00 00       	push   $0x4707
    2090:	e8 9d 18 00 00       	call   3932 <unlink>
    2095:	83 c4 10             	add    $0x10,%esp
    2098:	85 c0                	test   %eax,%eax
    209a:	0f 84 11 03 00 00    	je     23b1 <subdir+0x681>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    20a0:	83 ec 0c             	sub    $0xc,%esp
    20a3:	68 e2 46 00 00       	push   $0x46e2
    20a8:	e8 85 18 00 00       	call   3932 <unlink>
    20ad:	83 c4 10             	add    $0x10,%esp
    20b0:	85 c0                	test   %eax,%eax
    20b2:	0f 84 e6 02 00 00    	je     239e <subdir+0x66e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    20b8:	83 ec 0c             	sub    $0xc,%esp
    20bb:	68 cd 45 00 00       	push   $0x45cd
    20c0:	e8 8d 18 00 00       	call   3952 <chdir>
    20c5:	83 c4 10             	add    $0x10,%esp
    20c8:	85 c0                	test   %eax,%eax
    20ca:	0f 84 bb 02 00 00    	je     238b <subdir+0x65b>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    20d0:	83 ec 0c             	sub    $0xc,%esp
    20d3:	68 79 47 00 00       	push   $0x4779
    20d8:	e8 75 18 00 00       	call   3952 <chdir>
    20dd:	83 c4 10             	add    $0x10,%esp
    20e0:	85 c0                	test   %eax,%eax
    20e2:	0f 84 90 02 00 00    	je     2378 <subdir+0x648>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    20e8:	83 ec 0c             	sub    $0xc,%esp
    20eb:	68 2e 46 00 00       	push   $0x462e
    20f0:	e8 3d 18 00 00       	call   3932 <unlink>
    20f5:	83 c4 10             	add    $0x10,%esp
    20f8:	85 c0                	test   %eax,%eax
    20fa:	0f 85 9d 00 00 00    	jne    219d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    2100:	83 ec 0c             	sub    $0xc,%esp
    2103:	68 cd 45 00 00       	push   $0x45cd
    2108:	e8 25 18 00 00       	call   3932 <unlink>
    210d:	83 c4 10             	add    $0x10,%esp
    2110:	85 c0                	test   %eax,%eax
    2112:	0f 85 4d 02 00 00    	jne    2365 <subdir+0x635>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    2118:	83 ec 0c             	sub    $0xc,%esp
    211b:	68 94 46 00 00       	push   $0x4694
    2120:	e8 0d 18 00 00       	call   3932 <unlink>
    2125:	83 c4 10             	add    $0x10,%esp
    2128:	85 c0                	test   %eax,%eax
    212a:	0f 84 22 02 00 00    	je     2352 <subdir+0x622>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    2130:	83 ec 0c             	sub    $0xc,%esp
    2133:	68 a9 45 00 00       	push   $0x45a9
    2138:	e8 f5 17 00 00       	call   3932 <unlink>
    213d:	83 c4 10             	add    $0x10,%esp
    2140:	85 c0                	test   %eax,%eax
    2142:	0f 88 f7 01 00 00    	js     233f <subdir+0x60f>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    2148:	83 ec 0c             	sub    $0xc,%esp
    214b:	68 94 46 00 00       	push   $0x4694
    2150:	e8 dd 17 00 00       	call   3932 <unlink>
    2155:	83 c4 10             	add    $0x10,%esp
    2158:	85 c0                	test   %eax,%eax
    215a:	0f 88 cc 01 00 00    	js     232c <subdir+0x5fc>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    2160:	83 ec 08             	sub    $0x8,%esp
    2163:	68 76 48 00 00       	push   $0x4876
    2168:	6a 01                	push   $0x1
    216a:	e8 f1 18 00 00       	call   3a60 <printf>
    216f:	83 c4 10             	add    $0x10,%esp
}
    2172:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2175:	c9                   	leave  
    2176:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2177:	50                   	push   %eax
    2178:	50                   	push   %eax
    2179:	68 13 46 00 00       	push   $0x4613
    217e:	6a 01                	push   $0x1
    2180:	e8 db 18 00 00       	call   3a60 <printf>
    exit();
    2185:	e8 58 17 00 00       	call   38e2 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    218a:	50                   	push   %eax
    218b:	50                   	push   %eax
    218c:	68 6e 46 00 00       	push   $0x466e
    2191:	6a 01                	push   $0x1
    2193:	e8 c8 18 00 00       	call   3a60 <printf>
    exit();
    2198:	e8 45 17 00 00       	call   38e2 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    219d:	52                   	push   %edx
    219e:	52                   	push   %edx
    219f:	68 39 46 00 00       	push   $0x4639
    21a4:	6a 01                	push   $0x1
    21a6:	e8 b5 18 00 00       	call   3a60 <printf>
    exit();
    21ab:	e8 32 17 00 00       	call   38e2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    21b0:	50                   	push   %eax
    21b1:	50                   	push   %eax
    21b2:	68 eb 46 00 00       	push   $0x46eb
    21b7:	6a 01                	push   $0x1
    21b9:	e8 a2 18 00 00       	call   3a60 <printf>
    exit();
    21be:	e8 1f 17 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    21c3:	52                   	push   %edx
    21c4:	52                   	push   %edx
    21c5:	68 d0 50 00 00       	push   $0x50d0
    21ca:	6a 01                	push   $0x1
    21cc:	e8 8f 18 00 00       	call   3a60 <printf>
    exit();
    21d1:	e8 0c 17 00 00       	call   38e2 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    21d6:	52                   	push   %edx
    21d7:	52                   	push   %edx
    21d8:	68 7f 47 00 00       	push   $0x477f
    21dd:	6a 01                	push   $0x1
    21df:	e8 7c 18 00 00       	call   3a60 <printf>
    exit();
    21e4:	e8 f9 16 00 00       	call   38e2 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21e9:	51                   	push   %ecx
    21ea:	51                   	push   %ecx
    21eb:	68 40 51 00 00       	push   $0x5140
    21f0:	6a 01                	push   $0x1
    21f2:	e8 69 18 00 00       	call   3a60 <printf>
    exit();
    21f7:	e8 e6 16 00 00       	call   38e2 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    21fc:	50                   	push   %eax
    21fd:	50                   	push   %eax
    21fe:	68 fa 45 00 00       	push   $0x45fa
    2203:	6a 01                	push   $0x1
    2205:	e8 56 18 00 00       	call   3a60 <printf>
    exit();
    220a:	e8 d3 16 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    220f:	51                   	push   %ecx
    2210:	51                   	push   %ecx
    2211:	68 d3 45 00 00       	push   $0x45d3
    2216:	6a 01                	push   $0x1
    2218:	e8 43 18 00 00       	call   3a60 <printf>
    exit();
    221d:	e8 c0 16 00 00       	call   38e2 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    2222:	50                   	push   %eax
    2223:	50                   	push   %eax
    2224:	68 9c 46 00 00       	push   $0x469c
    2229:	6a 01                	push   $0x1
    222b:	e8 30 18 00 00       	call   3a60 <printf>
    exit();
    2230:	e8 ad 16 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2235:	51                   	push   %ecx
    2236:	51                   	push   %ecx
    2237:	68 88 50 00 00       	push   $0x5088
    223c:	6a 01                	push   $0x1
    223e:	e8 1d 18 00 00       	call   3a60 <printf>
    exit();
    2243:	e8 9a 16 00 00       	call   38e2 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2248:	53                   	push   %ebx
    2249:	53                   	push   %ebx
    224a:	68 1c 51 00 00       	push   $0x511c
    224f:	6a 01                	push   $0x1
    2251:	e8 0a 18 00 00       	call   3a60 <printf>
    exit();
    2256:	e8 87 16 00 00       	call   38e2 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    225b:	50                   	push   %eax
    225c:	50                   	push   %eax
    225d:	68 f8 50 00 00       	push   $0x50f8
    2262:	6a 01                	push   $0x1
    2264:	e8 f7 17 00 00       	call   3a60 <printf>
    exit();
    2269:	e8 74 16 00 00       	call   38e2 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    226e:	50                   	push   %eax
    226f:	50                   	push   %eax
    2270:	68 5b 47 00 00       	push   $0x475b
    2275:	6a 01                	push   $0x1
    2277:	e8 e4 17 00 00       	call   3a60 <printf>
    exit();
    227c:	e8 61 16 00 00       	call   38e2 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2281:	50                   	push   %eax
    2282:	50                   	push   %eax
    2283:	68 42 47 00 00       	push   $0x4742
    2288:	6a 01                	push   $0x1
    228a:	e8 d1 17 00 00       	call   3a60 <printf>
    exit();
    228f:	e8 4e 16 00 00       	call   38e2 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    2294:	50                   	push   %eax
    2295:	50                   	push   %eax
    2296:	68 2c 47 00 00       	push   $0x472c
    229b:	6a 01                	push   $0x1
    229d:	e8 be 17 00 00       	call   3a60 <printf>
    exit();
    22a2:	e8 3b 16 00 00       	call   38e2 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    22a7:	50                   	push   %eax
    22a8:	50                   	push   %eax
    22a9:	68 10 47 00 00       	push   $0x4710
    22ae:	6a 01                	push   $0x1
    22b0:	e8 ab 17 00 00       	call   3a60 <printf>
    exit();
    22b5:	e8 28 16 00 00       	call   38e2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    22ba:	50                   	push   %eax
    22bb:	50                   	push   %eax
    22bc:	68 51 46 00 00       	push   $0x4651
    22c1:	6a 01                	push   $0x1
    22c3:	e8 98 17 00 00       	call   3a60 <printf>
    exit();
    22c8:	e8 15 16 00 00       	call   38e2 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    22cd:	50                   	push   %eax
    22ce:	50                   	push   %eax
    22cf:	68 ac 50 00 00       	push   $0x50ac
    22d4:	6a 01                	push   $0x1
    22d6:	e8 85 17 00 00       	call   3a60 <printf>
    exit();
    22db:	e8 02 16 00 00       	call   38e2 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    22e0:	53                   	push   %ebx
    22e1:	53                   	push   %ebx
    22e2:	68 af 45 00 00       	push   $0x45af
    22e7:	6a 01                	push   $0x1
    22e9:	e8 72 17 00 00       	call   3a60 <printf>
    exit();
    22ee:	e8 ef 15 00 00       	call   38e2 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22f3:	50                   	push   %eax
    22f4:	50                   	push   %eax
    22f5:	68 60 50 00 00       	push   $0x5060
    22fa:	6a 01                	push   $0x1
    22fc:	e8 5f 17 00 00       	call   3a60 <printf>
    exit();
    2301:	e8 dc 15 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    2306:	50                   	push   %eax
    2307:	50                   	push   %eax
    2308:	68 93 45 00 00       	push   $0x4593
    230d:	6a 01                	push   $0x1
    230f:	e8 4c 17 00 00       	call   3a60 <printf>
    exit();
    2314:	e8 c9 15 00 00       	call   38e2 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    2319:	50                   	push   %eax
    231a:	50                   	push   %eax
    231b:	68 7b 45 00 00       	push   $0x457b
    2320:	6a 01                	push   $0x1
    2322:	e8 39 17 00 00       	call   3a60 <printf>
    exit();
    2327:	e8 b6 15 00 00       	call   38e2 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    232c:	50                   	push   %eax
    232d:	50                   	push   %eax
    232e:	68 64 48 00 00       	push   $0x4864
    2333:	6a 01                	push   $0x1
    2335:	e8 26 17 00 00       	call   3a60 <printf>
    exit();
    233a:	e8 a3 15 00 00       	call   38e2 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    233f:	52                   	push   %edx
    2340:	52                   	push   %edx
    2341:	68 4f 48 00 00       	push   $0x484f
    2346:	6a 01                	push   $0x1
    2348:	e8 13 17 00 00       	call   3a60 <printf>
    exit();
    234d:	e8 90 15 00 00       	call   38e2 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2352:	51                   	push   %ecx
    2353:	51                   	push   %ecx
    2354:	68 64 51 00 00       	push   $0x5164
    2359:	6a 01                	push   $0x1
    235b:	e8 00 17 00 00       	call   3a60 <printf>
    exit();
    2360:	e8 7d 15 00 00       	call   38e2 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    2365:	53                   	push   %ebx
    2366:	53                   	push   %ebx
    2367:	68 3a 48 00 00       	push   $0x483a
    236c:	6a 01                	push   $0x1
    236e:	e8 ed 16 00 00       	call   3a60 <printf>
    exit();
    2373:	e8 6a 15 00 00       	call   38e2 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    2378:	50                   	push   %eax
    2379:	50                   	push   %eax
    237a:	68 22 48 00 00       	push   $0x4822
    237f:	6a 01                	push   $0x1
    2381:	e8 da 16 00 00       	call   3a60 <printf>
    exit();
    2386:	e8 57 15 00 00       	call   38e2 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    238b:	50                   	push   %eax
    238c:	50                   	push   %eax
    238d:	68 0a 48 00 00       	push   $0x480a
    2392:	6a 01                	push   $0x1
    2394:	e8 c7 16 00 00       	call   3a60 <printf>
    exit();
    2399:	e8 44 15 00 00       	call   38e2 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    239e:	50                   	push   %eax
    239f:	50                   	push   %eax
    23a0:	68 ee 47 00 00       	push   $0x47ee
    23a5:	6a 01                	push   $0x1
    23a7:	e8 b4 16 00 00       	call   3a60 <printf>
    exit();
    23ac:	e8 31 15 00 00       	call   38e2 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    23b1:	50                   	push   %eax
    23b2:	50                   	push   %eax
    23b3:	68 d2 47 00 00       	push   $0x47d2
    23b8:	6a 01                	push   $0x1
    23ba:	e8 a1 16 00 00       	call   3a60 <printf>
    exit();
    23bf:	e8 1e 15 00 00       	call   38e2 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    23c4:	50                   	push   %eax
    23c5:	50                   	push   %eax
    23c6:	68 b5 47 00 00       	push   $0x47b5
    23cb:	6a 01                	push   $0x1
    23cd:	e8 8e 16 00 00       	call   3a60 <printf>
    exit();
    23d2:	e8 0b 15 00 00       	call   38e2 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    23d7:	50                   	push   %eax
    23d8:	50                   	push   %eax
    23d9:	68 9a 47 00 00       	push   $0x479a
    23de:	6a 01                	push   $0x1
    23e0:	e8 7b 16 00 00       	call   3a60 <printf>
    exit();
    23e5:	e8 f8 14 00 00       	call   38e2 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    23ea:	50                   	push   %eax
    23eb:	50                   	push   %eax
    23ec:	68 c7 46 00 00       	push   $0x46c7
    23f1:	6a 01                	push   $0x1
    23f3:	e8 68 16 00 00       	call   3a60 <printf>
    exit();
    23f8:	e8 e5 14 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    23fd:	50                   	push   %eax
    23fe:	50                   	push   %eax
    23ff:	68 af 46 00 00       	push   $0x46af
    2404:	6a 01                	push   $0x1
    2406:	e8 55 16 00 00       	call   3a60 <printf>
    exit();
    240b:	e8 d2 14 00 00       	call   38e2 <exit>

00002410 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    2410:	55                   	push   %ebp
    2411:	89 e5                	mov    %esp,%ebp
    2413:	56                   	push   %esi
    2414:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2415:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    241a:	83 ec 08             	sub    $0x8,%esp
    241d:	68 81 48 00 00       	push   $0x4881
    2422:	6a 01                	push   $0x1
    2424:	e8 37 16 00 00       	call   3a60 <printf>

  unlink("bigwrite");
    2429:	c7 04 24 90 48 00 00 	movl   $0x4890,(%esp)
    2430:	e8 fd 14 00 00       	call   3932 <unlink>
    2435:	83 c4 10             	add    $0x10,%esp
    2438:	90                   	nop
    2439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2440:	83 ec 08             	sub    $0x8,%esp
    2443:	68 02 02 00 00       	push   $0x202
    2448:	68 90 48 00 00       	push   $0x4890
    244d:	e8 d0 14 00 00       	call   3922 <open>
    if(fd < 0){
    2452:	83 c4 10             	add    $0x10,%esp
    2455:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2457:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2459:	78 7e                	js     24d9 <bigwrite+0xc9>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    245b:	83 ec 04             	sub    $0x4,%esp
    245e:	53                   	push   %ebx
    245f:	68 40 87 00 00       	push   $0x8740
    2464:	50                   	push   %eax
    2465:	e8 98 14 00 00       	call   3902 <write>
      if(cc != sz){
    246a:	83 c4 10             	add    $0x10,%esp
    246d:	39 d8                	cmp    %ebx,%eax
    246f:	75 55                	jne    24c6 <bigwrite+0xb6>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2471:	83 ec 04             	sub    $0x4,%esp
    2474:	53                   	push   %ebx
    2475:	68 40 87 00 00       	push   $0x8740
    247a:	56                   	push   %esi
    247b:	e8 82 14 00 00       	call   3902 <write>
      if(cc != sz){
    2480:	83 c4 10             	add    $0x10,%esp
    2483:	39 c3                	cmp    %eax,%ebx
    2485:	75 3f                	jne    24c6 <bigwrite+0xb6>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2487:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    248a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2490:	56                   	push   %esi
    2491:	e8 74 14 00 00       	call   390a <close>
    unlink("bigwrite");
    2496:	c7 04 24 90 48 00 00 	movl   $0x4890,(%esp)
    249d:	e8 90 14 00 00       	call   3932 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    24a2:	83 c4 10             	add    $0x10,%esp
    24a5:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    24ab:	75 93                	jne    2440 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    24ad:	83 ec 08             	sub    $0x8,%esp
    24b0:	68 c3 48 00 00       	push   $0x48c3
    24b5:	6a 01                	push   $0x1
    24b7:	e8 a4 15 00 00       	call   3a60 <printf>
    24bc:	83 c4 10             	add    $0x10,%esp
}
    24bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
    24c2:	5b                   	pop    %ebx
    24c3:	5e                   	pop    %esi
    24c4:	5d                   	pop    %ebp
    24c5:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    24c6:	50                   	push   %eax
    24c7:	53                   	push   %ebx
    24c8:	68 b1 48 00 00       	push   $0x48b1
    24cd:	6a 01                	push   $0x1
    24cf:	e8 8c 15 00 00       	call   3a60 <printf>
        exit();
    24d4:	e8 09 14 00 00       	call   38e2 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    24d9:	83 ec 08             	sub    $0x8,%esp
    24dc:	68 99 48 00 00       	push   $0x4899
    24e1:	6a 01                	push   $0x1
    24e3:	e8 78 15 00 00       	call   3a60 <printf>
      exit();
    24e8:	e8 f5 13 00 00       	call   38e2 <exit>
    24ed:	8d 76 00             	lea    0x0(%esi),%esi

000024f0 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    24f0:	55                   	push   %ebp
    24f1:	89 e5                	mov    %esp,%ebp
    24f3:	57                   	push   %edi
    24f4:	56                   	push   %esi
    24f5:	53                   	push   %ebx
    24f6:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    24f9:	68 d0 48 00 00       	push   $0x48d0
    24fe:	6a 01                	push   $0x1
    2500:	e8 5b 15 00 00       	call   3a60 <printf>

  unlink("bigfile");
    2505:	c7 04 24 ec 48 00 00 	movl   $0x48ec,(%esp)
    250c:	e8 21 14 00 00       	call   3932 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2511:	5e                   	pop    %esi
    2512:	5f                   	pop    %edi
    2513:	68 02 02 00 00       	push   $0x202
    2518:	68 ec 48 00 00       	push   $0x48ec
    251d:	e8 00 14 00 00       	call   3922 <open>
  if(fd < 0){
    2522:	83 c4 10             	add    $0x10,%esp
    2525:	85 c0                	test   %eax,%eax
  int fd, i, total, cc;

  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
    2527:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2529:	0f 88 5d 01 00 00    	js     268c <bigfile+0x19c>
    252f:	31 db                	xor    %ebx,%ebx
    2531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    2538:	83 ec 04             	sub    $0x4,%esp
    253b:	68 58 02 00 00       	push   $0x258
    2540:	53                   	push   %ebx
    2541:	68 40 87 00 00       	push   $0x8740
    2546:	e8 05 12 00 00       	call   3750 <memset>
    if(write(fd, buf, 600) != 600){
    254b:	83 c4 0c             	add    $0xc,%esp
    254e:	68 58 02 00 00       	push   $0x258
    2553:	68 40 87 00 00       	push   $0x8740
    2558:	56                   	push   %esi
    2559:	e8 a4 13 00 00       	call   3902 <write>
    255e:	83 c4 10             	add    $0x10,%esp
    2561:	3d 58 02 00 00       	cmp    $0x258,%eax
    2566:	0f 85 f8 00 00 00    	jne    2664 <bigfile+0x174>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    256c:	83 c3 01             	add    $0x1,%ebx
    256f:	83 fb 14             	cmp    $0x14,%ebx
    2572:	75 c4                	jne    2538 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2574:	83 ec 0c             	sub    $0xc,%esp
    2577:	56                   	push   %esi
    2578:	e8 8d 13 00 00       	call   390a <close>

  fd = open("bigfile", 0);
    257d:	59                   	pop    %ecx
    257e:	5b                   	pop    %ebx
    257f:	6a 00                	push   $0x0
    2581:	68 ec 48 00 00       	push   $0x48ec
    2586:	e8 97 13 00 00       	call   3922 <open>
  if(fd < 0){
    258b:	83 c4 10             	add    $0x10,%esp
    258e:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2590:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2592:	0f 88 e0 00 00 00    	js     2678 <bigfile+0x188>
    2598:	31 db                	xor    %ebx,%ebx
    259a:	31 ff                	xor    %edi,%edi
    259c:	eb 30                	jmp    25ce <bigfile+0xde>
    259e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    25a0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    25a5:	0f 85 91 00 00 00    	jne    263c <bigfile+0x14c>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    25ab:	0f be 05 40 87 00 00 	movsbl 0x8740,%eax
    25b2:	89 fa                	mov    %edi,%edx
    25b4:	d1 fa                	sar    %edx
    25b6:	39 d0                	cmp    %edx,%eax
    25b8:	75 6e                	jne    2628 <bigfile+0x138>
    25ba:	0f be 15 6b 88 00 00 	movsbl 0x886b,%edx
    25c1:	39 d0                	cmp    %edx,%eax
    25c3:	75 63                	jne    2628 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    25c5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    25cb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    25ce:	83 ec 04             	sub    $0x4,%esp
    25d1:	68 2c 01 00 00       	push   $0x12c
    25d6:	68 40 87 00 00       	push   $0x8740
    25db:	56                   	push   %esi
    25dc:	e8 19 13 00 00       	call   38fa <read>
    if(cc < 0){
    25e1:	83 c4 10             	add    $0x10,%esp
    25e4:	85 c0                	test   %eax,%eax
    25e6:	78 68                	js     2650 <bigfile+0x160>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    25e8:	75 b6                	jne    25a0 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    25ea:	83 ec 0c             	sub    $0xc,%esp
    25ed:	56                   	push   %esi
    25ee:	e8 17 13 00 00       	call   390a <close>
  if(total != 20*600){
    25f3:	83 c4 10             	add    $0x10,%esp
    25f6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25fc:	0f 85 9e 00 00 00    	jne    26a0 <bigfile+0x1b0>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    2602:	83 ec 0c             	sub    $0xc,%esp
    2605:	68 ec 48 00 00       	push   $0x48ec
    260a:	e8 23 13 00 00       	call   3932 <unlink>

  printf(1, "bigfile test ok\n");
    260f:	58                   	pop    %eax
    2610:	5a                   	pop    %edx
    2611:	68 7b 49 00 00       	push   $0x497b
    2616:	6a 01                	push   $0x1
    2618:	e8 43 14 00 00       	call   3a60 <printf>
    261d:	83 c4 10             	add    $0x10,%esp
}
    2620:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2623:	5b                   	pop    %ebx
    2624:	5e                   	pop    %esi
    2625:	5f                   	pop    %edi
    2626:	5d                   	pop    %ebp
    2627:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    2628:	83 ec 08             	sub    $0x8,%esp
    262b:	68 48 49 00 00       	push   $0x4948
    2630:	6a 01                	push   $0x1
    2632:	e8 29 14 00 00       	call   3a60 <printf>
      exit();
    2637:	e8 a6 12 00 00       	call   38e2 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    263c:	83 ec 08             	sub    $0x8,%esp
    263f:	68 34 49 00 00       	push   $0x4934
    2644:	6a 01                	push   $0x1
    2646:	e8 15 14 00 00       	call   3a60 <printf>
      exit();
    264b:	e8 92 12 00 00       	call   38e2 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    2650:	83 ec 08             	sub    $0x8,%esp
    2653:	68 1f 49 00 00       	push   $0x491f
    2658:	6a 01                	push   $0x1
    265a:	e8 01 14 00 00       	call   3a60 <printf>
      exit();
    265f:	e8 7e 12 00 00       	call   38e2 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2664:	83 ec 08             	sub    $0x8,%esp
    2667:	68 f4 48 00 00       	push   $0x48f4
    266c:	6a 01                	push   $0x1
    266e:	e8 ed 13 00 00       	call   3a60 <printf>
      exit();
    2673:	e8 6a 12 00 00       	call   38e2 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2678:	83 ec 08             	sub    $0x8,%esp
    267b:	68 0a 49 00 00       	push   $0x490a
    2680:	6a 01                	push   $0x1
    2682:	e8 d9 13 00 00       	call   3a60 <printf>
    exit();
    2687:	e8 56 12 00 00       	call   38e2 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    268c:	83 ec 08             	sub    $0x8,%esp
    268f:	68 de 48 00 00       	push   $0x48de
    2694:	6a 01                	push   $0x1
    2696:	e8 c5 13 00 00       	call   3a60 <printf>
    exit();
    269b:	e8 42 12 00 00       	call   38e2 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    26a0:	83 ec 08             	sub    $0x8,%esp
    26a3:	68 61 49 00 00       	push   $0x4961
    26a8:	6a 01                	push   $0x1
    26aa:	e8 b1 13 00 00       	call   3a60 <printf>
    exit();
    26af:	e8 2e 12 00 00       	call   38e2 <exit>
    26b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    26ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000026c0 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    26c0:	55                   	push   %ebp
    26c1:	89 e5                	mov    %esp,%ebp
    26c3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    26c6:	68 8c 49 00 00       	push   $0x498c
    26cb:	6a 01                	push   $0x1
    26cd:	e8 8e 13 00 00       	call   3a60 <printf>

  if(mkdir("12345678901234") != 0){
    26d2:	c7 04 24 c7 49 00 00 	movl   $0x49c7,(%esp)
    26d9:	e8 6c 12 00 00       	call   394a <mkdir>
    26de:	83 c4 10             	add    $0x10,%esp
    26e1:	85 c0                	test   %eax,%eax
    26e3:	0f 85 97 00 00 00    	jne    2780 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    26e9:	83 ec 0c             	sub    $0xc,%esp
    26ec:	68 84 51 00 00       	push   $0x5184
    26f1:	e8 54 12 00 00       	call   394a <mkdir>
    26f6:	83 c4 10             	add    $0x10,%esp
    26f9:	85 c0                	test   %eax,%eax
    26fb:	0f 85 de 00 00 00    	jne    27df <fourteen+0x11f>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2701:	83 ec 08             	sub    $0x8,%esp
    2704:	68 00 02 00 00       	push   $0x200
    2709:	68 d4 51 00 00       	push   $0x51d4
    270e:	e8 0f 12 00 00       	call   3922 <open>
  if(fd < 0){
    2713:	83 c4 10             	add    $0x10,%esp
    2716:	85 c0                	test   %eax,%eax
    2718:	0f 88 ae 00 00 00    	js     27cc <fourteen+0x10c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    271e:	83 ec 0c             	sub    $0xc,%esp
    2721:	50                   	push   %eax
    2722:	e8 e3 11 00 00       	call   390a <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2727:	58                   	pop    %eax
    2728:	5a                   	pop    %edx
    2729:	6a 00                	push   $0x0
    272b:	68 44 52 00 00       	push   $0x5244
    2730:	e8 ed 11 00 00       	call   3922 <open>
  if(fd < 0){
    2735:	83 c4 10             	add    $0x10,%esp
    2738:	85 c0                	test   %eax,%eax
    273a:	78 7d                	js     27b9 <fourteen+0xf9>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    273c:	83 ec 0c             	sub    $0xc,%esp
    273f:	50                   	push   %eax
    2740:	e8 c5 11 00 00       	call   390a <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2745:	c7 04 24 b8 49 00 00 	movl   $0x49b8,(%esp)
    274c:	e8 f9 11 00 00       	call   394a <mkdir>
    2751:	83 c4 10             	add    $0x10,%esp
    2754:	85 c0                	test   %eax,%eax
    2756:	74 4e                	je     27a6 <fourteen+0xe6>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2758:	83 ec 0c             	sub    $0xc,%esp
    275b:	68 e0 52 00 00       	push   $0x52e0
    2760:	e8 e5 11 00 00       	call   394a <mkdir>
    2765:	83 c4 10             	add    $0x10,%esp
    2768:	85 c0                	test   %eax,%eax
    276a:	74 27                	je     2793 <fourteen+0xd3>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    276c:	83 ec 08             	sub    $0x8,%esp
    276f:	68 d6 49 00 00       	push   $0x49d6
    2774:	6a 01                	push   $0x1
    2776:	e8 e5 12 00 00       	call   3a60 <printf>
    277b:	83 c4 10             	add    $0x10,%esp
}
    277e:	c9                   	leave  
    277f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2780:	50                   	push   %eax
    2781:	50                   	push   %eax
    2782:	68 9b 49 00 00       	push   $0x499b
    2787:	6a 01                	push   $0x1
    2789:	e8 d2 12 00 00       	call   3a60 <printf>
    exit();
    278e:	e8 4f 11 00 00       	call   38e2 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2793:	50                   	push   %eax
    2794:	50                   	push   %eax
    2795:	68 00 53 00 00       	push   $0x5300
    279a:	6a 01                	push   $0x1
    279c:	e8 bf 12 00 00       	call   3a60 <printf>
    exit();
    27a1:	e8 3c 11 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    27a6:	52                   	push   %edx
    27a7:	52                   	push   %edx
    27a8:	68 b0 52 00 00       	push   $0x52b0
    27ad:	6a 01                	push   $0x1
    27af:	e8 ac 12 00 00       	call   3a60 <printf>
    exit();
    27b4:	e8 29 11 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    27b9:	51                   	push   %ecx
    27ba:	51                   	push   %ecx
    27bb:	68 74 52 00 00       	push   $0x5274
    27c0:	6a 01                	push   $0x1
    27c2:	e8 99 12 00 00       	call   3a60 <printf>
    exit();
    27c7:	e8 16 11 00 00       	call   38e2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27cc:	51                   	push   %ecx
    27cd:	51                   	push   %ecx
    27ce:	68 04 52 00 00       	push   $0x5204
    27d3:	6a 01                	push   $0x1
    27d5:	e8 86 12 00 00       	call   3a60 <printf>
    exit();
    27da:	e8 03 11 00 00       	call   38e2 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27df:	50                   	push   %eax
    27e0:	50                   	push   %eax
    27e1:	68 a4 51 00 00       	push   $0x51a4
    27e6:	6a 01                	push   $0x1
    27e8:	e8 73 12 00 00       	call   3a60 <printf>
    exit();
    27ed:	e8 f0 10 00 00       	call   38e2 <exit>
    27f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002800 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2800:	55                   	push   %ebp
    2801:	89 e5                	mov    %esp,%ebp
    2803:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2806:	68 e3 49 00 00       	push   $0x49e3
    280b:	6a 01                	push   $0x1
    280d:	e8 4e 12 00 00       	call   3a60 <printf>
  if(mkdir("dots") != 0){
    2812:	c7 04 24 ef 49 00 00 	movl   $0x49ef,(%esp)
    2819:	e8 2c 11 00 00       	call   394a <mkdir>
    281e:	83 c4 10             	add    $0x10,%esp
    2821:	85 c0                	test   %eax,%eax
    2823:	0f 85 b0 00 00 00    	jne    28d9 <rmdot+0xd9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    2829:	83 ec 0c             	sub    $0xc,%esp
    282c:	68 ef 49 00 00       	push   $0x49ef
    2831:	e8 1c 11 00 00       	call   3952 <chdir>
    2836:	83 c4 10             	add    $0x10,%esp
    2839:	85 c0                	test   %eax,%eax
    283b:	0f 85 1d 01 00 00    	jne    295e <rmdot+0x15e>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2841:	83 ec 0c             	sub    $0xc,%esp
    2844:	68 9a 46 00 00       	push   $0x469a
    2849:	e8 e4 10 00 00       	call   3932 <unlink>
    284e:	83 c4 10             	add    $0x10,%esp
    2851:	85 c0                	test   %eax,%eax
    2853:	0f 84 f2 00 00 00    	je     294b <rmdot+0x14b>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2859:	83 ec 0c             	sub    $0xc,%esp
    285c:	68 99 46 00 00       	push   $0x4699
    2861:	e8 cc 10 00 00       	call   3932 <unlink>
    2866:	83 c4 10             	add    $0x10,%esp
    2869:	85 c0                	test   %eax,%eax
    286b:	0f 84 c7 00 00 00    	je     2938 <rmdot+0x138>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2871:	83 ec 0c             	sub    $0xc,%esp
    2874:	68 6d 3e 00 00       	push   $0x3e6d
    2879:	e8 d4 10 00 00       	call   3952 <chdir>
    287e:	83 c4 10             	add    $0x10,%esp
    2881:	85 c0                	test   %eax,%eax
    2883:	0f 85 9c 00 00 00    	jne    2925 <rmdot+0x125>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2889:	83 ec 0c             	sub    $0xc,%esp
    288c:	68 37 4a 00 00       	push   $0x4a37
    2891:	e8 9c 10 00 00       	call   3932 <unlink>
    2896:	83 c4 10             	add    $0x10,%esp
    2899:	85 c0                	test   %eax,%eax
    289b:	74 75                	je     2912 <rmdot+0x112>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    289d:	83 ec 0c             	sub    $0xc,%esp
    28a0:	68 55 4a 00 00       	push   $0x4a55
    28a5:	e8 88 10 00 00       	call   3932 <unlink>
    28aa:	83 c4 10             	add    $0x10,%esp
    28ad:	85 c0                	test   %eax,%eax
    28af:	74 4e                	je     28ff <rmdot+0xff>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    28b1:	83 ec 0c             	sub    $0xc,%esp
    28b4:	68 ef 49 00 00       	push   $0x49ef
    28b9:	e8 74 10 00 00       	call   3932 <unlink>
    28be:	83 c4 10             	add    $0x10,%esp
    28c1:	85 c0                	test   %eax,%eax
    28c3:	75 27                	jne    28ec <rmdot+0xec>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    28c5:	83 ec 08             	sub    $0x8,%esp
    28c8:	68 8a 4a 00 00       	push   $0x4a8a
    28cd:	6a 01                	push   $0x1
    28cf:	e8 8c 11 00 00       	call   3a60 <printf>
    28d4:	83 c4 10             	add    $0x10,%esp
}
    28d7:	c9                   	leave  
    28d8:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    28d9:	50                   	push   %eax
    28da:	50                   	push   %eax
    28db:	68 f4 49 00 00       	push   $0x49f4
    28e0:	6a 01                	push   $0x1
    28e2:	e8 79 11 00 00       	call   3a60 <printf>
    exit();
    28e7:	e8 f6 0f 00 00       	call   38e2 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    28ec:	50                   	push   %eax
    28ed:	50                   	push   %eax
    28ee:	68 75 4a 00 00       	push   $0x4a75
    28f3:	6a 01                	push   $0x1
    28f5:	e8 66 11 00 00       	call   3a60 <printf>
    exit();
    28fa:	e8 e3 0f 00 00       	call   38e2 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    28ff:	52                   	push   %edx
    2900:	52                   	push   %edx
    2901:	68 5d 4a 00 00       	push   $0x4a5d
    2906:	6a 01                	push   $0x1
    2908:	e8 53 11 00 00       	call   3a60 <printf>
    exit();
    290d:	e8 d0 0f 00 00       	call   38e2 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    2912:	51                   	push   %ecx
    2913:	51                   	push   %ecx
    2914:	68 3e 4a 00 00       	push   $0x4a3e
    2919:	6a 01                	push   $0x1
    291b:	e8 40 11 00 00       	call   3a60 <printf>
    exit();
    2920:	e8 bd 0f 00 00       	call   38e2 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2925:	50                   	push   %eax
    2926:	50                   	push   %eax
    2927:	68 6f 3e 00 00       	push   $0x3e6f
    292c:	6a 01                	push   $0x1
    292e:	e8 2d 11 00 00       	call   3a60 <printf>
    exit();
    2933:	e8 aa 0f 00 00       	call   38e2 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2938:	50                   	push   %eax
    2939:	50                   	push   %eax
    293a:	68 28 4a 00 00       	push   $0x4a28
    293f:	6a 01                	push   $0x1
    2941:	e8 1a 11 00 00       	call   3a60 <printf>
    exit();
    2946:	e8 97 0f 00 00       	call   38e2 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    294b:	50                   	push   %eax
    294c:	50                   	push   %eax
    294d:	68 1a 4a 00 00       	push   $0x4a1a
    2952:	6a 01                	push   $0x1
    2954:	e8 07 11 00 00       	call   3a60 <printf>
    exit();
    2959:	e8 84 0f 00 00       	call   38e2 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    295e:	50                   	push   %eax
    295f:	50                   	push   %eax
    2960:	68 07 4a 00 00       	push   $0x4a07
    2965:	6a 01                	push   $0x1
    2967:	e8 f4 10 00 00       	call   3a60 <printf>
    exit();
    296c:	e8 71 0f 00 00       	call   38e2 <exit>
    2971:	eb 0d                	jmp    2980 <dirfile>
    2973:	90                   	nop
    2974:	90                   	nop
    2975:	90                   	nop
    2976:	90                   	nop
    2977:	90                   	nop
    2978:	90                   	nop
    2979:	90                   	nop
    297a:	90                   	nop
    297b:	90                   	nop
    297c:	90                   	nop
    297d:	90                   	nop
    297e:	90                   	nop
    297f:	90                   	nop

00002980 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2980:	55                   	push   %ebp
    2981:	89 e5                	mov    %esp,%ebp
    2983:	53                   	push   %ebx
    2984:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2987:	68 94 4a 00 00       	push   $0x4a94
    298c:	6a 01                	push   $0x1
    298e:	e8 cd 10 00 00       	call   3a60 <printf>

  fd = open("dirfile", O_CREATE);
    2993:	59                   	pop    %ecx
    2994:	5b                   	pop    %ebx
    2995:	68 00 02 00 00       	push   $0x200
    299a:	68 a1 4a 00 00       	push   $0x4aa1
    299f:	e8 7e 0f 00 00       	call   3922 <open>
  if(fd < 0){
    29a4:	83 c4 10             	add    $0x10,%esp
    29a7:	85 c0                	test   %eax,%eax
    29a9:	0f 88 43 01 00 00    	js     2af2 <dirfile+0x172>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    29af:	83 ec 0c             	sub    $0xc,%esp
    29b2:	50                   	push   %eax
    29b3:	e8 52 0f 00 00       	call   390a <close>
  if(chdir("dirfile") == 0){
    29b8:	c7 04 24 a1 4a 00 00 	movl   $0x4aa1,(%esp)
    29bf:	e8 8e 0f 00 00       	call   3952 <chdir>
    29c4:	83 c4 10             	add    $0x10,%esp
    29c7:	85 c0                	test   %eax,%eax
    29c9:	0f 84 10 01 00 00    	je     2adf <dirfile+0x15f>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    29cf:	83 ec 08             	sub    $0x8,%esp
    29d2:	6a 00                	push   $0x0
    29d4:	68 da 4a 00 00       	push   $0x4ada
    29d9:	e8 44 0f 00 00       	call   3922 <open>
  if(fd >= 0){
    29de:	83 c4 10             	add    $0x10,%esp
    29e1:	85 c0                	test   %eax,%eax
    29e3:	0f 89 e3 00 00 00    	jns    2acc <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    29e9:	83 ec 08             	sub    $0x8,%esp
    29ec:	68 00 02 00 00       	push   $0x200
    29f1:	68 da 4a 00 00       	push   $0x4ada
    29f6:	e8 27 0f 00 00       	call   3922 <open>
  if(fd >= 0){
    29fb:	83 c4 10             	add    $0x10,%esp
    29fe:	85 c0                	test   %eax,%eax
    2a00:	0f 89 c6 00 00 00    	jns    2acc <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    2a06:	83 ec 0c             	sub    $0xc,%esp
    2a09:	68 da 4a 00 00       	push   $0x4ada
    2a0e:	e8 37 0f 00 00       	call   394a <mkdir>
    2a13:	83 c4 10             	add    $0x10,%esp
    2a16:	85 c0                	test   %eax,%eax
    2a18:	0f 84 46 01 00 00    	je     2b64 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    2a1e:	83 ec 0c             	sub    $0xc,%esp
    2a21:	68 da 4a 00 00       	push   $0x4ada
    2a26:	e8 07 0f 00 00       	call   3932 <unlink>
    2a2b:	83 c4 10             	add    $0x10,%esp
    2a2e:	85 c0                	test   %eax,%eax
    2a30:	0f 84 1b 01 00 00    	je     2b51 <dirfile+0x1d1>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    2a36:	83 ec 08             	sub    $0x8,%esp
    2a39:	68 da 4a 00 00       	push   $0x4ada
    2a3e:	68 3e 4b 00 00       	push   $0x4b3e
    2a43:	e8 fa 0e 00 00       	call   3942 <link>
    2a48:	83 c4 10             	add    $0x10,%esp
    2a4b:	85 c0                	test   %eax,%eax
    2a4d:	0f 84 eb 00 00 00    	je     2b3e <dirfile+0x1be>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2a53:	83 ec 0c             	sub    $0xc,%esp
    2a56:	68 a1 4a 00 00       	push   $0x4aa1
    2a5b:	e8 d2 0e 00 00       	call   3932 <unlink>
    2a60:	83 c4 10             	add    $0x10,%esp
    2a63:	85 c0                	test   %eax,%eax
    2a65:	0f 85 c0 00 00 00    	jne    2b2b <dirfile+0x1ab>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2a6b:	83 ec 08             	sub    $0x8,%esp
    2a6e:	6a 02                	push   $0x2
    2a70:	68 9a 46 00 00       	push   $0x469a
    2a75:	e8 a8 0e 00 00       	call   3922 <open>
  if(fd >= 0){
    2a7a:	83 c4 10             	add    $0x10,%esp
    2a7d:	85 c0                	test   %eax,%eax
    2a7f:	0f 89 93 00 00 00    	jns    2b18 <dirfile+0x198>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a85:	83 ec 08             	sub    $0x8,%esp
    2a88:	6a 00                	push   $0x0
    2a8a:	68 9a 46 00 00       	push   $0x469a
    2a8f:	e8 8e 0e 00 00       	call   3922 <open>
  if(write(fd, "x", 1) > 0){
    2a94:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a97:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a99:	6a 01                	push   $0x1
    2a9b:	68 7d 47 00 00       	push   $0x477d
    2aa0:	50                   	push   %eax
    2aa1:	e8 5c 0e 00 00       	call   3902 <write>
    2aa6:	83 c4 10             	add    $0x10,%esp
    2aa9:	85 c0                	test   %eax,%eax
    2aab:	7f 58                	jg     2b05 <dirfile+0x185>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    2aad:	83 ec 0c             	sub    $0xc,%esp
    2ab0:	53                   	push   %ebx
    2ab1:	e8 54 0e 00 00       	call   390a <close>

  printf(1, "dir vs file OK\n");
    2ab6:	58                   	pop    %eax
    2ab7:	5a                   	pop    %edx
    2ab8:	68 71 4b 00 00       	push   $0x4b71
    2abd:	6a 01                	push   $0x1
    2abf:	e8 9c 0f 00 00       	call   3a60 <printf>
    2ac4:	83 c4 10             	add    $0x10,%esp
}
    2ac7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2aca:	c9                   	leave  
    2acb:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2acc:	50                   	push   %eax
    2acd:	50                   	push   %eax
    2ace:	68 e5 4a 00 00       	push   $0x4ae5
    2ad3:	6a 01                	push   $0x1
    2ad5:	e8 86 0f 00 00       	call   3a60 <printf>
    exit();
    2ada:	e8 03 0e 00 00       	call   38e2 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2adf:	50                   	push   %eax
    2ae0:	50                   	push   %eax
    2ae1:	68 c0 4a 00 00       	push   $0x4ac0
    2ae6:	6a 01                	push   $0x1
    2ae8:	e8 73 0f 00 00       	call   3a60 <printf>
    exit();
    2aed:	e8 f0 0d 00 00       	call   38e2 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2af2:	52                   	push   %edx
    2af3:	52                   	push   %edx
    2af4:	68 a9 4a 00 00       	push   $0x4aa9
    2af9:	6a 01                	push   $0x1
    2afb:	e8 60 0f 00 00       	call   3a60 <printf>
    exit();
    2b00:	e8 dd 0d 00 00       	call   38e2 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2b05:	51                   	push   %ecx
    2b06:	51                   	push   %ecx
    2b07:	68 5d 4b 00 00       	push   $0x4b5d
    2b0c:	6a 01                	push   $0x1
    2b0e:	e8 4d 0f 00 00       	call   3a60 <printf>
    exit();
    2b13:	e8 ca 0d 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2b18:	53                   	push   %ebx
    2b19:	53                   	push   %ebx
    2b1a:	68 54 53 00 00       	push   $0x5354
    2b1f:	6a 01                	push   $0x1
    2b21:	e8 3a 0f 00 00       	call   3a60 <printf>
    exit();
    2b26:	e8 b7 0d 00 00       	call   38e2 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2b2b:	50                   	push   %eax
    2b2c:	50                   	push   %eax
    2b2d:	68 45 4b 00 00       	push   $0x4b45
    2b32:	6a 01                	push   $0x1
    2b34:	e8 27 0f 00 00       	call   3a60 <printf>
    exit();
    2b39:	e8 a4 0d 00 00       	call   38e2 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2b3e:	50                   	push   %eax
    2b3f:	50                   	push   %eax
    2b40:	68 34 53 00 00       	push   $0x5334
    2b45:	6a 01                	push   $0x1
    2b47:	e8 14 0f 00 00       	call   3a60 <printf>
    exit();
    2b4c:	e8 91 0d 00 00       	call   38e2 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b51:	50                   	push   %eax
    2b52:	50                   	push   %eax
    2b53:	68 20 4b 00 00       	push   $0x4b20
    2b58:	6a 01                	push   $0x1
    2b5a:	e8 01 0f 00 00       	call   3a60 <printf>
    exit();
    2b5f:	e8 7e 0d 00 00       	call   38e2 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b64:	50                   	push   %eax
    2b65:	50                   	push   %eax
    2b66:	68 03 4b 00 00       	push   $0x4b03
    2b6b:	6a 01                	push   $0x1
    2b6d:	e8 ee 0e 00 00       	call   3a60 <printf>
    exit();
    2b72:	e8 6b 0d 00 00       	call   38e2 <exit>
    2b77:	89 f6                	mov    %esi,%esi
    2b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b80 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b80:	55                   	push   %ebp
    2b81:	89 e5                	mov    %esp,%ebp
    2b83:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2b84:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b89:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2b8c:	68 81 4b 00 00       	push   $0x4b81
    2b91:	6a 01                	push   $0x1
    2b93:	e8 c8 0e 00 00       	call   3a60 <printf>
    2b98:	83 c4 10             	add    $0x10,%esp
    2b9b:	90                   	nop
    2b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2ba0:	83 ec 0c             	sub    $0xc,%esp
    2ba3:	68 92 4b 00 00       	push   $0x4b92
    2ba8:	e8 9d 0d 00 00       	call   394a <mkdir>
    2bad:	83 c4 10             	add    $0x10,%esp
    2bb0:	85 c0                	test   %eax,%eax
    2bb2:	0f 85 bb 00 00 00    	jne    2c73 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    2bb8:	83 ec 0c             	sub    $0xc,%esp
    2bbb:	68 92 4b 00 00       	push   $0x4b92
    2bc0:	e8 8d 0d 00 00       	call   3952 <chdir>
    2bc5:	83 c4 10             	add    $0x10,%esp
    2bc8:	85 c0                	test   %eax,%eax
    2bca:	0f 85 b7 00 00 00    	jne    2c87 <iref+0x107>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    2bd0:	83 ec 0c             	sub    $0xc,%esp
    2bd3:	68 47 42 00 00       	push   $0x4247
    2bd8:	e8 6d 0d 00 00       	call   394a <mkdir>
    link("README", "");
    2bdd:	59                   	pop    %ecx
    2bde:	58                   	pop    %eax
    2bdf:	68 47 42 00 00       	push   $0x4247
    2be4:	68 3e 4b 00 00       	push   $0x4b3e
    2be9:	e8 54 0d 00 00       	call   3942 <link>
    fd = open("", O_CREATE);
    2bee:	58                   	pop    %eax
    2bef:	5a                   	pop    %edx
    2bf0:	68 00 02 00 00       	push   $0x200
    2bf5:	68 47 42 00 00       	push   $0x4247
    2bfa:	e8 23 0d 00 00       	call   3922 <open>
    if(fd >= 0)
    2bff:	83 c4 10             	add    $0x10,%esp
    2c02:	85 c0                	test   %eax,%eax
    2c04:	78 0c                	js     2c12 <iref+0x92>
      close(fd);
    2c06:	83 ec 0c             	sub    $0xc,%esp
    2c09:	50                   	push   %eax
    2c0a:	e8 fb 0c 00 00       	call   390a <close>
    2c0f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2c12:	83 ec 08             	sub    $0x8,%esp
    2c15:	68 00 02 00 00       	push   $0x200
    2c1a:	68 7c 47 00 00       	push   $0x477c
    2c1f:	e8 fe 0c 00 00       	call   3922 <open>
    if(fd >= 0)
    2c24:	83 c4 10             	add    $0x10,%esp
    2c27:	85 c0                	test   %eax,%eax
    2c29:	78 0c                	js     2c37 <iref+0xb7>
      close(fd);
    2c2b:	83 ec 0c             	sub    $0xc,%esp
    2c2e:	50                   	push   %eax
    2c2f:	e8 d6 0c 00 00       	call   390a <close>
    2c34:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c37:	83 ec 0c             	sub    $0xc,%esp
    2c3a:	68 7c 47 00 00       	push   $0x477c
    2c3f:	e8 ee 0c 00 00       	call   3932 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c44:	83 c4 10             	add    $0x10,%esp
    2c47:	83 eb 01             	sub    $0x1,%ebx
    2c4a:	0f 85 50 ff ff ff    	jne    2ba0 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2c50:	83 ec 0c             	sub    $0xc,%esp
    2c53:	68 6d 3e 00 00       	push   $0x3e6d
    2c58:	e8 f5 0c 00 00       	call   3952 <chdir>
  printf(1, "empty file name OK\n");
    2c5d:	58                   	pop    %eax
    2c5e:	5a                   	pop    %edx
    2c5f:	68 c0 4b 00 00       	push   $0x4bc0
    2c64:	6a 01                	push   $0x1
    2c66:	e8 f5 0d 00 00       	call   3a60 <printf>
    2c6b:	83 c4 10             	add    $0x10,%esp
}
    2c6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c71:	c9                   	leave  
    2c72:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2c73:	83 ec 08             	sub    $0x8,%esp
    2c76:	68 98 4b 00 00       	push   $0x4b98
    2c7b:	6a 01                	push   $0x1
    2c7d:	e8 de 0d 00 00       	call   3a60 <printf>
      exit();
    2c82:	e8 5b 0c 00 00       	call   38e2 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2c87:	83 ec 08             	sub    $0x8,%esp
    2c8a:	68 ac 4b 00 00       	push   $0x4bac
    2c8f:	6a 01                	push   $0x1
    2c91:	e8 ca 0d 00 00       	call   3a60 <printf>
      exit();
    2c96:	e8 47 0c 00 00       	call   38e2 <exit>
    2c9b:	90                   	nop
    2c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002ca0 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2ca0:	55                   	push   %ebp
    2ca1:	89 e5                	mov    %esp,%ebp
    2ca3:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2ca4:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2ca6:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2ca9:	68 d4 4b 00 00       	push   $0x4bd4
    2cae:	6a 01                	push   $0x1
    2cb0:	e8 ab 0d 00 00       	call   3a60 <printf>
    2cb5:	83 c4 10             	add    $0x10,%esp
    2cb8:	eb 13                	jmp    2ccd <forktest+0x2d>
    2cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    2cc0:	74 62                	je     2d24 <forktest+0x84>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2cc2:	83 c3 01             	add    $0x1,%ebx
    2cc5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2ccb:	74 43                	je     2d10 <forktest+0x70>
    pid = fork();
    2ccd:	e8 08 0c 00 00       	call   38da <fork>
    if(pid < 0)
    2cd2:	85 c0                	test   %eax,%eax
    2cd4:	79 ea                	jns    2cc0 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2cd6:	85 db                	test   %ebx,%ebx
    2cd8:	74 14                	je     2cee <forktest+0x4e>
    2cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2ce0:	e8 05 0c 00 00       	call   38ea <wait>
    2ce5:	85 c0                	test   %eax,%eax
    2ce7:	78 40                	js     2d29 <forktest+0x89>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2ce9:	83 eb 01             	sub    $0x1,%ebx
    2cec:	75 f2                	jne    2ce0 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    2cee:	e8 f7 0b 00 00       	call   38ea <wait>
    2cf3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cf6:	75 45                	jne    2d3d <forktest+0x9d>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2cf8:	83 ec 08             	sub    $0x8,%esp
    2cfb:	68 06 4c 00 00       	push   $0x4c06
    2d00:	6a 01                	push   $0x1
    2d02:	e8 59 0d 00 00       	call   3a60 <printf>
}
    2d07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2d0a:	c9                   	leave  
    2d0b:	c3                   	ret    
    2d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    2d10:	83 ec 08             	sub    $0x8,%esp
    2d13:	68 74 53 00 00       	push   $0x5374
    2d18:	6a 01                	push   $0x1
    2d1a:	e8 41 0d 00 00       	call   3a60 <printf>
    exit();
    2d1f:	e8 be 0b 00 00       	call   38e2 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
    2d24:	e8 b9 0b 00 00       	call   38e2 <exit>
    exit();
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    2d29:	83 ec 08             	sub    $0x8,%esp
    2d2c:	68 df 4b 00 00       	push   $0x4bdf
    2d31:	6a 01                	push   $0x1
    2d33:	e8 28 0d 00 00       	call   3a60 <printf>
      exit();
    2d38:	e8 a5 0b 00 00       	call   38e2 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    2d3d:	83 ec 08             	sub    $0x8,%esp
    2d40:	68 f3 4b 00 00       	push   $0x4bf3
    2d45:	6a 01                	push   $0x1
    2d47:	e8 14 0d 00 00       	call   3a60 <printf>
    exit();
    2d4c:	e8 91 0b 00 00       	call   38e2 <exit>
    2d51:	eb 0d                	jmp    2d60 <sbrktest>
    2d53:	90                   	nop
    2d54:	90                   	nop
    2d55:	90                   	nop
    2d56:	90                   	nop
    2d57:	90                   	nop
    2d58:	90                   	nop
    2d59:	90                   	nop
    2d5a:	90                   	nop
    2d5b:	90                   	nop
    2d5c:	90                   	nop
    2d5d:	90                   	nop
    2d5e:	90                   	nop
    2d5f:	90                   	nop

00002d60 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d60:	55                   	push   %ebp
    2d61:	89 e5                	mov    %esp,%ebp
    2d63:	57                   	push   %edi
    2d64:	56                   	push   %esi
    2d65:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d66:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d68:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2d6b:	68 14 4c 00 00       	push   $0x4c14
    2d70:	ff 35 20 5f 00 00    	pushl  0x5f20
    2d76:	e8 e5 0c 00 00       	call   3a60 <printf>
  oldbrk = sbrk(0);
    2d7b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d82:	e8 e3 0b 00 00       	call   396a <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d87:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    2d8e:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d91:	e8 d4 0b 00 00       	call   396a <sbrk>
    2d96:	83 c4 10             	add    $0x10,%esp
    2d99:	89 c3                	mov    %eax,%ebx
    2d9b:	90                   	nop
    2d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    2da0:	83 ec 0c             	sub    $0xc,%esp
    2da3:	6a 01                	push   $0x1
    2da5:	e8 c0 0b 00 00       	call   396a <sbrk>
    if(b != a){
    2daa:	83 c4 10             	add    $0x10,%esp
    2dad:	39 d8                	cmp    %ebx,%eax
    2daf:	0f 85 85 02 00 00    	jne    303a <sbrktest+0x2da>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2db5:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2db8:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2dbb:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2dbe:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2dc4:	75 da                	jne    2da0 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2dc6:	e8 0f 0b 00 00       	call   38da <fork>
  if(pid < 0){
    2dcb:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2dcd:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2dcf:	0f 88 93 03 00 00    	js     3168 <sbrktest+0x408>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2dd5:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    2dd8:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2ddb:	6a 01                	push   $0x1
    2ddd:	e8 88 0b 00 00       	call   396a <sbrk>
  c = sbrk(1);
    2de2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2de9:	e8 7c 0b 00 00       	call   396a <sbrk>
  if(c != a + 1){
    2dee:	83 c4 10             	add    $0x10,%esp
    2df1:	39 d8                	cmp    %ebx,%eax
    2df3:	0f 85 57 03 00 00    	jne    3150 <sbrktest+0x3f0>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2df9:	85 ff                	test   %edi,%edi
    2dfb:	0f 84 4a 03 00 00    	je     314b <sbrktest+0x3eb>
    exit();
  wait();
    2e01:	e8 e4 0a 00 00       	call   38ea <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2e06:	83 ec 0c             	sub    $0xc,%esp
    2e09:	6a 00                	push   $0x0
    2e0b:	e8 5a 0b 00 00       	call   396a <sbrk>
  amt = (BIG) - (uint)a;
    2e10:	ba 00 00 40 06       	mov    $0x6400000,%edx
    exit();
  wait();

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2e15:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2e17:	29 c2                	sub    %eax,%edx
  p = sbrk(amt);
    2e19:	89 14 24             	mov    %edx,(%esp)
    2e1c:	e8 49 0b 00 00       	call   396a <sbrk>
  if (p != a) {
    2e21:	83 c4 10             	add    $0x10,%esp
    2e24:	39 d8                	cmp    %ebx,%eax
    2e26:	0f 85 07 03 00 00    	jne    3133 <sbrktest+0x3d3>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e2c:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    2e2f:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    2e36:	6a 00                	push   $0x0
    2e38:	e8 2d 0b 00 00       	call   396a <sbrk>
  c = sbrk(-4096);
    2e3d:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e44:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e46:	e8 1f 0b 00 00       	call   396a <sbrk>
  if(c == (char*)0xffffffff){
    2e4b:	83 c4 10             	add    $0x10,%esp
    2e4e:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e51:	0f 84 c4 02 00 00    	je     311b <sbrktest+0x3bb>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2e57:	83 ec 0c             	sub    $0xc,%esp
    2e5a:	6a 00                	push   $0x0
    2e5c:	e8 09 0b 00 00       	call   396a <sbrk>
  if(c != a - 4096){
    2e61:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e67:	83 c4 10             	add    $0x10,%esp
    2e6a:	39 d0                	cmp    %edx,%eax
    2e6c:	0f 85 92 02 00 00    	jne    3104 <sbrktest+0x3a4>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2e72:	83 ec 0c             	sub    $0xc,%esp
    2e75:	6a 00                	push   $0x0
    2e77:	e8 ee 0a 00 00       	call   396a <sbrk>
    2e7c:	89 c7                	mov    %eax,%edi
  c = sbrk(4096);
    2e7e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e85:	e8 e0 0a 00 00       	call   396a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e8a:	83 c4 10             	add    $0x10,%esp
    2e8d:	39 f8                	cmp    %edi,%eax
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2e8f:	89 c3                	mov    %eax,%ebx
  if(c != a || sbrk(0) != a + 4096){
    2e91:	0f 85 56 02 00 00    	jne    30ed <sbrktest+0x38d>
    2e97:	83 ec 0c             	sub    $0xc,%esp
    2e9a:	6a 00                	push   $0x0
    2e9c:	e8 c9 0a 00 00       	call   396a <sbrk>
    2ea1:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2ea7:	83 c4 10             	add    $0x10,%esp
    2eaa:	39 d0                	cmp    %edx,%eax
    2eac:	0f 85 3b 02 00 00    	jne    30ed <sbrktest+0x38d>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2eb2:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2eb9:	0f 84 16 02 00 00    	je     30d5 <sbrktest+0x375>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2ebf:	83 ec 0c             	sub    $0xc,%esp
    2ec2:	6a 00                	push   $0x0
    2ec4:	e8 a1 0a 00 00       	call   396a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2ec9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2ed0:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2ed2:	e8 93 0a 00 00       	call   396a <sbrk>
    2ed7:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    2eda:	29 c1                	sub    %eax,%ecx
    2edc:	89 0c 24             	mov    %ecx,(%esp)
    2edf:	e8 86 0a 00 00       	call   396a <sbrk>
  if(c != a){
    2ee4:	83 c4 10             	add    $0x10,%esp
    2ee7:	39 d8                	cmp    %ebx,%eax
    2ee9:	0f 85 cf 01 00 00    	jne    30be <sbrktest+0x35e>
    2eef:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2ef8:	e8 65 0a 00 00       	call   3962 <getpid>
    2efd:	89 c7                	mov    %eax,%edi
    pid = fork();
    2eff:	e8 d6 09 00 00       	call   38da <fork>
    if(pid < 0){
    2f04:	85 c0                	test   %eax,%eax
    2f06:	0f 88 9a 01 00 00    	js     30a6 <sbrktest+0x346>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2f0c:	0f 84 72 01 00 00    	je     3084 <sbrktest+0x324>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f12:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2f18:	e8 cd 09 00 00       	call   38ea <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f1d:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2f23:	75 d3                	jne    2ef8 <sbrktest+0x198>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2f25:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f28:	83 ec 0c             	sub    $0xc,%esp
    2f2b:	50                   	push   %eax
    2f2c:	e8 c1 09 00 00       	call   38f2 <pipe>
    2f31:	83 c4 10             	add    $0x10,%esp
    2f34:	85 c0                	test   %eax,%eax
    2f36:	0f 85 34 01 00 00    	jne    3070 <sbrktest+0x310>
    2f3c:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2f3f:	8d 7d e8             	lea    -0x18(%ebp),%edi
    2f42:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    2f44:	e8 91 09 00 00       	call   38da <fork>
    2f49:	85 c0                	test   %eax,%eax
    2f4b:	89 06                	mov    %eax,(%esi)
    2f4d:	0f 84 a1 00 00 00    	je     2ff4 <sbrktest+0x294>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    2f53:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f56:	74 14                	je     2f6c <sbrktest+0x20c>
      read(fds[0], &scratch, 1);
    2f58:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f5b:	83 ec 04             	sub    $0x4,%esp
    2f5e:	6a 01                	push   $0x1
    2f60:	50                   	push   %eax
    2f61:	ff 75 b8             	pushl  -0x48(%ebp)
    2f64:	e8 91 09 00 00       	call   38fa <read>
    2f69:	83 c4 10             	add    $0x10,%esp
    2f6c:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f6f:	39 fe                	cmp    %edi,%esi
    2f71:	75 d1                	jne    2f44 <sbrktest+0x1e4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2f73:	83 ec 0c             	sub    $0xc,%esp
    2f76:	68 00 10 00 00       	push   $0x1000
    2f7b:	e8 ea 09 00 00       	call   396a <sbrk>
    2f80:	83 c4 10             	add    $0x10,%esp
    2f83:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2f85:	8b 03                	mov    (%ebx),%eax
    2f87:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f8a:	74 11                	je     2f9d <sbrktest+0x23d>
      continue;
    kill(pids[i]);
    2f8c:	83 ec 0c             	sub    $0xc,%esp
    2f8f:	50                   	push   %eax
    2f90:	e8 7d 09 00 00       	call   3912 <kill>
    wait();
    2f95:	e8 50 09 00 00       	call   38ea <wait>
    2f9a:	83 c4 10             	add    $0x10,%esp
    2f9d:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fa0:	39 df                	cmp    %ebx,%edi
    2fa2:	75 e1                	jne    2f85 <sbrktest+0x225>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    2fa4:	83 fe ff             	cmp    $0xffffffff,%esi
    2fa7:	0f 84 ab 00 00 00    	je     3058 <sbrktest+0x2f8>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2fad:	83 ec 0c             	sub    $0xc,%esp
    2fb0:	6a 00                	push   $0x0
    2fb2:	e8 b3 09 00 00       	call   396a <sbrk>
    2fb7:	83 c4 10             	add    $0x10,%esp
    2fba:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2fbd:	73 1a                	jae    2fd9 <sbrktest+0x279>
    sbrk(-(sbrk(0) - oldbrk));
    2fbf:	83 ec 0c             	sub    $0xc,%esp
    2fc2:	6a 00                	push   $0x0
    2fc4:	e8 a1 09 00 00       	call   396a <sbrk>
    2fc9:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    2fcc:	29 c6                	sub    %eax,%esi
    2fce:	89 34 24             	mov    %esi,(%esp)
    2fd1:	e8 94 09 00 00       	call   396a <sbrk>
    2fd6:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    2fd9:	83 ec 08             	sub    $0x8,%esp
    2fdc:	68 bc 4c 00 00       	push   $0x4cbc
    2fe1:	ff 35 20 5f 00 00    	pushl  0x5f20
    2fe7:	e8 74 0a 00 00       	call   3a60 <printf>
}
    2fec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2fef:	5b                   	pop    %ebx
    2ff0:	5e                   	pop    %esi
    2ff1:	5f                   	pop    %edi
    2ff2:	5d                   	pop    %ebp
    2ff3:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2ff4:	83 ec 0c             	sub    $0xc,%esp
    2ff7:	6a 00                	push   $0x0
    2ff9:	e8 6c 09 00 00       	call   396a <sbrk>
    2ffe:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3003:	29 c2                	sub    %eax,%edx
    3005:	89 14 24             	mov    %edx,(%esp)
    3008:	e8 5d 09 00 00       	call   396a <sbrk>
      write(fds[1], "x", 1);
    300d:	83 c4 0c             	add    $0xc,%esp
    3010:	6a 01                	push   $0x1
    3012:	68 7d 47 00 00       	push   $0x477d
    3017:	ff 75 bc             	pushl  -0x44(%ebp)
    301a:	e8 e3 08 00 00       	call   3902 <write>
    301f:	83 c4 10             	add    $0x10,%esp
    3022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    3028:	83 ec 0c             	sub    $0xc,%esp
    302b:	68 e8 03 00 00       	push   $0x3e8
    3030:	e8 3d 09 00 00       	call   3972 <sleep>
    3035:	83 c4 10             	add    $0x10,%esp
    3038:	eb ee                	jmp    3028 <sbrktest+0x2c8>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    303a:	83 ec 0c             	sub    $0xc,%esp
    303d:	50                   	push   %eax
    303e:	53                   	push   %ebx
    303f:	57                   	push   %edi
    3040:	68 1f 4c 00 00       	push   $0x4c1f
    3045:	ff 35 20 5f 00 00    	pushl  0x5f20
    304b:	e8 10 0a 00 00       	call   3a60 <printf>
      exit();
    3050:	83 c4 20             	add    $0x20,%esp
    3053:	e8 8a 08 00 00       	call   38e2 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3058:	83 ec 08             	sub    $0x8,%esp
    305b:	68 a1 4c 00 00       	push   $0x4ca1
    3060:	ff 35 20 5f 00 00    	pushl  0x5f20
    3066:	e8 f5 09 00 00       	call   3a60 <printf>
    exit();
    306b:	e8 72 08 00 00       	call   38e2 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3070:	83 ec 08             	sub    $0x8,%esp
    3073:	68 5d 41 00 00       	push   $0x415d
    3078:	6a 01                	push   $0x1
    307a:	e8 e1 09 00 00       	call   3a60 <printf>
    exit();
    307f:	e8 5e 08 00 00       	call   38e2 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3084:	0f be 03             	movsbl (%ebx),%eax
    3087:	50                   	push   %eax
    3088:	53                   	push   %ebx
    3089:	68 88 4c 00 00       	push   $0x4c88
    308e:	ff 35 20 5f 00 00    	pushl  0x5f20
    3094:	e8 c7 09 00 00       	call   3a60 <printf>
      kill(ppid);
    3099:	89 3c 24             	mov    %edi,(%esp)
    309c:	e8 71 08 00 00       	call   3912 <kill>
      exit();
    30a1:	e8 3c 08 00 00       	call   38e2 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    30a6:	83 ec 08             	sub    $0x8,%esp
    30a9:	68 65 4d 00 00       	push   $0x4d65
    30ae:	ff 35 20 5f 00 00    	pushl  0x5f20
    30b4:	e8 a7 09 00 00       	call   3a60 <printf>
      exit();
    30b9:	e8 24 08 00 00       	call   38e2 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    30be:	50                   	push   %eax
    30bf:	53                   	push   %ebx
    30c0:	68 68 54 00 00       	push   $0x5468
    30c5:	ff 35 20 5f 00 00    	pushl  0x5f20
    30cb:	e8 90 09 00 00       	call   3a60 <printf>
    exit();
    30d0:	e8 0d 08 00 00       	call   38e2 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    30d5:	83 ec 08             	sub    $0x8,%esp
    30d8:	68 38 54 00 00       	push   $0x5438
    30dd:	ff 35 20 5f 00 00    	pushl  0x5f20
    30e3:	e8 78 09 00 00       	call   3a60 <printf>
    exit();
    30e8:	e8 f5 07 00 00       	call   38e2 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    30ed:	53                   	push   %ebx
    30ee:	57                   	push   %edi
    30ef:	68 10 54 00 00       	push   $0x5410
    30f4:	ff 35 20 5f 00 00    	pushl  0x5f20
    30fa:	e8 61 09 00 00       	call   3a60 <printf>
    exit();
    30ff:	e8 de 07 00 00       	call   38e2 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3104:	50                   	push   %eax
    3105:	53                   	push   %ebx
    3106:	68 d8 53 00 00       	push   $0x53d8
    310b:	ff 35 20 5f 00 00    	pushl  0x5f20
    3111:	e8 4a 09 00 00       	call   3a60 <printf>
    exit();
    3116:	e8 c7 07 00 00       	call   38e2 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    311b:	83 ec 08             	sub    $0x8,%esp
    311e:	68 6d 4c 00 00       	push   $0x4c6d
    3123:	ff 35 20 5f 00 00    	pushl  0x5f20
    3129:	e8 32 09 00 00       	call   3a60 <printf>
    exit();
    312e:	e8 af 07 00 00       	call   38e2 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3133:	83 ec 08             	sub    $0x8,%esp
    3136:	68 98 53 00 00       	push   $0x5398
    313b:	ff 35 20 5f 00 00    	pushl  0x5f20
    3141:	e8 1a 09 00 00       	call   3a60 <printf>
    exit();
    3146:	e8 97 07 00 00       	call   38e2 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    exit();
    314b:	e8 92 07 00 00       	call   38e2 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3150:	83 ec 08             	sub    $0x8,%esp
    3153:	68 51 4c 00 00       	push   $0x4c51
    3158:	ff 35 20 5f 00 00    	pushl  0x5f20
    315e:	e8 fd 08 00 00       	call   3a60 <printf>
    exit();
    3163:	e8 7a 07 00 00       	call   38e2 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    3168:	83 ec 08             	sub    $0x8,%esp
    316b:	68 3a 4c 00 00       	push   $0x4c3a
    3170:	ff 35 20 5f 00 00    	pushl  0x5f20
    3176:	e8 e5 08 00 00       	call   3a60 <printf>
    exit();
    317b:	e8 62 07 00 00       	call   38e2 <exit>

00003180 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    3180:	55                   	push   %ebp
    3181:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3183:	5d                   	pop    %ebp
    3184:	c3                   	ret    
    3185:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003190 <validatetest>:

void
validatetest(void)
{
    3190:	55                   	push   %ebp
    3191:	89 e5                	mov    %esp,%ebp
    3193:	56                   	push   %esi
    3194:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3195:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3197:	83 ec 08             	sub    $0x8,%esp
    319a:	68 ca 4c 00 00       	push   $0x4cca
    319f:	ff 35 20 5f 00 00    	pushl  0x5f20
    31a5:	e8 b6 08 00 00       	call   3a60 <printf>
    31aa:	83 c4 10             	add    $0x10,%esp
    31ad:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    31b0:	e8 25 07 00 00       	call   38da <fork>
    31b5:	85 c0                	test   %eax,%eax
    31b7:	89 c6                	mov    %eax,%esi
    31b9:	74 63                	je     321e <validatetest+0x8e>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    31bb:	83 ec 0c             	sub    $0xc,%esp
    31be:	6a 00                	push   $0x0
    31c0:	e8 ad 07 00 00       	call   3972 <sleep>
    sleep(0);
    31c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31cc:	e8 a1 07 00 00       	call   3972 <sleep>
    kill(pid);
    31d1:	89 34 24             	mov    %esi,(%esp)
    31d4:	e8 39 07 00 00       	call   3912 <kill>
    wait();
    31d9:	e8 0c 07 00 00       	call   38ea <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    31de:	58                   	pop    %eax
    31df:	5a                   	pop    %edx
    31e0:	53                   	push   %ebx
    31e1:	68 d9 4c 00 00       	push   $0x4cd9
    31e6:	e8 57 07 00 00       	call   3942 <link>
    31eb:	83 c4 10             	add    $0x10,%esp
    31ee:	83 f8 ff             	cmp    $0xffffffff,%eax
    31f1:	75 30                	jne    3223 <validatetest+0x93>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    31f3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31f9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31ff:	75 af                	jne    31b0 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    3201:	83 ec 08             	sub    $0x8,%esp
    3204:	68 fd 4c 00 00       	push   $0x4cfd
    3209:	ff 35 20 5f 00 00    	pushl  0x5f20
    320f:	e8 4c 08 00 00       	call   3a60 <printf>
    3214:	83 c4 10             	add    $0x10,%esp
}
    3217:	8d 65 f8             	lea    -0x8(%ebp),%esp
    321a:	5b                   	pop    %ebx
    321b:	5e                   	pop    %esi
    321c:	5d                   	pop    %ebp
    321d:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    321e:	e8 bf 06 00 00       	call   38e2 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    3223:	83 ec 08             	sub    $0x8,%esp
    3226:	68 e4 4c 00 00       	push   $0x4ce4
    322b:	ff 35 20 5f 00 00    	pushl  0x5f20
    3231:	e8 2a 08 00 00       	call   3a60 <printf>
      exit();
    3236:	e8 a7 06 00 00       	call   38e2 <exit>
    323b:	90                   	nop
    323c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003240 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3240:	55                   	push   %ebp
    3241:	89 e5                	mov    %esp,%ebp
    3243:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    3246:	68 0a 4d 00 00       	push   $0x4d0a
    324b:	ff 35 20 5f 00 00    	pushl  0x5f20
    3251:	e8 0a 08 00 00       	call   3a60 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    3256:	83 c4 10             	add    $0x10,%esp
    3259:	80 3d 00 60 00 00 00 	cmpb   $0x0,0x6000
    3260:	75 35                	jne    3297 <bsstest+0x57>
    3262:	b8 01 60 00 00       	mov    $0x6001,%eax
    3267:	89 f6                	mov    %esi,%esi
    3269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3270:	80 38 00             	cmpb   $0x0,(%eax)
    3273:	75 22                	jne    3297 <bsstest+0x57>
    3275:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3278:	3d 10 87 00 00       	cmp    $0x8710,%eax
    327d:	75 f1                	jne    3270 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    327f:	83 ec 08             	sub    $0x8,%esp
    3282:	68 25 4d 00 00       	push   $0x4d25
    3287:	ff 35 20 5f 00 00    	pushl  0x5f20
    328d:	e8 ce 07 00 00       	call   3a60 <printf>
    3292:	83 c4 10             	add    $0x10,%esp
}
    3295:	c9                   	leave  
    3296:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    3297:	83 ec 08             	sub    $0x8,%esp
    329a:	68 14 4d 00 00       	push   $0x4d14
    329f:	ff 35 20 5f 00 00    	pushl  0x5f20
    32a5:	e8 b6 07 00 00       	call   3a60 <printf>
      exit();
    32aa:	e8 33 06 00 00       	call   38e2 <exit>
    32af:	90                   	nop

000032b0 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    32b0:	55                   	push   %ebp
    32b1:	89 e5                	mov    %esp,%ebp
    32b3:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    32b6:	68 32 4d 00 00       	push   $0x4d32
    32bb:	e8 72 06 00 00       	call   3932 <unlink>
  pid = fork();
    32c0:	e8 15 06 00 00       	call   38da <fork>
  if(pid == 0){
    32c5:	83 c4 10             	add    $0x10,%esp
    32c8:	85 c0                	test   %eax,%eax
    32ca:	74 44                	je     3310 <bigargtest+0x60>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    32cc:	0f 88 c5 00 00 00    	js     3397 <bigargtest+0xe7>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    32d2:	e8 13 06 00 00       	call   38ea <wait>
  fd = open("bigarg-ok", 0);
    32d7:	83 ec 08             	sub    $0x8,%esp
    32da:	6a 00                	push   $0x0
    32dc:	68 32 4d 00 00       	push   $0x4d32
    32e1:	e8 3c 06 00 00       	call   3922 <open>
  if(fd < 0){
    32e6:	83 c4 10             	add    $0x10,%esp
    32e9:	85 c0                	test   %eax,%eax
    32eb:	0f 88 8f 00 00 00    	js     3380 <bigargtest+0xd0>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    32f1:	83 ec 0c             	sub    $0xc,%esp
    32f4:	50                   	push   %eax
    32f5:	e8 10 06 00 00       	call   390a <close>
  unlink("bigarg-ok");
    32fa:	c7 04 24 32 4d 00 00 	movl   $0x4d32,(%esp)
    3301:	e8 2c 06 00 00       	call   3932 <unlink>
    3306:	83 c4 10             	add    $0x10,%esp
}
    3309:	c9                   	leave  
    330a:	c3                   	ret    
    330b:	90                   	nop
    330c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3310:	c7 04 85 40 5f 00 00 	movl   $0x548c,0x5f40(,%eax,4)
    3317:	8c 54 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    331b:	83 c0 01             	add    $0x1,%eax
    331e:	83 f8 1f             	cmp    $0x1f,%eax
    3321:	75 ed                	jne    3310 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    3323:	51                   	push   %ecx
    3324:	51                   	push   %ecx
    3325:	68 3c 4d 00 00       	push   $0x4d3c
    332a:	ff 35 20 5f 00 00    	pushl  0x5f20
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    3330:	c7 05 bc 5f 00 00 00 	movl   $0x0,0x5fbc
    3337:	00 00 00 
    printf(stdout, "bigarg test\n");
    333a:	e8 21 07 00 00       	call   3a60 <printf>
    exec("echo", args);
    333f:	58                   	pop    %eax
    3340:	5a                   	pop    %edx
    3341:	68 40 5f 00 00       	push   $0x5f40
    3346:	68 09 3f 00 00       	push   $0x3f09
    334b:	e8 ca 05 00 00       	call   391a <exec>
    printf(stdout, "bigarg test ok\n");
    3350:	59                   	pop    %ecx
    3351:	58                   	pop    %eax
    3352:	68 49 4d 00 00       	push   $0x4d49
    3357:	ff 35 20 5f 00 00    	pushl  0x5f20
    335d:	e8 fe 06 00 00       	call   3a60 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3362:	58                   	pop    %eax
    3363:	5a                   	pop    %edx
    3364:	68 00 02 00 00       	push   $0x200
    3369:	68 32 4d 00 00       	push   $0x4d32
    336e:	e8 af 05 00 00       	call   3922 <open>
    close(fd);
    3373:	89 04 24             	mov    %eax,(%esp)
    3376:	e8 8f 05 00 00       	call   390a <close>
    exit();
    337b:	e8 62 05 00 00       	call   38e2 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    3380:	50                   	push   %eax
    3381:	50                   	push   %eax
    3382:	68 72 4d 00 00       	push   $0x4d72
    3387:	ff 35 20 5f 00 00    	pushl  0x5f20
    338d:	e8 ce 06 00 00       	call   3a60 <printf>
    exit();
    3392:	e8 4b 05 00 00       	call   38e2 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    3397:	52                   	push   %edx
    3398:	52                   	push   %edx
    3399:	68 59 4d 00 00       	push   $0x4d59
    339e:	ff 35 20 5f 00 00    	pushl  0x5f20
    33a4:	e8 b7 06 00 00       	call   3a60 <printf>
    exit();
    33a9:	e8 34 05 00 00       	call   38e2 <exit>
    33ae:	66 90                	xchg   %ax,%ax

000033b0 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    33b0:	55                   	push   %ebp
    33b1:	89 e5                	mov    %esp,%ebp
    33b3:	57                   	push   %edi
    33b4:	56                   	push   %esi
    33b5:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    33b6:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    33b8:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    33bb:	68 87 4d 00 00       	push   $0x4d87
    33c0:	6a 01                	push   $0x1
    33c2:	e8 99 06 00 00       	call   3a60 <printf>
    33c7:	83 c4 10             	add    $0x10,%esp
    33ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33d0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    33d5:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    33d7:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33d9:	f7 eb                	imul   %ebx
    33db:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    33de:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    33e0:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    33e3:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    33e7:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33eb:	c1 fa 06             	sar    $0x6,%edx
    33ee:	29 f2                	sub    %esi,%edx
    33f0:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33f3:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33f9:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33fc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3401:	29 d1                	sub    %edx,%ecx
    3403:	f7 e9                	imul   %ecx
    3405:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3408:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    340d:	c1 fa 05             	sar    $0x5,%edx
    3410:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    3412:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3417:	83 c2 30             	add    $0x30,%edx
    341a:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    341d:	f7 eb                	imul   %ebx
    341f:	c1 fa 05             	sar    $0x5,%edx
    3422:	29 f2                	sub    %esi,%edx
    3424:	6b d2 64             	imul   $0x64,%edx,%edx
    3427:	29 d7                	sub    %edx,%edi
    3429:	89 f8                	mov    %edi,%eax
    342b:	c1 ff 1f             	sar    $0x1f,%edi
    342e:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3430:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3432:	c1 fa 02             	sar    $0x2,%edx
    3435:	29 fa                	sub    %edi,%edx
    3437:	83 c2 30             	add    $0x30,%edx
    343a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    343d:	f7 e9                	imul   %ecx
    343f:	89 d9                	mov    %ebx,%ecx
    3441:	c1 fa 02             	sar    $0x2,%edx
    3444:	29 f2                	sub    %esi,%edx
    3446:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3449:	01 c0                	add    %eax,%eax
    344b:	29 c1                	sub    %eax,%ecx
    344d:	89 c8                	mov    %ecx,%eax
    344f:	83 c0 30             	add    $0x30,%eax
    3452:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3455:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3458:	50                   	push   %eax
    3459:	68 94 4d 00 00       	push   $0x4d94
    345e:	6a 01                	push   $0x1
    3460:	e8 fb 05 00 00       	call   3a60 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3465:	58                   	pop    %eax
    3466:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3469:	5a                   	pop    %edx
    346a:	68 02 02 00 00       	push   $0x202
    346f:	50                   	push   %eax
    3470:	e8 ad 04 00 00       	call   3922 <open>
    if(fd < 0){
    3475:	83 c4 10             	add    $0x10,%esp
    3478:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    347a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    347c:	78 50                	js     34ce <fsfull+0x11e>
    347e:	31 f6                	xor    %esi,%esi
    3480:	eb 08                	jmp    348a <fsfull+0xda>
    3482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3488:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    348a:	83 ec 04             	sub    $0x4,%esp
    348d:	68 00 02 00 00       	push   $0x200
    3492:	68 40 87 00 00       	push   $0x8740
    3497:	57                   	push   %edi
    3498:	e8 65 04 00 00       	call   3902 <write>
      if(cc < 512)
    349d:	83 c4 10             	add    $0x10,%esp
    34a0:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    34a5:	7f e1                	jg     3488 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    34a7:	83 ec 04             	sub    $0x4,%esp
    34aa:	56                   	push   %esi
    34ab:	68 b0 4d 00 00       	push   $0x4db0
    34b0:	6a 01                	push   $0x1
    34b2:	e8 a9 05 00 00       	call   3a60 <printf>
    close(fd);
    34b7:	89 3c 24             	mov    %edi,(%esp)
    34ba:	e8 4b 04 00 00       	call   390a <close>
    if(total == 0)
    34bf:	83 c4 10             	add    $0x10,%esp
    34c2:	85 f6                	test   %esi,%esi
    34c4:	74 22                	je     34e8 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    34c6:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    34c9:	e9 02 ff ff ff       	jmp    33d0 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    34ce:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34d1:	83 ec 04             	sub    $0x4,%esp
    34d4:	50                   	push   %eax
    34d5:	68 a0 4d 00 00       	push   $0x4da0
    34da:	6a 01                	push   $0x1
    34dc:	e8 7f 05 00 00       	call   3a60 <printf>
      break;
    34e1:	83 c4 10             	add    $0x10,%esp
    34e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34e8:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    34ed:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    34ef:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34f1:	f7 eb                	imul   %ebx
    34f3:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    34f6:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    34f8:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    34fb:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    34ff:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3503:	c1 fa 06             	sar    $0x6,%edx
    3506:	29 f2                	sub    %esi,%edx
    3508:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    350b:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3511:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3514:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3519:	29 d1                	sub    %edx,%ecx
    351b:	f7 e9                	imul   %ecx
    351d:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3520:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3525:	c1 fa 05             	sar    $0x5,%edx
    3528:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    352a:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    352f:	83 c2 30             	add    $0x30,%edx
    3532:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3535:	f7 eb                	imul   %ebx
    3537:	c1 fa 05             	sar    $0x5,%edx
    353a:	29 f2                	sub    %esi,%edx
    353c:	6b d2 64             	imul   $0x64,%edx,%edx
    353f:	29 d7                	sub    %edx,%edi
    3541:	89 f8                	mov    %edi,%eax
    3543:	c1 ff 1f             	sar    $0x1f,%edi
    3546:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3548:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    354a:	c1 fa 02             	sar    $0x2,%edx
    354d:	29 fa                	sub    %edi,%edx
    354f:	83 c2 30             	add    $0x30,%edx
    3552:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3555:	f7 e9                	imul   %ecx
    3557:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3559:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    355c:	c1 fa 02             	sar    $0x2,%edx
    355f:	29 f2                	sub    %esi,%edx
    3561:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3564:	01 c0                	add    %eax,%eax
    3566:	29 c1                	sub    %eax,%ecx
    3568:	89 c8                	mov    %ecx,%eax
    356a:	83 c0 30             	add    $0x30,%eax
    356d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    3570:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3573:	50                   	push   %eax
    3574:	e8 b9 03 00 00       	call   3932 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3579:	83 c4 10             	add    $0x10,%esp
    357c:	83 fb ff             	cmp    $0xffffffff,%ebx
    357f:	0f 85 63 ff ff ff    	jne    34e8 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3585:	83 ec 08             	sub    $0x8,%esp
    3588:	68 c0 4d 00 00       	push   $0x4dc0
    358d:	6a 01                	push   $0x1
    358f:	e8 cc 04 00 00       	call   3a60 <printf>
    3594:	83 c4 10             	add    $0x10,%esp
}
    3597:	8d 65 f4             	lea    -0xc(%ebp),%esp
    359a:	5b                   	pop    %ebx
    359b:	5e                   	pop    %esi
    359c:	5f                   	pop    %edi
    359d:	5d                   	pop    %ebp
    359e:	c3                   	ret    
    359f:	90                   	nop

000035a0 <uio>:

void
uio()
{
    35a0:	55                   	push   %ebp
    35a1:	89 e5                	mov    %esp,%ebp
    35a3:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    35a6:	68 d6 4d 00 00       	push   $0x4dd6
    35ab:	6a 01                	push   $0x1
    35ad:	e8 ae 04 00 00       	call   3a60 <printf>
  pid = fork();
    35b2:	e8 23 03 00 00       	call   38da <fork>
  if(pid == 0){
    35b7:	83 c4 10             	add    $0x10,%esp
    35ba:	85 c0                	test   %eax,%eax
    35bc:	74 1b                	je     35d9 <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    35be:	78 3a                	js     35fa <uio+0x5a>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    35c0:	e8 25 03 00 00       	call   38ea <wait>
  printf(1, "uio test done\n");
    35c5:	83 ec 08             	sub    $0x8,%esp
    35c8:	68 e0 4d 00 00       	push   $0x4de0
    35cd:	6a 01                	push   $0x1
    35cf:	e8 8c 04 00 00       	call   3a60 <printf>
    35d4:	83 c4 10             	add    $0x10,%esp
}
    35d7:	c9                   	leave  
    35d8:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    35d9:	ba 70 00 00 00       	mov    $0x70,%edx
    35de:	b8 09 00 00 00       	mov    $0x9,%eax
    35e3:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    35e4:	b2 71                	mov    $0x71,%dl
    35e6:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    35e7:	52                   	push   %edx
    35e8:	52                   	push   %edx
    35e9:	68 6c 55 00 00       	push   $0x556c
    35ee:	6a 01                	push   $0x1
    35f0:	e8 6b 04 00 00       	call   3a60 <printf>
    exit();
    35f5:	e8 e8 02 00 00       	call   38e2 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    35fa:	50                   	push   %eax
    35fb:	50                   	push   %eax
    35fc:	68 65 4d 00 00       	push   $0x4d65
    3601:	6a 01                	push   $0x1
    3603:	e8 58 04 00 00       	call   3a60 <printf>
    exit();
    3608:	e8 d5 02 00 00       	call   38e2 <exit>
    360d:	8d 76 00             	lea    0x0(%esi),%esi

00003610 <argptest>:
  wait();
  printf(1, "uio test done\n");
}

void argptest()
{
    3610:	55                   	push   %ebp
    3611:	89 e5                	mov    %esp,%ebp
    3613:	53                   	push   %ebx
    3614:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    3617:	6a 00                	push   $0x0
    3619:	68 ef 4d 00 00       	push   $0x4def
    361e:	e8 ff 02 00 00       	call   3922 <open>
  if (fd < 0) {
    3623:	83 c4 10             	add    $0x10,%esp
    3626:	85 c0                	test   %eax,%eax
}

void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
    3628:	89 c3                	mov    %eax,%ebx
  if (fd < 0) {
    362a:	78 37                	js     3663 <argptest+0x53>
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    362c:	83 ec 0c             	sub    $0xc,%esp
    362f:	6a 00                	push   $0x0
    3631:	e8 34 03 00 00       	call   396a <sbrk>
    3636:	83 c4 0c             	add    $0xc,%esp
    3639:	83 e8 01             	sub    $0x1,%eax
    363c:	6a ff                	push   $0xffffffff
    363e:	50                   	push   %eax
    363f:	53                   	push   %ebx
    3640:	e8 b5 02 00 00       	call   38fa <read>
  close(fd);
    3645:	89 1c 24             	mov    %ebx,(%esp)
    3648:	e8 bd 02 00 00       	call   390a <close>
  printf(1, "arg test passed\n");
    364d:	58                   	pop    %eax
    364e:	5a                   	pop    %edx
    364f:	68 01 4e 00 00       	push   $0x4e01
    3654:	6a 01                	push   $0x1
    3656:	e8 05 04 00 00       	call   3a60 <printf>
    365b:	83 c4 10             	add    $0x10,%esp
}
    365e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3661:	c9                   	leave  
    3662:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3663:	51                   	push   %ecx
    3664:	51                   	push   %ecx
    3665:	68 f4 4d 00 00       	push   $0x4df4
    366a:	6a 02                	push   $0x2
    366c:	e8 ef 03 00 00       	call   3a60 <printf>
    exit();
    3671:	e8 6c 02 00 00       	call   38e2 <exit>
    3676:	8d 76 00             	lea    0x0(%esi),%esi
    3679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003680 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3680:	69 05 1c 5f 00 00 0d 	imul   $0x19660d,0x5f1c,%eax
    3687:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    368a:	55                   	push   %ebp
    368b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    368d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    368e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3693:	a3 1c 5f 00 00       	mov    %eax,0x5f1c
  return randstate;
}
    3698:	c3                   	ret    
    3699:	66 90                	xchg   %ax,%ax
    369b:	66 90                	xchg   %ax,%ax
    369d:	66 90                	xchg   %ax,%ax
    369f:	90                   	nop

000036a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    36a0:	55                   	push   %ebp
    36a1:	89 e5                	mov    %esp,%ebp
    36a3:	53                   	push   %ebx
    36a4:	8b 45 08             	mov    0x8(%ebp),%eax
    36a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    36aa:	89 c2                	mov    %eax,%edx
    36ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    36b0:	83 c1 01             	add    $0x1,%ecx
    36b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    36b7:	83 c2 01             	add    $0x1,%edx
    36ba:	84 db                	test   %bl,%bl
    36bc:	88 5a ff             	mov    %bl,-0x1(%edx)
    36bf:	75 ef                	jne    36b0 <strcpy+0x10>
    ;
  return os;
}
    36c1:	5b                   	pop    %ebx
    36c2:	5d                   	pop    %ebp
    36c3:	c3                   	ret    
    36c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000036d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    36d0:	55                   	push   %ebp
    36d1:	89 e5                	mov    %esp,%ebp
    36d3:	56                   	push   %esi
    36d4:	53                   	push   %ebx
    36d5:	8b 55 08             	mov    0x8(%ebp),%edx
    36d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    36db:	0f b6 02             	movzbl (%edx),%eax
    36de:	0f b6 19             	movzbl (%ecx),%ebx
    36e1:	84 c0                	test   %al,%al
    36e3:	75 1e                	jne    3703 <strcmp+0x33>
    36e5:	eb 29                	jmp    3710 <strcmp+0x40>
    36e7:	89 f6                	mov    %esi,%esi
    36e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    36f0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    36f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    36f6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    36f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    36fd:	84 c0                	test   %al,%al
    36ff:	74 0f                	je     3710 <strcmp+0x40>
    3701:	89 f1                	mov    %esi,%ecx
    3703:	38 d8                	cmp    %bl,%al
    3705:	74 e9                	je     36f0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3707:	29 d8                	sub    %ebx,%eax
}
    3709:	5b                   	pop    %ebx
    370a:	5e                   	pop    %esi
    370b:	5d                   	pop    %ebp
    370c:	c3                   	ret    
    370d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3710:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3712:	29 d8                	sub    %ebx,%eax
}
    3714:	5b                   	pop    %ebx
    3715:	5e                   	pop    %esi
    3716:	5d                   	pop    %ebp
    3717:	c3                   	ret    
    3718:	90                   	nop
    3719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003720 <strlen>:

uint
strlen(char *s)
{
    3720:	55                   	push   %ebp
    3721:	89 e5                	mov    %esp,%ebp
    3723:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3726:	80 39 00             	cmpb   $0x0,(%ecx)
    3729:	74 12                	je     373d <strlen+0x1d>
    372b:	31 d2                	xor    %edx,%edx
    372d:	8d 76 00             	lea    0x0(%esi),%esi
    3730:	83 c2 01             	add    $0x1,%edx
    3733:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3737:	89 d0                	mov    %edx,%eax
    3739:	75 f5                	jne    3730 <strlen+0x10>
    ;
  return n;
}
    373b:	5d                   	pop    %ebp
    373c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    373d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    373f:	5d                   	pop    %ebp
    3740:	c3                   	ret    
    3741:	eb 0d                	jmp    3750 <memset>
    3743:	90                   	nop
    3744:	90                   	nop
    3745:	90                   	nop
    3746:	90                   	nop
    3747:	90                   	nop
    3748:	90                   	nop
    3749:	90                   	nop
    374a:	90                   	nop
    374b:	90                   	nop
    374c:	90                   	nop
    374d:	90                   	nop
    374e:	90                   	nop
    374f:	90                   	nop

00003750 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3750:	55                   	push   %ebp
    3751:	89 e5                	mov    %esp,%ebp
    3753:	57                   	push   %edi
    3754:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3757:	8b 4d 10             	mov    0x10(%ebp),%ecx
    375a:	8b 45 0c             	mov    0xc(%ebp),%eax
    375d:	89 d7                	mov    %edx,%edi
    375f:	fc                   	cld    
    3760:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3762:	89 d0                	mov    %edx,%eax
    3764:	5f                   	pop    %edi
    3765:	5d                   	pop    %ebp
    3766:	c3                   	ret    
    3767:	89 f6                	mov    %esi,%esi
    3769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003770 <strchr>:

char*
strchr(const char *s, char c)
{
    3770:	55                   	push   %ebp
    3771:	89 e5                	mov    %esp,%ebp
    3773:	53                   	push   %ebx
    3774:	8b 45 08             	mov    0x8(%ebp),%eax
    3777:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    377a:	0f b6 18             	movzbl (%eax),%ebx
    377d:	84 db                	test   %bl,%bl
    377f:	74 1d                	je     379e <strchr+0x2e>
    if(*s == c)
    3781:	38 d3                	cmp    %dl,%bl
    3783:	89 d1                	mov    %edx,%ecx
    3785:	75 0d                	jne    3794 <strchr+0x24>
    3787:	eb 17                	jmp    37a0 <strchr+0x30>
    3789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3790:	38 ca                	cmp    %cl,%dl
    3792:	74 0c                	je     37a0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3794:	83 c0 01             	add    $0x1,%eax
    3797:	0f b6 10             	movzbl (%eax),%edx
    379a:	84 d2                	test   %dl,%dl
    379c:	75 f2                	jne    3790 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    379e:	31 c0                	xor    %eax,%eax
}
    37a0:	5b                   	pop    %ebx
    37a1:	5d                   	pop    %ebp
    37a2:	c3                   	ret    
    37a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    37a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037b0 <gets>:

char*
gets(char *buf, int max)
{
    37b0:	55                   	push   %ebp
    37b1:	89 e5                	mov    %esp,%ebp
    37b3:	57                   	push   %edi
    37b4:	56                   	push   %esi
    37b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37b6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    37b8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    37bb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37be:	eb 29                	jmp    37e9 <gets+0x39>
    cc = read(0, &c, 1);
    37c0:	83 ec 04             	sub    $0x4,%esp
    37c3:	6a 01                	push   $0x1
    37c5:	57                   	push   %edi
    37c6:	6a 00                	push   $0x0
    37c8:	e8 2d 01 00 00       	call   38fa <read>
    if(cc < 1)
    37cd:	83 c4 10             	add    $0x10,%esp
    37d0:	85 c0                	test   %eax,%eax
    37d2:	7e 1d                	jle    37f1 <gets+0x41>
      break;
    buf[i++] = c;
    37d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    37d8:	8b 55 08             	mov    0x8(%ebp),%edx
    37db:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    37dd:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    37df:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    37e3:	74 1b                	je     3800 <gets+0x50>
    37e5:	3c 0a                	cmp    $0xa,%al
    37e7:	74 17                	je     3800 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37e9:	8d 5e 01             	lea    0x1(%esi),%ebx
    37ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    37ef:	7c cf                	jl     37c0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    37f1:	8b 45 08             	mov    0x8(%ebp),%eax
    37f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    37f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37fb:	5b                   	pop    %ebx
    37fc:	5e                   	pop    %esi
    37fd:	5f                   	pop    %edi
    37fe:	5d                   	pop    %ebp
    37ff:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3800:	8b 45 08             	mov    0x8(%ebp),%eax
    3803:	89 de                	mov    %ebx,%esi
    3805:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3809:	8d 65 f4             	lea    -0xc(%ebp),%esp
    380c:	5b                   	pop    %ebx
    380d:	5e                   	pop    %esi
    380e:	5f                   	pop    %edi
    380f:	5d                   	pop    %ebp
    3810:	c3                   	ret    
    3811:	eb 0d                	jmp    3820 <stat>
    3813:	90                   	nop
    3814:	90                   	nop
    3815:	90                   	nop
    3816:	90                   	nop
    3817:	90                   	nop
    3818:	90                   	nop
    3819:	90                   	nop
    381a:	90                   	nop
    381b:	90                   	nop
    381c:	90                   	nop
    381d:	90                   	nop
    381e:	90                   	nop
    381f:	90                   	nop

00003820 <stat>:

int
stat(char *n, struct stat *st)
{
    3820:	55                   	push   %ebp
    3821:	89 e5                	mov    %esp,%ebp
    3823:	56                   	push   %esi
    3824:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3825:	83 ec 08             	sub    $0x8,%esp
    3828:	6a 00                	push   $0x0
    382a:	ff 75 08             	pushl  0x8(%ebp)
    382d:	e8 f0 00 00 00       	call   3922 <open>
  if(fd < 0)
    3832:	83 c4 10             	add    $0x10,%esp
    3835:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3837:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    3839:	78 25                	js     3860 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    383b:	83 ec 08             	sub    $0x8,%esp
    383e:	ff 75 0c             	pushl  0xc(%ebp)
    3841:	50                   	push   %eax
    3842:	e8 f3 00 00 00       	call   393a <fstat>
    3847:	89 c6                	mov    %eax,%esi
  close(fd);
    3849:	89 1c 24             	mov    %ebx,(%esp)
    384c:	e8 b9 00 00 00       	call   390a <close>
  return r;
    3851:	83 c4 10             	add    $0x10,%esp
    3854:	89 f0                	mov    %esi,%eax
}
    3856:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3859:	5b                   	pop    %ebx
    385a:	5e                   	pop    %esi
    385b:	5d                   	pop    %ebp
    385c:	c3                   	ret    
    385d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3860:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3865:	eb ef                	jmp    3856 <stat+0x36>
    3867:	89 f6                	mov    %esi,%esi
    3869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003870 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    3870:	55                   	push   %ebp
    3871:	89 e5                	mov    %esp,%ebp
    3873:	53                   	push   %ebx
    3874:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3877:	0f be 11             	movsbl (%ecx),%edx
    387a:	8d 42 d0             	lea    -0x30(%edx),%eax
    387d:	3c 09                	cmp    $0x9,%al
    387f:	b8 00 00 00 00       	mov    $0x0,%eax
    3884:	77 1f                	ja     38a5 <atoi+0x35>
    3886:	8d 76 00             	lea    0x0(%esi),%esi
    3889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3890:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3893:	83 c1 01             	add    $0x1,%ecx
    3896:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    389a:	0f be 11             	movsbl (%ecx),%edx
    389d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    38a0:	80 fb 09             	cmp    $0x9,%bl
    38a3:	76 eb                	jbe    3890 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    38a5:	5b                   	pop    %ebx
    38a6:	5d                   	pop    %ebp
    38a7:	c3                   	ret    
    38a8:	90                   	nop
    38a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000038b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    38b0:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38b1:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    38b3:	89 e5                	mov    %esp,%ebp
    38b5:	56                   	push   %esi
    38b6:	53                   	push   %ebx
    38b7:	8b 5d 10             	mov    0x10(%ebp),%ebx
    38ba:	8b 45 08             	mov    0x8(%ebp),%eax
    38bd:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38c0:	85 db                	test   %ebx,%ebx
    38c2:	7e 12                	jle    38d6 <memmove+0x26>
    38c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    38c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    38cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    38cf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38d2:	39 da                	cmp    %ebx,%edx
    38d4:	75 f2                	jne    38c8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    38d6:	5b                   	pop    %ebx
    38d7:	5e                   	pop    %esi
    38d8:	5d                   	pop    %ebp
    38d9:	c3                   	ret    

000038da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    38da:	b8 01 00 00 00       	mov    $0x1,%eax
    38df:	cd 40                	int    $0x40
    38e1:	c3                   	ret    

000038e2 <exit>:
SYSCALL(exit)
    38e2:	b8 02 00 00 00       	mov    $0x2,%eax
    38e7:	cd 40                	int    $0x40
    38e9:	c3                   	ret    

000038ea <wait>:
SYSCALL(wait)
    38ea:	b8 03 00 00 00       	mov    $0x3,%eax
    38ef:	cd 40                	int    $0x40
    38f1:	c3                   	ret    

000038f2 <pipe>:
SYSCALL(pipe)
    38f2:	b8 04 00 00 00       	mov    $0x4,%eax
    38f7:	cd 40                	int    $0x40
    38f9:	c3                   	ret    

000038fa <read>:
SYSCALL(read)
    38fa:	b8 05 00 00 00       	mov    $0x5,%eax
    38ff:	cd 40                	int    $0x40
    3901:	c3                   	ret    

00003902 <write>:
SYSCALL(write)
    3902:	b8 10 00 00 00       	mov    $0x10,%eax
    3907:	cd 40                	int    $0x40
    3909:	c3                   	ret    

0000390a <close>:
SYSCALL(close)
    390a:	b8 15 00 00 00       	mov    $0x15,%eax
    390f:	cd 40                	int    $0x40
    3911:	c3                   	ret    

00003912 <kill>:
SYSCALL(kill)
    3912:	b8 06 00 00 00       	mov    $0x6,%eax
    3917:	cd 40                	int    $0x40
    3919:	c3                   	ret    

0000391a <exec>:
SYSCALL(exec)
    391a:	b8 07 00 00 00       	mov    $0x7,%eax
    391f:	cd 40                	int    $0x40
    3921:	c3                   	ret    

00003922 <open>:
SYSCALL(open)
    3922:	b8 0f 00 00 00       	mov    $0xf,%eax
    3927:	cd 40                	int    $0x40
    3929:	c3                   	ret    

0000392a <mknod>:
SYSCALL(mknod)
    392a:	b8 11 00 00 00       	mov    $0x11,%eax
    392f:	cd 40                	int    $0x40
    3931:	c3                   	ret    

00003932 <unlink>:
SYSCALL(unlink)
    3932:	b8 12 00 00 00       	mov    $0x12,%eax
    3937:	cd 40                	int    $0x40
    3939:	c3                   	ret    

0000393a <fstat>:
SYSCALL(fstat)
    393a:	b8 08 00 00 00       	mov    $0x8,%eax
    393f:	cd 40                	int    $0x40
    3941:	c3                   	ret    

00003942 <link>:
SYSCALL(link)
    3942:	b8 13 00 00 00       	mov    $0x13,%eax
    3947:	cd 40                	int    $0x40
    3949:	c3                   	ret    

0000394a <mkdir>:
SYSCALL(mkdir)
    394a:	b8 14 00 00 00       	mov    $0x14,%eax
    394f:	cd 40                	int    $0x40
    3951:	c3                   	ret    

00003952 <chdir>:
SYSCALL(chdir)
    3952:	b8 09 00 00 00       	mov    $0x9,%eax
    3957:	cd 40                	int    $0x40
    3959:	c3                   	ret    

0000395a <dup>:
SYSCALL(dup)
    395a:	b8 0a 00 00 00       	mov    $0xa,%eax
    395f:	cd 40                	int    $0x40
    3961:	c3                   	ret    

00003962 <getpid>:
SYSCALL(getpid)
    3962:	b8 0b 00 00 00       	mov    $0xb,%eax
    3967:	cd 40                	int    $0x40
    3969:	c3                   	ret    

0000396a <sbrk>:
SYSCALL(sbrk)
    396a:	b8 0c 00 00 00       	mov    $0xc,%eax
    396f:	cd 40                	int    $0x40
    3971:	c3                   	ret    

00003972 <sleep>:
SYSCALL(sleep)
    3972:	b8 0d 00 00 00       	mov    $0xd,%eax
    3977:	cd 40                	int    $0x40
    3979:	c3                   	ret    

0000397a <uptime>:
SYSCALL(uptime)
    397a:	b8 0e 00 00 00       	mov    $0xe,%eax
    397f:	cd 40                	int    $0x40
    3981:	c3                   	ret    

00003982 <set_priority>:
// jump to syscall routine I create
// uses trap instruction 'int' in x86 asm
SYSCALL(set_priority)
    3982:	b8 16 00 00 00       	mov    $0x16,%eax
    3987:	cd 40                	int    $0x40
    3989:	c3                   	ret    

0000398a <get_priority>:
SYSCALL(get_priority)
    398a:	b8 17 00 00 00       	mov    $0x17,%eax
    398f:	cd 40                	int    $0x40
    3991:	c3                   	ret    

00003992 <cps>:
SYSCALL(cps)
    3992:	b8 18 00 00 00       	mov    $0x18,%eax
    3997:	cd 40                	int    $0x40
    3999:	c3                   	ret    

0000399a <thread_create>:
SYSCALL(thread_create)
    399a:	b8 19 00 00 00       	mov    $0x19,%eax
    399f:	cd 40                	int    $0x40
    39a1:	c3                   	ret    

000039a2 <thread_exit>:
SYSCALL(thread_exit)
    39a2:	b8 1a 00 00 00       	mov    $0x1a,%eax
    39a7:	cd 40                	int    $0x40
    39a9:	c3                   	ret    

000039aa <thread_join>:
SYSCALL(thread_join)
    39aa:	b8 1b 00 00 00       	mov    $0x1b,%eax
    39af:	cd 40                	int    $0x40
    39b1:	c3                   	ret    

000039b2 <getNumFreePages>:
SYSCALL(getNumFreePages)
    39b2:	b8 1c 00 00 00       	mov    $0x1c,%eax
    39b7:	cd 40                	int    $0x40
    39b9:	c3                   	ret    
    39ba:	66 90                	xchg   %ax,%ax
    39bc:	66 90                	xchg   %ax,%ax
    39be:	66 90                	xchg   %ax,%ax

000039c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    39c0:	55                   	push   %ebp
    39c1:	89 e5                	mov    %esp,%ebp
    39c3:	57                   	push   %edi
    39c4:	56                   	push   %esi
    39c5:	53                   	push   %ebx
    39c6:	89 c7                	mov    %eax,%edi
    39c8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    39cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    39ce:	85 db                	test   %ebx,%ebx
    39d0:	74 76                	je     3a48 <printint+0x88>
    39d2:	89 d0                	mov    %edx,%eax
    39d4:	c1 e8 1f             	shr    $0x1f,%eax
    39d7:	84 c0                	test   %al,%al
    39d9:	74 6d                	je     3a48 <printint+0x88>
    neg = 1;
    x = -xx;
    39db:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    39dd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    39e4:	f7 d8                	neg    %eax
    39e6:	8d 75 d7             	lea    -0x29(%ebp),%esi
  } else {
    x = xx;
  }

  i = 0;
    39e9:	31 db                	xor    %ebx,%ebx
    39eb:	90                   	nop
    39ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    39f0:	31 d2                	xor    %edx,%edx
    39f2:	83 c3 01             	add    $0x1,%ebx
    39f5:	f7 f1                	div    %ecx
    39f7:	0f b6 92 c3 55 00 00 	movzbl 0x55c3(%edx),%edx
  }while((x /= base) != 0);
    39fe:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3a00:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    3a03:	75 eb                	jne    39f0 <printint+0x30>
  if(neg)
    3a05:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3a08:	89 d8                	mov    %ebx,%eax
  }while((x /= base) != 0);
  if(neg)
    3a0a:	85 d2                	test   %edx,%edx
    3a0c:	74 08                	je     3a16 <printint+0x56>
    buf[i++] = '-';
    3a0e:	83 c3 01             	add    $0x1,%ebx
    3a11:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
    3a16:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
    3a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3a20:	0f b6 03             	movzbl (%ebx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a23:	83 ec 04             	sub    $0x4,%esp
    3a26:	83 eb 01             	sub    $0x1,%ebx
    3a29:	6a 01                	push   $0x1
    3a2b:	56                   	push   %esi
    3a2c:	57                   	push   %edi
    3a2d:	88 45 d7             	mov    %al,-0x29(%ebp)
    3a30:	e8 cd fe ff ff       	call   3902 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3a35:	83 c4 10             	add    $0x10,%esp
    3a38:	39 f3                	cmp    %esi,%ebx
    3a3a:	75 e4                	jne    3a20 <printint+0x60>
    putc(fd, buf[i]);
}
    3a3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a3f:	5b                   	pop    %ebx
    3a40:	5e                   	pop    %esi
    3a41:	5f                   	pop    %edi
    3a42:	5d                   	pop    %ebp
    3a43:	c3                   	ret    
    3a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3a48:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3a4a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3a51:	eb 93                	jmp    39e6 <printint+0x26>
    3a53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003a60 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a60:	55                   	push   %ebp
    3a61:	89 e5                	mov    %esp,%ebp
    3a63:	57                   	push   %edi
    3a64:	56                   	push   %esi
    3a65:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a66:	8d 45 10             	lea    0x10(%ebp),%eax
    3a69:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a6b:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a6e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a71:	8b 75 08             	mov    0x8(%ebp),%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a74:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3a77:	0f b6 13             	movzbl (%ebx),%edx
    3a7a:	83 c3 01             	add    $0x1,%ebx
    3a7d:	84 d2                	test   %dl,%dl
    3a7f:	75 38                	jne    3ab9 <printf+0x59>
    3a81:	e9 b2 00 00 00       	jmp    3b38 <printf+0xd8>
    3a86:	8d 76 00             	lea    0x0(%esi),%esi
    3a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a90:	83 fa 25             	cmp    $0x25,%edx
    3a93:	0f 84 a7 00 00 00    	je     3b40 <printf+0xe0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a99:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3a9c:	83 ec 04             	sub    $0x4,%esp
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    3a9f:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3aa2:	6a 01                	push   $0x1
    3aa4:	50                   	push   %eax
    3aa5:	56                   	push   %esi
    3aa6:	e8 57 fe ff ff       	call   3902 <write>
    3aab:	83 c4 10             	add    $0x10,%esp
    3aae:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ab1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    3ab5:	84 d2                	test   %dl,%dl
    3ab7:	74 7f                	je     3b38 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
    3ab9:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3abb:	0f be c2             	movsbl %dl,%eax
    3abe:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
    3ac1:	74 cd                	je     3a90 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3ac3:	83 ff 25             	cmp    $0x25,%edi
    3ac6:	75 e6                	jne    3aae <printf+0x4e>
      if(c == 'd'){
    3ac8:	83 fa 64             	cmp    $0x64,%edx
    3acb:	0f 84 17 01 00 00    	je     3be8 <printf+0x188>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3ad1:	25 f7 00 00 00       	and    $0xf7,%eax
    3ad6:	83 f8 70             	cmp    $0x70,%eax
    3ad9:	74 75                	je     3b50 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3adb:	83 fa 73             	cmp    $0x73,%edx
    3ade:	0f 84 9c 00 00 00    	je     3b80 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3ae4:	83 fa 63             	cmp    $0x63,%edx
    3ae7:	0f 84 0a 01 00 00    	je     3bf7 <printf+0x197>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3aed:	83 fa 25             	cmp    $0x25,%edx
    3af0:	0f 84 da 00 00 00    	je     3bd0 <printf+0x170>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3af6:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3af9:	83 ec 04             	sub    $0x4,%esp
    3afc:	89 55 d0             	mov    %edx,-0x30(%ebp)
    3aff:	6a 01                	push   $0x1
    3b01:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    3b05:	50                   	push   %eax
    3b06:	56                   	push   %esi
    3b07:	e8 f6 fd ff ff       	call   3902 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    3b0c:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b0f:	83 c4 0c             	add    $0xc,%esp
    3b12:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3b15:	6a 01                	push   $0x1
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    3b17:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b1a:	50                   	push   %eax
    3b1b:	56                   	push   %esi
    3b1c:	83 c3 01             	add    $0x1,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b1f:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b21:	e8 dc fd ff ff       	call   3902 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b26:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b2a:	83 c4 10             	add    $0x10,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b2d:	84 d2                	test   %dl,%dl
    3b2f:	75 88                	jne    3ab9 <printf+0x59>
    3b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3b38:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3b3b:	5b                   	pop    %ebx
    3b3c:	5e                   	pop    %esi
    3b3d:	5f                   	pop    %edi
    3b3e:	5d                   	pop    %ebp
    3b3f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    3b40:	bf 25 00 00 00       	mov    $0x25,%edi
    3b45:	e9 64 ff ff ff       	jmp    3aae <printf+0x4e>
    3b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3b50:	83 ec 0c             	sub    $0xc,%esp
    3b53:	b9 10 00 00 00       	mov    $0x10,%ecx
    3b58:	6a 00                	push   $0x0
    3b5a:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    3b5d:	89 f0                	mov    %esi,%eax
    3b5f:	8b 17                	mov    (%edi),%edx
    3b61:	e8 5a fe ff ff       	call   39c0 <printint>
        ap++;
    3b66:	89 f8                	mov    %edi,%eax
    3b68:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b6b:	31 ff                	xor    %edi,%edi
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    3b6d:	83 c0 04             	add    $0x4,%eax
    3b70:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3b73:	e9 36 ff ff ff       	jmp    3aae <printf+0x4e>
    3b78:	90                   	nop
    3b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3b80:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3b83:	8b 38                	mov    (%eax),%edi
        ap++;
    3b85:	83 c0 04             	add    $0x4,%eax
    3b88:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    3b8b:	85 ff                	test   %edi,%edi
    3b8d:	0f 84 80 00 00 00    	je     3c13 <printf+0x1b3>
          s = "(null)";
        while(*s != 0){
    3b93:	0f b6 07             	movzbl (%edi),%eax
    3b96:	84 c0                	test   %al,%al
    3b98:	74 25                	je     3bbf <printf+0x15f>
    3b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3ba0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ba3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3ba6:	83 ec 04             	sub    $0x4,%esp
    3ba9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    3bab:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bae:	50                   	push   %eax
    3baf:	56                   	push   %esi
    3bb0:	e8 4d fd ff ff       	call   3902 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3bb5:	0f b6 07             	movzbl (%edi),%eax
    3bb8:	83 c4 10             	add    $0x10,%esp
    3bbb:	84 c0                	test   %al,%al
    3bbd:	75 e1                	jne    3ba0 <printf+0x140>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3bbf:	31 ff                	xor    %edi,%edi
    3bc1:	e9 e8 fe ff ff       	jmp    3aae <printf+0x4e>
    3bc6:	8d 76 00             	lea    0x0(%esi),%esi
    3bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bd0:	83 ec 04             	sub    $0x4,%esp
    3bd3:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    3bd7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3bda:	6a 01                	push   $0x1
    3bdc:	e9 39 ff ff ff       	jmp    3b1a <printf+0xba>
    3be1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3be8:	83 ec 0c             	sub    $0xc,%esp
    3beb:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3bf0:	6a 01                	push   $0x1
    3bf2:	e9 63 ff ff ff       	jmp    3b5a <printf+0xfa>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3bf7:	8b 7d d4             	mov    -0x2c(%ebp),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bfa:	83 ec 04             	sub    $0x4,%esp
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3bfd:	8b 07                	mov    (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bff:	6a 01                	push   $0x1
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3c01:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c04:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3c07:	50                   	push   %eax
    3c08:	56                   	push   %esi
    3c09:	e8 f4 fc ff ff       	call   3902 <write>
    3c0e:	e9 53 ff ff ff       	jmp    3b66 <printf+0x106>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    3c13:	bf bc 55 00 00       	mov    $0x55bc,%edi
    3c18:	e9 76 ff ff ff       	jmp    3b93 <printf+0x133>
    3c1d:	66 90                	xchg   %ax,%ax
    3c1f:	90                   	nop

00003c20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c20:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c21:	a1 c0 5f 00 00       	mov    0x5fc0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c26:	89 e5                	mov    %esp,%ebp
    3c28:	57                   	push   %edi
    3c29:	56                   	push   %esi
    3c2a:	53                   	push   %ebx
    3c2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3c2e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    3c31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c38:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c3a:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c3c:	73 32                	jae    3c70 <free+0x50>
    3c3e:	39 d1                	cmp    %edx,%ecx
    3c40:	72 04                	jb     3c46 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c42:	39 d0                	cmp    %edx,%eax
    3c44:	72 32                	jb     3c78 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c46:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3c49:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3c4c:	39 d7                	cmp    %edx,%edi
    3c4e:	74 2c                	je     3c7c <free+0x5c>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3c50:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3c53:	8b 50 04             	mov    0x4(%eax),%edx
    3c56:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c59:	39 f1                	cmp    %esi,%ecx
    3c5b:	74 36                	je     3c93 <free+0x73>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3c5d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3c5f:	a3 c0 5f 00 00       	mov    %eax,0x5fc0
}
    3c64:	5b                   	pop    %ebx
    3c65:	5e                   	pop    %esi
    3c66:	5f                   	pop    %edi
    3c67:	5d                   	pop    %ebp
    3c68:	c3                   	ret    
    3c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c70:	39 d0                	cmp    %edx,%eax
    3c72:	72 04                	jb     3c78 <free+0x58>
    3c74:	39 d1                	cmp    %edx,%ecx
    3c76:	72 ce                	jb     3c46 <free+0x26>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c78:	89 d0                	mov    %edx,%eax
    3c7a:	eb bc                	jmp    3c38 <free+0x18>
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    3c7c:	03 72 04             	add    0x4(%edx),%esi
    3c7f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3c82:	8b 10                	mov    (%eax),%edx
    3c84:	8b 12                	mov    (%edx),%edx
    3c86:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3c89:	8b 50 04             	mov    0x4(%eax),%edx
    3c8c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c8f:	39 f1                	cmp    %esi,%ecx
    3c91:	75 ca                	jne    3c5d <free+0x3d>
    p->s.size += bp->s.size;
    3c93:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3c96:	a3 c0 5f 00 00       	mov    %eax,0x5fc0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3c9b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3c9e:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3ca1:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3ca3:	5b                   	pop    %ebx
    3ca4:	5e                   	pop    %esi
    3ca5:	5f                   	pop    %edi
    3ca6:	5d                   	pop    %ebp
    3ca7:	c3                   	ret    
    3ca8:	90                   	nop
    3ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003cb0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3cb0:	55                   	push   %ebp
    3cb1:	89 e5                	mov    %esp,%ebp
    3cb3:	57                   	push   %edi
    3cb4:	56                   	push   %esi
    3cb5:	53                   	push   %ebx
    3cb6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3cb9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3cbc:	8b 15 c0 5f 00 00    	mov    0x5fc0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3cc2:	8d 70 07             	lea    0x7(%eax),%esi
    3cc5:	c1 ee 03             	shr    $0x3,%esi
    3cc8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    3ccb:	85 d2                	test   %edx,%edx
    3ccd:	0f 84 a3 00 00 00    	je     3d76 <malloc+0xc6>
    3cd3:	8b 02                	mov    (%edx),%eax
    3cd5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3cd8:	39 ce                	cmp    %ecx,%esi
    3cda:	76 64                	jbe    3d40 <malloc+0x90>
    3cdc:	8d 1c f5 00 00 00 00 	lea    0x0(,%esi,8),%ebx
    3ce3:	eb 0c                	jmp    3cf1 <malloc+0x41>
    3ce5:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3ce8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3cea:	8b 48 04             	mov    0x4(%eax),%ecx
    3ced:	39 ce                	cmp    %ecx,%esi
    3cef:	76 4f                	jbe    3d40 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3cf1:	3b 05 c0 5f 00 00    	cmp    0x5fc0,%eax
    3cf7:	89 c2                	mov    %eax,%edx
    3cf9:	75 ed                	jne    3ce8 <malloc+0x38>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    3cfb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
    3d01:	77 5d                	ja     3d60 <malloc+0xb0>
    3d03:	b8 00 80 00 00       	mov    $0x8000,%eax
    nu = 4096;
    3d08:	bf 00 10 00 00       	mov    $0x1000,%edi
  p = sbrk(nu * sizeof(Header));
    3d0d:	83 ec 0c             	sub    $0xc,%esp
    3d10:	50                   	push   %eax
    3d11:	e8 54 fc ff ff       	call   396a <sbrk>
  if(p == (char*)-1)
    3d16:	83 c4 10             	add    $0x10,%esp
    3d19:	83 f8 ff             	cmp    $0xffffffff,%eax
    3d1c:	74 1c                	je     3d3a <malloc+0x8a>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3d1e:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    3d21:	83 ec 0c             	sub    $0xc,%esp
    3d24:	83 c0 08             	add    $0x8,%eax
    3d27:	50                   	push   %eax
    3d28:	e8 f3 fe ff ff       	call   3c20 <free>
  return freep;
    3d2d:	8b 15 c0 5f 00 00    	mov    0x5fc0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    3d33:	83 c4 10             	add    $0x10,%esp
    3d36:	85 d2                	test   %edx,%edx
    3d38:	75 ae                	jne    3ce8 <malloc+0x38>
        return 0;
    3d3a:	31 c0                	xor    %eax,%eax
    3d3c:	eb 1a                	jmp    3d58 <malloc+0xa8>
    3d3e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3d40:	39 ce                	cmp    %ecx,%esi
    3d42:	74 2c                	je     3d70 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3d44:	29 f1                	sub    %esi,%ecx
    3d46:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3d49:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3d4c:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
    3d4f:	89 15 c0 5f 00 00    	mov    %edx,0x5fc0
      return (void*)(p + 1);
    3d55:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3d58:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3d5b:	5b                   	pop    %ebx
    3d5c:	5e                   	pop    %esi
    3d5d:	5f                   	pop    %edi
    3d5e:	5d                   	pop    %ebp
    3d5f:	c3                   	ret    
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    3d60:	89 d8                	mov    %ebx,%eax
    3d62:	89 f7                	mov    %esi,%edi
    3d64:	eb a7                	jmp    3d0d <malloc+0x5d>
    3d66:	8d 76 00             	lea    0x0(%esi),%esi
    3d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3d70:	8b 08                	mov    (%eax),%ecx
    3d72:	89 0a                	mov    %ecx,(%edx)
    3d74:	eb d9                	jmp    3d4f <malloc+0x9f>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3d76:	c7 05 c0 5f 00 00 c4 	movl   $0x5fc4,0x5fc0
    3d7d:	5f 00 00 
    3d80:	c7 05 c4 5f 00 00 c4 	movl   $0x5fc4,0x5fc4
    3d87:	5f 00 00 
    base.s.size = 0;
    3d8a:	b8 c4 5f 00 00       	mov    $0x5fc4,%eax
    3d8f:	c7 05 c8 5f 00 00 00 	movl   $0x0,0x5fc8
    3d96:	00 00 00 
    3d99:	e9 3e ff ff ff       	jmp    3cdc <malloc+0x2c>
    3d9e:	66 90                	xchg   %ax,%ax

00003da0 <lock_init>:
  // the xchg function swaps the values of two variables
  // this primitive operation serves as the locking mechanism
  return result;
}

int lock_init(struct lock_t *lk) { 
    3da0:	55                   	push   %ebp
    3da1:	89 e5                	mov    %esp,%ebp
    3da3:	8b 45 08             	mov    0x8(%ebp),%eax
  // initialize the lock
  if (lk) {
    3da6:	85 c0                	test   %eax,%eax
    3da8:	74 0d                	je     3db7 <lock_init+0x17>
    lk->lock = 0;
    3daa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    return 1;
    3db0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    // just return an error, if lock ref is null
    return -1; 
  }
}
    3db5:	5d                   	pop    %ebp
    3db6:	c3                   	ret    
  if (lk) {
    lk->lock = 0;
    return 1;
  } else {
    // just return an error, if lock ref is null
    return -1; 
    3db7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
    3dbc:	5d                   	pop    %ebp
    3dbd:	c3                   	ret    
    3dbe:	66 90                	xchg   %ax,%ax

00003dc0 <lock_acquire>:

int lock_acquire(struct lock_t *lk) {
    3dc0:	55                   	push   %ebp

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    3dc1:	b8 01 00 00 00       	mov    $0x1,%eax
    // just return an error, if lock ref is null
    return -1; 
  }
}

int lock_acquire(struct lock_t *lk) {
    3dc6:	89 e5                	mov    %esp,%ebp
    3dc8:	56                   	push   %esi
    3dc9:	53                   	push   %ebx
    3dca:	8b 5d 08             	mov    0x8(%ebp),%ebx

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    3dcd:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
    3dd0:	85 c0                	test   %eax,%eax

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    3dd2:	be 01 00 00 00       	mov    $0x1,%esi
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
    3dd7:	74 1d                	je     3df6 <lock_acquire+0x36>
    3dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // use sleep to yield to the scheduler
    sleep(1);
    3de0:	83 ec 0c             	sub    $0xc,%esp
    3de3:	6a 01                	push   $0x1
    3de5:	e8 88 fb ff ff       	call   3972 <sleep>

// this is the same code as spinlock
static inline uint __xchg(uint* lock) {
  uint result;
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    3dea:	89 f0                	mov    %esi,%eax
    3dec:	f0 87 03             	lock xchg %eax,(%ebx)
  }
}

int lock_acquire(struct lock_t *lk) {
  // use set and test to see if mutex lock is available
  while (__xchg(&lk->lock)) {
    3def:	83 c4 10             	add    $0x10,%esp
    3df2:	85 c0                	test   %eax,%eax
    3df4:	75 ea                	jne    3de0 <lock_acquire+0x20>
    // use sleep to yield to the scheduler
    sleep(1);
  }
  return 1;
}
    3df6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3df9:	b8 01 00 00 00       	mov    $0x1,%eax
    3dfe:	5b                   	pop    %ebx
    3dff:	5e                   	pop    %esi
    3e00:	5d                   	pop    %ebp
    3e01:	c3                   	ret    
    3e02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003e10 <lock_release>:

int lock_release(struct lock_t *lk) {
    3e10:	55                   	push   %ebp
    3e11:	89 e5                	mov    %esp,%ebp
  // release lock by setting binary val to zero
  lk->lock = 0;
    3e13:	8b 45 08             	mov    0x8(%ebp),%eax
    3e16:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 1;
}
    3e1c:	b8 01 00 00 00       	mov    $0x1,%eax
    3e21:	5d                   	pop    %ebp
    3e22:	c3                   	ret    
