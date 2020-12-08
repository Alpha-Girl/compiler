/*请写1个C程序step2/control.c，它包含if、while、for及break和continue语句，
以及if子句中包含循环、循环中包含if的情况，分析它们在LLVM IR、ARM汇编、x86（32位和64位）下的不同特点。*/

int main()
{
    int a, i;
    if (a)
        while (a)
            break;
    for (i = 0; i < 2; i++)
        if (i)
            continue;
}