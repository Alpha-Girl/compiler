# answer-s2

1、请用-r solved选项执行bison，将在src目录输出文件expr.output，其中State 9的定义如下：

State 9
    6 exp: exp . PLUS exp
    7    | exp . MINUS exp
    8    | exp . MULT exp
    9    | exp . DIV exp
   10    | MINUS exp .
   11    | exp . EXPON exp
    $default  reduce using rule 10 (exp)
    Conflict between rule 10 and token PLUS resolved as reduce (PLUS < UMINUS).
    Conflict between rule 10 and token MINUS resolved as reduce (MINUS < UMINUS).
    Conflict between rule 10 and token MULT resolved as reduce (MULT < UMINUS).
    Conflict between rule 10 and token DIV resolved as reduce (DIV < UMINUS).
    Conflict between rule 10 and token EXPON resolved as reduce (EXPON < UMINUS).
该状态包含5条冲突，请解释这些冲突产生的原因以及Bison对这些冲突的解决。

原因：此处存在移进-归约冲突，在当前状态(State 9)，下一个终结符是"+"，"-"，"*"，"/"，"**"时，既可以继续移进，也能选择规约为exp，故存在移进-规约冲突。
解决：Bison对这些冲突的解决是选择规约(resolved as reduce)，因为在config/expr.y中：

%left  MINUS PLUS
%left  MULT DIV
%right EXPON
%right UMINUS

UMINUS的优先级高于其他算符。

2、阅读bison产生的分析器源码expr.tab.c，回答：
    （1）指出以下符号的含义：yyss、yyvs、yyn、yytoken、yyval、yydefact、yydefgoto、yytable、yycheck、yypact、yypgoto；
    yyss：状态栈的栈底指针；
    yyvs：语义值栈的栈底指针；
    yyn：规则数；
    yytoken:用于表示当前向前看的记号是哪个记号(用对应的记号表中的记号表示)；
    yyval:用于返回语义值；
    yydefact:对应状态的默认规约数，为0表示错误；
    yydefgoto:默认状态转移表；
    yytable:动作表，决定规约/移进；
    yycheck:
    yypact:描述状态部分的动作表的索引；
    yypgoto:
    （2）简述yyparse()的主要流程，指出标号yysetstate、yybackup、yydefault、yyreduce处的代码主要在做什么方面的处理
3、请阅读labBison/config/expr1.y，并在labBison/下执行make expr1，然后检查输出的src/expr1.output，你将看到其中State 11和 State 24还包含有冲突，请说明冲突的原因。
State 11 移进归约冲突
在状态11下，若下一个为EXPON，则出现二义性，可以理解为（-3）** 2，也可以理解为-（3 ** 2），bison的解决方案是选择移进，即选择后者。

State 24

4、请编写labBison/config/expr1-s2.y（已提供的内容与labBison/config/expr1.y一样），请修改文法使得用Bison处理后的src/expr2.output
不再出现任何Conflict，在文档中说明你的解题思路。

第一个冲突
State 11

   12 fact: MINUS fact .
   13     | fact . EXPON fact

    EXPON  shift, and go to state 18

    $default  reduce using rule 12 (fact)

    Conflict between rule 12 and token EXPON resolved as shift (MINUS < EXPON).
此处应按 MINUS fact 归约，但冲突选择了移进。
故调整如下，使得MINUS fact 归约能够正确规约
修改文法：
term    : term MULT highfact         { $$ = $1 * $3;   }
        | term DIV  highfact         { $$ = $1 / $3;   }
        | highfact                   { $$ = $1;        }
        ;
highfact : fact                   { $$ = $1;        }
        | MINUS fact             { $$ = -$2;       }
fact    : NUMBER                 { $$ = $1;        }
        | fact EXPON fact        { $$ = pow($1,$3);}
        | LB exp RB              { $$ = $2;        }
        ;

此时的冲突：
State 25

   14 fact: fact . EXPON fact
   14     | fact EXPON fact .

    EXPON  shift, and go to state 19

    $default  reduce using rule 14 (fact)

    Conflict between rule 14 and token EXPON resolved as shift (%right EXPON).
即对EXPON结合性的处理，根据定义此时应该移进。
修改文法如下：
fact    : NUMBER t                { $$ = pow($1,$2);        }
        | LB exp RB t             { $$ = $2;        }
        ;
t       : EXPON fact  {$$=$2;}
        |               {$$=1;}
        ;
便可以实现先移进再归约。
此时，就不再出现冲突。