# asnwer.md

1）arm/fact.ll和x86/fact.ll两个文件的不同之处表现在哪些地方，分别是什么原因引起的？

不同之处表现在target triple，target datalayout(目标平台不同)，llvm.ident(使用的llvm版本不同)。

2）以arm/fact.ll为例，对第10-37、92-97行的代码进行注释，说明每行的含义。

; Function Attrs: noinline nounwind optnone
define dso_local i32 @f2(i32 %0) #0 {           #函数f2
  %2 = alloca i32, align 4                      #分配4字节空间，地址为%2，用于保存返回值
  %3 = alloca i32, align 4                      #分配4字节空间，地址为%3
  store i32 %0, i32* %3, align 4                #把传入的参数n(%0)，保存到%3对应的地址空间
  %4 = load i32, i32* %3, align 4               #把n的值取出，存到临时变量%4
  store i32 %4, i32* @f2.m, align 4             #取m的地址
  %5 = load i32, i32* @f2.m, align 4            #把n赋值给m
  %6 = icmp eq i32 %5, 0                        #比较 m 和 0
  br i1 %6, label %7, label %8                  #根据比较条件转移到 %7 或 %8

7:                                                ; preds = %1
  store i32 1, i32* %2, align 4                 #条件成立，返回值置1
  br label %14                                  #跳转到退出函数部分

8:                                                ; preds = %1
  %9 = load i32, i32* @f2.m, align 4            #条件不成立，取m保存到%9
  %10 = load i32, i32* @f2.m, align 4           #取m保存到%10
  %11 = sub nsw i32 %10, 1                      #计算临时变量m-1
  %12 = call i32 @f2(i32 %11)                   #调用f2 参数为m-1(%11) 返回值为%12
  %13 = mul nsw i32 %9, %12                     #计算m*f2(m-1)，存到%13
  store i32 %13, i32* %2, align 4               #返回值置为%13
  br label %14                                  #跳转到退出函数部分

14:                                               ; preds = %8, %7
  %15 = load i32, i32* %2, align 4              #%15保存返回值
  ret i32 %15                                   #返回返回值，退出函数
}


define dso_local i32 @main() #0 {               #main函数
  %1 = call i32 @f1(i32 3)                      #调用f1(3)，返回值保存到%1
  %2 = call i32 @f2(i32 3)                      #调用f2(3)，返回值保存到%2
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 %1, i32 %2)           #调用printf 输出%1，%2
  ret i32 0                                     #退出，无return语句，默认返回0
}

3）以arm/fact.ll为例，指出f2、f1、f3三个函数的LLVM IR代码有哪些不同之处，分别是什么原因引起的。

f2多了保存m，将n赋值给m的部分。因为f2中定义了静态变量m。

f1中则没有，但仍需对传入的参数n进行保存，其他控制部分等与f2相同。

f3因为没有传入参数，所以不需要保存n，而是直接load全局变量n。
在调用函数部分与f1，f2的指令不同：

%9 = call i32 bitcast (i32 ()* @f3 to i32 (i32)*)(i32 %8)

f1，f2中：

%11 = call i32 @f1(i32 %10)

多了一步类型转换，把void->int的函数指针 @f3 转换为int->int的函数指针，以传入参数n-1。

4）查看用gcc生成的ARM汇编代码arm/fact.s，对第4-36、108-118行的代码进行注释，并说明它们和arm/fact.ll中代码的对应关系与区别。

	.align	2                 #两字节对齐
	.global	f2                #全局函数f2
	.type	f2, %function
