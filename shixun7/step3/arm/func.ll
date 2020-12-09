; ModuleID = 'func.c'
source_filename = "func.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local float @f1(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = sitofp i32 %3 to float
  %5 = call double @f2(float %4)
  %6 = fptrunc double %5 to float
  ret float %6
}

; Function Attrs: noinline nounwind optnone
define dso_local double @f2(float %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca i64, align 8
  store float %0, float* %2, align 4
  %4 = load i64, i64* %3, align 8
  %5 = trunc i64 %4 to i32
  %6 = call float @f1(i32 %5)
  %7 = fpext float %6 to double
  ret double %7
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="non-leaf" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}