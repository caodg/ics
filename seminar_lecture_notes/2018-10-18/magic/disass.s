
m:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400238 <.interp>:
  400238:	2f                   	(bad)  
  400239:	6c                   	insb   (%dx),%es:(%rdi)
  40023a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
  400241:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
  400246:	78 2d                	js     400275 <_init-0x17b>
  400248:	78 38                	js     400282 <_init-0x16e>
  40024a:	36 2d 36 34 2e 73    	ss sub $0x732e3436,%eax
  400250:	6f                   	outsl  %ds:(%rsi),(%dx)
  400251:	2e 32 00             	xor    %cs:(%rax),%al

Disassembly of section .note.ABI-tag:

0000000000400254 <.note.ABI-tag>:
  400254:	04 00                	add    $0x0,%al
  400256:	00 00                	add    %al,(%rax)
  400258:	10 00                	adc    %al,(%rax)
  40025a:	00 00                	add    %al,(%rax)
  40025c:	01 00                	add    %eax,(%rax)
  40025e:	00 00                	add    %al,(%rax)
  400260:	47                   	rex.RXB
  400261:	4e 55                	rex.WRX push %rbp
  400263:	00 00                	add    %al,(%rax)
  400265:	00 00                	add    %al,(%rax)
  400267:	00 02                	add    %al,(%rdx)
  400269:	00 00                	add    %al,(%rax)
  40026b:	00 06                	add    %al,(%rsi)
  40026d:	00 00                	add    %al,(%rax)
  40026f:	00 20                	add    %ah,(%rax)
  400271:	00 00                	add    %al,(%rax)
	...

Disassembly of section .note.gnu.build-id:

0000000000400274 <.note.gnu.build-id>:
  400274:	04 00                	add    $0x0,%al
  400276:	00 00                	add    %al,(%rax)
  400278:	14 00                	adc    $0x0,%al
  40027a:	00 00                	add    %al,(%rax)
  40027c:	03 00                	add    (%rax),%eax
  40027e:	00 00                	add    %al,(%rax)
  400280:	47                   	rex.RXB
  400281:	4e 55                	rex.WRX push %rbp
  400283:	00 da                	add    %bl,%dl
  400285:	8e 2e                	mov    (%rsi),%gs
  400287:	89 cd                	mov    %ecx,%ebp
  400289:	5e                   	pop    %rsi
  40028a:	af                   	scas   %es:(%rdi),%eax
  40028b:	ee                   	out    %al,(%dx)
  40028c:	3a 3b                	cmp    (%rbx),%bh
  40028e:	65 84 90 32 95 c9 7d 	test   %dl,%gs:0x7dc99532(%rax)
  400295:	de e5                	fsubp  %st,%st(5)
  400297:	8c                   	.byte 0x8c

Disassembly of section .gnu.hash:

0000000000400298 <.gnu.hash>:
  400298:	01 00                	add    %eax,(%rax)
  40029a:	00 00                	add    %al,(%rax)
  40029c:	01 00                	add    %eax,(%rax)
  40029e:	00 00                	add    %al,(%rax)
  4002a0:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .dynsym:

00000000004002b8 <.dynsym>:
	...
  4002d0:	18 00                	sbb    %al,(%rax)
  4002d2:	00 00                	add    %al,(%rax)
  4002d4:	12 00                	adc    (%rax),%al
	...
  4002e6:	00 00                	add    %al,(%rax)
  4002e8:	2a 00                	sub    (%rax),%al
  4002ea:	00 00                	add    %al,(%rax)
  4002ec:	20 00                	and    %al,(%rax)
	...
  4002fe:	00 00                	add    %al,(%rax)
  400300:	0b 00                	or     (%rax),%eax
  400302:	00 00                	add    %al,(%rax)
  400304:	12 00                	adc    (%rax),%al
	...

Disassembly of section .dynstr:

0000000000400318 <.dynstr>:
  400318:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  40031c:	63 2e                	movslq (%rsi),%ebp
  40031e:	73 6f                	jae    40038f <_init-0x61>
  400320:	2e 36 00 5f 5f       	cs add %bl,%ss:0x5f(%rdi)
  400325:	70 72                	jo     400399 <_init-0x57>
  400327:	69 6e 74 66 5f 63 68 	imul   $0x68635f66,0x74(%rsi),%ebp
  40032e:	6b 00 5f             	imul   $0x5f,(%rax),%eax
  400331:	5f                   	pop    %rdi
  400332:	6c                   	insb   (%dx),%es:(%rdi)
  400333:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
  40033a:	72 74                	jb     4003b0 <_init-0x40>
  40033c:	5f                   	pop    %rdi
  40033d:	6d                   	insl   (%dx),%es:(%rdi)
  40033e:	61                   	(bad)  
  40033f:	69 6e 00 5f 5f 67 6d 	imul   $0x6d675f5f,0x0(%rsi),%ebp
  400346:	6f                   	outsl  %ds:(%rsi),(%dx)
  400347:	6e                   	outsb  %ds:(%rsi),(%dx)
  400348:	5f                   	pop    %rdi
  400349:	73 74                	jae    4003bf <_init-0x31>
  40034b:	61                   	(bad)  
  40034c:	72 74                	jb     4003c2 <_init-0x2e>
  40034e:	5f                   	pop    %rdi
  40034f:	5f                   	pop    %rdi
  400350:	00 47 4c             	add    %al,0x4c(%rdi)
  400353:	49                   	rex.WB
  400354:	42                   	rex.X
  400355:	43 5f                	rex.XB pop %r15
  400357:	32 2e                	xor    (%rsi),%ch
  400359:	33 2e                	xor    (%rsi),%ebp
  40035b:	34 00                	xor    $0x0,%al
  40035d:	47                   	rex.RXB
  40035e:	4c                   	rex.WR
  40035f:	49                   	rex.WB
  400360:	42                   	rex.X
  400361:	43 5f                	rex.XB pop %r15
  400363:	32 2e                	xor    (%rsi),%ch
  400365:	32 2e                	xor    (%rsi),%ch
  400367:	35                   	.byte 0x35
	...

