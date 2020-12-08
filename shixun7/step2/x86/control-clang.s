	.text
	.file	"control.c"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$0, -4(%rbp)
	cmpl	$0, -8(%rbp)
	je	.LBB0_5
# %bb.1:
	jmp	.LBB0_2
.LBB0_2:
	cmpl	$0, -8(%rbp)
	je	.LBB0_4
# %bb.3:
	jmp	.LBB0_4
.LBB0_4:
	jmp	.LBB0_5
.LBB0_5:
	movl	$0, -12(%rbp)
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	cmpl	$2, -12(%rbp)
	jge	.LBB0_11
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	cmpl	$0, -12(%rbp)
	je	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=1
	jmp	.LBB0_10
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=1
	jmp	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_6 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB0_6
.LBB0_11:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
