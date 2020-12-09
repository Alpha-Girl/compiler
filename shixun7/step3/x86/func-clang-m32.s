	.text
	.file	"func.c"
	.globl	f1                      # -- Begin function f1
	.p2align	4, 0x90
	.type	f1,@function
f1:                                     # @f1
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%ebp), %ecx
	cvtsi2ssl	%ecx, %xmm0
	movl	%esp, %ecx
	movss	%xmm0, (%ecx)
	movl	%eax, -12(%ebp)         # 4-byte Spill
	calll	f2
	fstps	-4(%ebp)
	movss	-4(%ebp), %xmm0         # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -8(%ebp)
	flds	-8(%ebp)
	addl	$24, %esp
	popl	%ebp
	retl
.Lfunc_end0:
	.size	f1, .Lfunc_end0-f1
                                        # -- End function
	.globl	f2                      # -- Begin function f2
	.p2align	4, 0x90
	.type	f2,@function
f2:                                     # @f2
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movss	8(%ebp), %xmm0          # xmm0 = mem[0],zero,zero,zero
	movl	-4(%ebp), %eax
	movl	%esp, %ecx
	movl	%eax, (%ecx)
	movss	%xmm0, -20(%ebp)        # 4-byte Spill
	calll	f1
	fstl	-16(%ebp)
	movsd	-16(%ebp), %xmm0        # xmm0 = mem[0],zero
	movsd	%xmm0, -32(%ebp)        # 8-byte Spill
	addl	$40, %esp
	popl	%ebp
	retl
.Lfunc_end1:
	.size	f2, .Lfunc_end1-f2
                                        # -- End function

	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
