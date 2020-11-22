# answer-s3

1. 理解规则中嵌入的动作，是继承属性还是综合属性？
1)上述input规则中第2行的动作与第5行的动作分别相当于继承属性还是综合属性，Bison对这两个嵌入动作是怎么处理的？请查阅bison生成的src/exprL.output进行说明。

第2行的动作相当于综合属性，对应 input: %empty。
第5行的动作相当于继承属性，对应 input: input $@1 line。

2）根据./run.sh exprL expr.in的输出结果，请说明词法分析和语法分析的交替过程，解释输出的第1个行中3在Line 1:之前的原因。

先进行词法分析，得到将3归约为NUMBER，之后不是$end,故选择input: input $@1 line这一分支，将空归约为$@1,然后输出Line 1：，之后继续继续词法分析。

3）请修改config/exprL-s3.y，使之能在解析每行前输出行号信息，即先后执行make exprL-s3和./run.sh exprL-s3 expr.in后，输出：

Line 1 (1):    3 2 3  **  **  = 6561 at line 1
Line 2 (2):    
Line 3 (3):    
Line 4 (4):    48 2 2 3  **  **  +  = 304 at line 4
Line 5 (5):    56 78 3  *  + 8  -  -  + 2  -  +  = 296 at line 5
或

Line 1 (1):    3 2 3  **  **  = 6561 at line 1
Line 2 (2):    
Line 3 (3):    
Line 4 (4):    48 2 2 3  **  **  +  = 304 at line 4
Line 5 (5):    56 78 3  *  + 8  -  -  + 2  -  +  = 296 at line 5
Line 6 (6):    
请在tasks/answer-s3.md中说明你的解答是上述两种中的哪一种，简述你的解决思路；如果你的解答是后一种，请分析其中的难点是哪里，可能的改动是什么。

解答为前一种：首先需修改 debug的宏定义 或 在编译时去掉-DDEBUG，使得在词法分析过程中不再输出字符，然后，使用综合属性和继承属性，将待输出的内容记录在属性message中，在最后输出即可。
例：
exp     : NUMBER                 { $$.value = $1;itoa($1,$$.message,10);        }
        | exp PLUS  exp          { $$.value = $1.value + $3.value;strcat($1.message," ");strcat($1.message,$3.message);char s[3]=" +\0";strcat($1.message,s);strcpy($$.message,$1.message);   }
其他算符作类似处理，详见exprL-s3.y

2. 使用并理解用Bison构造中缀表达式到逆波兰式的转换
请分析为什么在二义文法下，这里仍能正确输出逆波兰式。

因为通过优先级 负号>乘方>乘除>加减，解决了移进归约冲突中的选择问题。而逆波兰式的实现只需在遇到 操作数时输出操作数，在归约时输出当前归约的操作符即可。优先级决定了归约顺序，优先级高的先归约，先输出，即先运算，故能正确输出逆波兰式。

3. 分析用Bison构造中缀表达式到波兰式转换中的问题

请分析：1）产生这些冲突的原因；2）为什么还能生成可执行文件bin/exprL-pre；3）解释报语法错误的原因。
1）冲突的原因：
在这里解析前需要进行操作输出信息，但无法通过当前信息选择正确分支，即待输出的信息需要在输出后解析过程中才能确定。
2）：
因为只是这些规则在这一文法中不起作用，但其他部分仍能正常解析句子，故只是报告了warning，但不是报告error，因此能生成可执行文件bin/exprL-pre。
3）：
除了读取到空串，其他情况都会出现冲突，一个输入对应了多个转移状态，且没有优先级加以区分。
4. 用Bison构造中缀表达式到波兰式转换器
请编写config/exprL-pre-s3.y，完成中缀式到波兰式的转换，并用多个测试程序进行测试。请将你的主要构造思路写到tasks/answer-s3.md中。
构造思路：
每个文法符号用结构体
struct ASTNode{
  char message[100];
  float value;
};
标记其信息，在翻译过程中，计算并更新message信息（根据波兰式的规则），
 exp PLUS  exp          { $$.value = $1.value + $3.value;strcat($1.message," ");
                            strcat($1.message,$3.message);strcpy($$.message," + ");
                            strcat($$.message,$1.message);   }
在读取完一整行时，输出波兰式及其值，即在line:exp EOL归约时，进行操作{ printf("%s  = %g at line %d\n",$1.message,$1.value,@1.last_line);}


