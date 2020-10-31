#include <iostream>
#include <typeinfo>
using namespace std;
//请构造两个样例程序，分别展示各种typeid以及类型转换。
//要求所编写的程序尽量简单但体现多种情况，并且加上必要的注释。
//在文件src/step1/test1.cpp和src/step1/test2.cpp里完成上述两个程序。

struct C
{
    int x, y;
} testc;

void func()
{
    ;
}
int func1()
{
    return 1;
}
int main()
{
    //fundamental types
    cout << "fundamental types" << endl;
    bool b = true;
    int i = 5;
    short int si = 5;
    unsigned int ui = 5;
    long int li = 5;
    unsigned long int uli = 5;
    long long int lli = 5;
    unsigned long long int ulli = 5;
    float j = 1.0;
    double d = 1.0;
    long double ld = 1.0;
    char c = 'a';

    // get the type info

    const type_info &tib = typeid(b);
    const type_info &tii = typeid(i);
    const type_info &tisi = typeid(si);
    const type_info &tiui = typeid(ui);
    const type_info &tili = typeid(li);
    const type_info &tiuli = typeid(uli);
    const type_info &tilli = typeid(lli);
    const type_info &tiulli = typeid(ulli);
    const type_info &tij = typeid(j);
    const type_info &tid = typeid(d);
    const type_info &tild = typeid(ld);
    const type_info &tic = typeid(c);

    // print the types

    cout << "tib is of type " << tib.name() << endl;
    cout << "tii is of type " << tii.name() << endl;
    cout << "tisi is of type " << tisi.name() << endl;
    cout << "tiui is of type " << tiui.name() << endl;
    cout << "tili is of type " << tili.name() << endl;
    cout << "tiuli is of type " << tiuli.name() << endl;
    cout << "tilli is of type " << tilli.name() << endl;
    cout << "tiulli is of type " << tiulli.name() << endl;
    cout << "tij is of type " << tij.name() << endl;
    cout << "tid is of type " << tid.name() << endl;
    cout << "tild is of type " << tild.name() << endl;
    cout << "tic is of type " << tic.name() << endl;

    //compound types
    cout << "compound types" << endl;
    int *px = &testc.x;
    void (*f)();
    f = func;
    int ar[10];
    enum Color
    {
        red,
        green,
        blue
    };
    Color r = red;
    struct s
    {
        int a;
    } tests;
    // get the type info

    const type_info &tip = typeid(px);
    const type_info &tif = typeid(f);
    const type_info &tia = typeid(ar);
    const type_info &tie = typeid(r);
    const type_info &tis = typeid(tests);
    const type_info &tifunc = typeid(func1);

    cout << "tif is of type " << tif.name() << endl;
    cout << "tip is of type " << tip.name() << endl;
    cout << "tif is of type " << tif.name() << endl;
    cout << "tia is of type " << tia.name() << endl;
    cout << "tie is of type " << tie.name() << endl;
    cout << "tis is of type " << tis.name() << endl;
    cout << "tifunc is of type " << tifunc.name() << endl;
    return 0;
}
/*output:
fundamental types
tib is of type b
tii is of type i
tisi is of type s
tiui is of type j
tili is of type l
tiuli is of type m
tilli is of type x
tiulli is of type y
tij is of type f
tid is of type d
tild is of type e
tic is of type c
compound types
tif is of type PFvvE
tip is of type Pi
tif is of type PFvvE
tia is of type A10_i
tie is of type Z4mainE5Color
tis is of type Z4mainE1s
tifunc is of type FivE
*/
