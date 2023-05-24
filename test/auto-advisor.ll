; ModuleID = 'auto-advisor'
source_filename = "auto-advisor"

@courses = global [102 x [302 x i8]] zeroinitializer
@courseName = global [102 x [302 x i8]] zeroinitializer
@coursePrerequisite = global [102 x [302 x i8]] zeroinitializer
@coursePassed = global [65537 x i32] zeroinitializer
@buffer = global [302 x i8] zeroinitializer
@string = private unnamed_addr constant [11 x i8] c"GPA: %.1f\0A\00", align 1
@string.1 = private unnamed_addr constant [21 x i8] c"Hours Attempted: %d\0A\00", align 1
@string.2 = private unnamed_addr constant [21 x i8] c"Hours Completed: %d\0A\00", align 1
@string.3 = private unnamed_addr constant [23 x i8] c"Credits Remaining: %d\0A\00", align 1
@string.4 = private unnamed_addr constant [32 x i8] c"\0APossible Courses to Take Next\0A\00", align 1
@string.5 = private unnamed_addr constant [27 x i8] c"  None - Congratulations!\0A\00", align 1
@string.6 = private unnamed_addr constant [3 x i8] c"  \00", align 1

declare i32 @scanf(i8*, ...)

declare i32 @printf(i8*, ...)

declare i32 @getchar()

declare i32 @putchar(i32)

define i32 @readLine() {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %callVal = call i32 @getchar()
  %castChar = trunc i32 %callVal to i8
  %i1 = load i32, i32* %i, align 4
  %arrayElement = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %i1
  store i8 %castChar, i8* %arrayElement, align 1
  br label %while.loop

while.loop:                                       ; preds = %while.body, %entry
  %i2 = load i32, i32* %i, align 4
  %arrayElement3 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %i2
  %buffer = load i8, i8* %arrayElement3, align 1
  %cmpNE = icmp ne i8 %buffer, 10
  br i1 %cmpNE, label %while.body, label %while.after

while.body:                                       ; preds = %while.loop
  %i4 = load i32, i32* %i, align 4
  %temperate = add i32 %i4, 1
  store i32 %temperate, i32* %i, align 4
  %callVal5 = call i32 @getchar()
  %castChar6 = trunc i32 %callVal5 to i8
  %i7 = load i32, i32* %i, align 4
  %arrayElement8 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %i7
  store i8 %castChar6, i8* %arrayElement8, align 1
  br label %while.loop

while.after:                                      ; preds = %while.loop
  %i9 = load i32, i32* %i, align 4
  %arrayElement10 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %i9
  store i8 0, i8* %arrayElement10, align 1
  %i11 = load i32, i32* %i, align 4
  ret i32 %i11
}

define i32 @printLine() {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %while.loop

while.loop:                                       ; preds = %while.body, %entry
  %i1 = load i32, i32* %i, align 4
  %arrayElement = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %i1
  %buffer = load i8, i8* %arrayElement, align 1
  %castInt = sext i8 %buffer to i32
  %cmpNE = icmp ne i32 %castInt, 0
  br i1 %cmpNE, label %while.body, label %while.after

while.body:                                       ; preds = %while.loop
  %i2 = load i32, i32* %i, align 4
  %arrayElement3 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %i2
  %buffer4 = load i8, i8* %arrayElement3, align 1
  %castInt5 = sext i8 %buffer4 to i32
  %callVal = call i32 @putchar(i32 %castInt5)
  %i6 = load i32, i32* %i, align 4
  %temperate = add i32 %i6, 1
  store i32 %temperate, i32* %i, align 4
  br label %while.loop

while.after:                                      ; preds = %while.loop
  %callVal7 = call i32 @putchar(i32 10)
  %i8 = load i32, i32* %i, align 4
  ret i32 %i8
}

