; ModuleID = 'auto-advisor'
source_filename = "auto-advisor"

@courses = global [300 x [102 x i8]] zeroinitializer
@courseName = global [8 x [102 x i8]] zeroinitializer
@coursePrerequisite = global [300 x [102 x i8]] zeroinitializer
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
  %arrayElement = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index1
  %courseIndex = load i32, i32* %1, align 4
  %arrayElement2 = getelementptr [102 x i8], [102 x i8]* %arrayElement, i32 0, i32 %courseIndex
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

while.loop:                                       ; preds = %if.merge65, %if.merge
  %index3 = load i32, i32* %index, align 4
  %arrayElement4 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index3
  %courseIndex5 = load i32, i32* %1, align 4
  %arrayElement6 = getelementptr [102 x i8], [102 x i8]* %arrayElement4, i32 0, i32 %courseIndex5
  %coursePrerequisite7 = load i8, i8* %arrayElement6, align 1
  %cmpNE = icmp ne i8 %coursePrerequisite7, 48
  br i1 %cmpNE, label %while.body, label %while.after

while.body:                                       ; preds = %while.loop
  %precourse = alloca [8 x i8], align 1
  store i32 0, i32* %i, align 4
  br label %while.loop8

while.after:                                      ; preds = %while.loop

while.loop8:                                      ; preds = %while.body9, %while.body
  %index11 = load i32, i32* %index, align 4
  %arrayElement12 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index11
  %courseIndex13 = load i32, i32* %1, align 4
  %arrayElement14 = getelementptr [102 x i8], [102 x i8]* %arrayElement12, i32 0, i32 %courseIndex13
  %coursePrerequisite15 = load i8, i8* %arrayElement14, align 1
  %cmpNE16 = icmp ne i8 %coursePrerequisite15, 48
  %index17 = load i32, i32* %index, align 4
  %arrayElement18 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index17
  %courseIndex19 = load i32, i32* %1, align 4
  %arrayElement20 = getelementptr [102 x i8], [102 x i8]* %arrayElement18, i32 0, i32 %courseIndex19
  %coursePrerequisite21 = load i8, i8* %arrayElement20, align 1
  %cmpNE22 = icmp ne i8 %coursePrerequisite21, 44
  %temperate = add i1 %cmpNE16, %cmpNE22
  %index23 = load i32, i32* %index, align 4
  %arrayElement24 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index23
  %courseIndex25 = load i32, i32* %1, align 4
  %arrayElement26 = getelementptr [102 x i8], [102 x i8]* %arrayElement24, i32 0, i32 %courseIndex25
  %coursePrerequisite27 = load i8, i8* %arrayElement26, align 1
  %cmpNE28 = icmp ne i8 %coursePrerequisite27, 59
  %temperate29 = add i1 %temperate, %cmpNE28
  br i1 %temperate29, label %while.body9, label %while.after10

while.body9:                                      ; preds = %while.loop8
  %index30 = load i32, i32* %index, align 4
  %arrayElement31 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index30
  %courseIndex32 = load i32, i32* %1, align 4
  %arrayElement33 = getelementptr [102 x i8], [102 x i8]* %arrayElement31, i32 0, i32 %courseIndex32
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
  store i32 0, i8* %arrayElement42, align 4
  %h43 = alloca i32, align 4
  store i32 0, i32* %h43, align 4
  %t = alloca i32, align 4
  store i32 0, i32* %t, align 4
  br label %while.loop44

while.loop44:                                     ; preds = %while.body45, %while.after10
  %t47 = load i32, i32* %t, align 4
  %arrayElement48 = getelementptr [8 x i8], [8 x i8]* %precourse, i32 0, i32 %t47
  %precourse49 = load i8, i8* %arrayElement48, align 1
  %cmpNE50 = icmp ne i8 %precourse49, 48
  br i1 %cmpNE50, label %while.body45, label %while.after46

while.body45:                                     ; preds = %while.loop44
  %h51 = load i32, i32* %h43, align 4
  %temperate52 = mul i32 %h51, 33
  %t53 = load i32, i32* %t, align 4
  %arrayElement54 = getelementptr [8 x i8], [8 x i8]* %precourse, i32 0, i32 %t53
  %precourse55 = load i8, i8* %arrayElement54, align 1
  %temperate56 = add i32 %temperate52, i8 %precourse55
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
  %index68 = load i32, i32* %index, align 4
  %arrayElement69 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index68
  %courseIndex70 = load i32, i32* %1, align 4
  %arrayElement71 = getelementptr [102 x i8], [102 x i8]* %arrayElement69, i32 0, i32 %courseIndex70
  %coursePrerequisite72 = load i8, i8* %arrayElement71, align 1
  %cmpEQ73 = icmp eq i8 %coursePrerequisite72, 59
  br i1 %cmpEQ73, label %if.then74, label %if.else75

