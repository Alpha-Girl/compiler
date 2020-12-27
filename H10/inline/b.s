 pushl    %ebp
 movl    %esp, %ebp
 andl    $-16, %esp
 subl    $32, %esp
 movl    $1, 28(%esp)
 movl    28(%esp), %eax
 movl    %eax, (%esp)
 call    f
 movl    $.LC0, %eax
 movl    28(%esp), %edx
 movl    %edx, 4(%esp)
 movl    %eax, (%esp)
 call        printf
 movl    28(%esp), %eax
 movl    %eax, (%esp)
 call    f1
 leave
 ret