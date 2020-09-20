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