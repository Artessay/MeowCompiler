; ModuleID = 'auto-advisor'
source_filename = "auto-advisor"

@courses = global [300 x [102 x i8]] zeroinitializer
@courseName = global [8 x [102 x i8]] zeroinitializer
@coursePrerequisite = global [300 x [102 x i8]] zeroinitializer
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
  %arrayElement = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex
  %index1 = load i32, i32* %index, align 4
  %arrayElement2 = getelementptr [102 x i8], [102 x i8]* %arrayElement, i32 0, i32 %index1
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
  %arrayElement4 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex3
  %index5 = load i32, i32* %index, align 4
  %arrayElement6 = getelementptr [102 x i8], [102 x i8]* %arrayElement4, i32 0, i32 %index5
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
  %arrayElement12 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex11
  %index13 = load i32, i32* %index, align 4
  %arrayElement14 = getelementptr [102 x i8], [102 x i8]* %arrayElement12, i32 0, i32 %index13
  %coursePrerequisite15 = load i8, i8* %arrayElement14, align 1
  %cmpNE16 = icmp ne i8 %coursePrerequisite15, 0
  %courseIndex17 = load i32, i32* %1, align 4
  %arrayElement18 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex17
  %index19 = load i32, i32* %index, align 4
  %arrayElement20 = getelementptr [102 x i8], [102 x i8]* %arrayElement18, i32 0, i32 %index19
  %coursePrerequisite21 = load i8, i8* %arrayElement20, align 1
  %cmpNE22 = icmp ne i8 %coursePrerequisite21, 44
  %temperate = and i1 %cmpNE16, %cmpNE22
  %courseIndex23 = load i32, i32* %1, align 4
  %arrayElement24 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex23
  %index25 = load i32, i32* %index, align 4
  %arrayElement26 = getelementptr [102 x i8], [102 x i8]* %arrayElement24, i32 0, i32 %index25
  %coursePrerequisite27 = load i8, i8* %arrayElement26, align 1
  %cmpNE28 = icmp ne i8 %coursePrerequisite27, 59
  %temperate29 = and i1 %temperate, %cmpNE28
  br i1 %temperate29, label %while.body9, label %while.after10

while.body9:                                      ; preds = %while.loop8
  %courseIndex30 = load i32, i32* %1, align 4
  %arrayElement31 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex30
  %index32 = load i32, i32* %index, align 4
  %arrayElement33 = getelementptr [102 x i8], [102 x i8]* %arrayElement31, i32 0, i32 %index32
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
  %arrayElement69 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex68
  %index70 = load i32, i32* %index, align 4
  %arrayElement71 = getelementptr [102 x i8], [102 x i8]* %arrayElement69, i32 0, i32 %index70
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
  %arrayElement85 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex84
  %index86 = load i32, i32* %index, align 4
  %arrayElement87 = getelementptr [102 x i8], [102 x i8]* %arrayElement85, i32 0, i32 %index86
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
  %h102 = load i32, i32* %h43, align 4
  %arrayElement103 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h102
  %coursePassed104 = load i32, i32* %arrayElement103, align 4
  %temperate105 = and i32 %ready101, %coursePassed104
  store i32 %temperate105, i32* %ready, align 4
  %courseIndex106 = load i32, i32* %1, align 4
  %arrayElement107 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex106
  %index108 = load i32, i32* %index, align 4
  %arrayElement109 = getelementptr [102 x i8], [102 x i8]* %arrayElement107, i32 0, i32 %index108
  %coursePrerequisite110 = load i8, i8* %arrayElement109, align 1
  %cmpEQ111 = icmp eq i8 %coursePrerequisite110, 59
  br i1 %cmpEQ111, label %if.then112, label %if.else113

if.else99:                                        ; preds = %if.else64
  br label %if.merge100

if.merge100:                                      ; preds = %if.else99, %if.merge114
  br label %if.merge65

