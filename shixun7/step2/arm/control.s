        .arch armv8-a
        .file   "control.c"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        sub     sp, sp, #16
        ldr     w0, [sp, 12]
        cmp     w0, 0
        beq     .L2
        ldr     w0, [sp, 12]
        cmp     w0, 0
.L2:
        str     wzr, [sp, 8]
        b       .L3
.L5:
        ldr     w0, [sp, 8]
        cmp     w0, 0
        ldr     w0, [sp, 8]
        add     w0, w0, 1
        str     w0, [sp, 8]
.L3:
        ldr     w0, [sp, 8]
        cmp     w0, 1
        ble     .L5
        mov     w0, 0
        add     sp, sp, 16
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits