; ModuleID = 'BiTree.c'
source_filename = "BiTree.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.BiThrNode = type { i8, %struct.BiThrNode*, %struct.BiThrNode*, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.BiNode = type { i8, %struct.BiNode*, %struct.BiNode* }

@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@pre = common local_unnamed_addr global %struct.BiThrNode* null, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@str = private unnamed_addr constant [7 x i8] c"README\00"
@switch.table.In = private unnamed_addr constant [13 x i32] [i32 1, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 0, i32 1, i32 0, i32 1]

; Function Attrs: nounwind uwtable
define i32 @CreateBiTree(%struct.BiNode* nocapture) local_unnamed_addr #0 {
  %2 = alloca i8, align 1
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #4
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* nonnull %2)
  %4 = load i8, i8* %2, align 1, !tbaa !2
  %5 = icmp eq i8 %4, 32
  br i1 %5, label %23, label %6

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 0
  store i8 %4, i8* %7, align 8, !tbaa !5
  %8 = call noalias i8* @malloc(i64 24) #4
  %9 = bitcast i8* %8 to %struct.BiNode*
  %10 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 1
  %11 = bitcast %struct.BiNode** %10 to i8**
  store i8* %8, i8** %11, align 8, !tbaa !8
  %12 = call i32 @CreateBiTree(%struct.BiNode* %9)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %6
  store %struct.BiNode* null, %struct.BiNode** %10, align 8, !tbaa !8
  br label %15

; <label>:15:                                     ; preds = %14, %6
  %16 = call noalias i8* @malloc(i64 24) #4
  %17 = bitcast i8* %16 to %struct.BiNode*
  %18 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 2
  %19 = bitcast %struct.BiNode** %18 to i8**
  store i8* %16, i8** %19, align 8, !tbaa !9
  %20 = call i32 @CreateBiTree(%struct.BiNode* %17)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %15
  store %struct.BiNode* null, %struct.BiNode** %18, align 8, !tbaa !9
  br label %23

