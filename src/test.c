int scanf(char *__format, ...);

int printf(char *__format, ...);

#define MaxN 102

char courses[MaxN][MaxN];

int main() {
    courses[3][4] = 'a';

    return (int)courses[3][4];
}