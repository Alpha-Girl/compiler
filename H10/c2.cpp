#include <iostream>
template <typename dst_type, typename src_type>
dst_type pointer_cast(src_type src)
{
    return *static_cast<dst_type *>(static_cast<void *>(&src));
}
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
    void *f;
    std::cout << "B::m_a: " << &dd.B::m_a << "\n";
    std::cout << "C::m_a: " << &dd.C::m_a << "\n";
    std::cout << "m_b: " << &dd.m_b << "\n";
    std::cout << "m_c: " << &dd.m_c << "\n";
    std::cout << "m_d: " << &dd.m_d << "\n";
    std::cout << "B::pa(): " << pointer_cast<void *>(&D::B::pa) << "\n";
    std::cout << "C::pa(): " << pointer_cast<void *>(&D::C::pa) << "\n";
    std::cout << "pb(): " << pointer_cast<void *>(&D::B::pb) << "\n";
    std::cout << "pc(): " << pointer_cast<void *>(&D::C::pc) << "\n";
    std::cout << "pd(): " << pointer_cast<void *>(&D::pd) << "\n";
}