; <label>:23:                                     ; preds = %22, %15, %1
  %24 = phi i32 [ 0, %1 ], [ 1, %15 ], [ 1, %22 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #4
  ret i32 %24
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @__isoc99_scanf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @PreOrderTraverse(%struct.BiNode* readonly, i32 (i8)*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.BiNode* %0, null
  br i1 %3, label %18, label %4

; <label>:4:                                      ; preds = %2
  br label %5

; <label>:5:                                      ; preds = %4, %14
  %6 = phi %struct.BiNode* [ %16, %14 ], [ %0, %4 ]
  %7 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %6, i64 0, i32 0
  %8 = load i8, i8* %7, align 8, !tbaa !5
  %9 = tail call i32 %1(i8 signext %8) #4
  %10 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %6, i64 0, i32 1
  %11 = load %struct.BiNode*, %struct.BiNode** %10, align 8, !tbaa !8
  %12 = icmp eq %struct.BiNode* %11, null
  br i1 %12, label %14, label %13

; <label>:13:                                     ; preds = %5
  tail call void @PreOrderTraverse(%struct.BiNode* nonnull %11, i32 (i8)* %1)
  br label %14

; <label>:14:                                     ; preds = %5, %13
  %15 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %6, i64 0, i32 2
  %16 = load %struct.BiNode*, %struct.BiNode** %15, align 8, !tbaa !9
  %17 = icmp eq %struct.BiNode* %16, null
  br i1 %17, label %18, label %5

; <label>:18:                                     ; preds = %14, %2
  ret void
}

; Function Attrs: nounwind uwtable
define void @InOrderTraverse(%struct.BiNode* nocapture readonly, i32 (i8)*) local_unnamed_addr #0 {
  br label %3

; <label>:3:                                      ; preds = %9, %2
  %4 = phi %struct.BiNode* [ %0, %2 ], [ %14, %9 ]
  %5 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %4, i64 0, i32 1
  %6 = load %struct.BiNode*, %struct.BiNode** %5, align 8, !tbaa !8
  %7 = icmp eq %struct.BiNode* %6, null
  br i1 %7, label %9, label %8

; <label>:8:                                      ; preds = %3
  tail call void @InOrderTraverse(%struct.BiNode* nonnull %6, i32 (i8)* %1)
  br label %9

; <label>:9:                                      ; preds = %3, %8
  %10 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %4, i64 0, i32 0
  %11 = load i8, i8* %10, align 8, !tbaa !5
  %12 = tail call i32 %1(i8 signext %11) #4
  %13 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %4, i64 0, i32 2
  %14 = load %struct.BiNode*, %struct.BiNode** %13, align 8, !tbaa !9
  %15 = icmp eq %struct.BiNode* %14, null
  br i1 %15, label %16, label %3

; <label>:16:                                     ; preds = %9
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @PostOrderTraverse(%struct.BiNode* readonly, i32 (i8)*) local_unnamed_addr #0 {
  %3 = icmp eq %struct.BiNode* %0, null
  br i1 %3, label %20, label %4

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 1
  %6 = load %struct.BiNode*, %struct.BiNode** %5, align 8, !tbaa !8
  %7 = tail call i32 @PostOrderTraverse(%struct.BiNode* %6, i32 (i8)* %1)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %20, label %9

; <label>:9:                                      ; preds = %4
  %10 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 2
  %11 = load %struct.BiNode*, %struct.BiNode** %10, align 8, !tbaa !9
  %12 = tail call i32 @PostOrderTraverse(%struct.BiNode* %11, i32 (i8)* %1)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %20, label %14

; <label>:14:                                     ; preds = %9
  %15 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 0
  %16 = load i8, i8* %15, align 8, !tbaa !5
  %17 = tail call i32 %1(i8 signext %16) #4
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i32
  br label %20

; <label>:20:                                     ; preds = %2, %14, %9, %4
  %21 = phi i32 [ undef, %9 ], [ undef, %4 ], [ %19, %14 ], [ 1, %2 ]
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define void @GET(i8 signext) #0 {
  %2 = sext i8 %0 to i32
  %3 = tail call i32 @putchar(i32 %2)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @CreateBiThrTree(%struct.BiThrNode* nocapture, %struct.BiNode* readonly) local_unnamed_addr #0 {
  %3 = icmp eq %struct.BiNode* %1, null
  br i1 %3, label %32, label %4

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %1, i64 0, i32 0
  %6 = load i8, i8* %5, align 8, !tbaa !5
  %7 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 0
  store i8 %6, i8* %7, align 8, !tbaa !10
  %8 = tail call noalias i8* @malloc(i64 32) #4
  %9 = bitcast i8* %8 to %struct.BiThrNode*
  %10 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 1
  %11 = bitcast %struct.BiThrNode** %10 to i8**
  store i8* %8, i8** %11, align 8, !tbaa !13
  %12 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %1, i64 0, i32 1
  %13 = load %struct.BiNode*, %struct.BiNode** %12, align 8, !tbaa !8
  %14 = tail call i32 @CreateBiThrTree(%struct.BiThrNode* %9, %struct.BiNode* %13)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %4
  store %struct.BiThrNode* null, %struct.BiThrNode** %10, align 8, !tbaa !13
  br label %17

; <label>:17:                                     ; preds = %4, %16
  %18 = phi i32 [ 1, %16 ], [ 0, %4 ]
  %19 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 3
  store i32 %18, i32* %19, align 8
  %20 = tail call noalias i8* @malloc(i64 32) #4
  %21 = bitcast i8* %20 to %struct.BiThrNode*
  %22 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 2
  %23 = bitcast %struct.BiThrNode** %22 to i8**
  store i8* %20, i8** %23, align 8, !tbaa !14
  %24 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %1, i64 0, i32 2
  %25 = load %struct.BiNode*, %struct.BiNode** %24, align 8, !tbaa !9
  %26 = tail call i32 @CreateBiThrTree(%struct.BiThrNode* %21, %struct.BiNode* %25)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28:                                     ; preds = %17
  store %struct.BiThrNode* null, %struct.BiThrNode** %22, align 8, !tbaa !14
  br label %29

; <label>:29:                                     ; preds = %17, %28
  %30 = phi i32 [ 1, %28 ], [ 0, %17 ]
  %31 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 4
  store i32 %30, i32* %31, align 4, !tbaa !15
  br label %32

; <label>:32:                                     ; preds = %29, %2
  %33 = phi i32 [ 0, %2 ], [ 1, %29 ]
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define void @PostOrderThrTraverse(%struct.BiThrNode* nocapture readonly, i32 (i8)*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 3
  %4 = load i32, i32* %3, align 8, !tbaa !16
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 1
  %8 = load %struct.BiThrNode*, %struct.BiThrNode** %7, align 8, !tbaa !13
  tail call void @PostOrderThrTraverse(%struct.BiThrNode* %8, i32 (i8)* %1)
  br label %9

; <label>:9:                                      ; preds = %6, %2
  %10 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 4
  %11 = load i32, i32* %10, align 4, !tbaa !15
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 2
  %15 = load %struct.BiThrNode*, %struct.BiThrNode** %14, align 8, !tbaa !14
  tail call void @PostOrderThrTraverse(%struct.BiThrNode* %15, i32 (i8)* %1)
  br label %16

; <label>:16:                                     ; preds = %13, %9
  %17 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 0
  %18 = load i8, i8* %17, align 8, !tbaa !10
  %19 = tail call i32 %1(i8 signext %18) #4
  ret void
}

; Function Attrs: nounwind uwtable
define void @PostOrderThrTraverse1(%struct.BiThrNode*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 1
  %3 = load %struct.BiThrNode*, %struct.BiThrNode** %2, align 8, !tbaa !13
  %4 = icmp eq %struct.BiThrNode* %3, null
  br i1 %4, label %6, label %5

; <label>:5:                                      ; preds = %1
  tail call void @PostOrderThrTraverse1(%struct.BiThrNode* nonnull %3)
  br label %6

; <label>:6:                                      ; preds = %1, %5
  %7 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 2
  %8 = load %struct.BiThrNode*, %struct.BiThrNode** %7, align 8, !tbaa !14
  %9 = icmp eq %struct.BiThrNode* %8, null
  br i1 %9, label %11, label %10

; <label>:10:                                     ; preds = %6
  tail call void @PostOrderThrTraverse1(%struct.BiThrNode* nonnull %8)
  br label %11

; <label>:11:                                     ; preds = %6, %10
  %12 = load %struct.BiThrNode*, %struct.BiThrNode** @pre, align 8, !tbaa !17
  %13 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %12, i64 0, i32 4
  %14 = load i32, i32* %13, align 4, !tbaa !15
  %15 = icmp eq i32 %14, 1
  %16 = ptrtoint %struct.BiThrNode* %12 to i64
  br i1 %15, label %17, label %19

; <label>:17:                                     ; preds = %11
  %18 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %12, i64 0, i32 2
  store %struct.BiThrNode* %0, %struct.BiThrNode** %18, align 8, !tbaa !14
  br label %19

; <label>:19:                                     ; preds = %17, %11
  %20 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %0, i64 0, i32 3
  %21 = load i32, i32* %20, align 8, !tbaa !16
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %19
  %24 = bitcast %struct.BiThrNode** %2 to i64*
  store i64 %16, i64* %24, align 8, !tbaa !13
  br label %25

; <label>:25:                                     ; preds = %23, %19
  store %struct.BiThrNode* %0, %struct.BiThrNode** @pre, align 8, !tbaa !17
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define i32 @In(i8 signext) local_unnamed_addr #3 {
  %2 = add i8 %0, -35
  %3 = icmp ult i8 %2, 13
  br i1 %3, label %4, label %8

; <label>:4:                                      ; preds = %1
  %5 = sext i8 %2 to i64
  %6 = getelementptr inbounds [13 x i32], [13 x i32]* @switch.table.In, i64 0, i64 %5
  %7 = load i32, i32* %6, align 4
  ret i32 %7

; <label>:8:                                      ; preds = %1
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @PolishTree(%struct.BiNode* nocapture) local_unnamed_addr #0 {
  %2 = alloca i8, align 1
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #4
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* nonnull %2)
  %4 = load i8, i8* %2, align 1, !tbaa !2
  switch i8 %4, label %15 [
    i8 43, label %5
    i8 45, label %5
    i8 42, label %5
    i8 47, label %5
    i8 40, label %5
    i8 41, label %5
    i8 35, label %5
  ]

; <label>:5:                                      ; preds = %1, %1, %1, %1, %1, %1, %1
  %6 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 0
  store i8 %4, i8* %6, align 8, !tbaa !5
  %7 = call noalias i8* @malloc(i64 24) #4
  %8 = bitcast i8* %7 to %struct.BiNode*
  %9 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 1
  %10 = bitcast %struct.BiNode** %9 to i8**
  store i8* %7, i8** %10, align 8, !tbaa !8
  call void @PolishTree(%struct.BiNode* %8)
  %11 = call noalias i8* @malloc(i64 24) #4
  %12 = bitcast i8* %11 to %struct.BiNode*
  %13 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 2
  %14 = bitcast %struct.BiNode** %13 to i8**
  store i8* %11, i8** %14, align 8, !tbaa !9
  call void @PolishTree(%struct.BiNode* %12)
  br label %19

; <label>:15:                                     ; preds = %1
  %16 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 0
  store i8 %4, i8* %16, align 8, !tbaa !5
  %17 = getelementptr inbounds %struct.BiNode, %struct.BiNode* %0, i64 0, i32 1
  %18 = bitcast %struct.BiNode** %17 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %18, i8 0, i64 16, i32 8, i1 false)
  br label %19