if.else64:                                        ; preds = %while.after46
  %state95 = load i32, i32* %state, align 4
  %cmpEQ96 = icmp eq i32 %state95, 1
  br i1 %cmpEQ96, label %if.then97, label %if.else98

if.merge65:                                       ; preds = %if.merge99, %if.merge76
  br label %while.loop

if.then74:                                        ; preds = %if.then63
  %ready77 = load i32, i32* %ready, align 4
  br i32 %ready77, label %if.then78, label %if.else79

if.else75:                                        ; preds = %if.then63
  %index83 = load i32, i32* %index, align 4
  %arrayElement84 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index83
  %courseIndex85 = load i32, i32* %1, align 4
  %arrayElement86 = getelementptr [102 x i8], [102 x i8]* %arrayElement84, i32 0, i32 %courseIndex85
  %coursePrerequisite87 = load i8, i8* %arrayElement86, align 1
  %cmpEQ88 = icmp eq i8 %coursePrerequisite87, 44
  br i1 %cmpEQ88, label %if.then89, label %if.else90

if.merge76:                                       ; preds = %if.merge91, %if.merge80
  br label %if.merge65

if.then78:                                        ; preds = %if.then74
  ret i32 1
  br label %if.merge80

if.else79:                                        ; preds = %if.then74
  store i32 0, i32* %state, align 4
  store i32 0, i32* %ready, align 4
  br label %if.merge80

if.merge80:                                       ; preds = %if.else79, %if.then78
  %index81 = load i32, i32* %index, align 4
  %temperate82 = add i32 %index81, 1
  store i32 %temperate82, i32* %index, align 4
  br label %if.merge76

if.then89:                                        ; preds = %if.else75
  store i32 1, i32* %state, align 4
  %index92 = load i32, i32* %index, align 4
  %temperate93 = add i32 %index92, 1
  store i32 %temperate93, i32* %index, align 4
  br label %if.merge91

if.else90:                                        ; preds = %if.else75
  %ready94 = load i32, i32* %ready, align 4
  ret i32 %ready94
  br label %if.merge91

if.merge91:                                       ; preds = %if.else90, %if.then89
  br label %if.merge76

if.then97:                                        ; preds = %if.else64
  %ready100 = load i32, i32* %ready, align 4
  %h101 = load i32, i32* %h43, align 4
  %arrayElement102 = getelementptr [65537 x i32], [65537 x i32]* @coursePassed, i32 0, i32 %h101
  %coursePassed103 = load i32, i32* %arrayElement102, align 4
  %temperate104 = and i32 %ready100, %coursePassed103
  store i32 %temperate104, i32* %ready, align 4
  %index105 = load i32, i32* %index, align 4
  %arrayElement106 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index105
  %courseIndex107 = load i32, i32* %1, align 4
  %arrayElement108 = getelementptr [102 x i8], [102 x i8]* %arrayElement106, i32 0, i32 %courseIndex107
  %coursePrerequisite109 = load i8, i8* %arrayElement108, align 1
  %cmpEQ110 = icmp eq i8 %coursePrerequisite109, 59
  br i1 %cmpEQ110, label %if.then111, label %if.else112

if.else98:                                        ; preds = %if.else64
  br label %if.merge99

if.merge99:                                       ; preds = %if.else98, %if.merge113
  br label %if.merge65

if.then111:                                       ; preds = %if.then97
  %ready114 = load i32, i32* %ready, align 4
  br i32 %ready114, label %if.then115, label %if.else116

if.else112:                                       ; preds = %if.then97
  %index120 = load i32, i32* %index, align 4
  %arrayElement121 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %index120
  %courseIndex122 = load i32, i32* %1, align 4
  %arrayElement123 = getelementptr [102 x i8], [102 x i8]* %arrayElement121, i32 0, i32 %courseIndex122
  %coursePrerequisite124 = load i8, i8* %arrayElement123, align 1
  %cmpEQ125 = icmp eq i8 %coursePrerequisite124, 44
  br i1 %cmpEQ125, label %if.then126, label %if.else127

if.merge113:                                      ; preds = %if.merge128, %if.merge117
  br label %if.merge99

if.then115:                                       ; preds = %if.then111
  ret i32 1
  br label %if.merge117

if.else116:                                       ; preds = %if.then111
  store i32 0, i32* %state, align 4
  store i32 0, i32* %ready, align 4
  br label %if.merge117

if.merge117:                                      ; preds = %if.else116, %if.then115
  %index118 = load i32, i32* %index, align 4
  %temperate119 = add i32 %index118, 1
  store i32 %temperate119, i32* %index, align 4
  br label %if.merge113

