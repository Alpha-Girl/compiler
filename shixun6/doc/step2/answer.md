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


1. 理解include/SyntaxTreePrinter.h和src/SyntaxTreePrinter.cpp文件，描述访问者模式在这个类中的体现：
1）请说明SyntaxTreePrinter和SyntaxTree::Visitor以及语法树节点三者之间的关系；
2）请说明SyntaxTreePrinter访问者是如何处理VarDef、BinaryExpr、BlockStmt、FuncDef这几类语法树节点的。

提供的实训代码实现的是以下的文法（其他非终结符的产生式定义与C1语言一样）:

Stmt        → LVal '=' Exp ';'
         | Ident '(' ')' ';'
         | 'return' [ Exp ] ';'
         | Block
         | ';'    B
Exp         → Exp BinOp Exp
         | UnaryOp Exp
         | '(' Exp ')'
         | LVal
         | Number
其中函数调用是作为单独的一种语句Stmt -> Ident '(' ')' ';'。
现需要修改为C1语言的文法，即函数调用是一种表达式Exp -> Ident '(' ')'，而在语句中有特殊的表达式语句Stmt -> Exp ';'

Stmt        → LVal '=' Exp ';'
         | Exp ';'
         | 'return' [ Exp ] ';'
         | Block
         | ';'
Exp         → Exp BinOp Exp
         | UnaryOp Exp
         | '(' Exp ')'
         | Ident '(' ')'
         | LVal
         | Number
请修改相应的代码并在SyntaxTreePrinter中进行支持。
注：需要保持打印的格式（命令行加上-e选项），函数调用前后不需要加上括号，单个函数调用表达式也不需要；其他非终结符的产生式定义一致。