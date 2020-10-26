#include <iostream>
#include <memory>
#include <string>

using namespace std;
void Test1()
{
    string *str = new string("123");
    //先将指针包装为shared_ptr，才能产生weak_ptr
    shared_ptr<string> sptr(str);
    weak_ptr<string> wptr(sptr);
    cout << wptr.lock()->c_str() << endl;
    return;
}

void Test2()
{
    shared_ptr<string> sptr(new string("456"));
    weak_ptr<string> wptr(sptr);
    shared_ptr<string> sptr2 = sptr;      //共享
    sptr.reset();                         //sptr置为NULL
    cout << wptr.lock()->c_str() << endl; //还有sptr2指向string
    sptr2.reset();                        //sptr2置为NULL
    cout << wptr.lock()->c_str() << endl; //string"456"被释放
}

int main()
{
    Test1(); //第一问
    Test2(); //第二问
    return 0;
}