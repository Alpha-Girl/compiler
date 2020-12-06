#include "SyntaxTreeChecker.h"
#include "SyntaxTree.h"
#include <map>
#include <string>
#include <iostream>
using namespace SyntaxTree;

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

    node.body->accept(*this);
}
void SyntaxTreeChecker::visit(BinaryExpr &node) {}
void SyntaxTreeChecker::visit(UnaryExpr &node) {}
void SyntaxTreeChecker::visit(LVal &node) {}
void SyntaxTreeChecker::visit(Literal &node) {}
void SyntaxTreeChecker::visit(FuncCall &node) {}
void SyntaxTreeChecker::visit(ReturnStmt &node)
{
    if (node.ret == nullptr)
    {
        err.error(node.loc, "return type should not be void");
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
}
void SyntaxTreeChecker::visit(AssignStmt &node) {
    /*if(variables.front().count(node.target->name)==0){
        err.error(node.loc,node.name + "undefined");
        exit(1);
    }
    if(node.target->array_index!=nullptr&&variables.front().count(node.target->array_index->name)==0)
        {
        err.error(node.loc,node.target->array_index->name + "undefined");
        exit(1);
    }
    if(node.target->array_index!=nullptr&&
    type2str1[variables.front().find(node.target->array_index->name)->second->btype] !="int" )
        {
        err.error(node.loc,node.target->array_index->name + "is not int");
        exit(1);
    }*/
    
        
}
void SyntaxTreeChecker::visit(FuncCallStmt &node) {
    if(functions.count(node.name)==0)
        {
            err.error(node.loc,node.name + "undefined");
            exit(1);
        }
}
void SyntaxTreeChecker::visit(BlockStmt &node)
{
    for (auto stmt : node.body)
    {
        stmt->accept(*this);
    }
}
void SyntaxTreeChecker::visit(EmptyStmt &node) {}