if.then112:                                       ; preds = %if.then98
  %ready115 = load i32, i32* %ready, align 4
  %cmpEQ116 = icmp eq i32 %ready115, 1
  br i1 %cmpEQ116, label %if.then117, label %if.else118

if.else113:                                       ; preds = %if.then98
  %courseIndex122 = load i32, i32* %1, align 4
  %arrayElement123 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseIndex122
  %index124 = load i32, i32* %index, align 4
  %arrayElement125 = getelementptr [102 x i8], [102 x i8]* %arrayElement123, i32 0, i32 %index124
  %coursePrerequisite126 = load i8, i8* %arrayElement125, align 1
  %cmpEQ127 = icmp eq i8 %coursePrerequisite126, 44
  br i1 %cmpEQ127, label %if.then128, label %if.else129

if.merge114:                                      ; preds = %if.merge130, %if.merge119
  br label %if.merge100

if.then117:                                       ; preds = %if.then112
  ret i32 1
  br label %if.merge119

if.else118:                                       ; preds = %if.then112
  store i32 0, i32* %state, align 4
  store i32 0, i32* %ready, align 4
  br label %if.merge119

if.merge119:                                      ; preds = %if.else118, %if.then117
  %index120 = load i32, i32* %index, align 4
  %temperate121 = add i32 %index120, 1
  store i32 %temperate121, i32* %index, align 4
  br label %if.merge114

if.then128:                                       ; preds = %if.else113
  store i32 1, i32* %state, align 4
  %index131 = load i32, i32* %index, align 4
  %temperate132 = add i32 %index131, 1
  store i32 %temperate132, i32* %index, align 4
  br label %if.merge130

if.else129:                                       ; preds = %if.else113
  %ready133 = load i32, i32* %ready, align 4
  ret i32 %ready133
  br label %if.merge130

if.merge130:                                      ; preds = %if.else129, %if.then128
  br label %if.merge114
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
  %arrayElement6 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %courseNum5
  %ii7 = load i32, i32* %ii, align 4
  %arrayElement8 = getelementptr [102 x i8], [102 x i8]* %arrayElement6, i32 0, i32 %ii7
  store i8 %buffer4, i8* %arrayElement8, align 1
  %ii9 = load i32, i32* %ii, align 4
  %temperate = add i32 %ii9, 1
  store i32 %temperate, i32* %ii, align 4
  br label %while.loop

while.after:                                      ; preds = %while.loop
  br label %while.loop10

while.loop10:                                     ; preds = %while.after158, %while.after
  %len13 = load i32, i32* %len, align 4
  %cmpNE14 = icmp ne i32 %len13, 0
  br i1 %cmpNE14, label %while.body11, label %while.after12

while.body11:                                     ; preds = %while.loop10
  %i = alloca i32, align 4
  %index = alloca i32, align 4
  store i32 0, i32* %index, align 4
  store i32 0, i32* %i, align 4
  br label %while.loop15

while.after12:                                    ; preds = %while.loop10
  %GPA = alloca double, align 8
  %totalAttemptedCredit172 = load i32, i32* %totalAttemptedCredit, align 4
  %cmpEQ173 = icmp eq i32 %totalAttemptedCredit172, 0
  br i1 %cmpEQ173, label %if.then174, label %if.else175

while.loop15:                                     ; preds = %while.body16, %while.body11
  %index18 = load i32, i32* %index, align 4
  %arrayElement19 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index18
  %buffer20 = load i8, i8* %arrayElement19, align 1
  %castInt = sext i8 %buffer20 to i32
  %cmpNE21 = icmp ne i32 %castInt, 124
  %index22 = load i32, i32* %index, align 4
  %arrayElement23 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index22
  %buffer24 = load i8, i8* %arrayElement23, align 1
  %castInt25 = sext i8 %buffer24 to i32
  %cmpNE26 = icmp ne i32 %castInt25, 0
  %temperate27 = and i1 %cmpNE21, %cmpNE26
  br i1 %temperate27, label %while.body16, label %while.after17

while.body16:                                     ; preds = %while.loop15
  %index28 = load i32, i32* %index, align 4
  %arrayElement29 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index28
  %buffer30 = load i8, i8* %arrayElement29, align 1
  %courseNum31 = load i32, i32* %courseNum, align 4
  %arrayElement32 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %courseNum31
  %i33 = load i32, i32* %i, align 4
  %arrayElement34 = getelementptr [102 x i8], [102 x i8]* %arrayElement32, i32 0, i32 %i33
  store i8 %buffer30, i8* %arrayElement34, align 1
  %i35 = load i32, i32* %i, align 4
  %temperate36 = add i32 %i35, 1
  store i32 %temperate36, i32* %i, align 4
  %index37 = load i32, i32* %index, align 4
  %temperate38 = add i32 %index37, 1
  store i32 %temperate38, i32* %index, align 4
  br label %while.loop15

while.after17:                                    ; preds = %while.loop15
  %courseNum39 = load i32, i32* %courseNum, align 4
  %arrayElement40 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %courseNum39
  %i41 = load i32, i32* %i, align 4
  %arrayElement42 = getelementptr [102 x i8], [102 x i8]* %arrayElement40, i32 0, i32 %i41
  store i8 0, i8* %arrayElement42, align 1
  %index43 = load i32, i32* %index, align 4
  %temperate44 = add i32 %index43, 1
  store i32 %temperate44, i32* %index, align 4
  %credit = alloca i32, align 4
  %index45 = load i32, i32* %index, align 4
  %arrayElement46 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index45
  %buffer47 = load i8, i8* %arrayElement46, align 1
  %temperate48 = sub i8 %buffer47, 48
  %castInt49 = sext i8 %temperate48 to i32
  store i32 %castInt49, i32* %credit, align 4
  %index50 = load i32, i32* %index, align 4
  %temperate51 = add i32 %index50, 1
  store i32 %temperate51, i32* %index, align 4
  %totalCredit52 = load i32, i32* %totalCredit, align 4
  %credit53 = load i32, i32* %credit, align 4
  %temperate54 = add i32 %totalCredit52, %credit53
  store i32 %temperate54, i32* %totalCredit, align 4
  %index55 = load i32, i32* %index, align 4
  %temperate56 = add i32 %index55, 1
  store i32 %temperate56, i32* %index, align 4
  store i32 0, i32* %i, align 4
  br label %while.loop57

while.loop57:                                     ; preds = %while.body58, %while.after17
  %index60 = load i32, i32* %index, align 4
  %arrayElement61 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index60
  %buffer62 = load i8, i8* %arrayElement61, align 1
  %cmpNE63 = icmp ne i8 %buffer62, 124
  %index64 = load i32, i32* %index, align 4
  %arrayElement65 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index64
  %buffer66 = load i8, i8* %arrayElement65, align 1
  %cmpNE67 = icmp ne i8 %buffer66, 0
  %temperate68 = and i1 %cmpNE63, %cmpNE67
  br i1 %temperate68, label %while.body58, label %while.after59

while.body58:                                     ; preds = %while.loop57
  %index69 = load i32, i32* %index, align 4
  %arrayElement70 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index69
  %buffer71 = load i8, i8* %arrayElement70, align 1
  %courseNum72 = load i32, i32* %courseNum, align 4
  %arrayElement73 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseNum72
  %i74 = load i32, i32* %i, align 4
  %arrayElement75 = getelementptr [102 x i8], [102 x i8]* %arrayElement73, i32 0, i32 %i74
  store i8 %buffer71, i8* %arrayElement75, align 1
  %i76 = load i32, i32* %i, align 4
  %temperate77 = add i32 %i76, 1
  store i32 %temperate77, i32* %i, align 4
  %index78 = load i32, i32* %index, align 4
  %temperate79 = add i32 %index78, 1
  store i32 %temperate79, i32* %index, align 4
  br label %while.loop57

