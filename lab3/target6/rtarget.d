
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	48 83 ec 08          	sub    $0x8,%rsp
  401004:	48 8b 05 ed 5f 00 00 	mov    0x5fed(%rip),%rax        # 406ff8 <__gmon_start__>
  40100b:	48 85 c0             	test   %rax,%rax
  40100e:	74 02                	je     401012 <_init+0x12>
  401010:	ff d0                	callq  *%rax
  401012:	48 83 c4 08          	add    $0x8,%rsp
  401016:	c3                   	retq   

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 5f 00 00    	pushq  0x5fe2(%rip)        # 407008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 5f 00 00    	jmpq   *0x5fe4(%rip)        # 407010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <strcasecmp@plt>:
  401030:	ff 25 e2 5f 00 00    	jmpq   *0x5fe2(%rip)        # 407018 <strcasecmp@GLIBC_2.2.5>
  401036:	68 00 00 00 00       	pushq  $0x0
  40103b:	e9 e0 ff ff ff       	jmpq   401020 <.plt>

0000000000401040 <__errno_location@plt>:
  401040:	ff 25 da 5f 00 00    	jmpq   *0x5fda(%rip)        # 407020 <__errno_location@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	pushq  $0x1
  40104b:	e9 d0 ff ff ff       	jmpq   401020 <.plt>

0000000000401050 <srandom@plt>:
  401050:	ff 25 d2 5f 00 00    	jmpq   *0x5fd2(%rip)        # 407028 <srandom@GLIBC_2.2.5>
  401056:	68 02 00 00 00       	pushq  $0x2
  40105b:	e9 c0 ff ff ff       	jmpq   401020 <.plt>

0000000000401060 <strncmp@plt>:
  401060:	ff 25 ca 5f 00 00    	jmpq   *0x5fca(%rip)        # 407030 <strncmp@GLIBC_2.2.5>
  401066:	68 03 00 00 00       	pushq  $0x3
  40106b:	e9 b0 ff ff ff       	jmpq   401020 <.plt>

0000000000401070 <strcpy@plt>:
  401070:	ff 25 c2 5f 00 00    	jmpq   *0x5fc2(%rip)        # 407038 <strcpy@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	pushq  $0x4
  40107b:	e9 a0 ff ff ff       	jmpq   401020 <.plt>

0000000000401080 <puts@plt>:
  401080:	ff 25 ba 5f 00 00    	jmpq   *0x5fba(%rip)        # 407040 <puts@GLIBC_2.2.5>
  401086:	68 05 00 00 00       	pushq  $0x5
  40108b:	e9 90 ff ff ff       	jmpq   401020 <.plt>

0000000000401090 <write@plt>:
  401090:	ff 25 b2 5f 00 00    	jmpq   *0x5fb2(%rip)        # 407048 <write@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	pushq  $0x6
  40109b:	e9 80 ff ff ff       	jmpq   401020 <.plt>

00000000004010a0 <strlen@plt>:
  4010a0:	ff 25 aa 5f 00 00    	jmpq   *0x5faa(%rip)        # 407050 <strlen@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	pushq  $0x7
  4010ab:	e9 70 ff ff ff       	jmpq   401020 <.plt>

00000000004010b0 <mmap@plt>:
  4010b0:	ff 25 a2 5f 00 00    	jmpq   *0x5fa2(%rip)        # 407058 <mmap@GLIBC_2.2.5>
  4010b6:	68 08 00 00 00       	pushq  $0x8
  4010bb:	e9 60 ff ff ff       	jmpq   401020 <.plt>

00000000004010c0 <printf@plt>:
  4010c0:	ff 25 9a 5f 00 00    	jmpq   *0x5f9a(%rip)        # 407060 <printf@GLIBC_2.2.5>
  4010c6:	68 09 00 00 00       	pushq  $0x9
  4010cb:	e9 50 ff ff ff       	jmpq   401020 <.plt>

00000000004010d0 <memset@plt>:
  4010d0:	ff 25 92 5f 00 00    	jmpq   *0x5f92(%rip)        # 407068 <memset@GLIBC_2.2.5>
  4010d6:	68 0a 00 00 00       	pushq  $0xa
  4010db:	e9 40 ff ff ff       	jmpq   401020 <.plt>

00000000004010e0 <alarm@plt>:
  4010e0:	ff 25 8a 5f 00 00    	jmpq   *0x5f8a(%rip)        # 407070 <alarm@GLIBC_2.2.5>
  4010e6:	68 0b 00 00 00       	pushq  $0xb
  4010eb:	e9 30 ff ff ff       	jmpq   401020 <.plt>

00000000004010f0 <close@plt>:
  4010f0:	ff 25 82 5f 00 00    	jmpq   *0x5f82(%rip)        # 407078 <close@GLIBC_2.2.5>
  4010f6:	68 0c 00 00 00       	pushq  $0xc
  4010fb:	e9 20 ff ff ff       	jmpq   401020 <.plt>

0000000000401100 <read@plt>:
  401100:	ff 25 7a 5f 00 00    	jmpq   *0x5f7a(%rip)        # 407080 <read@GLIBC_2.2.5>
  401106:	68 0d 00 00 00       	pushq  $0xd
  40110b:	e9 10 ff ff ff       	jmpq   401020 <.plt>

0000000000401110 <signal@plt>:
  401110:	ff 25 72 5f 00 00    	jmpq   *0x5f72(%rip)        # 407088 <signal@GLIBC_2.2.5>
  401116:	68 0e 00 00 00       	pushq  $0xe
  40111b:	e9 00 ff ff ff       	jmpq   401020 <.plt>

0000000000401120 <gethostbyname@plt>:
  401120:	ff 25 6a 5f 00 00    	jmpq   *0x5f6a(%rip)        # 407090 <gethostbyname@GLIBC_2.2.5>
  401126:	68 0f 00 00 00       	pushq  $0xf
  40112b:	e9 f0 fe ff ff       	jmpq   401020 <.plt>

0000000000401130 <fprintf@plt>:
  401130:	ff 25 62 5f 00 00    	jmpq   *0x5f62(%rip)        # 407098 <fprintf@GLIBC_2.2.5>
  401136:	68 10 00 00 00       	pushq  $0x10
  40113b:	e9 e0 fe ff ff       	jmpq   401020 <.plt>

0000000000401140 <strtol@plt>:
  401140:	ff 25 5a 5f 00 00    	jmpq   *0x5f5a(%rip)        # 4070a0 <strtol@GLIBC_2.2.5>
  401146:	68 11 00 00 00       	pushq  $0x11
  40114b:	e9 d0 fe ff ff       	jmpq   401020 <.plt>

0000000000401150 <memcpy@plt>:
  401150:	ff 25 52 5f 00 00    	jmpq   *0x5f52(%rip)        # 4070a8 <memcpy@GLIBC_2.14>
  401156:	68 12 00 00 00       	pushq  $0x12
  40115b:	e9 c0 fe ff ff       	jmpq   401020 <.plt>

0000000000401160 <time@plt>:
  401160:	ff 25 4a 5f 00 00    	jmpq   *0x5f4a(%rip)        # 4070b0 <time@GLIBC_2.2.5>
  401166:	68 13 00 00 00       	pushq  $0x13
  40116b:	e9 b0 fe ff ff       	jmpq   401020 <.plt>

0000000000401170 <random@plt>:
  401170:	ff 25 42 5f 00 00    	jmpq   *0x5f42(%rip)        # 4070b8 <random@GLIBC_2.2.5>
  401176:	68 14 00 00 00       	pushq  $0x14
  40117b:	e9 a0 fe ff ff       	jmpq   401020 <.plt>

0000000000401180 <__isoc99_sscanf@plt>:
  401180:	ff 25 3a 5f 00 00    	jmpq   *0x5f3a(%rip)        # 4070c0 <__isoc99_sscanf@GLIBC_2.7>
  401186:	68 15 00 00 00       	pushq  $0x15
  40118b:	e9 90 fe ff ff       	jmpq   401020 <.plt>

0000000000401190 <munmap@plt>:
  401190:	ff 25 32 5f 00 00    	jmpq   *0x5f32(%rip)        # 4070c8 <munmap@GLIBC_2.2.5>
  401196:	68 16 00 00 00       	pushq  $0x16
  40119b:	e9 80 fe ff ff       	jmpq   401020 <.plt>

00000000004011a0 <memmove@plt>:
  4011a0:	ff 25 2a 5f 00 00    	jmpq   *0x5f2a(%rip)        # 4070d0 <memmove@GLIBC_2.2.5>
  4011a6:	68 17 00 00 00       	pushq  $0x17
  4011ab:	e9 70 fe ff ff       	jmpq   401020 <.plt>

00000000004011b0 <fopen@plt>:
  4011b0:	ff 25 22 5f 00 00    	jmpq   *0x5f22(%rip)        # 4070d8 <fopen@GLIBC_2.2.5>
  4011b6:	68 18 00 00 00       	pushq  $0x18
  4011bb:	e9 60 fe ff ff       	jmpq   401020 <.plt>

00000000004011c0 <getopt@plt>:
  4011c0:	ff 25 1a 5f 00 00    	jmpq   *0x5f1a(%rip)        # 4070e0 <getopt@GLIBC_2.2.5>
  4011c6:	68 19 00 00 00       	pushq  $0x19
  4011cb:	e9 50 fe ff ff       	jmpq   401020 <.plt>

00000000004011d0 <strtoul@plt>:
  4011d0:	ff 25 12 5f 00 00    	jmpq   *0x5f12(%rip)        # 4070e8 <strtoul@GLIBC_2.2.5>
  4011d6:	68 1a 00 00 00       	pushq  $0x1a
  4011db:	e9 40 fe ff ff       	jmpq   401020 <.plt>

00000000004011e0 <gethostname@plt>:
  4011e0:	ff 25 0a 5f 00 00    	jmpq   *0x5f0a(%rip)        # 4070f0 <gethostname@GLIBC_2.2.5>
  4011e6:	68 1b 00 00 00       	pushq  $0x1b
  4011eb:	e9 30 fe ff ff       	jmpq   401020 <.plt>

00000000004011f0 <sprintf@plt>:
  4011f0:	ff 25 02 5f 00 00    	jmpq   *0x5f02(%rip)        # 4070f8 <sprintf@GLIBC_2.2.5>
  4011f6:	68 1c 00 00 00       	pushq  $0x1c
  4011fb:	e9 20 fe ff ff       	jmpq   401020 <.plt>

0000000000401200 <exit@plt>:
  401200:	ff 25 fa 5e 00 00    	jmpq   *0x5efa(%rip)        # 407100 <exit@GLIBC_2.2.5>
  401206:	68 1d 00 00 00       	pushq  $0x1d
  40120b:	e9 10 fe ff ff       	jmpq   401020 <.plt>

0000000000401210 <connect@plt>:
  401210:	ff 25 f2 5e 00 00    	jmpq   *0x5ef2(%rip)        # 407108 <connect@GLIBC_2.2.5>
  401216:	68 1e 00 00 00       	pushq  $0x1e
  40121b:	e9 00 fe ff ff       	jmpq   401020 <.plt>

0000000000401220 <getc@plt>:
  401220:	ff 25 ea 5e 00 00    	jmpq   *0x5eea(%rip)        # 407110 <getc@GLIBC_2.2.5>
  401226:	68 1f 00 00 00       	pushq  $0x1f
  40122b:	e9 f0 fd ff ff       	jmpq   401020 <.plt>

0000000000401230 <socket@plt>:
  401230:	ff 25 e2 5e 00 00    	jmpq   *0x5ee2(%rip)        # 407118 <socket@GLIBC_2.2.5>
  401236:	68 20 00 00 00       	pushq  $0x20
  40123b:	e9 e0 fd ff ff       	jmpq   401020 <.plt>

Disassembly of section .text:

0000000000401240 <_start>:
  401240:	31 ed                	xor    %ebp,%ebp
  401242:	49 89 d1             	mov    %rdx,%r9
  401245:	5e                   	pop    %rsi
  401246:	48 89 e2             	mov    %rsp,%rdx
  401249:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40124d:	50                   	push   %rax
  40124e:	54                   	push   %rsp
  40124f:	49 c7 c0 10 32 40 00 	mov    $0x403210,%r8
  401256:	48 c7 c1 b0 31 40 00 	mov    $0x4031b0,%rcx
  40125d:	48 c7 c7 df 14 40 00 	mov    $0x4014df,%rdi
  401264:	ff 15 86 5d 00 00    	callq  *0x5d86(%rip)        # 406ff0 <__libc_start_main@GLIBC_2.2.5>
  40126a:	f4                   	hlt    
  40126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401270 <_dl_relocate_static_pie>:
  401270:	c3                   	retq   
  401271:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401278:	00 00 00 
  40127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401280 <deregister_tm_clones>:
  401280:	b8 98 74 40 00       	mov    $0x407498,%eax
  401285:	48 3d 98 74 40 00    	cmp    $0x407498,%rax
  40128b:	74 13                	je     4012a0 <deregister_tm_clones+0x20>
  40128d:	b8 00 00 00 00       	mov    $0x0,%eax
  401292:	48 85 c0             	test   %rax,%rax
  401295:	74 09                	je     4012a0 <deregister_tm_clones+0x20>
  401297:	bf 98 74 40 00       	mov    $0x407498,%edi
  40129c:	ff e0                	jmpq   *%rax
  40129e:	66 90                	xchg   %ax,%ax
  4012a0:	c3                   	retq   
  4012a1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4012a8:	00 00 00 00 
  4012ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012b0 <register_tm_clones>:
  4012b0:	be 98 74 40 00       	mov    $0x407498,%esi
  4012b5:	48 81 ee 98 74 40 00 	sub    $0x407498,%rsi
  4012bc:	48 89 f0             	mov    %rsi,%rax
  4012bf:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4012c3:	48 c1 f8 03          	sar    $0x3,%rax
  4012c7:	48 01 c6             	add    %rax,%rsi
  4012ca:	48 d1 fe             	sar    %rsi
  4012cd:	74 11                	je     4012e0 <register_tm_clones+0x30>
  4012cf:	b8 00 00 00 00       	mov    $0x0,%eax
  4012d4:	48 85 c0             	test   %rax,%rax
  4012d7:	74 07                	je     4012e0 <register_tm_clones+0x30>
  4012d9:	bf 98 74 40 00       	mov    $0x407498,%edi
  4012de:	ff e0                	jmpq   *%rax
  4012e0:	c3                   	retq   
  4012e1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4012e8:	00 00 00 00 
  4012ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012f0 <__do_global_dtors_aux>:
  4012f0:	80 3d f1 61 00 00 00 	cmpb   $0x0,0x61f1(%rip)        # 4074e8 <completed.0>
  4012f7:	75 17                	jne    401310 <__do_global_dtors_aux+0x20>
  4012f9:	55                   	push   %rbp
  4012fa:	48 89 e5             	mov    %rsp,%rbp
  4012fd:	e8 7e ff ff ff       	callq  401280 <deregister_tm_clones>
  401302:	c6 05 df 61 00 00 01 	movb   $0x1,0x61df(%rip)        # 4074e8 <completed.0>
  401309:	5d                   	pop    %rbp
  40130a:	c3                   	retq   
  40130b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401310:	c3                   	retq   
  401311:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401318:	00 00 00 00 
  40131c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401320 <frame_dummy>:
  401320:	eb 8e                	jmp    4012b0 <register_tm_clones>

