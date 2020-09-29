#include "stdio.h"
main()
{
    char str[1000];
    int i = 0, length = 0, sta = 0;
    gets(str);
    while (1)
    {
        if (str[i] == '\0' || str[i]=='\r' || str[i]=='\n'){
            if (length == 0 &&sta==0)
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
            }}
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