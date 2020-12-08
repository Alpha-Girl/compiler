        .text
        .file   "control.c"
        .globl  main                    // -- Begin function main
        .p2align        2
        .type   main,@function
main:                                   // @main
// %bb.0:
        sub     sp, sp, #16             // =16
        str     wzr, [sp, #12]
        ldr     w8, [sp, #8]
        cbz     w8, .LBB0_5
// %bb.1:
// %bb.2:
        ldr     w8, [sp, #8]
        cbz     w8, .LBB0_4
// %bb.3:
.LBB0_4:
.LBB0_5:
        str     wzr, [sp, #4]
.LBB0_6:                                // =>This Inner Loop Header: Depth=1
        ldr     w8, [sp, #4]
        cmp     w8, #2                  // =2
        b.ge    .LBB0_11
// %bb.7:                               //   in Loop: Header=BB0_6 Depth=1
        ldr     w8, [sp, #4]
        cbz     w8, .LBB0_9
// %bb.8:                               //   in Loop: Header=BB0_6 Depth=1
        b       .LBB0_10
.LBB0_9:                                //   in Loop: Header=BB0_6 Depth=1
.LBB0_10:                               //   in Loop: Header=BB0_6 Depth=1
        ldr     w8, [sp, #4]
        add     w8, w8, #1              // =1
        str     w8, [sp, #4]
        b       .LBB0_6
.LBB0_11:
        ldr     w0, [sp, #12]
        add     sp, sp, #16             // =16
        ret
.Lfunc_end0:
        .size   main, .Lfunc_end0-main
                                        // -- End function
        .ident  "clang version 10.0.1 "
        .section        ".note.GNU-stack","",@progbits
        .addrsig