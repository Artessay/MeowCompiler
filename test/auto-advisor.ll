; ModuleID = 'auto-advisor'
source_filename = "auto-advisor"

@courses = global [300 x [100 x i8]] zeroinitializer
@courseName = global [8 x [100 x i8]] zeroinitializer
@coursePrerequisite = global [300 x [100 x i8]] zeroinitializer
@coursePassed = global [65537 x i32] zeroinitializer
@string = private unnamed_addr constant [7 x i8] c"%[^\0A]s\00", align 1
@string.1 = private unnamed_addr constant [7 x i8] c"%[^\0A]s\00", align 1
@string.2 = private unnamed_addr constant [11 x i8] c"GPA: %.1f\0A\00", align 1
@string.3 = private unnamed_addr constant [21 x i8] c"Hours Attempted: %d\0A\00", align 1
@string.4 = private unnamed_addr constant [21 x i8] c"Hours Completed: %d\0A\00", align 1
@string.5 = private unnamed_addr constant [23 x i8] c"Credits Remaining: %d\0A\00", align 1
@string.6 = private unnamed_addr constant [32 x i8] c"\0APossible Courses to Take Next\0A\00", align 1
@string.7 = private unnamed_addr constant [27 x i8] c"  None - Congratulations!\0A\00", align 1
@string.8 = private unnamed_addr constant [6 x i8] c"  %s\0A\00", align 1

declare i32 @scanf(i8*, ...)

declare i32 @printf(i8*, ...)

declare i32 @getchar()

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
  %index1 = load i32, i32* %index, align 4
  %arrayElement = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index1
  %courseIndex = load i32, i32* %1, align 4
  %arrayElement2 = getelementptr [100 x i8], [100 x i8]* %arrayElement, i32 0, i32 %courseIndex
  %coursePrerequisite = load i8, i8* %arrayElement2, align 1
  %cmpEQ = icmp eq i8 %coursePrerequisite, 48
  br i1 %cmpEQ, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  ret i32 1
  br label %if.merge

if.else:                                          ; preds = %entry
  br label %if.merge

if.merge:                                         ; preds = %if.else, %if.then
  br label %while.loop

while.loop:                                       ; preds = %if.merge67, %if.merge
  %index3 = load i32, i32* %index, align 4
  %arrayElement4 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index3
  %courseIndex5 = load i32, i32* %1, align 4
  %arrayElement6 = getelementptr [100 x i8], [100 x i8]* %arrayElement4, i32 0, i32 %courseIndex5
  %coursePrerequisite7 = load i8, i8* %arrayElement6, align 1
  %cmpNE = icmp ne i8 %coursePrerequisite7, 48
  br i1 %cmpNE, label %while.body, label %while.after

while.body:                                       ; preds = %while.loop
  %precourse = alloca [8 x i8], align 1
  store i32 0, i32* %i, align 4
  br label %while.loop8

while.after:                                      ; preds = %while.loop
  ret i32 1

while.loop8:                                      ; preds = %while.body9, %while.body
  %index11 = load i32, i32* %index, align 4
  %arrayElement12 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index11
  %courseIndex13 = load i32, i32* %1, align 4
  %arrayElement14 = getelementptr [100 x i8], [100 x i8]* %arrayElement12, i32 0, i32 %courseIndex13
  %coursePrerequisite15 = load i8, i8* %arrayElement14, align 1
  %cmpNE16 = icmp ne i8 %coursePrerequisite15, 48
  %index17 = load i32, i32* %index, align 4
  %arrayElement18 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index17
  %courseIndex19 = load i32, i32* %1, align 4
  %arrayElement20 = getelementptr [100 x i8], [100 x i8]* %arrayElement18, i32 0, i32 %courseIndex19
  %coursePrerequisite21 = load i8, i8* %arrayElement20, align 1
  %cmpNE22 = icmp ne i8 %coursePrerequisite21, 44
  %temperate = add i1 %cmpNE16, %cmpNE22
  %index23 = load i32, i32* %index, align 4
  %arrayElement24 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index23
  %courseIndex25 = load i32, i32* %1, align 4
  %arrayElement26 = getelementptr [100 x i8], [100 x i8]* %arrayElement24, i32 0, i32 %courseIndex25
  %coursePrerequisite27 = load i8, i8* %arrayElement26, align 1
  %cmpNE28 = icmp ne i8 %coursePrerequisite27, 59
  %temperate29 = add i1 %temperate, %cmpNE28
  br i1 %temperate29, label %while.body9, label %while.after10

