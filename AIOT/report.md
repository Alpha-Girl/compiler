请每位同学：

听 曾建江老师的报告AIoT时代的编程语言、编译器与指令集架构；
写 下这篇报告中所讨论的问题及涉及的编译知识要点；

微处理器的发展
    晶体管数量 摩尔定律
    单核性能 21世纪 发展缓慢
    频率 2000 工艺 物理实现 
    功耗 2000 不可能大规模增长 物理限制 热量 能量密度 超过核反应堆 极限
    05年 跟随摩尔定律 处理器核数量
通用计算的时代已经结束
    处理器 专用 定制化 硬件 提升性能降低功耗 对计算并行 访存特征
    例 AI芯片
CISC 60 高级
RISC 70 简单
VLIW 80 并行
    时间 主流指令集不多了
    融合
    划分软（编译器）和硬（芯片）的分工来定义软硬件界面ISA
编译技术
    单核优化 2000-2004
    多核优化  性价比 单核性能
    2010后 异构 处理器形态 GPU DSP FPGA AI芯片等 超异构 异构计算 定制
 软件灾难
    后摩尔时代
    TPU 针对领域定制
开发者
    软件开发效率 低
    兼容性差 代码移植成本高
    产能 性能 可移植性

趋势
    声明式开发 所见即所得 UI即代码
    协同式开发 高效 避免冲突 云 分布式 
    智慧化开发 AI辅助编程 AI可视化编程 安全漏洞

产品
    升腾 AI编译器
    super knernel优化技术
    并行编译 ccache优化
    算一优化编译 代码生成技术  性能 开发时间

方舟
    java全静态
    RC内存管理
    JNI自动拆墙优化

实现
    设计和实现
     表达能力强 容易描述计算
     语言 容易使用 好学 好读 好写 安全
     编译器 运行时间短 占用资源少 平台无关 可移植
    
编译基本过程
    编译执行 二进制 跑得快
    解释执行 翻译一句 做一句
    字节码 虚拟机 java 与微处理器不相关 JIT实时编译 机器码直接执行

    方舟编译技术
        跨平台
        maple engine
        支持多语言
        开发者环境

        新能原理 跨语言墙 字节码 
         统一中间表示
         统一优化
         静态生成可执行文件

    自动调优编译技术
        编译策略 为获取 软件最优性能 自动调整编译参数策略
        自动评估优化 自动迭代
        三个主要组件
        tuning-enabled编译器
        search driver
        profiler（动态/静态） 反馈
        整体流程 平台 硬件/仿真

        指令集 128比特宽原子操作指令优化 特定指令集优化特定程序 特定场景问题驱动指令集设计
        数据库 多核 并发 加解锁冲突 减少冲突
        无锁数据结构

挑战课题
    通用编程语言的扩展机制
    新型AI编程语言的设计和实现
    提升编程体验效率 充分发挥硬件潜力 最大化程序性能
    编程语言挑战

    通用
    扩充现有编程语言和编译器能力
    构建嵌入式领域相关语言 快速满足各种原因场景的定制需求

    元编程 跨语言互操作

    


思 考程序语言和编译对现代业界的作用和影响；
问 抛出至少2个现存编程语言及编译中的问题，以及至少1个对在研或未来编程语言与编译的问题
做 给出对你抛出的现存编程语言及编译问题的解答（包含编程与编译分析）、以及你对在研或未来编程语言及编译问题的思考。
惑 给出你关于编程语言与编译的困惑或不明白的问题。
提交要求：

以markdown文档方式写出对上面后5点的回答；
给出”做“的部分涉及的代码、用于编译和运行的shell脚本，指出你所使用的工具环境和版本号并将使用说明写到markdown文档中
注意：

请注意本次作业的提交截止时间
每位同学需要在作业截止后的1天时间评阅系统自动分配的2名学生的作业，按百分制评分，重点是给出文字评阅
本次作业的成绩由主讲教师、助教和学生三部分评分组成
本次作业的成绩与平时的普通作业不同，单独计入学期总成绩