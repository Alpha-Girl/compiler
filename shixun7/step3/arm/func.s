        .arch armv8-a
        .file   "func.c"
        .text
        .align  2
        .global f1
        .type   f1, %function
f1:
        stp     x29, x30, [sp, -32]!
        add     x29, sp, 0
        str     w0, [x29, 28]
        ldr     w0, [x29, 28]
        scvtf   s0, w0
        bl      f2
        fcvt    s0, d0
        ldp     x29, x30, [sp], 32
        ret
        .size   f1, .-f1
        .align  2
        .global f2
        .type   f2, %function
f2:
        stp     x29, x30, [sp, -48]!
        add     x29, sp, 0
        str     s0, [x29, 28]
        ldr     x0, [x29, 40]
        bl      f1
        fcvt    d0, s0
        ldp     x29, x30, [sp], 48
        ret
        .size   f2, .-f2
        .ident  "GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
        .section        .note.GNU-stack,"",@progbits