while.body9:                                      ; preds = %while.loop8
  %index30 = load i32, i32* %index, align 4
  %arrayElement31 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index30
  %courseIndex32 = load i32, i32* %1, align 4
  %arrayElement33 = getelementptr [100 x i8], [100 x i8]* %arrayElement31, i32 0, i32 %courseIndex32
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
  store i8 48, i8* %arrayElement42, align 1
  store i32 0, i32* %h, align 4
  %t = alloca i32, align 4
  store i32 0, i32* %t, align 4
  br label %while.loop43

while.loop43:                                     ; preds = %while.body44, %while.after10
  %t46 = load i32, i32* %t, align 4
  %arrayElement47 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %t46
  %i48 = load i32, i32* %i, align 4
  %arrayElement49 = getelementptr [100 x i8], [100 x i8]* %arrayElement47, i32 0, i32 %i48
  %courseName = load i8, i8* %arrayElement49, align 1
  %cmpNE50 = icmp ne i8 %courseName, 48
  br i1 %cmpNE50, label %while.body44, label %while.after45

while.body44:                                     ; preds = %while.loop43
  %h51 = load i32, i32* %h, align 4
  %temperate52 = mul i32 %h51, 33
  %t53 = load i32, i32* %t, align 4
  %arrayElement54 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %t53
  %i55 = load i32, i32* %i, align 4
  %arrayElement56 = getelementptr [100 x i8], [100 x i8]* %arrayElement54, i32 0, i32 %i55
  %courseName57 = load i8, i8* %arrayElement56, align 1
  %temperate58 = add i32 %temperate52, i8 %courseName57
  store i32 %temperate58, i32* %h, align 4
  %h59 = load i32, i32* %h, align 4
  %temperate60 = srem i32 %h59, 65537
  store i32 %temperate60, i32* %h, align 4
  %t61 = load i32, i32* %t, align 4
  %temperate62 = add i32 %t61, 1
  store i32 %temperate62, i32* %t, align 4
  br label %while.loop43

while.after45:                                    ; preds = %while.loop43
  %state63 = load i32, i32* %state, align 4
  %cmpEQ64 = icmp eq i32 %state63, 0
  br i1 %cmpEQ64, label %if.then65, label %if.else66

if.then65:                                        ; preds = %while.after45
  %h68 = load i32, i32* %h, align 4
  %arrayElement69 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h68
  %coursePassed = load i32, i32* %arrayElement69, align 4
  store i32 %coursePassed, i32* %ready, align 4
  %index70 = load i32, i32* %index, align 4
  %arrayElement71 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index70
  %courseIndex72 = load i32, i32* %1, align 4
  %arrayElement73 = getelementptr [100 x i8], [100 x i8]* %arrayElement71, i32 0, i32 %courseIndex72
  %coursePrerequisite74 = load i8, i8* %arrayElement73, align 1
  %cmpEQ75 = icmp eq i8 %coursePrerequisite74, 59
  br i1 %cmpEQ75, label %if.then76, label %if.else77

if.else66:                                        ; preds = %while.after45
  %state97 = load i32, i32* %state, align 4
  %cmpEQ98 = icmp eq i32 %state97, 1
  br i1 %cmpEQ98, label %if.then99, label %if.else100

if.merge67:                                       ; preds = %if.merge101, %if.merge78
  br label %while.loop

if.then76:                                        ; preds = %if.then65
  %ready79 = load i32, i32* %ready, align 4
  br i32 %ready79, label %if.then80, label %if.else81

if.else77:                                        ; preds = %if.then65
  %index85 = load i32, i32* %index, align 4
  %arrayElement86 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index85
  %courseIndex87 = load i32, i32* %1, align 4
  %arrayElement88 = getelementptr [100 x i8], [100 x i8]* %arrayElement86, i32 0, i32 %courseIndex87
  %coursePrerequisite89 = load i8, i8* %arrayElement88, align 1
  %cmpEQ90 = icmp eq i8 %coursePrerequisite89, 44
  br i1 %cmpEQ90, label %if.then91, label %if.else92

