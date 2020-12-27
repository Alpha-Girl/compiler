#include <iostream>
class A
{
public:
    int m_a;
    void pa() { std::cout << "aa"; };
};

class B : public A
{
public:
    int m_b;
    void pb() { std::cout << "bb"; };
};

class C : public A
{
public:
    int m_c;
    void pc() { std::cout << "cc"; };
};

class D : public B, public C
{
public:
    int m_d;
    void pd() { std::cout << "dd"; };
};
int main()
{
    A aa;
    B bb;
    C cc;
    D dd;
    dd.B::m_a = dd.C::m_a;
    dd.B::pb();
    dd.C::pc();
    //dd.A::pa();
    dd.pd();
}