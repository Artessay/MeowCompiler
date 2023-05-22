int scanf(char *__format, ...);

int printf(char *__format, ...);

char courses[100][300];
char courseName[100][8];
char coursePrerequisite[100][300];

int coursePassed[65537];

int hash(char *s) {
    int h = 0;
    for (char *p = s; *p; ++p) {
        h = (h * 33 + *p) % 65537;
    }
    return h;
}

int judge(int courseIndex) {
    int i, h;
    int ready = 0;
    int state = 0; // 0: init, 1: and

    char *p = coursePrerequisite[courseIndex];
    if (*p == 0) {
        return 1;
    }

    while (*p) {
        char precourse[8];
        i = 0;
        while (*p && *p != ',' && *p != ';') {
            precourse[i] = *p;
            ++i;
            ++p;
        }
        precourse[i] = 0;
        h = hash(precourse);
        if (state == 0) {
            ready = coursePassed[h];
            if (*p == ';') {
                if (ready) {
                    return 1;
                } else {
                    state = 0;
                    ready = 0;
                }
                ++p;
            } else if (*p == ',') {
                state = 1;
                ++p;
            } else {
                return ready;
            }
        } else if (state == 1) {
            ready &= coursePassed[h];
            if (*p == ';') {
                if (ready) {
                    return 1;
                } else {
                    state = 0;
                    ready = 0;
                }
                ++p;
            } else if (*p == ',') {
                state = 1;
                ++p;
            } else {
                return ready;
            }
        }
    }
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

        char *course = courses[courseNum];
        int i, index = 0;

        // course name
        i = 0;
        while (course[index] != '|' && course[index] != '\0') {
            courseName[courseNum][i] = course[index];
            ++i;
            ++index;
        }
        courseName[courseNum][i] = 0;
        ++index;

        // course credit
        int credit = course[index] - '0';
        ++index;
        totalCredit += credit;
        ++index;

        // prerequisite course
        i = 0;
        while (course[index] != '|' && course[index] != '\0') {
            coursePrerequisite[courseNum][i] = course[index];
            ++i; ++index;
        }
        coursePrerequisite[courseNum][i] = 0;
        ++index;

        // grade
        char gradeChar = course[index];
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
            int h = hash(courseName[courseNum]);
            coursePassed[h] = 1;
        }

        ++courseNum;

        scanf("%[^\n]s", courses[courseNum]);
    }

    // double GPA = totalAttemptedCredit == 0 ? 0 : (double)totalGPA / (double)totalAttemptedCredit;
    double GPA;
    if (totalAttemptedCredit == 0){
        GPA = 0;
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
            int h = hash(courseName[i]);
            if (coursePassed[h] != 0) {
                if (judge(i) == 1) {
                    printf("  %s\n", courseName[i]);
                }
            }
        }
    }

    return 0;
}