0000000000401322 <usage>:
  401322:	48 83 ec 08          	sub    $0x8,%rsp
  401326:	48 89 fe             	mov    %rdi,%rsi
  401329:	83 3d 00 62 00 00 00 	cmpl   $0x0,0x6200(%rip)        # 407530 <is_checker>
  401330:	74 4b                	je     40137d <usage+0x5b>
  401332:	48 8d 3d cf 2c 00 00 	lea    0x2ccf(%rip),%rdi        # 404008 <_IO_stdin_used+0x8>
  401339:	b8 00 00 00 00       	mov    $0x0,%eax
  40133e:	e8 7d fd ff ff       	callq  4010c0 <printf@plt>
  401343:	48 8d 3d f6 2c 00 00 	lea    0x2cf6(%rip),%rdi        # 404040 <_IO_stdin_used+0x40>
  40134a:	e8 31 fd ff ff       	callq  401080 <puts@plt>
  40134f:	48 8d 3d 22 2e 00 00 	lea    0x2e22(%rip),%rdi        # 404178 <_IO_stdin_used+0x178>
  401356:	e8 25 fd ff ff       	callq  401080 <puts@plt>
  40135b:	48 8d 3d 06 2d 00 00 	lea    0x2d06(%rip),%rdi        # 404068 <_IO_stdin_used+0x68>
  401362:	e8 19 fd ff ff       	callq  401080 <puts@plt>
  401367:	48 8d 3d 24 2e 00 00 	lea    0x2e24(%rip),%rdi        # 404192 <_IO_stdin_used+0x192>
  40136e:	e8 0d fd ff ff       	callq  401080 <puts@plt>
  401373:	bf 00 00 00 00       	mov    $0x0,%edi
  401378:	e8 83 fe ff ff       	callq  401200 <exit@plt>
  40137d:	48 8d 3d 2a 2e 00 00 	lea    0x2e2a(%rip),%rdi        # 4041ae <_IO_stdin_used+0x1ae>
  401384:	b8 00 00 00 00       	mov    $0x0,%eax
  401389:	e8 32 fd ff ff       	callq  4010c0 <printf@plt>
  40138e:	48 8d 3d fb 2c 00 00 	lea    0x2cfb(%rip),%rdi        # 404090 <_IO_stdin_used+0x90>
  401395:	e8 e6 fc ff ff       	callq  401080 <puts@plt>
  40139a:	48 8d 3d 17 2d 00 00 	lea    0x2d17(%rip),%rdi        # 4040b8 <_IO_stdin_used+0xb8>
  4013a1:	e8 da fc ff ff       	callq  401080 <puts@plt>
  4013a6:	48 8d 3d 1f 2e 00 00 	lea    0x2e1f(%rip),%rdi        # 4041cc <_IO_stdin_used+0x1cc>
  4013ad:	e8 ce fc ff ff       	callq  401080 <puts@plt>
  4013b2:	eb bf                	jmp    401373 <usage+0x51>

00000000004013b4 <initialize_target>:
  4013b4:	55                   	push   %rbp
  4013b5:	53                   	push   %rbx
  4013b6:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  4013bd:	89 f5                	mov    %esi,%ebp
  4013bf:	89 3d 5b 61 00 00    	mov    %edi,0x615b(%rip)        # 407520 <check_level>
  4013c5:	8b 3d 65 5d 00 00    	mov    0x5d65(%rip),%edi        # 407130 <target_id>
  4013cb:	e8 ba 1d 00 00       	callq  40318a <gencookie>
  4013d0:	89 c7                	mov    %eax,%edi
  4013d2:	89 05 54 61 00 00    	mov    %eax,0x6154(%rip)        # 40752c <cookie>
  4013d8:	e8 ad 1d 00 00       	callq  40318a <gencookie>
  4013dd:	89 05 45 61 00 00    	mov    %eax,0x6145(%rip)        # 407528 <authkey>
  4013e3:	8b 05 47 5d 00 00    	mov    0x5d47(%rip),%eax        # 407130 <target_id>
  4013e9:	8d 78 01             	lea    0x1(%rax),%edi
  4013ec:	e8 5f fc ff ff       	callq  401050 <srandom@plt>
  4013f1:	e8 7a fd ff ff       	callq  401170 <random@plt>
  4013f6:	48 89 c7             	mov    %rax,%rdi
  4013f9:	e8 b6 02 00 00       	callq  4016b4 <scramble>
  4013fe:	89 c3                	mov    %eax,%ebx
  401400:	85 ed                	test   %ebp,%ebp
  401402:	75 3d                	jne    401441 <initialize_target+0x8d>
  401404:	b8 00 00 00 00       	mov    $0x0,%eax
  401409:	01 d8                	add    %ebx,%eax
  40140b:	0f b7 c0             	movzwl %ax,%eax
  40140e:	8d 04 c5 00 01 00 00 	lea    0x100(,%rax,8),%eax
  401415:	89 c0                	mov    %eax,%eax
  401417:	48 89 05 72 60 00 00 	mov    %rax,0x6072(%rip)        # 407490 <buf_offset>
  40141e:	c6 05 c4 60 00 00 72 	movb   $0x72,0x60c4(%rip)        # 4074e9 <target_prefix>
  401425:	83 3d 5c 60 00 00 00 	cmpl   $0x0,0x605c(%rip)        # 407488 <notify>
  40142c:	74 09                	je     401437 <initialize_target+0x83>
  40142e:	83 3d fb 60 00 00 00 	cmpl   $0x0,0x60fb(%rip)        # 407530 <is_checker>
  401435:	74 23                	je     40145a <initialize_target+0xa6>
  401437:	48 81 c4 08 21 00 00 	add    $0x2108,%rsp
  40143e:	5b                   	pop    %rbx
  40143f:	5d                   	pop    %rbp
  401440:	c3                   	retq   
  401441:	bf 00 00 00 00       	mov    $0x0,%edi
  401446:	e8 15 fd ff ff       	callq  401160 <time@plt>
  40144b:	48 89 c7             	mov    %rax,%rdi
  40144e:	e8 fd fb ff ff       	callq  401050 <srandom@plt>
  401453:	e8 18 fd ff ff       	callq  401170 <random@plt>
  401458:	eb af                	jmp    401409 <initialize_target+0x55>
  40145a:	48 89 e7             	mov    %rsp,%rdi
  40145d:	be 00 01 00 00       	mov    $0x100,%esi
  401462:	e8 79 fd ff ff       	callq  4011e0 <gethostname@plt>
  401467:	89 c3                	mov    %eax,%ebx
  401469:	85 c0                	test   %eax,%eax
  40146b:	75 24                	jne    401491 <initialize_target+0xdd>
  40146d:	48 63 c3             	movslq %ebx,%rax
  401470:	48 8d 15 e9 5c 00 00 	lea    0x5ce9(%rip),%rdx        # 407160 <host_table>
  401477:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
  40147b:	48 85 ff             	test   %rdi,%rdi
  40147e:	74 27                	je     4014a7 <initialize_target+0xf3>
  401480:	48 89 e6             	mov    %rsp,%rsi
  401483:	e8 a8 fb ff ff       	callq  401030 <strcasecmp@plt>
  401488:	85 c0                	test   %eax,%eax
  40148a:	74 1b                	je     4014a7 <initialize_target+0xf3>
  40148c:	83 c3 01             	add    $0x1,%ebx
  40148f:	eb dc                	jmp    40146d <initialize_target+0xb9>
  401491:	48 8d 3d 50 2c 00 00 	lea    0x2c50(%rip),%rdi        # 4040e8 <_IO_stdin_used+0xe8>
  401498:	e8 e3 fb ff ff       	callq  401080 <puts@plt>
  40149d:	bf 08 00 00 00       	mov    $0x8,%edi
  4014a2:	e8 59 fd ff ff       	callq  401200 <exit@plt>
  4014a7:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  4014ae:	00 
  4014af:	e8 3f 1a 00 00       	callq  402ef3 <init_driver>
  4014b4:	85 c0                	test   %eax,%eax
  4014b6:	0f 89 7b ff ff ff    	jns    401437 <initialize_target+0x83>
  4014bc:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  4014c3:	00 
  4014c4:	48 8d 3d 55 2c 00 00 	lea    0x2c55(%rip),%rdi        # 404120 <_IO_stdin_used+0x120>
  4014cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4014d0:	e8 eb fb ff ff       	callq  4010c0 <printf@plt>
  4014d5:	bf 08 00 00 00       	mov    $0x8,%edi
  4014da:	e8 21 fd ff ff       	callq  401200 <exit@plt>

00000000004014df <main>:
  4014df:	41 56                	push   %r14
  4014e1:	41 55                	push   %r13
  4014e3:	41 54                	push   %r12
  4014e5:	55                   	push   %rbp
  4014e6:	53                   	push   %rbx
  4014e7:	89 fd                	mov    %edi,%ebp
  4014e9:	48 89 f3             	mov    %rsi,%rbx
  4014ec:	48 c7 c6 05 23 40 00 	mov    $0x402305,%rsi
  4014f3:	bf 0b 00 00 00       	mov    $0xb,%edi
  4014f8:	e8 13 fc ff ff       	callq  401110 <signal@plt>
  4014fd:	48 c7 c6 b1 22 40 00 	mov    $0x4022b1,%rsi
  401504:	bf 07 00 00 00       	mov    $0x7,%edi
  401509:	e8 02 fc ff ff       	callq  401110 <signal@plt>
  40150e:	48 c7 c6 59 23 40 00 	mov    $0x402359,%rsi
  401515:	bf 04 00 00 00       	mov    $0x4,%edi
  40151a:	e8 f1 fb ff ff       	callq  401110 <signal@plt>
  40151f:	83 3d 0a 60 00 00 00 	cmpl   $0x0,0x600a(%rip)        # 407530 <is_checker>
  401526:	75 26                	jne    40154e <main+0x6f>
  401528:	4c 8d 25 be 2c 00 00 	lea    0x2cbe(%rip),%r12        # 4041ed <_IO_stdin_used+0x1ed>
  40152f:	48 8b 05 6a 5f 00 00 	mov    0x5f6a(%rip),%rax        # 4074a0 <stdin@@GLIBC_2.2.5>
  401536:	48 89 05 db 5f 00 00 	mov    %rax,0x5fdb(%rip)        # 407518 <infile>
  40153d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401543:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401549:	e9 88 00 00 00       	jmpq   4015d6 <main+0xf7>
  40154e:	48 c7 c6 ad 23 40 00 	mov    $0x4023ad,%rsi
  401555:	bf 0e 00 00 00       	mov    $0xe,%edi
  40155a:	e8 b1 fb ff ff       	callq  401110 <signal@plt>
  40155f:	bf 05 00 00 00       	mov    $0x5,%edi
  401564:	e8 77 fb ff ff       	callq  4010e0 <alarm@plt>
  401569:	4c 8d 25 75 2c 00 00 	lea    0x2c75(%rip),%r12        # 4041e5 <_IO_stdin_used+0x1e5>
  401570:	eb bd                	jmp    40152f <main+0x50>
  401572:	48 8b 3b             	mov    (%rbx),%rdi
  401575:	e8 a8 fd ff ff       	callq  401322 <usage>
  40157a:	48 8d 35 f4 2e 00 00 	lea    0x2ef4(%rip),%rsi        # 404475 <_IO_stdin_used+0x475>
  401581:	48 8b 3d 38 5f 00 00 	mov    0x5f38(%rip),%rdi        # 4074c0 <optarg@@GLIBC_2.2.5>
  401588:	e8 23 fc ff ff       	callq  4011b0 <fopen@plt>
  40158d:	48 89 05 84 5f 00 00 	mov    %rax,0x5f84(%rip)        # 407518 <infile>
  401594:	48 85 c0             	test   %rax,%rax
  401597:	75 3d                	jne    4015d6 <main+0xf7>
  401599:	48 8b 15 20 5f 00 00 	mov    0x5f20(%rip),%rdx        # 4074c0 <optarg@@GLIBC_2.2.5>
  4015a0:	48 8d 35 4b 2c 00 00 	lea    0x2c4b(%rip),%rsi        # 4041f2 <_IO_stdin_used+0x1f2>
  4015a7:	48 8b 3d 32 5f 00 00 	mov    0x5f32(%rip),%rdi        # 4074e0 <stderr@@GLIBC_2.2.5>
  4015ae:	e8 7d fb ff ff       	callq  401130 <fprintf@plt>
  4015b3:	b8 01 00 00 00       	mov    $0x1,%eax
  4015b8:	e9 ce 00 00 00       	jmpq   40168b <main+0x1ac>
  4015bd:	ba 10 00 00 00       	mov    $0x10,%edx
  4015c2:	be 00 00 00 00       	mov    $0x0,%esi
  4015c7:	48 8b 3d f2 5e 00 00 	mov    0x5ef2(%rip),%rdi        # 4074c0 <optarg@@GLIBC_2.2.5>
  4015ce:	e8 fd fb ff ff       	callq  4011d0 <strtoul@plt>
  4015d3:	41 89 c6             	mov    %eax,%r14d
  4015d6:	4c 89 e2             	mov    %r12,%rdx
  4015d9:	48 89 de             	mov    %rbx,%rsi
  4015dc:	89 ef                	mov    %ebp,%edi
  4015de:	e8 dd fb ff ff       	callq  4011c0 <getopt@plt>
  4015e3:	3c ff                	cmp    $0xff,%al
  4015e5:	74 5d                	je     401644 <main+0x165>
  4015e7:	0f be f0             	movsbl %al,%esi
  4015ea:	83 e8 61             	sub    $0x61,%eax
  4015ed:	3c 10                	cmp    $0x10,%al
  4015ef:	77 3a                	ja     40162b <main+0x14c>
  4015f1:	0f b6 c0             	movzbl %al,%eax
  4015f4:	48 8d 15 35 2c 00 00 	lea    0x2c35(%rip),%rdx        # 404230 <_IO_stdin_used+0x230>
  4015fb:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  4015ff:	48 01 d0             	add    %rdx,%rax
  401602:	ff e0                	jmpq   *%rax
  401604:	ba 0a 00 00 00       	mov    $0xa,%edx
  401609:	be 00 00 00 00       	mov    $0x0,%esi
  40160e:	48 8b 3d ab 5e 00 00 	mov    0x5eab(%rip),%rdi        # 4074c0 <optarg@@GLIBC_2.2.5>
  401615:	e8 26 fb ff ff       	callq  401140 <strtol@plt>
  40161a:	41 89 c5             	mov    %eax,%r13d
  40161d:	eb b7                	jmp    4015d6 <main+0xf7>
  40161f:	c7 05 5f 5e 00 00 00 	movl   $0x0,0x5e5f(%rip)        # 407488 <notify>
  401626:	00 00 00 
  401629:	eb ab                	jmp    4015d6 <main+0xf7>
  40162b:	48 8d 3d dd 2b 00 00 	lea    0x2bdd(%rip),%rdi        # 40420f <_IO_stdin_used+0x20f>
  401632:	b8 00 00 00 00       	mov    $0x0,%eax
  401637:	e8 84 fa ff ff       	callq  4010c0 <printf@plt>
  40163c:	48 8b 3b             	mov    (%rbx),%rdi
  40163f:	e8 de fc ff ff       	callq  401322 <usage>
  401644:	be 01 00 00 00       	mov    $0x1,%esi
  401649:	44 89 ef             	mov    %r13d,%edi
  40164c:	e8 63 fd ff ff       	callq  4013b4 <initialize_target>
  401651:	83 3d d8 5e 00 00 00 	cmpl   $0x0,0x5ed8(%rip)        # 407530 <is_checker>
  401658:	74 09                	je     401663 <main+0x184>
  40165a:	44 39 35 c7 5e 00 00 	cmp    %r14d,0x5ec7(%rip)        # 407528 <authkey>
  401661:	75 31                	jne    401694 <main+0x1b5>
  401663:	8b 35 c3 5e 00 00    	mov    0x5ec3(%rip),%esi        # 40752c <cookie>
  401669:	48 8d 3d b2 2b 00 00 	lea    0x2bb2(%rip),%rdi        # 404222 <_IO_stdin_used+0x222>
  401670:	b8 00 00 00 00       	mov    $0x0,%eax
  401675:	e8 46 fa ff ff       	callq  4010c0 <printf@plt>
  40167a:	48 8b 3d 0f 5e 00 00 	mov    0x5e0f(%rip),%rdi        # 407490 <buf_offset>
  401681:	e8 79 0d 00 00       	callq  4023ff <launch>
  401686:	b8 00 00 00 00       	mov    $0x0,%eax
  40168b:	5b                   	pop    %rbx
  40168c:	5d                   	pop    %rbp
  40168d:	41 5c                	pop    %r12
  40168f:	41 5d                	pop    %r13
  401691:	41 5e                	pop    %r14
  401693:	c3                   	retq   
  401694:	44 89 f6             	mov    %r14d,%esi
  401697:	48 8d 3d aa 2a 00 00 	lea    0x2aaa(%rip),%rdi        # 404148 <_IO_stdin_used+0x148>
  40169e:	b8 00 00 00 00       	mov    $0x0,%eax
  4016a3:	e8 18 fa ff ff       	callq  4010c0 <printf@plt>
  4016a8:	b8 00 00 00 00       	mov    $0x0,%eax
  4016ad:	e8 d3 08 00 00       	callq  401f85 <check_fail>
  4016b2:	eb af                	jmp    401663 <main+0x184>