; <label>:19:                                     ; preds = %15, %5
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #4
  br label %3

; <label>:3:                                      ; preds = %9, %0
  %4 = phi %struct.BiNode* [ undef, %0 ], [ %10, %9 ]
  %5 = phi %struct.BiThrNode* [ undef, %0 ], [ %11, %9 ]
  %6 = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0))
  %7 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* nonnull %1)
  %8 = load i32, i32* %1, align 4, !tbaa !18
  switch i32 %8, label %9 [
    i32 0, label %57
    i32 1, label %12
    i32 2, label %20
    i32 3, label %22
    i32 4, label %24
    i32 5, label %27
    i32 6, label %50
    i32 7, label %52
  ]

; <label>:9:                                      ; preds = %3, %12, %22, %48, %52, %50, %24, %20
  %10 = phi %struct.BiNode* [ %16, %12 ], [ %4, %20 ], [ %4, %22 ], [ %4, %24 ], [ %4, %48 ], [ %4, %50 ], [ %56, %52 ], [ %4, %3 ]
  %11 = phi %struct.BiThrNode* [ %5, %12 ], [ %5, %20 ], [ %5, %22 ], [ %5, %24 ], [ %36, %48 ], [ %5, %50 ], [ %5, %52 ], [ %5, %3 ]
  br label %3

