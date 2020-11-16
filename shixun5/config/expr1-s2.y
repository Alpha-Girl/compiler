/*
 * expr1.y : A simple yacc expression parser
 *          Based on the Bison manual example. 
 * The parser eliminates conflicts by introducing more nondeterminals.
 */

%{
#include <stdio.h>
#include <math.h>
int yylex();
void yyerror(const char *s);
%}

%union {
   float val;
   char *op;
}
%locations

%token <val> NUMBER
%token <op> PLUS MINUS MULT DIV EXPON
%token EOL
%token LB RB

%left  MINUS PLUS
%left  MULT DIV
%right EXPON
%right UMINUS

%type  <val> exp term fact highfact

%%
input   :
        | input line
        ;

line    : EOL { printf("\n");}
        | exp EOL { printf(" = %g  at line %d\n",$1, @$.last_line);}

exp     : exp PLUS  term         { $$ = $1 + $3;   }
        | exp MINUS term         { $$ = $1 - $3;   }
        | term                   { $$ = $1;        }
        ;
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
%%
void yyerror(const char *message)
{
  printf("%s\n",message);
}

int main(int argc, char *argv[])
{
  yyparse();
  return(0);
}