if.merge78:                                       ; preds = %if.merge93, %if.merge82
  br label %if.merge67

if.then80:                                        ; preds = %if.then76
  ret i32 1
  br label %if.merge82

if.else81:                                        ; preds = %if.then76
  store i32 0, i32* %state, align 4
  store i32 0, i32* %ready, align 4
  br label %if.merge82

if.merge82:                                       ; preds = %if.else81, %if.then80
  %index83 = load i32, i32* %index, align 4
  %temperate84 = add i32 %index83, 1
  store i32 %temperate84, i32* %index, align 4
  br label %if.merge78

if.then91:                                        ; preds = %if.else77
  store i32 1, i32* %state, align 4
  %index94 = load i32, i32* %index, align 4
  %temperate95 = add i32 %index94, 1
  store i32 %temperate95, i32* %index, align 4
  br label %if.merge93

if.else92:                                        ; preds = %if.else77
  %ready96 = load i32, i32* %ready, align 4
  ret i32 %ready96
  br label %if.merge93

if.merge93:                                       ; preds = %if.else92, %if.then91
  br label %if.merge78

if.then99:                                        ; preds = %if.else66
  %ready102 = load i32, i32* %ready, align 4
  %h103 = load i32, i32* %h, align 4
  %arrayElement104 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h103
  %coursePassed105 = load i32, i32* %arrayElement104, align 4
  %temperate106 = and i32 %ready102, %coursePassed105
  store i32 %temperate106, i32* %ready, align 4
  %index107 = load i32, i32* %index, align 4
  %arrayElement108 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index107
  %courseIndex109 = load i32, i32* %1, align 4
  %arrayElement110 = getelementptr [100 x i8], [100 x i8]* %arrayElement108, i32 0, i32 %courseIndex109
  %coursePrerequisite111 = load i8, i8* %arrayElement110, align 1
  %cmpEQ112 = icmp eq i8 %coursePrerequisite111, 59
  br i1 %cmpEQ112, label %if.then113, label %if.else114

if.else100:                                       ; preds = %if.else66
  br label %if.merge101

if.merge101:                                      ; preds = %if.else100, %if.merge115
  br label %if.merge67

if.then113:                                       ; preds = %if.then99
  %ready116 = load i32, i32* %ready, align 4
  br i32 %ready116, label %if.then117, label %if.else118

if.else114:                                       ; preds = %if.then99
  %index122 = load i32, i32* %index, align 4
  %arrayElement123 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %index122
  %courseIndex124 = load i32, i32* %1, align 4
  %arrayElement125 = getelementptr [100 x i8], [100 x i8]* %arrayElement123, i32 0, i32 %courseIndex124
  %coursePrerequisite126 = load i8, i8* %arrayElement125, align 1
  %cmpEQ127 = icmp eq i8 %coursePrerequisite126, 44
  br i1 %cmpEQ127, label %if.then128, label %if.else129

if.merge115:                                      ; preds = %if.merge130, %if.merge119
  br label %if.merge101

if.then117:                                       ; preds = %if.then113
  ret i32 1
  br label %if.merge119

if.else118:                                       ; preds = %if.then113
  store i32 0, i32* %state, align 4
  store i32 0, i32* %ready, align 4
  br label %if.merge119

if.merge119:                                      ; preds = %if.else118, %if.then117
  %index120 = load i32, i32* %index, align 4
  %temperate121 = add i32 %index120, 1
  store i32 %temperate121, i32* %index, align 4
  br label %if.merge115

if.then128:                                       ; preds = %if.else114
  store i32 1, i32* %state, align 4
  %index131 = load i32, i32* %index, align 4
  %temperate132 = add i32 %index131, 1
  store i32 %temperate132, i32* %index, align 4
  br label %if.merge130

if.else129:                                       ; preds = %if.else114
  %ready133 = load i32, i32* %ready, align 4
  ret i32 %ready133
  br label %if.merge130