while.after59:                                    ; preds = %while.loop57
  %courseNum80 = load i32, i32* %courseNum, align 4
  %arrayElement81 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %courseNum80
  %i82 = load i32, i32* %i, align 4
  %arrayElement83 = getelementptr [102 x i8], [102 x i8]* %arrayElement81, i32 0, i32 %i82
  store i8 0, i8* %arrayElement83, align 1
  %index84 = load i32, i32* %index, align 4
  %temperate85 = add i32 %index84, 1
  store i32 %temperate85, i32* %index, align 4
  %gradeChar = alloca i32, align 4
  %index86 = load i32, i32* %index, align 4
  %arrayElement87 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %index86
  %buffer88 = load i8, i8* %arrayElement87, align 1
  %castInt89 = sext i8 %buffer88 to i32
  store i32 %castInt89, i32* %gradeChar, align 4
  %grade = alloca i32, align 4
  store i32 -1, i32* %grade, align 4
  %gradeChar90 = load i32, i32* %gradeChar, align 4
  %cmpEQ = icmp eq i32 %gradeChar90, 65
  br i1 %cmpEQ, label %if.then, label %if.else

if.then:                                          ; preds = %while.after59
  store i32 4, i32* %grade, align 4
  br label %if.merge

if.else:                                          ; preds = %while.after59
  %gradeChar91 = load i32, i32* %gradeChar, align 4
  %cmpEQ92 = icmp eq i32 %gradeChar91, 66
  br i1 %cmpEQ92, label %if.then93, label %if.else94

if.merge:                                         ; preds = %if.merge95, %if.then
  %grade111 = load i32, i32* %grade, align 4
  %cmpGE = icmp sge i32 %grade111, 0
  br i1 %cmpGE, label %if.then112, label %if.else113

if.then93:                                        ; preds = %if.else
  store i32 3, i32* %grade, align 4
  br label %if.merge95

if.else94:                                        ; preds = %if.else
  %gradeChar96 = load i32, i32* %gradeChar, align 4
  %cmpEQ97 = icmp eq i32 %gradeChar96, 67
  br i1 %cmpEQ97, label %if.then98, label %if.else99

if.merge95:                                       ; preds = %if.merge100, %if.then93
  br label %if.merge

if.then98:                                        ; preds = %if.else94
  store i32 2, i32* %grade, align 4
  br label %if.merge100

if.else99:                                        ; preds = %if.else94
  %gradeChar101 = load i32, i32* %gradeChar, align 4
  %cmpEQ102 = icmp eq i32 %gradeChar101, 68
  br i1 %cmpEQ102, label %if.then103, label %if.else104

if.merge100:                                      ; preds = %if.merge105, %if.then98
  br label %if.merge95

if.then103:                                       ; preds = %if.else99
  store i32 1, i32* %grade, align 4
  br label %if.merge105

if.else104:                                       ; preds = %if.else99
  %gradeChar106 = load i32, i32* %gradeChar, align 4
  %cmpEQ107 = icmp eq i32 %gradeChar106, 69
  br i1 %cmpEQ107, label %if.then108, label %if.else109

if.merge105:                                      ; preds = %if.merge110, %if.then103
  br label %if.merge100

if.then108:                                       ; preds = %if.else104
  store i32 0, i32* %grade, align 4
  br label %if.merge110

if.else109:                                       ; preds = %if.else104
  br label %if.merge110

if.merge110:                                      ; preds = %if.else109, %if.then108
  br label %if.merge105

if.then112:                                       ; preds = %if.merge
  %totalAttemptedCredit115 = load i32, i32* %totalAttemptedCredit, align 4
  %credit116 = load i32, i32* %credit, align 4
  %temperate117 = add i32 %totalAttemptedCredit115, %credit116
  store i32 %temperate117, i32* %totalAttemptedCredit, align 4
  %totalGPA118 = load i32, i32* %totalGPA, align 4
  %credit119 = load i32, i32* %credit, align 4
  %grade120 = load i32, i32* %grade, align 4
  %temperate121 = mul i32 %credit119, %grade120
  %temperate122 = add i32 %totalGPA118, %temperate121
  store i32 %temperate122, i32* %totalGPA, align 4
  br label %if.merge114

