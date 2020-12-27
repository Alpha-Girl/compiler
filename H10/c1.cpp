/**
	虚继承（虚基类）
*/

#include <iostream>

// 基类A
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
    virtual void test(int j){};
};

class B : virtual public A
{
public:
    int dataB;
    void func(){};
    void test(int j){};
};

class C : virtual public A
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