if.merge130:                                      ; preds = %if.else129, %if.then128
  br label %if.merge115
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
  %courseNum1 = load i32, i32* %courseNum, align 4
  %arrayElement = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %courseNum1
  %courses = load [100 x i8], [100 x i8]* %arrayElement, align 1
  %callVal = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @string, i32 0, i32 0), [100 x i8] %courses)
  %callVal2 = call i32 @getchar()
  br label %while.loop

while.loop:                                       ; preds = %if.merge129, %entry
  %courseNum3 = load i32, i32* %courseNum, align 4
  %arrayElement4 = getelementptr [100 x i8], [100 x i8]* getelementptr inbounds ([300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 0), i32 0, i32 %courseNum3
  %courses5 = load i8, i8* %arrayElement4, align 1
  %cmpNE = icmp ne i8 %courses5, 48
  br i1 %cmpNE, label %while.body, label %while.after

while.body:                                       ; preds = %while.loop
  %i = alloca i32, align 4
  %index = alloca i32, align 4
  store i32 0, i32* %index, align 4
  store i32 0, i32* %i, align 4
  br label %while.loop6

while.after:                                      ; preds = %while.loop
  %GPA = alloca double, align 8
  %totalAttemptedCredit162 = load i32, i32* %totalAttemptedCredit, align 4
  %cmpEQ163 = icmp eq i32 %totalAttemptedCredit162, 0
  br i1 %cmpEQ163, label %if.then164, label %if.else165

while.loop6:                                      ; preds = %while.body7, %while.body
  %index9 = load i32, i32* %index, align 4
  %arrayElement10 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %index9
  %courseNum11 = load i32, i32* %courseNum, align 4
  %arrayElement12 = getelementptr [100 x i8], [100 x i8]* %arrayElement10, i32 0, i32 %courseNum11
  %courses13 = load i8, i8* %arrayElement12, align 1
  %cmpNE14 = icmp ne i8 %courses13, 124
  %index15 = load i32, i32* %index, align 4
  %arrayElement16 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %index15
  %courseNum17 = load i32, i32* %courseNum, align 4
  %arrayElement18 = getelementptr [100 x i8], [100 x i8]* %arrayElement16, i32 0, i32 %courseNum17
  %courses19 = load i8, i8* %arrayElement18, align 1
  %cmpNE20 = icmp ne i8 %courses19, 48
  %temperate = add i1 %cmpNE14, %cmpNE20
  br i1 %temperate, label %while.body7, label %while.after8

while.body7:                                      ; preds = %while.loop6
  %index21 = load i32, i32* %index, align 4
  %arrayElement22 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %index21
  %courseNum23 = load i32, i32* %courseNum, align 4
  %arrayElement24 = getelementptr [100 x i8], [100 x i8]* %arrayElement22, i32 0, i32 %courseNum23
  %courses25 = load i8, i8* %arrayElement24, align 1
  %i26 = load i32, i32* %i, align 4
  %arrayElement27 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %i26
  %courseNum28 = load i32, i32* %courseNum, align 4
  %arrayElement29 = getelementptr [100 x i8], [100 x i8]* %arrayElement27, i32 0, i32 %courseNum28
  store i8 %courses25, i8* %arrayElement29, align 1
  %i30 = load i32, i32* %i, align 4
  %temperate31 = add i32 %i30, 1
  store i32 %temperate31, i32* %i, align 4
  %index32 = load i32, i32* %index, align 4
  %temperate33 = add i32 %index32, 1
  store i32 %temperate33, i32* %index, align 4
  br label %while.loop6

while.after8:                                     ; preds = %while.loop6
  %i34 = load i32, i32* %i, align 4
  %arrayElement35 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %i34
  %courseNum36 = load i32, i32* %courseNum, align 4
  %arrayElement37 = getelementptr [100 x i8], [100 x i8]* %arrayElement35, i32 0, i32 %courseNum36
  store i8 48, i8* %arrayElement37, align 1
  %index38 = load i32, i32* %index, align 4
  %temperate39 = add i32 %index38, 1
  store i32 %temperate39, i32* %index, align 4
  %credit = alloca i32, align 4
  %index40 = load i32, i32* %index, align 4
  %arrayElement41 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %index40
  %courseNum42 = load i32, i32* %courseNum, align 4
  %arrayElement43 = getelementptr [100 x i8], [100 x i8]* %arrayElement41, i32 0, i32 %courseNum42
  %courses44 = load i8, i8* %arrayElement43, align 1
  %temperate45 = sub i8 %courses44, 48
  store i8 %temperate45, i32* %credit, align 1
  %index46 = load i32, i32* %index, align 4
  %temperate47 = add i32 %index46, 1
  store i32 %temperate47, i32* %index, align 4
  %totalCredit48 = load i32, i32* %totalCredit, align 4
  %credit49 = load i32, i32* %credit, align 4
  %temperate50 = add i32 %totalCredit48, %credit49
  store i32 %temperate50, i32* %totalCredit, align 4
  %index51 = load i32, i32* %index, align 4
  %temperate52 = add i32 %index51, 1
  store i32 %temperate52, i32* %index, align 4
  store i32 0, i32* %i, align 4
  br label %while.loop53

while.loop53:                                     ; preds = %while.body54, %while.after8
  %index56 = load i32, i32* %index, align 4
  %arrayElement57 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %index56
  %courseNum58 = load i32, i32* %courseNum, align 4
  %arrayElement59 = getelementptr [100 x i8], [100 x i8]* %arrayElement57, i32 0, i32 %courseNum58
  %courses60 = load i8, i8* %arrayElement59, align 1
  %cmpNE61 = icmp ne i8 %courses60, 124
  %index62 = load i32, i32* %index, align 4
  %arrayElement63 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %index62
  %courseNum64 = load i32, i32* %courseNum, align 4
  %arrayElement65 = getelementptr [100 x i8], [100 x i8]* %arrayElement63, i32 0, i32 %courseNum64
  %courses66 = load i8, i8* %arrayElement65, align 1
  %cmpNE67 = icmp ne i8 %courses66, 48
  %temperate68 = add i1 %cmpNE61, %cmpNE67
  br i1 %temperate68, label %while.body54, label %while.after55

while.body54:                                     ; preds = %while.loop53
  %index69 = load i32, i32* %index, align 4
  %arrayElement70 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %index69
  %courseNum71 = load i32, i32* %courseNum, align 4
  %arrayElement72 = getelementptr [100 x i8], [100 x i8]* %arrayElement70, i32 0, i32 %courseNum71
  %courses73 = load i8, i8* %arrayElement72, align 1
  %i74 = load i32, i32* %i, align 4
  %arrayElement75 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %i74
  %courseNum76 = load i32, i32* %courseNum, align 4
  %arrayElement77 = getelementptr [100 x i8], [100 x i8]* %arrayElement75, i32 0, i32 %courseNum76
  store i8 %courses73, i8* %arrayElement77, align 1
  %i78 = load i32, i32* %i, align 4
  %temperate79 = add i32 %i78, 1
  store i32 %temperate79, i32* %i, align 4
  %index80 = load i32, i32* %index, align 4
  %temperate81 = add i32 %index80, 1
  store i32 %temperate81, i32* %index, align 4
  br label %while.loop53

while.after55:                                    ; preds = %while.loop53
  %i82 = load i32, i32* %i, align 4
  %arrayElement83 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @coursePrerequisite, i32 0, i32 %i82
  %courseNum84 = load i32, i32* %courseNum, align 4
  %arrayElement85 = getelementptr [100 x i8], [100 x i8]* %arrayElement83, i32 0, i32 %courseNum84
  store i8 48, i8* %arrayElement85, align 1
  %index86 = load i32, i32* %index, align 4
  %temperate87 = add i32 %index86, 1
  store i32 %temperate87, i32* %index, align 4
  %gradeChar = alloca i8, align 1
  %index88 = load i32, i32* %index, align 4
  %arrayElement89 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %index88
  %courseNum90 = load i32, i32* %courseNum, align 4
  %arrayElement91 = getelementptr [100 x i8], [100 x i8]* %arrayElement89, i32 0, i32 %courseNum90
  %courses92 = load i8, i8* %arrayElement91, align 1
  store i8 %courses92, i8* %gradeChar, align 1
  %grade = alloca i32, align 4
  store i32 -1, i32* %grade, align 4
  %gradeChar93 = load i8, i8* %gradeChar, align 1
  %cmpEQ = icmp eq i8 %gradeChar93, 65
  br i1 %cmpEQ, label %if.then, label %if.else

if.then:                                          ; preds = %while.after55
  store i32 4, i32* %grade, align 4
  br label %if.merge

if.else:                                          ; preds = %while.after55
  %gradeChar94 = load i8, i8* %gradeChar, align 1
  %cmpEQ95 = icmp eq i8 %gradeChar94, 66
  br i1 %cmpEQ95, label %if.then96, label %if.else97

if.merge:                                         ; preds = %if.merge98, %if.then
  %grade114 = load i32, i32* %grade, align 4
  %cmpGE = icmp sge i32 %grade114, 0
  br i1 %cmpGE, label %if.then115, label %if.else116

if.then96:                                        ; preds = %if.else
  store i32 3, i32* %grade, align 4
  br label %if.merge98

if.else97:                                        ; preds = %if.else
  %gradeChar99 = load i8, i8* %gradeChar, align 1
  %cmpEQ100 = icmp eq i8 %gradeChar99, 67
  br i1 %cmpEQ100, label %if.then101, label %if.else102

if.merge98:                                       ; preds = %if.merge103, %if.then96
  br label %if.merge

if.then101:                                       ; preds = %if.else97
  store i32 2, i32* %grade, align 4
  br label %if.merge103

if.else102:                                       ; preds = %if.else97
  %gradeChar104 = load i8, i8* %gradeChar, align 1
  %cmpEQ105 = icmp eq i8 %gradeChar104, 68
  br i1 %cmpEQ105, label %if.then106, label %if.else107

if.merge103:                                      ; preds = %if.merge108, %if.then101
  br label %if.merge98

if.then106:                                       ; preds = %if.else102
  store i32 1, i32* %grade, align 4
  br label %if.merge108

if.else107:                                       ; preds = %if.else102
  %gradeChar109 = load i8, i8* %gradeChar, align 1
  %cmpEQ110 = icmp eq i8 %gradeChar109, 70
  br i1 %cmpEQ110, label %if.then111, label %if.else112

if.merge108:                                      ; preds = %if.merge113, %if.then106
  br label %if.merge103

if.then111:                                       ; preds = %if.else107
  store i32 0, i32* %grade, align 4
  br label %if.merge113

if.else112:                                       ; preds = %if.else107
  br label %if.merge113

if.merge113:                                      ; preds = %if.else112, %if.then111
  br label %if.merge108

if.then115:                                       ; preds = %if.merge
  %totalAttemptedCredit118 = load i32, i32* %totalAttemptedCredit, align 4
  %credit119 = load i32, i32* %credit, align 4
  %temperate120 = add i32 %totalAttemptedCredit118, %credit119
  store i32 %temperate120, i32* %totalAttemptedCredit, align 4
  %totalGPA121 = load i32, i32* %totalGPA, align 4
  %credit122 = load i32, i32* %credit, align 4
  %grade123 = load i32, i32* %grade, align 4
  %temperate124 = mul i32 %credit122, %grade123
  %temperate125 = add i32 %totalGPA121, %temperate124
  store i32 %temperate125, i32* %totalGPA, align 4
  br label %if.merge117

if.else116:                                       ; preds = %if.merge
  br label %if.merge117

if.merge117:                                      ; preds = %if.else116, %if.then115
  %grade126 = load i32, i32* %grade, align 4
  %cmpGT = icmp sgt i32 %grade126, 0
  br i1 %cmpGT, label %if.then127, label %if.else128

if.then127:                                       ; preds = %if.merge117
  %totalCompletedCredit130 = load i32, i32* %totalCompletedCredit, align 4
  %credit131 = load i32, i32* %credit, align 4
  %temperate132 = add i32 %totalCompletedCredit130, %credit131
  store i32 %temperate132, i32* %totalCompletedCredit, align 4
  %h = alloca i32, align 4
  store i32 0, i32* %h, align 4
  %t = alloca i32, align 4
  store i32 0, i32* %t, align 4
  br label %while.loop133

if.else128:                                       ; preds = %if.merge117
  br label %if.merge129

if.merge129:                                      ; preds = %if.else128, %while.after135
  %courseNum155 = load i32, i32* %courseNum, align 4
  %temperate156 = add i32 %courseNum155, 1
  store i32 %temperate156, i32* %courseNum, align 4
  %courseNum157 = load i32, i32* %courseNum, align 4
  %arrayElement158 = getelementptr [300 x [100 x i8]], [300 x [100 x i8]]* @courses, i32 0, i32 %courseNum157
  %courses159 = load [100 x i8], [100 x i8]* %arrayElement158, align 1
  %callVal160 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @string.1, i32 0, i32 0), [100 x i8] %courses159)
  %callVal161 = call i32 @getchar()
  br label %while.loop

