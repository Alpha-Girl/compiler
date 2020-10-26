#include<iostream>
#include<memory>	//auto_ptr的头文件
#include<cassert>
using namespace std;
class Test
{
public:
    Test(string s)
    {
        str = s;
       cout<<"Test creat\n";
    }
    ~Test()
    {
        cout<<"Test delete:"<<str<<endl;
    }
    string& getStr()
    {
        return str;
    }
    void setStr(string s)
    {
        str = s;
    }
    void print()
    {
        cout<<str<<endl;
    }
private:
    string str;
};
  
void func(auto_ptr<Test> ptest){
    return;
}
  
int main()
{
    auto_ptr<Test> ptest(new Test("123"));	//调用构造函数输出Test creat
    func(ptest);                            //std::auto_ptr按值传递给函数将导致您的资源转移至函数参数
                                            //（并在函数末尾(超出函数参数的作用域)被销毁）
    ptest->print();                         //引用空指针（出错）
    return 0;								
}