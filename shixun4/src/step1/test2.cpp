//***REAME***
//参考cppreference样例
#include <iostream>
#include <typeinfo>
#include <vector>
struct B1 {
    int m = 0;
    void hello() const {
        std::cout << "Hello world, this is B!\n";
    }
};
struct D1 : B1 {
    void hello() const {
        std::cout << "Hello world, this is D!\n";
    }
};
 
enum class E { ONE = 1, TWO, THREE };
enum EU { ONE = 1, TWO, THREE };

struct V {
    virtual void f() {}  // 必须为多态以使用运行时检查的 dynamic_cast
};
struct A : virtual V {};
struct B : virtual V {
  B(V* v, A* a) {
    // 构造中转型（见后述 D 的构造函数中的调用）
    dynamic_cast<B*>(v); // 良好定义：v 有类型 V*，B 的 V 基类，产生 B*
    dynamic_cast<B*>(a); // 未定义行为：a 有类型 A*，A 非 B 的基类
  }
};
struct D : A, B {
    D() : B((A*)this, this) { }
};
 
struct Base {
    virtual ~Base() {}
};
 
struct Derived: Base {
    virtual void name() {}
};
int main()
{
    //static_cast
    // 1: 初始化转换
    int n = static_cast<int>(3.14); 
    std::cout << "n = " << n << '\n';
    std::vector<int> v = static_cast<std::vector<int>>(10);
    std::cout << "v.size() = " << v.size() << '\n';
 
    // 2: 静态向下转型
    D1 d1;
    B1& br = d1; // 通过隐式转换向上转型
    br.hello();
    D1& another_d1 = static_cast<D1&>(br); // 向下转型
    another_d1.hello();
 
    // 3: 左值到右值
    std::vector<int> v2 = static_cast<std::vector<int>&&>(v);
    std::cout << "after move, v.size() = " << v.size() << '\n';
 
    // 4: 弃值表达式
    static_cast<void>(v2.size());
 
    // 5. 隐式转换的逆
    void* nv = &n;
    int* ni = static_cast<int*>(nv);
    std::cout << "*ni = " << *ni << '\n';
 
    // 6. 数组到指针后随向上转型
    D1 a1[10];
    B1* dp = static_cast<B1*>(a1);
 
    // 7. 有作用域枚举到 int 或 float
    E e = E::ONE;
    int one = static_cast<int>(e);
    std::cout << one << '\n';
 
    // 8. int 到枚举，枚举到另一枚举
    E e2 = static_cast<E>(one);
    EU eu = static_cast<EU>(e2);
 
    // 9. 指向成员指针向上转型
    int D1::*pm = &D1::m;
    std::cout << br.*static_cast<int B1::*>(pm) << '\n';
 
    // 10. void* 到任何类型
    void* voidp = &e;
    std::vector<int>* p = static_cast<std::vector<int>*>(voidp);
    
    //dynamic_cast
 

 
    D d; // 最终派生对象
    A& a = d; // 向上转型，可以用 dynamic_cast，但不必须
    D& new_d = dynamic_cast<D&>(a); // 向下转型
    B& new_b = dynamic_cast<B&>(a); // 侧向转型
 
 
    Base* b1 = new Base;
    if(Derived* d = dynamic_cast<Derived*>(b1))
    {
        std::cout << "downcast from b1 to d successful\n";
        d->name(); // 可以安全调用
    }
 
    Base* b2 = new Derived;
    if(Derived* d = dynamic_cast<Derived*>(b2))
    {
        std::cout << "downcast from b2 to d successful\n";
        d->name(); // 可以安全调用
    }
 
    delete b1;
    delete b2;
}

