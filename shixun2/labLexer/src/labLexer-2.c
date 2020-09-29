#include "stdio.h"

// expr lexer
#include <stdlib.h>
#include <string.h>
#include "pl0.h"

#ifndef LEXERGEN

#endif

void shougong(char *str)
{
    int i = 0, length = 0, sta = 0;
    while (1)
    {
        printf("%d ", str[i]);
        if (str[i] == '\0' || str[i] == 10 || str[i] == 13)
        {
            if (length == 0 && sta == 0)
            {
                break;
            }

            else
            {
                switch (sta)
                {
                case 0:
                    break;
                case 1:
                    printf("(other,%d)", length);
                    break;
                case 2:
                    printf("(relop,=)");
                    break;
                case 3:
                    printf("(relop,>)");
                    break;
                case 4:
                    printf("(relop,<)");
                    break;
                default:
                    break;
                }
                break;
            }
        }
        switch (sta)
        {
        case 0:
            if (str[i] == '=')
                sta = 2;
            else if (str[i] == '>')
                sta = 3;
            else if (str[i] == '<')
                sta = 4;
            else
            {
                sta = 1;
                length++;
            }

            break;
        case 1:
            if (str[i] == '=')
            {
                printf("(other,%d)", length);
                length = 0;
                sta = 2;
            }

            else if (str[i] == '>')
            {
                printf("(other,%d)", length);
                length = 0;
                sta = 3;
            }

            else if (str[i] == '<')
            {
                printf("(other,%d)", length);
                length = 0;
                sta = 4;
            }
            else
            {
                sta = 1;
                length++;
            }

            break;
        case 2:
            if (str[i] == '=')
            {
                printf("(relop,=)");
                length = 0;
                sta = 2;
            }

            else if (str[i] == '>')
            {
                printf("(relop,=)");
                length = 0;
                sta = 3;
            }

            else if (str[i] == '<')
            {
                printf("(relop,=)");
                length = 0;
                sta = 4;
            }
            else
            {
                printf("(relop,=)");
                length = 1;
                sta = 1;
            }

            break;
        case 3:
            if (str[i] == '=')
            {
                printf("(relop,>=)");
                length = 0;
                sta = 0;
            }

            else if (str[i] == '>')
            {
                printf("(relop,>)");
                length = 0;
                sta = 3;
            }

            else if (str[i] == '<')
            {
                printf("(relop,>)");
                length = 0;
                sta = 4;
            }
            else
            {
                printf("(relop,>)");
                length = 1;
                sta = 1;
            }

            break;
        case 4:
            if (str[i] == '=')
            {
                printf("(relop,<=)");
                length = 0;
                sta = 0;
            }

            else if (str[i] == '>')
            {
                printf("(relop,<>)");
                length = 0;
                sta = 0;
            }

            else if (str[i] == '<')
            {
                printf("(relop,<)");
                length = 0;
                sta = 4;
            }
            else
            {
                printf("(relop,<)");
                length = 1;
                sta = 1;
            }

            break;

        default:
            break;
        }
        i++;
    }
}

int main()
{
    char str[1000];
    int i;
    gets(str);

#ifdef LEXERGEN
    extern FILE *yyin,*infile;
    infile = fopen("lex.in", "w");
    for (i = 0;; i++)
    {
        if (str[i] == '\0' || str[i] == 13 || str[i] == 10)
            break;
        else
        {
            fprintf(infile, "%c", str[i]);
        }
    }
    fclose(infile);
    infile = fopen("lex.in", "r");

    yyin = infile;
    getsym();
    while (sym)
    {
        getsym();
    }

    fclose(infile);
    /*extern FILE * yyin;
    FILE *p=fopen("1.in","w");
    for(int i;;i++){
        if(str[i]!='\0')
            fprintf(p,"%c",str[i]);
        else 
            break;
    }
    yyin=p;*/
#endif
#ifndef LEXERGEN
    shougong(str);
#endif
}