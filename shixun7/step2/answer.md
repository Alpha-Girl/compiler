# asnwer.md

1） arm/switch.ll、x86/switch-m32.ll和x86/switch.ll三个文件的不同之处表现在哪些地方，分别是什么原因引起的？

代码部分无区别，不同之处在target triple(目标平台不同)，llvm.module.flags(不同版本平台使用的模型的flag不同)，llvm.ident(生成.ll文件的clang版本不同)。

2）以arm/switch.ll为例，前后2个switch语句翻译得到的LLVM IR在结构上有区别吗？请以第1个switch语句说明其翻译得到的LLVM IR的特征。LLVM IR上引入switch语句有什么好处?

没有。按照.c文件中switch各个case的顺序，逐个比较，若满足，则跳转至对应的label。引入switch语句可读性强，之间翻译生成的代码也能降低访存miss率，同时还便于在不同平台间移植。

3）查看用gcc生成的ARM汇编代码arm/switch.s，前后2个switch语句翻译得到的ARM汇编在结构上的区别是什么？请说明是怎么组织不同case的判断和各case对应语句的汇编码布局。

前一个对源代码中case的判断进行了优化；通过二分查找的方式优化，各个case的源代码顺序仍不变。后一个则建了个查找表。可能与case的值分布有关。

前一个先判断是否等于中间的值50，是则跳转.L3，若大于跳转至比较70和80的部分(.L4),f否则继续比较10和20，若等则跳转，否则进入defaul(.L2)，case的顺序保持源代码中的顺序。

后一个则通过查表的方式实现，每一个case对应于表(.L2)中的一个项，直接查表(ldr	w0, [x1,w0,uxtw #2])即可找到应跳转的位置(br	x0)，case的顺序保持源代码中的顺序。

4）请对arm/switch.s的第13-32行、52-84行进行注释，解释各指令的含义以及语句标号对应位置的含义。

	mul	w0, w1, w0  #i*i保存至临时变量w0
	cmp	w0, 50      #i*i结果与50比较
	beq	.L3         #若相等，则跳转至.L3(case 50)
	cmp	w0, 50      #
	bgt	.L4         #若大于跳转至.L4(判断是否等于70 / 80)
	cmp	w0, 10      #与10比较
	beq	.L5         #相等，跳转至.L5(case 10)
	cmp	w0, 20      #与20比较
	beq	.L6         #相等，跳转至.L6(case 20)
	b	.L2         #跳转至default
.L4:
	cmp	w0, 70      #与70比较
	beq	.L7         #相等，跳转至.L7(case 70)
	cmp	w0, 80      #与80比较
	beq	.L8         #相等，跳转至.L8(case 80)
	b	.L2         #跳转至default
.L5:
	mov	w0, 10      #置w0为10
	str	w0, [sp, 12]#写入i所在的位置
	b	.L9         #跳出swtich


.L9:                        #第二个switch
	ldr	w1, [sp, 12]        #取i
	ldr	w0, [sp, 12]        #取i
	mul	w0, w1, w0          #计算i*i，存到w0
	sub	w0, w0, #1          #将w0减一
	cmp	w0, 9               #与9比较
	bhi	.L10                #若大于则跳转至default(.L10)
	adrp	x1, .L12        #生成一个PC相关的表，地址为x1
	add	x1, x1, :lo12:.L12  #加上低12位地址
	ldr	w0, [x1,w0,uxtw #2] #取出待转移的标号地址，左移2位（4字节）
	adr	x1, .Lrtx12         #取出.Lrtx12
	add	x0, x1, w0, sxtw #2 #算得地址，右移两位（4字节）
	br	x0                  #跳转到对应地址
.Lrtx12:
	.section	.rodata
	.align	0
	.align	2
.L12:
	.word	(.L11 - .Lrtx12) / 4
	.word	(.L13 - .Lrtx12) / 4
	.word	(.L10 - .Lrtx12) / 4
	.word	(.L10 - .Lrtx12) / 4
	.word	(.L14 - .Lrtx12) / 4
	.word	(.L15 - .Lrtx12) / 4
	.word	(.L16 - .Lrtx12) / 4
	.word	(.L10 - .Lrtx12) / 4
	.word	(.L17 - .Lrtx12) / 4
	.word	(.L18 - .Lrtx12) / 4
	.text
.L16:
	mov	w0, 7              #置i为7
	str	w0, [sp, 12]       #写回
	b	.L19               #跳转

5）对于用clang生成得到的arm/switch-clang.s，比较它与arm/switch.s的不同之处，指出不同之处的含义。

arm/switch-clang.s中第一个switch的比较，为依次比较10，20，50，70，80,若相等则跳转。比较顺序改为了按从小到大的顺序进行比较。

6）x86/switch.s和x86/switch-m32.s是在64位x86系统下分别得到的64位和32位（用-m32选项）的汇编码，指出二者之间有哪些区别。

除了寄存器使用，进入退出函数时的控制语句不同，switch语句的结构，实现方式没有区别。

7）请对x86/switch.s的第13-33行、48-74行进行注释，解释各指令的含义以及语句标号对应位置的含义。


	movl	$50, -4(%rbp)
	movl	-4(%rbp), %eax
	imull	-4(%rbp), %eax      #算得i*i
	cmpl	$50, %eax           #与50比较
	je	.L3                     # =则跳转
	cmpl	$50, %eax
	jg	.L4                     # >则跳转，继续比 70 80
	cmpl	$10, %eax           # 与10 20比较 =则跳转
	je	.L5
	cmpl	$20, %eax
	je	.L6
	jmp	.L2                     # default
.L4:
	cmpl	$70, %eax           #继续与 70 80比较
	je	.L7
	cmpl	$80, %eax
	je	.L8
	jmp	.L2
.L5:
	movl	$10, -4(%rbp)       #置i为10
	jmp	.L9                     #跳转至下一段代码


.L9:                            
	movl	-4(%rbp), %eax      
	imull	-4(%rbp), %eax      #得到i*i
	cmpl	$10, %eax           #与10比较
	ja	.L10                    # >10，转default
	movl	%eax, %eax          #查表部分
	movq	.L12(,%rax,8), %rax
	jmp	*%rax                   #跳转至对应代码段
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
	movl	$7, -4(%rbp)        #置i为7
	jmp	.L19                    #跳转至下一段代码