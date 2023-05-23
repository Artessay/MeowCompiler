; ModuleID = 'matrix-multiplication'
source_filename = "matrix-multiplication"

@a = global [25 x [25 x i32]] zeroinitializer
@b = global [25 x [25 x i32]] zeroinitializer
@c = global [25 x [25 x i32]] zeroinitializer
@string = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@string.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@string.2 = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@string.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@string.4 = private unnamed_addr constant [26 x i8] c"Incompatible Dimensions \0A\00", align 1
@string.5 = private unnamed_addr constant [5 x i8] c"%10d\00", align 1
@string.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

declare i32 @scanf(i8*, ...)

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %ra = alloca i32, align 4
  %ca = alloca i32, align 4
  %ra1 = alloca i32*, align 8
  store i32* %ra, i32** %ra1, align 8
  %ra2 = load i32*, i32** %ra1, align 8
  %ca3 = alloca i32*, align 8
  store i32* %ca, i32** %ca3, align 8
  %ca4 = load i32*, i32** %ca3, align 8
  %callVal = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @string, i32 0, i32 0), i32* %ra2, i32* %ca4)
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.loop

for.loop:                                         ; preds = %for.after9, %entry
  %i5 = load i32, i32* %i, align 4
  %ra6 = load i32, i32* %ra, align 4
  %cmpLT = icmp slt i32 %i5, %ra6
  br i1 %cmpLT, label %for.body, label %for.after

for.body:                                         ; preds = %for.loop
  %j = alloca i32, align 4
  store i32 0, i32* %j, align 4
  br label %for.loop7

for.after:                                        ; preds = %for.loop
  %rb = alloca i32, align 4
  %cb = alloca i32, align 4
  %rb21 = alloca i32*, align 8
  store i32* %rb, i32** %rb21, align 8
  %rb22 = load i32*, i32** %rb21, align 8
  %cb23 = alloca i32*, align 8
  store i32* %cb, i32** %cb23, align 8
  %cb24 = load i32*, i32** %cb23, align 8
  %callVal25 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @string.2, i32 0, i32 0), i32* %rb22, i32* %cb24)
  %i26 = alloca i32, align 4
  store i32 0, i32* %i26, align 4
  br label %for.loop27

for.loop7:                                        ; preds = %for.body8, %for.body
  %j10 = load i32, i32* %j, align 4
  %ca11 = load i32, i32* %ca, align 4
  %cmpLT12 = icmp slt i32 %j10, %ca11
  br i1 %cmpLT12, label %for.body8, label %for.after9

for.body8:                                        ; preds = %for.loop7
  %i13 = load i32, i32* %i, align 4
  %arrayElement = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @a, i32 0, i32 %i13
  %j14 = load i32, i32* %j, align 4
  %arrayElement15 = getelementptr [25 x i32], [25 x i32]* %arrayElement, i32 0, i32 %j14
  %a = alloca i32*, align 8
  store i32* %arrayElement15, i32** %a, align 8
  %a16 = load i32*, i32** %a, align 8
  %callVal17 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string.1, i32 0, i32 0), i32* %a16)
  %j18 = load i32, i32* %j, align 4
  %temperate = add i32 %j18, 1
  store i32 %temperate, i32* %j, align 4
  br label %for.loop7

for.after9:                                       ; preds = %for.loop7
  %i19 = load i32, i32* %i, align 4
  %temperate20 = add i32 %i19, 1
  store i32 %temperate20, i32* %i, align 4
  br label %for.loop

for.loop27:                                       ; preds = %for.after36, %for.after
  %i30 = load i32, i32* %i26, align 4
  %rb31 = load i32, i32* %rb, align 4
  %cmpLT32 = icmp slt i32 %i30, %rb31
  br i1 %cmpLT32, label %for.body28, label %for.after29

for.body28:                                       ; preds = %for.loop27
  %j33 = alloca i32, align 4
  store i32 0, i32* %j33, align 4
  br label %for.loop34

