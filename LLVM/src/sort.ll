; ModuleID = 'sort.c'
source_filename = "sort.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1

; Function Attrs: norecurse nounwind uwtable
define i32 @sort(i32, i32* nocapture) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %4, label %86

; <label>:4:                                      ; preds = %2
  %5 = sext i32 %0 to i64
  %6 = zext i32 %0 to i64
  %7 = add nuw nsw i64 %6, 3
  %8 = add nsw i64 %6, -2
  %9 = zext i32 %0 to i64
  br label %10

; <label>:10:                                     ; preds = %79, %4
  %11 = phi i64 [ 0, %4 ], [ %16, %79 ]
  %12 = phi i64 [ 1, %4 ], [ %84, %79 ]
  %13 = sub i64 %8, %11
  %14 = getelementptr inbounds i32, i32* %1, i64 %11
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %16 = add nuw nsw i64 %11, 1
  %17 = icmp slt i64 %16, %5
  %18 = trunc i64 %11 to i32
  br i1 %17, label %19, label %79

; <label>:19:                                     ; preds = %10
  %20 = sub nsw i64 %7, %11
  %21 = and i64 %20, 3
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %38, label %23

; <label>:23:                                     ; preds = %19
  br label %24

; <label>:24:                                     ; preds = %24, %23
  %25 = phi i64 [ %35, %24 ], [ %12, %23 ]
  %26 = phi i32 [ %34, %24 ], [ %18, %23 ]
  %27 = phi i32 [ %32, %24 ], [ %15, %23 ]
  %28 = phi i64 [ %36, %24 ], [ %21, %23 ]
  %29 = getelementptr inbounds i32, i32* %1, i64 %25
  %30 = load i32, i32* %29, align 4, !tbaa !2
  %31 = icmp slt i32 %30, %27
  %32 = select i1 %31, i32 %30, i32 %27
  %33 = trunc i64 %25 to i32
  %34 = select i1 %31, i32 %33, i32 %26
  %35 = add nuw nsw i64 %25, 1
  %36 = add i64 %28, -1
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %38, label %24, !llvm.loop !6

; <label>:38:                                     ; preds = %24, %19
  %39 = phi i32 [ undef, %19 ], [ %32, %24 ]
  %40 = phi i32 [ undef, %19 ], [ %34, %24 ]
  %41 = phi i64 [ %12, %19 ], [ %35, %24 ]
  %42 = phi i32 [ %18, %19 ], [ %34, %24 ]
  %43 = phi i32 [ %15, %19 ], [ %32, %24 ]
  %44 = icmp ult i64 %13, 3
  br i1 %44, label %79, label %45

; <label>:45:                                     ; preds = %38
  br label %46

; <label>:46:                                     ; preds = %46, %45
  %47 = phi i64 [ %41, %45 ], [ %77, %46 ]
  %48 = phi i32 [ %42, %45 ], [ %76, %46 ]
  %49 = phi i32 [ %43, %45 ], [ %74, %46 ]
  %50 = getelementptr inbounds i32, i32* %1, i64 %47
  %51 = load i32, i32* %50, align 4, !tbaa !2
  %52 = icmp slt i32 %51, %49
  %53 = select i1 %52, i32 %51, i32 %49
  %54 = trunc i64 %47 to i32
  %55 = select i1 %52, i32 %54, i32 %48
  %56 = add nuw nsw i64 %47, 1
  %57 = getelementptr inbounds i32, i32* %1, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !2
  %59 = icmp slt i32 %58, %53
  %60 = select i1 %59, i32 %58, i32 %53
  %61 = trunc i64 %56 to i32
  %62 = select i1 %59, i32 %61, i32 %55
  %63 = add nsw i64 %47, 2
  %64 = getelementptr inbounds i32, i32* %1, i64 %63
  %65 = load i32, i32* %64, align 4, !tbaa !2
  %66 = icmp slt i32 %65, %60
  %67 = select i1 %66, i32 %65, i32 %60
  %68 = trunc i64 %63 to i32
  %69 = select i1 %66, i32 %68, i32 %62
  %70 = add nsw i64 %47, 3
  %71 = getelementptr inbounds i32, i32* %1, i64 %70
  %72 = load i32, i32* %71, align 4, !tbaa !2
  %73 = icmp slt i32 %72, %67
  %74 = select i1 %73, i32 %72, i32 %67
  %75 = trunc i64 %70 to i32
  %76 = select i1 %73, i32 %75, i32 %69
  %77 = add nsw i64 %47, 4
  %78 = icmp eq i64 %77, %6
  br i1 %78, label %79, label %46

