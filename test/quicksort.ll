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
  %left41 = load i32, i32* %2, align 4
  %j42 = load i32, i32* %j, align 4
  %cmpLT43 = icmp slt i32 %left41, %j42
  br i1 %cmpLT43, label %if.then44, label %if.else45

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
  store i32 %temperate13, i32* %i, align 4
  br label %while.loop5

while.after7:                                     ; preds = %while.loop5
  br label %while.loop14

while.loop14:                                     ; preds = %while.body15, %while.after7
  %j17 = load i32, i32* %j, align 4
  %arrayElement18 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %j17
  %array19 = load i32, i32* %arrayElement18, align 4
  %pivot20 = load i32, i32* %pivot, align 4
  %cmpGT = icmp sgt i32 %array19, %pivot20
  br i1 %cmpGT, label %while.body15, label %while.after16

while.body15:                                     ; preds = %while.loop14
  %j21 = load i32, i32* %j, align 4
  %temperate22 = sub i32 %j21, 1
  store i32 %temperate22, i32* %j, align 4
  br label %while.loop14

while.after16:                                    ; preds = %while.loop14
  %i23 = load i32, i32* %i, align 4
  %j24 = load i32, i32* %j, align 4
  %cmpLE25 = icmp sle i32 %i23, %j24
  br i1 %cmpLE25, label %if.then, label %if.else

if.then:                                          ; preds = %while.after16
  %temp = alloca i32, align 4
  %i26 = load i32, i32* %i, align 4
  %arrayElement27 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i26
  %array28 = load i32, i32* %arrayElement27, align 4
  store i32 %array28, i32* %temp, align 4
  %j29 = load i32, i32* %j, align 4
  %arrayElement30 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %j29
  %array31 = load i32, i32* %arrayElement30, align 4
  %i32 = load i32, i32* %i, align 4
  %arrayElement33 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i32
  store i32 %array31, i32* %arrayElement33, align 4
  %temp34 = load i32, i32* %temp, align 4
  %j35 = load i32, i32* %j, align 4
  %arrayElement36 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %j35
  store i32 %temp34, i32* %arrayElement36, align 4
  %i37 = load i32, i32* %i, align 4
  %temperate38 = add i32 %i37, 1
  store i32 %temperate38, i32* %i, align 4
  %j39 = load i32, i32* %j, align 4
  %temperate40 = sub i32 %j39, 1
  store i32 %temperate40, i32* %j, align 4
  br label %if.merge

if.else:                                          ; preds = %while.after16
  br label %if.merge

if.merge:                                         ; preds = %if.else, %if.then
  br label %while.loop

if.then44:                                        ; preds = %while.after
  %left47 = load i32, i32* %2, align 4
  %j48 = load i32, i32* %j, align 4
  %callVal = call i32 @quickSort(i32 %left47, i32 %j48)
  br label %if.merge46

if.else45:                                        ; preds = %while.after
  br label %if.merge46

if.merge46:                                       ; preds = %if.else45, %if.then44
  %i49 = load i32, i32* %i, align 4
  %right50 = load i32, i32* %3, align 4
  %cmpLT51 = icmp slt i32 %i49, %right50
  br i1 %cmpLT51, label %if.then52, label %if.else53

if.then52:                                        ; preds = %if.merge46
  %i55 = load i32, i32* %i, align 4
  %right56 = load i32, i32* %3, align 4
  %callVal57 = call i32 @quickSort(i32 %i55, i32 %right56)
  br label %if.merge54

if.else53:                                        ; preds = %if.merge46
  br label %if.merge54

if.merge54:                                       ; preds = %if.else53, %if.then52
  ret i32 0
}

define i32 @main() {
entry:
  %n = alloca i32, align 4
  %n1 = alloca i32*, align 8
  store i32* %n, i32** %n1, align 8
  %n2 = load i32*, i32** %n1, align 8
  %callVal = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string, i32 0, i32 0), i32* %n2)
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.loop

for.loop:                                         ; preds = %for.body, %entry
  %i3 = load i32, i32* %i, align 4
  %n4 = load i32, i32* %n, align 4
  %cmpLT = icmp slt i32 %i3, %n4
  br i1 %cmpLT, label %for.body, label %for.after

for.body:                                         ; preds = %for.loop
  %i5 = load i32, i32* %i, align 4
  %arrayElement = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i5
  %array = alloca i32*, align 8
  store i32* %arrayElement, i32** %array, align 8
  %array6 = load i32*, i32** %array, align 8
  %callVal7 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string.1, i32 0, i32 0), i32* %array6)
  %i8 = load i32, i32* %i, align 4
  %temperate = add i32 %i8, 1
  store i32 %temperate, i32* %i, align 4
  br label %for.loop

for.after:                                        ; preds = %for.loop
  %n9 = load i32, i32* %n, align 4
  %temperate10 = sub i32 %n9, 1
  %callVal11 = call i32 @quickSort(i32 0, i32 %temperate10)
  %i12 = alloca i32, align 4
  store i32 0, i32* %i12, align 4
  br label %for.loop13

for.loop13:                                       ; preds = %for.body14, %for.after
  %i16 = load i32, i32* %i12, align 4
  %n17 = load i32, i32* %n, align 4
  %cmpLT18 = icmp slt i32 %i16, %n17
  br i1 %cmpLT18, label %for.body14, label %for.after15

for.body14:                                       ; preds = %for.loop13
  %i19 = load i32, i32* %i12, align 4
  %arrayElement20 = getelementptr [10000 x i32], [10000 x i32]* @array, i32 0, i32 %i19
  %array21 = load i32, i32* %arrayElement20, align 4
  %callVal22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @string.2, i32 0, i32 0), i32 %array21)
  %i23 = load i32, i32* %i12, align 4
  %temperate24 = add i32 %i23, 1
  store i32 %temperate24, i32* %i12, align 4
  br label %for.loop13

for.after15:                                      ; preds = %for.loop13
  ret i32 0
}