00000000004016b4 <scramble>:
  4016b4:	b8 00 00 00 00       	mov    $0x0,%eax
  4016b9:	eb 11                	jmp    4016cc <scramble+0x18>
  4016bb:	69 d0 43 e2 00 00    	imul   $0xe243,%eax,%edx
  4016c1:	01 fa                	add    %edi,%edx
  4016c3:	89 c1                	mov    %eax,%ecx
  4016c5:	89 54 8c d0          	mov    %edx,-0x30(%rsp,%rcx,4)
  4016c9:	83 c0 01             	add    $0x1,%eax
  4016cc:	83 f8 09             	cmp    $0x9,%eax
  4016cf:	76 ea                	jbe    4016bb <scramble+0x7>
  4016d1:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4016d5:	69 c0 3b 07 00 00    	imul   $0x73b,%eax,%eax
  4016db:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4016df:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4016e3:	69 c0 6d 1a 00 00    	imul   $0x1a6d,%eax,%eax
  4016e9:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4016ed:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4016f1:	69 c0 7a 3b 00 00    	imul   $0x3b7a,%eax,%eax
  4016f7:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4016fb:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4016ff:	69 c0 50 17 00 00    	imul   $0x1750,%eax,%eax
  401705:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401709:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40170d:	69 c0 73 86 00 00    	imul   $0x8673,%eax,%eax
  401713:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401717:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40171b:	69 c0 e3 0f 00 00    	imul   $0xfe3,%eax,%eax
  401721:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401725:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401729:	69 c0 a9 d9 00 00    	imul   $0xd9a9,%eax,%eax
  40172f:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401733:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401737:	69 c0 f2 a5 00 00    	imul   $0xa5f2,%eax,%eax
  40173d:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401741:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401745:	69 c0 72 0c 00 00    	imul   $0xc72,%eax,%eax
  40174b:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40174f:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401753:	69 c0 78 97 00 00    	imul   $0x9778,%eax,%eax
  401759:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40175d:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401761:	69 c0 7c a8 00 00    	imul   $0xa87c,%eax,%eax
  401767:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40176b:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40176f:	69 c0 cd 18 00 00    	imul   $0x18cd,%eax,%eax
  401775:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401779:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40177d:	69 c0 01 9e 00 00    	imul   $0x9e01,%eax,%eax
  401783:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401787:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40178b:	69 c0 c1 20 00 00    	imul   $0x20c1,%eax,%eax
  401791:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401795:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401799:	69 c0 4d 25 00 00    	imul   $0x254d,%eax,%eax
  40179f:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4017a3:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4017a7:	69 c0 b2 85 00 00    	imul   $0x85b2,%eax,%eax
  4017ad:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4017b1:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4017b5:	69 c0 66 9d 00 00    	imul   $0x9d66,%eax,%eax
  4017bb:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4017bf:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4017c3:	69 c0 a3 bf 00 00    	imul   $0xbfa3,%eax,%eax
  4017c9:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4017cd:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4017d1:	69 c0 b1 fb 00 00    	imul   $0xfbb1,%eax,%eax
  4017d7:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4017db:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4017df:	69 c0 19 63 00 00    	imul   $0x6319,%eax,%eax
  4017e5:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4017e9:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4017ed:	69 c0 dd 72 00 00    	imul   $0x72dd,%eax,%eax
  4017f3:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4017f7:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4017fb:	69 c0 0a 8c 00 00    	imul   $0x8c0a,%eax,%eax
  401801:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401805:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401809:	69 c0 b4 14 00 00    	imul   $0x14b4,%eax,%eax
  40180f:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401813:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401817:	69 c0 09 16 00 00    	imul   $0x1609,%eax,%eax
  40181d:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401821:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401825:	69 c0 5d 0b 00 00    	imul   $0xb5d,%eax,%eax
  40182b:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40182f:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401833:	69 c0 2a 4a 00 00    	imul   $0x4a2a,%eax,%eax
  401839:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40183d:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401841:	69 c0 69 13 00 00    	imul   $0x1369,%eax,%eax
  401847:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40184b:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40184f:	69 c0 a5 46 00 00    	imul   $0x46a5,%eax,%eax
  401855:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401859:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40185d:	69 c0 68 2c 00 00    	imul   $0x2c68,%eax,%eax
  401863:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401867:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40186b:	69 c0 d8 54 00 00    	imul   $0x54d8,%eax,%eax
  401871:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401875:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401879:	69 c0 1d 68 00 00    	imul   $0x681d,%eax,%eax
  40187f:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401883:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401887:	69 c0 3e 7e 00 00    	imul   $0x7e3e,%eax,%eax
  40188d:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401891:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401895:	69 c0 aa 7a 00 00    	imul   $0x7aaa,%eax,%eax
  40189b:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40189f:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4018a3:	69 c0 63 de 00 00    	imul   $0xde63,%eax,%eax
  4018a9:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4018ad:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4018b1:	69 c0 d5 14 00 00    	imul   $0x14d5,%eax,%eax
  4018b7:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4018bb:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4018bf:	69 c0 7f f8 00 00    	imul   $0xf87f,%eax,%eax
  4018c5:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4018c9:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4018cd:	69 c0 79 b4 00 00    	imul   $0xb479,%eax,%eax
  4018d3:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4018d7:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4018db:	69 c0 3a d4 00 00    	imul   $0xd43a,%eax,%eax
  4018e1:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4018e5:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4018e9:	69 c0 86 b6 00 00    	imul   $0xb686,%eax,%eax
  4018ef:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4018f3:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4018f7:	69 c0 54 ea 00 00    	imul   $0xea54,%eax,%eax
  4018fd:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401901:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401905:	69 c0 c4 97 00 00    	imul   $0x97c4,%eax,%eax
  40190b:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40190f:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401913:	69 c0 bc 75 00 00    	imul   $0x75bc,%eax,%eax
  401919:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40191d:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401921:	69 c0 76 97 00 00    	imul   $0x9776,%eax,%eax
  401927:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40192b:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40192f:	69 c0 97 5c 00 00    	imul   $0x5c97,%eax,%eax
  401935:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401939:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40193d:	69 c0 c9 23 00 00    	imul   $0x23c9,%eax,%eax
  401943:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401947:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40194b:	69 c0 93 15 00 00    	imul   $0x1593,%eax,%eax
  401951:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401955:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401959:	69 c0 fa 8b 00 00    	imul   $0x8bfa,%eax,%eax
  40195f:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401963:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401967:	69 c0 6a 91 00 00    	imul   $0x916a,%eax,%eax
  40196d:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401971:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401975:	69 c0 b3 d1 00 00    	imul   $0xd1b3,%eax,%eax
  40197b:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40197f:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401983:	69 c0 ff 7c 00 00    	imul   $0x7cff,%eax,%eax
  401989:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40198d:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401991:	69 c0 4a b1 00 00    	imul   $0xb14a,%eax,%eax
  401997:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40199b:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40199f:	69 c0 3b 6e 00 00    	imul   $0x6e3b,%eax,%eax
  4019a5:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4019a9:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4019ad:	69 c0 07 fa 00 00    	imul   $0xfa07,%eax,%eax
  4019b3:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4019b7:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4019bb:	69 c0 f2 2e 00 00    	imul   $0x2ef2,%eax,%eax
  4019c1:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4019c5:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4019c9:	69 c0 b8 2c 00 00    	imul   $0x2cb8,%eax,%eax
  4019cf:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4019d3:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4019d7:	69 c0 71 72 00 00    	imul   $0x7271,%eax,%eax
  4019dd:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4019e1:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4019e5:	69 c0 c5 4d 00 00    	imul   $0x4dc5,%eax,%eax
  4019eb:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4019ef:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4019f3:	69 c0 a9 6f 00 00    	imul   $0x6fa9,%eax,%eax
  4019f9:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4019fd:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401a01:	69 c0 90 a4 00 00    	imul   $0xa490,%eax,%eax
  401a07:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401a0b:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401a0f:	69 c0 19 a9 00 00    	imul   $0xa919,%eax,%eax
  401a15:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401a19:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401a1d:	69 c0 b0 7d 00 00    	imul   $0x7db0,%eax,%eax
  401a23:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401a27:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401a2b:	69 c0 3f 54 00 00    	imul   $0x543f,%eax,%eax
  401a31:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401a35:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401a39:	69 c0 7e 52 00 00    	imul   $0x527e,%eax,%eax
  401a3f:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401a43:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401a47:	69 c0 4e 10 00 00    	imul   $0x104e,%eax,%eax
  401a4d:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401a51:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401a55:	69 c0 77 55 00 00    	imul   $0x5577,%eax,%eax
  401a5b:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401a5f:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401a63:	69 c0 b9 0a 00 00    	imul   $0xab9,%eax,%eax
  401a69:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401a6d:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401a71:	69 c0 cb 02 00 00    	imul   $0x2cb,%eax,%eax
  401a77:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401a7b:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401a7f:	69 c0 85 6c 00 00    	imul   $0x6c85,%eax,%eax
  401a85:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401a89:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401a8d:	69 c0 6a bb 00 00    	imul   $0xbb6a,%eax,%eax
  401a93:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401a97:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401a9b:	69 c0 60 ad 00 00    	imul   $0xad60,%eax,%eax
  401aa1:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401aa5:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401aa9:	69 c0 be b4 00 00    	imul   $0xb4be,%eax,%eax
  401aaf:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401ab3:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401ab7:	69 c0 9f ac 00 00    	imul   $0xac9f,%eax,%eax
  401abd:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401ac1:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401ac5:	c1 e0 0b             	shl    $0xb,%eax
  401ac8:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401acc:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401ad0:	69 c0 be e7 00 00    	imul   $0xe7be,%eax,%eax
  401ad6:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401ada:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401ade:	69 c0 89 e8 00 00    	imul   $0xe889,%eax,%eax
  401ae4:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401ae8:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401aec:	69 c0 e9 74 00 00    	imul   $0x74e9,%eax,%eax
  401af2:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401af6:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401afa:	69 c0 83 4f 00 00    	imul   $0x4f83,%eax,%eax
  401b00:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401b04:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401b08:	69 c0 e3 6f 00 00    	imul   $0x6fe3,%eax,%eax
  401b0e:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401b12:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401b16:	69 c0 d2 ae 00 00    	imul   $0xaed2,%eax,%eax
  401b1c:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401b20:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401b24:	69 c0 32 c6 00 00    	imul   $0xc632,%eax,%eax
  401b2a:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401b2e:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401b32:	69 c0 7e 0d 00 00    	imul   $0xd7e,%eax,%eax
  401b38:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401b3c:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401b40:	69 c0 0a 0b 00 00    	imul   $0xb0a,%eax,%eax
  401b46:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401b4a:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401b4e:	69 c0 e1 49 00 00    	imul   $0x49e1,%eax,%eax
  401b54:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401b58:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401b5c:	69 c0 1c 0d 00 00    	imul   $0xd1c,%eax,%eax
  401b62:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401b66:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401b6a:	69 c0 07 13 00 00    	imul   $0x1307,%eax,%eax
  401b70:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401b74:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401b78:	69 c0 6e ed 00 00    	imul   $0xed6e,%eax,%eax
  401b7e:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401b82:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401b86:	69 c0 4e da 00 00    	imul   $0xda4e,%eax,%eax
  401b8c:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401b90:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401b94:	69 c0 48 ca 00 00    	imul   $0xca48,%eax,%eax
  401b9a:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401b9e:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401ba2:	69 c0 57 b6 00 00    	imul   $0xb657,%eax,%eax
  401ba8:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401bac:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401bb0:	69 c0 de 8e 00 00    	imul   $0x8ede,%eax,%eax
  401bb6:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401bba:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401bbe:	69 c0 dd 42 00 00    	imul   $0x42dd,%eax,%eax
  401bc4:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401bc8:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401bcc:	69 c0 1a 05 00 00    	imul   $0x51a,%eax,%eax
  401bd2:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401bd6:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401bda:	69 c0 f0 cc 00 00    	imul   $0xccf0,%eax,%eax
  401be0:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401be4:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401be8:	69 c0 62 34 00 00    	imul   $0x3462,%eax,%eax
  401bee:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401bf2:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401bf6:	69 c0 2f f5 00 00    	imul   $0xf52f,%eax,%eax
  401bfc:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401c00:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401c04:	69 c0 0b 80 00 00    	imul   $0x800b,%eax,%eax
  401c0a:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401c0e:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401c12:	69 c0 81 cb 00 00    	imul   $0xcb81,%eax,%eax
  401c18:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401c1c:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401c20:	69 c0 f7 12 00 00    	imul   $0x12f7,%eax,%eax
  401c26:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401c2a:	b8 00 00 00 00       	mov    $0x0,%eax
  401c2f:	ba 00 00 00 00       	mov    $0x0,%edx
  401c34:	eb 0b                	jmp    401c41 <scramble+0x58d>
  401c36:	89 c1                	mov    %eax,%ecx
  401c38:	8b 4c 8c d0          	mov    -0x30(%rsp,%rcx,4),%ecx
  401c3c:	01 ca                	add    %ecx,%edx
  401c3e:	83 c0 01             	add    $0x1,%eax
  401c41:	83 f8 09             	cmp    $0x9,%eax
  401c44:	76 f0                	jbe    401c36 <scramble+0x582>
  401c46:	89 d0                	mov    %edx,%eax
  401c48:	c3                   	retq   

0000000000401c49 <getbuf>:
  401c49:	48 83 ec 18          	sub    $0x18,%rsp
  401c4d:	48 89 e7             	mov    %rsp,%rdi
  401c50:	e8 63 03 00 00       	callq  401fb8 <Gets>
  401c55:	b8 01 00 00 00       	mov    $0x1,%eax
  401c5a:	48 83 c4 18          	add    $0x18,%rsp
  401c5e:	c3                   	retq   

0000000000401c5f <touch1>:
  401c5f:	48 83 ec 08          	sub    $0x8,%rsp
  401c63:	c7 05 b7 58 00 00 01 	movl   $0x1,0x58b7(%rip)        # 407524 <vlevel>
  401c6a:	00 00 00 
  401c6d:	48 8d 3d 57 26 00 00 	lea    0x2657(%rip),%rdi        # 4042cb <_IO_stdin_used+0x2cb>
  401c74:	e8 07 f4 ff ff       	callq  401080 <puts@plt>
  401c79:	bf 01 00 00 00       	mov    $0x1,%edi
  401c7e:	e8 48 05 00 00       	callq  4021cb <validate>
  401c83:	bf 00 00 00 00       	mov    $0x0,%edi
  401c88:	e8 73 f5 ff ff       	callq  401200 <exit@plt>

0000000000401c8d <touch2>:
  401c8d:	48 83 ec 08          	sub    $0x8,%rsp
  401c91:	89 fe                	mov    %edi,%esi
  401c93:	c7 05 87 58 00 00 02 	movl   $0x2,0x5887(%rip)        # 407524 <vlevel>
  401c9a:	00 00 00 
  401c9d:	39 3d 89 58 00 00    	cmp    %edi,0x5889(%rip)        # 40752c <cookie>
  401ca3:	74 25                	je     401cca <touch2+0x3d>
  401ca5:	48 8d 3d 6c 26 00 00 	lea    0x266c(%rip),%rdi        # 404318 <_IO_stdin_used+0x318>
  401cac:	b8 00 00 00 00       	mov    $0x0,%eax
  401cb1:	e8 0a f4 ff ff       	callq  4010c0 <printf@plt>
  401cb6:	bf 02 00 00 00       	mov    $0x2,%edi
  401cbb:	e8 c9 05 00 00       	callq  402289 <fail>
  401cc0:	bf 00 00 00 00       	mov    $0x0,%edi
  401cc5:	e8 36 f5 ff ff       	callq  401200 <exit@plt>
  401cca:	48 8d 3d 1f 26 00 00 	lea    0x261f(%rip),%rdi        # 4042f0 <_IO_stdin_used+0x2f0>
  401cd1:	b8 00 00 00 00       	mov    $0x0,%eax
  401cd6:	e8 e5 f3 ff ff       	callq  4010c0 <printf@plt>
  401cdb:	bf 02 00 00 00       	mov    $0x2,%edi
  401ce0:	e8 e6 04 00 00       	callq  4021cb <validate>
  401ce5:	eb d9                	jmp    401cc0 <touch2+0x33>

