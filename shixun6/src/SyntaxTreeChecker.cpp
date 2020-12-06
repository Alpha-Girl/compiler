#include "SyntaxTreeChecker.h"
#include "SyntaxTree.h"
#include <map>
#include <string>
#include <iostream>
#include <typeinfo>
using namespace SyntaxTree;
Type re_t;
std::map<Type, std::string> type2str1 = {
    {Type::INT, "int"},
    {Type::FLOAT, "float"},
    {Type::VOID, "void"}};
void SyntaxTreeChecker::visit(Assembly &node)
{
    enter_scope();
    functions.clear();
    for (auto def : node.global_defs)
    {
        def->accept(*this);
    }
    if (functions.count("main") == 0)
    {
        err.error(node.loc, "main() is not defined.");
        exit(1);
    }
    functions.clear();
    exit_scope();
}

void SyntaxTreeChecker::visit(FuncDef &node)
{

    if (functions.count(node.name))
    {
        err.error(node.loc, "redefinition of " + node.name);
        exit(1);
    }
    else
    {
        if (node.name == "main" && type2str1[node.ret_type] != "int")
        {
            err.error(node.loc, "return type of main() should be int" + node.name);
            exit(1);
        }
        functions.insert({node.name, node.ret_type});
    }
    ret_type_stack = node.ret_type;
    node.body->accept(*this);
}
void SyntaxTreeChecker::visit(BinaryExpr &node)
{

    node.lhs->accept(*this);
    node.rhs->accept(*this);

    auto RHS = evalue_stack.top();
    evalue_stack.pop();
    auto LHS = evalue_stack.top();
    evalue_stack.pop();
    if (LHS.e_type == Type::VOID || RHS.e_type == Type::VOID)
    {
        err.error(node.loc, node.name + "type error");
        exit(1);
    }
    if (node.op == BinOp::PLUS)
    {
        if (LHS.is_const && RHS.is_const)
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, true, LHS.i_val + RHS.i_val, (float)(LHS.i_val + RHS.i_val)));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, true, (int)(LHS.f_val + RHS.f_val), (LHS.f_val + RHS.f_val)));
            }
        }
        else
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, false, 0, 0));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, false, 0, 0));
            }
        }
    }
    else if (node.op == BinOp::MINUS)
    {
        if (LHS.is_const && RHS.is_const)
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, true, LHS.i_val - RHS.i_val, (float)(LHS.i_val - RHS.i_val)));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, true, (int)(LHS.f_val - RHS.f_val), (LHS.f_val - RHS.f_val)));
            }
        }
        else
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, false, 0, 0));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, false, 0, 0));
            }
        }
    }
    else if (node.op == BinOp::MULTIPLY)
    {
        if (LHS.is_const && RHS.is_const)
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, true, LHS.i_val * RHS.i_val, (float)(LHS.i_val * RHS.i_val)));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, true, (int)(LHS.f_val * RHS.f_val), (LHS.f_val * RHS.f_val)));
            }
        }
        else
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, false, 0, 0));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, false, 0, 0));
            }
        }
    }
    else if (node.op == BinOp::DIVIDE)
    {
        if (LHS.is_const && RHS.is_const)
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, true, LHS.i_val / RHS.i_val, (float)(LHS.i_val / RHS.i_val)));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, true, (int)(LHS.f_val / RHS.f_val), (LHS.f_val / RHS.f_val)));
            }
        }
        else
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, false, 0, 0));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, false, 0, 0));
            }
        }
    }
    else
    {
        if (LHS.is_const && RHS.is_const)
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, true, LHS.i_val % RHS.i_val, (float)(LHS.i_val % RHS.i_val)));
            else
            {
                err.error(node.loc, "% should use by int");
            }
        }
        else
        {
            if (LHS.e_type == Type::INT && RHS.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, false, 0, 0));
            else
            {
                err.error(node.loc, "% should use by int");
            }
        }
    }
}
void SyntaxTreeChecker::visit(UnaryExpr &node)
{
    node.rhs->accept(*this);
    auto val = evalue_stack.top();
    evalue_stack.pop();
    if (val.e_type == Type::VOID)
    {
        err.error(node.loc, node.name + "type error");
        exit(1);
    }
    if (node.op == UnaryOp::PLUS)
    {
        if (val.is_const)
        {
            if (val.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, true, val.i_val, (float)val.i_val));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, true, (int)val.f_val, val.f_val));
            }
        }
        else
        {
            if (val.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, false, 0, 0));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, false, 0, 0));
            }
        }
    }
    else
    {
        if (val.is_const)
        {
            if (val.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, true, -val.i_val, (float)-val.i_val));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, true, (int)val.f_val, val.f_val));
            }
        }
        else
        {
            if (val.e_type == Type::INT)
                evalue_stack.push(EValue(Type::INT, false, 0, 0));
            else
            {
                evalue_stack.push(EValue(Type::FLOAT, false, 0, 0));
            }
        }
    }
}
void SyntaxTreeChecker::visit(LVal &node)
{
    if (variables.front().count(node.name) == 0)
    {
        err.error(node.loc, node.name + "undefined");
        exit(1);
    }
    if (node.array_index.empty())
    {
        if (!variables.front()[node.name]->array_length.empty())
        {
            err.error(node.loc, node.name + "unlegaluse");
            exit(1);
        }
        Type t = variables.front()[node.name]->btype;
        evalue_stack.push(EValue(t, false, 0, 0));
        return;
    }
    int i = 0;
    if (variables.front()[node.name]->array_length.empty())
    {
        err.error(node.loc, node.name + "is not a array");
        exit(1);
    }
    if (variables.front()[node.name]->array_length.size() != node.array_index.size())
    {
        err.error(node.loc, node.name + "size incorrect");
        exit(1);
    }
    for (auto index : node.array_index)
    {
        index->accept(*this);
        auto val = evalue_stack.top();
        evalue_stack.pop();
        if (val.e_type != Type::INT)
        {
            err.error(node.loc, "type of index of array should be int");
            exit(1);
        }
        else if (val.is_const == true)
        {
            if (val.i_val < 0 || val.i_val >= variables.front()[node.name]->array_length.at(i))
            {
                err.error(node.loc, "array overflow");
                exit(1);
            }
        }
        i++;
    }
    Type s = variables.front()[node.name]->btype;
    evalue_stack.push(EValue(s, false, 0, 0));
}
void SyntaxTreeChecker::visit(Literal &node)
{

    if (node.is_int)
    {
        evalue_stack.push(EValue(Type::INT, true, node.int_const, (float)node.int_const));
    }
    else
    {
        evalue_stack.push(EValue(Type::FLOAT, true, (int)node.float_const, node.float_const));
    }
}
void SyntaxTreeChecker::visit(FuncCall &node)
{
    if (functions.count(node.name) == 0)
    {
        err.error(node.loc, node.name + "undefined11");
        exit(1);
    }
    Type func_type = functions[node.name];
    evalue_stack.push(EValue(func_type, false, 0, 0));
}
void SyntaxTreeChecker::visit(ReturnStmt &node)
{
    if (node.ret == NULL)
    {
        if (ret_type_stack == Type::VOID)
            return;
        err.error(node.loc, "return type should not be void");
        exit(1);
    }
    node.ret->accept(*this);
    auto tmp = evalue_stack.top();
    evalue_stack.pop();
    if (tmp.e_type != ret_type_stack)
    {
        err.error(node.loc, "return type incorrect ");
        exit(1);
    }
}