if.else113:                                       ; preds = %if.merge
  br label %if.merge114

if.merge114:                                      ; preds = %if.else113, %if.then112
  %grade123 = load i32, i32* %grade, align 4
  %cmpGT = icmp sgt i32 %grade123, 0
  br i1 %cmpGT, label %if.then124, label %if.else125

if.then124:                                       ; preds = %if.merge114
  %totalCompletedCredit127 = load i32, i32* %totalCompletedCredit, align 4
  %credit128 = load i32, i32* %credit, align 4
  %temperate129 = add i32 %totalCompletedCredit127, %credit128
  store i32 %temperate129, i32* %totalCompletedCredit, align 4
  %h = alloca i32, align 4
  store i32 0, i32* %h, align 4
  %t = alloca i32, align 4
  store i32 0, i32* %t, align 4
  br label %while.loop130

if.else125:                                       ; preds = %if.merge114
  br label %if.merge126

if.merge126:                                      ; preds = %if.else125, %while.after132
  %courseNum153 = load i32, i32* %courseNum, align 4
  %temperate154 = add i32 %courseNum153, 1
  store i32 %temperate154, i32* %courseNum, align 4
  %callVal155 = call i32 @readLine()
  store i32 %callVal155, i32* %len, align 4
  store i32 0, i32* %ii, align 4
  br label %while.loop156

while.loop130:                                    ; preds = %while.body131, %if.then124
  %courseNum133 = load i32, i32* %courseNum, align 4
  %arrayElement134 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %courseNum133
  %t135 = load i32, i32* %t, align 4
  %arrayElement136 = getelementptr [102 x i8], [102 x i8]* %arrayElement134, i32 0, i32 %t135
  %courseName = load i8, i8* %arrayElement136, align 1
  %cmpNE137 = icmp ne i8 %courseName, 0
  br i1 %cmpNE137, label %while.body131, label %while.after132

while.body131:                                    ; preds = %while.loop130
  %h138 = load i32, i32* %h, align 4
  %temperate139 = mul i32 %h138, 33
  %courseNum140 = load i32, i32* %courseNum, align 4
  %arrayElement141 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %courseNum140
  %t142 = load i32, i32* %t, align 4
  %arrayElement143 = getelementptr [102 x i8], [102 x i8]* %arrayElement141, i32 0, i32 %t142
  %courseName144 = load i8, i8* %arrayElement143, align 1
  %castInt145 = sext i8 %courseName144 to i32
  %temperate146 = add i32 %temperate139, %castInt145
  store i32 %temperate146, i32* %h, align 4
  %h147 = load i32, i32* %h, align 4
  %temperate148 = srem i32 %h147, 65537
  store i32 %temperate148, i32* %h, align 4
  %t149 = load i32, i32* %t, align 4
  %temperate150 = add i32 %t149, 1
  store i32 %temperate150, i32* %t, align 4
  br label %while.loop130

while.after132:                                   ; preds = %while.loop130
  %h151 = load i32, i32* %h, align 4
  %arrayElement152 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h151
  store i32 1, i32* %arrayElement152, align 4
  br label %if.merge126

while.loop156:                                    ; preds = %while.body157, %if.merge126
  %ii159 = load i32, i32* %ii, align 4
  %arrayElement160 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii159
  %buffer161 = load i8, i8* %arrayElement160, align 1
  %cmpNE162 = icmp ne i8 %buffer161, 0
  br i1 %cmpNE162, label %while.body157, label %while.after158

while.body157:                                    ; preds = %while.loop156
  %ii163 = load i32, i32* %ii, align 4
  %arrayElement164 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii163
  %buffer165 = load i8, i8* %arrayElement164, align 1
  %courseNum166 = load i32, i32* %courseNum, align 4
  %arrayElement167 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %courseNum166
  %ii168 = load i32, i32* %ii, align 4
  %arrayElement169 = getelementptr [102 x i8], [102 x i8]* %arrayElement167, i32 0, i32 %ii168
  store i8 %buffer165, i8* %arrayElement169, align 1
  %ii170 = load i32, i32* %ii, align 4
  %temperate171 = add i32 %ii170, 1
  store i32 %temperate171, i32* %ii, align 4
  br label %while.loop156