f2:
	stp	x29, x30, [sp, -32]!  #把x29，x30寄存器的值存到sp-32起始的位置，对应分配空间，同时修改sp为sp-32
	add	x29, sp, 0            #把sp的值保存到x29
	str	w0, [x29, 28]         #把w0的值保存到sp+28
	adrp	x0, m.3259          #m的地址除了第12位的部分得到，保存到x0
	add	x0, x0, :lo12:m.3259  #加上m的地址低12位，保存到x0
	ldr	w1, [x29, 28]         #取出保存的传入参数n的值到w1
	str	w1, [x0]              #把w1写入m的存储空间，store i32 %4, i32* @f2.m, align 4
	adrp	x0, m.3259          #同上
	add	x0, x0, :lo12:m.3259
	ldr	w0, [x0]              #取出m的值，%5 = load i32, i32* @f2.m, align 4
	cmp	w0, 0                 #将m与0比较，%6 = icmp eq i32 %5, 0
	bne	.L2                   #跳转至不相等的情况
	mov	w0, 1                 #相等，置返回值为1
	b	.L3                     #转返回，退出函数前的处理
.L2:
	adrp	x0, m.3259          #同上
	add	x0, x0, :lo12:m.3259
	ldr	w0, [x0]              #取出m，保存到x0
	sub	w0, w0, #1            #计算m-1，保存到w0
	bl	f2                    #调用f2
	mov	w1, w0                #取出返回值至w1
	adrp	x0, m.3259          #同上
	add	x0, x0, :lo12:m.3259
	ldr	w0, [x0]              #取出m，保存到x0
	mul	w0, w1, w0            #计算m*f2(m-1)，保存到w0
.L3:
	ldp	x29, x30, [sp], 32    #以sp为起始地址，取出两个双字到x29，x30寄存器，sp+32
	ret                       #退出函数
	.size	f2, .-f2            #函数f2结束

指令顺序与.ll文件基本对应，在得到m的值时的具体实现较为复杂，还增加了对sp的修改。

	mov	w0, 3                 #置临时变量w0为3，参数
	bl	f1                    #调用f1
	mov	w19, w0               #保存返回值至w19
	mov	w0, 3                 #置临时变量w0为3，参数
	bl	f2                    #调用f2
	mov	w1, w0                #保存返回值至w1
	adrp	x0, .LC0            #同上
	add	x0, x0, :lo12:.LC0    #计算参数"%d, %d"的地址
	mov	w2, w1                #移入参数
	mov	w1, w19               #移入参数
	bl	printf                #调用printf函数

  与.ll中的指令顺序一致，主要增加了参数获取，保存到对应位置的代码。

5）arm/fact.s中f2、f1、f3三个函数的ARM汇编代码有哪些不同之处，分别是什么原因引起的。

f2中出现多次：

	adrp	x0, m.3259
	add	x0, x0, :lo12:m.3259
	ldr	w0, [x0]

  是由静态变量m存储位置不同引起的。

f3中出现：

  adrp	x0, n
	add	x0, x0, :lo12:n
	ldr	w0, [x0]

  是由全局变量n的存储位置不同引起的。

6）对于用clang生成得到的arm/fact-clang.s，比较它的f2函数定义（第3-39行）与arm/fact.s中的f2函数定义有哪些不同之处，指出不同之处的含义。

fact.s中每次取得m的值都要重新获得m的地址，在clang中对其进行了优化，将m的地址用临时变量保存，下次使用时，从临时变量中取m的地址，然后进行索引提高效率。(对应17，24，25行)

对sp的修改的实现方式不同，同时clang中把sp+32保存在x29，对临时变量的访问通过x29+offset的格式进行访问，而fact.s中则大部分通过寄存器访问。

在指令顺序(控制指令等)方面，控制的语义相同，使用的实现方式略有不同，如cbnz来代替 cmp bne。

7）查看用gcc生成的64位x86汇编代码x86/fact.s，对第3-36、122-131行的代码进行注释，并说明它们和arm/fact.ll中代码的对应关系与区别。

	.globl	f2                #全局函数f2
	.type	f2, @function