void SyntaxTreeChecker::visit(VarDef &node)
{
    if (declare_variable(node.name, node.is_constant, node.btype, std::vector<int>()))
        ;
    else
    {
        err.error(node.loc, "redefinition of " + node.name);
        exit(1);
    }
    if (node.is_inited)
    {
        int a = 1;
        if (node.array_length.empty() && node.initializers.size() != 1)
        {
            err.error(node.loc, "error1");
            exit(1);
        }
        else
        {
            for (int i = 0; i < node.array_length.size(); i++)
            {
                node.array_length.at(i)->accept(*this);
                auto tmp = evalue_stack.top();
                evalue_stack.pop();
                if (tmp.e_type != Type::INT || tmp.is_const == false)
                {
                    err.error(node.loc, "error3");
                    exit(1);
                }
                a = a * tmp.i_val;
            }
            if (node.initializers.size() > a)
            {
                err.error(node.loc, "error2");
                exit(1);
            }
        }
    }
}
void SyntaxTreeChecker::visit(AssignStmt &node)
{
    node.target->accept(*this);
    node.value->accept(*this);

    auto val = evalue_stack.top();
    evalue_stack.pop();
    auto tar = evalue_stack.top();
    evalue_stack.pop();

    if (tar.is_const)
    {
        err.error(node.loc, "type of left hand side of the assignstmt should not be const");
        exit(1);
    }
    if (tar.e_type == Type::VOID)
    {
        err.error(node.loc, "type of left hand side of the assignstmt should not be void");
        exit(1);
    }
    if (val.e_type == Type::VOID)
    {
        err.error(node.loc, "type of right hand side of the assignstmt should not be void");
        exit(1);
    }
    if (val.e_type != tar.e_type)
    {
        err.error(node.loc, "type of right hand side of the assignstmt should not be void");
        exit(1);
    }
}
void SyntaxTreeChecker::visit(FuncCallStmt &node)
{
    node.exp->accept(*this);
}
void SyntaxTreeChecker::visit(BlockStmt &node)
{
    std::unordered_map<std::string, PtrVariable> t;
    t=variables.front();
    variables.push_front(t);
    
    for (auto stmt : node.body)
    {
        stmt->accept(*this);
    }
    exit_scope();
}
void SyntaxTreeChecker::visit(EmptyStmt &node) {}