; <label>:12:                                     ; preds = %3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !tbaa !17
  %14 = call i32 @_IO_getc(%struct._IO_FILE* %13) #4
  %15 = call noalias i8* @malloc(i64 8) #4
  %16 = bitcast i8* %15 to %struct.BiNode*
  %17 = call i32 @CreateBiTree(%struct.BiNode* %16)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !tbaa !17
  %19 = call i32 @_IO_getc(%struct._IO_FILE* %18) #4
  br label %9

; <label>:20:                                     ; preds = %3
  call void @PreOrderTraverse(%struct.BiNode* %4, i32 (i8)* bitcast (void (i8)* @GET to i32 (i8)*))
  %21 = call i32 @putchar(i32 10)
  br label %9

; <label>:22:                                     ; preds = %3
  call void @InOrderTraverse(%struct.BiNode* %4, i32 (i8)* bitcast (void (i8)* @GET to i32 (i8)*))
  %23 = call i32 @putchar(i32 10)
  br label %9

; <label>:24:                                     ; preds = %3
  %25 = call i32 @PostOrderTraverse(%struct.BiNode* %4, i32 (i8)* bitcast (void (i8)* @GET to i32 (i8)*))
  %26 = call i32 @putchar(i32 10)
  br label %9

; <label>:27:                                     ; preds = %3
  %28 = call noalias i8* @malloc(i64 32) #4
  %29 = getelementptr inbounds i8, i8* %28, i64 8
  %30 = bitcast i8* %29 to %struct.BiThrNode**
  store %struct.BiThrNode* %5, %struct.BiThrNode** %30, align 8, !tbaa !13
  %31 = getelementptr inbounds i8, i8* %28, i64 24
  %32 = bitcast i8* %31 to i32*
  store i32 0, i32* %32, align 8, !tbaa !16
  %33 = getelementptr inbounds i8, i8* %28, i64 16
  %34 = bitcast i8* %33 to i8**
  store i8* %28, i8** %34, align 8, !tbaa !14
  %35 = call noalias i8* @malloc(i64 32) #4
  %36 = bitcast i8* %35 to %struct.BiThrNode*
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !tbaa !17
  %38 = call i32 @_IO_getc(%struct._IO_FILE* %37) #4
  %39 = call i32 @CreateBiThrTree(%struct.BiThrNode* %36, %struct.BiNode* %4)
  store i8* %28, i8** bitcast (%struct.BiThrNode** @pre to i8**), align 8, !tbaa !17
  call void @PostOrderThrTraverse1(%struct.BiThrNode* %36)
  %40 = load %struct.BiThrNode*, %struct.BiThrNode** @pre, align 8, !tbaa !17
  %41 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %40, i64 0, i32 4
  %42 = load i32, i32* %41, align 4, !tbaa !15
  %43 = icmp eq i32 %42, 1
  %44 = ptrtoint %struct.BiThrNode* %40 to i64
  br i1 %43, label %45, label %48