if.then126:                                       ; preds = %if.else112
  store i32 1, i32* %state, align 4
  %index129 = load i32, i32* %index, align 4
  %temperate130 = add i32 %index129, 1
  store i32 %temperate130, i32* %index, align 4
  br label %if.merge128

if.else127:                                       ; preds = %if.else112
  %ready131 = load i32, i32* %ready, align 4
  ret i32 %ready131
  br label %if.merge128

if.merge128:                                      ; preds = %if.else127, %if.then126
  br label %if.merge113
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
  %arrayElement = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %courseNum1
  %courses = load [102 x i8], [102 x i8]* %arrayElement, align 1
  %callVal = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @string, i32 0, i32 0), [102 x i8] %courses)
  %callVal2 = call i32 @getchar()
  br label %while.loop

while.loop:                                       ; preds = %if.merge129, %entry
  %courseNum3 = load i32, i32* %courseNum, align 4
  %arrayElement4 = getelementptr [102 x i8], [102 x i8]* getelementptr inbounds ([300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 0), i32 0, i32 %courseNum3
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
  %arrayElement10 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %index9
  %courseNum11 = load i32, i32* %courseNum, align 4
  %arrayElement12 = getelementptr [102 x i8], [102 x i8]* %arrayElement10, i32 0, i32 %courseNum11
  %courses13 = load i8, i8* %arrayElement12, align 1
  %cmpNE14 = icmp ne i8 %courses13, 124
  %index15 = load i32, i32* %index, align 4
  %arrayElement16 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %index15
  %courseNum17 = load i32, i32* %courseNum, align 4
  %arrayElement18 = getelementptr [102 x i8], [102 x i8]* %arrayElement16, i32 0, i32 %courseNum17
  %courses19 = load i8, i8* %arrayElement18, align 1
  %cmpNE20 = icmp ne i8 %courses19, 48
  %temperate = add i1 %cmpNE14, %cmpNE20
  br i1 %temperate, label %while.body7, label %while.after8

while.body7:                                      ; preds = %while.loop6
  %index21 = load i32, i32* %index, align 4
  %arrayElement22 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %index21
  %courseNum23 = load i32, i32* %courseNum, align 4
  %arrayElement24 = getelementptr [102 x i8], [102 x i8]* %arrayElement22, i32 0, i32 %courseNum23
  %courses25 = load i8, i8* %arrayElement24, align 1
  %i26 = load i32, i32* %i, align 4
  %arrayElement27 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %i26
  %courseNum28 = load i32, i32* %courseNum, align 4
  %arrayElement29 = getelementptr [102 x i8], [102 x i8]* %arrayElement27, i32 0, i32 %courseNum28
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
  %arrayElement35 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %i34
  %courseNum36 = load i32, i32* %courseNum, align 4
  %arrayElement37 = getelementptr [102 x i8], [102 x i8]* %arrayElement35, i32 0, i32 %courseNum36
  store i32 0, i8* %arrayElement37, align 4
  %index38 = load i32, i32* %index, align 4
  %temperate39 = add i32 %index38, 1
  store i32 %temperate39, i32* %index, align 4
  %credit = alloca i32, align 4
  %index40 = load i32, i32* %index, align 4
  %arrayElement41 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %index40
  %courseNum42 = load i32, i32* %courseNum, align 4
  %arrayElement43 = getelementptr [102 x i8], [102 x i8]* %arrayElement41, i32 0, i32 %courseNum42
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
  %arrayElement57 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %index56
  %courseNum58 = load i32, i32* %courseNum, align 4
  %arrayElement59 = getelementptr [102 x i8], [102 x i8]* %arrayElement57, i32 0, i32 %courseNum58
  %courses60 = load i8, i8* %arrayElement59, align 1
  %cmpNE61 = icmp ne i8 %courses60, 124
  %index62 = load i32, i32* %index, align 4
  %arrayElement63 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %index62
  %courseNum64 = load i32, i32* %courseNum, align 4
  %arrayElement65 = getelementptr [102 x i8], [102 x i8]* %arrayElement63, i32 0, i32 %courseNum64
  %courses66 = load i8, i8* %arrayElement65, align 1
  %cmpNE67 = icmp ne i8 %courses66, 48
  %temperate68 = add i1 %cmpNE61, %cmpNE67
  br i1 %temperate68, label %while.body54, label %while.after55

while.body54:                                     ; preds = %while.loop53
  %index69 = load i32, i32* %index, align 4
  %arrayElement70 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %index69
  %courseNum71 = load i32, i32* %courseNum, align 4
  %arrayElement72 = getelementptr [102 x i8], [102 x i8]* %arrayElement70, i32 0, i32 %courseNum71
  %courses73 = load i8, i8* %arrayElement72, align 1
  %i74 = load i32, i32* %i, align 4
  %arrayElement75 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %i74
  %courseNum76 = load i32, i32* %courseNum, align 4
  %arrayElement77 = getelementptr [102 x i8], [102 x i8]* %arrayElement75, i32 0, i32 %courseNum76
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
  %arrayElement83 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @coursePrerequisite, i32 0, i32 %i82
  %courseNum84 = load i32, i32* %courseNum, align 4
  %arrayElement85 = getelementptr [102 x i8], [102 x i8]* %arrayElement83, i32 0, i32 %courseNum84
  store i32 0, i8* %arrayElement85, align 4
  %index86 = load i32, i32* %index, align 4
  %temperate87 = add i32 %index86, 1
  store i32 %temperate87, i32* %index, align 4
  %gradeChar = alloca i8, align 1
  %index88 = load i32, i32* %index, align 4
  %arrayElement89 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %index88
  %courseNum90 = load i32, i32* %courseNum, align 4
  %arrayElement91 = getelementptr [102 x i8], [102 x i8]* %arrayElement89, i32 0, i32 %courseNum90
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
  %arrayElement158 = getelementptr [300 x [102 x i8]], [300 x [102 x i8]]* @courses, i32 0, i32 %courseNum157
  %courses159 = load [102 x i8], [102 x i8]* %arrayElement158, align 1
  %callVal160 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @string.1, i32 0, i32 0), [102 x i8] %courses159)
  %callVal161 = call i32 @getchar()
  br label %while.loop

