        .text
        .file   "func.c"
        .globl  f1                      // -- Begin function f1
        .p2align        2
        .type   f1,@function
f1:                                     // @f1
// %bb.0:
        sub     sp, sp, #32             // =32
        stp     x29, x30, [sp, #16]     // 16-byte Folded Spill
        add     x29, sp, #16            // =16
        stur    w0, [x29, #-4]
        ldur    w8, [x29, #-4]
        scvtf   s0, w8
        bl      f2
        fcvt    s0, d0
        ldp     x29, x30, [sp, #16]     // 16-byte Folded Reload
        add     sp, sp, #32             // =32
        ret
.Lfunc_end0:
        .size   f1, .Lfunc_end0-f1
                                        // -- End function
        .globl  f2                      // -- Begin function f2
        .p2align        2
        .type   f2,@function
f2:                                     // @f2
// %bb.0:
        sub     sp, sp, #32             // =32
        stp     x29, x30, [sp, #16]     // 16-byte Folded Spill
        add     x29, sp, #16            // =16
        stur    s0, [x29, #-4]
        ldr     x8, [sp]
                                        // kill: def $w8 killed $w8 killed $x8
        mov     w0, w8
        bl      f1
        fcvt    d0, s0
        ldp     x29, x30, [sp, #16]     // 16-byte Folded Reload
        add     sp, sp, #32             // =32
        ret
.Lfunc_end1:
        .size   f2, .Lfunc_end1-f2
                                        // -- End function
        .ident  "clang version 10.0.1 "
        .section        ".note.GNU-stack","",@progbits
        .addrsig
        .addrsig_sym f1
        .addrsig_sym f2