define i32 @judge(i32 %0) {
entry:
  %1 = alloca i32, align 4
  store i32 %0, i32* %1, align 4
  %i = alloca i32, align 4
  %h = alloca i32, align 4
  %ready = alloca i32, align 4
  store i32 0, i32* %ready, align 4
  %state = alloca i32, align 4
  store i32 0, i32* %state, align 4
  %index = alloca i32, align 4
  store i32 0, i32* %index, align 4
  %courseIndex = load i32, i32* %1, align 4
  %arrayElement = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex
  %index1 = load i32, i32* %index, align 4
  %arrayElement2 = getelementptr [302 x i8], [302 x i8]* %arrayElement, i32 0, i32 %index1
  %coursePrerequisite = load i8, i8* %arrayElement2, align 1
  %cmpEQ = icmp eq i8 %coursePrerequisite, 0
  br i1 %cmpEQ, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  ret i32 1
  br label %if.merge

if.else:                                          ; preds = %entry
  br label %if.merge

if.merge:                                         ; preds = %if.else, %if.then
  br label %while.loop

while.loop:                                       ; preds = %if.merge65, %if.merge
  %courseIndex3 = load i32, i32* %1, align 4
  %arrayElement4 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex3
  %index5 = load i32, i32* %index, align 4
  %arrayElement6 = getelementptr [302 x i8], [302 x i8]* %arrayElement4, i32 0, i32 %index5
  %coursePrerequisite7 = load i8, i8* %arrayElement6, align 1
  %cmpNE = icmp ne i8 %coursePrerequisite7, 0
  br i1 %cmpNE, label %while.body, label %while.after

while.body:                                       ; preds = %while.loop
  %precourse = alloca [8 x i8], align 1
  store i32 0, i32* %i, align 4
  br label %while.loop8

while.after:                                      ; preds = %while.loop
  ret i32 0

while.loop8:                                      ; preds = %while.body9, %while.body
  %courseIndex11 = load i32, i32* %1, align 4
  %arrayElement12 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex11
  %index13 = load i32, i32* %index, align 4
  %arrayElement14 = getelementptr [302 x i8], [302 x i8]* %arrayElement12, i32 0, i32 %index13
  %coursePrerequisite15 = load i8, i8* %arrayElement14, align 1
  %cmpNE16 = icmp ne i8 %coursePrerequisite15, 0
  %courseIndex17 = load i32, i32* %1, align 4
  %arrayElement18 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex17
  %index19 = load i32, i32* %index, align 4
  %arrayElement20 = getelementptr [302 x i8], [302 x i8]* %arrayElement18, i32 0, i32 %index19
  %coursePrerequisite21 = load i8, i8* %arrayElement20, align 1
  %cmpNE22 = icmp ne i8 %coursePrerequisite21, 44
  %temperate = and i1 %cmpNE16, %cmpNE22
  %courseIndex23 = load i32, i32* %1, align 4
  %arrayElement24 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex23
  %index25 = load i32, i32* %index, align 4
  %arrayElement26 = getelementptr [302 x i8], [302 x i8]* %arrayElement24, i32 0, i32 %index25
  %coursePrerequisite27 = load i8, i8* %arrayElement26, align 1
  %cmpNE28 = icmp ne i8 %coursePrerequisite27, 59
  %temperate29 = and i1 %temperate, %cmpNE28
  br i1 %temperate29, label %while.body9, label %while.after10

while.body9:                                      ; preds = %while.loop8
  %courseIndex30 = load i32, i32* %1, align 4
  %arrayElement31 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex30
  %index32 = load i32, i32* %index, align 4
  %arrayElement33 = getelementptr [302 x i8], [302 x i8]* %arrayElement31, i32 0, i32 %index32
  %coursePrerequisite34 = load i8, i8* %arrayElement33, align 1
  %i35 = load i32, i32* %i, align 4
  %arrayElement36 = getelementptr [8 x i8], [8 x i8]* %precourse, i32 0, i32 %i35
  store i8 %coursePrerequisite34, i8* %arrayElement36, align 1
  %i37 = load i32, i32* %i, align 4
  %temperate38 = add i32 %i37, 1
  store i32 %temperate38, i32* %i, align 4
  %index39 = load i32, i32* %index, align 4
  %temperate40 = add i32 %index39, 1
  store i32 %temperate40, i32* %index, align 4
  br label %while.loop8

while.after10:                                    ; preds = %while.loop8
  %i41 = load i32, i32* %i, align 4
  %arrayElement42 = getelementptr [8 x i8], [8 x i8]* %precourse, i32 0, i32 %i41
  store i8 0, i8* %arrayElement42, align 1
  %h43 = alloca i32, align 4
  store i32 0, i32* %h43, align 4
  %t = alloca i32, align 4
  store i32 0, i32* %t, align 4
  br label %while.loop44

while.loop44:                                     ; preds = %while.body45, %while.after10
  %t47 = load i32, i32* %t, align 4
  %arrayElement48 = getelementptr [8 x i8], [8 x i8]* %precourse, i32 0, i32 %t47
  %precourse49 = load i8, i8* %arrayElement48, align 1
  %cmpNE50 = icmp ne i8 %precourse49, 0
  br i1 %cmpNE50, label %while.body45, label %while.after46

while.body45:                                     ; preds = %while.loop44
  %h51 = load i32, i32* %h43, align 4
  %temperate52 = mul i32 %h51, 33
  %t53 = load i32, i32* %t, align 4
  %arrayElement54 = getelementptr [8 x i8], [8 x i8]* %precourse, i32 0, i32 %t53
  %precourse55 = load i8, i8* %arrayElement54, align 1
  %castInt = sext i8 %precourse55 to i32
  %temperate56 = add i32 %temperate52, %castInt
  store i32 %temperate56, i32* %h43, align 4
  %h57 = load i32, i32* %h43, align 4
  %temperate58 = srem i32 %h57, 65537
  store i32 %temperate58, i32* %h43, align 4
  %t59 = load i32, i32* %t, align 4
  %temperate60 = add i32 %t59, 1
  store i32 %temperate60, i32* %t, align 4
  br label %while.loop44

while.after46:                                    ; preds = %while.loop44
  %state61 = load i32, i32* %state, align 4
  %cmpEQ62 = icmp eq i32 %state61, 0
  br i1 %cmpEQ62, label %if.then63, label %if.else64

if.then63:                                        ; preds = %while.after46
  %h66 = load i32, i32* %h43, align 4
  %arrayElement67 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h66
  %coursePassed = load i32, i32* %arrayElement67, align 4
  store i32 %coursePassed, i32* %ready, align 4
  %courseIndex68 = load i32, i32* %1, align 4
  %arrayElement69 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex68
  %index70 = load i32, i32* %index, align 4
  %arrayElement71 = getelementptr [302 x i8], [302 x i8]* %arrayElement69, i32 0, i32 %index70
  %coursePrerequisite72 = load i8, i8* %arrayElement71, align 1
  %cmpEQ73 = icmp eq i8 %coursePrerequisite72, 59
  br i1 %cmpEQ73, label %if.then74, label %if.else75

if.else64:                                        ; preds = %while.after46
  %state96 = load i32, i32* %state, align 4
  %cmpEQ97 = icmp eq i32 %state96, 1
  br i1 %cmpEQ97, label %if.then98, label %if.else99

if.merge65:                                       ; preds = %if.merge100, %if.merge76
  br label %while.loop

if.then74:                                        ; preds = %if.then63
  %ready77 = load i32, i32* %ready, align 4
  %cmpEQ78 = icmp eq i32 %ready77, 1
  br i1 %cmpEQ78, label %if.then79, label %if.else80

if.else75:                                        ; preds = %if.then63
  %courseIndex84 = load i32, i32* %1, align 4
  %arrayElement85 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex84
  %index86 = load i32, i32* %index, align 4
  %arrayElement87 = getelementptr [302 x i8], [302 x i8]* %arrayElement85, i32 0, i32 %index86
  %coursePrerequisite88 = load i8, i8* %arrayElement87, align 1
  %cmpEQ89 = icmp eq i8 %coursePrerequisite88, 44
  br i1 %cmpEQ89, label %if.then90, label %if.else91

if.merge76:                                       ; preds = %if.merge92, %if.merge81
  br label %if.merge65

if.then79:                                        ; preds = %if.then74
  ret i32 1
  br label %if.merge81

if.else80:                                        ; preds = %if.then74
  store i32 0, i32* %state, align 4
  store i32 0, i32* %ready, align 4
  br label %if.merge81

if.merge81:                                       ; preds = %if.else80, %if.then79
  %index82 = load i32, i32* %index, align 4
  %temperate83 = add i32 %index82, 1
  store i32 %temperate83, i32* %index, align 4
  br label %if.merge76

if.then90:                                        ; preds = %if.else75
  store i32 1, i32* %state, align 4
  %index93 = load i32, i32* %index, align 4
  %temperate94 = add i32 %index93, 1
  store i32 %temperate94, i32* %index, align 4
  br label %if.merge92

if.else91:                                        ; preds = %if.else75
  %ready95 = load i32, i32* %ready, align 4
  ret i32 %ready95
  br label %if.merge92

if.merge92:                                       ; preds = %if.else91, %if.then90
  br label %if.merge76

if.then98:                                        ; preds = %if.else64
  %ready101 = load i32, i32* %ready, align 4
  %cmpEQ102 = icmp eq i32 %ready101, 1
  %h103 = load i32, i32* %h43, align 4
  %arrayElement104 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h103
  %coursePassed105 = load i32, i32* %arrayElement104, align 4
  %cmpEQ106 = icmp eq i32 %coursePassed105, 1
  %temperate107 = and i1 %cmpEQ102, %cmpEQ106
  br i1 %temperate107, label %if.then108, label %if.else109

if.else99:                                        ; preds = %if.else64
  br label %if.merge100

if.merge100:                                      ; preds = %if.else99, %if.merge119
  br label %if.merge65

if.then108:                                       ; preds = %if.then98
  store i32 1, i32* %ready, align 4
  br label %if.merge110

if.else109:                                       ; preds = %if.then98
  store i32 0, i32* %ready, align 4
  br label %if.merge110

if.merge110:                                      ; preds = %if.else109, %if.then108
  %courseIndex111 = load i32, i32* %1, align 4
  %arrayElement112 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex111
  %index113 = load i32, i32* %index, align 4
  %arrayElement114 = getelementptr [302 x i8], [302 x i8]* %arrayElement112, i32 0, i32 %index113
  %coursePrerequisite115 = load i8, i8* %arrayElement114, align 1
  %cmpEQ116 = icmp eq i8 %coursePrerequisite115, 59
  br i1 %cmpEQ116, label %if.then117, label %if.else118

if.then117:                                       ; preds = %if.merge110
  %ready120 = load i32, i32* %ready, align 4
  %cmpEQ121 = icmp eq i32 %ready120, 1
  br i1 %cmpEQ121, label %if.then122, label %if.else123

if.else118:                                       ; preds = %if.merge110
  %courseIndex127 = load i32, i32* %1, align 4
  %arrayElement128 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex127
  %index129 = load i32, i32* %index, align 4
  %arrayElement130 = getelementptr [302 x i8], [302 x i8]* %arrayElement128, i32 0, i32 %index129
  %coursePrerequisite131 = load i8, i8* %arrayElement130, align 1
  %cmpEQ132 = icmp eq i8 %coursePrerequisite131, 44
  br i1 %cmpEQ132, label %if.then133, label %if.else134

if.merge119:                                      ; preds = %if.merge135, %if.merge124
  br label %if.merge100

if.then122:                                       ; preds = %if.then117
  ret i32 1
  br label %if.merge124

if.else123:                                       ; preds = %if.then117
  store i32 0, i32* %state, align 4
  store i32 0, i32* %ready, align 4
  br label %if.merge124

if.merge124:                                      ; preds = %if.else123, %if.then122
  %index125 = load i32, i32* %index, align 4
  %temperate126 = add i32 %index125, 1
  store i32 %temperate126, i32* %index, align 4
  br label %if.merge119

if.then133:                                       ; preds = %if.else118
  store i32 1, i32* %state, align 4
  %index136 = load i32, i32* %index, align 4
  %temperate137 = add i32 %index136, 1
  store i32 %temperate137, i32* %index, align 4
  br label %if.merge135

if.else134:                                       ; preds = %if.else118
  %ready138 = load i32, i32* %ready, align 4
  ret i32 %ready138
  br label %if.merge135

if.merge135:                                      ; preds = %if.else134, %if.then133
  br label %if.merge119
}

