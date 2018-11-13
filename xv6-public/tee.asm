
_tee:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

int dest,src,read_status,write_status;
char buff[512];

int
main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 01                	mov    (%ecx),%eax
  11:	8b 59 04             	mov    0x4(%ecx),%ebx
    if (argc == 2){
  14:	83 f8 02             	cmp    $0x2,%eax
  17:	0f 84 e3 00 00 00    	je     100 <main+0x100>
            printf(2, "tee failed : destination file not writable");
            exit(0);
        }
        printf(2,buff);

    }else if (argc == 3){
  1d:	83 f8 03             	cmp    $0x3,%eax
  20:	74 1a                	je     3c <main+0x3c>
            printf(2, "tee failed : destination file not writable");
            exit(0);
        }

    }else {
        printf(2, "tee failed : support only 1 or 2 arguments");
  22:	52                   	push   %edx
  23:	52                   	push   %edx
  24:	68 3c 09 00 00       	push   $0x93c
  29:	6a 02                	push   $0x2
  2b:	e8 30 05 00 00       	call   560 <printf>
        exit(0);
  30:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  37:	e8 d6 03 00 00       	call   412 <exit>
            exit(0);
        }
        printf(2,buff);

    }else if (argc == 3){
        src = open(argv[1], O_CREATE | O_RDWR);
  3c:	50                   	push   %eax
  3d:	50                   	push   %eax
  3e:	68 02 02 00 00       	push   $0x202
  43:	ff 73 04             	pushl  0x4(%ebx)
  46:	e8 07 04 00 00       	call   452 <open>
        if (src < 0 ) {
  4b:	83 c4 10             	add    $0x10,%esp
  4e:	85 c0                	test   %eax,%eax
            exit(0);
        }
        printf(2,buff);

    }else if (argc == 3){
        src = open(argv[1], O_CREATE | O_RDWR);
  50:	a3 68 0e 00 00       	mov    %eax,0xe68
        if (src < 0 ) {
  55:	0f 88 8b 00 00 00    	js     e6 <main+0xe6>
            printf(2, "tee failed : source file not found");
            exit(0);
        }
        read_status=read(src,buff,sizeof(char)*512);
  5b:	52                   	push   %edx
  5c:	68 00 02 00 00       	push   $0x200
  61:	68 60 0c 00 00       	push   $0xc60
  66:	50                   	push   %eax
  67:	e8 be 03 00 00       	call   42a <read>
        if (read_status < 0 ) {
  6c:	83 c4 10             	add    $0x10,%esp
  6f:	85 c0                	test   %eax,%eax
        src = open(argv[1], O_CREATE | O_RDWR);
        if (src < 0 ) {
            printf(2, "tee failed : source file not found");
            exit(0);
        }
        read_status=read(src,buff,sizeof(char)*512);
  71:	a3 60 0e 00 00       	mov    %eax,0xe60
        if (read_status < 0 ) {
  76:	0f 88 1b 01 00 00    	js     197 <main+0x197>
            printf(2, "tee failed : source file not readable");
            exit(0);
        }
        dest=open(argv[2], O_CREATE | O_RDWR);
  7c:	51                   	push   %ecx
  7d:	51                   	push   %ecx
  7e:	68 02 02 00 00       	push   $0x202
  83:	ff 73 08             	pushl  0x8(%ebx)
  86:	e8 c7 03 00 00       	call   452 <open>
        if (dest < 0 ) {
  8b:	83 c4 10             	add    $0x10,%esp
  8e:	85 c0                	test   %eax,%eax
        read_status=read(src,buff,sizeof(char)*512);
        if (read_status < 0 ) {
            printf(2, "tee failed : source file not readable");
            exit(0);
        }
        dest=open(argv[2], O_CREATE | O_RDWR);
  90:	a3 40 0c 00 00       	mov    %eax,0xc40
        if (dest < 0 ) {
  95:	0f 88 e2 00 00 00    	js     17d <main+0x17d>
            printf(2, "tee failed : destination file not found");
            exit(0);
        }

        write_status=write(dest,buff,sizeof(char)*strlen(buff));
  9b:	83 ec 0c             	sub    $0xc,%esp
  9e:	68 60 0c 00 00       	push   $0xc60
  a3:	e8 a8 01 00 00       	call   250 <strlen>
  a8:	83 c4 0c             	add    $0xc,%esp
  ab:	50                   	push   %eax
  ac:	68 60 0c 00 00       	push   $0xc60
  b1:	ff 35 40 0c 00 00    	pushl  0xc40
  b7:	e8 76 03 00 00       	call   432 <write>
        if (write_status < 0 ) {
  bc:	83 c4 10             	add    $0x10,%esp
  bf:	85 c0                	test   %eax,%eax
        if (dest < 0 ) {
            printf(2, "tee failed : destination file not found");
            exit(0);
        }

        write_status=write(dest,buff,sizeof(char)*strlen(buff));
  c1:	a3 64 0e 00 00       	mov    %eax,0xe64
        if (write_status < 0 ) {
  c6:	0f 88 e5 00 00 00    	js     1b1 <main+0x1b1>

    }else {
        printf(2, "tee failed : support only 1 or 2 arguments");
        exit(0);
    }
    printf(2,"Writing successful :-) \n");
  cc:	50                   	push   %eax
  cd:	50                   	push   %eax
  ce:	68 80 08 00 00       	push   $0x880
  d3:	6a 02                	push   $0x2
  d5:	e8 86 04 00 00       	call   560 <printf>

    exit(0);
  da:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  e1:	e8 2c 03 00 00       	call   412 <exit>
        printf(2,buff);

    }else if (argc == 3){
        src = open(argv[1], O_CREATE | O_RDWR);
        if (src < 0 ) {
            printf(2, "tee failed : source file not found");
  e6:	51                   	push   %ecx
  e7:	51                   	push   %ecx
  e8:	68 f0 08 00 00       	push   $0x8f0
  ed:	6a 02                	push   $0x2
  ef:	e8 6c 04 00 00       	call   560 <printf>
            exit(0);
  f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  fb:	e8 12 03 00 00       	call   412 <exit>
char buff[512];

int
main(int argc, char *argv[]){
    if (argc == 2){
        gets(buff,512);
 100:	50                   	push   %eax
 101:	50                   	push   %eax
 102:	68 00 02 00 00       	push   $0x200
 107:	68 60 0c 00 00       	push   $0xc60
 10c:	e8 cf 01 00 00       	call   2e0 <gets>
        printf(2,"\n");
 111:	58                   	pop    %eax
 112:	5a                   	pop    %edx
 113:	68 97 08 00 00       	push   $0x897
 118:	6a 02                	push   $0x2
 11a:	e8 41 04 00 00       	call   560 <printf>
        dest=open(argv[1], O_CREATE | O_RDWR);
 11f:	59                   	pop    %ecx
 120:	58                   	pop    %eax
 121:	68 02 02 00 00       	push   $0x202
 126:	ff 73 04             	pushl  0x4(%ebx)
 129:	e8 24 03 00 00       	call   452 <open>
        if (dest < 0 ){
 12e:	83 c4 10             	add    $0x10,%esp
 131:	85 c0                	test   %eax,%eax
int
main(int argc, char *argv[]){
    if (argc == 2){
        gets(buff,512);
        printf(2,"\n");
        dest=open(argv[1], O_CREATE | O_RDWR);
 133:	a3 40 0c 00 00       	mov    %eax,0xc40
        if (dest < 0 ){
 138:	78 43                	js     17d <main+0x17d>
            printf(2,"tee failed : destination file not found");
            exit(0);
        }

        write_status=write(dest,buff,sizeof(char)*strlen(buff));
 13a:	83 ec 0c             	sub    $0xc,%esp
 13d:	68 60 0c 00 00       	push   $0xc60
 142:	e8 09 01 00 00       	call   250 <strlen>
 147:	83 c4 0c             	add    $0xc,%esp
 14a:	50                   	push   %eax
 14b:	68 60 0c 00 00       	push   $0xc60
 150:	ff 35 40 0c 00 00    	pushl  0xc40
 156:	e8 d7 02 00 00       	call   432 <write>
        
        if (write_status < 0 ) {
 15b:	83 c4 10             	add    $0x10,%esp
 15e:	85 c0                	test   %eax,%eax
        if (dest < 0 ){
            printf(2,"tee failed : destination file not found");
            exit(0);
        }

        write_status=write(dest,buff,sizeof(char)*strlen(buff));
 160:	a3 64 0e 00 00       	mov    %eax,0xe64
        
        if (write_status < 0 ) {
 165:	78 4a                	js     1b1 <main+0x1b1>
            printf(2, "tee failed : destination file not writable");
            exit(0);
        }
        printf(2,buff);
 167:	50                   	push   %eax
 168:	50                   	push   %eax
 169:	68 60 0c 00 00       	push   $0xc60
 16e:	6a 02                	push   $0x2
 170:	e8 eb 03 00 00       	call   560 <printf>
 175:	83 c4 10             	add    $0x10,%esp
 178:	e9 4f ff ff ff       	jmp    cc <main+0xcc>
    if (argc == 2){
        gets(buff,512);
        printf(2,"\n");
        dest=open(argv[1], O_CREATE | O_RDWR);
        if (dest < 0 ){
            printf(2,"tee failed : destination file not found");
 17d:	50                   	push   %eax
 17e:	50                   	push   %eax
 17f:	68 9c 08 00 00       	push   $0x89c
 184:	6a 02                	push   $0x2
 186:	e8 d5 03 00 00       	call   560 <printf>
            exit(0);
 18b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 192:	e8 7b 02 00 00       	call   412 <exit>
            printf(2, "tee failed : source file not found");
            exit(0);
        }
        read_status=read(src,buff,sizeof(char)*512);
        if (read_status < 0 ) {
            printf(2, "tee failed : source file not readable");
 197:	53                   	push   %ebx
 198:	53                   	push   %ebx
 199:	68 14 09 00 00       	push   $0x914
 19e:	6a 02                	push   $0x2
 1a0:	e8 bb 03 00 00       	call   560 <printf>
            exit(0);
 1a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1ac:	e8 61 02 00 00       	call   412 <exit>
        }

        write_status=write(dest,buff,sizeof(char)*strlen(buff));
        
        if (write_status < 0 ) {
            printf(2, "tee failed : destination file not writable");
 1b1:	50                   	push   %eax
 1b2:	50                   	push   %eax
 1b3:	68 c4 08 00 00       	push   $0x8c4
 1b8:	6a 02                	push   $0x2
 1ba:	e8 a1 03 00 00       	call   560 <printf>
            exit(0);
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 47 02 00 00       	call   412 <exit>
 1cb:	66 90                	xchg   %ax,%ax
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1da:	89 c2                	mov    %eax,%edx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e0:	83 c1 01             	add    $0x1,%ecx
 1e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1e7:	83 c2 01             	add    $0x1,%edx
 1ea:	84 db                	test   %bl,%bl
 1ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 1ef:	75 ef                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1f1:	5b                   	pop    %ebx
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	8b 55 08             	mov    0x8(%ebp),%edx
 208:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20b:	0f b6 02             	movzbl (%edx),%eax
 20e:	0f b6 19             	movzbl (%ecx),%ebx
 211:	84 c0                	test   %al,%al
 213:	75 1e                	jne    233 <strcmp+0x33>
 215:	eb 29                	jmp    240 <strcmp+0x40>
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 220:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 223:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 226:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 229:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 22d:	84 c0                	test   %al,%al
 22f:	74 0f                	je     240 <strcmp+0x40>
 231:	89 f1                	mov    %esi,%ecx
 233:	38 d8                	cmp    %bl,%al
 235:	74 e9                	je     220 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 237:	29 d8                	sub    %ebx,%eax
}
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 240:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 242:	29 d8                	sub    %ebx,%eax
}
 244:	5b                   	pop    %ebx
 245:	5e                   	pop    %esi
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 39 00             	cmpb   $0x0,(%ecx)
 259:	74 12                	je     26d <strlen+0x1d>
 25b:	31 d2                	xor    %edx,%edx
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c2 01             	add    $0x1,%edx
 263:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 267:	89 d0                	mov    %edx,%eax
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 26d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	eb 0d                	jmp    280 <memset>
 273:	90                   	nop
 274:	90                   	nop
 275:	90                   	nop
 276:	90                   	nop
 277:	90                   	nop
 278:	90                   	nop
 279:	90                   	nop
 27a:	90                   	nop
 27b:	90                   	nop
 27c:	90                   	nop
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	89 d0                	mov    %edx,%eax
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	84 d2                	test   %dl,%dl
 2af:	74 1d                	je     2ce <strchr+0x2e>
    if(*s == c)
 2b1:	38 d3                	cmp    %dl,%bl
 2b3:	89 d9                	mov    %ebx,%ecx
 2b5:	75 0d                	jne    2c4 <strchr+0x24>
 2b7:	eb 17                	jmp    2d0 <strchr+0x30>
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c0:	38 ca                	cmp    %cl,%dl
 2c2:	74 0c                	je     2d0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2c4:	83 c0 01             	add    $0x1,%eax
 2c7:	0f b6 10             	movzbl (%eax),%edx
 2ca:	84 d2                	test   %dl,%dl
 2cc:	75 f2                	jne    2c0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2ce:	31 c0                	xor    %eax,%eax
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 2e8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 2eb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ee:	eb 29                	jmp    319 <gets+0x39>
    cc = read(0, &c, 1);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	6a 01                	push   $0x1
 2f5:	57                   	push   %edi
 2f6:	6a 00                	push   $0x0
 2f8:	e8 2d 01 00 00       	call   42a <read>
    if(cc < 1)
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	85 c0                	test   %eax,%eax
 302:	7e 1d                	jle    321 <gets+0x41>
      break;
    buf[i++] = c;
 304:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 308:	8b 55 08             	mov    0x8(%ebp),%edx
 30b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 30d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 30f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 313:	74 1b                	je     330 <gets+0x50>
 315:	3c 0d                	cmp    $0xd,%al
 317:	74 17                	je     330 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 319:	8d 5e 01             	lea    0x1(%esi),%ebx
 31c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31f:	7c cf                	jl     2f0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 321:	8b 45 08             	mov    0x8(%ebp),%eax
 324:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 328:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32b:	5b                   	pop    %ebx
 32c:	5e                   	pop    %esi
 32d:	5f                   	pop    %edi
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 330:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 333:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 335:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 339:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33c:	5b                   	pop    %ebx
 33d:	5e                   	pop    %esi
 33e:	5f                   	pop    %edi
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	eb 0d                	jmp    350 <stat>
 343:	90                   	nop
 344:	90                   	nop
 345:	90                   	nop
 346:	90                   	nop
 347:	90                   	nop
 348:	90                   	nop
 349:	90                   	nop
 34a:	90                   	nop
 34b:	90                   	nop
 34c:	90                   	nop
 34d:	90                   	nop
 34e:	90                   	nop
 34f:	90                   	nop

00000350 <stat>:

int
stat(const char *n, struct stat *st)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 00                	push   $0x0
 35a:	ff 75 08             	pushl  0x8(%ebp)
 35d:	e8 f0 00 00 00       	call   452 <open>
  if(fd < 0)
 362:	83 c4 10             	add    $0x10,%esp
 365:	85 c0                	test   %eax,%eax
 367:	78 27                	js     390 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 369:	83 ec 08             	sub    $0x8,%esp
 36c:	ff 75 0c             	pushl  0xc(%ebp)
 36f:	89 c3                	mov    %eax,%ebx
 371:	50                   	push   %eax
 372:	e8 f3 00 00 00       	call   46a <fstat>
 377:	89 c6                	mov    %eax,%esi
  close(fd);
 379:	89 1c 24             	mov    %ebx,(%esp)
 37c:	e8 b9 00 00 00       	call   43a <close>
  return r;
 381:	83 c4 10             	add    $0x10,%esp
 384:	89 f0                	mov    %esi,%eax
}
 386:	8d 65 f8             	lea    -0x8(%ebp),%esp
 389:	5b                   	pop    %ebx
 38a:	5e                   	pop    %esi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 390:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 395:	eb ef                	jmp    386 <stat+0x36>
 397:	89 f6                	mov    %esi,%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a7:	0f be 11             	movsbl (%ecx),%edx
 3aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 3ad:	3c 09                	cmp    $0x9,%al
 3af:	b8 00 00 00 00       	mov    $0x0,%eax
 3b4:	77 1f                	ja     3d5 <atoi+0x35>
 3b6:	8d 76 00             	lea    0x0(%esi),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3c0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3c3:	83 c1 01             	add    $0x1,%ecx
 3c6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ca:	0f be 11             	movsbl (%ecx),%edx
 3cd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3d0:	80 fb 09             	cmp    $0x9,%bl
 3d3:	76 eb                	jbe    3c0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3d5:	5b                   	pop    %ebx
 3d6:	5d                   	pop    %ebp
 3d7:	c3                   	ret    
 3d8:	90                   	nop
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
 3e5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3e8:	8b 45 08             	mov    0x8(%ebp),%eax
 3eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ee:	85 db                	test   %ebx,%ebx
 3f0:	7e 14                	jle    406 <memmove+0x26>
 3f2:	31 d2                	xor    %edx,%edx
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3ff:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 402:	39 da                	cmp    %ebx,%edx
 404:	75 f2                	jne    3f8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 406:	5b                   	pop    %ebx
 407:	5e                   	pop    %esi
 408:	5d                   	pop    %ebp
 409:	c3                   	ret    

0000040a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40a:	b8 01 00 00 00       	mov    $0x1,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <exit>:
SYSCALL(exit)
 412:	b8 02 00 00 00       	mov    $0x2,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <wait>:
SYSCALL(wait)
 41a:	b8 03 00 00 00       	mov    $0x3,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <pipe>:
SYSCALL(pipe)
 422:	b8 04 00 00 00       	mov    $0x4,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <read>:
SYSCALL(read)
 42a:	b8 05 00 00 00       	mov    $0x5,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <write>:
SYSCALL(write)
 432:	b8 10 00 00 00       	mov    $0x10,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <close>:
SYSCALL(close)
 43a:	b8 15 00 00 00       	mov    $0x15,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <kill>:
SYSCALL(kill)
 442:	b8 06 00 00 00       	mov    $0x6,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <exec>:
SYSCALL(exec)
 44a:	b8 07 00 00 00       	mov    $0x7,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <open>:
SYSCALL(open)
 452:	b8 0f 00 00 00       	mov    $0xf,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <mknod>:
SYSCALL(mknod)
 45a:	b8 11 00 00 00       	mov    $0x11,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <unlink>:
SYSCALL(unlink)
 462:	b8 12 00 00 00       	mov    $0x12,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <fstat>:
SYSCALL(fstat)
 46a:	b8 08 00 00 00       	mov    $0x8,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <link>:
SYSCALL(link)
 472:	b8 13 00 00 00       	mov    $0x13,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <mkdir>:
SYSCALL(mkdir)
 47a:	b8 14 00 00 00       	mov    $0x14,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <chdir>:
SYSCALL(chdir)
 482:	b8 09 00 00 00       	mov    $0x9,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <dup>:
SYSCALL(dup)
 48a:	b8 0a 00 00 00       	mov    $0xa,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <getpid>:
SYSCALL(getpid)
 492:	b8 0b 00 00 00       	mov    $0xb,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <sbrk>:
SYSCALL(sbrk)
 49a:	b8 0c 00 00 00       	mov    $0xc,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <sleep>:
SYSCALL(sleep)
 4a2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <uptime>:
SYSCALL(uptime)
 4aa:	b8 0e 00 00 00       	mov    $0xe,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <getpinfo>:
SYSCALL(getpinfo)
 4b2:	b8 16 00 00 00       	mov    $0x16,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    
 4ba:	66 90                	xchg   %ax,%ax
 4bc:	66 90                	xchg   %ax,%ax
 4be:	66 90                	xchg   %ax,%ax

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	89 c6                	mov    %eax,%esi
 4c8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ce:	85 db                	test   %ebx,%ebx
 4d0:	74 7e                	je     550 <printint+0x90>
 4d2:	89 d0                	mov    %edx,%eax
 4d4:	c1 e8 1f             	shr    $0x1f,%eax
 4d7:	84 c0                	test   %al,%al
 4d9:	74 75                	je     550 <printint+0x90>
    neg = 1;
    x = -xx;
 4db:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 4dd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 4e4:	f7 d8                	neg    %eax
 4e6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4e9:	31 ff                	xor    %edi,%edi
 4eb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4ee:	89 ce                	mov    %ecx,%esi
 4f0:	eb 08                	jmp    4fa <printint+0x3a>
 4f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4f8:	89 cf                	mov    %ecx,%edi
 4fa:	31 d2                	xor    %edx,%edx
 4fc:	8d 4f 01             	lea    0x1(%edi),%ecx
 4ff:	f7 f6                	div    %esi
 501:	0f b6 92 70 09 00 00 	movzbl 0x970(%edx),%edx
  }while((x /= base) != 0);
 508:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 50a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 50d:	75 e9                	jne    4f8 <printint+0x38>
  if(neg)
 50f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 512:	8b 75 c0             	mov    -0x40(%ebp),%esi
 515:	85 c0                	test   %eax,%eax
 517:	74 08                	je     521 <printint+0x61>
    buf[i++] = '-';
 519:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 51e:	8d 4f 02             	lea    0x2(%edi),%ecx
 521:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 525:	8d 76 00             	lea    0x0(%esi),%esi
 528:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 52b:	83 ec 04             	sub    $0x4,%esp
 52e:	83 ef 01             	sub    $0x1,%edi
 531:	6a 01                	push   $0x1
 533:	53                   	push   %ebx
 534:	56                   	push   %esi
 535:	88 45 d7             	mov    %al,-0x29(%ebp)
 538:	e8 f5 fe ff ff       	call   432 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 53d:	83 c4 10             	add    $0x10,%esp
 540:	39 df                	cmp    %ebx,%edi
 542:	75 e4                	jne    528 <printint+0x68>
    putc(fd, buf[i]);
}
 544:	8d 65 f4             	lea    -0xc(%ebp),%esp
 547:	5b                   	pop    %ebx
 548:	5e                   	pop    %esi
 549:	5f                   	pop    %edi
 54a:	5d                   	pop    %ebp
 54b:	c3                   	ret    
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 550:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 552:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 559:	eb 8b                	jmp    4e6 <printint+0x26>
 55b:	90                   	nop
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000560 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 566:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 569:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 56c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 56f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 572:	89 45 d0             	mov    %eax,-0x30(%ebp)
 575:	0f b6 1e             	movzbl (%esi),%ebx
 578:	83 c6 01             	add    $0x1,%esi
 57b:	84 db                	test   %bl,%bl
 57d:	0f 84 b0 00 00 00    	je     633 <printf+0xd3>
 583:	31 d2                	xor    %edx,%edx
 585:	eb 39                	jmp    5c0 <printf+0x60>
 587:	89 f6                	mov    %esi,%esi
 589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 590:	83 f8 25             	cmp    $0x25,%eax
 593:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 596:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 59b:	74 18                	je     5b5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 59d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5a6:	6a 01                	push   $0x1
 5a8:	50                   	push   %eax
 5a9:	57                   	push   %edi
 5aa:	e8 83 fe ff ff       	call   432 <write>
 5af:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5b2:	83 c4 10             	add    $0x10,%esp
 5b5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5bc:	84 db                	test   %bl,%bl
 5be:	74 73                	je     633 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 5c0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 5c2:	0f be cb             	movsbl %bl,%ecx
 5c5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5c8:	74 c6                	je     590 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5ca:	83 fa 25             	cmp    $0x25,%edx
 5cd:	75 e6                	jne    5b5 <printf+0x55>
      if(c == 'd'){
 5cf:	83 f8 64             	cmp    $0x64,%eax
 5d2:	0f 84 f8 00 00 00    	je     6d0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5d8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5de:	83 f9 70             	cmp    $0x70,%ecx
 5e1:	74 5d                	je     640 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5e3:	83 f8 73             	cmp    $0x73,%eax
 5e6:	0f 84 84 00 00 00    	je     670 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ec:	83 f8 63             	cmp    $0x63,%eax
 5ef:	0f 84 ea 00 00 00    	je     6df <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5f5:	83 f8 25             	cmp    $0x25,%eax
 5f8:	0f 84 c2 00 00 00    	je     6c0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 601:	83 ec 04             	sub    $0x4,%esp
 604:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 608:	6a 01                	push   $0x1
 60a:	50                   	push   %eax
 60b:	57                   	push   %edi
 60c:	e8 21 fe ff ff       	call   432 <write>
 611:	83 c4 0c             	add    $0xc,%esp
 614:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 617:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 61a:	6a 01                	push   $0x1
 61c:	50                   	push   %eax
 61d:	57                   	push   %edi
 61e:	83 c6 01             	add    $0x1,%esi
 621:	e8 0c fe ff ff       	call   432 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 626:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 62a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 62d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 62f:	84 db                	test   %bl,%bl
 631:	75 8d                	jne    5c0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 633:	8d 65 f4             	lea    -0xc(%ebp),%esp
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
 638:	5f                   	pop    %edi
 639:	5d                   	pop    %ebp
 63a:	c3                   	ret    
 63b:	90                   	nop
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 640:	83 ec 0c             	sub    $0xc,%esp
 643:	b9 10 00 00 00       	mov    $0x10,%ecx
 648:	6a 00                	push   $0x0
 64a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 64d:	89 f8                	mov    %edi,%eax
 64f:	8b 13                	mov    (%ebx),%edx
 651:	e8 6a fe ff ff       	call   4c0 <printint>
        ap++;
 656:	89 d8                	mov    %ebx,%eax
 658:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 65b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 65d:	83 c0 04             	add    $0x4,%eax
 660:	89 45 d0             	mov    %eax,-0x30(%ebp)
 663:	e9 4d ff ff ff       	jmp    5b5 <printf+0x55>
 668:	90                   	nop
 669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 670:	8b 45 d0             	mov    -0x30(%ebp),%eax
 673:	8b 18                	mov    (%eax),%ebx
        ap++;
 675:	83 c0 04             	add    $0x4,%eax
 678:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 67b:	b8 68 09 00 00       	mov    $0x968,%eax
 680:	85 db                	test   %ebx,%ebx
 682:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 685:	0f b6 03             	movzbl (%ebx),%eax
 688:	84 c0                	test   %al,%al
 68a:	74 23                	je     6af <printf+0x14f>
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 690:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 693:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 696:	83 ec 04             	sub    $0x4,%esp
 699:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 69b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 69e:	50                   	push   %eax
 69f:	57                   	push   %edi
 6a0:	e8 8d fd ff ff       	call   432 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6a5:	0f b6 03             	movzbl (%ebx),%eax
 6a8:	83 c4 10             	add    $0x10,%esp
 6ab:	84 c0                	test   %al,%al
 6ad:	75 e1                	jne    690 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6af:	31 d2                	xor    %edx,%edx
 6b1:	e9 ff fe ff ff       	jmp    5b5 <printf+0x55>
 6b6:	8d 76 00             	lea    0x0(%esi),%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6c6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6c9:	6a 01                	push   $0x1
 6cb:	e9 4c ff ff ff       	jmp    61c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d8:	6a 01                	push   $0x1
 6da:	e9 6b ff ff ff       	jmp    64a <printf+0xea>
 6df:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6e2:	83 ec 04             	sub    $0x4,%esp
 6e5:	8b 03                	mov    (%ebx),%eax
 6e7:	6a 01                	push   $0x1
 6e9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 6ec:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6ef:	50                   	push   %eax
 6f0:	57                   	push   %edi
 6f1:	e8 3c fd ff ff       	call   432 <write>
 6f6:	e9 5b ff ff ff       	jmp    656 <printf+0xf6>
 6fb:	66 90                	xchg   %ax,%ax
 6fd:	66 90                	xchg   %ax,%ax
 6ff:	90                   	nop

00000700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 20 0c 00 00       	mov    0xc20,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 710:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 713:	39 c8                	cmp    %ecx,%eax
 715:	73 19                	jae    730 <free+0x30>
 717:	89 f6                	mov    %esi,%esi
 719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 720:	39 d1                	cmp    %edx,%ecx
 722:	72 1c                	jb     740 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 724:	39 d0                	cmp    %edx,%eax
 726:	73 18                	jae    740 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 728:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72e:	72 f0                	jb     720 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 730:	39 d0                	cmp    %edx,%eax
 732:	72 f4                	jb     728 <free+0x28>
 734:	39 d1                	cmp    %edx,%ecx
 736:	73 f0                	jae    728 <free+0x28>
 738:	90                   	nop
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 740:	8b 73 fc             	mov    -0x4(%ebx),%esi
 743:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 746:	39 d7                	cmp    %edx,%edi
 748:	74 19                	je     763 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 74a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 74d:	8b 50 04             	mov    0x4(%eax),%edx
 750:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 753:	39 f1                	cmp    %esi,%ecx
 755:	74 23                	je     77a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 757:	89 08                	mov    %ecx,(%eax)
  freep = p;
 759:	a3 20 0c 00 00       	mov    %eax,0xc20
}
 75e:	5b                   	pop    %ebx
 75f:	5e                   	pop    %esi
 760:	5f                   	pop    %edi
 761:	5d                   	pop    %ebp
 762:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 763:	03 72 04             	add    0x4(%edx),%esi
 766:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 769:	8b 10                	mov    (%eax),%edx
 76b:	8b 12                	mov    (%edx),%edx
 76d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 770:	8b 50 04             	mov    0x4(%eax),%edx
 773:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 776:	39 f1                	cmp    %esi,%ecx
 778:	75 dd                	jne    757 <free+0x57>
    p->s.size += bp->s.size;
 77a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 77d:	a3 20 0c 00 00       	mov    %eax,0xc20
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 782:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 785:	8b 53 f8             	mov    -0x8(%ebx),%edx
 788:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 78a:	5b                   	pop    %ebx
 78b:	5e                   	pop    %esi
 78c:	5f                   	pop    %edi
 78d:	5d                   	pop    %ebp
 78e:	c3                   	ret    
 78f:	90                   	nop

00000790 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 799:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 79c:	8b 15 20 0c 00 00    	mov    0xc20,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	8d 78 07             	lea    0x7(%eax),%edi
 7a5:	c1 ef 03             	shr    $0x3,%edi
 7a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7ab:	85 d2                	test   %edx,%edx
 7ad:	0f 84 a3 00 00 00    	je     856 <malloc+0xc6>
 7b3:	8b 02                	mov    (%edx),%eax
 7b5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7b8:	39 cf                	cmp    %ecx,%edi
 7ba:	76 74                	jbe    830 <malloc+0xa0>
 7bc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7c2:	be 00 10 00 00       	mov    $0x1000,%esi
 7c7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 7ce:	0f 43 f7             	cmovae %edi,%esi
 7d1:	ba 00 80 00 00       	mov    $0x8000,%edx
 7d6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 7dc:	0f 46 da             	cmovbe %edx,%ebx
 7df:	eb 10                	jmp    7f1 <malloc+0x61>
 7e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ea:	8b 48 04             	mov    0x4(%eax),%ecx
 7ed:	39 cf                	cmp    %ecx,%edi
 7ef:	76 3f                	jbe    830 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f1:	39 05 20 0c 00 00    	cmp    %eax,0xc20
 7f7:	89 c2                	mov    %eax,%edx
 7f9:	75 ed                	jne    7e8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7fb:	83 ec 0c             	sub    $0xc,%esp
 7fe:	53                   	push   %ebx
 7ff:	e8 96 fc ff ff       	call   49a <sbrk>
  if(p == (char*)-1)
 804:	83 c4 10             	add    $0x10,%esp
 807:	83 f8 ff             	cmp    $0xffffffff,%eax
 80a:	74 1c                	je     828 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 80c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 80f:	83 ec 0c             	sub    $0xc,%esp
 812:	83 c0 08             	add    $0x8,%eax
 815:	50                   	push   %eax
 816:	e8 e5 fe ff ff       	call   700 <free>
  return freep;
 81b:	8b 15 20 0c 00 00    	mov    0xc20,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 821:	83 c4 10             	add    $0x10,%esp
 824:	85 d2                	test   %edx,%edx
 826:	75 c0                	jne    7e8 <malloc+0x58>
        return 0;
 828:	31 c0                	xor    %eax,%eax
 82a:	eb 1c                	jmp    848 <malloc+0xb8>
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 830:	39 cf                	cmp    %ecx,%edi
 832:	74 1c                	je     850 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 834:	29 f9                	sub    %edi,%ecx
 836:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 839:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 83c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 83f:	89 15 20 0c 00 00    	mov    %edx,0xc20
      return (void*)(p + 1);
 845:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 848:	8d 65 f4             	lea    -0xc(%ebp),%esp
 84b:	5b                   	pop    %ebx
 84c:	5e                   	pop    %esi
 84d:	5f                   	pop    %edi
 84e:	5d                   	pop    %ebp
 84f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 850:	8b 08                	mov    (%eax),%ecx
 852:	89 0a                	mov    %ecx,(%edx)
 854:	eb e9                	jmp    83f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 856:	c7 05 20 0c 00 00 24 	movl   $0xc24,0xc20
 85d:	0c 00 00 
 860:	c7 05 24 0c 00 00 24 	movl   $0xc24,0xc24
 867:	0c 00 00 
    base.s.size = 0;
 86a:	b8 24 0c 00 00       	mov    $0xc24,%eax
 86f:	c7 05 28 0c 00 00 00 	movl   $0x0,0xc28
 876:	00 00 00 
 879:	e9 3e ff ff ff       	jmp    7bc <malloc+0x2c>
