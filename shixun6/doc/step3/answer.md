# answer.md

功能实现都写完了，但出现了下面的bug不知道怎么调试，导致对例子的测试有些问题。

bug:

例子见/test/ft_cases/test.c1

当其中内容为 int e10[4] = {1}; 时，正常完成词法分析。

当其中内容为 int e10[4] = {e1}; 时，在最后一步归约时，导致词法分析无法完成。

报错信息：

terminate called after throwing an instance of 'std::out_of_range'
  what():  deque::_M_range_check: __n (which is 4294967295)>= this->size() (which is 1)
Aborted (core dumped)

unsigned int 的最大值为 4294967295，但不知道具体什么原因导致__n溢出为了这个值。

## 类型检查

### 被调用的函数或变量不存在

利用'std::unordered_map<std::string, SyntaxTree::Type> functions;'实现，在定义新的函数时，在该结构体中插入。

使用函数时，利用count()方法的返回值，确定被调用函数是否已定义。

利用'std::deque<std::unordered_map<std::string, PtrVariable>> variables;'实现，在进入(或退出)语句块时，在队头插入(或删除)一个'unordered_map'，定义变量时在队头的'unordered_map'检查是否定义过，若没定义过写入。

使用变量时，按队头到队尾顺序查找是否定义过。

### 赋值语句中的左值所引用的量为常量

对表达式递归求值，根据返回的类型判断是否为常量。

表达式递归求值，用
    struct EValue
    {
        Type e_type;
        bool is_const;
        int i_val;
        float f_val;
        EValue(Type e_type, bool is_const, int i_val, float f_val) : e_type(e_type), is_const(is_const),
                                                                     i_val(i_val), f_val(f_val) {}
    };
    std::stack<EValue> evalue_stack;
表达式栈实现，递归求值push入栈，需要检查时pop取出。

### 左值表达式中进行索引时，被索引的值不是数组，或者索引不是整型，或者索引的维度超出数组声明的维度

根据符号表里的信息，以及当前访问节点求值，取得类型等信息进行判断。判断是否为数组，数组维度是否相同。

### 数组越界（运行时，数组索引是常量表达式的都需要进行检查。另外，多维数组的其中一个维度越界也需要检查,也包括初始化列表过长的情况）

对数组索引进行表达式递归求值，返回的值若为常数，与符号表中信息比较，判断是否越界。

求得当前数组总长度，与初始化列表长度进行比较，若超出，则报错。

### 返回值检查

对'ReturnStmt'中ret进行访问求值，根据返回结果，与函数待返回类型进行比较判断。返回类型控制实现如下：

    Type ret_type_stack = Type::VOID;

## 名称重复检查

在维护被调函数/变量不存在时已实现。

## 未使用变量检查

未实现。

## 其他检查

在检查结束后，检查函数表中是否有main()，以及其返回值类型。