define i32 @main() {
entry:
  %courseNum = alloca i32, align 4
  store i32 0, i32* %courseNum, align 4
  %totalCredit = alloca i32, align 4
  store i32 0, i32* %totalCredit, align 4
  %totalGPA = alloca i32, align 4
  store i32 0, i32* %totalGPA, align 4
  %totalAttemptedCredit = alloca i32, align 4
  store i32 0, i32* %totalAttemptedCredit, align 4
  %totalCompletedCredit = alloca i32, align 4
  store i32 0, i32* %totalCompletedCredit, align 4
  %len = alloca i32, align 4
  %callVal = call i32 @readLine()
  store i32 %callVal, i32* %len, align 4
  %ii = alloca i32, align 4
  store i32 0, i32* %ii, align 4
  br label %while.loop

while.loop:                                       ; preds = %while.body, %entry
  %ii1 = load i32, i32* %ii, align 4
  %arrayElement = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii1
  %buffer = load i8, i8* %arrayElement, align 1
  %cmpNE = icmp ne i8 %buffer, 0
  br i1 %cmpNE, label %while.body, label %while.after

while.body:                                       ; preds = %while.loop
  %ii2 = load i32, i32* %ii, align 4
  %arrayElement3 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii2
  %buffer4 = load i8, i8* %arrayElement3, align 1
  %courseNum5 = load i32, i32* %courseNum, align 4
  %arrayElement6 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courses, i32 0, i32 %courseNum5
  %ii7 = load i32, i32* %ii, align 4
  %arrayElement8 = getelementptr [302 x i8], [302 x i8]* %arrayElement6, i32 0, i32 %ii7
  store i8 %buffer4, i8* %arrayElement8, align 1
  %ii9 = load i32, i32* %ii, align 4
  %temperate = add i32 %ii9, 1
  store i32 %temperate, i32* %ii, align 4
  br label %while.loop

while.after:                                      ; preds = %while.loop
  %courseNum10 = load i32, i32* %courseNum, align 4
  %arrayElement11 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courses, i32 0, i32 %courseNum10
  %ii12 = load i32, i32* %ii, align 4
  %arrayElement13 = getelementptr [302 x i8], [302 x i8]* %arrayElement11, i32 0, i32 %ii12
  store i8 0, i8* %arrayElement13, align 1
  br label %while.loop14

while.loop14:                                     ; preds = %while.after162, %while.after
  %len17 = load i32, i32* %len, align 4
  %cmpNE18 = icmp ne i32 %len17, 0
  br i1 %cmpNE18, label %while.body15, label %while.after16

while.body15:                                     ; preds = %while.loop14
  %i = alloca i32, align 4
  %index = alloca i32, align 4
  store i32 0, i32* %index, align 4
  store i32 0, i32* %i, align 4
  br label %while.loop19

while.after16:                                    ; preds = %while.loop14
  %GPA = alloca double, align 8
  %totalAttemptedCredit176 = load i32, i32* %totalAttemptedCredit, align 4
  %cmpEQ177 = icmp eq i32 %totalAttemptedCredit176, 0
  br i1 %cmpEQ177, label %if.then178, label %if.else179

while.loop19:                                     ; preds = %while.body20, %while.body15
  %index22 = load i32, i32* %index, align 4
  %arrayElement23 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index22
  %buffer24 = load i8, i8* %arrayElement23, align 1
  %castInt = sext i8 %buffer24 to i32
  %cmpNE25 = icmp ne i32 %castInt, 124
  %index26 = load i32, i32* %index, align 4
  %arrayElement27 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index26
  %buffer28 = load i8, i8* %arrayElement27, align 1
  %castInt29 = sext i8 %buffer28 to i32
  %cmpNE30 = icmp ne i32 %castInt29, 0
  %temperate31 = and i1 %cmpNE25, %cmpNE30
  br i1 %temperate31, label %while.body20, label %while.after21

while.body20:                                     ; preds = %while.loop19
  %index32 = load i32, i32* %index, align 4
  %arrayElement33 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index32
  %buffer34 = load i8, i8* %arrayElement33, align 1
  %courseNum35 = load i32, i32* %courseNum, align 4
  %arrayElement36 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courseName, i32 0, i32 %courseNum35
  %i37 = load i32, i32* %i, align 4
  %arrayElement38 = getelementptr [302 x i8], [302 x i8]* %arrayElement36, i32 0, i32 %i37
  store i8 %buffer34, i8* %arrayElement38, align 1
  %i39 = load i32, i32* %i, align 4
  %temperate40 = add i32 %i39, 1
  store i32 %temperate40, i32* %i, align 4
  %index41 = load i32, i32* %index, align 4
  %temperate42 = add i32 %index41, 1
  store i32 %temperate42, i32* %index, align 4
  br label %while.loop19

while.after21:                                    ; preds = %while.loop19
  %courseNum43 = load i32, i32* %courseNum, align 4
  %arrayElement44 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courseName, i32 0, i32 %courseNum43
  %i45 = load i32, i32* %i, align 4
  %arrayElement46 = getelementptr [302 x i8], [302 x i8]* %arrayElement44, i32 0, i32 %i45
  store i8 0, i8* %arrayElement46, align 1
  %index47 = load i32, i32* %index, align 4
  %temperate48 = add i32 %index47, 1
  store i32 %temperate48, i32* %index, align 4
  %credit = alloca i32, align 4
  %index49 = load i32, i32* %index, align 4
  %arrayElement50 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index49
  %buffer51 = load i8, i8* %arrayElement50, align 1
  %temperate52 = sub i8 %buffer51, 48
  %castInt53 = sext i8 %temperate52 to i32
  store i32 %castInt53, i32* %credit, align 4
  %index54 = load i32, i32* %index, align 4
  %temperate55 = add i32 %index54, 1
  store i32 %temperate55, i32* %index, align 4
  %totalCredit56 = load i32, i32* %totalCredit, align 4
  %credit57 = load i32, i32* %credit, align 4
  %temperate58 = add i32 %totalCredit56, %credit57
  store i32 %temperate58, i32* %totalCredit, align 4
  %index59 = load i32, i32* %index, align 4
  %temperate60 = add i32 %index59, 1
  store i32 %temperate60, i32* %index, align 4
  store i32 0, i32* %i, align 4
  br label %while.loop61

while.loop61:                                     ; preds = %while.body62, %while.after21
  %index64 = load i32, i32* %index, align 4
  %arrayElement65 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index64
  %buffer66 = load i8, i8* %arrayElement65, align 1
  %cmpNE67 = icmp ne i8 %buffer66, 124
  %index68 = load i32, i32* %index, align 4
  %arrayElement69 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index68
  %buffer70 = load i8, i8* %arrayElement69, align 1
  %cmpNE71 = icmp ne i8 %buffer70, 0
  %temperate72 = and i1 %cmpNE67, %cmpNE71
  br i1 %temperate72, label %while.body62, label %while.after63

while.body62:                                     ; preds = %while.loop61
  %index73 = load i32, i32* %index, align 4
  %arrayElement74 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index73
  %buffer75 = load i8, i8* %arrayElement74, align 1
  %courseNum76 = load i32, i32* %courseNum, align 4
  %arrayElement77 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseNum76
  %i78 = load i32, i32* %i, align 4
  %arrayElement79 = getelementptr [302 x i8], [302 x i8]* %arrayElement77, i32 0, i32 %i78
  store i8 %buffer75, i8* %arrayElement79, align 1
  %i80 = load i32, i32* %i, align 4
  %temperate81 = add i32 %i80, 1
  store i32 %temperate81, i32* %i, align 4
  %index82 = load i32, i32* %index, align 4
  %temperate83 = add i32 %index82, 1
  store i32 %temperate83, i32* %index, align 4
  br label %while.loop61

while.after63:                                    ; preds = %while.loop61
  %courseNum84 = load i32, i32* %courseNum, align 4
  %arrayElement85 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @coursePrerequisite, i32 0, i32 %courseNum84
  %i86 = load i32, i32* %i, align 4
  %arrayElement87 = getelementptr [302 x i8], [302 x i8]* %arrayElement85, i32 0, i32 %i86
  store i8 0, i8* %arrayElement87, align 1
  %index88 = load i32, i32* %index, align 4
  %temperate89 = add i32 %index88, 1
  store i32 %temperate89, i32* %index, align 4
  %gradeChar = alloca i32, align 4
  %index90 = load i32, i32* %index, align 4
  %arrayElement91 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index90
  %buffer92 = load i8, i8* %arrayElement91, align 1
  %castInt93 = sext i8 %buffer92 to i32
  store i32 %castInt93, i32* %gradeChar, align 4
  %grade = alloca i32, align 4
  store i32 -1, i32* %grade, align 4
  %gradeChar94 = load i32, i32* %gradeChar, align 4
  %cmpEQ = icmp eq i32 %gradeChar94, 65
  br i1 %cmpEQ, label %if.then, label %if.else

if.then:                                          ; preds = %while.after63
  store i32 4, i32* %grade, align 4
  br label %if.merge

if.else:                                          ; preds = %while.after63
  %gradeChar95 = load i32, i32* %gradeChar, align 4
  %cmpEQ96 = icmp eq i32 %gradeChar95, 66
  br i1 %cmpEQ96, label %if.then97, label %if.else98

if.merge:                                         ; preds = %if.merge99, %if.then
  %grade115 = load i32, i32* %grade, align 4
  %cmpGE = icmp sge i32 %grade115, 0
  br i1 %cmpGE, label %if.then116, label %if.else117

if.then97:                                        ; preds = %if.else
  store i32 3, i32* %grade, align 4
  br label %if.merge99

if.else98:                                        ; preds = %if.else
  %gradeChar100 = load i32, i32* %gradeChar, align 4
  %cmpEQ101 = icmp eq i32 %gradeChar100, 67
  br i1 %cmpEQ101, label %if.then102, label %if.else103

if.merge99:                                       ; preds = %if.merge104, %if.then97
  br label %if.merge

if.then102:                                       ; preds = %if.else98
  store i32 2, i32* %grade, align 4
  br label %if.merge104

if.else103:                                       ; preds = %if.else98
  %gradeChar105 = load i32, i32* %gradeChar, align 4
  %cmpEQ106 = icmp eq i32 %gradeChar105, 68
  br i1 %cmpEQ106, label %if.then107, label %if.else108

if.merge104:                                      ; preds = %if.merge109, %if.then102
  br label %if.merge99

if.then107:                                       ; preds = %if.else103
  store i32 1, i32* %grade, align 4
  br label %if.merge109

if.else108:                                       ; preds = %if.else103
  %gradeChar110 = load i32, i32* %gradeChar, align 4
  %cmpEQ111 = icmp eq i32 %gradeChar110, 70
  br i1 %cmpEQ111, label %if.then112, label %if.else113

if.merge109:                                      ; preds = %if.merge114, %if.then107
  br label %if.merge104

if.then112:                                       ; preds = %if.else108
  store i32 0, i32* %grade, align 4
  br label %if.merge114

if.else113:                                       ; preds = %if.else108
  br label %if.merge114

if.merge114:                                      ; preds = %if.else113, %if.then112
  br label %if.merge109

if.then116:                                       ; preds = %if.merge
  %totalAttemptedCredit119 = load i32, i32* %totalAttemptedCredit, align 4
  %credit120 = load i32, i32* %credit, align 4
  %temperate121 = add i32 %totalAttemptedCredit119, %credit120
  store i32 %temperate121, i32* %totalAttemptedCredit, align 4
  %totalGPA122 = load i32, i32* %totalGPA, align 4
  %credit123 = load i32, i32* %credit, align 4
  %grade124 = load i32, i32* %grade, align 4
  %temperate125 = mul i32 %credit123, %grade124
  %temperate126 = add i32 %totalGPA122, %temperate125
  store i32 %temperate126, i32* %totalGPA, align 4
  br label %if.merge118

if.else117:                                       ; preds = %if.merge
  br label %if.merge118

if.merge118:                                      ; preds = %if.else117, %if.then116
  %grade127 = load i32, i32* %grade, align 4
  %cmpGT = icmp sgt i32 %grade127, 0
  br i1 %cmpGT, label %if.then128, label %if.else129

if.then128:                                       ; preds = %if.merge118
  %totalCompletedCredit131 = load i32, i32* %totalCompletedCredit, align 4
  %credit132 = load i32, i32* %credit, align 4
  %temperate133 = add i32 %totalCompletedCredit131, %credit132
  store i32 %temperate133, i32* %totalCompletedCredit, align 4
  %h = alloca i32, align 4
  store i32 0, i32* %h, align 4
  %t = alloca i32, align 4
  store i32 0, i32* %t, align 4
  br label %while.loop134

if.else129:                                       ; preds = %if.merge118
  br label %if.merge130

if.merge130:                                      ; preds = %if.else129, %while.after136
  %courseNum157 = load i32, i32* %courseNum, align 4
  %temperate158 = add i32 %courseNum157, 1
  store i32 %temperate158, i32* %courseNum, align 4
  %callVal159 = call i32 @readLine()
  store i32 %callVal159, i32* %len, align 4
  store i32 0, i32* %ii, align 4
  br label %while.loop160

while.loop134:                                    ; preds = %while.body135, %if.then128
  %courseNum137 = load i32, i32* %courseNum, align 4
  %arrayElement138 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courseName, i32 0, i32 %courseNum137
  %t139 = load i32, i32* %t, align 4
  %arrayElement140 = getelementptr [302 x i8], [302 x i8]* %arrayElement138, i32 0, i32 %t139
  %courseName = load i8, i8* %arrayElement140, align 1
  %cmpNE141 = icmp ne i8 %courseName, 0
  br i1 %cmpNE141, label %while.body135, label %while.after136

while.body135:                                    ; preds = %while.loop134
  %h142 = load i32, i32* %h, align 4
  %temperate143 = mul i32 %h142, 33
  %courseNum144 = load i32, i32* %courseNum, align 4
  %arrayElement145 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courseName, i32 0, i32 %courseNum144
  %t146 = load i32, i32* %t, align 4
  %arrayElement147 = getelementptr [302 x i8], [302 x i8]* %arrayElement145, i32 0, i32 %t146
  %courseName148 = load i8, i8* %arrayElement147, align 1
  %castInt149 = sext i8 %courseName148 to i32
  %temperate150 = add i32 %temperate143, %castInt149
  store i32 %temperate150, i32* %h, align 4
  %h151 = load i32, i32* %h, align 4
  %temperate152 = srem i32 %h151, 65537
  store i32 %temperate152, i32* %h, align 4
  %t153 = load i32, i32* %t, align 4
  %temperate154 = add i32 %t153, 1
  store i32 %temperate154, i32* %t, align 4
  br label %while.loop134

while.after136:                                   ; preds = %while.loop134
  %h155 = load i32, i32* %h, align 4
  %arrayElement156 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h155
  store i32 1, i32* %arrayElement156, align 4
  br label %if.merge130

while.loop160:                                    ; preds = %while.body161, %if.merge130
  %ii163 = load i32, i32* %ii, align 4
  %arrayElement164 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii163
  %buffer165 = load i8, i8* %arrayElement164, align 1
  %cmpNE166 = icmp ne i8 %buffer165, 0
  br i1 %cmpNE166, label %while.body161, label %while.after162

while.body161:                                    ; preds = %while.loop160
  %ii167 = load i32, i32* %ii, align 4
  %arrayElement168 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii167
  %buffer169 = load i8, i8* %arrayElement168, align 1
  %courseNum170 = load i32, i32* %courseNum, align 4
  %arrayElement171 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courses, i32 0, i32 %courseNum170
  %ii172 = load i32, i32* %ii, align 4
  %arrayElement173 = getelementptr [302 x i8], [302 x i8]* %arrayElement171, i32 0, i32 %ii172
  store i8 %buffer169, i8* %arrayElement173, align 1
  %ii174 = load i32, i32* %ii, align 4
  %temperate175 = add i32 %ii174, 1
  store i32 %temperate175, i32* %ii, align 4
  br label %while.loop160

while.after162:                                   ; preds = %while.loop160
  br label %while.loop14

if.then178:                                       ; preds = %while.after16
  store double 0.000000e+00, double* %GPA, align 8
  br label %if.merge180

if.else179:                                       ; preds = %while.after16
  %totalGPA181 = load i32, i32* %totalGPA, align 4
  %castDouble = sitofp i32 %totalGPA181 to double
  %totalAttemptedCredit182 = load i32, i32* %totalAttemptedCredit, align 4
  %castDouble183 = sitofp i32 %totalAttemptedCredit182 to double
  %fDiv = fdiv double %castDouble, %castDouble183
  store double %fDiv, double* %GPA, align 8
  br label %if.merge180

if.merge180:                                      ; preds = %if.else179, %if.then178
  %totalRemainCredit = alloca i32, align 4
  %totalCredit184 = load i32, i32* %totalCredit, align 4
  %totalCompletedCredit185 = load i32, i32* %totalCompletedCredit, align 4
  %temperate186 = sub i32 %totalCredit184, %totalCompletedCredit185
  store i32 %temperate186, i32* %totalRemainCredit, align 4
  %GPA187 = load double, double* %GPA, align 8
  %callVal188 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @string, i32 0, i32 0), double %GPA187)
  %totalAttemptedCredit189 = load i32, i32* %totalAttemptedCredit, align 4
  %callVal190 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @string.1, i32 0, i32 0), i32 %totalAttemptedCredit189)
  %totalCompletedCredit191 = load i32, i32* %totalCompletedCredit, align 4
  %callVal192 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @string.2, i32 0, i32 0), i32 %totalCompletedCredit191)
  %totalRemainCredit193 = load i32, i32* %totalRemainCredit, align 4
  %callVal194 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @string.3, i32 0, i32 0), i32 %totalRemainCredit193)
  %callVal195 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @string.4, i32 0, i32 0))
  %totalRemainCredit196 = load i32, i32* %totalRemainCredit, align 4
  %cmpEQ197 = icmp eq i32 %totalRemainCredit196, 0
  br i1 %cmpEQ197, label %if.then198, label %if.else199

