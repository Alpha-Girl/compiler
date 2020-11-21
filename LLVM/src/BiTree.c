#include <stdio.h>
#include <stdlib.h>
#define TRUE 1
#define FALSE 0
#define OK 1
#define ERROR 0
#define INFEASIBLE -1
#define OVERFLOW -2
#define Link 0
#define Thread 1
typedef struct BiNode{
 char data;
 struct BiNode *lchild,*rchild;
 }BiNode,*BiTree;

typedef struct BiThrNode{
    char data;
    struct BiThrNode *lchild,*rchild;
    int LTag,RTag;
}BiThrNode,*BiThrTree;

typedef int Status;

Status CreateBiTree(BiTree T){
     char  D;
     int i;
     BiTree p;
     scanf("%c",&D);
     if(D==' ') {T=NULL;return 0;}
     else{
            T->data=D;
            T->lchild=(BiNode*)malloc(sizeof(BiNode));i=CreateBiTree(T->lchild);if(i==0) T->lchild=NULL;
            T->rchild=(BiNode*)malloc(sizeof(BiNode));i=CreateBiTree(T->rchild);if(i==0) T->rchild=NULL;
     }
     return 1;
 }//CreateBiTree

void PreOrderTraverse(BiTree T,Status (*Visit)(char e)){
     if(T){Visit(T->data);
        if(T->lchild){PreOrderTraverse(T->lchild,Visit);}
        if(T->rchild){PreOrderTraverse(T->rchild,Visit);}
     }
 }//PreOrderTraverse

 void InOrderTraverse(BiTree T,Status (*Visit)(char e)){
        if(T->lchild)InOrderTraverse(T->lchild,Visit);
        Visit(T->data);
        if(T->rchild)InOrderTraverse(T->rchild,Visit);
     }
     //PreOrderTraverse

Status PostOrderTraverse(BiTree T,Status (*Visit)(char e)){
     if(T){
        if(PostOrderTraverse(T->lchild,Visit))
            if(PostOrderTraverse(T->rchild,Visit))
                if(Visit(T->data)) return OK;
        else return ERROR;
     }
     else return OK;
 }//PreOrderTraverse

BiThrNode *pre;
void GET(char e){
    printf("%c",e);
}

Status CreateBiThrTree(BiThrTree T,BiTree t){
     int i;
     if(!t) return 0;
     else{  T->data=t->data;
            T->lchild=(BiThrNode*)malloc(sizeof(BiThrNode));i=CreateBiThrTree(T->lchild,t->lchild);
            if(i==0) {T->lchild=NULL;T->LTag=Thread;}
            else T->LTag=Link;
            T->rchild=(BiThrNode*)malloc(sizeof(BiThrNode));i=CreateBiThrTree(T->rchild,t->rchild);
            if(i==0) {T->rchild=NULL;T->RTag=Thread;}
            else T->RTag=Link;
     }
     return 1;
 }//CreateBiThrTree

void PostOrderThrTraverse(BiThrTree T,Status (*Visit)(char e)){
            if(T->LTag==Link) PostOrderThrTraverse(T->lchild,Visit);
            if(T->RTag==Link) PostOrderThrTraverse(T->rchild,Visit);
            Visit(T->data);
 }//PreOrderTraverse

 void PostOrderThrTraverse1(BiThrTree T){

            if(T->lchild!=NULL) PostOrderThrTraverse1(T->lchild);
            if(T->rchild!=NULL) PostOrderThrTraverse1(T->rchild);
            if(pre->RTag==Thread) pre->rchild=T;
            if(T->LTag==Thread) T->lchild=pre;
            pre=T;
 }//PostOrderThrTraverse1
int In(char c){
    if(c=='+'||c=='-'||c=='*'||c=='/'||c=='('||c==')'||c=='#')
        return 1;
    else return 0;
}
void PolishTree(BiTree T){
    char  D;
     int i;
     BiTree p;
     scanf("%c",&D);
     if(In(D)){
            T->data=D;
            T->lchild=(BiNode*)malloc(sizeof(BiNode));PolishTree(T->lchild);
            T->rchild=(BiNode*)malloc(sizeof(BiNode));PolishTree(T->rchild);
     }
     else {T->data=D;T->lchild=NULL;T->rchild=NULL;}
}

int main(){
    int Order;
    BiTree T;
    BiThrTree Thrt,p;
    for(;;){
        printf("README\n");
        scanf("%d",&Order);
        if(Order==0) break;
        else if(Order==1) {getchar();T=(BiTree)malloc(sizeof(BiTree));CreateBiTree(T);getchar();}
        else if(Order==2) {PreOrderTraverse(T,GET);printf("\n");}
        else if(Order==3) {InOrderTraverse(T,GET);printf("\n");}
        else if(Order==4) {PostOrderTraverse(T,GET);printf("\n");}
        else if(Order==5) {Thrt=(BiThrNode*)malloc(sizeof(BiThrNode));
                           Thrt->lchild=p;Thrt->LTag=Link;Thrt->rchild=Thrt;
                           p=(BiThrNode*)malloc(sizeof(BiThrNode));
                           getchar();
                           CreateBiThrTree(p,T);
                           pre=Thrt;
                           PostOrderThrTraverse1(p);
                           if(pre->RTag==Thread) pre->rchild=Thrt;
                           Thrt->rchild=pre;
                           }
        else if(Order==6) {PostOrderThrTraverse(p,GET);printf("\n");}
        else if(Order==7) {getchar();T=(BiTree)malloc(sizeof(BiTree));PolishTree(T);}
}
}
