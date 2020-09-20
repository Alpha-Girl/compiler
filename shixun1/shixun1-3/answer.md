gcc -m32条件下得到的汇编码及注释：
	.file	"sort.c"
	.text
	.globl	sort
	.type	sort, @function
sort: #排序函数
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp #分配空间给p，i，j，k，min
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	12(%ebp), %eax #读取参数a
	movl	%eax, -4(%ebp) #赋值给p
	movl	$0, -20(%ebp) #循环初始化
	jmp	.L2
.L6: #进入第二层循环前的赋值
	movl	-20(%ebp), %eax #得到i
	leal	0(,%eax,4), %edx #计算地址偏移
	movl	-4(%ebp), %eax #得到p
	addl	%edx, %eax #得到数组元素地址
	movl	(%eax), %eax #取值
	movl	%eax, -12(%ebp) #min=p[j]
	movl	-20(%ebp), %eax #得到i
	movl	%eax, -8(%ebp) #k=i
	movl	-20(%ebp), %eax
	addl	$1, %eax #i++
	movl	%eax, -16(%ebp)
	jmp	.L3 #准备进入内层循环
.L5:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	%eax, -12(%ebp) #if条件判断
	jle	.L4
	movl	-16(%ebp), %eax #若p[j]小于min，执行if内的操作
	leal	0(,%eax,4), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp) #min=p[j]
	movl	-16(%ebp), %eax #得到j
	movl	%eax, -8(%ebp) #k=j
.L4:
	addl	$1, -16(%ebp) #循环变量j++
.L3: 
	movl	-16(%ebp), %eax
	cmpl	8(%ebp), %eax #进入内层循环前的条件判断
	jl	.L5 #进入内层循环
	movl	-20(%ebp), %eax #交换剩余序列的最小值，至序列头
	leal	0(,%eax,4), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movl	-8(%ebp), %edx
	leal	0(,%edx,4), %ecx #计算地址偏移
	movl	-4(%ebp), %edx 
	addl	%ecx, %edx
	movl	(%eax), %eax #p[k]=p[i]
	movl	%eax, (%edx)
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-4(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%edx) #p[i]=min
	addl	$1, -20(%ebp)
.L2:i
	movl	-20(%ebp), %eax #得到i
	cmpl	8(%ebp), %eax #将i与n比较
	jl	.L6 #进入外层循环
	movl	$0, %eax
	leave 
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret #返回main()函数
	.cfi_endproc
.LFE0:
	.size	sort, .-sort
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$4112, %esp #分配存储空间 给n，i，数组a 
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	subl	$8, %esp
	leal	-4120(%ebp), %eax #分配空间给数组a
	pushl	%eax
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT #得到n
	addl	$16, %esp
	movl	$0, -4116(%ebp) #i赋初值为0
	jmp	.L9
