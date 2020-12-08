; ModuleID = 'control.c'
source_filename = "control.c"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %12

; <label>:6:                                      ; preds = %0
  br label %7

; <label>:7:                                      ; preds = %6
  %8 = load i32, i32* %2, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %7
  br label %11

; <label>:11:                                     ; preds = %10, %7
  br label %12

; <label>:12:                                     ; preds = %11, %0
  store i32 0, i32* %3, align 4
  br label %13

; <label>:13:                                     ; preds = %21, %12
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 %14, 2
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %13
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %16
  br label %21

; <label>:20:                                     ; preds = %16
  br label %21

; <label>:21:                                     ; preds = %20, %19
  %22 = load i32, i32* %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %3, align 4
  br label %13

; <label>:24:                                     ; preds = %13
  %25 = load i32, i32* %1, align 4
  ret i32 %25
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