while.loop133:                                    ; preds = %while.body134, %if.then127
  %t136 = load i32, i32* %t, align 4
  %arrayElement137 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %t136
  %i138 = load i32, i32* %i, align 4
  %arrayElement139 = getelementptr [100 x i8], [100 x i8]* %arrayElement137, i32 0, i32 %i138
  %courseName = load i8, i8* %arrayElement139, align 1
  %cmpNE140 = icmp ne i8 %courseName, 48
  br i1 %cmpNE140, label %while.body134, label %while.after135

while.body134:                                    ; preds = %while.loop133
  %h141 = load i32, i32* %h, align 4
  %temperate142 = mul i32 %h141, 33
  %t143 = load i32, i32* %t, align 4
  %arrayElement144 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %t143
  %i145 = load i32, i32* %i, align 4
  %arrayElement146 = getelementptr [100 x i8], [100 x i8]* %arrayElement144, i32 0, i32 %i145
  %courseName147 = load i8, i8* %arrayElement146, align 1
  %temperate148 = add i32 %temperate142, i8 %courseName147
  store i32 %temperate148, i32* %h, align 4
  %h149 = load i32, i32* %h, align 4
  %temperate150 = srem i32 %h149, 65537
  store i32 %temperate150, i32* %h, align 4
  %t151 = load i32, i32* %t, align 4
  %temperate152 = add i32 %t151, 1
  store i32 %temperate152, i32* %t, align 4
  br label %while.loop133

