; ModuleID = 'quicksort'
source_filename = "quicksort"

@array = global [10000 x i32] zeroinitializer
@string = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@string.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@string.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @scanf(i8*, ...)

declare i32 @printf(i8*, ...)

define i32 @quickSort(i32 %0, i32 %1) {
entry:
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4
  %i = alloca i32, align 4
  %left = load i32, i32* %2, align 4
  store i32 %left, i32* %i, align 4
  %j = alloca i32, align 4
  %right = load i32, i32* %3, align 4
  store i32 %right, i32* %j, align 4
  %pivot = alloca i32, align 4
  %left1 = load i32, i32* %2, align 4
  %right2 = load i32, i32* %3, align 4
  %temperate = add i32 %left1, %right2
  %sDiv = sdiv i32 %temperate, 2
  %arrayElement = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %sDiv
  %array = load i32, i32* %arrayElement, align 4
  store i32 %array, i32* %pivot, align 4
  br label %while.loop

while.loop:                                       ; preds = %if.merge, %entry
  %i3 = load i32, i32* %i, align 4
  %j4 = load i32, i32* %j, align 4
  %cmpLE = icmp sle i32 %i3, %j4
  br i1 %cmpLE, label %while.body, label %while.after

while.body:                                       ; preds = %while.loop
  br label %while.loop5

while.after:                                      ; preds = %while.loop
  %left49 = load i32, i32* %2, align 4
  %j50 = load i32, i32* %j, align 4
  %cmpLT51 = icmp slt i32 %left49, %j50
  br i1 %cmpLT51, label %if.then52, label %if.else53

while.loop5:                                      ; preds = %while.body6, %while.body
  %i8 = load i32, i32* %i, align 4
  %arrayElement9 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i8
  %array10 = load i32, i32* %arrayElement9, align 4
  %pivot11 = load i32, i32* %pivot, align 4
  %cmpLT = icmp slt i32 %array10, %pivot11
  br i1 %cmpLT, label %while.body6, label %while.after7

while.body6:                                      ; preds = %while.loop5
  %i12 = load i32, i32* %i, align 4
  %temperate13 = add i32 %i12, 1
  %i14 = load i32, i32* %i, align 4
  %temperate15 = add i32 %i14, 1
  store i32 %temperate15, i32* %i, align 4
  br label %while.loop5

while.after7:                                     ; preds = %while.loop5
  br label %while.loop16

while.loop16:                                     ; preds = %while.body17, %while.after7
  %j19 = load i32, i32* %j, align 4
  %arrayElement20 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %j19
  %array21 = load i32, i32* %arrayElement20, align 4
  %pivot22 = load i32, i32* %pivot, align 4
  %cmpGT = icmp sgt i32 %array21, %pivot22
  br i1 %cmpGT, label %while.body17, label %while.after18

while.body17:                                     ; preds = %while.loop16
  %j23 = load i32, i32* %j, align 4
  %temperate24 = sub i32 %j23, 1
  %j25 = load i32, i32* %j, align 4
  %temperate26 = sub i32 %j25, 1
  store i32 %temperate26, i32* %j, align 4
  br label %while.loop16

while.after18:                                    ; preds = %while.loop16
  %i27 = load i32, i32* %i, align 4
  %j28 = load i32, i32* %j, align 4
  %cmpLE29 = icmp sle i32 %i27, %j28
  br i1 %cmpLE29, label %if.then, label %if.else

if.then:                                          ; preds = %while.after18
  %temp = alloca i32, align 4
  %i30 = load i32, i32* %i, align 4
  %arrayElement31 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i30
  %array32 = load i32, i32* %arrayElement31, align 4
  store i32 %array32, i32* %temp, align 4
  %j33 = load i32, i32* %j, align 4
  %arrayElement34 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %j33
  %array35 = load i32, i32* %arrayElement34, align 4
  %i36 = load i32, i32* %i, align 4
  %arrayElement37 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i36
  store i32 %array35, i32* %arrayElement37, align 4
  %temp38 = load i32, i32* %temp, align 4
  %j39 = load i32, i32* %j, align 4
  %arrayElement40 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %j39
  store i32 %temp38, i32* %arrayElement40, align 4
  %i41 = load i32, i32* %i, align 4
  %temperate42 = add i32 %i41, 1
  %i43 = load i32, i32* %i, align 4
  %temperate44 = add i32 %i43, 1
  store i32 %temperate44, i32* %i, align 4
  %j45 = load i32, i32* %j, align 4
  %temperate46 = sub i32 %j45, 1
  %j47 = load i32, i32* %j, align 4
  %temperate48 = sub i32 %j47, 1
  store i32 %temperate48, i32* %j, align 4
  br label %if.merge

if.else:                                          ; preds = %while.after18
  br label %if.merge

if.merge:                                         ; preds = %if.else, %if.then
  br label %while.loop

if.then52:                                        ; preds = %while.after
  %left55 = load i32, i32* %2, align 4
  %j56 = load i32, i32* %j, align 4
  %callVal = call i32 @quickSort(i32 %left55, i32 %j56)
  br label %if.merge54

if.else53:                                        ; preds = %while.after
  br label %if.merge54

if.merge54:                                       ; preds = %if.else53, %if.then52
  %i57 = load i32, i32* %i, align 4
  %right58 = load i32, i32* %3, align 4
  %cmpLT59 = icmp slt i32 %i57, %right58
  br i1 %cmpLT59, label %if.then60, label %if.else61

if.then60:                                        ; preds = %if.merge54
  %i63 = load i32, i32* %i, align 4
  %right64 = load i32, i32* %3, align 4
  %callVal65 = call i32 @quickSort(i32 %i63, i32 %right64)
  br label %if.merge62

if.else61:                                        ; preds = %if.merge54
  br label %if.merge62

if.merge62:                                       ; preds = %if.else61, %if.then60
  ret i32 0
}

