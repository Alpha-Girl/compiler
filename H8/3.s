     .file   "ex7-9.c"
     .text
     .globl  main
     .type   main, @function
main:
.LFB0:
     pushq   %rbp
     movq    %rsp, %rbp
     jmp     .L2
.L5:                            ;while语句的内容
     movl    -4(%rbp), %eax     ;取j
     movl    %eax, -8(%rbp)     ;将i的值赋为j
.L2:
     cmpl    $0, -8(%rbp)       ;判断i是否为0
     jne     .L3                ;若i为0，则跳转到j>5的判断
     cmpl    $0, -4(%rbp)       ;继续判断j是否为0
     je      .L4                ;若j为0则不继续判断（转.L4）
.L3:
     cmpl    $5, -4(%rbp)       ;继续判断j>5
     jg      .L5                ;若大于5
.L4:
     movl    $0, %eax           ;返回值置为0？
     popq    %rbp
     ret
.LFE0:
     .size   main, .-main
     .ident  "GCC: (Ubuntu 7.5.0-3ubuntu1~16.04) 7.5.0"