while.after135:                                   ; preds = %while.loop133
  %h153 = load i32, i32* %h, align 4
  %arrayElement154 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h153
  store i32 1, i32* %arrayElement154, align 4
  br label %if.merge129

if.then164:                                       ; preds = %while.after
  store double 0.000000e+00, double* %GPA, align 8
  br label %if.merge166

if.else165:                                       ; preds = %while.after
  %totalGPA167 = load i32, i32* %totalGPA, align 4
  %castDouble = sitofp i32 %totalGPA167 to double
  %totalAttemptedCredit168 = load i32, i32* %totalAttemptedCredit, align 4
  %castDouble169 = sitofp i32 %totalAttemptedCredit168 to double
  %fDiv = fdiv double %castDouble, %castDouble169
  store double %fDiv, double* %GPA, align 8
  br label %if.merge166

if.merge166:                                      ; preds = %if.else165, %if.then164
  %totalRemainCredit = alloca i32, align 4
  %totalCredit170 = load i32, i32* %totalCredit, align 4
  %totalCompletedCredit171 = load i32, i32* %totalCompletedCredit, align 4
  %temperate172 = sub i32 %totalCredit170, %totalCompletedCredit171
  store i32 %temperate172, i32* %totalRemainCredit, align 4
  %GPA173 = load double, double* %GPA, align 8
  %callVal174 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @string.2, i32 0, i32 0), double %GPA173)
  %totalAttemptedCredit175 = load i32, i32* %totalAttemptedCredit, align 4
  %callVal176 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @string.3, i32 0, i32 0), i32 %totalAttemptedCredit175)
  %totalCompletedCredit177 = load i32, i32* %totalCompletedCredit, align 4
  %callVal178 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @string.4, i32 0, i32 0), i32 %totalCompletedCredit177)
  %totalRemainCredit179 = load i32, i32* %totalRemainCredit, align 4
  %callVal180 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @string.5, i32 0, i32 0), i32 %totalRemainCredit179)
  %callVal181 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @string.6, i32 0, i32 0))
  %totalRemainCredit182 = load i32, i32* %totalRemainCredit, align 4
  %cmpEQ183 = icmp eq i32 %totalRemainCredit182, 0
  br i1 %cmpEQ183, label %if.then184, label %if.else185