while.after158:                                   ; preds = %while.loop156
  br label %while.loop10

if.then174:                                       ; preds = %while.after12
  store double 0.000000e+00, double* %GPA, align 8
  br label %if.merge176

if.else175:                                       ; preds = %while.after12
  %totalGPA177 = load i32, i32* %totalGPA, align 4
  %castDouble = sitofp i32 %totalGPA177 to double
  %totalAttemptedCredit178 = load i32, i32* %totalAttemptedCredit, align 4
  %castDouble179 = sitofp i32 %totalAttemptedCredit178 to double
  %fDiv = fdiv double %castDouble, %castDouble179
  store double %fDiv, double* %GPA, align 8
  br label %if.merge176

if.merge176:                                      ; preds = %if.else175, %if.then174
  %totalRemainCredit = alloca i32, align 4
  %totalCredit180 = load i32, i32* %totalCredit, align 4
  %totalCompletedCredit181 = load i32, i32* %totalCompletedCredit, align 4
  %temperate182 = sub i32 %totalCredit180, %totalCompletedCredit181
  store i32 %temperate182, i32* %totalRemainCredit, align 4
  %GPA183 = load double, double* %GPA, align 8
  %callVal184 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @string, i32 0, i32 0), double %GPA183)
  %totalAttemptedCredit185 = load i32, i32* %totalAttemptedCredit, align 4
  %callVal186 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @string.1, i32 0, i32 0), i32 %totalAttemptedCredit185)
  %totalCompletedCredit187 = load i32, i32* %totalCompletedCredit, align 4
  %callVal188 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @string.2, i32 0, i32 0), i32 %totalCompletedCredit187)
  %totalRemainCredit189 = load i32, i32* %totalRemainCredit, align 4
  %callVal190 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @string.3, i32 0, i32 0), i32 %totalRemainCredit189)
  %callVal191 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @string.4, i32 0, i32 0))
  %totalRemainCredit192 = load i32, i32* %totalRemainCredit, align 4
  %cmpEQ193 = icmp eq i32 %totalRemainCredit192, 0
  br i1 %cmpEQ193, label %if.then194, label %if.else195

if.then194:                                       ; preds = %if.merge176
  %callVal197 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @string.5, i32 0, i32 0))
  br label %if.merge196

if.else195:                                       ; preds = %if.merge176
  %i198 = alloca i32, align 4
  store i32 0, i32* %i198, align 4
  br label %for.loop

if.merge196:                                      ; preds = %for.after, %if.then194
  ret i32 0

for.loop:                                         ; preds = %if.merge230, %if.else195
  %i199 = load i32, i32* %i198, align 4
  %courseNum200 = load i32, i32* %courseNum, align 4
  %cmpLT = icmp slt i32 %i199, %courseNum200
  br i1 %cmpLT, label %for.body, label %for.after

for.body:                                         ; preds = %for.loop
  %h201 = alloca i32, align 4
  store i32 0, i32* %h201, align 4
  %t202 = alloca i32, align 4
  store i32 0, i32* %t202, align 4
  br label %while.loop203

for.after:                                        ; preds = %for.loop
  br label %if.merge196

while.loop203:                                    ; preds = %while.body204, %for.body
  %i206 = load i32, i32* %i198, align 4
  %arrayElement207 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %i206
  %t208 = load i32, i32* %t202, align 4
  %arrayElement209 = getelementptr [102 x i8], [102 x i8]* %arrayElement207, i32 0, i32 %t208
  %courseName210 = load i8, i8* %arrayElement209, align 1
  %cmpNE211 = icmp ne i8 %courseName210, 0
  br i1 %cmpNE211, label %while.body204, label %while.after205