Disassembly of section .gnu.version:

000000000040036a <.gnu.version>:
  40036a:	00 00                	add    %al,(%rax)
  40036c:	02 00                	add    (%rax),%al
  40036e:	00 00                	add    %al,(%rax)
  400370:	03 00                	add    (%rax),%eax

Disassembly of section .gnu.version_r:

0000000000400378 <.gnu.version_r>:
  400378:	01 00                	add    %eax,(%rax)
  40037a:	02 00                	add    (%rax),%al
  40037c:	01 00                	add    %eax,(%rax)
  40037e:	00 00                	add    %al,(%rax)
  400380:	10 00                	adc    %al,(%rax)
  400382:	00 00                	add    %al,(%rax)
  400384:	00 00                	add    %al,(%rax)
  400386:	00 00                	add    %al,(%rax)
  400388:	74 19                	je     4003a3 <_init-0x4d>
  40038a:	69 09 00 00 03 00    	imul   $0x30000,(%rcx),%ecx
  400390:	39 00                	cmp    %eax,(%rax)
  400392:	00 00                	add    %al,(%rax)
  400394:	10 00                	adc    %al,(%rax)
  400396:	00 00                	add    %al,(%rax)
  400398:	75 1a                	jne    4003b4 <_init-0x3c>
  40039a:	69 09 00 00 02 00    	imul   $0x20000,(%rcx),%ecx
  4003a0:	45 00 00             	add    %r8b,(%r8)
  4003a3:	00 00                	add    %al,(%rax)
  4003a5:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

00000000004003a8 <.rela.dyn>:
  4003a8:	f8                   	clc    
  4003a9:	0f 60 00             	punpcklbw (%rax),%mm0
  4003ac:	00 00                	add    %al,(%rax)
  4003ae:	00 00                	add    %al,(%rax)
  4003b0:	06                   	(bad)  
  4003b1:	00 00                	add    %al,(%rax)
  4003b3:	00 02                	add    %al,(%rdx)
	...

Disassembly of section .rela.plt:

00000000004003c0 <.rela.plt>:
  4003c0:	18 10                	sbb    %dl,(%rax)
  4003c2:	60                   	(bad)  
  4003c3:	00 00                	add    %al,(%rax)
  4003c5:	00 00                	add    %al,(%rax)
  4003c7:	00 07                	add    %al,(%rdi)
  4003c9:	00 00                	add    %al,(%rax)
  4003cb:	00 01                	add    %al,(%rcx)
	...
  4003d5:	00 00                	add    %al,(%rax)
  4003d7:	00 20                	add    %ah,(%rax)
  4003d9:	10 60 00             	adc    %ah,0x0(%rax)
  4003dc:	00 00                	add    %al,(%rax)
  4003de:	00 00                	add    %al,(%rax)
  4003e0:	07                   	(bad)  
  4003e1:	00 00                	add    %al,(%rax)
  4003e3:	00 03                	add    %al,(%rbx)
	...

Disassembly of section .init:

00000000004003f0 <_init>:
  4003f0:	48 83 ec 08          	sub    $0x8,%rsp
  4003f4:	48 8b 05 fd 0b 20 00 	mov    0x200bfd(%rip),%rax        # 600ff8 <_DYNAMIC+0x1d0>
  4003fb:	48 85 c0             	test   %rax,%rax
  4003fe:	74 05                	je     400405 <_init+0x15>
  400400:	e8 3b 00 00 00       	callq  400440 <__printf_chk@plt+0x10>
  400405:	48 83 c4 08          	add    $0x8,%rsp
  400409:	c3                   	retq   

Disassembly of section .plt:

0000000000400410 <__libc_start_main@plt-0x10>:
  400410:	ff 35 f2 0b 20 00    	pushq  0x200bf2(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400416:	ff 25 f4 0b 20 00    	jmpq   *0x200bf4(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40041c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400420 <__libc_start_main@plt>:
  400420:	ff 25 f2 0b 20 00    	jmpq   *0x200bf2(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400426:	68 00 00 00 00       	pushq  $0x0
  40042b:	e9 e0 ff ff ff       	jmpq   400410 <_init+0x20>

0000000000400430 <__printf_chk@plt>:
  400430:	ff 25 ea 0b 20 00    	jmpq   *0x200bea(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400436:	68 01 00 00 00       	pushq  $0x1
  40043b:	e9 d0 ff ff ff       	jmpq   400410 <_init+0x20>

Disassembly of section .plt.got:

0000000000400440 <.plt.got>:
  400440:	ff 25 b2 0b 20 00    	jmpq   *0x200bb2(%rip)        # 600ff8 <_DYNAMIC+0x1d0>
  400446:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400450 <_start>:
  400450:	31 ed                	xor    %ebp,%ebp
  400452:	49 89 d1             	mov    %rdx,%r9
  400455:	5e                   	pop    %rsi
  400456:	48 89 e2             	mov    %rsp,%rdx
  400459:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40045d:	50                   	push   %rax
  40045e:	54                   	push   %rsp
  40045f:	49 c7 c0 60 06 40 00 	mov    $0x400660,%r8
  400466:	48 c7 c1 f0 05 40 00 	mov    $0x4005f0,%rcx
  40046d:	48 c7 c7 7d 05 40 00 	mov    $0x40057d,%rdi
  400474:	e8 a7 ff ff ff       	callq  400420 <__libc_start_main@plt>
  400479:	f4                   	hlt    
  40047a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400480 <deregister_tm_clones>:
  400480:	b8 3f 10 60 00       	mov    $0x60103f,%eax
  400485:	55                   	push   %rbp
  400486:	48 2d 38 10 60 00    	sub    $0x601038,%rax
  40048c:	48 83 f8 0e          	cmp    $0xe,%rax
  400490:	48 89 e5             	mov    %rsp,%rbp
  400493:	76 1b                	jbe    4004b0 <deregister_tm_clones+0x30>
  400495:	b8 00 00 00 00       	mov    $0x0,%eax
  40049a:	48 85 c0             	test   %rax,%rax
  40049d:	74 11                	je     4004b0 <deregister_tm_clones+0x30>
  40049f:	5d                   	pop    %rbp
  4004a0:	bf 38 10 60 00       	mov    $0x601038,%edi
  4004a5:	ff e0                	jmpq   *%rax
  4004a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4004ae:	00 00 
  4004b0:	5d                   	pop    %rbp
  4004b1:	c3                   	retq   
  4004b2:	0f 1f 40 00          	nopl   0x0(%rax)
  4004b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4004bd:	00 00 00 

00000000004004c0 <register_tm_clones>:
  4004c0:	be 38 10 60 00       	mov    $0x601038,%esi
  4004c5:	55                   	push   %rbp
  4004c6:	48 81 ee 38 10 60 00 	sub    $0x601038,%rsi
  4004cd:	48 c1 fe 03          	sar    $0x3,%rsi
  4004d1:	48 89 e5             	mov    %rsp,%rbp
  4004d4:	48 89 f0             	mov    %rsi,%rax
  4004d7:	48 c1 e8 3f          	shr    $0x3f,%rax
  4004db:	48 01 c6             	add    %rax,%rsi
  4004de:	48 d1 fe             	sar    %rsi
  4004e1:	74 15                	je     4004f8 <register_tm_clones+0x38>
  4004e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4004e8:	48 85 c0             	test   %rax,%rax
  4004eb:	74 0b                	je     4004f8 <register_tm_clones+0x38>
  4004ed:	5d                   	pop    %rbp
  4004ee:	bf 38 10 60 00       	mov    $0x601038,%edi
  4004f3:	ff e0                	jmpq   *%rax
  4004f5:	0f 1f 00             	nopl   (%rax)
  4004f8:	5d                   	pop    %rbp
  4004f9:	c3                   	retq   
  4004fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400500 <__do_global_dtors_aux>:
  400500:	80 3d 39 0b 20 00 00 	cmpb   $0x0,0x200b39(%rip)        # 601040 <completed.7594>
  400507:	75 11                	jne    40051a <__do_global_dtors_aux+0x1a>
  400509:	55                   	push   %rbp
  40050a:	48 89 e5             	mov    %rsp,%rbp
  40050d:	e8 6e ff ff ff       	callq  400480 <deregister_tm_clones>
  400512:	5d                   	pop    %rbp
  400513:	c6 05 26 0b 20 00 01 	movb   $0x1,0x200b26(%rip)        # 601040 <completed.7594>
  40051a:	f3 c3                	repz retq 
  40051c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400520 <frame_dummy>:
  400520:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  400525:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400529:	75 05                	jne    400530 <frame_dummy+0x10>
  40052b:	eb 93                	jmp    4004c0 <register_tm_clones>
  40052d:	0f 1f 00             	nopl   (%rax)
  400530:	b8 00 00 00 00       	mov    $0x0,%eax
  400535:	48 85 c0             	test   %rax,%rax
  400538:	74 f1                	je     40052b <frame_dummy+0xb>
  40053a:	55                   	push   %rbp
  40053b:	48 89 e5             	mov    %rsp,%rbp
  40053e:	ff d0                	callq  *%rax
  400540:	5d                   	pop    %rbp
  400541:	e9 7a ff ff ff       	jmpq   4004c0 <register_tm_clones>

0000000000400546 <magic>:
  400546:	55                   	push   %rbp
  400547:	48 89 e5             	mov    %rsp,%rbp
  40054a:	53                   	push   %rbx
  40054b:	41 55                	push   %r13
  40054d:	48 8b 05 0c 0b 20 00 	mov    0x200b0c(%rip),%rax        # 601060 <top>
  400554:	48 89 e3             	mov    %rsp,%rbx
  400557:	48 89 25 02 0b 20 00 	mov    %rsp,0x200b02(%rip)        # 601060 <top>
  40055e:	48 89 c4             	mov    %rax,%rsp
  400561:	48 89 f8             	mov    %rdi,%rax
  400564:	48 89 f7             	mov    %rsi,%rdi
  400567:	ff d0                	callq  *%rax
  400569:	48 89 dc             	mov    %rbx,%rsp
  40056c:	41 5d                	pop    %r13
  40056e:	5b                   	pop    %rbx
  40056f:	5d                   	pop    %rbp
  400570:	c3                   	retq   

0000000000400571 <magic_init>:
  400571:	48 c7 05 e4 0a 20 00 	movq   $0x609080,0x200ae4(%rip)        # 601060 <top>
  400578:	80 90 60 00 
  40057c:	c3                   	retq   

000000000040057d <main>:
  40057d:	48 83 ec 08          	sub    $0x8,%rsp
  400581:	b8 00 00 00 00       	mov    $0x0,%eax
  400586:	e8 e6 ff ff ff       	callq  400571 <magic_init>
  40058b:	be 07 00 00 00       	mov    $0x7,%esi
  400590:	bf a9 05 40 00       	mov    $0x4005a9,%edi
  400595:	e8 ac ff ff ff       	callq  400546 <magic>
  40059a:	b8 00 00 00 00       	mov    $0x0,%eax
  40059f:	48 83 c4 08          	add    $0x8,%rsp
  4005a3:	c3                   	retq   
  4005a4:	25 6c 64 0a 00       	and    $0xa646c,%eax

00000000004005a9 <p>:
  4005a9:	48 89 e6             	mov    %rsp,%rsi
  4005ac:	53                   	push   %rbx
  4005ad:	56                   	push   %rsi
  4005ae:	57                   	push   %rdi
  4005af:	48 85 ff             	test   %rdi,%rdi
  4005b2:	74 30                	je     4005e4 <p+0x3b>
  4005b4:	48 89 fb             	mov    %rdi,%rbx
  4005b7:	48 8d 77 ff          	lea    -0x1(%rdi),%rsi
  4005bb:	bf a9 05 40 00       	mov    $0x4005a9,%edi
  4005c0:	e8 81 ff ff ff       	callq  400546 <magic>
  4005c5:	48 01 c3             	add    %rax,%rbx
  4005c8:	48 89 da             	mov    %rbx,%rdx
  4005cb:	be a4 05 40 00       	mov    $0x4005a4,%esi
  4005d0:	bf 01 00 00 00       	mov    $0x1,%edi
  4005d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4005da:	e8 51 fe ff ff       	callq  400430 <__printf_chk@plt>
  4005df:	48 89 d8             	mov    %rbx,%rax
  4005e2:	eb 05                	jmp    4005e9 <p+0x40>
  4005e4:	b8 00 00 00 00       	mov    $0x0,%eax
  4005e9:	5f                   	pop    %rdi
  4005ea:	5e                   	pop    %rsi
  4005eb:	5b                   	pop    %rbx
  4005ec:	c3                   	retq   
  4005ed:	0f 1f 00             	nopl   (%rax)

00000000004005f0 <__libc_csu_init>:
  4005f0:	41 57                	push   %r15
  4005f2:	41 56                	push   %r14
  4005f4:	41 89 ff             	mov    %edi,%r15d
  4005f7:	41 55                	push   %r13
  4005f9:	41 54                	push   %r12
  4005fb:	4c 8d 25 0e 08 20 00 	lea    0x20080e(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  400602:	55                   	push   %rbp
  400603:	48 8d 2d 0e 08 20 00 	lea    0x20080e(%rip),%rbp        # 600e18 <__init_array_end>
  40060a:	53                   	push   %rbx
  40060b:	49 89 f6             	mov    %rsi,%r14
  40060e:	49 89 d5             	mov    %rdx,%r13
  400611:	4c 29 e5             	sub    %r12,%rbp
  400614:	48 83 ec 08          	sub    $0x8,%rsp
  400618:	48 c1 fd 03          	sar    $0x3,%rbp
  40061c:	e8 cf fd ff ff       	callq  4003f0 <_init>
  400621:	48 85 ed             	test   %rbp,%rbp
  400624:	74 20                	je     400646 <__libc_csu_init+0x56>
  400626:	31 db                	xor    %ebx,%ebx
  400628:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40062f:	00 
  400630:	4c 89 ea             	mov    %r13,%rdx
  400633:	4c 89 f6             	mov    %r14,%rsi
  400636:	44 89 ff             	mov    %r15d,%edi
  400639:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40063d:	48 83 c3 01          	add    $0x1,%rbx
  400641:	48 39 eb             	cmp    %rbp,%rbx
  400644:	75 ea                	jne    400630 <__libc_csu_init+0x40>
  400646:	48 83 c4 08          	add    $0x8,%rsp
  40064a:	5b                   	pop    %rbx
  40064b:	5d                   	pop    %rbp
  40064c:	41 5c                	pop    %r12
  40064e:	41 5d                	pop    %r13
  400650:	41 5e                	pop    %r14
  400652:	41 5f                	pop    %r15
  400654:	c3                   	retq   
  400655:	90                   	nop
  400656:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40065d:	00 00 00 

0000000000400660 <__libc_csu_fini>:
  400660:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400664 <_fini>:
  400664:	48 83 ec 08          	sub    $0x8,%rsp
  400668:	48 83 c4 08          	add    $0x8,%rsp
  40066c:	c3                   	retq   

Disassembly of section .rodata:

0000000000400670 <_IO_stdin_used>:
  400670:	01 00                	add    %eax,(%rax)
  400672:	02 00                	add    (%rax),%al

Disassembly of section .eh_frame_hdr:

0000000000400674 <__GNU_EH_FRAME_HDR>:
  400674:	01 1b                	add    %ebx,(%rbx)
  400676:	03 3b                	add    (%rbx),%edi
  400678:	38 00                	cmp    %al,(%rax)
  40067a:	00 00                	add    %al,(%rax)
  40067c:	06                   	(bad)  
  40067d:	00 00                	add    %al,(%rax)
  40067f:	00 9c fd ff ff 84 00 	add    %bl,0x84ffff(%rbp,%rdi,8)
  400686:	00 00                	add    %al,(%rax)
  400688:	dc fd                	fdivr  %st,%st(5)
  40068a:	ff                   	(bad)  
  40068b:	ff 54 00 00          	callq  *0x0(%rax,%rax,1)
  40068f:	00 fd                	add    %bh,%ch
  400691:	fe                   	(bad)  
  400692:	ff                   	(bad)  
  400693:	ff ac 00 00 00 09 ff 	ljmp   *-0xf70000(%rax,%rax,1)
  40069a:	ff                   	(bad)  
  40069b:	ff c4                	inc    %esp
  40069d:	00 00                	add    %al,(%rax)
  40069f:	00 7c ff ff          	add    %bh,-0x1(%rdi,%rdi,8)
  4006a3:	ff                   	(bad)  
  4006a4:	dc 00                	faddl  (%rax)
  4006a6:	00 00                	add    %al,(%rax)
  4006a8:	ec                   	in     (%dx),%al
  4006a9:	ff                   	(bad)  
  4006aa:	ff                   	(bad)  
  4006ab:	ff 24 01             	jmpq   *(%rcx,%rax,1)
	...

Disassembly of section .eh_frame:

00000000004006b0 <__FRAME_END__-0x100>:
  4006b0:	14 00                	adc    $0x0,%al
  4006b2:	00 00                	add    %al,(%rax)
  4006b4:	00 00                	add    %al,(%rax)
  4006b6:	00 00                	add    %al,(%rax)
  4006b8:	01 7a 52             	add    %edi,0x52(%rdx)
  4006bb:	00 01                	add    %al,(%rcx)
  4006bd:	78 10                	js     4006cf <__GNU_EH_FRAME_HDR+0x5b>
  4006bf:	01 1b                	add    %ebx,(%rbx)
  4006c1:	0c 07                	or     $0x7,%al
  4006c3:	08 90 01 07 10 14    	or     %dl,0x14100701(%rax)
  4006c9:	00 00                	add    %al,(%rax)
  4006cb:	00 1c 00             	add    %bl,(%rax,%rax,1)
  4006ce:	00 00                	add    %al,(%rax)
  4006d0:	80 fd ff             	cmp    $0xff,%ch
  4006d3:	ff 2a                	ljmp   *(%rdx)
	...
  4006dd:	00 00                	add    %al,(%rax)
  4006df:	00 14 00             	add    %dl,(%rax,%rax,1)
  4006e2:	00 00                	add    %al,(%rax)
  4006e4:	00 00                	add    %al,(%rax)
  4006e6:	00 00                	add    %al,(%rax)
  4006e8:	01 7a 52             	add    %edi,0x52(%rdx)
  4006eb:	00 01                	add    %al,(%rcx)
  4006ed:	78 10                	js     4006ff <__GNU_EH_FRAME_HDR+0x8b>
  4006ef:	01 1b                	add    %ebx,(%rbx)
  4006f1:	0c 07                	or     $0x7,%al
  4006f3:	08 90 01 00 00 24    	or     %dl,0x24000001(%rax)
  4006f9:	00 00                	add    %al,(%rax)
  4006fb:	00 1c 00             	add    %bl,(%rax,%rax,1)
  4006fe:	00 00                	add    %al,(%rax)
  400700:	10 fd                	adc    %bh,%ch
  400702:	ff                   	(bad)  
  400703:	ff 30                	pushq  (%rax)
  400705:	00 00                	add    %al,(%rax)
  400707:	00 00                	add    %al,(%rax)
  400709:	0e                   	(bad)  
  40070a:	10 46 0e             	adc    %al,0xe(%rsi)
  40070d:	18 4a 0f             	sbb    %cl,0xf(%rdx)
  400710:	0b 77 08             	or     0x8(%rdi),%esi
  400713:	80 00 3f             	addb   $0x3f,(%rax)
  400716:	1a 3b                	sbb    (%rbx),%bh
  400718:	2a 33                	sub    (%rbx),%dh
  40071a:	24 22                	and    $0x22,%al
  40071c:	00 00                	add    %al,(%rax)
  40071e:	00 00                	add    %al,(%rax)
  400720:	14 00                	adc    $0x0,%al
  400722:	00 00                	add    %al,(%rax)
  400724:	44 00 00             	add    %r8b,(%rax)
  400727:	00 49 fe             	add    %cl,-0x2(%rcx)
  40072a:	ff                   	(bad)  
  40072b:	ff 0c 00             	decl   (%rax,%rax,1)
	...
  400736:	00 00                	add    %al,(%rax)
  400738:	14 00                	adc    $0x0,%al
  40073a:	00 00                	add    %al,(%rax)
  40073c:	5c                   	pop    %rsp
  40073d:	00 00                	add    %al,(%rax)
  40073f:	00 3d fe ff ff 27    	add    %bh,0x27fffffe(%rip)        # 28400743 <_end+0x27df76c3>
  400745:	00 00                	add    %al,(%rax)
  400747:	00 00                	add    %al,(%rax)
  400749:	44 0e                	rex.R (bad) 
  40074b:	10 62 0e             	adc    %ah,0xe(%rdx)
  40074e:	08 00                	or     %al,(%rax)
  400750:	44 00 00             	add    %r8b,(%rax)
  400753:	00 74 00 00          	add    %dh,0x0(%rax,%rax,1)
  400757:	00 98 fe ff ff 65    	add    %bl,0x65fffffe(%rax)
  40075d:	00 00                	add    %al,(%rax)
  40075f:	00 00                	add    %al,(%rax)
  400761:	42 0e                	rex.X (bad) 
  400763:	10 8f 02 42 0e 18    	adc    %cl,0x180e4202(%rdi)
  400769:	8e 03                	mov    (%rbx),%es
  40076b:	45 0e                	rex.RB (bad) 
  40076d:	20 8d 04 42 0e 28    	and    %cl,0x280e4204(%rbp)
  400773:	8c 05 48 0e 30 86    	mov    %es,-0x79cff1b8(%rip)        # ffffffff867015c1 <_end+0xffffffff860f8541>
  400779:	06                   	(bad)  
  40077a:	48 0e                	rex.W (bad) 
  40077c:	38 83 07 4d 0e 40    	cmp    %al,0x400e4d07(%rbx)
  400782:	72 0e                	jb     400792 <__GNU_EH_FRAME_HDR+0x11e>
  400784:	38 41 0e             	cmp    %al,0xe(%rcx)
  400787:	30 41 0e             	xor    %al,0xe(%rcx)
  40078a:	28 42 0e             	sub    %al,0xe(%rdx)
  40078d:	20 42 0e             	and    %al,0xe(%rdx)
  400790:	18 42 0e             	sbb    %al,0xe(%rdx)
  400793:	10 42 0e             	adc    %al,0xe(%rdx)
  400796:	08 00                	or     %al,(%rax)
  400798:	14 00                	adc    $0x0,%al
  40079a:	00 00                	add    %al,(%rax)
  40079c:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
  4007a1:	fe                   	(bad)  
  4007a2:	ff                   	(bad)  
  4007a3:	ff 02                	incl   (%rdx)
	...

00000000004007b0 <__FRAME_END__>:
  4007b0:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000600e10 <__frame_dummy_init_array_entry>:
  600e10:	20 05 40 00 00 00    	and    %al,0x40(%rip)        # 600e56 <_DYNAMIC+0x2e>
	...

Disassembly of section .fini_array:

0000000000600e18 <__do_global_dtors_aux_fini_array_entry>:
  600e18:	00 05 40 00 00 00    	add    %al,0x40(%rip)        # 600e5e <_DYNAMIC+0x36>
	...

Disassembly of section .jcr:

0000000000600e20 <__JCR_END__>:
	...

Disassembly of section .dynamic:

0000000000600e28 <_DYNAMIC>:
  600e28:	01 00                	add    %eax,(%rax)
  600e2a:	00 00                	add    %al,(%rax)
  600e2c:	00 00                	add    %al,(%rax)
  600e2e:	00 00                	add    %al,(%rax)
  600e30:	01 00                	add    %eax,(%rax)
  600e32:	00 00                	add    %al,(%rax)
  600e34:	00 00                	add    %al,(%rax)
  600e36:	00 00                	add    %al,(%rax)
  600e38:	0c 00                	or     $0x0,%al
  600e3a:	00 00                	add    %al,(%rax)
  600e3c:	00 00                	add    %al,(%rax)
  600e3e:	00 00                	add    %al,(%rax)
  600e40:	f0 03 40 00          	lock add 0x0(%rax),%eax
  600e44:	00 00                	add    %al,(%rax)
  600e46:	00 00                	add    %al,(%rax)
  600e48:	0d 00 00 00 00       	or     $0x0,%eax
  600e4d:	00 00                	add    %al,(%rax)
  600e4f:	00 64 06 40          	add    %ah,0x40(%rsi,%rax,1)
  600e53:	00 00                	add    %al,(%rax)
  600e55:	00 00                	add    %al,(%rax)
  600e57:	00 19                	add    %bl,(%rcx)
  600e59:	00 00                	add    %al,(%rax)
  600e5b:	00 00                	add    %al,(%rax)
  600e5d:	00 00                	add    %al,(%rax)
  600e5f:	00 10                	add    %dl,(%rax)
  600e61:	0e                   	(bad)  
  600e62:	60                   	(bad)  
  600e63:	00 00                	add    %al,(%rax)
  600e65:	00 00                	add    %al,(%rax)
  600e67:	00 1b                	add    %bl,(%rbx)
  600e69:	00 00                	add    %al,(%rax)
  600e6b:	00 00                	add    %al,(%rax)
  600e6d:	00 00                	add    %al,(%rax)
  600e6f:	00 08                	add    %cl,(%rax)
  600e71:	00 00                	add    %al,(%rax)
  600e73:	00 00                	add    %al,(%rax)
  600e75:	00 00                	add    %al,(%rax)
  600e77:	00 1a                	add    %bl,(%rdx)
  600e79:	00 00                	add    %al,(%rax)
  600e7b:	00 00                	add    %al,(%rax)
  600e7d:	00 00                	add    %al,(%rax)
  600e7f:	00 18                	add    %bl,(%rax)
  600e81:	0e                   	(bad)  
  600e82:	60                   	(bad)  
  600e83:	00 00                	add    %al,(%rax)
  600e85:	00 00                	add    %al,(%rax)
  600e87:	00 1c 00             	add    %bl,(%rax,%rax,1)
  600e8a:	00 00                	add    %al,(%rax)
  600e8c:	00 00                	add    %al,(%rax)
  600e8e:	00 00                	add    %al,(%rax)
  600e90:	08 00                	or     %al,(%rax)
  600e92:	00 00                	add    %al,(%rax)
  600e94:	00 00                	add    %al,(%rax)
  600e96:	00 00                	add    %al,(%rax)
  600e98:	f5                   	cmc    
  600e99:	fe                   	(bad)  
  600e9a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600e9d:	00 00                	add    %al,(%rax)
  600e9f:	00 98 02 40 00 00    	add    %bl,0x4002(%rax)
  600ea5:	00 00                	add    %al,(%rax)
  600ea7:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 600ead <_DYNAMIC+0x85>
  600ead:	00 00                	add    %al,(%rax)
  600eaf:	00 18                	add    %bl,(%rax)
  600eb1:	03 40 00             	add    0x0(%rax),%eax
  600eb4:	00 00                	add    %al,(%rax)
  600eb6:	00 00                	add    %al,(%rax)
  600eb8:	06                   	(bad)  
  600eb9:	00 00                	add    %al,(%rax)
  600ebb:	00 00                	add    %al,(%rax)
  600ebd:	00 00                	add    %al,(%rax)
  600ebf:	00 b8 02 40 00 00    	add    %bh,0x4002(%rax)
  600ec5:	00 00                	add    %al,(%rax)
  600ec7:	00 0a                	add    %cl,(%rdx)
  600ec9:	00 00                	add    %al,(%rax)
  600ecb:	00 00                	add    %al,(%rax)
  600ecd:	00 00                	add    %al,(%rax)
  600ecf:	00 51 00             	add    %dl,0x0(%rcx)
  600ed2:	00 00                	add    %al,(%rax)
  600ed4:	00 00                	add    %al,(%rax)
  600ed6:	00 00                	add    %al,(%rax)
  600ed8:	0b 00                	or     (%rax),%eax
  600eda:	00 00                	add    %al,(%rax)
  600edc:	00 00                	add    %al,(%rax)
  600ede:	00 00                	add    %al,(%rax)
  600ee0:	18 00                	sbb    %al,(%rax)
  600ee2:	00 00                	add    %al,(%rax)
  600ee4:	00 00                	add    %al,(%rax)
  600ee6:	00 00                	add    %al,(%rax)
  600ee8:	15 00 00 00 00       	adc    $0x0,%eax
	...
  600ef5:	00 00                	add    %al,(%rax)
  600ef7:	00 03                	add    %al,(%rbx)
	...
  600f01:	10 60 00             	adc    %ah,0x0(%rax)
  600f04:	00 00                	add    %al,(%rax)
  600f06:	00 00                	add    %al,(%rax)
  600f08:	02 00                	add    (%rax),%al
  600f0a:	00 00                	add    %al,(%rax)
  600f0c:	00 00                	add    %al,(%rax)
  600f0e:	00 00                	add    %al,(%rax)
  600f10:	30 00                	xor    %al,(%rax)
  600f12:	00 00                	add    %al,(%rax)
  600f14:	00 00                	add    %al,(%rax)
  600f16:	00 00                	add    %al,(%rax)
  600f18:	14 00                	adc    $0x0,%al
  600f1a:	00 00                	add    %al,(%rax)
  600f1c:	00 00                	add    %al,(%rax)
  600f1e:	00 00                	add    %al,(%rax)
  600f20:	07                   	(bad)  
  600f21:	00 00                	add    %al,(%rax)
  600f23:	00 00                	add    %al,(%rax)
  600f25:	00 00                	add    %al,(%rax)
  600f27:	00 17                	add    %dl,(%rdi)
  600f29:	00 00                	add    %al,(%rax)
  600f2b:	00 00                	add    %al,(%rax)
  600f2d:	00 00                	add    %al,(%rax)
  600f2f:	00 c0                	add    %al,%al
  600f31:	03 40 00             	add    0x0(%rax),%eax
  600f34:	00 00                	add    %al,(%rax)
  600f36:	00 00                	add    %al,(%rax)
  600f38:	07                   	(bad)  
  600f39:	00 00                	add    %al,(%rax)
  600f3b:	00 00                	add    %al,(%rax)
  600f3d:	00 00                	add    %al,(%rax)
  600f3f:	00 a8 03 40 00 00    	add    %ch,0x4003(%rax)
  600f45:	00 00                	add    %al,(%rax)
  600f47:	00 08                	add    %cl,(%rax)
  600f49:	00 00                	add    %al,(%rax)
  600f4b:	00 00                	add    %al,(%rax)
  600f4d:	00 00                	add    %al,(%rax)
  600f4f:	00 18                	add    %bl,(%rax)
  600f51:	00 00                	add    %al,(%rax)
  600f53:	00 00                	add    %al,(%rax)
  600f55:	00 00                	add    %al,(%rax)
  600f57:	00 09                	add    %cl,(%rcx)
  600f59:	00 00                	add    %al,(%rax)
  600f5b:	00 00                	add    %al,(%rax)
  600f5d:	00 00                	add    %al,(%rax)
  600f5f:	00 18                	add    %bl,(%rax)
  600f61:	00 00                	add    %al,(%rax)
  600f63:	00 00                	add    %al,(%rax)
  600f65:	00 00                	add    %al,(%rax)
  600f67:	00 fe                	add    %bh,%dh
  600f69:	ff                   	(bad)  
  600f6a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600f6d:	00 00                	add    %al,(%rax)
  600f6f:	00 78 03             	add    %bh,0x3(%rax)
  600f72:	40 00 00             	add    %al,(%rax)
  600f75:	00 00                	add    %al,(%rax)
  600f77:	00 ff                	add    %bh,%bh
  600f79:	ff                   	(bad)  
  600f7a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600f7d:	00 00                	add    %al,(%rax)
  600f7f:	00 01                	add    %al,(%rcx)
  600f81:	00 00                	add    %al,(%rax)
  600f83:	00 00                	add    %al,(%rax)
  600f85:	00 00                	add    %al,(%rax)
  600f87:	00 f0                	add    %dh,%al
  600f89:	ff                   	(bad)  
  600f8a:	ff 6f 00             	ljmp   *0x0(%rdi)
  600f8d:	00 00                	add    %al,(%rax)
  600f8f:	00 6a 03             	add    %ch,0x3(%rdx)
  600f92:	40 00 00             	add    %al,(%rax)
	...

Disassembly of section .got:

0000000000600ff8 <.got>:
	...

Disassembly of section .got.plt:

0000000000601000 <_GLOBAL_OFFSET_TABLE_>:
  601000:	28 0e                	sub    %cl,(%rsi)
  601002:	60                   	(bad)  
	...
  601017:	00 26                	add    %ah,(%rsi)
  601019:	04 40                	add    $0x40,%al
  60101b:	00 00                	add    %al,(%rax)
  60101d:	00 00                	add    %al,(%rax)
  60101f:	00 36                	add    %dh,(%rsi)
  601021:	04 40                	add    $0x40,%al
  601023:	00 00                	add    %al,(%rax)
  601025:	00 00                	add    %al,(%rax)
	...

Disassembly of section .data:

0000000000601028 <__data_start>:
	...

0000000000601030 <__dso_handle>:
	...

Disassembly of section .bss:

0000000000601040 <completed.7594>:
	...

0000000000601060 <top>:
	...

0000000000601080 <s>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 55 62             	sub    %dl,0x62(%rbp)
   8:	75 6e                	jne    78 <_init-0x400378>
   a:	74 75                	je     81 <_init-0x40036f>
   c:	20 35 2e 34 2e 30    	and    %dh,0x302e342e(%rip)        # 302e3440 <_end+0x2fcda3c0>
  12:	2d 36 75 62 75       	sub    $0x75627536,%eax
  17:	6e                   	outsb  %ds:(%rsi),(%dx)
  18:	74 75                	je     8f <_init-0x400361>
  1a:	31 7e 31             	xor    %edi,0x31(%rsi)
  1d:	36 2e 30 34 2e       	ss xor %dh,%cs:(%rsi,%rbp,1)
  22:	31 30                	xor    %esi,(%rax)
  24:	29 20                	sub    %esp,(%rax)
  26:	35 2e 34 2e 30       	xor    $0x302e342e,%eax
  2b:	20 32                	and    %dh,(%rdx)
  2d:	30 31                	xor    %dh,(%rcx)
  2f:	36 30 36             	xor    %dh,%ss:(%rsi)
  32:	30 39                	xor    %bh,(%rcx)
	...