; <label>:79:                                     ; preds = %38, %46, %10
  %80 = phi i32 [ %15, %10 ], [ %39, %38 ], [ %74, %46 ]
  %81 = phi i32 [ %18, %10 ], [ %40, %38 ], [ %76, %46 ]
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32* %1, i64 %82
  store i32 %15, i32* %83, align 4, !tbaa !2
  store i32 %80, i32* %14, align 4, !tbaa !2
  %84 = add nuw nsw i64 %12, 1
  %85 = icmp eq i64 %16, %9
  br i1 %85, label %86, label %10

; <label>:86:                                     ; preds = %79, %2
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #2 {
  %1 = alloca [1025 x i32], align 16
  %2 = alloca i32, align 4
  %3 = bitcast [1025 x i32]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4100, i8* nonnull %3) #4
  %4 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #4
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %2)
  %6 = load i32, i32* %2, align 4, !tbaa !2
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %95

; <label>:8:                                      ; preds = %0
  br label %99

; <label>:9:                                      ; preds = %99
  %10 = icmp sgt i32 %104, 0
  br i1 %10, label %11, label %95

; <label>:11:                                     ; preds = %9
  %12 = sext i32 %104 to i64
  %13 = zext i32 %104 to i64
  %14 = add nuw nsw i64 %13, 3
  %15 = add nsw i64 %13, -2
  br label %16

; <label>:16:                                     ; preds = %85, %11
  %17 = phi i64 [ 0, %11 ], [ %22, %85 ]
  %18 = phi i64 [ 1, %11 ], [ %90, %85 ]
  %19 = sub i64 %15, %17
  %20 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %17
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %22 = add nuw nsw i64 %17, 1
  %23 = icmp slt i64 %22, %12
  %24 = trunc i64 %17 to i32
  br i1 %23, label %25, label %85

; <label>:25:                                     ; preds = %16
  %26 = sub nsw i64 %14, %17
  %27 = and i64 %26, 3
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %44, label %29

; <label>:29:                                     ; preds = %25
  br label %30

; <label>:30:                                     ; preds = %30, %29
  %31 = phi i64 [ %41, %30 ], [ %18, %29 ]
  %32 = phi i32 [ %40, %30 ], [ %24, %29 ]
  %33 = phi i32 [ %38, %30 ], [ %21, %29 ]
  %34 = phi i64 [ %42, %30 ], [ %27, %29 ]
  %35 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %31
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = icmp slt i32 %36, %33
  %38 = select i1 %37, i32 %36, i32 %33
  %39 = trunc i64 %31 to i32
  %40 = select i1 %37, i32 %39, i32 %32
  %41 = add nuw nsw i64 %31, 1
  %42 = add i64 %34, -1
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %44, label %30, !llvm.loop !8

; <label>:44:                                     ; preds = %30, %25
  %45 = phi i32 [ undef, %25 ], [ %38, %30 ]
  %46 = phi i32 [ undef, %25 ], [ %40, %30 ]
  %47 = phi i64 [ %18, %25 ], [ %41, %30 ]
  %48 = phi i32 [ %24, %25 ], [ %40, %30 ]
  %49 = phi i32 [ %21, %25 ], [ %38, %30 ]
  %50 = icmp ult i64 %19, 3
  br i1 %50, label %85, label %51

; <label>:51:                                     ; preds = %44
  br label %52

