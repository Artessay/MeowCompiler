int scanf(char *__format, ...);

int printf(char *__format, ...);

#define MaxCourse 102
#define MaxInput 302

#define HASH_MAGIC 33
#define HASH_SIZE 65537

char courses[MaxCourse][MaxInput];
char courseName[MaxCourse][MaxInput];
char coursePrerequisite[MaxCourse][MaxInput];

int coursePassed[HASH_SIZE];

int getchar();

int putchar(int __c);

char buffer[302];

int readLine() {
    int i = 0;
    buffer[i] = (char)getchar();
    while (buffer[i] != (char)10) {
        ++i;
        buffer[i] = (char)getchar();
    }
    buffer[i] = (char)0;
    return i;
}

int printLine() {
    int i = 0;
    while ((int)buffer[i] != 0) {
        putchar((int)buffer[i]);
        ++i;
    }
    putchar(10);
    return i;
}

int judge(int courseIndex) {
    int i, h;
    int ready = 0;
    int state = 0; // 0: init, 1: and

    // char *p = coursePrerequisite[courseIndex];
    int index = 0;
    if (coursePrerequisite[courseIndex][index] == (char)0) {
        return 1;
    }

    while (coursePrerequisite[courseIndex][index] != (char)0) {
        char precourse[8];
        i = 0;
        while (coursePrerequisite[courseIndex][index] != (char)0
            && coursePrerequisite[courseIndex][index] != (char)44 
            && coursePrerequisite[courseIndex][index] != (char)59) {
                
            precourse[i] = coursePrerequisite[courseIndex][index];
            ++i;
            ++index;
        }
        precourse[i] = (char)0;

        // hash
        int h = 0;
        int t = 0;
        while (precourse[t] != (char)0) {
            h = h * HASH_MAGIC + (int)precourse[t];
            h = h % 65537;
            ++t;
        }

        if (state == 0) {
            ready = coursePassed[h];
            if (coursePrerequisite[courseIndex][index] == (char)59) {
                if (ready == 1) {
                    return 1;
                } else {
                    state = 0;
                    ready = 0;
                }
                ++index;
            } else if (coursePrerequisite[courseIndex][index] == (char)44) {
                state = 1;
                ++index;
            } else {
                return ready;
            }
        } else if (state == 1) {
            if (ready == 1 && coursePassed[h] == 1) {
                ready = 1;
            } else {
                ready = 0;
            }

            if (coursePrerequisite[courseIndex][index] == (char)59) {
                if (ready == 1) {
                    return 1;
                } else {
                    state = 0;
                    ready = 0;
                }
                ++index;
            } else if (coursePrerequisite[courseIndex][index] == (char)44) {
                state = 1;
                ++index;
            } else {
                return ready;
            }
        }
    }

    return 0;
}

int main() {
    int courseNum = 0;

    int totalCredit = 0;
    int totalGPA = 0;
    int totalAttemptedCredit = 0;
    int totalCompletedCredit = 0;

    // scanf("%[^\n]s", courses[courseNum]); getchar();
    int len = readLine();
    int ii = 0;
    while (buffer[ii] != (char)0) {
        courses[courseNum][ii] = buffer[ii];
        ++ii;
    }
    courses[courseNum][ii] = (char)0;

    while (len != 0) {
        int i, index = 0;

        // course name
        i = 0;
        while ((int)buffer[index] != 124 && (int)buffer[index] != 0) {
            courseName[courseNum][i] = buffer[index];
            ++i;
            ++index;
        }
        courseName[courseNum][i] = (char)0;
        ++index;

        // course credit
        int credit = (int)(buffer[index] - (char)48);
        
        ++index;
        totalCredit += credit;
        ++index;

        // prerequisite course
        i = 0;
        while (buffer[index] != (char)124 && buffer[index] != (char)0) {
            coursePrerequisite[courseNum][i] = buffer[index];
            ++i; ++index;
        }
        coursePrerequisite[courseNum][i] = (char)0;
        ++index;

        // grade
        int gradeChar = (int)buffer[index];
        int grade = -1;
        if (gradeChar == 65){
            grade = 4;
        }
        else if(gradeChar == 66){
            grade = 3;
        }
        else if(gradeChar == 67){
            grade = 2;
        }
        else if(gradeChar == 68){
            grade = 1;
        }
        else if(gradeChar == 70){
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
            while (courseName[courseNum][t] != (char)0) {
                h = h * HASH_MAGIC + (int)courseName[courseNum][t];
                h = h % 65537;
                ++t;
            }
            // printf("course passed %d\n", h);
            coursePassed[h] = 1;
        }

        ++courseNum;
        // scanf("%[^\n]s", courses[courseNum]); getchar();

        len = readLine();
        ii = 0;
        while (buffer[ii] != (char)0) {
            courses[courseNum][ii] = buffer[ii];
            ++ii;
        }
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
            while (courseName[i][t] != (char)0) {
                h = h * HASH_MAGIC + (int)courseName[i][t];
                h = h % 65537;
                ++t;
            }

            if (coursePassed[h] == 1) {
                continue;
            }

            if (judge(i) == 1) {
                printf("  ");
                int ii = 0;
                while (courseName[i][ii] != (char)0) {
                    buffer[ii] = courseName[i][ii];
                    ++ii;
                }
                buffer[ii] = (char)0;
                printLine();
            }
        }
    }
    
    return 0;
}