if.then198:                                       ; preds = %if.merge180
  %callVal201 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @string.5, i32 0, i32 0))
  br label %if.merge200

if.else199:                                       ; preds = %if.merge180
  %i202 = alloca i32, align 4
  store i32 0, i32* %i202, align 4
  br label %for.loop

if.merge200:                                      ; preds = %for.after, %if.then198
  ret i32 0

for.loop:                                         ; preds = %if.merge234, %if.else199
  %i203 = load i32, i32* %i202, align 4
  %courseNum204 = load i32, i32* %courseNum, align 4
  %cmpLT = icmp slt i32 %i203, %courseNum204
  br i1 %cmpLT, label %for.body, label %for.after

for.body:                                         ; preds = %for.loop
  %h205 = alloca i32, align 4
  store i32 0, i32* %h205, align 4
  %t206 = alloca i32, align 4
  store i32 0, i32* %t206, align 4
  br label %while.loop207

for.after:                                        ; preds = %for.loop
  br label %if.merge200

while.loop207:                                    ; preds = %while.body208, %for.body
  %i210 = load i32, i32* %i202, align 4
  %arrayElement211 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courseName, i32 0, i32 %i210
  %t212 = load i32, i32* %t206, align 4
  %arrayElement213 = getelementptr [302 x i8], [302 x i8]* %arrayElement211, i32 0, i32 %t212
  %courseName214 = load i8, i8* %arrayElement213, align 1
  %cmpNE215 = icmp ne i8 %courseName214, 0
  br i1 %cmpNE215, label %while.body208, label %while.after209

