#include <iostream>
class A
{
public:
    A(int a) : m_a(a) {}
    int getMa() { return m_a; }

private:
    int m_a;
};

class B : public A
{
public:
    B(int a, int b) : A(a), m_b(b) {}

private:
    int m_b;
};

class C : public A
{
public:
    C(int a, int c) : A(a), m_c(c) {}

private:
    int m_c;
};

class D : public B, public C
{
public:
    D(int a, int b, int c, int d) : B(a, b), C(a, c), m_d(d) {}
    void func()
    {
        std::cout << B::getMa();
    }

private:
    int m_d;
};

int main()
{
    D dd = D(1, 2, 3, 4);
    dd.func();
    std::cout << "B::m_a: " << &D::B::A::getMa << "\n";
    std::cout << "C::m_a: " << &dd.C::m_a << "\n";
    std::cout << "m_b: " << &dd.m_b << "\n";
    std::cout << "m_c: " << &dd.m_c << "\n";
    std::cout << "m_d: " << &dd.m_d << "\n";
}