0000000000401ce7 <hexmatch>:
  401ce7:	41 54                	push   %r12
  401ce9:	55                   	push   %rbp
  401cea:	53                   	push   %rbx
  401ceb:	48 83 ec 70          	sub    $0x70,%rsp
  401cef:	89 fd                	mov    %edi,%ebp
  401cf1:	48 89 f3             	mov    %rsi,%rbx
  401cf4:	e8 77 f4 ff ff       	callq  401170 <random@plt>
  401cf9:	48 89 c1             	mov    %rax,%rcx
  401cfc:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401d03:	0a d7 a3 
  401d06:	48 f7 ea             	imul   %rdx
  401d09:	48 01 ca             	add    %rcx,%rdx
  401d0c:	48 c1 fa 06          	sar    $0x6,%rdx
  401d10:	48 89 c8             	mov    %rcx,%rax
  401d13:	48 c1 f8 3f          	sar    $0x3f,%rax
  401d17:	48 29 c2             	sub    %rax,%rdx
  401d1a:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  401d1e:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401d22:	48 c1 e0 02          	shl    $0x2,%rax
  401d26:	48 29 c1             	sub    %rax,%rcx
  401d29:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  401d2d:	89 ea                	mov    %ebp,%edx
  401d2f:	48 8d 35 b2 25 00 00 	lea    0x25b2(%rip),%rsi        # 4042e8 <_IO_stdin_used+0x2e8>
  401d36:	4c 89 e7             	mov    %r12,%rdi
  401d39:	b8 00 00 00 00       	mov    $0x0,%eax
  401d3e:	e8 ad f4 ff ff       	callq  4011f0 <sprintf@plt>
  401d43:	ba 09 00 00 00       	mov    $0x9,%edx
  401d48:	4c 89 e6             	mov    %r12,%rsi
  401d4b:	48 89 df             	mov    %rbx,%rdi
  401d4e:	e8 0d f3 ff ff       	callq  401060 <strncmp@plt>
  401d53:	85 c0                	test   %eax,%eax
  401d55:	0f 94 c0             	sete   %al
  401d58:	0f b6 c0             	movzbl %al,%eax
  401d5b:	48 83 c4 70          	add    $0x70,%rsp
  401d5f:	5b                   	pop    %rbx
  401d60:	5d                   	pop    %rbp
  401d61:	41 5c                	pop    %r12
  401d63:	c3                   	retq   

0000000000401d64 <touch3>:
  401d64:	53                   	push   %rbx
  401d65:	48 89 fb             	mov    %rdi,%rbx
  401d68:	c7 05 b2 57 00 00 03 	movl   $0x3,0x57b2(%rip)        # 407524 <vlevel>
  401d6f:	00 00 00 
  401d72:	48 89 fe             	mov    %rdi,%rsi
  401d75:	8b 3d b1 57 00 00    	mov    0x57b1(%rip),%edi        # 40752c <cookie>
  401d7b:	e8 67 ff ff ff       	callq  401ce7 <hexmatch>
  401d80:	85 c0                	test   %eax,%eax
  401d82:	74 28                	je     401dac <touch3+0x48>
  401d84:	48 89 de             	mov    %rbx,%rsi
  401d87:	48 8d 3d b2 25 00 00 	lea    0x25b2(%rip),%rdi        # 404340 <_IO_stdin_used+0x340>
  401d8e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d93:	e8 28 f3 ff ff       	callq  4010c0 <printf@plt>
  401d98:	bf 03 00 00 00       	mov    $0x3,%edi
  401d9d:	e8 29 04 00 00       	callq  4021cb <validate>
  401da2:	bf 00 00 00 00       	mov    $0x0,%edi
  401da7:	e8 54 f4 ff ff       	callq  401200 <exit@plt>
  401dac:	48 89 de             	mov    %rbx,%rsi
  401daf:	48 8d 3d b2 25 00 00 	lea    0x25b2(%rip),%rdi        # 404368 <_IO_stdin_used+0x368>
  401db6:	b8 00 00 00 00       	mov    $0x0,%eax
  401dbb:	e8 00 f3 ff ff       	callq  4010c0 <printf@plt>
  401dc0:	bf 03 00 00 00       	mov    $0x3,%edi
  401dc5:	e8 bf 04 00 00       	callq  402289 <fail>
  401dca:	eb d6                	jmp    401da2 <touch3+0x3e>

0000000000401dcc <test>:
  401dcc:	48 83 ec 08          	sub    $0x8,%rsp
  401dd0:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd5:	e8 6f fe ff ff       	callq  401c49 <getbuf>
  401dda:	89 c6                	mov    %eax,%esi
  401ddc:	48 8d 3d ad 25 00 00 	lea    0x25ad(%rip),%rdi        # 404390 <_IO_stdin_used+0x390>
  401de3:	b8 00 00 00 00       	mov    $0x0,%eax
  401de8:	e8 d3 f2 ff ff       	callq  4010c0 <printf@plt>
  401ded:	48 83 c4 08          	add    $0x8,%rsp
  401df1:	c3                   	retq   

0000000000401df2 <start_farm>:
  401df2:	b8 01 00 00 00       	mov    $0x1,%eax
  401df7:	c3                   	retq   

0000000000401df8 <addval_497>:
  401df8:	8d 87 48 89 c7 90    	lea    -0x6f3876b8(%rdi),%eax
  401dfe:	c3                   	retq   

0000000000401dff <setval_159>:
  401dff:	c7 07 75 ac 31 58    	movl   $0x5831ac75,(%rdi)
  401e05:	c3                   	retq   

0000000000401e06 <getval_269>:
  401e06:	b8 d8 18 90 90       	mov    $0x909018d8,%eax
  401e0b:	c3                   	retq   

0000000000401e0c <addval_394>:
  401e0c:	8d 87 85 48 09 c7    	lea    -0x38f6b77b(%rdi),%eax
  401e12:	c3                   	retq   

0000000000401e13 <getval_404>:
  401e13:	b8 34 48 89 c7       	mov    $0xc7894834,%eax
  401e18:	c3                   	retq   

0000000000401e19 <addval_193>:
  401e19:	8d 87 52 58 c3 8f    	lea    -0x703ca7ae(%rdi),%eax
  401e1f:	c3                   	retq   

0000000000401e20 <setval_166>:
  401e20:	c7 07 48 89 c7 c1    	movl   $0xc1c78948,(%rdi)
  401e26:	c3                   	retq   

0000000000401e27 <getval_208>:
  401e27:	b8 ec 9e bf 18       	mov    $0x18bf9eec,%eax
  401e2c:	c3                   	retq   

0000000000401e2d <mid_farm>:
  401e2d:	b8 01 00 00 00       	mov    $0x1,%eax
  401e32:	c3                   	retq   

0000000000401e33 <add_xy>:
  401e33:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  401e37:	c3                   	retq   

0000000000401e38 <setval_451>:
  401e38:	c7 07 39 81 ce c3    	movl   $0xc3ce8139,(%rdi)
  401e3e:	c3                   	retq   

0000000000401e3f <getval_229>:
  401e3f:	b8 89 ce 28 c0       	mov    $0xc028ce89,%eax
  401e44:	c3                   	retq   

0000000000401e45 <addval_314>:
  401e45:	8d 87 8b ce 84 c0    	lea    -0x3f7b3175(%rdi),%eax
  401e4b:	c3                   	retq   

0000000000401e4c <getval_105>:
  401e4c:	b8 48 89 e0 91       	mov    $0x91e08948,%eax
  401e51:	c3                   	retq   

0000000000401e52 <addval_158>:
  401e52:	8d 87 8b c2 90 c3    	lea    -0x3c6f3d75(%rdi),%eax
  401e58:	c3                   	retq   

0000000000401e59 <getval_259>:
  401e59:	b8 89 ce 20 c0       	mov    $0xc020ce89,%eax
  401e5e:	c3                   	retq   

0000000000401e5f <setval_211>:
  401e5f:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  401e65:	c3                   	retq   

0000000000401e66 <addval_186>:
  401e66:	8d 87 c8 89 e0 90    	lea    -0x6f1f7638(%rdi),%eax
  401e6c:	c3                   	retq   

0000000000401e6d <setval_146>:
  401e6d:	c7 07 89 c2 90 c3    	movl   $0xc390c289,(%rdi)
  401e73:	c3                   	retq   

0000000000401e74 <setval_165>:
  401e74:	c7 07 48 09 e0 90    	movl   $0x90e00948,(%rdi)
  401e7a:	c3                   	retq   

0000000000401e7b <getval_112>:
  401e7b:	b8 72 74 89 ce       	mov    $0xce897472,%eax
  401e80:	c3                   	retq   

0000000000401e81 <addval_198>:
  401e81:	8d 87 8b c2 84 d2    	lea    -0x2d7b3d75(%rdi),%eax
  401e87:	c3                   	retq   

0000000000401e88 <setval_164>:
  401e88:	c7 07 d4 4c 89 e0    	movl   $0xe0894cd4,(%rdi)
  401e8e:	c3                   	retq   

0000000000401e8f <setval_191>:
  401e8f:	c7 07 89 c2 20 c9    	movl   $0xc920c289,(%rdi)
  401e95:	c3                   	retq   

0000000000401e96 <setval_271>:
  401e96:	c7 07 99 d1 20 d2    	movl   $0xd220d199,(%rdi)
  401e9c:	c3                   	retq   

0000000000401e9d <getval_462>:
  401e9d:	b8 48 89 e0 c7       	mov    $0xc7e08948,%eax
  401ea2:	c3                   	retq   

0000000000401ea3 <setval_321>:
  401ea3:	c7 07 89 ce 30 c9    	movl   $0xc930ce89,(%rdi)
  401ea9:	c3                   	retq   

0000000000401eaa <addval_447>:
  401eaa:	8d 87 88 c2 20 d2    	lea    -0x2ddf3d78(%rdi),%eax
  401eb0:	c3                   	retq   

0000000000401eb1 <getval_297>:
  401eb1:	b8 27 48 89 e0       	mov    $0xe0894827,%eax
  401eb6:	c3                   	retq   

0000000000401eb7 <setval_144>:
  401eb7:	c7 07 89 c2 a4 d2    	movl   $0xd2a4c289,(%rdi)
  401ebd:	c3                   	retq   

0000000000401ebe <addval_418>:
  401ebe:	8d 87 89 d1 92 c3    	lea    -0x3c6d2e77(%rdi),%eax
  401ec4:	c3                   	retq   

0000000000401ec5 <addval_250>:
  401ec5:	8d 87 89 d1 08 c9    	lea    -0x36f72e77(%rdi),%eax
  401ecb:	c3                   	retq   

0000000000401ecc <setval_102>:
  401ecc:	c7 07 88 c2 08 c9    	movl   $0xc908c288,(%rdi)
  401ed2:	c3                   	retq   

0000000000401ed3 <setval_174>:
  401ed3:	c7 07 48 89 e0 91    	movl   $0x91e08948,(%rdi)
  401ed9:	c3                   	retq   

0000000000401eda <setval_270>:
  401eda:	c7 07 a9 d1 84 c9    	movl   $0xc984d1a9,(%rdi)
  401ee0:	c3                   	retq   

0000000000401ee1 <setval_273>:
  401ee1:	c7 07 89 d1 84 c9    	movl   $0xc984d189,(%rdi)
  401ee7:	c3                   	retq   

0000000000401ee8 <getval_376>:
  401ee8:	b8 4a 81 ce 90       	mov    $0x90ce814a,%eax
  401eed:	c3                   	retq   

0000000000401eee <getval_460>:
  401eee:	b8 89 d1 28 db       	mov    $0xdb28d189,%eax
  401ef3:	c3                   	retq   

0000000000401ef4 <setval_141>:
  401ef4:	c7 07 75 89 ce c1    	movl   $0xc1ce8975,(%rdi)
  401efa:	c3                   	retq   

0000000000401efb <addval_181>:
  401efb:	8d 87 89 d1 92 90    	lea    -0x6f6d2e77(%rdi),%eax
  401f01:	c3                   	retq   

0000000000401f02 <addval_143>:
  401f02:	8d 87 89 c2 94 c3    	lea    -0x3c6b3d77(%rdi),%eax
  401f08:	c3                   	retq   

0000000000401f09 <addval_318>:
  401f09:	8d 87 a9 d1 84 db    	lea    -0x247b2e57(%rdi),%eax
  401f0f:	c3                   	retq   

0000000000401f10 <end_farm>:
  401f10:	b8 01 00 00 00       	mov    $0x1,%eax
  401f15:	c3                   	retq   

0000000000401f16 <save_char>:
  401f16:	8b 05 28 62 00 00    	mov    0x6228(%rip),%eax        # 408144 <gets_cnt>
  401f1c:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401f21:	7f 4a                	jg     401f6d <save_char+0x57>
  401f23:	89 f9                	mov    %edi,%ecx
  401f25:	c0 e9 04             	shr    $0x4,%cl
  401f28:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401f2b:	4c 8d 05 7e 27 00 00 	lea    0x277e(%rip),%r8        # 4046b0 <trans_char>
  401f32:	83 e1 0f             	and    $0xf,%ecx
  401f35:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  401f3a:	48 8d 0d ff 55 00 00 	lea    0x55ff(%rip),%rcx        # 407540 <gets_buf>
  401f41:	48 63 f2             	movslq %edx,%rsi
  401f44:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  401f48:	8d 72 01             	lea    0x1(%rdx),%esi
  401f4b:	83 e7 0f             	and    $0xf,%edi
  401f4e:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  401f53:	48 63 f6             	movslq %esi,%rsi
  401f56:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  401f5a:	83 c2 02             	add    $0x2,%edx
  401f5d:	48 63 d2             	movslq %edx,%rdx
  401f60:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  401f64:	83 c0 01             	add    $0x1,%eax
  401f67:	89 05 d7 61 00 00    	mov    %eax,0x61d7(%rip)        # 408144 <gets_cnt>
  401f6d:	c3                   	retq   

0000000000401f6e <save_term>:
  401f6e:	8b 05 d0 61 00 00    	mov    0x61d0(%rip),%eax        # 408144 <gets_cnt>
  401f74:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401f77:	48 98                	cltq   
  401f79:	48 8d 15 c0 55 00 00 	lea    0x55c0(%rip),%rdx        # 407540 <gets_buf>
  401f80:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  401f84:	c3                   	retq   

0000000000401f85 <check_fail>:
  401f85:	48 83 ec 08          	sub    $0x8,%rsp
  401f89:	0f be 35 59 55 00 00 	movsbl 0x5559(%rip),%esi        # 4074e9 <target_prefix>
  401f90:	48 8d 0d a9 55 00 00 	lea    0x55a9(%rip),%rcx        # 407540 <gets_buf>
  401f97:	8b 15 83 55 00 00    	mov    0x5583(%rip),%edx        # 407520 <check_level>
  401f9d:	48 8d 3d 0f 24 00 00 	lea    0x240f(%rip),%rdi        # 4043b3 <_IO_stdin_used+0x3b3>
  401fa4:	b8 00 00 00 00       	mov    $0x0,%eax
  401fa9:	e8 12 f1 ff ff       	callq  4010c0 <printf@plt>
  401fae:	bf 01 00 00 00       	mov    $0x1,%edi
  401fb3:	e8 48 f2 ff ff       	callq  401200 <exit@plt>

0000000000401fb8 <Gets>:
  401fb8:	41 54                	push   %r12
  401fba:	55                   	push   %rbp
  401fbb:	53                   	push   %rbx
  401fbc:	49 89 fc             	mov    %rdi,%r12
  401fbf:	c7 05 7b 61 00 00 00 	movl   $0x0,0x617b(%rip)        # 408144 <gets_cnt>
  401fc6:	00 00 00 
  401fc9:	48 89 fb             	mov    %rdi,%rbx
  401fcc:	eb 11                	jmp    401fdf <Gets+0x27>
  401fce:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401fd2:	88 03                	mov    %al,(%rbx)
  401fd4:	0f b6 f8             	movzbl %al,%edi
  401fd7:	e8 3a ff ff ff       	callq  401f16 <save_char>
  401fdc:	48 89 eb             	mov    %rbp,%rbx
  401fdf:	48 8b 3d 32 55 00 00 	mov    0x5532(%rip),%rdi        # 407518 <infile>
  401fe6:	e8 35 f2 ff ff       	callq  401220 <getc@plt>
  401feb:	83 f8 ff             	cmp    $0xffffffff,%eax
  401fee:	74 05                	je     401ff5 <Gets+0x3d>
  401ff0:	83 f8 0a             	cmp    $0xa,%eax
  401ff3:	75 d9                	jne    401fce <Gets+0x16>
  401ff5:	c6 03 00             	movb   $0x0,(%rbx)
  401ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  401ffd:	e8 6c ff ff ff       	callq  401f6e <save_term>
  402002:	4c 89 e0             	mov    %r12,%rax
  402005:	5b                   	pop    %rbx
  402006:	5d                   	pop    %rbp
  402007:	41 5c                	pop    %r12
  402009:	c3                   	retq   