while.loop133:                                    ; preds = %while.body134, %if.then127
  %t136 = load i32, i32* %t, align 4
  %arrayElement137 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %t136
  %courseNum138 = load i32, i32* %courseNum, align 4
  %arrayElement139 = getelementptr [102 x i8], [102 x i8]* %arrayElement137, i32 0, i32 %courseNum138
  %courseName = load i8, i8* %arrayElement139, align 1
  %cmpNE140 = icmp ne i8 %courseName, 48
  br i1 %cmpNE140, label %while.body134, label %while.after135

while.body134:                                    ; preds = %while.loop133
  %h141 = load i32, i32* %h, align 4
  %temperate142 = mul i32 %h141, 33
  %t143 = load i32, i32* %t, align 4
  %arrayElement144 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %t143
  %courseNum145 = load i32, i32* %courseNum, align 4
  %arrayElement146 = getelementptr [102 x i8], [102 x i8]* %arrayElement144, i32 0, i32 %courseNum145
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
  store i32 0, double* %GPA, align 4
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

for.loop:                                         ; preds = %if.merge223, %if.else185
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
  %arrayElement197 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %t196
  %i198 = load i32, i32* %i188, align 4
  %arrayElement199 = getelementptr [102 x i8], [102 x i8]* %arrayElement197, i32 0, i32 %i198
  %courseName200 = load i8, i8* %arrayElement199, align 1
  %cmpNE201 = icmp ne i8 %courseName200, 48
  br i1 %cmpNE201, label %while.body194, label %while.after195

while.body194:                                    ; preds = %while.loop193
  %h202 = load i32, i32* %h191, align 4
  %temperate203 = mul i32 %h202, 33
  %t204 = load i32, i32* %t192, align 4
  %arrayElement205 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %t204
  %i206 = load i32, i32* %i188, align 4
  %arrayElement207 = getelementptr [102 x i8], [102 x i8]* %arrayElement205, i32 0, i32 %i206
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
  br i32 %coursePassed, label %if.then216, label %if.else217

if.then216:                                       ; preds = %while.after195
  br label %if.merge218

if.else217:                                       ; preds = %while.after195
  br label %if.merge218

if.merge218:                                      ; preds = %if.else217, %if.then216
  %i219 = load i32, i32* %i188, align 4
  %callVal220 = call i32 @judge(i32 %i219)
  br i32 %callVal220, label %if.then221, label %if.else222

if.then221:                                       ; preds = %if.merge218
  %i224 = load i32, i32* %i188, align 4
  %arrayElement225 = getelementptr [8 x [102 x i8]], [8 x [102 x i8]]* @courseName, i32 0, i32 %i224
  %courseName226 = load [102 x i8], [102 x i8]* %arrayElement225, align 1
  %callVal227 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @string.8, i32 0, i32 0), [102 x i8] %courseName226)
  br label %if.merge223

if.else222:                                       ; preds = %if.merge218
  br label %if.merge223

if.merge223:                                      ; preds = %if.else222, %if.then221
  %i228 = load i32, i32* %i188, align 4
  %temperate229 = add i32 %i228, 1
  store i32 %temperate229, i32* %i188, align 4
  br label %for.loop
}
