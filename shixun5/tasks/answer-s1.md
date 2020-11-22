# answer-s1

1.
e1.in思路：检验**的运算优先级。
结果：优先级：-(负号)>乘方>乘除>加减
e2.in思路: 除零，溢出，错误处理的检查。
结果：除零输出inf，向上溢出输出 8.50706e+37，向下溢出输出- 8.50706e+37，错误处理输出syntax error。
2.
在expr.lex中增加：
"**"       { debug("**"); yylval.op = "**"; 
             return(EXPON);}
根据最长匹配原则，会先识别出**，而不会和 *混淆。

3.
mkdir -p src                                                        //若不存在src目录，创建src目录
mkdir -p bin                                                        //若不存在bin目录，创建bin目录
bison -d -y -r solved -b expr -o src/expr.tab.c config/expr.y       //使用bison根据config/expr.y生成expr.tab.c放在src目录下

/*-y或者--yacc：表示像传统的yacc命令那样执行，缺省地，分析器源文件命名为y.tab.c和y.tab.h
-d或者--defines：它假设在文法描述文件中指定了%defines，这将产生一个额外的输出文件，如这里的expr.tab.h，其中包含文法中声明的各个记号的记号类型定义以及符号常量等其他一些声明
-r solved：它指示bison产生*.output文件输出关于文法和分析器的详细信息，包含所解决的冲突信息，该选项主要用来调试文法用，可以在调试成功后去掉
-b expr或--file-prefix=expr：它假设指定了%file-prefix，即指定Bison输出文件名的前缀，这里将缺省的yy修改为expr
-o file：指定输出的分析器源文件名*/

flex -i -I -o src/expr.lex.c config/expr.lex                        //使用flex根据config/expr.lex生成expr.lex.c放在src目录下

/*-i或者--case-insensitive或者%option case-insensitiv：指示flex生成不区分大小写的词法分析程序（扫描器scanner）
-I或者--interactive或者 %option interactive：指示flex生成交互式扫描器，它会向前看足够的符号来确定匹配的记号*/

gcc -g -Isrc -DDEBUG -o bin/expr src/expr.lex.c src/expr.tab.c -lfl -lm //用gcc编译源程序生成expr程序放在bin目录下，链接flex和math库

显然，根据命令的具体操作可知bison和flex指令之间所需文件，不存在依赖关系可以调整顺序。
而两个mkdir指令之间也不存在依赖关系，也可以调整顺序。
gcc命令所需文件需要bison和flex指令生成，故须放在最后。
DAG：
mkdir1-> 0 ->bison 0 ->gcc
mkdir2->   ->flex

只要满足上图的拓扑排序对应的指令序列，都是可以的。