while.body204:                                    ; preds = %while.loop203
  %h212 = load i32, i32* %h201, align 4
  %temperate213 = mul i32 %h212, 33
  %i214 = load i32, i32* %i198, align 4
  %arrayElement215 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %i214
  %t216 = load i32, i32* %t202, align 4
  %arrayElement217 = getelementptr [102 x i8], [102 x i8]* %arrayElement215, i32 0, i32 %t216
  %courseName218 = load i8, i8* %arrayElement217, align 1
  %castInt219 = sext i8 %courseName218 to i32
  %temperate220 = add i32 %temperate213, %castInt219
  store i32 %temperate220, i32* %h201, align 4
  %h221 = load i32, i32* %h201, align 4
  %temperate222 = srem i32 %h221, 65537
  store i32 %temperate222, i32* %h201, align 4
  %t223 = load i32, i32* %t202, align 4
  %temperate224 = add i32 %t223, 1
  store i32 %temperate224, i32* %t202, align 4
  br label %while.loop203

while.after205:                                   ; preds = %while.loop203
  %h225 = load i32, i32* %h201, align 4
  %arrayElement226 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h225
  %coursePassed = load i32, i32* %arrayElement226, align 4
  %cmpEQ227 = icmp eq i32 %coursePassed, 0
  br i1 %cmpEQ227, label %if.then228, label %if.else229

if.then228:                                       ; preds = %while.after205
  %i231 = load i32, i32* %i198, align 4
  %callVal232 = call i32 @judge(i32 %i231)
  %cmpEQ233 = icmp eq i32 %callVal232, 1
  br i1 %cmpEQ233, label %if.then234, label %if.else235

if.else229:                                       ; preds = %while.after205
  br label %if.merge230

if.merge230:                                      ; preds = %if.else229, %if.merge236
  %i260 = load i32, i32* %i198, align 4
  %temperate261 = add i32 %i260, 1
  store i32 %temperate261, i32* %i198, align 4
  br label %for.loop

if.then234:                                       ; preds = %if.then228
  %callVal237 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @string.6, i32 0, i32 0))
  %ii238 = alloca i32, align 4
  store i32 0, i32* %ii238, align 4
  br label %while.loop239

if.else235:                                       ; preds = %if.then228
  br label %if.merge236

if.merge236:                                      ; preds = %if.else235, %while.after241
  br label %if.merge230

while.loop239:                                    ; preds = %while.body240, %if.then234
  %i242 = load i32, i32* %i198, align 4
  %arrayElement243 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %i242
  %ii244 = load i32, i32* %ii238, align 4
  %arrayElement245 = getelementptr [102 x i8], [102 x i8]* %arrayElement243, i32 0, i32 %ii244
  %courseName246 = load i8, i8* %arrayElement245, align 1
  %cmpNE247 = icmp ne i8 %courseName246, 0
  br i1 %cmpNE247, label %while.body240, label %while.after241

while.body240:                                    ; preds = %while.loop239
  %i248 = load i32, i32* %i198, align 4
  %arrayElement249 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %i248
  %ii250 = load i32, i32* %ii238, align 4
  %arrayElement251 = getelementptr [102 x i8], [102 x i8]* %arrayElement249, i32 0, i32 %ii250
  %courseName252 = load i8, i8* %arrayElement251, align 1
  %ii253 = load i32, i32* %ii238, align 4
  %arrayElement254 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii253
  store i8 %courseName252, i8* %arrayElement254, align 1
  %ii255 = load i32, i32* %ii238, align 4
  %temperate256 = add i32 %ii255, 1
  store i32 %temperate256, i32* %ii238, align 4
  br label %while.loop239

while.after241:                                   ; preds = %while.loop239
  %ii257 = load i32, i32* %ii238, align 4
  %arrayElement258 = getelementptr [302 x i8], [302 x i8]* @buffer, i32 0, i32 %ii257
  store i8 0, i8* %arrayElement258, align 1
  %callVal259 = call i32 @printLine()
  br label %if.merge236
}
