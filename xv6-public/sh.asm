
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
       d:	56                   	push   %esi
       e:	53                   	push   %ebx
       f:	51                   	push   %ecx
      10:	81 ec 0c 02 00 00    	sub    $0x20c,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      16:	eb 11                	jmp    29 <main+0x29>
      18:	90                   	nop
      19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      20:	83 f8 02             	cmp    $0x2,%eax
      23:	0f 8f ab 01 00 00    	jg     1d4 <main+0x1d4>
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      29:	83 ec 08             	sub    $0x8,%esp
      2c:	6a 02                	push   $0x2
      2e:	68 21 14 00 00       	push   $0x1421
      33:	e8 1a 0f 00 00       	call   f52 <open>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	79 e1                	jns    20 <main+0x20>
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    char buf2[PATHSIZE];
    memmove(buf2, buf, 9);
      3f:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
      45:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      48:	83 ec 08             	sub    $0x8,%esp
      4b:	6a 64                	push   $0x64
      4d:	68 80 1a 00 00       	push   $0x1a80
      52:	e8 b9 01 00 00       	call   210 <getcmd>
      57:	83 c4 10             	add    $0x10,%esp
      5a:	85 c0                	test   %eax,%eax
      5c:	0f 88 44 01 00 00    	js     1a6 <main+0x1a6>
    char buf2[PATHSIZE];
    memmove(buf2, buf, 9);
      62:	83 ec 04             	sub    $0x4,%esp
      65:	6a 09                	push   $0x9
      67:	68 80 1a 00 00       	push   $0x1a80
      6c:	56                   	push   %esi
      6d:	e8 6e 0e 00 00       	call   ee0 <memmove>
    buf2[8] = '\0';
    if(strcmp(buf2,"set PATH") == 0){
      72:	5a                   	pop    %edx
      73:	59                   	pop    %ecx
      74:	68 29 14 00 00       	push   $0x1429
      79:	56                   	push   %esi

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    char buf2[PATHSIZE];
    memmove(buf2, buf, 9);
    buf2[8] = '\0';
      7a:	c6 85 f0 fd ff ff 00 	movb   $0x0,-0x210(%ebp)
    if(strcmp(buf2,"set PATH") == 0){
      81:	e8 7a 0c 00 00       	call   d00 <strcmp>
      86:	83 c4 10             	add    $0x10,%esp
      89:	85 c0                	test   %eax,%eax
      8b:	0f 85 87 00 00 00    	jne    118 <main+0x118>
     char* StringOfPaths =buf + 9;
     int index = 0;
     pathNum = 0;
     while(*StringOfPaths != '\0' && pathNum < 10){
      91:	0f b6 15 89 1a 00 00 	movzbl 0x1a89,%edx
      98:	31 c9                	xor    %ecx,%ecx
    memmove(buf2, buf, 9);
    buf2[8] = '\0';
    if(strcmp(buf2,"set PATH") == 0){
     char* StringOfPaths =buf + 9;
     int index = 0;
     pathNum = 0;
      9a:	c7 05 e4 1a 00 00 00 	movl   $0x0,0x1ae4
      a1:	00 00 00 
     while(*StringOfPaths != '\0' && pathNum < 10){
      a4:	bb 89 1a 00 00       	mov    $0x1a89,%ebx
      a9:	84 d2                	test   %dl,%dl
      ab:	75 25                	jne    d2 <main+0xd2>
      ad:	eb 99                	jmp    48 <main+0x48>
      af:	90                   	nop
         strcpy(PATHS[pathNum],buf2);
         index = 0;
         pathNum++;
         printf(2,"Path number %d was added : %s\n",pathNum,buf2);
       }else{
         buf2[index] = *StringOfPaths;
      b0:	88 94 0d e8 fd ff ff 	mov    %dl,-0x218(%ebp,%ecx,1)
         index++;
      b7:	83 c1 01             	add    $0x1,%ecx
       }
       StringOfPaths++;
      ba:	83 c3 01             	add    $0x1,%ebx
    buf2[8] = '\0';
    if(strcmp(buf2,"set PATH") == 0){
     char* StringOfPaths =buf + 9;
     int index = 0;
     pathNum = 0;
     while(*StringOfPaths != '\0' && pathNum < 10){
      bd:	0f b6 13             	movzbl (%ebx),%edx
      c0:	84 d2                	test   %dl,%dl
      c2:	74 84                	je     48 <main+0x48>
      c4:	a1 e4 1a 00 00       	mov    0x1ae4,%eax
      c9:	83 f8 09             	cmp    $0x9,%eax
      cc:	0f 8f 76 ff ff ff    	jg     48 <main+0x48>
       if(*StringOfPaths ==':'){
      d2:	80 fa 3a             	cmp    $0x3a,%dl
      d5:	75 d9                	jne    b0 <main+0xb0>
         buf2[index] = '\0';
         strcpy(PATHS[pathNum],buf2);
      d7:	c1 e0 09             	shl    $0x9,%eax
      da:	83 ec 08             	sub    $0x8,%esp
     char* StringOfPaths =buf + 9;
     int index = 0;
     pathNum = 0;
     while(*StringOfPaths != '\0' && pathNum < 10){
       if(*StringOfPaths ==':'){
         buf2[index] = '\0';
      dd:	c6 84 0d e8 fd ff ff 	movb   $0x0,-0x218(%ebp,%ecx,1)
      e4:	00 
         strcpy(PATHS[pathNum],buf2);
      e5:	05 00 1b 00 00       	add    $0x1b00,%eax
      ea:	56                   	push   %esi
      eb:	50                   	push   %eax
      ec:	e8 df 0b 00 00       	call   cd0 <strcpy>
         index = 0;
         pathNum++;
      f1:	a1 e4 1a 00 00       	mov    0x1ae4,%eax
         printf(2,"Path number %d was added : %s\n",pathNum,buf2);
      f6:	56                   	push   %esi
     while(*StringOfPaths != '\0' && pathNum < 10){
       if(*StringOfPaths ==':'){
         buf2[index] = '\0';
         strcpy(PATHS[pathNum],buf2);
         index = 0;
         pathNum++;
      f7:	83 c0 01             	add    $0x1,%eax
         printf(2,"Path number %d was added : %s\n",pathNum,buf2);
      fa:	50                   	push   %eax
      fb:	68 70 14 00 00       	push   $0x1470
     100:	6a 02                	push   $0x2
     while(*StringOfPaths != '\0' && pathNum < 10){
       if(*StringOfPaths ==':'){
         buf2[index] = '\0';
         strcpy(PATHS[pathNum],buf2);
         index = 0;
         pathNum++;
     102:	a3 e4 1a 00 00       	mov    %eax,0x1ae4
         printf(2,"Path number %d was added : %s\n",pathNum,buf2);
     107:	e8 54 0f 00 00       	call   1060 <printf>
     10c:	83 c4 20             	add    $0x20,%esp
     pathNum = 0;
     while(*StringOfPaths != '\0' && pathNum < 10){
       if(*StringOfPaths ==':'){
         buf2[index] = '\0';
         strcpy(PATHS[pathNum],buf2);
         index = 0;
     10f:	31 c9                	xor    %ecx,%ecx
     111:	eb a7                	jmp    ba <main+0xba>
     113:	90                   	nop
     114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
       StringOfPaths++;
     }

    }
    else {
      if (buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ') {
     118:	80 3d 80 1a 00 00 63 	cmpb   $0x63,0x1a80
     11f:	75 09                	jne    12a <main+0x12a>
     121:	80 3d 81 1a 00 00 64 	cmpb   $0x64,0x1a81
     128:	74 2e                	je     158 <main+0x158>
int
fork1(void)
{
  int pid;

  pid = fork();
     12a:	e8 db 0d 00 00       	call   f0a <fork>
  if(pid == -1)
     12f:	83 f8 ff             	cmp    $0xffffffff,%eax
     132:	0f 84 ad 00 00 00    	je     1e5 <main+0x1e5>
        buf[strlen(buf) - 1] = 0;  // chop \n
        if (chdir(buf + 3) < 0)
          printf(2, "cannot cd %s\n", buf + 3);
        continue;
      }
      if (fork1() == 0)
     138:	85 c0                	test   %eax,%eax
     13a:	0f 84 b2 00 00 00    	je     1f2 <main+0x1f2>
        runcmd(parsecmd(buf));
        wait(0);
     140:	83 ec 0c             	sub    $0xc,%esp
     143:	6a 00                	push   $0x0
     145:	e8 d0 0d 00 00       	call   f1a <wait>
     14a:	83 c4 10             	add    $0x10,%esp
     14d:	e9 f6 fe ff ff       	jmp    48 <main+0x48>
     152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       StringOfPaths++;
     }

    }
    else {
      if (buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ') {
     158:	80 3d 82 1a 00 00 20 	cmpb   $0x20,0x1a82
     15f:	75 c9                	jne    12a <main+0x12a>
        // Chdir must be called by the parent, not the child.
        buf[strlen(buf) - 1] = 0;  // chop \n
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 80 1a 00 00       	push   $0x1a80
     169:	e8 e2 0b 00 00       	call   d50 <strlen>
        if (chdir(buf + 3) < 0)
     16e:	c7 04 24 83 1a 00 00 	movl   $0x1a83,(%esp)

    }
    else {
      if (buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ') {
        // Chdir must be called by the parent, not the child.
        buf[strlen(buf) - 1] = 0;  // chop \n
     175:	c6 80 7f 1a 00 00 00 	movb   $0x0,0x1a7f(%eax)
        if (chdir(buf + 3) < 0)
     17c:	e8 01 0e 00 00       	call   f82 <chdir>
     181:	83 c4 10             	add    $0x10,%esp
     184:	85 c0                	test   %eax,%eax
     186:	0f 89 bc fe ff ff    	jns    48 <main+0x48>
          printf(2, "cannot cd %s\n", buf + 3);
     18c:	50                   	push   %eax
     18d:	68 83 1a 00 00       	push   $0x1a83
     192:	68 32 14 00 00       	push   $0x1432
     197:	6a 02                	push   $0x2
     199:	e8 c2 0e 00 00       	call   1060 <printf>
     19e:	83 c4 10             	add    $0x10,%esp
     1a1:	e9 a2 fe ff ff       	jmp    48 <main+0x48>
     1a6:	bb 00 1b 00 00       	mov    $0x1b00,%ebx
     1ab:	90                   	nop
     1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        runcmd(parsecmd(buf));
        wait(0);
    }
  }
  for(int i =0;i<MAXARGS;i++){
    free(PATHS[i]);
     1b0:	83 ec 0c             	sub    $0xc,%esp
     1b3:	53                   	push   %ebx
     1b4:	81 c3 00 02 00 00    	add    $0x200,%ebx
     1ba:	e8 41 10 00 00       	call   1200 <free>
      if (fork1() == 0)
        runcmd(parsecmd(buf));
        wait(0);
    }
  }
  for(int i =0;i<MAXARGS;i++){
     1bf:	83 c4 10             	add    $0x10,%esp
     1c2:	81 fb 00 2f 00 00    	cmp    $0x2f00,%ebx
     1c8:	75 e6                	jne    1b0 <main+0x1b0>
    free(PATHS[i]);
  }
    exit(0);
     1ca:	83 ec 0c             	sub    $0xc,%esp
     1cd:	6a 00                	push   $0x0
     1cf:	e8 3e 0d 00 00       	call   f12 <exit>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
     1d4:	83 ec 0c             	sub    $0xc,%esp
     1d7:	50                   	push   %eax
     1d8:	e8 5d 0d 00 00       	call   f3a <close>
      break;
     1dd:	83 c4 10             	add    $0x10,%esp
     1e0:	e9 5a fe ff ff       	jmp    3f <main+0x3f>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     1e5:	83 ec 0c             	sub    $0xc,%esp
     1e8:	68 aa 13 00 00       	push   $0x13aa
     1ed:	e8 6e 00 00 00       	call   260 <panic>
        if (chdir(buf + 3) < 0)
          printf(2, "cannot cd %s\n", buf + 3);
        continue;
      }
      if (fork1() == 0)
        runcmd(parsecmd(buf));
     1f2:	83 ec 0c             	sub    $0xc,%esp
     1f5:	68 80 1a 00 00       	push   $0x1a80
     1fa:	e8 61 0a 00 00       	call   c60 <parsecmd>
     1ff:	89 04 24             	mov    %eax,(%esp)
     202:	e8 89 00 00 00       	call   290 <runcmd>
     207:	66 90                	xchg   %ax,%ax
     209:	66 90                	xchg   %ax,%ax
     20b:	66 90                	xchg   %ax,%ax
     20d:	66 90                	xchg   %ax,%ax
     20f:	90                   	nop

00000210 <getcmd>:
    exit(0);
}

int
getcmd(char *buf, int nbuf)
{
     210:	55                   	push   %ebp
     211:	89 e5                	mov    %esp,%ebp
     213:	56                   	push   %esi
     214:	53                   	push   %ebx
     215:	8b 75 0c             	mov    0xc(%ebp),%esi
     218:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     21b:	83 ec 08             	sub    $0x8,%esp
     21e:	68 80 13 00 00       	push   $0x1380
     223:	6a 02                	push   $0x2
     225:	e8 36 0e 00 00       	call   1060 <printf>
  memset(buf, 0, nbuf);
     22a:	83 c4 0c             	add    $0xc,%esp
     22d:	56                   	push   %esi
     22e:	6a 00                	push   $0x0
     230:	53                   	push   %ebx
     231:	e8 4a 0b 00 00       	call   d80 <memset>
  gets(buf, nbuf);
     236:	58                   	pop    %eax
     237:	5a                   	pop    %edx
     238:	56                   	push   %esi
     239:	53                   	push   %ebx
     23a:	e8 a1 0b 00 00       	call   de0 <gets>
     23f:	83 c4 10             	add    $0x10,%esp
     242:	31 c0                	xor    %eax,%eax
     244:	80 3b 00             	cmpb   $0x0,(%ebx)
     247:	0f 94 c0             	sete   %al
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     24a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     24d:	f7 d8                	neg    %eax
     24f:	5b                   	pop    %ebx
     250:	5e                   	pop    %esi
     251:	5d                   	pop    %ebp
     252:	c3                   	ret    
     253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <panic>:
    exit(0);
}

void
panic(char *s)
{
     260:	55                   	push   %ebp
     261:	89 e5                	mov    %esp,%ebp
     263:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     266:	ff 75 08             	pushl  0x8(%ebp)
     269:	68 1d 14 00 00       	push   $0x141d
     26e:	6a 02                	push   $0x2
     270:	e8 eb 0d 00 00       	call   1060 <printf>
    exit(0);
     275:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     27c:	e8 91 0c 00 00       	call   f12 <exit>
     281:	eb 0d                	jmp    290 <runcmd>
     283:	90                   	nop
     284:	90                   	nop
     285:	90                   	nop
     286:	90                   	nop
     287:	90                   	nop
     288:	90                   	nop
     289:	90                   	nop
     28a:	90                   	nop
     28b:	90                   	nop
     28c:	90                   	nop
     28d:	90                   	nop
     28e:	90                   	nop
     28f:	90                   	nop

00000290 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	57                   	push   %edi
     294:	56                   	push   %esi
     295:	53                   	push   %ebx
     296:	81 ec 1c 02 00 00    	sub    $0x21c,%esp
     29c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     29f:	85 db                	test   %ebx,%ebx
     2a1:	0f 84 8d 00 00 00    	je     334 <runcmd+0xa4>
      exit(0);

  switch(cmd->type){
     2a7:	83 3b 05             	cmpl   $0x5,(%ebx)
     2aa:	0f 87 bb 01 00 00    	ja     46b <runcmd+0x1db>
     2b0:	8b 03                	mov    (%ebx),%eax
     2b2:	ff 24 85 40 14 00 00 	jmp    *0x1440(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     2b9:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     2bf:	83 ec 0c             	sub    $0xc,%esp
     2c2:	50                   	push   %eax
     2c3:	e8 5a 0c 00 00       	call   f22 <pipe>
     2c8:	83 c4 10             	add    $0x10,%esp
     2cb:	85 c0                	test   %eax,%eax
     2cd:	0f 88 ce 01 00 00    	js     4a1 <runcmd+0x211>
int
fork1(void)
{
  int pid;

  pid = fork();
     2d3:	e8 32 0c 00 00       	call   f0a <fork>
  if(pid == -1)
     2d8:	83 f8 ff             	cmp    $0xffffffff,%eax
     2db:	0f 84 97 01 00 00    	je     478 <runcmd+0x1e8>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
     2e1:	85 c0                	test   %eax,%eax
     2e3:	0f 84 c5 01 00 00    	je     4ae <runcmd+0x21e>
int
fork1(void)
{
  int pid;

  pid = fork();
     2e9:	e8 1c 0c 00 00       	call   f0a <fork>
  if(pid == -1)
     2ee:	83 f8 ff             	cmp    $0xffffffff,%eax
     2f1:	0f 84 81 01 00 00    	je     478 <runcmd+0x1e8>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     2f7:	85 c0                	test   %eax,%eax
     2f9:	0f 84 e6 01 00 00    	je     4e5 <runcmd+0x255>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     2ff:	83 ec 0c             	sub    $0xc,%esp
     302:	ff b5 e8 fd ff ff    	pushl  -0x218(%ebp)
     308:	e8 2d 0c 00 00       	call   f3a <close>
    close(p[1]);
     30d:	58                   	pop    %eax
     30e:	ff b5 ec fd ff ff    	pushl  -0x214(%ebp)
     314:	e8 21 0c 00 00       	call   f3a <close>
          wait(0);
     319:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     320:	e8 f5 0b 00 00       	call   f1a <wait>
          wait(0);
     325:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     32c:	e8 e9 0b 00 00       	call   f1a <wait>
    break;
     331:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
    exit(0);
     334:	83 ec 0c             	sub    $0xc,%esp
     337:	6a 00                	push   $0x0
     339:	e8 d4 0b 00 00       	call   f12 <exit>
int
fork1(void)
{
  int pid;

  pid = fork();
     33e:	e8 c7 0b 00 00       	call   f0a <fork>
  if(pid == -1)
     343:	83 f8 ff             	cmp    $0xffffffff,%eax
     346:	0f 84 2c 01 00 00    	je     478 <runcmd+0x1e8>
          wait(0);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     34c:	85 c0                	test   %eax,%eax
     34e:	75 e4                	jne    334 <runcmd+0xa4>
     350:	e9 ea 00 00 00       	jmp    43f <runcmd+0x1af>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     355:	8b 43 04             	mov    0x4(%ebx),%eax
     358:	85 c0                	test   %eax,%eax
     35a:	74 d8                	je     334 <runcmd+0xa4>
        exit(0);
    exec(ecmd->argv[0], ecmd->argv);
     35c:	8d 7b 04             	lea    0x4(%ebx),%edi
     35f:	56                   	push   %esi
     360:	56                   	push   %esi
     361:	57                   	push   %edi
     362:	50                   	push   %eax
     363:	89 bd dc fd ff ff    	mov    %edi,-0x224(%ebp)
     369:	e8 dc 0b 00 00       	call   f4a <exec>
    char path[PATHSIZE];
    for (int i = 0; i < pathNum; ++i) {
     36e:	83 c4 10             	add    $0x10,%esp
     371:	83 3d e4 1a 00 00 00 	cmpl   $0x0,0x1ae4
     378:	0f 8e 8a 00 00 00    	jle    408 <runcmd+0x178>
     37e:	31 d2                	xor    %edx,%edx
     380:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
     386:	89 5d 08             	mov    %ebx,0x8(%ebp)
     389:	bf 00 1b 00 00       	mov    $0x1b00,%edi
     38e:	89 d3                	mov    %edx,%ebx
      memmove(path,PATHS[i],strlen(PATHS[i]));
     390:	83 ec 0c             	sub    $0xc,%esp
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
        exit(0);
    exec(ecmd->argv[0], ecmd->argv);
    char path[PATHSIZE];
    for (int i = 0; i < pathNum; ++i) {
     393:	83 c3 01             	add    $0x1,%ebx
      memmove(path,PATHS[i],strlen(PATHS[i]));
     396:	57                   	push   %edi
     397:	e8 b4 09 00 00       	call   d50 <strlen>
     39c:	83 c4 0c             	add    $0xc,%esp
     39f:	50                   	push   %eax
     3a0:	57                   	push   %edi
     3a1:	81 c7 00 02 00 00    	add    $0x200,%edi
     3a7:	56                   	push   %esi
     3a8:	e8 33 0b 00 00       	call   ee0 <memmove>
      memmove(path + strlen(path), ecmd->argv[0], strlen(ecmd->argv[0]));
     3ad:	58                   	pop    %eax
     3ae:	8b 45 08             	mov    0x8(%ebp),%eax
     3b1:	ff 70 04             	pushl  0x4(%eax)
     3b4:	e8 97 09 00 00       	call   d50 <strlen>
     3b9:	89 85 e0 fd ff ff    	mov    %eax,-0x220(%ebp)
     3bf:	8b 45 08             	mov    0x8(%ebp),%eax
     3c2:	8b 50 04             	mov    0x4(%eax),%edx
     3c5:	89 34 24             	mov    %esi,(%esp)
     3c8:	89 95 e4 fd ff ff    	mov    %edx,-0x21c(%ebp)
     3ce:	e8 7d 09 00 00       	call   d50 <strlen>
     3d3:	8b 8d e0 fd ff ff    	mov    -0x220(%ebp),%ecx
     3d9:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
     3df:	83 c4 0c             	add    $0xc,%esp
     3e2:	01 f0                	add    %esi,%eax
     3e4:	51                   	push   %ecx
     3e5:	52                   	push   %edx
     3e6:	50                   	push   %eax
     3e7:	e8 f4 0a 00 00       	call   ee0 <memmove>
      exec(path, ecmd->argv);
     3ec:	58                   	pop    %eax
     3ed:	5a                   	pop    %edx
     3ee:	ff b5 dc fd ff ff    	pushl  -0x224(%ebp)
     3f4:	56                   	push   %esi
     3f5:	e8 50 0b 00 00       	call   f4a <exec>
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
        exit(0);
    exec(ecmd->argv[0], ecmd->argv);
    char path[PATHSIZE];
    for (int i = 0; i < pathNum; ++i) {
     3fa:	83 c4 10             	add    $0x10,%esp
     3fd:	39 1d e4 1a 00 00    	cmp    %ebx,0x1ae4
     403:	7f 8b                	jg     390 <runcmd+0x100>
     405:	8b 5d 08             	mov    0x8(%ebp),%ebx
      memmove(path,PATHS[i],strlen(PATHS[i]));
      memmove(path + strlen(path), ecmd->argv[0], strlen(ecmd->argv[0]));
      exec(path, ecmd->argv);
    }
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     408:	51                   	push   %ecx
     409:	ff 73 04             	pushl  0x4(%ebx)
     40c:	68 8a 13 00 00       	push   $0x138a
     411:	6a 02                	push   $0x2
     413:	e8 48 0c 00 00       	call   1060 <printf>
    break;
     418:	83 c4 10             	add    $0x10,%esp
     41b:	e9 14 ff ff ff       	jmp    334 <runcmd+0xa4>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     420:	83 ec 0c             	sub    $0xc,%esp
     423:	ff 73 14             	pushl  0x14(%ebx)
     426:	e8 0f 0b 00 00       	call   f3a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     42b:	5a                   	pop    %edx
     42c:	59                   	pop    %ecx
     42d:	ff 73 10             	pushl  0x10(%ebx)
     430:	ff 73 08             	pushl  0x8(%ebx)
     433:	e8 1a 0b 00 00       	call   f52 <open>
     438:	83 c4 10             	add    $0x10,%esp
     43b:	85 c0                	test   %eax,%eax
     43d:	78 46                	js     485 <runcmd+0x1f5>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     43f:	83 ec 0c             	sub    $0xc,%esp
     442:	ff 73 04             	pushl  0x4(%ebx)
     445:	e8 46 fe ff ff       	call   290 <runcmd>
int
fork1(void)
{
  int pid;

  pid = fork();
     44a:	e8 bb 0a 00 00       	call   f0a <fork>
  if(pid == -1)
     44f:	83 f8 ff             	cmp    $0xffffffff,%eax
     452:	74 24                	je     478 <runcmd+0x1e8>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     454:	85 c0                	test   %eax,%eax
     456:	74 e7                	je     43f <runcmd+0x1af>
      runcmd(lcmd->left);
    wait(0);
     458:	83 ec 0c             	sub    $0xc,%esp
     45b:	6a 00                	push   $0x0
     45d:	e8 b8 0a 00 00       	call   f1a <wait>
    runcmd(lcmd->right);
     462:	58                   	pop    %eax
     463:	ff 73 08             	pushl  0x8(%ebx)
     466:	e8 25 fe ff ff       	call   290 <runcmd>
  if(cmd == 0)
      exit(0);

  switch(cmd->type){
  default:
    panic("runcmd");
     46b:	83 ec 0c             	sub    $0xc,%esp
     46e:	68 83 13 00 00       	push   $0x1383
     473:	e8 e8 fd ff ff       	call   260 <panic>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     478:	83 ec 0c             	sub    $0xc,%esp
     47b:	68 aa 13 00 00       	push   $0x13aa
     480:	e8 db fd ff ff       	call   260 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     485:	50                   	push   %eax
     486:	ff 73 08             	pushl  0x8(%ebx)
     489:	68 9a 13 00 00       	push   $0x139a
     48e:	6a 02                	push   $0x2
     490:	e8 cb 0b 00 00       	call   1060 <printf>
        exit(0);
     495:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     49c:	e8 71 0a 00 00       	call   f12 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     4a1:	83 ec 0c             	sub    $0xc,%esp
     4a4:	68 af 13 00 00       	push   $0x13af
     4a9:	e8 b2 fd ff ff       	call   260 <panic>
    if(fork1() == 0){
      close(1);
     4ae:	83 ec 0c             	sub    $0xc,%esp
     4b1:	6a 01                	push   $0x1
     4b3:	e8 82 0a 00 00       	call   f3a <close>
      dup(p[1]);
     4b8:	58                   	pop    %eax
     4b9:	ff b5 ec fd ff ff    	pushl  -0x214(%ebp)
     4bf:	e8 c6 0a 00 00       	call   f8a <dup>
      close(p[0]);
     4c4:	58                   	pop    %eax
     4c5:	ff b5 e8 fd ff ff    	pushl  -0x218(%ebp)
     4cb:	e8 6a 0a 00 00       	call   f3a <close>
      close(p[1]);
     4d0:	58                   	pop    %eax
     4d1:	ff b5 ec fd ff ff    	pushl  -0x214(%ebp)
     4d7:	e8 5e 0a 00 00       	call   f3a <close>
      runcmd(pcmd->left);
     4dc:	58                   	pop    %eax
     4dd:	ff 73 04             	pushl  0x4(%ebx)
     4e0:	e8 ab fd ff ff       	call   290 <runcmd>
    }
    if(fork1() == 0){
      close(0);
     4e5:	83 ec 0c             	sub    $0xc,%esp
     4e8:	6a 00                	push   $0x0
     4ea:	e8 4b 0a 00 00       	call   f3a <close>
      dup(p[0]);
     4ef:	5a                   	pop    %edx
     4f0:	ff b5 e8 fd ff ff    	pushl  -0x218(%ebp)
     4f6:	e8 8f 0a 00 00       	call   f8a <dup>
      close(p[0]);
     4fb:	59                   	pop    %ecx
     4fc:	ff b5 e8 fd ff ff    	pushl  -0x218(%ebp)
     502:	e8 33 0a 00 00       	call   f3a <close>
      close(p[1]);
     507:	5e                   	pop    %esi
     508:	ff b5 ec fd ff ff    	pushl  -0x214(%ebp)
     50e:	e8 27 0a 00 00       	call   f3a <close>
      runcmd(pcmd->right);
     513:	5f                   	pop    %edi
     514:	ff 73 08             	pushl  0x8(%ebx)
     517:	e8 74 fd ff ff       	call   290 <runcmd>
     51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000520 <fork1>:
    exit(0);
}

int
fork1(void)
{
     520:	55                   	push   %ebp
     521:	89 e5                	mov    %esp,%ebp
     523:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     526:	e8 df 09 00 00       	call   f0a <fork>
  if(pid == -1)
     52b:	83 f8 ff             	cmp    $0xffffffff,%eax
     52e:	74 02                	je     532 <fork1+0x12>
    panic("fork");
  return pid;
}
     530:	c9                   	leave  
     531:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     532:	83 ec 0c             	sub    $0xc,%esp
     535:	68 aa 13 00 00       	push   $0x13aa
     53a:	e8 21 fd ff ff       	call   260 <panic>
     53f:	90                   	nop

00000540 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     540:	55                   	push   %ebp
     541:	89 e5                	mov    %esp,%ebp
     543:	53                   	push   %ebx
     544:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     547:	6a 54                	push   $0x54
     549:	e8 42 0d 00 00       	call   1290 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     54e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     551:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     553:	6a 54                	push   $0x54
     555:	6a 00                	push   $0x0
     557:	50                   	push   %eax
     558:	e8 23 08 00 00       	call   d80 <memset>
  cmd->type = EXEC;
     55d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     563:	89 d8                	mov    %ebx,%eax
     565:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     568:	c9                   	leave  
     569:	c3                   	ret    
     56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000570 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     570:	55                   	push   %ebp
     571:	89 e5                	mov    %esp,%ebp
     573:	53                   	push   %ebx
     574:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     577:	6a 18                	push   $0x18
     579:	e8 12 0d 00 00       	call   1290 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     57e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     581:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     583:	6a 18                	push   $0x18
     585:	6a 00                	push   $0x0
     587:	50                   	push   %eax
     588:	e8 f3 07 00 00       	call   d80 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     58d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     590:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     596:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     599:	8b 45 0c             	mov    0xc(%ebp),%eax
     59c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     59f:	8b 45 10             	mov    0x10(%ebp),%eax
     5a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     5a5:	8b 45 14             	mov    0x14(%ebp),%eax
     5a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     5ab:	8b 45 18             	mov    0x18(%ebp),%eax
     5ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     5b1:	89 d8                	mov    %ebx,%eax
     5b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     5b6:	c9                   	leave  
     5b7:	c3                   	ret    
     5b8:	90                   	nop
     5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005c0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	53                   	push   %ebx
     5c4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5c7:	6a 0c                	push   $0xc
     5c9:	e8 c2 0c 00 00       	call   1290 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5ce:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5d1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5d3:	6a 0c                	push   $0xc
     5d5:	6a 00                	push   $0x0
     5d7:	50                   	push   %eax
     5d8:	e8 a3 07 00 00       	call   d80 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     5dd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     5e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     5e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     5e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     5ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     5ef:	89 d8                	mov    %ebx,%eax
     5f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     5f4:	c9                   	leave  
     5f5:	c3                   	ret    
     5f6:	8d 76 00             	lea    0x0(%esi),%esi
     5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000600 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     600:	55                   	push   %ebp
     601:	89 e5                	mov    %esp,%ebp
     603:	53                   	push   %ebx
     604:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     607:	6a 0c                	push   $0xc
     609:	e8 82 0c 00 00       	call   1290 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     60e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     611:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     613:	6a 0c                	push   $0xc
     615:	6a 00                	push   $0x0
     617:	50                   	push   %eax
     618:	e8 63 07 00 00       	call   d80 <memset>
  cmd->type = LIST;
  cmd->left = left;
     61d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     620:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     626:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     629:	8b 45 0c             	mov    0xc(%ebp),%eax
     62c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     62f:	89 d8                	mov    %ebx,%eax
     631:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     634:	c9                   	leave  
     635:	c3                   	ret    
     636:	8d 76 00             	lea    0x0(%esi),%esi
     639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	53                   	push   %ebx
     644:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     647:	6a 08                	push   $0x8
     649:	e8 42 0c 00 00       	call   1290 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     64e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     651:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     653:	6a 08                	push   $0x8
     655:	6a 00                	push   $0x0
     657:	50                   	push   %eax
     658:	e8 23 07 00 00       	call   d80 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     65d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     660:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     666:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     669:	89 d8                	mov    %ebx,%eax
     66b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     66e:	c9                   	leave  
     66f:	c3                   	ret    

00000670 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	57                   	push   %edi
     674:	56                   	push   %esi
     675:	53                   	push   %ebx
     676:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     679:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     67c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     67f:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     682:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     684:	39 df                	cmp    %ebx,%edi
     686:	72 13                	jb     69b <gettoken+0x2b>
     688:	eb 29                	jmp    6b3 <gettoken+0x43>
     68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     690:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     693:	39 fb                	cmp    %edi,%ebx
     695:	0f 84 ed 00 00 00    	je     788 <gettoken+0x118>
     69b:	0f be 07             	movsbl (%edi),%eax
     69e:	83 ec 08             	sub    $0x8,%esp
     6a1:	50                   	push   %eax
     6a2:	68 5c 1a 00 00       	push   $0x1a5c
     6a7:	e8 f4 06 00 00       	call   da0 <strchr>
     6ac:	83 c4 10             	add    $0x10,%esp
     6af:	85 c0                	test   %eax,%eax
     6b1:	75 dd                	jne    690 <gettoken+0x20>
    s++;
  if(q)
     6b3:	85 f6                	test   %esi,%esi
     6b5:	74 02                	je     6b9 <gettoken+0x49>
    *q = s;
     6b7:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     6b9:	0f be 37             	movsbl (%edi),%esi
     6bc:	89 f1                	mov    %esi,%ecx
     6be:	89 f0                	mov    %esi,%eax
  switch(*s){
     6c0:	80 f9 29             	cmp    $0x29,%cl
     6c3:	7f 5b                	jg     720 <gettoken+0xb0>
     6c5:	80 f9 28             	cmp    $0x28,%cl
     6c8:	7d 61                	jge    72b <gettoken+0xbb>
     6ca:	84 c9                	test   %cl,%cl
     6cc:	0f 85 de 00 00 00    	jne    7b0 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     6d2:	8b 55 14             	mov    0x14(%ebp),%edx
     6d5:	85 d2                	test   %edx,%edx
     6d7:	74 05                	je     6de <gettoken+0x6e>
    *eq = s;
     6d9:	8b 45 14             	mov    0x14(%ebp),%eax
     6dc:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     6de:	39 fb                	cmp    %edi,%ebx
     6e0:	77 0d                	ja     6ef <gettoken+0x7f>
     6e2:	eb 23                	jmp    707 <gettoken+0x97>
     6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     6e8:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     6eb:	39 fb                	cmp    %edi,%ebx
     6ed:	74 18                	je     707 <gettoken+0x97>
     6ef:	0f be 07             	movsbl (%edi),%eax
     6f2:	83 ec 08             	sub    $0x8,%esp
     6f5:	50                   	push   %eax
     6f6:	68 5c 1a 00 00       	push   $0x1a5c
     6fb:	e8 a0 06 00 00       	call   da0 <strchr>
     700:	83 c4 10             	add    $0x10,%esp
     703:	85 c0                	test   %eax,%eax
     705:	75 e1                	jne    6e8 <gettoken+0x78>
    s++;
  *ps = s;
     707:	8b 45 08             	mov    0x8(%ebp),%eax
     70a:	89 38                	mov    %edi,(%eax)
  return ret;
}
     70c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     70f:	89 f0                	mov    %esi,%eax
     711:	5b                   	pop    %ebx
     712:	5e                   	pop    %esi
     713:	5f                   	pop    %edi
     714:	5d                   	pop    %ebp
     715:	c3                   	ret    
     716:	8d 76 00             	lea    0x0(%esi),%esi
     719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     720:	80 f9 3e             	cmp    $0x3e,%cl
     723:	75 0b                	jne    730 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     725:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     729:	74 75                	je     7a0 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     72b:	83 c7 01             	add    $0x1,%edi
     72e:	eb a2                	jmp    6d2 <gettoken+0x62>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     730:	7f 5e                	jg     790 <gettoken+0x120>
     732:	83 e9 3b             	sub    $0x3b,%ecx
     735:	80 f9 01             	cmp    $0x1,%cl
     738:	76 f1                	jbe    72b <gettoken+0xbb>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     73a:	39 fb                	cmp    %edi,%ebx
     73c:	77 24                	ja     762 <gettoken+0xf2>
     73e:	eb 7c                	jmp    7bc <gettoken+0x14c>
     740:	0f be 07             	movsbl (%edi),%eax
     743:	83 ec 08             	sub    $0x8,%esp
     746:	50                   	push   %eax
     747:	68 54 1a 00 00       	push   $0x1a54
     74c:	e8 4f 06 00 00       	call   da0 <strchr>
     751:	83 c4 10             	add    $0x10,%esp
     754:	85 c0                	test   %eax,%eax
     756:	75 1f                	jne    777 <gettoken+0x107>
      s++;
     758:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     75b:	39 fb                	cmp    %edi,%ebx
     75d:	74 5b                	je     7ba <gettoken+0x14a>
     75f:	0f be 07             	movsbl (%edi),%eax
     762:	83 ec 08             	sub    $0x8,%esp
     765:	50                   	push   %eax
     766:	68 5c 1a 00 00       	push   $0x1a5c
     76b:	e8 30 06 00 00       	call   da0 <strchr>
     770:	83 c4 10             	add    $0x10,%esp
     773:	85 c0                	test   %eax,%eax
     775:	74 c9                	je     740 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     777:	be 61 00 00 00       	mov    $0x61,%esi
     77c:	e9 51 ff ff ff       	jmp    6d2 <gettoken+0x62>
     781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     788:	89 df                	mov    %ebx,%edi
     78a:	e9 24 ff ff ff       	jmp    6b3 <gettoken+0x43>
     78f:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     790:	80 f9 7c             	cmp    $0x7c,%cl
     793:	74 96                	je     72b <gettoken+0xbb>
     795:	eb a3                	jmp    73a <gettoken+0xca>
     797:	89 f6                	mov    %esi,%esi
     799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     7a0:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     7a3:	be 2b 00 00 00       	mov    $0x2b,%esi
     7a8:	e9 25 ff ff ff       	jmp    6d2 <gettoken+0x62>
     7ad:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     7b0:	80 f9 26             	cmp    $0x26,%cl
     7b3:	75 85                	jne    73a <gettoken+0xca>
     7b5:	e9 71 ff ff ff       	jmp    72b <gettoken+0xbb>
     7ba:	89 df                	mov    %ebx,%edi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     7bc:	8b 45 14             	mov    0x14(%ebp),%eax
     7bf:	be 61 00 00 00       	mov    $0x61,%esi
     7c4:	85 c0                	test   %eax,%eax
     7c6:	0f 85 0d ff ff ff    	jne    6d9 <gettoken+0x69>
     7cc:	e9 36 ff ff ff       	jmp    707 <gettoken+0x97>
     7d1:	eb 0d                	jmp    7e0 <peek>
     7d3:	90                   	nop
     7d4:	90                   	nop
     7d5:	90                   	nop
     7d6:	90                   	nop
     7d7:	90                   	nop
     7d8:	90                   	nop
     7d9:	90                   	nop
     7da:	90                   	nop
     7db:	90                   	nop
     7dc:	90                   	nop
     7dd:	90                   	nop
     7de:	90                   	nop
     7df:	90                   	nop

000007e0 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	57                   	push   %edi
     7e4:	56                   	push   %esi
     7e5:	53                   	push   %ebx
     7e6:	83 ec 0c             	sub    $0xc,%esp
     7e9:	8b 7d 08             	mov    0x8(%ebp),%edi
     7ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     7ef:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     7f1:	39 f3                	cmp    %esi,%ebx
     7f3:	72 12                	jb     807 <peek+0x27>
     7f5:	eb 28                	jmp    81f <peek+0x3f>
     7f7:	89 f6                	mov    %esi,%esi
     7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     800:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     803:	39 de                	cmp    %ebx,%esi
     805:	74 18                	je     81f <peek+0x3f>
     807:	0f be 03             	movsbl (%ebx),%eax
     80a:	83 ec 08             	sub    $0x8,%esp
     80d:	50                   	push   %eax
     80e:	68 5c 1a 00 00       	push   $0x1a5c
     813:	e8 88 05 00 00       	call   da0 <strchr>
     818:	83 c4 10             	add    $0x10,%esp
     81b:	85 c0                	test   %eax,%eax
     81d:	75 e1                	jne    800 <peek+0x20>
    s++;
  *ps = s;
     81f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     821:	0f be 13             	movsbl (%ebx),%edx
     824:	31 c0                	xor    %eax,%eax
     826:	84 d2                	test   %dl,%dl
     828:	74 17                	je     841 <peek+0x61>
     82a:	83 ec 08             	sub    $0x8,%esp
     82d:	52                   	push   %edx
     82e:	ff 75 10             	pushl  0x10(%ebp)
     831:	e8 6a 05 00 00       	call   da0 <strchr>
     836:	83 c4 10             	add    $0x10,%esp
     839:	85 c0                	test   %eax,%eax
     83b:	0f 95 c0             	setne  %al
     83e:	0f b6 c0             	movzbl %al,%eax
}
     841:	8d 65 f4             	lea    -0xc(%ebp),%esp
     844:	5b                   	pop    %ebx
     845:	5e                   	pop    %esi
     846:	5f                   	pop    %edi
     847:	5d                   	pop    %ebp
     848:	c3                   	ret    
     849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000850 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	57                   	push   %edi
     854:	56                   	push   %esi
     855:	53                   	push   %ebx
     856:	83 ec 1c             	sub    $0x1c,%esp
     859:	8b 75 0c             	mov    0xc(%ebp),%esi
     85c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     85f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     860:	83 ec 04             	sub    $0x4,%esp
     863:	68 d1 13 00 00       	push   $0x13d1
     868:	53                   	push   %ebx
     869:	56                   	push   %esi
     86a:	e8 71 ff ff ff       	call   7e0 <peek>
     86f:	83 c4 10             	add    $0x10,%esp
     872:	85 c0                	test   %eax,%eax
     874:	74 6a                	je     8e0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     876:	6a 00                	push   $0x0
     878:	6a 00                	push   $0x0
     87a:	53                   	push   %ebx
     87b:	56                   	push   %esi
     87c:	e8 ef fd ff ff       	call   670 <gettoken>
     881:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     883:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     886:	50                   	push   %eax
     887:	8d 45 e0             	lea    -0x20(%ebp),%eax
     88a:	50                   	push   %eax
     88b:	53                   	push   %ebx
     88c:	56                   	push   %esi
     88d:	e8 de fd ff ff       	call   670 <gettoken>
     892:	83 c4 20             	add    $0x20,%esp
     895:	83 f8 61             	cmp    $0x61,%eax
     898:	75 51                	jne    8eb <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     89a:	83 ff 3c             	cmp    $0x3c,%edi
     89d:	74 31                	je     8d0 <parseredirs+0x80>
     89f:	83 ff 3e             	cmp    $0x3e,%edi
     8a2:	74 05                	je     8a9 <parseredirs+0x59>
     8a4:	83 ff 2b             	cmp    $0x2b,%edi
     8a7:	75 b7                	jne    860 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     8a9:	83 ec 0c             	sub    $0xc,%esp
     8ac:	6a 01                	push   $0x1
     8ae:	68 01 02 00 00       	push   $0x201
     8b3:	ff 75 e4             	pushl  -0x1c(%ebp)
     8b6:	ff 75 e0             	pushl  -0x20(%ebp)
     8b9:	ff 75 08             	pushl  0x8(%ebp)
     8bc:	e8 af fc ff ff       	call   570 <redircmd>
      break;
     8c1:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     8c4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     8c7:	eb 97                	jmp    860 <parseredirs+0x10>
     8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     8d0:	83 ec 0c             	sub    $0xc,%esp
     8d3:	6a 00                	push   $0x0
     8d5:	6a 00                	push   $0x0
     8d7:	eb da                	jmp    8b3 <parseredirs+0x63>
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     8e0:	8b 45 08             	mov    0x8(%ebp),%eax
     8e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e6:	5b                   	pop    %ebx
     8e7:	5e                   	pop    %esi
     8e8:	5f                   	pop    %edi
     8e9:	5d                   	pop    %ebp
     8ea:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     8eb:	83 ec 0c             	sub    $0xc,%esp
     8ee:	68 b4 13 00 00       	push   $0x13b4
     8f3:	e8 68 f9 ff ff       	call   260 <panic>
     8f8:	90                   	nop
     8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000900 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 30             	sub    $0x30,%esp
     909:	8b 75 08             	mov    0x8(%ebp),%esi
     90c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     90f:	68 d4 13 00 00       	push   $0x13d4
     914:	57                   	push   %edi
     915:	56                   	push   %esi
     916:	e8 c5 fe ff ff       	call   7e0 <peek>
     91b:	83 c4 10             	add    $0x10,%esp
     91e:	85 c0                	test   %eax,%eax
     920:	0f 85 9a 00 00 00    	jne    9c0 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
     926:	e8 15 fc ff ff       	call   540 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     92b:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     92e:	89 c3                	mov    %eax,%ebx
     930:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     933:	57                   	push   %edi
     934:	56                   	push   %esi
     935:	8d 5b 04             	lea    0x4(%ebx),%ebx
     938:	50                   	push   %eax
     939:	e8 12 ff ff ff       	call   850 <parseredirs>
     93e:	83 c4 10             	add    $0x10,%esp
     941:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     944:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     94b:	eb 16                	jmp    963 <parseexec+0x63>
     94d:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     950:	83 ec 04             	sub    $0x4,%esp
     953:	57                   	push   %edi
     954:	56                   	push   %esi
     955:	ff 75 d0             	pushl  -0x30(%ebp)
     958:	e8 f3 fe ff ff       	call   850 <parseredirs>
     95d:	83 c4 10             	add    $0x10,%esp
     960:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     963:	83 ec 04             	sub    $0x4,%esp
     966:	68 eb 13 00 00       	push   $0x13eb
     96b:	57                   	push   %edi
     96c:	56                   	push   %esi
     96d:	e8 6e fe ff ff       	call   7e0 <peek>
     972:	83 c4 10             	add    $0x10,%esp
     975:	85 c0                	test   %eax,%eax
     977:	75 5f                	jne    9d8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     979:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     97c:	50                   	push   %eax
     97d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     980:	50                   	push   %eax
     981:	57                   	push   %edi
     982:	56                   	push   %esi
     983:	e8 e8 fc ff ff       	call   670 <gettoken>
     988:	83 c4 10             	add    $0x10,%esp
     98b:	85 c0                	test   %eax,%eax
     98d:	74 49                	je     9d8 <parseexec+0xd8>
      break;
    if(tok != 'a')
     98f:	83 f8 61             	cmp    $0x61,%eax
     992:	75 66                	jne    9fa <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
     994:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     997:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     99b:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     99e:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
     9a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9a4:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
     9a7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
     9aa:	83 f8 0a             	cmp    $0xa,%eax
     9ad:	75 a1                	jne    950 <parseexec+0x50>
      panic("too many args");
     9af:	83 ec 0c             	sub    $0xc,%esp
     9b2:	68 dd 13 00 00       	push   $0x13dd
     9b7:	e8 a4 f8 ff ff       	call   260 <panic>
     9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     9c0:	83 ec 08             	sub    $0x8,%esp
     9c3:	57                   	push   %edi
     9c4:	56                   	push   %esi
     9c5:	e8 56 01 00 00       	call   b20 <parseblock>
     9ca:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     9cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9d0:	5b                   	pop    %ebx
     9d1:	5e                   	pop    %esi
     9d2:	5f                   	pop    %edi
     9d3:	5d                   	pop    %ebp
     9d4:	c3                   	ret    
     9d5:	8d 76 00             	lea    0x0(%esi),%esi
     9d8:	8b 45 cc             	mov    -0x34(%ebp),%eax
     9db:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     9de:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     9e1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     9e8:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     9ef:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
     9f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9f5:	5b                   	pop    %ebx
     9f6:	5e                   	pop    %esi
     9f7:	5f                   	pop    %edi
     9f8:	5d                   	pop    %ebp
     9f9:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     9fa:	83 ec 0c             	sub    $0xc,%esp
     9fd:	68 d6 13 00 00       	push   $0x13d6
     a02:	e8 59 f8 ff ff       	call   260 <panic>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
     a16:	83 ec 14             	sub    $0x14,%esp
     a19:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     a1f:	56                   	push   %esi
     a20:	53                   	push   %ebx
     a21:	e8 da fe ff ff       	call   900 <parseexec>
  if(peek(ps, es, "|")){
     a26:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     a29:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     a2b:	68 f0 13 00 00       	push   $0x13f0
     a30:	56                   	push   %esi
     a31:	53                   	push   %ebx
     a32:	e8 a9 fd ff ff       	call   7e0 <peek>
     a37:	83 c4 10             	add    $0x10,%esp
     a3a:	85 c0                	test   %eax,%eax
     a3c:	75 12                	jne    a50 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     a3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a41:	89 f8                	mov    %edi,%eax
     a43:	5b                   	pop    %ebx
     a44:	5e                   	pop    %esi
     a45:	5f                   	pop    %edi
     a46:	5d                   	pop    %ebp
     a47:	c3                   	ret    
     a48:	90                   	nop
     a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     a50:	6a 00                	push   $0x0
     a52:	6a 00                	push   $0x0
     a54:	56                   	push   %esi
     a55:	53                   	push   %ebx
     a56:	e8 15 fc ff ff       	call   670 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a5b:	58                   	pop    %eax
     a5c:	5a                   	pop    %edx
     a5d:	56                   	push   %esi
     a5e:	53                   	push   %ebx
     a5f:	e8 ac ff ff ff       	call   a10 <parsepipe>
     a64:	89 7d 08             	mov    %edi,0x8(%ebp)
     a67:	89 45 0c             	mov    %eax,0xc(%ebp)
     a6a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     a6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a70:	5b                   	pop    %ebx
     a71:	5e                   	pop    %esi
     a72:	5f                   	pop    %edi
     a73:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a74:	e9 47 fb ff ff       	jmp    5c0 <pipecmd>
     a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a80 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     a80:	55                   	push   %ebp
     a81:	89 e5                	mov    %esp,%ebp
     a83:	57                   	push   %edi
     a84:	56                   	push   %esi
     a85:	53                   	push   %ebx
     a86:	83 ec 14             	sub    $0x14,%esp
     a89:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a8c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     a8f:	56                   	push   %esi
     a90:	53                   	push   %ebx
     a91:	e8 7a ff ff ff       	call   a10 <parsepipe>
  while(peek(ps, es, "&")){
     a96:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     a99:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     a9b:	eb 1b                	jmp    ab8 <parseline+0x38>
     a9d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     aa0:	6a 00                	push   $0x0
     aa2:	6a 00                	push   $0x0
     aa4:	56                   	push   %esi
     aa5:	53                   	push   %ebx
     aa6:	e8 c5 fb ff ff       	call   670 <gettoken>
    cmd = backcmd(cmd);
     aab:	89 3c 24             	mov    %edi,(%esp)
     aae:	e8 8d fb ff ff       	call   640 <backcmd>
     ab3:	83 c4 10             	add    $0x10,%esp
     ab6:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     ab8:	83 ec 04             	sub    $0x4,%esp
     abb:	68 f2 13 00 00       	push   $0x13f2
     ac0:	56                   	push   %esi
     ac1:	53                   	push   %ebx
     ac2:	e8 19 fd ff ff       	call   7e0 <peek>
     ac7:	83 c4 10             	add    $0x10,%esp
     aca:	85 c0                	test   %eax,%eax
     acc:	75 d2                	jne    aa0 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     ace:	83 ec 04             	sub    $0x4,%esp
     ad1:	68 ee 13 00 00       	push   $0x13ee
     ad6:	56                   	push   %esi
     ad7:	53                   	push   %ebx
     ad8:	e8 03 fd ff ff       	call   7e0 <peek>
     add:	83 c4 10             	add    $0x10,%esp
     ae0:	85 c0                	test   %eax,%eax
     ae2:	75 0c                	jne    af0 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     ae4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ae7:	89 f8                	mov    %edi,%eax
     ae9:	5b                   	pop    %ebx
     aea:	5e                   	pop    %esi
     aeb:	5f                   	pop    %edi
     aec:	5d                   	pop    %ebp
     aed:	c3                   	ret    
     aee:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     af0:	6a 00                	push   $0x0
     af2:	6a 00                	push   $0x0
     af4:	56                   	push   %esi
     af5:	53                   	push   %ebx
     af6:	e8 75 fb ff ff       	call   670 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     afb:	58                   	pop    %eax
     afc:	5a                   	pop    %edx
     afd:	56                   	push   %esi
     afe:	53                   	push   %ebx
     aff:	e8 7c ff ff ff       	call   a80 <parseline>
     b04:	89 7d 08             	mov    %edi,0x8(%ebp)
     b07:	89 45 0c             	mov    %eax,0xc(%ebp)
     b0a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     b0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b10:	5b                   	pop    %ebx
     b11:	5e                   	pop    %esi
     b12:	5f                   	pop    %edi
     b13:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     b14:	e9 e7 fa ff ff       	jmp    600 <listcmd>
     b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b20 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	57                   	push   %edi
     b24:	56                   	push   %esi
     b25:	53                   	push   %ebx
     b26:	83 ec 10             	sub    $0x10,%esp
     b29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     b2f:	68 d4 13 00 00       	push   $0x13d4
     b34:	56                   	push   %esi
     b35:	53                   	push   %ebx
     b36:	e8 a5 fc ff ff       	call   7e0 <peek>
     b3b:	83 c4 10             	add    $0x10,%esp
     b3e:	85 c0                	test   %eax,%eax
     b40:	74 4a                	je     b8c <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     b42:	6a 00                	push   $0x0
     b44:	6a 00                	push   $0x0
     b46:	56                   	push   %esi
     b47:	53                   	push   %ebx
     b48:	e8 23 fb ff ff       	call   670 <gettoken>
  cmd = parseline(ps, es);
     b4d:	58                   	pop    %eax
     b4e:	5a                   	pop    %edx
     b4f:	56                   	push   %esi
     b50:	53                   	push   %ebx
     b51:	e8 2a ff ff ff       	call   a80 <parseline>
  if(!peek(ps, es, ")"))
     b56:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     b59:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     b5b:	68 10 14 00 00       	push   $0x1410
     b60:	56                   	push   %esi
     b61:	53                   	push   %ebx
     b62:	e8 79 fc ff ff       	call   7e0 <peek>
     b67:	83 c4 10             	add    $0x10,%esp
     b6a:	85 c0                	test   %eax,%eax
     b6c:	74 2b                	je     b99 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     b6e:	6a 00                	push   $0x0
     b70:	6a 00                	push   $0x0
     b72:	56                   	push   %esi
     b73:	53                   	push   %ebx
     b74:	e8 f7 fa ff ff       	call   670 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     b79:	83 c4 0c             	add    $0xc,%esp
     b7c:	56                   	push   %esi
     b7d:	53                   	push   %ebx
     b7e:	57                   	push   %edi
     b7f:	e8 cc fc ff ff       	call   850 <parseredirs>
  return cmd;
}
     b84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b87:	5b                   	pop    %ebx
     b88:	5e                   	pop    %esi
     b89:	5f                   	pop    %edi
     b8a:	5d                   	pop    %ebp
     b8b:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     b8c:	83 ec 0c             	sub    $0xc,%esp
     b8f:	68 f4 13 00 00       	push   $0x13f4
     b94:	e8 c7 f6 ff ff       	call   260 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     b99:	83 ec 0c             	sub    $0xc,%esp
     b9c:	68 ff 13 00 00       	push   $0x13ff
     ba1:	e8 ba f6 ff ff       	call   260 <panic>
     ba6:	8d 76 00             	lea    0x0(%esi),%esi
     ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bb0 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	53                   	push   %ebx
     bb4:	83 ec 04             	sub    $0x4,%esp
     bb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     bba:	85 db                	test   %ebx,%ebx
     bbc:	0f 84 96 00 00 00    	je     c58 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
     bc2:	83 3b 05             	cmpl   $0x5,(%ebx)
     bc5:	77 48                	ja     c0f <nulterminate+0x5f>
     bc7:	8b 03                	mov    (%ebx),%eax
     bc9:	ff 24 85 58 14 00 00 	jmp    *0x1458(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     bd0:	83 ec 0c             	sub    $0xc,%esp
     bd3:	ff 73 04             	pushl  0x4(%ebx)
     bd6:	e8 d5 ff ff ff       	call   bb0 <nulterminate>
    nulterminate(lcmd->right);
     bdb:	58                   	pop    %eax
     bdc:	ff 73 08             	pushl  0x8(%ebx)
     bdf:	e8 cc ff ff ff       	call   bb0 <nulterminate>
    break;
     be4:	83 c4 10             	add    $0x10,%esp
     be7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     be9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bec:	c9                   	leave  
     bed:	c3                   	ret    
     bee:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     bf0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     bf3:	8d 43 2c             	lea    0x2c(%ebx),%eax
     bf6:	85 c9                	test   %ecx,%ecx
     bf8:	74 15                	je     c0f <nulterminate+0x5f>
     bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     c00:	8b 10                	mov    (%eax),%edx
     c02:	83 c0 04             	add    $0x4,%eax
     c05:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     c08:	8b 50 d8             	mov    -0x28(%eax),%edx
     c0b:	85 d2                	test   %edx,%edx
     c0d:	75 f1                	jne    c00 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     c0f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     c11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c14:	c9                   	leave  
     c15:	c3                   	ret    
     c16:	8d 76 00             	lea    0x0(%esi),%esi
     c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     c20:	83 ec 0c             	sub    $0xc,%esp
     c23:	ff 73 04             	pushl  0x4(%ebx)
     c26:	e8 85 ff ff ff       	call   bb0 <nulterminate>
    break;
     c2b:	89 d8                	mov    %ebx,%eax
     c2d:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     c30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c33:	c9                   	leave  
     c34:	c3                   	ret    
     c35:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     c38:	83 ec 0c             	sub    $0xc,%esp
     c3b:	ff 73 04             	pushl  0x4(%ebx)
     c3e:	e8 6d ff ff ff       	call   bb0 <nulterminate>
    *rcmd->efile = 0;
     c43:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     c46:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     c49:	c6 00 00             	movb   $0x0,(%eax)
    break;
     c4c:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     c4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c51:	c9                   	leave  
     c52:	c3                   	ret    
     c53:	90                   	nop
     c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     c58:	31 c0                	xor    %eax,%eax
     c5a:	eb 8d                	jmp    be9 <nulterminate+0x39>
     c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c60 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	56                   	push   %esi
     c64:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     c65:	8b 5d 08             	mov    0x8(%ebp),%ebx
     c68:	83 ec 0c             	sub    $0xc,%esp
     c6b:	53                   	push   %ebx
     c6c:	e8 df 00 00 00       	call   d50 <strlen>
  cmd = parseline(&s, es);
     c71:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     c72:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     c74:	8d 45 08             	lea    0x8(%ebp),%eax
     c77:	5e                   	pop    %esi
     c78:	53                   	push   %ebx
     c79:	50                   	push   %eax
     c7a:	e8 01 fe ff ff       	call   a80 <parseline>
     c7f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     c81:	8d 45 08             	lea    0x8(%ebp),%eax
     c84:	83 c4 0c             	add    $0xc,%esp
     c87:	68 99 13 00 00       	push   $0x1399
     c8c:	53                   	push   %ebx
     c8d:	50                   	push   %eax
     c8e:	e8 4d fb ff ff       	call   7e0 <peek>
  if(s != es){
     c93:	8b 45 08             	mov    0x8(%ebp),%eax
     c96:	83 c4 10             	add    $0x10,%esp
     c99:	39 c3                	cmp    %eax,%ebx
     c9b:	75 12                	jne    caf <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     c9d:	83 ec 0c             	sub    $0xc,%esp
     ca0:	56                   	push   %esi
     ca1:	e8 0a ff ff ff       	call   bb0 <nulterminate>
  return cmd;
}
     ca6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ca9:	89 f0                	mov    %esi,%eax
     cab:	5b                   	pop    %ebx
     cac:	5e                   	pop    %esi
     cad:	5d                   	pop    %ebp
     cae:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     caf:	52                   	push   %edx
     cb0:	50                   	push   %eax
     cb1:	68 12 14 00 00       	push   $0x1412
     cb6:	6a 02                	push   $0x2
     cb8:	e8 a3 03 00 00       	call   1060 <printf>
    panic("syntax");
     cbd:	c7 04 24 d6 13 00 00 	movl   $0x13d6,(%esp)
     cc4:	e8 97 f5 ff ff       	call   260 <panic>
     cc9:	66 90                	xchg   %ax,%ax
     ccb:	66 90                	xchg   %ax,%ax
     ccd:	66 90                	xchg   %ax,%ax
     ccf:	90                   	nop

00000cd0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	53                   	push   %ebx
     cd4:	8b 45 08             	mov    0x8(%ebp),%eax
     cd7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     cda:	89 c2                	mov    %eax,%edx
     cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ce0:	83 c1 01             	add    $0x1,%ecx
     ce3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     ce7:	83 c2 01             	add    $0x1,%edx
     cea:	84 db                	test   %bl,%bl
     cec:	88 5a ff             	mov    %bl,-0x1(%edx)
     cef:	75 ef                	jne    ce0 <strcpy+0x10>
    ;
  return os;
}
     cf1:	5b                   	pop    %ebx
     cf2:	5d                   	pop    %ebp
     cf3:	c3                   	ret    
     cf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000d00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	56                   	push   %esi
     d04:	53                   	push   %ebx
     d05:	8b 55 08             	mov    0x8(%ebp),%edx
     d08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     d0b:	0f b6 02             	movzbl (%edx),%eax
     d0e:	0f b6 19             	movzbl (%ecx),%ebx
     d11:	84 c0                	test   %al,%al
     d13:	75 1e                	jne    d33 <strcmp+0x33>
     d15:	eb 29                	jmp    d40 <strcmp+0x40>
     d17:	89 f6                	mov    %esi,%esi
     d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     d20:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     d23:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     d26:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     d29:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     d2d:	84 c0                	test   %al,%al
     d2f:	74 0f                	je     d40 <strcmp+0x40>
     d31:	89 f1                	mov    %esi,%ecx
     d33:	38 d8                	cmp    %bl,%al
     d35:	74 e9                	je     d20 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     d37:	29 d8                	sub    %ebx,%eax
}
     d39:	5b                   	pop    %ebx
     d3a:	5e                   	pop    %esi
     d3b:	5d                   	pop    %ebp
     d3c:	c3                   	ret    
     d3d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     d40:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     d42:	29 d8                	sub    %ebx,%eax
}
     d44:	5b                   	pop    %ebx
     d45:	5e                   	pop    %esi
     d46:	5d                   	pop    %ebp
     d47:	c3                   	ret    
     d48:	90                   	nop
     d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d50 <strlen>:

uint
strlen(const char *s)
{
     d50:	55                   	push   %ebp
     d51:	89 e5                	mov    %esp,%ebp
     d53:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     d56:	80 39 00             	cmpb   $0x0,(%ecx)
     d59:	74 12                	je     d6d <strlen+0x1d>
     d5b:	31 d2                	xor    %edx,%edx
     d5d:	8d 76 00             	lea    0x0(%esi),%esi
     d60:	83 c2 01             	add    $0x1,%edx
     d63:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     d67:	89 d0                	mov    %edx,%eax
     d69:	75 f5                	jne    d60 <strlen+0x10>
    ;
  return n;
}
     d6b:	5d                   	pop    %ebp
     d6c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     d6d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     d6f:	5d                   	pop    %ebp
     d70:	c3                   	ret    
     d71:	eb 0d                	jmp    d80 <memset>
     d73:	90                   	nop
     d74:	90                   	nop
     d75:	90                   	nop
     d76:	90                   	nop
     d77:	90                   	nop
     d78:	90                   	nop
     d79:	90                   	nop
     d7a:	90                   	nop
     d7b:	90                   	nop
     d7c:	90                   	nop
     d7d:	90                   	nop
     d7e:	90                   	nop
     d7f:	90                   	nop

00000d80 <memset>:

void*
memset(void *dst, int c, uint n)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	57                   	push   %edi
     d84:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     d87:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d8a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d8d:	89 d7                	mov    %edx,%edi
     d8f:	fc                   	cld    
     d90:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     d92:	89 d0                	mov    %edx,%eax
     d94:	5f                   	pop    %edi
     d95:	5d                   	pop    %ebp
     d96:	c3                   	ret    
     d97:	89 f6                	mov    %esi,%esi
     d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000da0 <strchr>:

char*
strchr(const char *s, char c)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	53                   	push   %ebx
     da4:	8b 45 08             	mov    0x8(%ebp),%eax
     da7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     daa:	0f b6 10             	movzbl (%eax),%edx
     dad:	84 d2                	test   %dl,%dl
     daf:	74 1d                	je     dce <strchr+0x2e>
    if(*s == c)
     db1:	38 d3                	cmp    %dl,%bl
     db3:	89 d9                	mov    %ebx,%ecx
     db5:	75 0d                	jne    dc4 <strchr+0x24>
     db7:	eb 17                	jmp    dd0 <strchr+0x30>
     db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dc0:	38 ca                	cmp    %cl,%dl
     dc2:	74 0c                	je     dd0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     dc4:	83 c0 01             	add    $0x1,%eax
     dc7:	0f b6 10             	movzbl (%eax),%edx
     dca:	84 d2                	test   %dl,%dl
     dcc:	75 f2                	jne    dc0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     dce:	31 c0                	xor    %eax,%eax
}
     dd0:	5b                   	pop    %ebx
     dd1:	5d                   	pop    %ebp
     dd2:	c3                   	ret    
     dd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000de0 <gets>:

char*
gets(char *buf, int max)
{
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	57                   	push   %edi
     de4:	56                   	push   %esi
     de5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     de6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     de8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     deb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     dee:	eb 29                	jmp    e19 <gets+0x39>
    cc = read(0, &c, 1);
     df0:	83 ec 04             	sub    $0x4,%esp
     df3:	6a 01                	push   $0x1
     df5:	57                   	push   %edi
     df6:	6a 00                	push   $0x0
     df8:	e8 2d 01 00 00       	call   f2a <read>
    if(cc < 1)
     dfd:	83 c4 10             	add    $0x10,%esp
     e00:	85 c0                	test   %eax,%eax
     e02:	7e 1d                	jle    e21 <gets+0x41>
      break;
    buf[i++] = c;
     e04:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e08:	8b 55 08             	mov    0x8(%ebp),%edx
     e0b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     e0d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     e0f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     e13:	74 1b                	je     e30 <gets+0x50>
     e15:	3c 0d                	cmp    $0xd,%al
     e17:	74 17                	je     e30 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e19:	8d 5e 01             	lea    0x1(%esi),%ebx
     e1c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     e1f:	7c cf                	jl     df0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     e21:	8b 45 08             	mov    0x8(%ebp),%eax
     e24:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     e28:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e2b:	5b                   	pop    %ebx
     e2c:	5e                   	pop    %esi
     e2d:	5f                   	pop    %edi
     e2e:	5d                   	pop    %ebp
     e2f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     e30:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e33:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     e35:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     e39:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e3c:	5b                   	pop    %ebx
     e3d:	5e                   	pop    %esi
     e3e:	5f                   	pop    %edi
     e3f:	5d                   	pop    %ebp
     e40:	c3                   	ret    
     e41:	eb 0d                	jmp    e50 <stat>
     e43:	90                   	nop
     e44:	90                   	nop
     e45:	90                   	nop
     e46:	90                   	nop
     e47:	90                   	nop
     e48:	90                   	nop
     e49:	90                   	nop
     e4a:	90                   	nop
     e4b:	90                   	nop
     e4c:	90                   	nop
     e4d:	90                   	nop
     e4e:	90                   	nop
     e4f:	90                   	nop

00000e50 <stat>:

int
stat(const char *n, struct stat *st)
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	56                   	push   %esi
     e54:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e55:	83 ec 08             	sub    $0x8,%esp
     e58:	6a 00                	push   $0x0
     e5a:	ff 75 08             	pushl  0x8(%ebp)
     e5d:	e8 f0 00 00 00       	call   f52 <open>
  if(fd < 0)
     e62:	83 c4 10             	add    $0x10,%esp
     e65:	85 c0                	test   %eax,%eax
     e67:	78 27                	js     e90 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     e69:	83 ec 08             	sub    $0x8,%esp
     e6c:	ff 75 0c             	pushl  0xc(%ebp)
     e6f:	89 c3                	mov    %eax,%ebx
     e71:	50                   	push   %eax
     e72:	e8 f3 00 00 00       	call   f6a <fstat>
     e77:	89 c6                	mov    %eax,%esi
  close(fd);
     e79:	89 1c 24             	mov    %ebx,(%esp)
     e7c:	e8 b9 00 00 00       	call   f3a <close>
  return r;
     e81:	83 c4 10             	add    $0x10,%esp
     e84:	89 f0                	mov    %esi,%eax
}
     e86:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e89:	5b                   	pop    %ebx
     e8a:	5e                   	pop    %esi
     e8b:	5d                   	pop    %ebp
     e8c:	c3                   	ret    
     e8d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     e90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e95:	eb ef                	jmp    e86 <stat+0x36>
     e97:	89 f6                	mov    %esi,%esi
     e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ea0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	53                   	push   %ebx
     ea4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     ea7:	0f be 11             	movsbl (%ecx),%edx
     eaa:	8d 42 d0             	lea    -0x30(%edx),%eax
     ead:	3c 09                	cmp    $0x9,%al
     eaf:	b8 00 00 00 00       	mov    $0x0,%eax
     eb4:	77 1f                	ja     ed5 <atoi+0x35>
     eb6:	8d 76 00             	lea    0x0(%esi),%esi
     eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     ec0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     ec3:	83 c1 01             	add    $0x1,%ecx
     ec6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     eca:	0f be 11             	movsbl (%ecx),%edx
     ecd:	8d 5a d0             	lea    -0x30(%edx),%ebx
     ed0:	80 fb 09             	cmp    $0x9,%bl
     ed3:	76 eb                	jbe    ec0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     ed5:	5b                   	pop    %ebx
     ed6:	5d                   	pop    %ebp
     ed7:	c3                   	ret    
     ed8:	90                   	nop
     ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ee0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     ee0:	55                   	push   %ebp
     ee1:	89 e5                	mov    %esp,%ebp
     ee3:	56                   	push   %esi
     ee4:	53                   	push   %ebx
     ee5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     ee8:	8b 45 08             	mov    0x8(%ebp),%eax
     eeb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     eee:	85 db                	test   %ebx,%ebx
     ef0:	7e 14                	jle    f06 <memmove+0x26>
     ef2:	31 d2                	xor    %edx,%edx
     ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     ef8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     efc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     eff:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f02:	39 da                	cmp    %ebx,%edx
     f04:	75 f2                	jne    ef8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     f06:	5b                   	pop    %ebx
     f07:	5e                   	pop    %esi
     f08:	5d                   	pop    %ebp
     f09:	c3                   	ret    

00000f0a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f0a:	b8 01 00 00 00       	mov    $0x1,%eax
     f0f:	cd 40                	int    $0x40
     f11:	c3                   	ret    

00000f12 <exit>:
SYSCALL(exit)
     f12:	b8 02 00 00 00       	mov    $0x2,%eax
     f17:	cd 40                	int    $0x40
     f19:	c3                   	ret    

00000f1a <wait>:
SYSCALL(wait)
     f1a:	b8 03 00 00 00       	mov    $0x3,%eax
     f1f:	cd 40                	int    $0x40
     f21:	c3                   	ret    

00000f22 <pipe>:
SYSCALL(pipe)
     f22:	b8 04 00 00 00       	mov    $0x4,%eax
     f27:	cd 40                	int    $0x40
     f29:	c3                   	ret    

00000f2a <read>:
SYSCALL(read)
     f2a:	b8 05 00 00 00       	mov    $0x5,%eax
     f2f:	cd 40                	int    $0x40
     f31:	c3                   	ret    

00000f32 <write>:
SYSCALL(write)
     f32:	b8 10 00 00 00       	mov    $0x10,%eax
     f37:	cd 40                	int    $0x40
     f39:	c3                   	ret    

00000f3a <close>:
SYSCALL(close)
     f3a:	b8 15 00 00 00       	mov    $0x15,%eax
     f3f:	cd 40                	int    $0x40
     f41:	c3                   	ret    

00000f42 <kill>:
SYSCALL(kill)
     f42:	b8 06 00 00 00       	mov    $0x6,%eax
     f47:	cd 40                	int    $0x40
     f49:	c3                   	ret    

00000f4a <exec>:
SYSCALL(exec)
     f4a:	b8 07 00 00 00       	mov    $0x7,%eax
     f4f:	cd 40                	int    $0x40
     f51:	c3                   	ret    

00000f52 <open>:
SYSCALL(open)
     f52:	b8 0f 00 00 00       	mov    $0xf,%eax
     f57:	cd 40                	int    $0x40
     f59:	c3                   	ret    

00000f5a <mknod>:
SYSCALL(mknod)
     f5a:	b8 11 00 00 00       	mov    $0x11,%eax
     f5f:	cd 40                	int    $0x40
     f61:	c3                   	ret    

00000f62 <unlink>:
SYSCALL(unlink)
     f62:	b8 12 00 00 00       	mov    $0x12,%eax
     f67:	cd 40                	int    $0x40
     f69:	c3                   	ret    

00000f6a <fstat>:
SYSCALL(fstat)
     f6a:	b8 08 00 00 00       	mov    $0x8,%eax
     f6f:	cd 40                	int    $0x40
     f71:	c3                   	ret    

00000f72 <link>:
SYSCALL(link)
     f72:	b8 13 00 00 00       	mov    $0x13,%eax
     f77:	cd 40                	int    $0x40
     f79:	c3                   	ret    

00000f7a <mkdir>:
SYSCALL(mkdir)
     f7a:	b8 14 00 00 00       	mov    $0x14,%eax
     f7f:	cd 40                	int    $0x40
     f81:	c3                   	ret    

00000f82 <chdir>:
SYSCALL(chdir)
     f82:	b8 09 00 00 00       	mov    $0x9,%eax
     f87:	cd 40                	int    $0x40
     f89:	c3                   	ret    

00000f8a <dup>:
SYSCALL(dup)
     f8a:	b8 0a 00 00 00       	mov    $0xa,%eax
     f8f:	cd 40                	int    $0x40
     f91:	c3                   	ret    

00000f92 <getpid>:
SYSCALL(getpid)
     f92:	b8 0b 00 00 00       	mov    $0xb,%eax
     f97:	cd 40                	int    $0x40
     f99:	c3                   	ret    

00000f9a <sbrk>:
SYSCALL(sbrk)
     f9a:	b8 0c 00 00 00       	mov    $0xc,%eax
     f9f:	cd 40                	int    $0x40
     fa1:	c3                   	ret    

00000fa2 <sleep>:
SYSCALL(sleep)
     fa2:	b8 0d 00 00 00       	mov    $0xd,%eax
     fa7:	cd 40                	int    $0x40
     fa9:	c3                   	ret    

00000faa <uptime>:
SYSCALL(uptime)
     faa:	b8 0e 00 00 00       	mov    $0xe,%eax
     faf:	cd 40                	int    $0x40
     fb1:	c3                   	ret    

00000fb2 <getpinfo>:
SYSCALL(getpinfo)
     fb2:	b8 16 00 00 00       	mov    $0x16,%eax
     fb7:	cd 40                	int    $0x40
     fb9:	c3                   	ret    
     fba:	66 90                	xchg   %ax,%ax
     fbc:	66 90                	xchg   %ax,%ax
     fbe:	66 90                	xchg   %ax,%ax

00000fc0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	57                   	push   %edi
     fc4:	56                   	push   %esi
     fc5:	53                   	push   %ebx
     fc6:	89 c6                	mov    %eax,%esi
     fc8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     fcb:	8b 5d 08             	mov    0x8(%ebp),%ebx
     fce:	85 db                	test   %ebx,%ebx
     fd0:	74 7e                	je     1050 <printint+0x90>
     fd2:	89 d0                	mov    %edx,%eax
     fd4:	c1 e8 1f             	shr    $0x1f,%eax
     fd7:	84 c0                	test   %al,%al
     fd9:	74 75                	je     1050 <printint+0x90>
    neg = 1;
    x = -xx;
     fdb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     fdd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     fe4:	f7 d8                	neg    %eax
     fe6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     fe9:	31 ff                	xor    %edi,%edi
     feb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     fee:	89 ce                	mov    %ecx,%esi
     ff0:	eb 08                	jmp    ffa <printint+0x3a>
     ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     ff8:	89 cf                	mov    %ecx,%edi
     ffa:	31 d2                	xor    %edx,%edx
     ffc:	8d 4f 01             	lea    0x1(%edi),%ecx
     fff:	f7 f6                	div    %esi
    1001:	0f b6 92 98 14 00 00 	movzbl 0x1498(%edx),%edx
  }while((x /= base) != 0);
    1008:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    100a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    100d:	75 e9                	jne    ff8 <printint+0x38>
  if(neg)
    100f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1012:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1015:	85 c0                	test   %eax,%eax
    1017:	74 08                	je     1021 <printint+0x61>
    buf[i++] = '-';
    1019:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    101e:	8d 4f 02             	lea    0x2(%edi),%ecx
    1021:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    1025:	8d 76 00             	lea    0x0(%esi),%esi
    1028:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    102b:	83 ec 04             	sub    $0x4,%esp
    102e:	83 ef 01             	sub    $0x1,%edi
    1031:	6a 01                	push   $0x1
    1033:	53                   	push   %ebx
    1034:	56                   	push   %esi
    1035:	88 45 d7             	mov    %al,-0x29(%ebp)
    1038:	e8 f5 fe ff ff       	call   f32 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    103d:	83 c4 10             	add    $0x10,%esp
    1040:	39 df                	cmp    %ebx,%edi
    1042:	75 e4                	jne    1028 <printint+0x68>
    putc(fd, buf[i]);
}
    1044:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1047:	5b                   	pop    %ebx
    1048:	5e                   	pop    %esi
    1049:	5f                   	pop    %edi
    104a:	5d                   	pop    %ebp
    104b:	c3                   	ret    
    104c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1050:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1052:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1059:	eb 8b                	jmp    fe6 <printint+0x26>
    105b:	90                   	nop
    105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001060 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	57                   	push   %edi
    1064:	56                   	push   %esi
    1065:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1066:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1069:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    106c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    106f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1072:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1075:	0f b6 1e             	movzbl (%esi),%ebx
    1078:	83 c6 01             	add    $0x1,%esi
    107b:	84 db                	test   %bl,%bl
    107d:	0f 84 b0 00 00 00    	je     1133 <printf+0xd3>
    1083:	31 d2                	xor    %edx,%edx
    1085:	eb 39                	jmp    10c0 <printf+0x60>
    1087:	89 f6                	mov    %esi,%esi
    1089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1090:	83 f8 25             	cmp    $0x25,%eax
    1093:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1096:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    109b:	74 18                	je     10b5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    109d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    10a6:	6a 01                	push   $0x1
    10a8:	50                   	push   %eax
    10a9:	57                   	push   %edi
    10aa:	e8 83 fe ff ff       	call   f32 <write>
    10af:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    10b2:	83 c4 10             	add    $0x10,%esp
    10b5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    10b8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    10bc:	84 db                	test   %bl,%bl
    10be:	74 73                	je     1133 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    10c0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    10c2:	0f be cb             	movsbl %bl,%ecx
    10c5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    10c8:	74 c6                	je     1090 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    10ca:	83 fa 25             	cmp    $0x25,%edx
    10cd:	75 e6                	jne    10b5 <printf+0x55>
      if(c == 'd'){
    10cf:	83 f8 64             	cmp    $0x64,%eax
    10d2:	0f 84 f8 00 00 00    	je     11d0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    10d8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    10de:	83 f9 70             	cmp    $0x70,%ecx
    10e1:	74 5d                	je     1140 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    10e3:	83 f8 73             	cmp    $0x73,%eax
    10e6:	0f 84 84 00 00 00    	je     1170 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    10ec:	83 f8 63             	cmp    $0x63,%eax
    10ef:	0f 84 ea 00 00 00    	je     11df <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    10f5:	83 f8 25             	cmp    $0x25,%eax
    10f8:	0f 84 c2 00 00 00    	je     11c0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    10fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1101:	83 ec 04             	sub    $0x4,%esp
    1104:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1108:	6a 01                	push   $0x1
    110a:	50                   	push   %eax
    110b:	57                   	push   %edi
    110c:	e8 21 fe ff ff       	call   f32 <write>
    1111:	83 c4 0c             	add    $0xc,%esp
    1114:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1117:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    111a:	6a 01                	push   $0x1
    111c:	50                   	push   %eax
    111d:	57                   	push   %edi
    111e:	83 c6 01             	add    $0x1,%esi
    1121:	e8 0c fe ff ff       	call   f32 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1126:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    112a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    112d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    112f:	84 db                	test   %bl,%bl
    1131:	75 8d                	jne    10c0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1133:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1136:	5b                   	pop    %ebx
    1137:	5e                   	pop    %esi
    1138:	5f                   	pop    %edi
    1139:	5d                   	pop    %ebp
    113a:	c3                   	ret    
    113b:	90                   	nop
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1140:	83 ec 0c             	sub    $0xc,%esp
    1143:	b9 10 00 00 00       	mov    $0x10,%ecx
    1148:	6a 00                	push   $0x0
    114a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    114d:	89 f8                	mov    %edi,%eax
    114f:	8b 13                	mov    (%ebx),%edx
    1151:	e8 6a fe ff ff       	call   fc0 <printint>
        ap++;
    1156:	89 d8                	mov    %ebx,%eax
    1158:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    115b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    115d:	83 c0 04             	add    $0x4,%eax
    1160:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1163:	e9 4d ff ff ff       	jmp    10b5 <printf+0x55>
    1168:	90                   	nop
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1170:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1173:	8b 18                	mov    (%eax),%ebx
        ap++;
    1175:	83 c0 04             	add    $0x4,%eax
    1178:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    117b:	b8 90 14 00 00       	mov    $0x1490,%eax
    1180:	85 db                	test   %ebx,%ebx
    1182:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    1185:	0f b6 03             	movzbl (%ebx),%eax
    1188:	84 c0                	test   %al,%al
    118a:	74 23                	je     11af <printf+0x14f>
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1190:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1193:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1196:	83 ec 04             	sub    $0x4,%esp
    1199:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    119b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    119e:	50                   	push   %eax
    119f:	57                   	push   %edi
    11a0:	e8 8d fd ff ff       	call   f32 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    11a5:	0f b6 03             	movzbl (%ebx),%eax
    11a8:	83 c4 10             	add    $0x10,%esp
    11ab:	84 c0                	test   %al,%al
    11ad:	75 e1                	jne    1190 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    11af:	31 d2                	xor    %edx,%edx
    11b1:	e9 ff fe ff ff       	jmp    10b5 <printf+0x55>
    11b6:	8d 76 00             	lea    0x0(%esi),%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    11c0:	83 ec 04             	sub    $0x4,%esp
    11c3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    11c6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    11c9:	6a 01                	push   $0x1
    11cb:	e9 4c ff ff ff       	jmp    111c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    11d0:	83 ec 0c             	sub    $0xc,%esp
    11d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    11d8:	6a 01                	push   $0x1
    11da:	e9 6b ff ff ff       	jmp    114a <printf+0xea>
    11df:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    11e2:	83 ec 04             	sub    $0x4,%esp
    11e5:	8b 03                	mov    (%ebx),%eax
    11e7:	6a 01                	push   $0x1
    11e9:	88 45 e4             	mov    %al,-0x1c(%ebp)
    11ec:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    11ef:	50                   	push   %eax
    11f0:	57                   	push   %edi
    11f1:	e8 3c fd ff ff       	call   f32 <write>
    11f6:	e9 5b ff ff ff       	jmp    1156 <printf+0xf6>
    11fb:	66 90                	xchg   %ax,%ax
    11fd:	66 90                	xchg   %ax,%ax
    11ff:	90                   	nop

00001200 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1200:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1201:	a1 00 2f 00 00       	mov    0x2f00,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1206:	89 e5                	mov    %esp,%ebp
    1208:	57                   	push   %edi
    1209:	56                   	push   %esi
    120a:	53                   	push   %ebx
    120b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    120e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1210:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1213:	39 c8                	cmp    %ecx,%eax
    1215:	73 19                	jae    1230 <free+0x30>
    1217:	89 f6                	mov    %esi,%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1220:	39 d1                	cmp    %edx,%ecx
    1222:	72 1c                	jb     1240 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1224:	39 d0                	cmp    %edx,%eax
    1226:	73 18                	jae    1240 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1228:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    122a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    122c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    122e:	72 f0                	jb     1220 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1230:	39 d0                	cmp    %edx,%eax
    1232:	72 f4                	jb     1228 <free+0x28>
    1234:	39 d1                	cmp    %edx,%ecx
    1236:	73 f0                	jae    1228 <free+0x28>
    1238:	90                   	nop
    1239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1240:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1243:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1246:	39 d7                	cmp    %edx,%edi
    1248:	74 19                	je     1263 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    124a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    124d:	8b 50 04             	mov    0x4(%eax),%edx
    1250:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1253:	39 f1                	cmp    %esi,%ecx
    1255:	74 23                	je     127a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1257:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1259:	a3 00 2f 00 00       	mov    %eax,0x2f00
}
    125e:	5b                   	pop    %ebx
    125f:	5e                   	pop    %esi
    1260:	5f                   	pop    %edi
    1261:	5d                   	pop    %ebp
    1262:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1263:	03 72 04             	add    0x4(%edx),%esi
    1266:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1269:	8b 10                	mov    (%eax),%edx
    126b:	8b 12                	mov    (%edx),%edx
    126d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1270:	8b 50 04             	mov    0x4(%eax),%edx
    1273:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1276:	39 f1                	cmp    %esi,%ecx
    1278:	75 dd                	jne    1257 <free+0x57>
    p->s.size += bp->s.size;
    127a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    127d:	a3 00 2f 00 00       	mov    %eax,0x2f00
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1282:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1285:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1288:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    128a:	5b                   	pop    %ebx
    128b:	5e                   	pop    %esi
    128c:	5f                   	pop    %edi
    128d:	5d                   	pop    %ebp
    128e:	c3                   	ret    
    128f:	90                   	nop

00001290 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	57                   	push   %edi
    1294:	56                   	push   %esi
    1295:	53                   	push   %ebx
    1296:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1299:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    129c:	8b 15 00 2f 00 00    	mov    0x2f00,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12a2:	8d 78 07             	lea    0x7(%eax),%edi
    12a5:	c1 ef 03             	shr    $0x3,%edi
    12a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    12ab:	85 d2                	test   %edx,%edx
    12ad:	0f 84 a3 00 00 00    	je     1356 <malloc+0xc6>
    12b3:	8b 02                	mov    (%edx),%eax
    12b5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    12b8:	39 cf                	cmp    %ecx,%edi
    12ba:	76 74                	jbe    1330 <malloc+0xa0>
    12bc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    12c2:	be 00 10 00 00       	mov    $0x1000,%esi
    12c7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    12ce:	0f 43 f7             	cmovae %edi,%esi
    12d1:	ba 00 80 00 00       	mov    $0x8000,%edx
    12d6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    12dc:	0f 46 da             	cmovbe %edx,%ebx
    12df:	eb 10                	jmp    12f1 <malloc+0x61>
    12e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    12ea:	8b 48 04             	mov    0x4(%eax),%ecx
    12ed:	39 cf                	cmp    %ecx,%edi
    12ef:	76 3f                	jbe    1330 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    12f1:	39 05 00 2f 00 00    	cmp    %eax,0x2f00
    12f7:	89 c2                	mov    %eax,%edx
    12f9:	75 ed                	jne    12e8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    12fb:	83 ec 0c             	sub    $0xc,%esp
    12fe:	53                   	push   %ebx
    12ff:	e8 96 fc ff ff       	call   f9a <sbrk>
  if(p == (char*)-1)
    1304:	83 c4 10             	add    $0x10,%esp
    1307:	83 f8 ff             	cmp    $0xffffffff,%eax
    130a:	74 1c                	je     1328 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    130c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    130f:	83 ec 0c             	sub    $0xc,%esp
    1312:	83 c0 08             	add    $0x8,%eax
    1315:	50                   	push   %eax
    1316:	e8 e5 fe ff ff       	call   1200 <free>
  return freep;
    131b:	8b 15 00 2f 00 00    	mov    0x2f00,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1321:	83 c4 10             	add    $0x10,%esp
    1324:	85 d2                	test   %edx,%edx
    1326:	75 c0                	jne    12e8 <malloc+0x58>
        return 0;
    1328:	31 c0                	xor    %eax,%eax
    132a:	eb 1c                	jmp    1348 <malloc+0xb8>
    132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1330:	39 cf                	cmp    %ecx,%edi
    1332:	74 1c                	je     1350 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1334:	29 f9                	sub    %edi,%ecx
    1336:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1339:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    133c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    133f:	89 15 00 2f 00 00    	mov    %edx,0x2f00
      return (void*)(p + 1);
    1345:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1348:	8d 65 f4             	lea    -0xc(%ebp),%esp
    134b:	5b                   	pop    %ebx
    134c:	5e                   	pop    %esi
    134d:	5f                   	pop    %edi
    134e:	5d                   	pop    %ebp
    134f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1350:	8b 08                	mov    (%eax),%ecx
    1352:	89 0a                	mov    %ecx,(%edx)
    1354:	eb e9                	jmp    133f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1356:	c7 05 00 2f 00 00 04 	movl   $0x2f04,0x2f00
    135d:	2f 00 00 
    1360:	c7 05 04 2f 00 00 04 	movl   $0x2f04,0x2f04
    1367:	2f 00 00 
    base.s.size = 0;
    136a:	b8 04 2f 00 00       	mov    $0x2f04,%eax
    136f:	c7 05 08 2f 00 00 00 	movl   $0x0,0x2f08
    1376:	00 00 00 
    1379:	e9 3e ff ff ff       	jmp    12bc <malloc+0x2c>
