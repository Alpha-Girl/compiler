# answer

1. 请阅读include/SyntaxTree.h,总结在该文件中声明了哪些类型和类，分别表示什么含义；进一步阅读src/SyntaxTree.cpp，指出其中定义的各个方法的作用。

include/SyntaxTree.h中声明了Type,BinOp,UnaryOp枚举类，分别表示类型，双目运算符和单目运算符；

还声明了结构体Node(结点),Assembly(根节点),GlobalDef(全局定义),FuncDef(函数定义),Expr(表达式),BinaryExpr(双目运算表达式),UnaryExpr(单目运算表达式),LVal(变量),Literal(常数),Stmt(语句),VarDef(变量声明), AssignStmt(赋值语句),FuncCallStmt(函数调用语句),ReturnStmt(返回语句),BlockStmt(语句块), EmptyStmt(空语句),Visitor(访问者);

src/SyntaxTree.cpp中的方法用于访问上述结点(预留接口)。

1. 请阅读src/C1Driver.cpp、src/main.cpp并浏览grammar目录下C1语言的词法描述文件C1Parser.ll和文法描述文件C1Parser.yy，简述C1Driver类与词法分析类和语法分析类之间的关系，词法分析类和语法分析类与C1Parser.ll和C1Parser.yy之间的对应关系。

C1Driver类与词法分析类和语法分析类之间是依赖关系，C1Driver类的实现基于词法分析类和语法分析类的方法。
词法分析类对应于C1Parser.ll，语法分析类对应于C1Parser.yy。

1. 理解bison文法文件C1Parser.yy，描述其中至少3种非终结符的产生式定义及其相关的AST语法树生成的实现，你需要从下列非终结符中挑选要描述的产生式定义以及AST语法树的生成：

CompUnit、ConstDecl、ConstDef、VarDef、FuncDef、Stmt、Exp

ConstDecl： 常量声明

CONST DefType ConstDefList SEMICOLON ：const 类型 定义的常量a=x1(,b=x2...) ;

节点指向常量定义列表，在生成这个节点后确定该列表中定义常量的类型。

ConstDef: 常量定义

IDENTIFIER ASSIGN Exp 常量名 = 表达式

节点生成 is_constant 和 is_inited 置为true， 表示是常量且已初始化。

name即为IDENTIFIER，初始化的值为Exp的值。

FuncDef： 函数定义

DefType IDENTIFIER LPARENTHESE RPARENTHESE Block ：类型 函数名 () {函数体}

该节点的ret_type为返回值类型，name为函数名，body指向函数体。

1. 理解include/SyntaxTreePrinter.h和src/SyntaxTreePrinter.cpp文件，描述访问者模式在这个类中的体现：

1）请说明SyntaxTreePrinter和SyntaxTree::Visitor以及语法树节点三者之间的关系；

SyntaxTreePrinter是SyntaxTree::Visitor的子类。Visitor中的有访问语法树节点的visit()函数。

2）请说明SyntaxTreePrinter访问者是如何处理VarDef、BinaryExpr、BlockStmt、FuncDef这几类语法树节点的。

VarDef:

是否为常数 是否为数组 是否初始化 依次判断输出。

BinaryExpr：

    - 输出（
    - 输出运算符左部
    - 输出运算符
    - 输出运算符右部
    - 输出）

BlockStmt:

    - 输出{
    - 输出空格(格式控制)
    - 输出语法块内语句
    - 输出空格(格式控制)
    - 输出}

FuncDef：

    依次输出类型 空格 函数名() 以及定义函数的语法块