f2:
.LFB0:
	.cfi_startproc
	pushq	%rbp                #控制链，当前%rbp入栈
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp          #把%rbp修改为%rsp，控制权转移
	.cfi_def_cfa_register 6
	subq	$16, %rsp           #分配16字节空间
	movl	%edi, -4(%rbp)      #存入参数n
	movl	-4(%rbp), %eax      #把参数，移到临时变量%eax
	movl	%eax, m.2248(%rip)  #赋值给m
	movl	m.2248(%rip), %eax  #取m
	testl	%eax, %eax          #比较是否为0
	jne	.L2                   #不为0，跳转至.L2
	movl	$1, %eax            #置返回值为1
	jmp	.L3                   #转函数退出部分
.L2:
	movl	m.2248(%rip), %eax  #取m
	subl	$1, %eax            #算m-1
	movl	%eax, %edi          #移入待传参数
	call	f2                  #调用f2
	movl	%eax, %edx          #取回返回值
	movl	m.2248(%rip), %eax  #取m
	imull	%edx, %eax          #计算m*f2(m-1)
.L3:
	leave                     #修改%rbp,%rsp
	.cfi_def_cfa 7, 8
	ret                       #交还控制权
	.cfi_endproc
.LFE0:
	.size	f2, .-f2            #函数f2结束

	movl	$3, %edi            #移入立即数3(实参)
	call	f2                  #调用f2
	movl	%eax, %ebx          #保存返回值
	movl	$3, %edi            #移入立即数3(实参)
	call	f1                  #调用f2
	movl	%ebx, %edx          #保存返回值
	movl	%eax, %esi          
	movl	$.LC0, %edi         #取得参数"%d, %d"
	movl	$0, %eax            
	call	printf              #调用printf

分配空间通过移动%rsp来实现，其他实现基按照.ll文件中的指令顺序来完成，包括控制转移指令。主要的不同是在实现过程中对%rsp和%rbp的控制。

8）x86/fact.s中f2、f1、f3三个函数的汇编代码有哪些不同之处，分别是什么原因引起的。

f2中需要通过m.2248(%rip)获取和修改m的值。f1则不用，因为没有静态变量。f3中需要取得n的值但是通过n(%rip)，没有标号因为n是全局变量，不需要标号。

9）分析x86/fact.s和arm/fact.s中f3的定义及其内部的调用，指出形参和实参的处理特点，画出f1、f2、f3的活动记录的存储布局。

x86在调用前除了移入参数，还会把%eax置0，而arm则在移入参数后直接调用。

x86在调用函数前，会把实参移动到特定寄存器。arm中则是在计算这一临时变量时的结果就已经保存在实参的寄存器中了。

对于形参都是先保存再使用。

arm：

f1：
  sp +28 n
f2:
  sp +28 n
f3:
  sp
  无临时变量
x86:

f1:
  %rbp-4   n
  %rbp
f2:
  %rbp-4   n
  %rbp

f3:
  %rbp
  无临时变量


请写1个或多个C程序step3/func*.c，它包含返回类型为float、double的两个函数，存在形参与实参类型不一致的情况（如int和float、int和long、long和double等），分析它们在LLVM IR、ARM汇编、x86（32位和64位）下的不同特点，结合可执行程序分析形参数、变量的地址和存储单元的内容。

- LLVM: f1分配空间，存参数；取出参数，执行类型转换并保存；调用f2，对返回值进行类型转换，返回。f2同理。
  
- arm：实现思路与LLVM中相同，scvtf指令实现int到float的转换，fcvt实现double到float的转换。s0是单精度寄存器，保存float类型，d0是双精度寄存器，保存double类型。long是64位。
  
- 32位：使用了fildl将参数压入栈，fstps将参数转换成float类型，flds压单精度数入栈，代码结构相同，指令实现与平台相关。

- 64位：实现思路与LLVM中相同，在调用前先进行类型转换，cvtsi2ss实现int到float的类型转换，同时保存单精度浮点数的寄存器(%xmm0)也与之前用的不同。cvtsd2ss实现double到float的转换。