#define MaxCourse 100
#define MaxInput 300

#define HASH_MAGIC 33
#define HASH_SIZE 65537

int scanf(char *__format, ...);

int printf(char *__format, ...);

char *gets(char *_Buffer);

char courses[MaxCourse][MaxInput];
char courseName[MaxCourse][8];
char coursePrerequisite[MaxCourse][MaxInput];

// char coursePassed[HASH_SIZE] = {0};
char coursePassed[HASH_SIZE];

// unsigned int hash(const char *s) {
//     unsigned int h = 0;
//     for (const char *p = s; *p; ++p) {
//         h = (h * HASH_MAGIC + *p) % HASH_SIZE;
//     }
//     return h;
// }

int hash(char *s) {
    int h = 0;
    for (char *p = s; *p; ++p) {
        h = (h * HASH_MAGIC + *p) % HASH_SIZE; //
    }
    return h;
}

char judge(int courseIndex) {
    int i, h;
    char ready = 0;
    char state = 0; // 0: init, 1: and

    char *p = coursePrerequisite[courseIndex];
    if (*p == 0) {
        return 1;
    }

    while (*p) {
        char precourse[8];
        i = 0;
        while (*p && *p != ',' && *p != ';') {
            // precourse[i++] = *(p++);
            precourse[i++] = *p;
            p++;
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
    while (1) {
        // read in course information
        gets(courses[courseNum]);
        if (courses[courseNum][0] == '\0') {
            break;
        }

        char *course = courses[courseNum];
        int i, index = 0;

        // course name
        i = 0;
        while (course[index] != '|' && course[index] != '\0') {
            courseName[courseNum][i++] = course[index++];
        }
        courseName[courseNum][i] = 0;
        index++;

        // course credit
        int credit = course[index++] - '0';
        totalCredit += credit;
        index++;

        // prerequisite course
        i = 0;
        while (course[index] != '|' && course[index] != '\0') {
            coursePrerequisite[courseNum][i++] = course[index++];
        }
        coursePrerequisite[courseNum][i] = 0;
        index++;

        // grade
        char gradeChar = course[index];
        int grade = 0;
        // switch (gradeChar) {
        //     case 'A':
        //         grade = 4;
        //         break;
        //     case 'B':
        //         grade = 3;
        //         break;
        //     case 'C':
        //         grade = 2;
        //         break;
        //     case 'D':
        //         grade = 1;
        //         break;
        //     case 'F':
        //         grade = 0;
        //         break;
        //     default:
        //         grade = -1;
        //         break;
        // }
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
            // unsigned int h = hash(courseName[i]);
            int h = hash(courseName[i]);
            if (coursePassed[h]) {
                continue;
            }
// printf("Hi %d %s %d\n", i, courseName[i], (int)coursePassed[h]);
            if (judge(i)) {
                printf("  %s\n", courseName[i]);
            }
        }
    }

    return 0;
}