if.then184:                                       ; preds = %if.merge166
  %callVal187 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @string.7, i32 0, i32 0))
  br label %if.merge186

if.else185:                                       ; preds = %if.merge166
  %i188 = alloca i32, align 4
  store i32 0, i32* %i188, align 4
  br label %for.loop

if.merge186:                                      ; preds = %for.after, %if.then184
  ret i32 0

for.loop:                                         ; preds = %if.merge219, %if.else185
  %i189 = load i32, i32* %i188, align 4
  %courseNum190 = load i32, i32* %courseNum, align 4
  %cmpLT = icmp slt i32 %i189, %courseNum190
  br i1 %cmpLT, label %for.body, label %for.after

for.body:                                         ; preds = %for.loop
  %h191 = alloca i32, align 4
  store i32 0, i32* %h191, align 4
  %t192 = alloca i32, align 4
  store i32 0, i32* %t192, align 4
  br label %while.loop193

for.after:                                        ; preds = %for.loop
  br label %if.merge186

while.loop193:                                    ; preds = %while.body194, %for.body
  %t196 = load i32, i32* %t192, align 4
  %arrayElement197 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %t196
  %i198 = load i32, i32* %i188, align 4
  %arrayElement199 = getelementptr [100 x i8], [100 x i8]* %arrayElement197, i32 0, i32 %i198
  %courseName200 = load i8, i8* %arrayElement199, align 1
  %cmpNE201 = icmp ne i8 %courseName200, 48
  br i1 %cmpNE201, label %while.body194, label %while.after195

