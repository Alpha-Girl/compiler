	.file	"old.c"
	.text
	.section	.rodata
.LC0:
	.string	"%p, %p, %p, %p\n"
	.text
	.globl	funcOld
	.type	funcOld, @function
funcOld:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movw	%dx, -36(%rbp)
	movw	%ax, -40(%rbp)
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -48(%rbp)
	cvtsd2ss	%xmm1, %xmm0
	movss	%xmm0, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-56(%rbp), %rsi
	leaq	-48(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rsi
	leaq	-16(%rbp), %rcx
	leaq	-18(%rbp), %rdx
	leaq	-20(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	funcOld, .-funcOld
	.globl	func
	.type	func, @function
func:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movss	%xmm0, -44(%rbp)
	movss	%xmm1, -48(%rbp)
	movw	%dx, -36(%rbp)
	movw	%ax, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-48(%rbp), %rsi
	leaq	-44(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rsi
	leaq	-16(%rbp), %rcx
	leaq	-18(%rbp), %rdx
	leaq	-20(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	func, .-func
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movswl	-12(%rbp), %edx
	movswl	-10(%rbp), %eax
	movss	-4(%rbp), %xmm0
	movl	-8(%rbp), %ecx
	movaps	%xmm0, %xmm1
	movl	%ecx, -20(%rbp)
	movss	-20(%rbp), %xmm0
	movl	%edx, %esi
	movl	%eax, %edi
	call	func
	cvtss2sd	-4(%rbp), %xmm1
	cvtss2sd	-8(%rbp), %xmm0
	movswl	-12(%rbp), %edx
	movswl	-10(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	movl	$2, %eax
	call	funcOld
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
