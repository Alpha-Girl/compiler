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
root@webssh-3632807:/data/workspace/myshixun/irasm# cat control.ll
; ModuleID = 'control.c'
source_filename = "control.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %12

6:                                                ; preds = %0
  br label %7

7:                                                ; preds = %6
  %8 = load i32, i32* %2, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %11

11:                                               ; preds = %10, %7
  br label %12

12:                                               ; preds = %11, %0
  store i32 0, i32* %3, align 4
  br label %13

13:                                               ; preds = %21, %12
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 %14, 2
  br i1 %15, label %16, label %24

16:                                               ; preds = %13
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %21

20:                                               ; preds = %16
  br label %21

21:                                               ; preds = %20, %19
  %22 = load i32, i32* %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %3, align 4
  br label %13

24:                                               ; preds = %13
  %25 = load i32, i32* %1, align 4
  ret i32 %25
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}