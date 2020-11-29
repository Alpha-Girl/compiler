# HW8

## 听 曾建江老师的报告AIoT时代的编程语言、编译器与指令集架构

略

## 写 下这篇报告中所讨论的问题及涉及的编译知识要点

### 趋势与挑战

>[微处理器的发展趋势](https://www.karlrupp.net/2018/02/42-years-of-microprocessor-trend-data/)

>通用计算的时代已经结束

>指令集架构趋势(划分软硬件的分工)

>编译技术趋势

>挑战

>>后摩尔时代 软件灾难

>>不同领域的计算需要越来越多的异构资源

>>出现面向特定领域定制的体系结构

>>如何解决 性能 产能 可移植性的问题

### 产品案例

>昇腾 AI编译器

>>super knernel优化技术

>>并行编译 ccache优化

>>算一优化编译 代码生成技术

>方舟编译器

>>java全静态

>>RC内存管理

>>JNI自动拆墙优化

### 技术案例互动分享

>方舟编译技术

>>跨平台

>>统一中间表示 统一优化

>auto-tuning编译技术

>>自动评估优化编译策略 自动迭代

>>3个主要组件：tuning-enabled编译器，search driver，profiler

>128比特宽原子操作指令优化

>>特定指令集优化特定程序 特定场景问题驱动指令集设计

>>数据库场景下 通过宽原子操作减少冲突

### 挑战课题

>重点突破编程语言核心技术

>>探索，构建通用编程语言各种可扩展机制的设计和实现

>>新型AI编程语言设计和实现

>基于开放体系架构下的DSA设计与编译工具链技术研究

>>DSA设计

>>DSA编译优化自动化

>>DSA高效建模

>AI芯片编译器关键技术研究

>面向应用的统一IR的研究

## 思 考程序语言和编译对现代业界的作用和影响

### 作用

程序语言多样化使得业界在开发过程中有了更多选择，也提高了开发效率。程序语言更加简洁，减少代码量(提高产能)的同时，也提升了安全性，还便于交流(程序员之间，人机之间)。在代码需求越来越大的时代，代码的多样化，让程序员能够拥有适合自己的工具。

编译技术的进步(自动优化等)，提高了可执行程序的性能，一些问题可以在编译过程中得到较好的解决，减轻了程序员的负担。中间表示的发展提高了代码的可移植性。在并行计算等领域，通过在编译中的优化，不仅减少了开发时间，而且让可执行程序更加安全，高效。

### 影响

兼容性高的程序语言不能较好地发挥特定硬件的优势，需要通过定制语言加以解决，因此对领域语言的需求增加，驱动编译技术的发展。简洁的语言降低了编程的门槛，让越来越多人，从使用者变成开发者(参与者)，优化了语言的生态。

特定应用场景下的特定语言，需要定制化的编译及优化方案，同时也能够充分发挥硬件的优势，也反过来促进了处理器的发展。编译通过对算子优化等方式，进一步提升了AI，大数据等需要大规模计算的领域的发展。

## 问 抛出至少2个现存编程语言及编译中的问题，以及至少1个对在研或未来编程语言与编译的问题

1. 深度学习编译器和我们常用的gcc等有什么区别？

1. 什么是元编程？

1. gcc编译优化选项(-O1,-O2,-O3等等)之间有什么区别？

1. 编译过程是否能可视化(或者目前是否有可视化的编译器)，使得程序员对编译过程有更具象的理解，同时对报错信息的认识及处理也能更加高效，也有利于程序员写出更优质的代码。

## 做 给出对你抛出的现存编程语言及编译问题的解答（包含编程与编译分析）、以及你对在研或未来编程语言及编译问题的思考

### 深度学习编译器和我们常用的gcc等有什么区别？

回答这一问题首先要知道深度学习编译器实现了哪些功能。深度学习应用本身的输入是一个有向图，图的每一个节点代表一个计算，两个节点之间，代表数据依赖。这是第一个重要的应用特征信息，由此出发，通过图算法可以进行初步的优化。

第二个重要的应用特征信息是深度学习中的计算往往都是张量计算。张量计算的一个重要特征就是，计算以多重循环为主，常常伴有reduce操作，以矩阵乘法为例A*B=C，矩阵乘法是一个三层循环，前两层循环用来表示计算结果C矩阵中的每一个位置的元素，第三层循环用来计算一个reduce操作。通过循环优化的具体方案实现优化。

在优化需求上深度学习编译器和传统编译器有很大的差别。传统编译器注重于优化寄存器使用和指令集匹配，其优化往往偏向于局部。而深度学习编译器的优化往往需要涉及到全局的改写，包括之前提到的内存，算子融合等。目前深度学习框架的图优化或者高层优化（HLO）部分和传统编译的pass比较匹配，这些优化也会逐渐被标准的pass所替代。但是在高层还会有开放的问题，即高层的抽象如何可以做到容易分析又有足够的表达能力。TVM的Relay，XLA和Glow是三个在这个方向上的例子。

在自动代码生成上，传统编译器的目标是生成比较优化的通用代码。而深度学习编译器的目标是生成接近手写或者更加高效的特定代码（卷积，矩阵乘法等）。相对的，在一些情况下深度学习编译器可以花费更多的时间去寻找这些解决方案。

参考:[深度学习编译技术的现状和未来](https://zhuanlan.zhihu.com/p/65452090),[深度学习编译器](https://zhuanlan.zhihu.com/p/87706488)

### 什么是元编程？

元编程（Metaprogramming）是编写、操纵程序的程序，简而言之即为用代码生成代码。元编程是一种编程范式，在传统的编程范式中，程序运行是动态的，但程序本身是静态的。在元编程中，两者都是动态的。元编程将程序作为数据来对待，从而赋予了编程语言更加强大的表达能力。

编写元程序的语言称之为元语言，被操纵的语言称之为目标语言。

比较低阶的方式是用直接用处理文本的方式生成代码，其次是用IDE的可视化特性、以及用模版引擎的方式，而最高级的方式应该是用编译原理的方式实现。

#### 元语言非目标语言

##### 文本处理

几乎所有的编程语言都有输入输出文本的能力。利用文本输出能力生成具体代码是最简单的元编程手段。其实用这种方式可以生成任何一种语言的代码，之所以把它归类于"元语言非目标语言"，因为它对目标语言的代码仅仅当作一种文本来处理。

##### IDE特性

通过可视化IDE生成代码的编程探索可谓历史悠久，最早开始的是桌面端IDE，进入Web时代后诞生了富文本编辑器，随后又产生了一些脚手架框架。在页面上拖拖拽拽、快捷的操作命令就能生成代码，能够大大提升构建工程的速度。

对于这种元编程方式而言，大都针对特定的IDE，大部分情况下我们只是普通用户，除了IDE的设计者很少有人去了解其背后的实现机制。当然有些IDE也会提供插件定制功能，这时候便有机会在其基础上进行元编程开发。

##### 模板引擎

几乎所有的Web后端语言都有生成HTML的模版引擎技术，通过变量替换、表达式处理等方式来简化前端页面编写逻辑，更好地实现用户界面与业务数据的分离，提高前端代码的可维护性。

虽然现在前后端分离已经大行其道，大部分情况下后端程序员无需关心前端页面的实现，但是当后端逻辑里涉及到HTML、XML和其他格式化文本的生成时，模板引擎依然是我们的最佳备选方案。

##### 编译原理

同样是处理结构化文本，基于词法分析和语法分析而实现的元编程比模板引擎更为强大灵活，要知道，编译器就是最常见的元编程形式（将源代码编译为机器指令）。基于Lex、Yacc和ANTLR之类的编译工具，即便我们不精通编译原理，也能完成语法的解析和代码的生成，甚至创造一门自己的编程语言。

#### 元语言即目标语言

现代的编程语言大都会为我们提供不同的元编程能力。静态元编程主要有宏和泛型，允许程序在编译期展开生成或者执行代码。动态元编程主要靠反射机制，允许程序在运行时改变自身的行为。

##### 静态元编程

宏一个将输入的字符串映射成其他字符串的过程，这个映射的过程也被称作宏展开。很多编程语言，尤其是编译型语言都实现了宏这个特性，然而这些语言却使用了不同的方式来实现宏：一种是基于文本替换的宏，另一种是基于语法的宏。

C语言中的文本替换宏，只是一个简单的标识符，它们会在预编译的阶段被预编译器替换成宏定义中后半部分的字符，类似于变量声明：

'#define BUFFER_SIZE 1024'

C语言中同样有简单形式的语法宏，通过在宏的定义中引入参数，宏定义的内部就可以直接使用对应的标识符引入外界传入的参数，同样也是在预编译阶段完成替换，类似于函数定义：

'#define plus(a, b) a + b'
'#define multiply(a, b) a * b'

泛型（generics）同样是一种编程范式，它允许程序员在强类型程序设计语言中编写代码时使用一些以后才指定的类型，在实例化时作为参数指明这些类型。各种程序设计语言和其编译器、运行环境对泛型的支持均不一样。Java、C#、F#和Swift等语言称之为泛型；Scala 和 Haskell 称之为参数多态；C++ 和D称之为模板。只有在编辑期能够展开代码的泛型，才能算符合元编程的范畴。

##### 动态元编程

反射是指计算机程序在运行时可以访问、检测和修改它本身状态或行为的一种能力。用比喻来说，反射就是程序在运行的时候能够“观察”并且修改自己的行为。

一般来说，程序中代码的执行逻辑是明确的，运行时引擎（Runtime engine）将代码解析为机器指令，然后计算机按照顺序执行，在此过程中代码无法自己改变执行的顺序，但反射机制允许在运行过程中通过调用运行时引擎暴露的API来实时获取和改变代码，从而可以改变源代码中预设的执行顺序。

反射的实现因语言而异，这也就让不同的语言有不同的元编程体验。反射是比较高级的元编程方式，可以用来简化日志处理、异常处理和权限管理等重复的逻辑，提高编程的效率。

参考:[一文读懂元编程](https://www.jianshu.com/p/d3b637ece518)

### gcc编译优化选项(-O1,-O2,-O3等等)之间有什么区别？

#### -O0

默认模式，不做任何优化。

#### -O1

该选项打开时，编译器尝试降低代码规模和执行时间，但不执行耗费大量时间的优化选项。

打开的编译优化选项有：

- -fauto-inc-dec 
- -fbranch-count-reg 
- -fcombine-stack-adjustments 
- -fcompare-elim 
- -fcprop-registers 
- -fdce 
- -fdefer-pop 
- -fdelayed-branch 
- -fdse 
- -fforward-propagate 
- -fguess-branch-probability 
- -fif-conversion 
- -fif-conversion2 
- -finline-functions-called-once 
- -fipa-modref 
- -fipa-profile 
- -fipa-pure-const 
- -fipa-reference 
- -fipa-reference-addressable 
- -fmerge-constants 
- -fmove-loop-invariants 
- -fomit-frame-pointer 
- -freorder-blocks 
- -fshrink-wrap 
- -fshrink-wrap-separate 
- -fsplit-wide-types 
- -fssa-backprop 
- -fssa-phiopt 
- -ftree-bit-ccp 
- -ftree-ccp 
- -ftree-ch 
- -ftree-coalesce-vars 
- -ftree-copy-prop 
- -ftree-dce 
- -ftree-dominator-opts 
- -ftree-dse 
- -ftree-forwprop 
- -ftree-fre 
- -ftree-phiprop 
- -ftree-pta 
- -ftree-scev-cprop 
- -ftree-sink 
- -ftree-slsr 
- -ftree-sra 
- -ftree-ter 
- -funit-at-a-time

#### -O2

除了速度与空间之间权衡的优化之外的选项都打开，与-O1相比编译所用的时间更多，生成的代码质量也更高。

在-O1基础上，进一步打开以下优化选项：

- -falign-functions  -falign-jumps 
- -falign-labels  -falign-loops 
- -fcaller-saves 
- -fcode-hoisting 
- -fcrossjumping 
- -fcse-follow-jumps  -fcse-skip-blocks 
- -fdelete-null-pointer-checks 
- -fdevirtualize  -fdevirtualize-speculatively 
- -fexpensive-optimizations 
- -ffinite-loops 
- -fgcse  -fgcse-lm  
- -fhoist-adjacent-loads 
- -finline-functions 
- -finline-small-functions 
- -findirect-inlining 
- -fipa-bit-cp  -fipa-cp  -fipa-icf 
- -fipa-ra  -fipa-sra  -fipa-vrp 
- -fisolate-erroneous-paths-dereference 
- -flra-remat 
- -foptimize-sibling-calls 
- -foptimize-strlen 
- -fpartial-inlining 
- -fpeephole2 
- -freorder-blocks-algorithm=stc 
- -freorder-blocks-and-partition  -freorder-functions 
- -frerun-cse-after-loop  
- -fschedule-insns  -fschedule-insns2 
- -fsched-interblock  -fsched-spec 
- -fstore-merging 
- -fstrict-aliasing 
- -fthread-jumps 
- -ftree-builtin-call-dce 
- -ftree-pre 
- -ftree-switch-conversion  -ftree-tail-merge 
- -ftree-vrp

#### -O3

打开所有优化，较-O2进一步打开以下选项：

- -fgcse-after-reload 
- -fipa-cp-clone
- -floop-interchange 
- -floop-unroll-and-jam 
- -fpeel-loops 
- -fpredictive-commoning 
- -fsplit-loops 
- -fsplit-paths 
- -ftree-loop-distribution 
- -ftree-loop-vectorize 
- -ftree-partial-pre 
- -ftree-slp-vectorize 
- -funswitch-loops 
- -fvect-cost-model 
- -fvect-cost-model=dynamic 
- -fversion-loops-for-strides

参考:[gcc文档](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)

### 编译过程是否能可视化(或者目前是否有可视化的编译器)，使得程序员对编译过程有更具象的理解，同时对报错信息的认识及处理也能更加高效，也有利于程序员写出更优质的代码。

可以在AST的基础上，加上GUI设计，实现编译获得的抽象语法树的可视化。在报错信息等方面，可以在树访问过程中，输出信息，并在图象上显示。这样可以使得程序员消除warning，error等报错信息时，如同根据引导在图书馆寻找图书一样清晰明了。类似的，也可以在debug过程中引入可视化。但如何降低可视化的开销，可能是个难题。

## 惑 给出你关于编程语言与编译的困惑或不明白的问题

编译原理为什么这么难？:(

有没有从汇编代码到高级语言的反汇编工具，其难点在哪？

编译器自身是用什么编译的？第一个编译器是如何编译的？

