#include<iostream>
#include<memory>	//auto_ptr的头文件
#include<cassert>
using namespace std;
class Test
{
public:
    Test(int* a)
    {
        int *pointer;
        pointer = a;
       cout<<"Test creat\n";
    }
};
  
void func(auto_ptr<Test> ptest){
    return;
}
  
int main()
{
    int *p=new int[20];
    auto_ptr<Test> ptest(new Test(p));	//调用构造函数输出Test creat
    int *q=new int[20];
    ptest.reset(new Test(q));           ////成员函数reset()重新绑定指向的对象，而原来的对象则会被释放
                                        //使用非数组删除 delete p；而非delete [] p;
                                        //导致内存泄漏
    return 0;							
}