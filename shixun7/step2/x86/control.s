	.file	"control.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	cmpl	$0, -4(%rbp)
	je	.L2
	cmpl	$0, -4(%rbp)
.L2:
	movl	$0, -8(%rbp)
	jmp	.L3
.L5:
	cmpl	$0, -8(%rbp)
	addl	$1, -8(%rbp)
.L3:
	cmpl	$1, -8(%rbp)
	jle	.L5
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
