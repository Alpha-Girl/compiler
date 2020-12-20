#include <stdio.h>
void funcOld(i,j,f,e)
short i, j; float f, e;
{
 short i1,j1; float f1,e1;
 printf("%p, %p, %p, %p\n", &i,&j,&f,&e);
 printf("%p, %p, %p, %p\n", &i1,&j1,&f1,&e1);
}
void func(short i, short j, float f, float e)
{
 short i1,j1; float f1,e1;
 printf("%p, %p, %p, %p\n", &i,&j,&f,&e);
 printf("%p, %p, %p, %p\n", &i1,&j1,&f1,&e1);
}
int main()
{
 short i,j; float f,e;
 func(i,j,f,e);
 funcOld(i,j,f,e);
}