for.after29:                                      ; preds = %for.loop27
  %ca50 = load i32, i32* %ca, align 4
  %rb51 = load i32, i32* %rb, align 4
  %cmpNE = icmp ne i32 %ca50, %rb51
  br i1 %cmpNE, label %if.then, label %if.else

for.loop34:                                       ; preds = %for.body35, %for.body28
  %j37 = load i32, i32* %j33, align 4
  %cb38 = load i32, i32* %cb, align 4
  %cmpLT39 = icmp slt i32 %j37, %cb38
  br i1 %cmpLT39, label %for.body35, label %for.after36

for.body35:                                       ; preds = %for.loop34
  %i40 = load i32, i32* %i26, align 4
  %arrayElement41 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @b, i32 0, i32 %i40
  %j42 = load i32, i32* %j33, align 4
  %arrayElement43 = getelementptr [25 x i32], [25 x i32]* %arrayElement41, i32 0, i32 %j42
  %b = alloca i32*, align 8
  store i32* %arrayElement43, i32** %b, align 8
  %b44 = load i32*, i32** %b, align 8
  %callVal45 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string.3, i32 0, i32 0), i32* %b44)
  %j46 = load i32, i32* %j33, align 4
  %temperate47 = add i32 %j46, 1
  store i32 %temperate47, i32* %j33, align 4
  br label %for.loop34

for.after36:                                      ; preds = %for.loop34
  %i48 = load i32, i32* %i26, align 4
  %temperate49 = add i32 %i48, 1
  store i32 %temperate49, i32* %i26, align 4
  br label %for.loop27

if.then:                                          ; preds = %for.after29
  %callVal52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @string.4, i32 0, i32 0))
  ret i32 0
  br label %if.merge

if.else:                                          ; preds = %for.after29
  br label %if.merge

if.merge:                                         ; preds = %if.else, %if.then
  %i53 = alloca i32, align 4
  store i32 0, i32* %i53, align 4
  br label %for.loop54

for.loop54:                                       ; preds = %for.after63, %if.merge
  %i57 = load i32, i32* %i53, align 4
  %ra58 = load i32, i32* %ra, align 4
  %cmpLT59 = icmp slt i32 %i57, %ra58
  br i1 %cmpLT59, label %for.body55, label %for.after56

for.body55:                                       ; preds = %for.loop54
  %j60 = alloca i32, align 4
  store i32 0, i32* %j60, align 4
  br label %for.loop61

for.after56:                                      ; preds = %for.loop54
  %i103 = alloca i32, align 4
  store i32 0, i32* %i103, align 4
  br label %for.loop104

for.loop61:                                       ; preds = %for.after73, %for.body55
  %j64 = load i32, i32* %j60, align 4
  %cb65 = load i32, i32* %cb, align 4
  %cmpLT66 = icmp slt i32 %j64, %cb65
  br i1 %cmpLT66, label %for.body62, label %for.after63

for.body62:                                       ; preds = %for.loop61
  %i67 = load i32, i32* %i53, align 4
  %arrayElement68 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @c, i32 0, i32 %i67
  %j69 = load i32, i32* %j60, align 4
  %arrayElement70 = getelementptr [25 x i32], [25 x i32]* %arrayElement68, i32 0, i32 %j69
  store i32 0, i32* %arrayElement70, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %k, align 4
  br label %for.loop71

for.after63:                                      ; preds = %for.loop61
  %i101 = load i32, i32* %i53, align 4
  %temperate102 = add i32 %i101, 1
  store i32 %temperate102, i32* %i53, align 4
  br label %for.loop54

for.loop71:                                       ; preds = %for.body72, %for.body62
  %k74 = load i32, i32* %k, align 4
  %ca75 = load i32, i32* %ca, align 4
  %cmpLT76 = icmp slt i32 %k74, %ca75
  br i1 %cmpLT76, label %for.body72, label %for.after73