while.body208:                                    ; preds = %while.loop207
  %h216 = load i32, i32* %h205, align 4
  %temperate217 = mul i32 %h216, 33
  %i218 = load i32, i32* %i202, align 4
  %arrayElement219 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courseName, i32 0, i32 %i218
  %t220 = load i32, i32* %t206, align 4
  %arrayElement221 = getelementptr [302 x i8], [302 x i8]* %arrayElement219, i32 0, i32 %t220
  %courseName222 = load i8, i8* %arrayElement221, align 1
  %castInt223 = sext i8 %courseName222 to i32
  %temperate224 = add i32 %temperate217, %castInt223
  store i32 %temperate224, i32* %h205, align 4
  %h225 = load i32, i32* %h205, align 4
  %temperate226 = srem i32 %h225, 65537
  store i32 %temperate226, i32* %h205, align 4
  %t227 = load i32, i32* %t206, align 4
  %temperate228 = add i32 %t227, 1
  store i32 %temperate228, i32* %t206, align 4
  br label %while.loop207

while.after209:                                   ; preds = %while.loop207
  %h229 = load i32, i32* %h205, align 4
  %arrayElement230 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h229
  %coursePassed = load i32, i32* %arrayElement230, align 4
  %cmpNE231 = icmp ne i32 %coursePassed, 1
  br i1 %cmpNE231, label %if.then232, label %if.else233

