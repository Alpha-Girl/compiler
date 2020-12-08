	.file	"data1.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-8, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$28, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	fld1
	fstps	-24(%ebp)
	fldl	.LC1@GOTOFF(%eax)
	fstpl	-16(%ebp)
	movl	$0, -20(%ebp)
	flds	-24(%ebp)
	fnstcw	-26(%ebp)
	movzwl	-26(%ebp), %eax
	orb	$12, %ah
	movw	%ax, -28(%ebp)
	fldcw	-28(%ebp)
	fistpl	-32(%ebp)
	fldcw	-26(%ebp)
	movl	-32(%ebp), %edx
	fldl	-16(%ebp)
	fldcw	-28(%ebp)
	fistpl	-32(%ebp)
	fldcw	-26(%ebp)
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	$0, %eax
	addl	$28, %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB1:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE1:
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