; <label>:45:                                     ; preds = %27
  %46 = getelementptr inbounds %struct.BiThrNode, %struct.BiThrNode* %40, i64 0, i32 2
  %47 = bitcast %struct.BiThrNode** %46 to i8**
  store i8* %28, i8** %47, align 8, !tbaa !14
  br label %48

; <label>:48:                                     ; preds = %45, %27
  %49 = bitcast i8* %33 to i64*
  store i64 %44, i64* %49, align 8, !tbaa !14
  br label %9

; <label>:50:                                     ; preds = %3
  call void @PostOrderThrTraverse(%struct.BiThrNode* %5, i32 (i8)* bitcast (void (i8)* @GET to i32 (i8)*))
  %51 = call i32 @putchar(i32 10)
  br label %9

; <label>:52:                                     ; preds = %3
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !tbaa !17
  %54 = call i32 @_IO_getc(%struct._IO_FILE* %53) #4
  %55 = call noalias i8* @malloc(i64 8) #4
  %56 = bitcast i8* %55 to %struct.BiNode*
  call void @PolishTree(%struct.BiNode* %56)
  br label %9

; <label>:57:                                     ; preds = %3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #4
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !3, i64 0}
!6 = !{!"BiNode", !3, i64 0, !7, i64 8, !7, i64 16}
!7 = !{!"any pointer", !3, i64 0}
!8 = !{!6, !7, i64 8}
!9 = !{!6, !7, i64 16}
!10 = !{!11, !3, i64 0}
!11 = !{!"BiThrNode", !3, i64 0, !7, i64 8, !7, i64 16, !12, i64 24, !12, i64 28}
!12 = !{!"int", !3, i64 0}
!13 = !{!11, !7, i64 8}
!14 = !{!11, !7, i64 16}
!15 = !{!11, !12, i64 28}
!16 = !{!11, !12, i64 24}
!17 = !{!7, !7, i64 0}
!18 = !{!12, !12, i64 0}
