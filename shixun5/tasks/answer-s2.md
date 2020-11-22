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
    yyparse()主要流程：
    yysetstate：
    yybackup：
    yydefault:
    yyreduce:
    
3、请阅读labBison/config/expr1.y，并在labBison/下执行make expr1，然后检查输出的src/expr1.output，你将看到其中State 11和 State 24还包含有冲突，请说明冲突的原因。
State 11 移进归约冲突
在状态11下，若下一个为EXPON，则出现二义性，可以理解为（-3）** 2，也可以理解为-（3 ** 2），bison的解决方案是选择移进，即选择后者，因为MINUS的优先级低于EXPON。

State 24 移进归约冲突
在状态24下，若下一个为EXPON，则出现二义性，可以理解为3**(2** 3),也可以理解为(3** 2) ** 3,bison的解决方案是选择移进，选择前者，因为EXPON是右结合。

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

5、请自行用一个句子解释用生成的expr分析器分析的过程，分别基于expr.y和expr1-s2.y文法文件构造的分析器。
5+-4**2**2*3/2
expr.y:
$                        NUMBER PLUS MINUS NUMBER EXPON NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$   goto State 1
$ NUMBER                   PLUS MINUS NUMBER EXPON NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$     goto State 3
$ exp                           PLUS MINUS NUMBER EXPON NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$      reduce exp:NUMBER goto State 8
$ exp  PLUS                          MINUS NUMBER EXPON NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$ goto State 11
$ exp  PLUS MINUS                          NUMBER EXPON NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$ goto State 4
$ exp  PLUS MINUS NUMBER                          EXPON NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$ goto State 3
$ exp  PLUS MINUS exp                             EXPON NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$ reduce exp:NUMBER goto State 9
$ exp  PLUS exp                                   EXPON NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$ reduce exp:MINUS exp goto State 18
$ exp  PLUS exp EXPON                                   NUMBER EXPON NUMBER MULT NUMBER DIV NUMBER$ goto State 15
$ exp  PLUS exp EXPON NUMBER                                   EXPON NUMBER MULT NUMBER DIV NUMBER$ goto State 3
$ exp  PLUS exp EXPON exp                                      EXPON NUMBER MULT NUMBER DIV NUMBER$ goto State 22
$ exp  PLUS exp EXPON exp EXPON                                      NUMBER MULT NUMBER DIV NUMBER$ goto State 15
$ exp  PLUS exp EXPON exp EXPON NUMBER                                      MULT NUMBER DIV NUMBER$ goto State 3
$ exp  PLUS exp EXPON exp EXPON exp                                         MULT NUMBER DIV NUMBER$ goto State 22
$ exp  PLUS exp EXPON exp                                                   MULT NUMBER DIV NUMBER$ reduce exp: exp EXPON exp goto State 22
$ exp  PLUS exp                                                             MULT NUMBER DIV NUMBER$ reduce exp: exp EXPON exp goto State 18
$ exp  PLUS exp MULT                                                             NUMBER DIV NUMBER$ goto State 13
$ exp  PLUS exp MULT NUMBER                                                             DIV NUMBER$ goto State 3
$ exp  PLUS exp MULT exp                                                                DIV NUMBER$ reduce exp: NUMBER goto State 20
$ exp  PLUS exp                                                                         DIV NUMBER$ reduce exp: exp MULT exp goto State 18
$ exp  PLUS exp DIV                                                                         NUMBER$  goto State 14
$ exp  PLUS exp DIV NUMBER                                                                        $  goto State 3
$ exp  PLUS exp DIV exp                                                                           $  goto State 21
$ exp  PLUS exp                                                                                   $  reduce: exp : exp DIV exp goto State 18
$ exp                                                                                             $  reduce: exp : exp PLUS exp goto State 16
$ line                                                                                            $  reduce: line: exp EOL goto State 7
$ input                                                                                           $  reduce: input: input line goto State 1
$ input $end                                                                                      $  go to State 2(accpet) 

5 + - 4 * 2
expr1-s2.y
$                   NUMBER PLUS MINUS NUMBER MULT NUMBER$
$ input             NUMBER PLUS MINUS NUMBER MULT NUMBER$ go to State 1
$ input NUMBER             PLUS MINUS NUMBER MULT NUMBER$ go to State 3
$ input fact               PLUS MINUS NUMBER MULT NUMBER$ reduce: fact:NUMBER go to State 10
$ input term               PLUS MINUS NUMBER MULT NUMBER$ reduce: term:fact go to State 9
$ input exp                PLUS MINUS NUMBER MULT NUMBER$ reduce: exp:term go to State 8
$ input exp PLUS                MINUS NUMBER MULT NUMBER$ reduce: exp:term go to State 13
$ input exp PLUS  MINUS               NUMBER MULT NUMBER$ go to State 4
$ input exp PLUS  MINUS NUMBER               MULT NUMBER$ go to State 3
$ input exp PLUS  MINUS fact                 MULT NUMBER$ reduce: fact:NUMBER go to State 11
$ input exp PLUS  fact                       MULT NUMBER$ reduce:  fact: MINUS fact go to State 10
$ input exp PLUS  term                       MULT NUMBER$ reduce:  term: fact go to State 20
$ input exp PLUS  term MULT                       NUMBER$ go to State 16
$ input exp PLUS  term MULT NUMBER                      $ go to State 3
$ input exp PLUS  term MULT fact                        $ reduce: fact:NUMBER go to State 22
$ input exp PLUS  term                                  $ reduce: term: term MULT fact go to State 20
$ input exp                                             $ reduce: exp: exp PLUS term go to State 8
$ input exp EOL                                         $ go to State 15
$ input line                                            $ reduce: line: exp EOL go to State 7
$ input                                                 $ reduce: input: input line go to State 1
$ input $end                                            $ reduce: input: input line go to State 2
accept