.L10:
	leal	-4112(%ebp), %eax
	movl	-4116(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	subl	$8, %esp
	pushl	%eax
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT #得到输入序列
	addl	$16, %esp
	addl	$1, -4116(%ebp)
.L9:
	movl	-4120(%ebp), %eax
	cmpl	%eax, -4116(%ebp)
	jl	.L10   #进入main()函数中的获取输入的循环
	movl	-4120(%ebp), %eax #参数n
	subl	$8, %esp
	leal	-4112(%ebp), %edx #参数a
	pushl	%edx  #参数传递
	pushl	%eax
	call	sort #调用sort()函数进行排序
	addl	$16, %esp
	movl	$0, -4116(%ebp)
	jmp	.L11
.L12:
	movl	-4116(%ebp), %eax
	movl	-4112(%ebp,%eax,4), %eax
	subl	$8, %esp
	pushl	%eax
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT #输出排序后的数
	addl	$16, %esp
	addl	$1, -4116(%ebp)
.L11:
	movl	-4120(%ebp), %eax
	subl	$1, %eax
	cmpl	%eax, -4116(%ebp)
	jl	.L12
	movl	-4120(%ebp), %eax
	subl	$1, %eax
	movl	-4112(%ebp,%eax,4), %eax
	subl	$8, %esp
	pushl	%eax
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT #输出排序后的最后一个数
	addl	$16, %esp
	movl	$0, %eax
	movl	-12(%ebp), %ecx
	xorl	%gs:20, %ecx
	je	.L14
	call	__stack_chk_fail_local
.L14: #输出结束至剩余部分
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB2:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE2:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB3:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE3:
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

clang -m32 条件下的汇编码、注释及二者的区别：
区别：
    clang生成的汇编代码比较符合阅读习惯，跳转指令较少，gcc则较为模块化，跳转指令较多。
    clang生成的汇编代码中有便于理解的注释，如循环深度等。
    二者对同一变量分配的空间不同。
相同：
    实现方式基本相同。
代码：
	.text
	.file	"sort.c"
	.globl	sort                    # -- Begin function sort
	.p2align	4, 0x90
	.type	sort,@function
sort:  #排序函数                                 # @sort
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$28, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	%edx, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	%eax, -24(%ebp)         # 4-byte Spill
	movl	%ecx, -28(%ebp)         # 4-byte Spill
	#在gcc中此处为跳转 不利于阅读

	#循环中标明了 循环头的位置及深度
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-8(%ebp), %eax 				
	cmpl	8(%ebp), %eax
	jge	.LBB0_10
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %ecx
	movl	(%eax,%ecx,4), %eax
	movl	%eax, -16(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -12(%ebp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%ebp), %eax
	movl	-12(%ebp), %ecx
	movl	(%eax,%ecx,4), %eax
	cmpl	-16(%ebp), %eax
	jge	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-4(%ebp), %eax
	movl	-12(%ebp), %ecx
	movl	(%eax,%ecx,4), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -20(%ebp)
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -12(%ebp)
	jmp	.LBB0_3
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %ecx
	movl	(%eax,%ecx,4), %eax
	movl	-4(%ebp), %ecx
	movl	-20(%ebp), %edx
	movl	%eax, (%ecx,%edx,4)
	movl	-16(%ebp), %eax
	movl	-4(%ebp), %ecx
	movl	-8(%ebp), %edx
	movl	%eax, (%ecx,%edx,4)
# %bb.9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	.LBB0_1
.LBB0_10:
	xorl	%eax, %eax
	addl	$28, %esp
	popl	%ebp
	retl
.Lfunc_end0:
	.size	sort, .Lfunc_end0-sort
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4152, %esp             # imm = 0x1038
	leal	.L.str, %eax
	leal	-4108(%ebp), %ecx
	movl	$0, -4(%ebp)
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	__isoc99_scanf
	movl	$0, -4112(%ebp)
	movl	%eax, -4116(%ebp)       # 4-byte Spill
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4112(%ebp), %eax
	cmpl	-4108(%ebp), %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	leal	.L.str, %eax
	leal	-4104(%ebp), %ecx
	movl	-4112(%ebp), %edx
	shll	$2, %edx
	addl	%edx, %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	__isoc99_scanf
	movl	%eax, -4120(%ebp)       # 4-byte Spill
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-4112(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4112(%ebp)
	jmp	.LBB1_1
.LBB1_4:
	leal	-4104(%ebp), %eax
	movl	-4108(%ebp), %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	sort
	movl	$0, -4112(%ebp)
	movl	%eax, -4124(%ebp)       # 4-byte Spill
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movl	-4112(%ebp), %eax
	movl	-4108(%ebp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB1_8
# %bb.6:                                #   in Loop: Header=BB1_5 Depth=1
	leal	.L.str.1, %eax
	movl	-4112(%ebp), %ecx
	movl	-4104(%ebp,%ecx,4), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	movl	%eax, -4128(%ebp)       # 4-byte Spill
# %bb.7:                                #   in Loop: Header=BB1_5 Depth=1
	movl	-4112(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4112(%ebp)
	jmp	.LBB1_5
.LBB1_8:
	leal	.L.str, %eax
	movl	-4108(%ebp), %ecx
	subl	$1, %ecx
	movl	-4104(%ebp,%ecx,4), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	xorl	%ecx, %ecx
	movl	%eax, -4132(%ebp)       # 4-byte Spill
	movl	%ecx, %eax
	addl	$4152, %esp             # imm = 0x1038
	popl	%ebp
	retl
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%d "
	.size	.L.str.1, 4


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits


gcc -m64 条件下的汇编码、注释及不同：
不同：在实现方式，代码结构上相同，只是在指令上一些xxxl指令换为xxxq指令。
代码：

	.file	"sort.c"
	.text
	.globl	sort
	.type	sort, @function
sort:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L2
.L6:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.L3
.L5:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -16(%rbp)
	jle	.L4
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -12(%rbp)
.L4:
	addl	$1, -20(%rbp)
.L3:
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L5
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -24(%rbp)
.L2:
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L6
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sort, .-sort
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-4120(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -4116(%rbp)
	jmp	.L9
.L10:
	leaq	-4112(%rbp), %rax
	movl	-4116(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -4116(%rbp)
.L9:
	movl	-4120(%rbp), %eax
	cmpl	%eax, -4116(%rbp)
	jl	.L10
	movl	-4120(%rbp), %eax
	leaq	-4112(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	sort
	movl	$0, -4116(%rbp)
	jmp	.L11
.L12:
	movl	-4116(%rbp), %eax
	cltq
	movl	-4112(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4116(%rbp)
.L11:
	movl	-4120(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4116(%rbp)
	jl	.L12
	movl	-4120(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-4112(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
