#include <stdio.h>
#include <math.h>
int test_g;
int main(){
    int i_a;
    float f_b;
    double d_c;
    long l_d;
    char c_e;
    c_e='0';
    i_a=c_e;
    printf("%d %d %c\n",i_a,c_e,c_e);
    f_b=6;
    d_c=pow(i_a,f_b);
    printf("%lf %f %d",d_c,f_b,i_a);
    l_d=i_a;
    return 0;
}