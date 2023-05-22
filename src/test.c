int scanf(char *__format, ...);

int printf(char *__format, ...);

char courses[100][300];
char courseName[100][8];
char coursePrerequisite[100][300];

int coursePassed[65537];

// int hash(char *s) {
//     int h = 0;
//     // for (char *p = s; *p; ++p) {
//     //     h = (h * 33 + *p) % 65537;
//     // }
//     return h;
// }

int judge(int courseIndex) {
    int i, h;
    int ready = 0;
    int state = 0; // 0: init, 1: and

    // char *p = coursePrerequisite[courseIndex];
    int index = 0;
    if (coursePrerequisite[courseIndex][index] == '\0') {
        return 1;
    }

    while (coursePrerequisite[courseIndex][index] != '\0') {
        char precourse[8];
        i = 0;
        while (coursePrerequisite[courseIndex][index] 
            && coursePrerequisite[courseIndex][index] != ',' 
            && coursePrerequisite[courseIndex][index] != ';'
        ) {
            precourse[i] = coursePrerequisite[courseIndex][index];
            ++i;
            ++index;
        }
        precourse[i] = '\0';

        h = 0;
        int t = 0;
        while (courseName[i][t] != '\0') {
            h = h * 33 + courseName[i][t];
            h = h % 65537;
            ++t;
        }

        if (state == 0) {
            ready = coursePassed[h];
            if (coursePrerequisite[courseIndex][index] == ';') {
                if (ready) {
                    return 1;
                } else {
                    state = 0;
                    ready = 0;
                }
                ++index;
            } else if (coursePrerequisite[courseIndex][index] == ',') {
                state = 1;
                ++index;
            } else {
                return ready;
            }
        } else if (state == 1) {
            ready &= coursePassed[h];
            if (coursePrerequisite[courseIndex][index] == ';') {
                if (ready) {
                    return 1;
                } else {
                    state = 0;
                    ready = 0;
                }
                ++index;
            } else if (coursePrerequisite[courseIndex][index] == ',') {
                state = 1;
                ++index;
            } else {
                return ready;
            }
        }
    }

    return 1;
}

int main() {
    int courseNum = 0;

    int totalCredit = 0;
    int totalGPA = 0;
    int totalAttemptedCredit = 0;
    int totalCompletedCredit = 0;

    scanf("%[^\n]s", courses[courseNum]);
    while (courses[courseNum][0] != '\0') {
        // read in course information

        // char *course = courses[courseNum];
        int i, index = 0;

        // course name
        i = 0;
        while (courses[courseNum][index] != '|' && courses[courseNum][index] != '\0') {
            courseName[courseNum][i] = courses[courseNum][index];
            ++i;
            ++index;
        }
        courseName[courseNum][i] = '\0';
        ++index;

        // course credit
        int credit = courses[courseNum][index] - '0';
        ++index;
        totalCredit += credit;
        ++index;

        // prerequisite course
        i = 0;
        while (courses[courseNum][index] != '|' && courses[courseNum][index] != '\0') {
            coursePrerequisite[courseNum][i] = courses[courseNum][index];
            ++i; ++index;
        }
        coursePrerequisite[courseNum][i] = '\0';
        ++index;

        // grade
        char gradeChar = courses[courseNum][index];
        int grade;
        grade = -1;
        if (gradeChar == 'A'){
            grade = 4;
        }
        else if(gradeChar == 'B'){
            grade = 3;
        }
        else if(gradeChar == 'C'){
            grade = 2;
        }
        else if(gradeChar == 'D'){
            grade = 1;
        }
        else if(gradeChar == 'F'){
            grade = 0;
        }
        if (grade >= 0) {
            totalAttemptedCredit += credit;
            totalGPA += credit * grade;
        }
            
        if (grade > 0) {
            totalCompletedCredit += credit;
            
            // hash
            int h = 0;
            int t = 0;
            while (courseName[i][t] != '\0') {
                h = h * 33 + courseName[i][t];
                h = h % 65537;
                ++t;
            }

            coursePassed[h] = 1;
        }

        ++courseNum;

        scanf("%[^\n]s", courses[courseNum]);
    }

    double GPA;
    if (totalAttemptedCredit == 0){
        GPA = 0.0;
    }
    else{
        GPA = (double)totalGPA / (double)totalAttemptedCredit;
    }
    int totalRemainCredit = totalCredit - totalCompletedCredit;

    printf("GPA: %.1f\n", GPA);
    printf("Hours Attempted: %d\n", totalAttemptedCredit);
    printf("Hours Completed: %d\n", totalCompletedCredit);
    printf("Credits Remaining: %d\n", totalRemainCredit);

    printf("\nPossible Courses to Take Next\n");
    if (totalRemainCredit == 0) {
        printf("  None - Congratulations!\n");
    } else {
        for (int i = 0; i < courseNum; ++i) {
            // hash
            int h = 0;
            int t = 0;
            while (courseName[i][t] != '\0') {
                h = h * 33 + courseName[i][t];
                h = h % 65537;
                ++t;
            }

            if (coursePassed[h] != 0) {
                if (judge(i) == 1) {
                    printf("  %s\n", courseName[i]);
                }
            }
        }
    }

    return 0;
}