define i32 @main() {
entry:
  %n = alloca i32, align 4
  %n1 = bitcast i32* %n to i32**
  %callVal = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string, i32 0, i32 0), i32** %n1)
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.loop

for.loop:                                         ; preds = %for.body, %entry
  %i2 = load i32, i32* %i, align 4
  %n3 = load i32, i32* %n, align 4
  %cmpLT = icmp slt i32 %i2, %n3
  br i1 %cmpLT, label %for.body, label %for.after

for.body:                                         ; preds = %for.loop
  %i4 = load i32, i32* %i, align 4
  %arrayElement = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i4
  %array = bitcast i32* %arrayElement to i32**
  %callVal5 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string.1, i32 0, i32 0), i32** %array)
  %i6 = load i32, i32* %i, align 4
  %temperate = add i32 %i6, 1
  store i32 %temperate, i32* %i, align 4
  br label %for.loop

for.after:                                        ; preds = %for.loop
  %n7 = load i32, i32* %n, align 4
  %temperate8 = sub i32 %n7, 1
  %callVal9 = call i32 @quickSort(i32 0, i32 %temperate8)
  %i10 = alloca i32, align 4
  store i32 0, i32* %i10, align 4
  br label %for.loop11

for.loop11:                                       ; preds = %for.body12, %for.after
  %i14 = load i32, i32* %i10, align 4
  %n15 = load i32, i32* %n, align 4
  %cmpLT16 = icmp slt i32 %i14, %n15
  br i1 %cmpLT16, label %for.body12, label %for.after13

for.body12:                                       ; preds = %for.loop11
  %i17 = load i32, i32* %i10, align 4
  %arrayElement18 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i17
  %array19 = load i32, i32* %arrayElement18, align 4
  %callVal20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @string.2, i32 0, i32 0), i32 %array19)
  %i21 = load i32, i32* %i10, align 4
  %temperate22 = add i32 %i21, 1
  store i32 %temperate22, i32* %i10, align 4
  br label %for.loop11

for.after13:                                      ; preds = %for.loop11
  ret i32 0
}
