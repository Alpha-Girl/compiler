; ModuleID = 'fib.c'
source_filename = "fib.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define i32 @fib(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %1
  store i32 0, i32* %3, align 4
  br label %20

; <label>:7:                                      ; preds = %1
  %8 = load i32, i32* %2, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %7
  store i32 1, i32* %3, align 4
  br label %19

; <label>:11:                                     ; preds = %7
  %12 = load i32, i32* %2, align 4
  %13 = sub nsw i32 %12, 1
  %14 = call i32 @fib(i32 %13)
  %15 = load i32, i32* %2, align 4
  %16 = sub nsw i32 %15, 2
  %17 = call i32 @fib(i32 %16)
  %18 = add nsw i32 %14, %17
  store i32 %18, i32* %3, align 4
  br label %19

; <label>:19:                                     ; preds = %11, %10
  br label %20

; <label>:20:                                     ; preds = %19, %6
  %21 = load i32, i32* %3, align 4
  ret i32 %21
}

; Function Attrs: nounwind readnone uwtable
define i32 @main() local_unnamed_addr #0 {
    %1 = alloca i32, align 4
    store i32 0, i32* %1, align 4
    %2 = alloca float, align 4
    store float 8.000000e+0, float* %2, align 4
    %3 = alloca i32, align 4
    store i32 1, i32* %3, align 4
    br label %4
; <label>:4:                                        ; preds = %0,%14
    %5 = load i32, i32* %3, align 4
    %6 = load float, float* %2, align 4
    %7 = fptosi float %6 to i32
    %8 = icmp slt i32 %5, %7
    br i1 %8, label %9, label %17

; <label>:9:                                        ; preds = %4
    %10 = load i32, i32* %3, align 4
    %11 = call i32 @fib(i32 %10)
    %12 = load i32, i32* %1, align 4
    %13 = add nsw i32 %12, %11
    store i32 %13, i32* %1, align 4
    br label %14

; <label>:14:                                        ; preds = %9
    %15 = load i32, i32* %3, align 4
    %16 = add nsw i32 %15, 1
    store i32 %16, i32* %3, align 4
    br label %4

; <label>:17:                                        ; preds = %4
    %18 = load i32, i32* %1, align 4
    ret i32 %18
}