while.body194:                                    ; preds = %while.loop193
  %h202 = load i32, i32* %h191, align 4
  %temperate203 = mul i32 %h202, 33
  %t204 = load i32, i32* %t192, align 4
  %arrayElement205 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %t204
  %i206 = load i32, i32* %i188, align 4
  %arrayElement207 = getelementptr [100 x i8], [100 x i8]* %arrayElement205, i32 0, i32 %i206
  %courseName208 = load i8, i8* %arrayElement207, align 1
  %temperate209 = add i32 %temperate203, i8 %courseName208
  store i32 %temperate209, i32* %h191, align 4
  %h210 = load i32, i32* %h191, align 4
  %temperate211 = srem i32 %h210, 65537
  store i32 %temperate211, i32* %h191, align 4
  %t212 = load i32, i32* %t192, align 4
  %temperate213 = add i32 %t212, 1
  store i32 %temperate213, i32* %t192, align 4
  br label %while.loop193

while.after195:                                   ; preds = %while.loop193
  %h214 = load i32, i32* %h191, align 4
  %arrayElement215 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h214
  %coursePassed = load i32, i32* %arrayElement215, align 4
  %cmpNE216 = icmp ne i32 %coursePassed, 0
  br i1 %cmpNE216, label %if.then217, label %if.else218

if.then217:                                       ; preds = %while.after195
  %i220 = load i32, i32* %i188, align 4
  %callVal221 = call i32 @judge(i32 %i220)
  %cmpEQ222 = icmp eq i32 %callVal221, 1
  br i1 %cmpEQ222, label %if.then223, label %if.else224

if.else218:                                       ; preds = %while.after195
  br label %if.merge219

if.merge219:                                      ; preds = %if.else218, %if.merge225
  %i230 = load i32, i32* %i188, align 4
  %temperate231 = add i32 %i230, 1
  store i32 %temperate231, i32* %i188, align 4
  br label %for.loop

if.then223:                                       ; preds = %if.then217
  %i226 = load i32, i32* %i188, align 4
  %arrayElement227 = getelementptr [8 x [100 x i8]], [8 x [100 x i8]]* @courseName, i32 0, i32 %i226
  %courseName228 = load [100 x i8], [100 x i8]* %arrayElement227, align 1
  %callVal229 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @string.8, i32 0, i32 0), [100 x i8] %courseName228)
  br label %if.merge225

if.else224:                                       ; preds = %if.then217
  br label %if.merge225

if.merge225:                                      ; preds = %if.else224, %if.then223
  br label %if.merge219
}
