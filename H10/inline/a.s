pushl    %ebp
 movl    %esp, %ebp
 andl    $-16, %esp
 subl    $16, %esp
 movl    $1, 8(%esp)
 movl    $.LC0, 4(%esp)
 movl    $1, (%esp)
 call    __printf_chk
 movl    $1, (%esp)
 call    f1
 leave
 ret