        .arch armv8-a
        .file   "data1.c"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        sub     sp, sp, #16
        fmov    s0, 1.0e+0
        str     s0, [sp]
        fmov    d0, 2.0e+0
        str     d0, [sp, 8]
        str     wzr, [sp, 4]
        ldr     s0, [sp]
        fcvtzs  w1, s0
        ldr     d0, [sp, 8]
        fcvtzs  w0, d0
        add     w0, w1, w0
        str     w0, [sp, 4]
        mov     w0, 0
        add     sp, sp, 16
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits