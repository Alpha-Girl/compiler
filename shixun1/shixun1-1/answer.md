问题1-1：
        与之前生成的sample.i相比，第14行原先对宏M的引用已展开为-4，
        因为-DNEG定义了NEG。
        （-D name：Predefine name as a macro, with definition 1.）
问题1-2：
区别1：
        pushq和pushl movq和movl
原因：
        q(quad)(64bit) l(long)(32bit)前者是64位汇编生成的代码，
        后者是32位汇编生成的代码。
区别2：
        %rbp和%ebp %rsp和%esp
原因：  
        rbp和rsp分别是64位寄存器中用于存放栈底指针和栈顶指针的
        ebp和esp分别是32位寄存器中用于存放栈底指针和栈顶指针的
区别3：
        .L3中：64位汇编在ret前执行popq，32位汇编在ret前执行leave
        同时32位汇编中多了
        subl	$16, %esp  #在栈顶分配16字节的空间
原因：
        popq（Transfers word at the current stack top (SS:SP) to the destination
        then increments SP by two to point to the new stack top.）
        leave（Releases the local variables created by the previous ENTER
        instruction by restoring SP and BP to their condition before
        the procedure stack frame was initialized.）
        leave相当于
        movl %ebp, %esp
        popl %ebp
        因为32位汇编中多分配了16字节的空间，栈顶指针发生了改变，在pop前需将存放在ebp中的栈顶寄存器的值放回esp。
        故在32位汇编中使用leave。而64位汇编中没有分配16字节的空间，故直接使用popq。
问题1-3：
        执行gcc/clang -E sample.c -o sample.i后，
        第1-6行（gcc）和第1-7行（clang）的注释部分有所不同，代码部分相同。
        执行gcc/clang -DNEG -E sample.c -o sample.i后，
        结果同上，只有对宏M的引用发生了变化。
        执行gcc/clang -S -m32 sample.c -o sample-32.s后，
        clang生成的代码感觉较为简洁，便于阅读，两者的生成的代码许多实现方式不同。
        比如，gcc用movl	$0, %eax将eax赋值为0，
        而clang则使用异或xorl	%eax, %eax。
        执行gcc/clang -S  sample.c -o sample.s后，
        gcc生成的代码长度较短，具体实现方式仍有所不同。
        执行gcc/clang -c sample.c,并分别进行反汇编后，
        比较二者的汇编代码，gcc的较为简短，在部分代码上较clang有优化。
        