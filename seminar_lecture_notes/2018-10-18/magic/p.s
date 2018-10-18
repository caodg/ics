.LC0:
	.string	"%ld\n"
	.text
	.globl	p
	.type	p, @function

p:	
	movq    %rsp, %rsi
	pushq	%rbx
	pushq   %rsi
	pushq   %rdi

	testq	%rdi, %rdi
	je	.L3
	movq	%rdi, %rbx
	leaq	-1(%rdi), %rsi
	movl	$p, %edi
	call	magic
	addq	%rax, %rbx
	movq	%rbx, %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	movq	%rbx, %rax
	jmp	.L2
.L3:
	movl	$0, %eax
.L2:
	popq    %rdi
	popq    %rsi
	popq	%rbx
	ret
	