if.then232:                                       ; preds = %while.after209
  %i235 = load i32, i32* %i202, align 4
  %callVal236 = call i32 @judge(i32 %i235)
  %cmpEQ237 = icmp eq i32 %callVal236, 1
  br i1 %cmpEQ237, label %if.then238, label %if.else239

if.else233:                                       ; preds = %while.after209
  br label %if.merge234

if.merge234:                                      ; preds = %if.else233, %if.merge240
  %i264 = load i32, i32* %i202, align 4
  %temperate265 = add i32 %i264, 1
  store i32 %temperate265, i32* %i202, align 4
  br label %for.loop

if.then238:                                       ; preds = %if.then232
  %callVal241 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string.6, i32 0, i32 0))
  %ii242 = alloca i32, align 4
  store i32 0, i32* %ii242, align 4
  br label %while.loop243

if.else239:                                       ; preds = %if.then232
  br label %if.merge240

if.merge240:                                      ; preds = %if.else239, %while.after245
  br label %if.merge234

while.loop243:                                    ; preds = %while.body244, %if.then238
  %i246 = load i32, i32* %i202, align 4
  %arrayElement247 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courseName, i32 0, i32 %i246
  %ii248 = load i32, i32* %ii242, align 4
  %arrayElement249 = getelementptr [302 x i8], [302 x i8]* %arrayElement247, i32 0, i32 %ii248
  %courseName250 = load i8, i8* %arrayElement249, align 1
  %cmpNE251 = icmp ne i8 %courseName250, 0
  br i1 %cmpNE251, label %while.body244, label %while.after245

while.body244:                                    ; preds = %while.loop243
  %i252 = load i32, i32* %i202, align 4
  %arrayElement253 = getelementptr [102 x [302 x i8]], [102 x [302 x i8]]* @courseName, i32 0, i32 %i252
  %ii254 = load i32, i32* %ii242, align 4
  %arrayElement255 = getelementptr [302 x i8], [302 x i8]* %arrayElement253, i32 0, i32 %ii254
  %courseName256 = load i8, i8* %arrayElement255, align 1
  %ii257 = load i32, i32* %ii242, align 4
  %arrayElement258 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii257
  store i8 %courseName256, i8* %arrayElement258, align 1
  %ii259 = load i32, i32* %ii242, align 4
  %temperate260 = add i32 %ii259, 1
  store i32 %temperate260, i32* %ii242, align 4
  br label %while.loop243

while.after245:                                   ; preds = %while.loop243
  %ii261 = load i32, i32* %ii242, align 4
  %arrayElement262 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii261
  store i8 0, i8* %arrayElement262, align 1
  %callVal263 = call i32 @printLine()
  br label %if.merge240
}
