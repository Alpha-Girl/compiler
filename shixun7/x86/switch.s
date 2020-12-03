	.file	"switch.c"
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
	movl	$50, -4(%rbp)
	movl	-4(%rbp), %eax
	imull	-4(%rbp), %eax
	cmpl	$50, %eax
	je	.L3
	cmpl	$50, %eax
	jg	.L4
	cmpl	$10, %eax
	je	.L5
	cmpl	$20, %eax
	je	.L6
	jmp	.L2
.L4:
	cmpl	$70, %eax
	je	.L7
	cmpl	$80, %eax
	je	.L8
	jmp	.L2
.L5:
	movl	$10, -4(%rbp)
	jmp	.L9
.L8:
	movl	$80, -4(%rbp)
	jmp	.L9
.L3:
	movl	$50, -4(%rbp)
	jmp	.L9
.L7:
	movl	$70, -4(%rbp)
	jmp	.L9
.L6:
	movl	$20, -4(%rbp)
	jmp	.L9
.L2:
	movl	$40, -4(%rbp)
.L9:
	movl	-4(%rbp), %eax
	imull	-4(%rbp), %eax
	cmpl	$10, %eax
	ja	.L10
	movl	%eax, %eax
	movq	.L12(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L12:
	.quad	.L10
	.quad	.L11
	.quad	.L13
	.quad	.L10
	.quad	.L10
	.quad	.L14
	.quad	.L15
	.quad	.L16
	.quad	.L10
	.quad	.L17
	.quad	.L18
	.text
.L16:
	movl	$7, -4(%rbp)
	jmp	.L19
.L11:
	movl	$1, -4(%rbp)
	jmp	.L19
.L15:
	movl	$6, -4(%rbp)
	jmp	.L19
.L17:
	movl	$9, -4(%rbp)
	jmp	.L19
.L14:
	movl	$5, -4(%rbp)
	jmp	.L19
.L18:
	movl	$10, -4(%rbp)
	jmp	.L19
.L13:
	movl	$2, -4(%rbp)
	jmp	.L19
.L10:
	movl	$40, -4(%rbp)
.L19:
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~16.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