000000000040200a <notify_server>:
  40200a:	83 3d 1f 55 00 00 00 	cmpl   $0x0,0x551f(%rip)        # 407530 <is_checker>
  402011:	0f 85 b3 01 00 00    	jne    4021ca <notify_server+0x1c0>
  402017:	55                   	push   %rbp
  402018:	53                   	push   %rbx
  402019:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  402020:	89 fb                	mov    %edi,%ebx
  402022:	81 3d 18 61 00 00 9c 	cmpl   $0x1f9c,0x6118(%rip)        # 408144 <gets_cnt>
  402029:	1f 00 00 
  40202c:	0f 8f b8 00 00 00    	jg     4020ea <notify_server+0xe0>
  402032:	44 0f be 0d af 54 00 	movsbl 0x54af(%rip),%r9d        # 4074e9 <target_prefix>
  402039:	00 
  40203a:	83 3d 47 54 00 00 00 	cmpl   $0x0,0x5447(%rip)        # 407488 <notify>
  402041:	0f 84 be 00 00 00    	je     402105 <notify_server+0xfb>
  402047:	44 8b 05 da 54 00 00 	mov    0x54da(%rip),%r8d        # 407528 <authkey>
  40204e:	85 db                	test   %ebx,%ebx
  402050:	0f 84 ba 00 00 00    	je     402110 <notify_server+0x106>
  402056:	48 8d 2d 71 23 00 00 	lea    0x2371(%rip),%rbp        # 4043ce <_IO_stdin_used+0x3ce>
  40205d:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  402064:	00 
  402065:	48 8d 05 d4 54 00 00 	lea    0x54d4(%rip),%rax        # 407540 <gets_buf>
  40206c:	50                   	push   %rax
  40206d:	56                   	push   %rsi
  40206e:	48 89 e9             	mov    %rbp,%rcx
  402071:	8b 15 b9 50 00 00    	mov    0x50b9(%rip),%edx        # 407130 <target_id>
  402077:	48 8d 35 55 23 00 00 	lea    0x2355(%rip),%rsi        # 4043d3 <_IO_stdin_used+0x3d3>
  40207e:	b8 00 00 00 00       	mov    $0x0,%eax
  402083:	e8 68 f1 ff ff       	callq  4011f0 <sprintf@plt>
  402088:	48 83 c4 10          	add    $0x10,%rsp
  40208c:	83 3d f5 53 00 00 00 	cmpl   $0x0,0x53f5(%rip)        # 407488 <notify>
  402093:	0f 84 b7 00 00 00    	je     402150 <notify_server+0x146>
  402099:	85 db                	test   %ebx,%ebx
  40209b:	0f 84 99 00 00 00    	je     40213a <notify_server+0x130>
  4020a1:	48 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%rcx
  4020a8:	00 
  4020a9:	49 89 e1             	mov    %rsp,%r9
  4020ac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  4020b2:	48 8b 15 8f 50 00 00 	mov    0x508f(%rip),%rdx        # 407148 <lab>
  4020b9:	48 8b 35 c0 53 00 00 	mov    0x53c0(%rip),%rsi        # 407480 <course>
  4020c0:	48 8b 3d 79 50 00 00 	mov    0x5079(%rip),%rdi        # 407140 <user_id>
  4020c7:	e8 20 10 00 00       	callq  4030ec <driver_post>
  4020cc:	85 c0                	test   %eax,%eax
  4020ce:	78 4c                	js     40211c <notify_server+0x112>
  4020d0:	48 8d 3d 41 24 00 00 	lea    0x2441(%rip),%rdi        # 404518 <_IO_stdin_used+0x518>
  4020d7:	e8 a4 ef ff ff       	callq  401080 <puts@plt>
  4020dc:	48 8d 3d 18 23 00 00 	lea    0x2318(%rip),%rdi        # 4043fb <_IO_stdin_used+0x3fb>
  4020e3:	e8 98 ef ff ff       	callq  401080 <puts@plt>
  4020e8:	eb 5c                	jmp    402146 <notify_server+0x13c>
  4020ea:	48 8d 3d f7 23 00 00 	lea    0x23f7(%rip),%rdi        # 4044e8 <_IO_stdin_used+0x4e8>
  4020f1:	b8 00 00 00 00       	mov    $0x0,%eax
  4020f6:	e8 c5 ef ff ff       	callq  4010c0 <printf@plt>
  4020fb:	bf 01 00 00 00       	mov    $0x1,%edi
  402100:	e8 fb f0 ff ff       	callq  401200 <exit@plt>
  402105:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  40210b:	e9 3e ff ff ff       	jmpq   40204e <notify_server+0x44>
  402110:	48 8d 2d b2 22 00 00 	lea    0x22b2(%rip),%rbp        # 4043c9 <_IO_stdin_used+0x3c9>
  402117:	e9 41 ff ff ff       	jmpq   40205d <notify_server+0x53>
  40211c:	48 89 e6             	mov    %rsp,%rsi
  40211f:	48 8d 3d c9 22 00 00 	lea    0x22c9(%rip),%rdi        # 4043ef <_IO_stdin_used+0x3ef>
  402126:	b8 00 00 00 00       	mov    $0x0,%eax
  40212b:	e8 90 ef ff ff       	callq  4010c0 <printf@plt>
  402130:	bf 01 00 00 00       	mov    $0x1,%edi
  402135:	e8 c6 f0 ff ff       	callq  401200 <exit@plt>
  40213a:	48 8d 3d c4 22 00 00 	lea    0x22c4(%rip),%rdi        # 404405 <_IO_stdin_used+0x405>
  402141:	e8 3a ef ff ff       	callq  401080 <puts@plt>
  402146:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  40214d:	5b                   	pop    %rbx
  40214e:	5d                   	pop    %rbp
  40214f:	c3                   	retq   
  402150:	48 89 ee             	mov    %rbp,%rsi
  402153:	48 8d 3d f6 23 00 00 	lea    0x23f6(%rip),%rdi        # 404550 <_IO_stdin_used+0x550>
  40215a:	b8 00 00 00 00       	mov    $0x0,%eax
  40215f:	e8 5c ef ff ff       	callq  4010c0 <printf@plt>
  402164:	48 8b 35 d5 4f 00 00 	mov    0x4fd5(%rip),%rsi        # 407140 <user_id>
  40216b:	48 8d 3d 9a 22 00 00 	lea    0x229a(%rip),%rdi        # 40440c <_IO_stdin_used+0x40c>
  402172:	b8 00 00 00 00       	mov    $0x0,%eax
  402177:	e8 44 ef ff ff       	callq  4010c0 <printf@plt>
  40217c:	48 8b 35 fd 52 00 00 	mov    0x52fd(%rip),%rsi        # 407480 <course>
  402183:	48 8d 3d 8f 22 00 00 	lea    0x228f(%rip),%rdi        # 404419 <_IO_stdin_used+0x419>
  40218a:	b8 00 00 00 00       	mov    $0x0,%eax
  40218f:	e8 2c ef ff ff       	callq  4010c0 <printf@plt>
  402194:	48 8b 35 ad 4f 00 00 	mov    0x4fad(%rip),%rsi        # 407148 <lab>
  40219b:	48 8d 3d 83 22 00 00 	lea    0x2283(%rip),%rdi        # 404425 <_IO_stdin_used+0x425>
  4021a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4021a7:	e8 14 ef ff ff       	callq  4010c0 <printf@plt>
  4021ac:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  4021b3:	00 
  4021b4:	48 8d 3d 73 22 00 00 	lea    0x2273(%rip),%rdi        # 40442e <_IO_stdin_used+0x42e>
  4021bb:	b8 00 00 00 00       	mov    $0x0,%eax
  4021c0:	e8 fb ee ff ff       	callq  4010c0 <printf@plt>
  4021c5:	e9 7c ff ff ff       	jmpq   402146 <notify_server+0x13c>
  4021ca:	c3                   	retq   

00000000004021cb <validate>:
  4021cb:	53                   	push   %rbx
  4021cc:	89 fb                	mov    %edi,%ebx
  4021ce:	83 3d 5b 53 00 00 00 	cmpl   $0x0,0x535b(%rip)        # 407530 <is_checker>
  4021d5:	74 68                	je     40223f <validate+0x74>
  4021d7:	39 3d 47 53 00 00    	cmp    %edi,0x5347(%rip)        # 407524 <vlevel>
  4021dd:	75 2d                	jne    40220c <validate+0x41>
  4021df:	8b 35 3b 53 00 00    	mov    0x533b(%rip),%esi        # 407520 <check_level>
  4021e5:	39 fe                	cmp    %edi,%esi
  4021e7:	75 39                	jne    402222 <validate+0x57>
  4021e9:	0f be 35 f9 52 00 00 	movsbl 0x52f9(%rip),%esi        # 4074e9 <target_prefix>
  4021f0:	48 8d 0d 49 53 00 00 	lea    0x5349(%rip),%rcx        # 407540 <gets_buf>
  4021f7:	89 fa                	mov    %edi,%edx
  4021f9:	48 8d 3d 58 22 00 00 	lea    0x2258(%rip),%rdi        # 404458 <_IO_stdin_used+0x458>
  402200:	b8 00 00 00 00       	mov    $0x0,%eax
  402205:	e8 b6 ee ff ff       	callq  4010c0 <printf@plt>
  40220a:	5b                   	pop    %rbx
  40220b:	c3                   	retq   
  40220c:	48 8d 3d 27 22 00 00 	lea    0x2227(%rip),%rdi        # 40443a <_IO_stdin_used+0x43a>
  402213:	e8 68 ee ff ff       	callq  401080 <puts@plt>
  402218:	b8 00 00 00 00       	mov    $0x0,%eax
  40221d:	e8 63 fd ff ff       	callq  401f85 <check_fail>
  402222:	89 fa                	mov    %edi,%edx
  402224:	48 8d 3d 4d 23 00 00 	lea    0x234d(%rip),%rdi        # 404578 <_IO_stdin_used+0x578>
  40222b:	b8 00 00 00 00       	mov    $0x0,%eax
  402230:	e8 8b ee ff ff       	callq  4010c0 <printf@plt>
  402235:	b8 00 00 00 00       	mov    $0x0,%eax
  40223a:	e8 46 fd ff ff       	callq  401f85 <check_fail>
  40223f:	39 3d df 52 00 00    	cmp    %edi,0x52df(%rip)        # 407524 <vlevel>
  402245:	74 1a                	je     402261 <validate+0x96>
  402247:	48 8d 3d ec 21 00 00 	lea    0x21ec(%rip),%rdi        # 40443a <_IO_stdin_used+0x43a>
  40224e:	e8 2d ee ff ff       	callq  401080 <puts@plt>
  402253:	89 de                	mov    %ebx,%esi
  402255:	bf 00 00 00 00       	mov    $0x0,%edi
  40225a:	e8 ab fd ff ff       	callq  40200a <notify_server>
  40225f:	eb a9                	jmp    40220a <validate+0x3f>
  402261:	0f be 15 81 52 00 00 	movsbl 0x5281(%rip),%edx        # 4074e9 <target_prefix>
  402268:	89 fe                	mov    %edi,%esi
  40226a:	48 8d 3d 2f 23 00 00 	lea    0x232f(%rip),%rdi        # 4045a0 <_IO_stdin_used+0x5a0>
  402271:	b8 00 00 00 00       	mov    $0x0,%eax
  402276:	e8 45 ee ff ff       	callq  4010c0 <printf@plt>
  40227b:	89 de                	mov    %ebx,%esi
  40227d:	bf 01 00 00 00       	mov    $0x1,%edi
  402282:	e8 83 fd ff ff       	callq  40200a <notify_server>
  402287:	eb 81                	jmp    40220a <validate+0x3f>

0000000000402289 <fail>:
  402289:	48 83 ec 08          	sub    $0x8,%rsp
  40228d:	83 3d 9c 52 00 00 00 	cmpl   $0x0,0x529c(%rip)        # 407530 <is_checker>
  402294:	75 11                	jne    4022a7 <fail+0x1e>
  402296:	89 fe                	mov    %edi,%esi
  402298:	bf 00 00 00 00       	mov    $0x0,%edi
  40229d:	e8 68 fd ff ff       	callq  40200a <notify_server>
  4022a2:	48 83 c4 08          	add    $0x8,%rsp
  4022a6:	c3                   	retq   
  4022a7:	b8 00 00 00 00       	mov    $0x0,%eax
  4022ac:	e8 d4 fc ff ff       	callq  401f85 <check_fail>

00000000004022b1 <bushandler>:
  4022b1:	48 83 ec 08          	sub    $0x8,%rsp
  4022b5:	83 3d 74 52 00 00 00 	cmpl   $0x0,0x5274(%rip)        # 407530 <is_checker>
  4022bc:	74 16                	je     4022d4 <bushandler+0x23>
  4022be:	48 8d 3d a8 21 00 00 	lea    0x21a8(%rip),%rdi        # 40446d <_IO_stdin_used+0x46d>
  4022c5:	e8 b6 ed ff ff       	callq  401080 <puts@plt>
  4022ca:	b8 00 00 00 00       	mov    $0x0,%eax
  4022cf:	e8 b1 fc ff ff       	callq  401f85 <check_fail>
  4022d4:	48 8d 3d fd 22 00 00 	lea    0x22fd(%rip),%rdi        # 4045d8 <_IO_stdin_used+0x5d8>
  4022db:	e8 a0 ed ff ff       	callq  401080 <puts@plt>
  4022e0:	48 8d 3d 90 21 00 00 	lea    0x2190(%rip),%rdi        # 404477 <_IO_stdin_used+0x477>
  4022e7:	e8 94 ed ff ff       	callq  401080 <puts@plt>
  4022ec:	be 00 00 00 00       	mov    $0x0,%esi
  4022f1:	bf 00 00 00 00       	mov    $0x0,%edi
  4022f6:	e8 0f fd ff ff       	callq  40200a <notify_server>
  4022fb:	bf 01 00 00 00       	mov    $0x1,%edi
  402300:	e8 fb ee ff ff       	callq  401200 <exit@plt>

0000000000402305 <seghandler>:
  402305:	48 83 ec 08          	sub    $0x8,%rsp
  402309:	83 3d 20 52 00 00 00 	cmpl   $0x0,0x5220(%rip)        # 407530 <is_checker>
  402310:	74 16                	je     402328 <seghandler+0x23>
  402312:	48 8d 3d 74 21 00 00 	lea    0x2174(%rip),%rdi        # 40448d <_IO_stdin_used+0x48d>
  402319:	e8 62 ed ff ff       	callq  401080 <puts@plt>
  40231e:	b8 00 00 00 00       	mov    $0x0,%eax
  402323:	e8 5d fc ff ff       	callq  401f85 <check_fail>
  402328:	48 8d 3d c9 22 00 00 	lea    0x22c9(%rip),%rdi        # 4045f8 <_IO_stdin_used+0x5f8>
  40232f:	e8 4c ed ff ff       	callq  401080 <puts@plt>
  402334:	48 8d 3d 3c 21 00 00 	lea    0x213c(%rip),%rdi        # 404477 <_IO_stdin_used+0x477>
  40233b:	e8 40 ed ff ff       	callq  401080 <puts@plt>
  402340:	be 00 00 00 00       	mov    $0x0,%esi
  402345:	bf 00 00 00 00       	mov    $0x0,%edi
  40234a:	e8 bb fc ff ff       	callq  40200a <notify_server>
  40234f:	bf 01 00 00 00       	mov    $0x1,%edi
  402354:	e8 a7 ee ff ff       	callq  401200 <exit@plt>

0000000000402359 <illegalhandler>:
  402359:	48 83 ec 08          	sub    $0x8,%rsp
  40235d:	83 3d cc 51 00 00 00 	cmpl   $0x0,0x51cc(%rip)        # 407530 <is_checker>
  402364:	74 16                	je     40237c <illegalhandler+0x23>
  402366:	48 8d 3d 33 21 00 00 	lea    0x2133(%rip),%rdi        # 4044a0 <_IO_stdin_used+0x4a0>
  40236d:	e8 0e ed ff ff       	callq  401080 <puts@plt>
  402372:	b8 00 00 00 00       	mov    $0x0,%eax
  402377:	e8 09 fc ff ff       	callq  401f85 <check_fail>
  40237c:	48 8d 3d 9d 22 00 00 	lea    0x229d(%rip),%rdi        # 404620 <_IO_stdin_used+0x620>
  402383:	e8 f8 ec ff ff       	callq  401080 <puts@plt>
  402388:	48 8d 3d e8 20 00 00 	lea    0x20e8(%rip),%rdi        # 404477 <_IO_stdin_used+0x477>
  40238f:	e8 ec ec ff ff       	callq  401080 <puts@plt>
  402394:	be 00 00 00 00       	mov    $0x0,%esi
  402399:	bf 00 00 00 00       	mov    $0x0,%edi
  40239e:	e8 67 fc ff ff       	callq  40200a <notify_server>
  4023a3:	bf 01 00 00 00       	mov    $0x1,%edi
  4023a8:	e8 53 ee ff ff       	callq  401200 <exit@plt>

