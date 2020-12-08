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
root@webssh-3632807:/data/workspace/myshixun/irasm/step1# clang -emit-llvm -S data1.c -o data1.ll   
root@webssh-3632807:/data/workspace/myshixun/irasm/step1# cat data1.ll
; ModuleID = 'data1.c'
source_filename = "data1.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
  %1 = alloca float, align 4
  %2 = alloca double, align 8
  %3 = alloca i32, align 4
  store float 1.000000e+00, float* %1, align 4
  store double 2.000000e+00, double* %2, align 8
  store i32 0, i32* %3, align 4
  %4 = load float, float* %1, align 4
  %5 = fptosi float %4 to i32
  %6 = load double, double* %2, align 8
  %7 = fptosi double %6 to i32
  %8 = add nsw i32 %5, %7
  store i32 %8, i32* %3, align 4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}