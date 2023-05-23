int scanf(char *__format, ...);

int printf(char *__format, ...);

int getchar();

char courses[102];

int main() {
    // int courseNum = 0;

    char *p = (char *)courses;
    scanf("%[^\n]s", p); getchar();
    
    printf("%s\n", courses);

    return 0;
}