; <label>:52:                                     ; preds = %52, %51
  %53 = phi i64 [ %47, %51 ], [ %83, %52 ]
  %54 = phi i32 [ %48, %51 ], [ %82, %52 ]
  %55 = phi i32 [ %49, %51 ], [ %80, %52 ]
  %56 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %53
  %57 = load i32, i32* %56, align 4, !tbaa !2
  %58 = icmp slt i32 %57, %55
  %59 = select i1 %58, i32 %57, i32 %55
  %60 = trunc i64 %53 to i32
  %61 = select i1 %58, i32 %60, i32 %54
  %62 = add nuw nsw i64 %53, 1
  %63 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %62
  %64 = load i32, i32* %63, align 4, !tbaa !2
  %65 = icmp slt i32 %64, %59
  %66 = select i1 %65, i32 %64, i32 %59
  %67 = trunc i64 %62 to i32
  %68 = select i1 %65, i32 %67, i32 %61
  %69 = add nsw i64 %53, 2
  %70 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %69
  %71 = load i32, i32* %70, align 4, !tbaa !2
  %72 = icmp slt i32 %71, %66
  %73 = select i1 %72, i32 %71, i32 %66
  %74 = trunc i64 %69 to i32
  %75 = select i1 %72, i32 %74, i32 %68
  %76 = add nsw i64 %53, 3
  %77 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %76
  %78 = load i32, i32* %77, align 4, !tbaa !2
  %79 = icmp slt i32 %78, %73
  %80 = select i1 %79, i32 %78, i32 %73
  %81 = trunc i64 %76 to i32
  %82 = select i1 %79, i32 %81, i32 %75
  %83 = add nsw i64 %53, 4
  %84 = icmp eq i64 %83, %13
  br i1 %84, label %85, label %52

; <label>:85:                                     ; preds = %44, %52, %16
  %86 = phi i32 [ %21, %16 ], [ %45, %44 ], [ %80, %52 ]
  %87 = phi i32 [ %24, %16 ], [ %46, %44 ], [ %82, %52 ]
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %88
  store i32 %21, i32* %89, align 4, !tbaa !2
  store i32 %86, i32* %20, align 4, !tbaa !2
  %90 = add nuw nsw i64 %18, 1
  %91 = icmp eq i64 %22, %13
  br i1 %91, label %92, label %16

; <label>:92:                                     ; preds = %85
  %93 = icmp sgt i32 %104, 1
  br i1 %93, label %94, label %95

; <label>:94:                                     ; preds = %92
  br label %112

; <label>:95:                                     ; preds = %0, %9, %92
  %96 = phi i32 [ %104, %92 ], [ %104, %9 ], [ %6, %0 ]
  %97 = add nsw i32 %96, -1
  %98 = sext i32 %97 to i64
  br label %107

; <label>:99:                                     ; preds = %8, %99
  %100 = phi i64 [ %103, %99 ], [ 0, %8 ]
  %101 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %100
  %102 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %101)
  %103 = add nuw nsw i64 %100, 1
  %104 = load i32, i32* %2, align 4, !tbaa !2
  %105 = sext i32 %104 to i64
  %106 = icmp slt i64 %103, %105
  br i1 %106, label %99, label %9

; <label>:107:                                    ; preds = %112, %95
  %108 = phi i64 [ %98, %95 ], [ %120, %112 ]
  %109 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %108
  %110 = load i32, i32* %109, align 4, !tbaa !2
  %111 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %110)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #4
  call void @llvm.lifetime.end.p0i8(i64 4100, i8* nonnull %3) #4
  ret i32 0

; <label>:112:                                    ; preds = %94, %112
  %113 = phi i64 [ %117, %112 ], [ 0, %94 ]
  %114 = getelementptr inbounds [1025 x i32], [1025 x i32]* %1, i64 0, i64 %113
  %115 = load i32, i32* %114, align 4, !tbaa !2
  %116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %115)
  %117 = add nuw nsw i64 %113, 1
  %118 = load i32, i32* %2, align 4, !tbaa !2
  %119 = add nsw i32 %118, -1
  %120 = sext i32 %119 to i64
  %121 = icmp slt i64 %117, %120
  br i1 %121, label %112, label %107
}

; Function Attrs: nounwind
declare i32 @__isoc99_scanf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !7}