for.body72:                                       ; preds = %for.loop71
  %i77 = load i32, i32* %i53, align 4
  %arrayElement78 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @c, i32 0, i32 %i77
  %j79 = load i32, i32* %j60, align 4
  %arrayElement80 = getelementptr [25 x i32], [25 x i32]* %arrayElement78, i32 0, i32 %j79
  %c = load i32, i32* %arrayElement80, align 4
  %i81 = load i32, i32* %i53, align 4
  %arrayElement82 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @a, i32 0, i32 %i81
  %k83 = load i32, i32* %k, align 4
  %arrayElement84 = getelementptr [25 x i32], [25 x i32]* %arrayElement82, i32 0, i32 %k83
  %a85 = load i32, i32* %arrayElement84, align 4
  %k86 = load i32, i32* %k, align 4
  %arrayElement87 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @b, i32 0, i32 %k86
  %j88 = load i32, i32* %j60, align 4
  %arrayElement89 = getelementptr [25 x i32], [25 x i32]* %arrayElement87, i32 0, i32 %j88
  %b90 = load i32, i32* %arrayElement89, align 4
  %temperate91 = mul i32 %a85, %b90
  %temperate92 = add i32 %c, %temperate91
  %i93 = load i32, i32* %i53, align 4
  %arrayElement94 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @c, i32 0, i32 %i93
  %j95 = load i32, i32* %j60, align 4
  %arrayElement96 = getelementptr [25 x i32], [25 x i32]* %arrayElement94, i32 0, i32 %j95
  store i32 %temperate92, i32* %arrayElement96, align 4
  %k97 = load i32, i32* %k, align 4
  %temperate98 = add i32 %k97, 1
  store i32 %temperate98, i32* %k, align 4
  br label %for.loop71

for.after73:                                      ; preds = %for.loop71
  %j99 = load i32, i32* %j60, align 4
  %temperate100 = add i32 %j99, 1
  store i32 %temperate100, i32* %j60, align 4
  br label %for.loop61

for.loop104:                                      ; preds = %for.after113, %for.after56
  %i107 = load i32, i32* %i103, align 4
  %ra108 = load i32, i32* %ra, align 4
  %cmpLT109 = icmp slt i32 %i107, %ra108
  br i1 %cmpLT109, label %for.body105, label %for.after106

for.body105:                                      ; preds = %for.loop104
  %j110 = alloca i32, align 4
  store i32 0, i32* %j110, align 4
  br label %for.loop111

for.after106:                                     ; preds = %for.loop104
  ret i32 0

for.loop111:                                      ; preds = %for.body112, %for.body105
  %j114 = load i32, i32* %j110, align 4
  %cb115 = load i32, i32* %cb, align 4
  %cmpLT116 = icmp slt i32 %j114, %cb115
  br i1 %cmpLT116, label %for.body112, label %for.after113

for.body112:                                      ; preds = %for.loop111
  %i117 = load i32, i32* %i103, align 4
  %arrayElement118 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @c, i32 0, i32 %i117
  %j119 = load i32, i32* %j110, align 4
  %arrayElement120 = getelementptr [25 x i32], [25 x i32]* %arrayElement118, i32 0, i32 %j119
  %c121 = load i32, i32* %arrayElement120, align 4
  %callVal122 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @string.5, i32 0, i32 0), i32 %c121)
  %j123 = load i32, i32* %j110, align 4
  %temperate124 = add i32 %j123, 1
  store i32 %temperate124, i32* %j110, align 4
  br label %for.loop111

for.after113:                                     ; preds = %for.loop111
  %callVal125 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @string.6, i32 0, i32 0))
  %i126 = load i32, i32* %i103, align 4
  %temperate127 = add i32 %i126, 1
  store i32 %temperate127, i32* %i103, align 4
  br label %for.loop104
}
