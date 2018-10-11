	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_show_maze              ## -- Begin function show_maze
	.p2align	4, 0x90
_show_maze:                             ## @show_maze
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Lcfi3:
	.cfi_offset %rbx, -56
Lcfi4:
	.cfi_offset %r12, -48
Lcfi5:
	.cfi_offset %r13, -40
Lcfi6:
	.cfi_offset %r14, -32
Lcfi7:
	.cfi_offset %r15, -24
	xorl	%r13d, %r13d
	movq	_playerI@GOTPCREL(%rip), %r14
	movq	_playerJ@GOTPCREL(%rip), %r15
	leaq	_maze(%rip), %r12
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_2:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r14), %eax
	cmpq	%rax, %r13
	jne	LBB0_7
## BB#3:                                ##   in Loop: Header=BB0_2 Depth=2
	movl	(%r15), %eax
	cmpq	%rax, %rbx
	jne	LBB0_7
## BB#4:                                ##   in Loop: Header=BB0_2 Depth=2
	movl	$42, %edi
	jmp	LBB0_8
	.p2align	4, 0x90
LBB0_7:                                 ##   in Loop: Header=BB0_2 Depth=2
	movq	(%r12,%r13,8), %rax
	movsbl	(%rax,%rbx), %edi
LBB0_8:                                 ##   in Loop: Header=BB0_2 Depth=2
	callq	_putchar
	incq	%rbx
	cmpq	$6, %rbx
	jne	LBB0_2
## BB#5:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	$10, %edi
	callq	_putchar
	incq	%r13
	cmpq	$6, %r13
	jne	LBB0_1
## BB#6:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi8:
	.cfi_def_cfa_offset 16
Lcfi9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi10:
	.cfi_def_cfa_register %rbp
	movl	_startI(%rip), %eax
	movq	_playerI@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	movl	_startJ(%rip), %eax
	movq	_playerJ@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	callq	_show_maze
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"######"

L_.str.1:                               ## @.str.1
	.asciz	"     #"

L_.str.2:                               ## @.str.2
	.asciz	"#### #"

	.section	__DATA,__data
	.globl	_maze                   ## @maze
	.p2align	4
_maze:
	.quad	L_.str
	.quad	L_.str.1
	.quad	L_.str.2
	.quad	L_.str.2
	.quad	L_.str.1
	.quad	L_.str

	.globl	_startI                 ## @startI
	.p2align	2
_startI:
	.long	1                       ## 0x1

	.globl	_startJ                 ## @startJ
.zerofill __DATA,__common,_startJ,4,2
	.globl	_endI                   ## @endI
	.p2align	2
_endI:
	.long	4                       ## 0x4

	.globl	_endJ                   ## @endJ
.zerofill __DATA,__common,_endJ,4,2
	.comm	_playerI,4,2            ## @playerI
	.comm	_playerJ,4,2            ## @playerJ

.subsections_via_symbols
