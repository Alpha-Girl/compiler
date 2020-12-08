# answer.md

1. 分析所给C代码及其中间代码和汇编码

在版本库中 src/data.c 文件的代码如下

static long aa = 10;
short bb = 20;
void func( ) {
    static long cc = 30;
    short dd = 40;
}
请指出aa、bb、cc、dd在LLVM IR、ARM汇编、x86（32位和64位）汇编下的不同表示与访问方式。

aa:

- LLVM：没有aa的表示，可能在编译过程中，因该变量未被使用而优化了。
- arm：aa是一个数据对象(.type	aa, %object),大小为8个字节(.size	aa, 8),8字节对齐(.align	3),初值为10(.xword	10);访问方式，通过label(aa:)来访问。
- 32位：与64位基本一致，除了对齐方式为4字节对齐，大小为4字节。
- 64位：aa是一个数据对象(.type	aa, @object),大小为8个字节(.size	aa, 8),8字节对齐(.align 8),初值为10(.quad	10);访问方式，通过label(aa:)来访问。

bb:

- LLVM：表示方式(@bb = dso_local global i16 20, align 2)，dso_local(本地动态共享对象(Dynamic Shared Object)),global(全局变量),i16(整型16位),初值为20，两字节对齐;访问方式@bb。
- arm：bb是一个数据对象(.type	bb, %object),全局变量(.global	bb),大小为2个字节(.size	bb, 2)，2字节对齐(.align	1),初值为20(.hword	20);访问方式，通过label(bb:)来访问。
- 32位：与64位一致。
- 64位：bb是一个数据对象(.type	bb, @object),全局变量(.globl	bb),大小为2个字节(.size	bb, 2)，2字节对齐(.align 2),初值为20(.value	20);访问方式，通过label(bb:)来访问。

cc:

- LLVM：表示方式(internal global i64 30, align 8)，internal global(内部全局变量)，i64(整型64位),初值为30，8字节对齐;访问方式@func.cc，编号func表示func函数中的全局变量cc。
- arm：cc是一个数据对象(.type	cc.2807, %object),大小为8个字节(.size	cc.2807, 8),初值为30(.xword	30);访问方式，通过label(cc.2807:)来访问,可能有其他全局变量cc用编号.2807以区分。
- 32位：与64位基本一致，除了对齐方式为4字节对齐，大小为4字节，编号为cc.1413。
- 64位：cc是一个数据对象(.type	cc.1796, @object),大小为8个字节(.size	cc.1796, 8),初值为30(.quad	30);访问方式，通过label(cc.1796:)来访问,可能有其他全局变量cc用编号.1796以区分。

dd:

- LLVM：%1 = alloca i16, align 2;先为dd分配空间，两个字节，分配得到的地址值为%1;store i16 40, i16* %1, align 2;把40(16位整型)存入%1值对应的地址，2字节对齐。
- arm：先分配了16字节的空间()，把整数40移入寄存器w0(),在sp向高地址偏移14字节处写入半字(值为w0中的值);访问方式:访问sp+14(取半字)。
- 32位：在存入数40之前，先移动了%esp,分配空间，其他与64位相同。
- 64位：在基地址向地址偏移2字节存入数40(movw	$40, -2(%rbp));访问方式，通过访问-2(%rbp)来获得dd的值。

2. 请写1个C程序step1/data1.c，它包含有float、double类型的变量以及它们强制转换成int并参与计算，请分析它们在LLVM IR、ARM汇编、x86（32位和64位）下的不同特点。你需要提交你的代码文件到step1目录下，并在该目录下按src、arm、x86子目录分别存放源程序、arm汇编码、x86汇编码，命名参照版本库所给的示例。
注：

- LLVM：先为f_aa，d_bb，i_cc分配空间，保存地址，将初值存入对应地址。类型转换过程中，同样先为取数并保存到临时变量，再进行类型转换，把结果保存到新的临时变量。计算也是先保存到临时变量，再存入变量所在地址。
- arm：f_aa表达方式：立即数移入s0寄存器(fmov    s0, 1.0e+0)，把s0寄存器的值存入sp所指的地址(str     s0, [sp]);
  
  d_bb表达方式：立即数移入d0寄存器(fmov    d0, 2.0e+0)，存入地址sp+8(str     d0, [sp, 8]);

  8字节对齐，sp+4-sp+8段填0(str     wzr, [sp, 4]),保存i_cc，同时初始化为0。

  类型转换:
    ldr     s0, [sp]
    fcvtzs  w1, s0
    ldr     d0, [sp, 8]
    fcvtzs  w0, d0
  从对应地址取出f_aa，d_bb进行类型转换，保存到w1，w0。
  执行加法，写回sp+4(i_cc)。

- 32位：	
    fld1      
	fstps	-24(%ebp)
	fldl	.LC1@GOTOFF(%eax)
	fstpl	-16(%ebp)
	movl	$0, -20(%ebp)
    保存f_aa(-24(%ebp)),d_bb(-16(%ebp)),i_cc(-20(%ebp));
    之后进行类型转换结果保存在%edx和%eax,计算写回。
- 64位：
    保存f_aa(-16(%rbp)),d_bb(-8(%rbp)),i_cc(-12(%rbp));
    之后进行类型转换结果保存在%edx和%eax,计算写回。