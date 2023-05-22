; ModuleID = 'matrix-multiplication'
source_filename = "matrix-multiplication"

@a = global [25 x [25 x i32]] zeroinitializer
@b = global [25 x [25 x i32]] zeroinitializer
@c = global [25 x [25 x i32]] zeroinitializer
@string = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@string.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@string.2 = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@string.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@string.4 = private unnamed_addr constant [25 x i8] c"Incompatible Dimensions\0A\00", align 1
@string.5 = private unnamed_addr constant [5 x i8] c"%10d\00", align 1
@string.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

declare i32 @scanf(i8*, ...)

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %ra = alloca i32, align 4
  %ca = alloca i32, align 4
  %ra1 = bitcast i32* %ra to i32**
  %ca2 = bitcast i32* %ca to i32**
  %callVal = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @string, i32 0, i32 0), i32** %ra1, i32** %ca2)
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.loop

for.loop:                                         ; preds = %for.after7, %entry
  %i3 = load i32, i32* %i, align 4
  %ra4 = load i32, i32* %ra, align 4
  %cmpLT = icmp slt i32 %i3, %ra4
  br i1 %cmpLT, label %for.body, label %for.after

for.body:                                         ; preds = %for.loop
  %j = alloca i32, align 4
  store i32 0, i32* %j, align 4
  br label %for.loop5

for.after:                                        ; preds = %for.loop
  %rb = alloca i32, align 4
  %cb = alloca i32, align 4
  %rb18 = bitcast i32* %rb to i32**
  %cb19 = bitcast i32* %cb to i32**
  %callVal20 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @string.2, i32 0, i32 0), i32** %rb18, i32** %cb19)
  %i21 = alloca i32, align 4
  store i32 0, i32* %i21, align 4
  br label %for.loop22

for.loop5:                                        ; preds = %for.body6, %for.body
  %j8 = load i32, i32* %j, align 4
  %ca9 = load i32, i32* %ca, align 4
  %cmpLT10 = icmp slt i32 %j8, %ca9
  br i1 %cmpLT10, label %for.body6, label %for.after7

for.body6:                                        ; preds = %for.loop5
  %j11 = load i32, i32* %j, align 4
  %arrayElement = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @a, i32 0, i32 %j11
  %i12 = load i32, i32* %i, align 4
  %arrayElement13 = getelementptr [25 x i32], [25 x i32]* %arrayElement, i32 0, i32 %i12
  %a = bitcast i32* %arrayElement13 to i32**
  %callVal14 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string.1, i32 0, i32 0), i32** %a)
  %j15 = load i32, i32* %j, align 4
  %temperate = add i32 %j15, 1
  store i32 %temperate, i32* %j, align 4
  br label %for.loop5

for.after7:                                       ; preds = %for.loop5
  %i16 = load i32, i32* %i, align 4
  %temperate17 = add i32 %i16, 1
  store i32 %temperate17, i32* %i, align 4
  br label %for.loop

for.loop22:                                       ; preds = %for.after31, %for.after
  %i25 = load i32, i32* %i21, align 4
  %rb26 = load i32, i32* %rb, align 4
  %cmpLT27 = icmp slt i32 %i25, %rb26
  br i1 %cmpLT27, label %for.body23, label %for.after24

for.body23:                                       ; preds = %for.loop22
  %j28 = alloca i32, align 4
  store i32 0, i32* %j28, align 4
  br label %for.loop29

for.after24:                                      ; preds = %for.loop22
  %ca44 = load i32, i32* %ca, align 4
  %rb45 = load i32, i32* %rb, align 4
  %cmpNE = icmp ne i32 %ca44, %rb45
  br i1 %cmpNE, label %if.then, label %if.else

for.loop29:                                       ; preds = %for.body30, %for.body23
  %j32 = load i32, i32* %j28, align 4
  %cb33 = load i32, i32* %cb, align 4
  %cmpLT34 = icmp slt i32 %j32, %cb33
  br i1 %cmpLT34, label %for.body30, label %for.after31

for.body30:                                       ; preds = %for.loop29
  %j35 = load i32, i32* %j28, align 4
  %arrayElement36 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @b, i32 0, i32 %j35
  %i37 = load i32, i32* %i21, align 4
  %arrayElement38 = getelementptr [25 x i32], [25 x i32]* %arrayElement36, i32 0, i32 %i37
  %b = bitcast i32* %arrayElement38 to i32**
  %callVal39 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string.3, i32 0, i32 0), i32** %b)
  %j40 = load i32, i32* %j28, align 4
  %temperate41 = add i32 %j40, 1
  store i32 %temperate41, i32* %j28, align 4
  br label %for.loop29

for.after31:                                      ; preds = %for.loop29
  %i42 = load i32, i32* %i21, align 4
  %temperate43 = add i32 %i42, 1
  store i32 %temperate43, i32* %i21, align 4
  br label %for.loop22

if.then:                                          ; preds = %for.after24
  %callVal46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @string.4, i32 0, i32 0))
  ret i32 0
  br label %if.merge

if.else:                                          ; preds = %for.after24
  br label %if.merge

if.merge:                                         ; preds = %if.else, %if.then
  %i47 = alloca i32, align 4
  store i32 0, i32* %i47, align 4
  br label %for.loop48

for.loop48:                                       ; preds = %for.after57, %if.merge
  %i51 = load i32, i32* %i47, align 4
  %ra52 = load i32, i32* %ra, align 4
  %cmpLT53 = icmp slt i32 %i51, %ra52
  br i1 %cmpLT53, label %for.body49, label %for.after50