00000000004023ad <sigalrmhandler>:
  4023ad:	48 83 ec 08          	sub    $0x8,%rsp
  4023b1:	83 3d 78 51 00 00 00 	cmpl   $0x0,0x5178(%rip)        # 407530 <is_checker>
  4023b8:	74 16                	je     4023d0 <sigalrmhandler+0x23>
  4023ba:	48 8d 3d f3 20 00 00 	lea    0x20f3(%rip),%rdi        # 4044b4 <_IO_stdin_used+0x4b4>
  4023c1:	e8 ba ec ff ff       	callq  401080 <puts@plt>
  4023c6:	b8 00 00 00 00       	mov    $0x0,%eax
  4023cb:	e8 b5 fb ff ff       	callq  401f85 <check_fail>
  4023d0:	be 05 00 00 00       	mov    $0x5,%esi
  4023d5:	48 8d 3d 74 22 00 00 	lea    0x2274(%rip),%rdi        # 404650 <_IO_stdin_used+0x650>
  4023dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4023e1:	e8 da ec ff ff       	callq  4010c0 <printf@plt>
  4023e6:	be 00 00 00 00       	mov    $0x0,%esi
  4023eb:	bf 00 00 00 00       	mov    $0x0,%edi
  4023f0:	e8 15 fc ff ff       	callq  40200a <notify_server>
  4023f5:	bf 01 00 00 00       	mov    $0x1,%edi
  4023fa:	e8 01 ee ff ff       	callq  401200 <exit@plt>

00000000004023ff <launch>:
  4023ff:	55                   	push   %rbp
  402400:	48 89 e5             	mov    %rsp,%rbp
  402403:	48 89 fa             	mov    %rdi,%rdx
  402406:	48 8d 47 17          	lea    0x17(%rdi),%rax
  40240a:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  40240e:	48 29 c4             	sub    %rax,%rsp
  402411:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  402416:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  40241a:	be f4 00 00 00       	mov    $0xf4,%esi
  40241f:	e8 ac ec ff ff       	callq  4010d0 <memset@plt>
  402424:	48 8b 05 75 50 00 00 	mov    0x5075(%rip),%rax        # 4074a0 <stdin@@GLIBC_2.2.5>
  40242b:	48 39 05 e6 50 00 00 	cmp    %rax,0x50e6(%rip)        # 407518 <infile>
  402432:	74 2b                	je     40245f <launch+0x60>
  402434:	c7 05 e6 50 00 00 00 	movl   $0x0,0x50e6(%rip)        # 407524 <vlevel>
  40243b:	00 00 00 
  40243e:	b8 00 00 00 00       	mov    $0x0,%eax
  402443:	e8 84 f9 ff ff       	callq  401dcc <test>
  402448:	83 3d e1 50 00 00 00 	cmpl   $0x0,0x50e1(%rip)        # 407530 <is_checker>
  40244f:	75 21                	jne    402472 <launch+0x73>
  402451:	48 8d 3d 7c 20 00 00 	lea    0x207c(%rip),%rdi        # 4044d4 <_IO_stdin_used+0x4d4>
  402458:	e8 23 ec ff ff       	callq  401080 <puts@plt>
  40245d:	c9                   	leaveq 
  40245e:	c3                   	retq   
  40245f:	48 8d 3d 56 20 00 00 	lea    0x2056(%rip),%rdi        # 4044bc <_IO_stdin_used+0x4bc>
  402466:	b8 00 00 00 00       	mov    $0x0,%eax
  40246b:	e8 50 ec ff ff       	callq  4010c0 <printf@plt>
  402470:	eb c2                	jmp    402434 <launch+0x35>
  402472:	48 8d 3d 50 20 00 00 	lea    0x2050(%rip),%rdi        # 4044c9 <_IO_stdin_used+0x4c9>
  402479:	e8 02 ec ff ff       	callq  401080 <puts@plt>
  40247e:	b8 00 00 00 00       	mov    $0x0,%eax
  402483:	e8 fd fa ff ff       	callq  401f85 <check_fail>

0000000000402488 <stable_launch>:
  402488:	53                   	push   %rbx
  402489:	48 89 3d 80 50 00 00 	mov    %rdi,0x5080(%rip)        # 407510 <global_offset>
  402490:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  402496:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40249c:	b9 32 01 00 00       	mov    $0x132,%ecx
  4024a1:	ba 07 00 00 00       	mov    $0x7,%edx
  4024a6:	be 00 00 10 00       	mov    $0x100000,%esi
  4024ab:	bf 00 60 58 55       	mov    $0x55586000,%edi
  4024b0:	e8 fb eb ff ff       	callq  4010b0 <mmap@plt>
  4024b5:	48 89 c3             	mov    %rax,%rbx
  4024b8:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  4024be:	75 43                	jne    402503 <stable_launch+0x7b>
  4024c0:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  4024c7:	48 89 15 3a 50 00 00 	mov    %rdx,0x503a(%rip)        # 407508 <stack_top>
  4024ce:	48 89 e0             	mov    %rsp,%rax
  4024d1:	48 89 d4             	mov    %rdx,%rsp
  4024d4:	48 89 c2             	mov    %rax,%rdx
  4024d7:	48 89 15 22 50 00 00 	mov    %rdx,0x5022(%rip)        # 407500 <global_save_stack>
  4024de:	48 8b 3d 2b 50 00 00 	mov    0x502b(%rip),%rdi        # 407510 <global_offset>
  4024e5:	e8 15 ff ff ff       	callq  4023ff <launch>
  4024ea:	48 8b 05 0f 50 00 00 	mov    0x500f(%rip),%rax        # 407500 <global_save_stack>
  4024f1:	48 89 c4             	mov    %rax,%rsp
  4024f4:	be 00 00 10 00       	mov    $0x100000,%esi
  4024f9:	48 89 df             	mov    %rbx,%rdi
  4024fc:	e8 8f ec ff ff       	callq  401190 <munmap@plt>
  402501:	5b                   	pop    %rbx
  402502:	c3                   	retq   
  402503:	be 00 00 10 00       	mov    $0x100000,%esi
  402508:	48 89 c7             	mov    %rax,%rdi
  40250b:	e8 80 ec ff ff       	callq  401190 <munmap@plt>
  402510:	ba 00 60 58 55       	mov    $0x55586000,%edx
  402515:	48 8d 35 6c 21 00 00 	lea    0x216c(%rip),%rsi        # 404688 <_IO_stdin_used+0x688>
  40251c:	48 8b 3d bd 4f 00 00 	mov    0x4fbd(%rip),%rdi        # 4074e0 <stderr@@GLIBC_2.2.5>
  402523:	b8 00 00 00 00       	mov    $0x0,%eax
  402528:	e8 03 ec ff ff       	callq  401130 <fprintf@plt>
  40252d:	bf 01 00 00 00       	mov    $0x1,%edi
  402532:	e8 c9 ec ff ff       	callq  401200 <exit@plt>

0000000000402537 <rio_readinitb>:
  402537:	89 37                	mov    %esi,(%rdi)
  402539:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  402540:	48 8d 47 10          	lea    0x10(%rdi),%rax
  402544:	48 89 47 08          	mov    %rax,0x8(%rdi)
  402548:	c3                   	retq   

0000000000402549 <sigalrm_handler>:
  402549:	48 83 ec 08          	sub    $0x8,%rsp
  40254d:	ba 00 00 00 00       	mov    $0x0,%edx
  402552:	48 8d 35 67 21 00 00 	lea    0x2167(%rip),%rsi        # 4046c0 <trans_char+0x10>
  402559:	48 8b 3d 80 4f 00 00 	mov    0x4f80(%rip),%rdi        # 4074e0 <stderr@@GLIBC_2.2.5>
  402560:	b8 00 00 00 00       	mov    $0x0,%eax
  402565:	e8 c6 eb ff ff       	callq  401130 <fprintf@plt>
  40256a:	bf 01 00 00 00       	mov    $0x1,%edi
  40256f:	e8 8c ec ff ff       	callq  401200 <exit@plt>

0000000000402574 <urlencode>:
  402574:	41 54                	push   %r12
  402576:	55                   	push   %rbp
  402577:	53                   	push   %rbx
  402578:	48 83 ec 10          	sub    $0x10,%rsp
  40257c:	48 89 fb             	mov    %rdi,%rbx
  40257f:	48 89 f5             	mov    %rsi,%rbp
  402582:	e8 19 eb ff ff       	callq  4010a0 <strlen@plt>
  402587:	eb 0e                	jmp    402597 <urlencode+0x23>
  402589:	88 55 00             	mov    %dl,0x0(%rbp)
  40258c:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402590:	48 83 c3 01          	add    $0x1,%rbx
  402594:	44 89 e0             	mov    %r12d,%eax
  402597:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  40259b:	85 c0                	test   %eax,%eax
  40259d:	0f 84 95 00 00 00    	je     402638 <urlencode+0xc4>
  4025a3:	0f b6 13             	movzbl (%rbx),%edx
  4025a6:	80 fa 2a             	cmp    $0x2a,%dl
  4025a9:	0f 94 c1             	sete   %cl
  4025ac:	80 fa 2d             	cmp    $0x2d,%dl
  4025af:	0f 94 c0             	sete   %al
  4025b2:	08 c1                	or     %al,%cl
  4025b4:	75 d3                	jne    402589 <urlencode+0x15>
  4025b6:	80 fa 2e             	cmp    $0x2e,%dl
  4025b9:	74 ce                	je     402589 <urlencode+0x15>
  4025bb:	80 fa 5f             	cmp    $0x5f,%dl
  4025be:	74 c9                	je     402589 <urlencode+0x15>
  4025c0:	8d 42 d0             	lea    -0x30(%rdx),%eax
  4025c3:	3c 09                	cmp    $0x9,%al
  4025c5:	76 c2                	jbe    402589 <urlencode+0x15>
  4025c7:	8d 42 bf             	lea    -0x41(%rdx),%eax
  4025ca:	3c 19                	cmp    $0x19,%al
  4025cc:	76 bb                	jbe    402589 <urlencode+0x15>
  4025ce:	8d 42 9f             	lea    -0x61(%rdx),%eax
  4025d1:	3c 19                	cmp    $0x19,%al
  4025d3:	76 b4                	jbe    402589 <urlencode+0x15>
  4025d5:	80 fa 20             	cmp    $0x20,%dl
  4025d8:	74 4c                	je     402626 <urlencode+0xb2>
  4025da:	8d 42 e0             	lea    -0x20(%rdx),%eax
  4025dd:	3c 5f                	cmp    $0x5f,%al
  4025df:	0f 96 c1             	setbe  %cl
  4025e2:	80 fa 09             	cmp    $0x9,%dl
  4025e5:	0f 94 c0             	sete   %al
  4025e8:	08 c1                	or     %al,%cl
  4025ea:	74 47                	je     402633 <urlencode+0xbf>
  4025ec:	0f b6 d2             	movzbl %dl,%edx
  4025ef:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  4025f4:	48 8d 35 5a 21 00 00 	lea    0x215a(%rip),%rsi        # 404755 <trans_char+0xa5>
  4025fb:	b8 00 00 00 00       	mov    $0x0,%eax
  402600:	e8 eb eb ff ff       	callq  4011f0 <sprintf@plt>
  402605:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  40260a:	88 45 00             	mov    %al,0x0(%rbp)
  40260d:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  402612:	88 45 01             	mov    %al,0x1(%rbp)
  402615:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  40261a:	88 45 02             	mov    %al,0x2(%rbp)
  40261d:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  402621:	e9 6a ff ff ff       	jmpq   402590 <urlencode+0x1c>
  402626:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  40262a:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40262e:	e9 5d ff ff ff       	jmpq   402590 <urlencode+0x1c>
  402633:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402638:	48 83 c4 10          	add    $0x10,%rsp
  40263c:	5b                   	pop    %rbx
  40263d:	5d                   	pop    %rbp
  40263e:	41 5c                	pop    %r12
  402640:	c3                   	retq   

0000000000402641 <rio_writen>:
  402641:	41 55                	push   %r13
  402643:	41 54                	push   %r12
  402645:	55                   	push   %rbp
  402646:	53                   	push   %rbx
  402647:	48 83 ec 08          	sub    $0x8,%rsp
  40264b:	41 89 fc             	mov    %edi,%r12d
  40264e:	48 89 f5             	mov    %rsi,%rbp
  402651:	49 89 d5             	mov    %rdx,%r13
  402654:	48 89 d3             	mov    %rdx,%rbx
  402657:	eb 06                	jmp    40265f <rio_writen+0x1e>
  402659:	48 29 c3             	sub    %rax,%rbx
  40265c:	48 01 c5             	add    %rax,%rbp
  40265f:	48 85 db             	test   %rbx,%rbx
  402662:	74 24                	je     402688 <rio_writen+0x47>
  402664:	48 89 da             	mov    %rbx,%rdx
  402667:	48 89 ee             	mov    %rbp,%rsi
  40266a:	44 89 e7             	mov    %r12d,%edi
  40266d:	e8 1e ea ff ff       	callq  401090 <write@plt>
  402672:	48 85 c0             	test   %rax,%rax
  402675:	7f e2                	jg     402659 <rio_writen+0x18>
  402677:	e8 c4 e9 ff ff       	callq  401040 <__errno_location@plt>
  40267c:	83 38 04             	cmpl   $0x4,(%rax)
  40267f:	75 15                	jne    402696 <rio_writen+0x55>
  402681:	b8 00 00 00 00       	mov    $0x0,%eax
  402686:	eb d1                	jmp    402659 <rio_writen+0x18>
  402688:	4c 89 e8             	mov    %r13,%rax
  40268b:	48 83 c4 08          	add    $0x8,%rsp
  40268f:	5b                   	pop    %rbx
  402690:	5d                   	pop    %rbp
  402691:	41 5c                	pop    %r12
  402693:	41 5d                	pop    %r13
  402695:	c3                   	retq   
  402696:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40269d:	eb ec                	jmp    40268b <rio_writen+0x4a>

000000000040269f <rio_read>:
  40269f:	41 55                	push   %r13
  4026a1:	41 54                	push   %r12
  4026a3:	55                   	push   %rbp
  4026a4:	53                   	push   %rbx
  4026a5:	48 83 ec 08          	sub    $0x8,%rsp
  4026a9:	48 89 fb             	mov    %rdi,%rbx
  4026ac:	49 89 f5             	mov    %rsi,%r13
  4026af:	49 89 d4             	mov    %rdx,%r12
  4026b2:	eb 0a                	jmp    4026be <rio_read+0x1f>
  4026b4:	e8 87 e9 ff ff       	callq  401040 <__errno_location@plt>
  4026b9:	83 38 04             	cmpl   $0x4,(%rax)
  4026bc:	75 5a                	jne    402718 <rio_read+0x79>
  4026be:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4026c1:	85 ed                	test   %ebp,%ebp
  4026c3:	7f 22                	jg     4026e7 <rio_read+0x48>
  4026c5:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  4026c9:	ba 00 20 00 00       	mov    $0x2000,%edx
  4026ce:	48 89 ee             	mov    %rbp,%rsi
  4026d1:	8b 3b                	mov    (%rbx),%edi
  4026d3:	e8 28 ea ff ff       	callq  401100 <read@plt>
  4026d8:	89 43 04             	mov    %eax,0x4(%rbx)
  4026db:	85 c0                	test   %eax,%eax
  4026dd:	78 d5                	js     4026b4 <rio_read+0x15>
  4026df:	74 40                	je     402721 <rio_read+0x82>
  4026e1:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4026e5:	eb d7                	jmp    4026be <rio_read+0x1f>
  4026e7:	89 e8                	mov    %ebp,%eax
  4026e9:	4c 39 e0             	cmp    %r12,%rax
  4026ec:	72 03                	jb     4026f1 <rio_read+0x52>
  4026ee:	44 89 e5             	mov    %r12d,%ebp
  4026f1:	4c 63 e5             	movslq %ebp,%r12
  4026f4:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4026f8:	4c 89 e2             	mov    %r12,%rdx
  4026fb:	4c 89 ef             	mov    %r13,%rdi
  4026fe:	e8 4d ea ff ff       	callq  401150 <memcpy@plt>
  402703:	4c 01 63 08          	add    %r12,0x8(%rbx)
  402707:	29 6b 04             	sub    %ebp,0x4(%rbx)
  40270a:	4c 89 e0             	mov    %r12,%rax
  40270d:	48 83 c4 08          	add    $0x8,%rsp
  402711:	5b                   	pop    %rbx
  402712:	5d                   	pop    %rbp
  402713:	41 5c                	pop    %r12
  402715:	41 5d                	pop    %r13
  402717:	c3                   	retq   
  402718:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40271f:	eb ec                	jmp    40270d <rio_read+0x6e>
  402721:	b8 00 00 00 00       	mov    $0x0,%eax
  402726:	eb e5                	jmp    40270d <rio_read+0x6e>

