	.text
	.file	"data1.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI0_0:
	.quad	4611686018427387904     # double 2
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI0_1:
	.long	1065353216              # float 1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	xorl	%eax, %eax
	movsd	.LCPI0_0, %xmm0         # xmm0 = mem[0],zero
	movss	.LCPI0_1, %xmm1         # xmm1 = mem[0],zero,zero,zero
	movss	%xmm1, -4(%ebp)
	movsd	%xmm0, -16(%ebp)
	movl	$0, -20(%ebp)
	cvttss2si	-4(%ebp), %ecx
	cvttsd2si	-16(%ebp), %edx
	addl	%edx, %ecx
	movl	%ecx, -20(%ebp)
	addl	$24, %esp
	popl	%ebp
	retl
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function

	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