for.body49:                                       ; preds = %for.loop48
  %j54 = alloca i32, align 4
  store i32 0, i32* %j54, align 4
  br label %for.loop55

for.after50:                                      ; preds = %for.loop48
  %i97 = alloca i32, align 4
  store i32 0, i32* %i97, align 4
  br label %for.loop98

for.loop55:                                       ; preds = %for.after67, %for.body49
  %j58 = load i32, i32* %j54, align 4
  %cb59 = load i32, i32* %cb, align 4
  %cmpLT60 = icmp slt i32 %j58, %cb59
  br i1 %cmpLT60, label %for.body56, label %for.after57

for.body56:                                       ; preds = %for.loop55
  %j61 = load i32, i32* %j54, align 4
  %arrayElement62 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @c, i32 0, i32 %j61
  %i63 = load i32, i32* %i47, align 4
  %arrayElement64 = getelementptr [25 x i32], [25 x i32]* %arrayElement62, i32 0, i32 %i63
  store i32 0, i32* %arrayElement64, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %k, align 4
  br label %for.loop65

for.after57:                                      ; preds = %for.loop55
  %i95 = load i32, i32* %i47, align 4
  %temperate96 = add i32 %i95, 1
  store i32 %temperate96, i32* %i47, align 4
  br label %for.loop48

for.loop65:                                       ; preds = %for.body66, %for.body56
  %k68 = load i32, i32* %k, align 4
  %ca69 = load i32, i32* %ca, align 4
  %cmpLT70 = icmp slt i32 %k68, %ca69
  br i1 %cmpLT70, label %for.body66, label %for.after67

for.body66:                                       ; preds = %for.loop65
  %j71 = load i32, i32* %j54, align 4
  %arrayElement72 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @c, i32 0, i32 %j71
  %i73 = load i32, i32* %i47, align 4
  %arrayElement74 = getelementptr [25 x i32], [25 x i32]* %arrayElement72, i32 0, i32 %i73
  %c = load i32, i32* %arrayElement74, align 4
  %k75 = load i32, i32* %k, align 4
  %arrayElement76 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @a, i32 0, i32 %k75
  %i77 = load i32, i32* %i47, align 4
  %arrayElement78 = getelementptr [25 x i32], [25 x i32]* %arrayElement76, i32 0, i32 %i77
  %a79 = load i32, i32* %arrayElement78, align 4
  %j80 = load i32, i32* %j54, align 4
  %arrayElement81 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @b, i32 0, i32 %j80
  %k82 = load i32, i32* %k, align 4
  %arrayElement83 = getelementptr [25 x i32], [25 x i32]* %arrayElement81, i32 0, i32 %k82
  %b84 = load i32, i32* %arrayElement83, align 4
  %temperate85 = mul i32 %a79, %b84
  %temperate86 = add i32 %c, %temperate85
  %j87 = load i32, i32* %j54, align 4
  %arrayElement88 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @c, i32 0, i32 %j87
  %i89 = load i32, i32* %i47, align 4
  %arrayElement90 = getelementptr [25 x i32], [25 x i32]* %arrayElement88, i32 0, i32 %i89
  store i32 %temperate86, i32* %arrayElement90, align 4
  %k91 = load i32, i32* %k, align 4
  %temperate92 = add i32 %k91, 1
  store i32 %temperate92, i32* %k, align 4
  br label %for.loop65

for.after67:                                      ; preds = %for.loop65
  %j93 = load i32, i32* %j54, align 4
  %temperate94 = add i32 %j93, 1
  store i32 %temperate94, i32* %j54, align 4
  br label %for.loop55

for.loop98:                                       ; preds = %for.after107, %for.after50
  %i101 = load i32, i32* %i97, align 4
  %ra102 = load i32, i32* %ra, align 4
  %cmpLT103 = icmp slt i32 %i101, %ra102
  br i1 %cmpLT103, label %for.body99, label %for.after100

for.body99:                                       ; preds = %for.loop98
  %j104 = alloca i32, align 4
  store i32 0, i32* %j104, align 4
  br label %for.loop105

for.after100:                                     ; preds = %for.loop98
  ret i32 0

for.loop105:                                      ; preds = %for.body106, %for.body99
  %j108 = load i32, i32* %j104, align 4
  %cb109 = load i32, i32* %cb, align 4
  %cmpLT110 = icmp slt i32 %j108, %cb109
  br i1 %cmpLT110, label %for.body106, label %for.after107

for.body106:                                      ; preds = %for.loop105
  %j111 = load i32, i32* %j104, align 4
  %arrayElement112 = getelementptr [25 x [25 x i32]], [25 x [25 x i32]]* @c, i32 0, i32 %j111
  %i113 = load i32, i32* %i97, align 4
  %arrayElement114 = getelementptr [25 x i32], [25 x i32]* %arrayElement112, i32 0, i32 %i113
  %c115 = load i32, i32* %arrayElement114, align 4
  %callVal116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @string.5, i32 0, i32 0), i32 %c115)
  %j117 = load i32, i32* %j104, align 4
  %temperate118 = add i32 %j117, 1
  store i32 %temperate118, i32* %j104, align 4
  br label %for.loop105

for.after107:                                     ; preds = %for.loop105
  %callVal119 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @string.6, i32 0, i32 0))
  %i120 = load i32, i32* %i97, align 4
  %temperate121 = add i32 %i120, 1
  store i32 %temperate121, i32* %i97, align 4
  br label %for.loop98
}
