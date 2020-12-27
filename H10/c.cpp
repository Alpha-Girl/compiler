/**
	普通继承（没有使用虚基类）
*/

// 基类A
#include <iostream>
class A
{
public:
    int dataA;
    void aa(int a)
    {
        int i;
        for (i = 0; i < a; i++)
        {
            std::cout << "\n";
        }
    };
    void test(int j){};
};

class B : public A
{
public:
    int dataB;
    void func(){};
    void test(int j){};
};

class C : public A
{
public:
    int dataC;
};

class D : public B, public C
{
public:
    int dataD;
};
int main()
{
    D dd;
    int a;
    dd.B::dataA = dd.C::dataA;
    dd.B::aa(a);
    dd.func();
}