0000000000402728 <rio_readlineb>:
  402728:	41 55                	push   %r13
  40272a:	41 54                	push   %r12
  40272c:	55                   	push   %rbp
  40272d:	53                   	push   %rbx
  40272e:	48 83 ec 18          	sub    $0x18,%rsp
  402732:	49 89 fd             	mov    %rdi,%r13
  402735:	48 89 f5             	mov    %rsi,%rbp
  402738:	49 89 d4             	mov    %rdx,%r12
  40273b:	bb 01 00 00 00       	mov    $0x1,%ebx
  402740:	eb 18                	jmp    40275a <rio_readlineb+0x32>
  402742:	85 c0                	test   %eax,%eax
  402744:	75 55                	jne    40279b <rio_readlineb+0x73>
  402746:	48 83 fb 01          	cmp    $0x1,%rbx
  40274a:	75 3d                	jne    402789 <rio_readlineb+0x61>
  40274c:	b8 00 00 00 00       	mov    $0x0,%eax
  402751:	eb 3d                	jmp    402790 <rio_readlineb+0x68>
  402753:	48 83 c3 01          	add    $0x1,%rbx
  402757:	48 89 d5             	mov    %rdx,%rbp
  40275a:	4c 39 e3             	cmp    %r12,%rbx
  40275d:	73 2a                	jae    402789 <rio_readlineb+0x61>
  40275f:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  402764:	ba 01 00 00 00       	mov    $0x1,%edx
  402769:	4c 89 ef             	mov    %r13,%rdi
  40276c:	e8 2e ff ff ff       	callq  40269f <rio_read>
  402771:	83 f8 01             	cmp    $0x1,%eax
  402774:	75 cc                	jne    402742 <rio_readlineb+0x1a>
  402776:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  40277a:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  40277f:	88 45 00             	mov    %al,0x0(%rbp)
  402782:	3c 0a                	cmp    $0xa,%al
  402784:	75 cd                	jne    402753 <rio_readlineb+0x2b>
  402786:	48 89 d5             	mov    %rdx,%rbp
  402789:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  40278d:	48 89 d8             	mov    %rbx,%rax
  402790:	48 83 c4 18          	add    $0x18,%rsp
  402794:	5b                   	pop    %rbx
  402795:	5d                   	pop    %rbp
  402796:	41 5c                	pop    %r12
  402798:	41 5d                	pop    %r13
  40279a:	c3                   	retq   
  40279b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4027a2:	eb ec                	jmp    402790 <rio_readlineb+0x68>

00000000004027a4 <submitr>:
  4027a4:	41 57                	push   %r15
  4027a6:	41 56                	push   %r14
  4027a8:	41 55                	push   %r13
  4027aa:	41 54                	push   %r12
  4027ac:	55                   	push   %rbp
  4027ad:	53                   	push   %rbx
  4027ae:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  4027b5:	49 89 fc             	mov    %rdi,%r12
  4027b8:	89 74 24 10          	mov    %esi,0x10(%rsp)
  4027bc:	49 89 d6             	mov    %rdx,%r14
  4027bf:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  4027c4:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  4027c9:	4d 89 cd             	mov    %r9,%r13
  4027cc:	48 8b ac 24 90 a0 00 	mov    0xa090(%rsp),%rbp
  4027d3:	00 
  4027d4:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  4027db:	00 00 00 00 
  4027df:	ba 00 00 00 00       	mov    $0x0,%edx
  4027e4:	be 01 00 00 00       	mov    $0x1,%esi
  4027e9:	bf 02 00 00 00       	mov    $0x2,%edi
  4027ee:	e8 3d ea ff ff       	callq  401230 <socket@plt>
  4027f3:	85 c0                	test   %eax,%eax
  4027f5:	0f 88 6c 02 00 00    	js     402a67 <submitr+0x2c3>
  4027fb:	89 c3                	mov    %eax,%ebx
  4027fd:	4c 89 e7             	mov    %r12,%rdi
  402800:	e8 1b e9 ff ff       	callq  401120 <gethostbyname@plt>
  402805:	48 85 c0             	test   %rax,%rax
  402808:	0f 84 a5 02 00 00    	je     402ab3 <submitr+0x30f>
  40280e:	4c 8d bc 24 40 a0 00 	lea    0xa040(%rsp),%r15
  402815:	00 
  402816:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  40281d:	00 00 00 00 00 
  402822:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  402829:	00 00 00 00 00 
  40282e:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  402835:	00 02 00 
  402838:	48 8b 48 18          	mov    0x18(%rax),%rcx
  40283c:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402840:	48 8d bc 24 44 a0 00 	lea    0xa044(%rsp),%rdi
  402847:	00 
  402848:	48 8b 31             	mov    (%rcx),%rsi
  40284b:	e8 50 e9 ff ff       	callq  4011a0 <memmove@plt>
  402850:	0f b7 74 24 10       	movzwl 0x10(%rsp),%esi
  402855:	66 c1 c6 08          	rol    $0x8,%si
  402859:	66 89 b4 24 42 a0 00 	mov    %si,0xa042(%rsp)
  402860:	00 
  402861:	ba 10 00 00 00       	mov    $0x10,%edx
  402866:	4c 89 fe             	mov    %r15,%rsi
  402869:	89 df                	mov    %ebx,%edi
  40286b:	e8 a0 e9 ff ff       	callq  401210 <connect@plt>
  402870:	85 c0                	test   %eax,%eax
  402872:	0f 88 a3 02 00 00    	js     402b1b <submitr+0x377>
  402878:	4c 89 ef             	mov    %r13,%rdi
  40287b:	e8 20 e8 ff ff       	callq  4010a0 <strlen@plt>
  402880:	49 89 c7             	mov    %rax,%r15
  402883:	4c 89 f7             	mov    %r14,%rdi
  402886:	e8 15 e8 ff ff       	callq  4010a0 <strlen@plt>
  40288b:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  402890:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402895:	e8 06 e8 ff ff       	callq  4010a0 <strlen@plt>
  40289a:	48 03 44 24 10       	add    0x10(%rsp),%rax
  40289f:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  4028a4:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  4028a9:	e8 f2 e7 ff ff       	callq  4010a0 <strlen@plt>
  4028ae:	48 03 44 24 10       	add    0x10(%rsp),%rax
  4028b3:	4b 8d 14 7f          	lea    (%r15,%r15,2),%rdx
  4028b7:	48 8d 84 10 80 00 00 	lea    0x80(%rax,%rdx,1),%rax
  4028be:	00 
  4028bf:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4028c5:	0f 87 aa 02 00 00    	ja     402b75 <submitr+0x3d1>
  4028cb:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  4028d2:	00 
  4028d3:	b9 00 04 00 00       	mov    $0x400,%ecx
  4028d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4028dd:	48 89 f7             	mov    %rsi,%rdi
  4028e0:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4028e3:	4c 89 ef             	mov    %r13,%rdi
  4028e6:	e8 89 fc ff ff       	callq  402574 <urlencode>
  4028eb:	85 c0                	test   %eax,%eax
  4028ed:	0f 88 f5 02 00 00    	js     402be8 <submitr+0x444>
  4028f3:	4c 8d ac 24 30 60 00 	lea    0x6030(%rsp),%r13
  4028fa:	00 
  4028fb:	4d 89 e1             	mov    %r12,%r9
  4028fe:	4c 8d 84 24 30 40 00 	lea    0x4030(%rsp),%r8
  402905:	00 
  402906:	4c 89 f1             	mov    %r14,%rcx
  402909:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  40290e:	48 8d 35 d3 1d 00 00 	lea    0x1dd3(%rip),%rsi        # 4046e8 <trans_char+0x38>
  402915:	4c 89 ef             	mov    %r13,%rdi
  402918:	b8 00 00 00 00       	mov    $0x0,%eax
  40291d:	e8 ce e8 ff ff       	callq  4011f0 <sprintf@plt>
  402922:	4c 89 ef             	mov    %r13,%rdi
  402925:	e8 76 e7 ff ff       	callq  4010a0 <strlen@plt>
  40292a:	48 89 c2             	mov    %rax,%rdx
  40292d:	4c 89 ee             	mov    %r13,%rsi
  402930:	89 df                	mov    %ebx,%edi
  402932:	e8 0a fd ff ff       	callq  402641 <rio_writen>
  402937:	48 85 c0             	test   %rax,%rax
  40293a:	0f 88 33 03 00 00    	js     402c73 <submitr+0x4cf>
  402940:	4c 8d a4 24 30 80 00 	lea    0x8030(%rsp),%r12
  402947:	00 
  402948:	89 de                	mov    %ebx,%esi
  40294a:	4c 89 e7             	mov    %r12,%rdi
  40294d:	e8 e5 fb ff ff       	callq  402537 <rio_readinitb>
  402952:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402959:	00 
  40295a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40295f:	4c 89 e7             	mov    %r12,%rdi
  402962:	e8 c1 fd ff ff       	callq  402728 <rio_readlineb>
  402967:	48 85 c0             	test   %rax,%rax
  40296a:	0f 8e 72 03 00 00    	jle    402ce2 <submitr+0x53e>
  402970:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  402977:	00 
  402978:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  40297f:	00 
  402980:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  402987:	00 
  402988:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  40298d:	48 8d 35 c8 1d 00 00 	lea    0x1dc8(%rip),%rsi        # 40475c <trans_char+0xac>
  402994:	b8 00 00 00 00       	mov    $0x0,%eax
  402999:	e8 e2 e7 ff ff       	callq  401180 <__isoc99_sscanf@plt>
  40299e:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4029a5:	00 
  4029a6:	b9 03 00 00 00       	mov    $0x3,%ecx
  4029ab:	48 8d 3d c1 1d 00 00 	lea    0x1dc1(%rip),%rdi        # 404773 <trans_char+0xc3>
  4029b2:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4029b4:	0f 97 c0             	seta   %al
  4029b7:	1c 00                	sbb    $0x0,%al
  4029b9:	84 c0                	test   %al,%al
  4029bb:	0f 84 9f 03 00 00    	je     402d60 <submitr+0x5bc>
  4029c1:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4029c8:	00 
  4029c9:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  4029d0:	00 
  4029d1:	ba 00 20 00 00       	mov    $0x2000,%edx
  4029d6:	e8 4d fd ff ff       	callq  402728 <rio_readlineb>
  4029db:	48 85 c0             	test   %rax,%rax
  4029de:	7f be                	jg     40299e <submitr+0x1fa>
  4029e0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4029e7:	3a 20 43 
  4029ea:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  4029f1:	20 75 6e 
  4029f4:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4029f8:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4029fc:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a03:	74 6f 20 
  402a06:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
  402a0d:	68 65 61 
  402a10:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402a14:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402a18:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402a1f:	66 72 6f 
  402a22:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
  402a29:	20 72 65 
  402a2c:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402a30:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402a34:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402a3b:	73 65 72 
  402a3e:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402a42:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
  402a49:	89 df                	mov    %ebx,%edi
  402a4b:	e8 a0 e6 ff ff       	callq  4010f0 <close@plt>
  402a50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a55:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402a5c:	5b                   	pop    %rbx
  402a5d:	5d                   	pop    %rbp
  402a5e:	41 5c                	pop    %r12
  402a60:	41 5d                	pop    %r13
  402a62:	41 5e                	pop    %r14
  402a64:	41 5f                	pop    %r15
  402a66:	c3                   	retq   
  402a67:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a6e:	3a 20 43 
  402a71:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402a78:	20 75 6e 
  402a7b:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402a7f:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402a83:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a8a:	74 6f 20 
  402a8d:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  402a94:	65 20 73 
  402a97:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402a9b:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402a9f:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402aa6:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402aac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ab1:	eb a2                	jmp    402a55 <submitr+0x2b1>
  402ab3:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402aba:	3a 20 44 
  402abd:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  402ac4:	20 75 6e 
  402ac7:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402acb:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402acf:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402ad6:	74 6f 20 
  402ad9:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  402ae0:	76 65 20 
  402ae3:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ae7:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402aeb:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402af2:	72 20 61 
  402af5:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402af9:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402b00:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402b06:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402b0a:	89 df                	mov    %ebx,%edi
  402b0c:	e8 df e5 ff ff       	callq  4010f0 <close@plt>
  402b11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b16:	e9 3a ff ff ff       	jmpq   402a55 <submitr+0x2b1>
  402b1b:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402b22:	3a 20 55 
  402b25:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  402b2c:	20 74 6f 
  402b2f:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b33:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402b37:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402b3e:	65 63 74 
  402b41:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
  402b48:	68 65 20 
  402b4b:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b4f:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402b53:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  402b5a:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
  402b60:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
  402b64:	89 df                	mov    %ebx,%edi
  402b66:	e8 85 e5 ff ff       	callq  4010f0 <close@plt>
  402b6b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b70:	e9 e0 fe ff ff       	jmpq   402a55 <submitr+0x2b1>
  402b75:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402b7c:	3a 20 52 
  402b7f:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  402b86:	20 73 74 
  402b89:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b8d:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402b91:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  402b98:	74 6f 6f 
  402b9b:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
  402ba2:	65 2e 20 
  402ba5:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ba9:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402bad:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402bb4:	61 73 65 
  402bb7:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
  402bbe:	49 54 52 
  402bc1:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402bc5:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402bc9:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402bd0:	55 46 00 
  402bd3:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402bd7:	89 df                	mov    %ebx,%edi
  402bd9:	e8 12 e5 ff ff       	callq  4010f0 <close@plt>
  402bde:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402be3:	e9 6d fe ff ff       	jmpq   402a55 <submitr+0x2b1>
  402be8:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402bef:	3a 20 52 
  402bf2:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  402bf9:	20 73 74 
  402bfc:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c00:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402c04:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402c0b:	63 6f 6e 
  402c0e:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
  402c15:	20 61 6e 
  402c18:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402c1c:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402c20:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  402c27:	67 61 6c 
  402c2a:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
  402c31:	6e 70 72 
  402c34:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402c38:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402c3c:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402c43:	6c 65 20 
  402c46:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
  402c4d:	63 74 65 
  402c50:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402c54:	48 89 55 38          	mov    %rdx,0x38(%rbp)
  402c58:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
  402c5e:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
  402c62:	89 df                	mov    %ebx,%edi
  402c64:	e8 87 e4 ff ff       	callq  4010f0 <close@plt>
  402c69:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c6e:	e9 e2 fd ff ff       	jmpq   402a55 <submitr+0x2b1>
  402c73:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402c7a:	3a 20 43 
  402c7d:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402c84:	20 75 6e 
  402c87:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c8b:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402c8f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402c96:	74 6f 20 
  402c99:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
  402ca0:	20 74 6f 
  402ca3:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ca7:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402cab:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  402cb2:	72 65 73 
  402cb5:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
  402cbc:	65 72 76 
  402cbf:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402cc3:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402cc7:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
  402ccd:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
  402cd1:	89 df                	mov    %ebx,%edi
  402cd3:	e8 18 e4 ff ff       	callq  4010f0 <close@plt>
  402cd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402cdd:	e9 73 fd ff ff       	jmpq   402a55 <submitr+0x2b1>
  402ce2:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402ce9:	3a 20 43 
  402cec:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402cf3:	20 75 6e 
  402cf6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402cfa:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402cfe:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402d05:	74 6f 20 
  402d08:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
  402d0f:	66 69 72 
  402d12:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d16:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402d1a:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402d21:	61 64 65 
  402d24:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
  402d2b:	6d 20 72 
  402d2e:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402d32:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402d36:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402d3d:	20 73 65 
  402d40:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402d44:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
  402d4b:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
  402d4f:	89 df                	mov    %ebx,%edi
  402d51:	e8 9a e3 ff ff       	callq  4010f0 <close@plt>
  402d56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d5b:	e9 f5 fc ff ff       	jmpq   402a55 <submitr+0x2b1>
  402d60:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402d67:	00 
  402d68:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402d6f:	00 
  402d70:	ba 00 20 00 00       	mov    $0x2000,%edx
  402d75:	e8 ae f9 ff ff       	callq  402728 <rio_readlineb>
  402d7a:	48 85 c0             	test   %rax,%rax
  402d7d:	0f 8e 97 00 00 00    	jle    402e1a <submitr+0x676>
  402d83:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  402d8a:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402d90:	0f 85 08 01 00 00    	jne    402e9e <submitr+0x6fa>
  402d96:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402d9d:	00 
  402d9e:	48 89 ef             	mov    %rbp,%rdi
  402da1:	e8 ca e2 ff ff       	callq  401070 <strcpy@plt>
  402da6:	89 df                	mov    %ebx,%edi
  402da8:	e8 43 e3 ff ff       	callq  4010f0 <close@plt>
  402dad:	b9 04 00 00 00       	mov    $0x4,%ecx
  402db2:	48 8d 3d b4 19 00 00 	lea    0x19b4(%rip),%rdi        # 40476d <trans_char+0xbd>
  402db9:	48 89 ee             	mov    %rbp,%rsi
  402dbc:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402dbe:	0f 97 c0             	seta   %al
  402dc1:	1c 00                	sbb    $0x0,%al
  402dc3:	0f be c0             	movsbl %al,%eax
  402dc6:	85 c0                	test   %eax,%eax
  402dc8:	0f 84 87 fc ff ff    	je     402a55 <submitr+0x2b1>
  402dce:	b9 05 00 00 00       	mov    $0x5,%ecx
  402dd3:	48 8d 3d 97 19 00 00 	lea    0x1997(%rip),%rdi        # 404771 <trans_char+0xc1>
  402dda:	48 89 ee             	mov    %rbp,%rsi
  402ddd:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402ddf:	0f 97 c0             	seta   %al
  402de2:	1c 00                	sbb    $0x0,%al
  402de4:	0f be c0             	movsbl %al,%eax
  402de7:	85 c0                	test   %eax,%eax
  402de9:	0f 84 66 fc ff ff    	je     402a55 <submitr+0x2b1>
  402def:	b9 03 00 00 00       	mov    $0x3,%ecx
  402df4:	48 8d 3d 7b 19 00 00 	lea    0x197b(%rip),%rdi        # 404776 <trans_char+0xc6>
  402dfb:	48 89 ee             	mov    %rbp,%rsi
  402dfe:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402e00:	0f 97 c0             	seta   %al
  402e03:	1c 00                	sbb    $0x0,%al
  402e05:	0f be c0             	movsbl %al,%eax
  402e08:	85 c0                	test   %eax,%eax
  402e0a:	0f 84 45 fc ff ff    	je     402a55 <submitr+0x2b1>
  402e10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e15:	e9 3b fc ff ff       	jmpq   402a55 <submitr+0x2b1>
  402e1a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402e21:	3a 20 43 
  402e24:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402e2b:	20 75 6e 
  402e2e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402e32:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402e36:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402e3d:	74 6f 20 
  402e40:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
  402e47:	73 74 61 
  402e4a:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402e4e:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402e52:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402e59:	65 73 73 
  402e5c:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
  402e63:	72 6f 6d 
  402e66:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402e6a:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402e6e:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402e75:	6c 74 20 
  402e78:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402e7c:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
  402e83:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
  402e89:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
  402e8d:	89 df                	mov    %ebx,%edi
  402e8f:	e8 5c e2 ff ff       	callq  4010f0 <close@plt>
  402e94:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e99:	e9 b7 fb ff ff       	jmpq   402a55 <submitr+0x2b1>
  402e9e:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  402ea3:	48 8d 35 7e 18 00 00 	lea    0x187e(%rip),%rsi        # 404728 <trans_char+0x78>
  402eaa:	48 89 ef             	mov    %rbp,%rdi
  402ead:	b8 00 00 00 00       	mov    $0x0,%eax
  402eb2:	e8 39 e3 ff ff       	callq  4011f0 <sprintf@plt>
  402eb7:	89 df                	mov    %ebx,%edi
  402eb9:	e8 32 e2 ff ff       	callq  4010f0 <close@plt>
  402ebe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ec3:	e9 8d fb ff ff       	jmpq   402a55 <submitr+0x2b1>

