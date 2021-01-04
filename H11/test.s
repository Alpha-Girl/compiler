	.file	"test.c"
	.text
	.p2align 4,,15
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	xorl	%eax, %eax
	jmp	*%rdi
	.cfi_endproc
.LFE0:
	.size	f, .-f
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	leaq	f(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	f
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
