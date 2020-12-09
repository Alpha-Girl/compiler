        .text
        .file   "data1.c"
        .globl  main                    // -- Begin function main
        .p2align        2
        .type   main,@function
main:                                   // @main
// %bb.0:
        sub     sp, sp, #32             // =32
        fmov    s0, #1.00000000
        fmov    d1, #2.00000000
        mov     w8, wzr
        str     s0, [sp, #28]
        str     d1, [sp, #16]
        str     wzr, [sp, #12]
        ldr     s0, [sp, #28]
        fcvtzs  w9, s0
        ldr     d1, [sp, #16]
        fcvtzs  w10, d1
        add     w9, w9, w10
        str     w9, [sp, #12]
        mov     w0, w8
        add     sp, sp, #32             // =32
        ret
.Lfunc_end0:
        .size   main, .Lfunc_end0-main
                                        // -- End function
        .ident  "clang version 10.0.1 "
        .section        ".note.GNU-stack","",@progbits
        .addrsig