0000000000402ec8 <init_timeout>:
  402ec8:	85 ff                	test   %edi,%edi
  402eca:	74 26                	je     402ef2 <init_timeout+0x2a>
  402ecc:	53                   	push   %rbx
  402ecd:	89 fb                	mov    %edi,%ebx
  402ecf:	78 1a                	js     402eeb <init_timeout+0x23>
  402ed1:	48 8d 35 71 f6 ff ff 	lea    -0x98f(%rip),%rsi        # 402549 <sigalrm_handler>
  402ed8:	bf 0e 00 00 00       	mov    $0xe,%edi
  402edd:	e8 2e e2 ff ff       	callq  401110 <signal@plt>
  402ee2:	89 df                	mov    %ebx,%edi
  402ee4:	e8 f7 e1 ff ff       	callq  4010e0 <alarm@plt>
  402ee9:	5b                   	pop    %rbx
  402eea:	c3                   	retq   
  402eeb:	bb 00 00 00 00       	mov    $0x0,%ebx
  402ef0:	eb df                	jmp    402ed1 <init_timeout+0x9>
  402ef2:	c3                   	retq   

0000000000402ef3 <init_driver>:
  402ef3:	41 54                	push   %r12
  402ef5:	55                   	push   %rbp
  402ef6:	53                   	push   %rbx
  402ef7:	48 83 ec 10          	sub    $0x10,%rsp
  402efb:	48 89 fd             	mov    %rdi,%rbp
  402efe:	be 01 00 00 00       	mov    $0x1,%esi
  402f03:	bf 0d 00 00 00       	mov    $0xd,%edi
  402f08:	e8 03 e2 ff ff       	callq  401110 <signal@plt>
  402f0d:	be 01 00 00 00       	mov    $0x1,%esi
  402f12:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402f17:	e8 f4 e1 ff ff       	callq  401110 <signal@plt>
  402f1c:	be 01 00 00 00       	mov    $0x1,%esi
  402f21:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402f26:	e8 e5 e1 ff ff       	callq  401110 <signal@plt>
  402f2b:	ba 00 00 00 00       	mov    $0x0,%edx
  402f30:	be 01 00 00 00       	mov    $0x1,%esi
  402f35:	bf 02 00 00 00       	mov    $0x2,%edi
  402f3a:	e8 f1 e2 ff ff       	callq  401230 <socket@plt>
  402f3f:	85 c0                	test   %eax,%eax
  402f41:	0f 88 83 00 00 00    	js     402fca <init_driver+0xd7>
  402f47:	89 c3                	mov    %eax,%ebx
  402f49:	48 8d 3d 29 18 00 00 	lea    0x1829(%rip),%rdi        # 404779 <trans_char+0xc9>
  402f50:	e8 cb e1 ff ff       	callq  401120 <gethostbyname@plt>
  402f55:	48 85 c0             	test   %rax,%rax
  402f58:	0f 84 b8 00 00 00    	je     403016 <init_driver+0x123>
  402f5e:	49 89 e4             	mov    %rsp,%r12
  402f61:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402f68:	00 
  402f69:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402f70:	00 00 
  402f72:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402f78:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402f7c:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402f80:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402f85:	48 8b 31             	mov    (%rcx),%rsi
  402f88:	e8 13 e2 ff ff       	callq  4011a0 <memmove@plt>
  402f8d:	66 c7 44 24 02 3c a4 	movw   $0xa43c,0x2(%rsp)
  402f94:	ba 10 00 00 00       	mov    $0x10,%edx
  402f99:	4c 89 e6             	mov    %r12,%rsi
  402f9c:	89 df                	mov    %ebx,%edi
  402f9e:	e8 6d e2 ff ff       	callq  401210 <connect@plt>
  402fa3:	85 c0                	test   %eax,%eax
  402fa5:	0f 88 d3 00 00 00    	js     40307e <init_driver+0x18b>
  402fab:	89 df                	mov    %ebx,%edi
  402fad:	e8 3e e1 ff ff       	callq  4010f0 <close@plt>
  402fb2:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402fb8:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402fbc:	b8 00 00 00 00       	mov    $0x0,%eax
  402fc1:	48 83 c4 10          	add    $0x10,%rsp
  402fc5:	5b                   	pop    %rbx
  402fc6:	5d                   	pop    %rbp
  402fc7:	41 5c                	pop    %r12
  402fc9:	c3                   	retq   
  402fca:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402fd1:	3a 20 43 
  402fd4:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402fdb:	20 75 6e 
  402fde:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402fe2:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402fe6:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402fed:	74 6f 20 
  402ff0:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  402ff7:	65 20 73 
  402ffa:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ffe:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  403002:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  403009:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  40300f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  403014:	eb ab                	jmp    402fc1 <init_driver+0xce>
  403016:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40301d:	3a 20 44 
  403020:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  403027:	20 75 6e 
  40302a:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40302e:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  403032:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  403039:	74 6f 20 
  40303c:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  403043:	76 65 20 
  403046:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40304a:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  40304e:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  403055:	72 20 61 
  403058:	48 89 45 20          	mov    %rax,0x20(%rbp)
  40305c:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  403063:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  403069:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  40306d:	89 df                	mov    %ebx,%edi
  40306f:	e8 7c e0 ff ff       	callq  4010f0 <close@plt>
  403074:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  403079:	e9 43 ff ff ff       	jmpq   402fc1 <init_driver+0xce>
  40307e:	48 b8 32 30 32 2e 31 	movabs $0x2e3032312e323032,%rax
  403085:	32 30 2e 
  403088:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40308c:	c7 45 08 34 30 2e 38 	movl   $0x382e3034,0x8(%rbp)
  403093:	66 c7 45 0c 35 00    	movw   $0x35,0xc(%rbp)
  403099:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4030a0:	3a 20 55 
  4030a3:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  4030aa:	20 74 6f 
  4030ad:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4030b1:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4030b5:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  4030bc:	65 63 74 
  4030bf:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
  4030c6:	65 72 76 
  4030c9:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4030cd:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4030d1:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  4030d7:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  4030db:	89 df                	mov    %ebx,%edi
  4030dd:	e8 0e e0 ff ff       	callq  4010f0 <close@plt>
  4030e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4030e7:	e9 d5 fe ff ff       	jmpq   402fc1 <init_driver+0xce>

00000000004030ec <driver_post>:
  4030ec:	53                   	push   %rbx
  4030ed:	4c 89 cb             	mov    %r9,%rbx
  4030f0:	45 85 c0             	test   %r8d,%r8d
  4030f3:	75 18                	jne    40310d <driver_post+0x21>
  4030f5:	48 85 ff             	test   %rdi,%rdi
  4030f8:	74 05                	je     4030ff <driver_post+0x13>
  4030fa:	80 3f 00             	cmpb   $0x0,(%rdi)
  4030fd:	75 32                	jne    403131 <driver_post+0x45>
  4030ff:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  403104:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  403108:	44 89 c0             	mov    %r8d,%eax
  40310b:	5b                   	pop    %rbx
  40310c:	c3                   	retq   
  40310d:	48 89 ce             	mov    %rcx,%rsi
  403110:	48 8d 3d 70 16 00 00 	lea    0x1670(%rip),%rdi        # 404787 <trans_char+0xd7>
  403117:	b8 00 00 00 00       	mov    $0x0,%eax
  40311c:	e8 9f df ff ff       	callq  4010c0 <printf@plt>
  403121:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  403126:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  40312a:	b8 00 00 00 00       	mov    $0x0,%eax
  40312f:	eb da                	jmp    40310b <driver_post+0x1f>
  403131:	48 83 ec 08          	sub    $0x8,%rsp
  403135:	41 51                	push   %r9
  403137:	49 89 c9             	mov    %rcx,%r9
  40313a:	49 89 d0             	mov    %rdx,%r8
  40313d:	48 89 f9             	mov    %rdi,%rcx
  403140:	48 89 f2             	mov    %rsi,%rdx
  403143:	be a4 3c 00 00       	mov    $0x3ca4,%esi
  403148:	48 8d 3d 2a 16 00 00 	lea    0x162a(%rip),%rdi        # 404779 <trans_char+0xc9>
  40314f:	e8 50 f6 ff ff       	callq  4027a4 <submitr>
  403154:	48 83 c4 10          	add    $0x10,%rsp
  403158:	eb b1                	jmp    40310b <driver_post+0x1f>

000000000040315a <check>:
  40315a:	89 f8                	mov    %edi,%eax
  40315c:	c1 e8 1c             	shr    $0x1c,%eax
  40315f:	74 1d                	je     40317e <check+0x24>
  403161:	b9 00 00 00 00       	mov    $0x0,%ecx
  403166:	83 f9 1f             	cmp    $0x1f,%ecx
  403169:	7f 0d                	jg     403178 <check+0x1e>
  40316b:	89 f8                	mov    %edi,%eax
  40316d:	d3 e8                	shr    %cl,%eax
  40316f:	3c 0a                	cmp    $0xa,%al
  403171:	74 11                	je     403184 <check+0x2a>
  403173:	83 c1 08             	add    $0x8,%ecx
  403176:	eb ee                	jmp    403166 <check+0xc>
  403178:	b8 01 00 00 00       	mov    $0x1,%eax
  40317d:	c3                   	retq   
  40317e:	b8 00 00 00 00       	mov    $0x0,%eax
  403183:	c3                   	retq   
  403184:	b8 00 00 00 00       	mov    $0x0,%eax
  403189:	c3                   	retq   

000000000040318a <gencookie>:
  40318a:	53                   	push   %rbx
  40318b:	83 c7 01             	add    $0x1,%edi
  40318e:	e8 bd de ff ff       	callq  401050 <srandom@plt>
  403193:	e8 d8 df ff ff       	callq  401170 <random@plt>
  403198:	48 89 c7             	mov    %rax,%rdi
  40319b:	89 c3                	mov    %eax,%ebx
  40319d:	e8 b8 ff ff ff       	callq  40315a <check>
  4031a2:	85 c0                	test   %eax,%eax
  4031a4:	74 ed                	je     403193 <gencookie+0x9>
  4031a6:	89 d8                	mov    %ebx,%eax
  4031a8:	5b                   	pop    %rbx
  4031a9:	c3                   	retq   
  4031aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004031b0 <__libc_csu_init>:
  4031b0:	41 57                	push   %r15
  4031b2:	4c 8d 3d 57 3c 00 00 	lea    0x3c57(%rip),%r15        # 406e10 <__frame_dummy_init_array_entry>
  4031b9:	41 56                	push   %r14
  4031bb:	49 89 d6             	mov    %rdx,%r14
  4031be:	41 55                	push   %r13
  4031c0:	49 89 f5             	mov    %rsi,%r13
  4031c3:	41 54                	push   %r12
  4031c5:	41 89 fc             	mov    %edi,%r12d
  4031c8:	55                   	push   %rbp
  4031c9:	48 8d 2d 48 3c 00 00 	lea    0x3c48(%rip),%rbp        # 406e18 <__init_array_end>
  4031d0:	53                   	push   %rbx
  4031d1:	4c 29 fd             	sub    %r15,%rbp
  4031d4:	48 83 ec 08          	sub    $0x8,%rsp
  4031d8:	e8 23 de ff ff       	callq  401000 <_init>
  4031dd:	48 c1 fd 03          	sar    $0x3,%rbp
  4031e1:	74 1b                	je     4031fe <__libc_csu_init+0x4e>
  4031e3:	31 db                	xor    %ebx,%ebx
  4031e5:	0f 1f 00             	nopl   (%rax)
  4031e8:	4c 89 f2             	mov    %r14,%rdx
  4031eb:	4c 89 ee             	mov    %r13,%rsi
  4031ee:	44 89 e7             	mov    %r12d,%edi
  4031f1:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  4031f5:	48 83 c3 01          	add    $0x1,%rbx
  4031f9:	48 39 dd             	cmp    %rbx,%rbp
  4031fc:	75 ea                	jne    4031e8 <__libc_csu_init+0x38>
  4031fe:	48 83 c4 08          	add    $0x8,%rsp
  403202:	5b                   	pop    %rbx
  403203:	5d                   	pop    %rbp
  403204:	41 5c                	pop    %r12
  403206:	41 5d                	pop    %r13
  403208:	41 5e                	pop    %r14
  40320a:	41 5f                	pop    %r15
  40320c:	c3                   	retq   
  40320d:	0f 1f 00             	nopl   (%rax)

0000000000403210 <__libc_csu_fini>:
  403210:	c3                   	retq   

Disassembly of section .fini:

0000000000403214 <_fini>:
  403214:	48 83 ec 08          	sub    $0x8,%rsp
  403218:	48 83 c4 08          	add    $0x8,%rsp
  40321c:	c3                   	retq   
