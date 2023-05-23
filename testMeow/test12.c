int scanf(char *__format, ...);

int printf(char *__format, ...);

int getchar();

int putchar(int __c);

char buffer[302];

int readLine() {
    int i = 0;
    buffer[i] = (char)getchar();
    while (buffer[i] != '\n') {
        printf("c = %c\n", buffer[i]);
        ++i;
        buffer[i] = (char)getchar();
    }
    buffer[i] = '\0';
    return i;
}

int printLine() {
    int i = 0;
    while ((int)buffer[i] != 0) {
        putchar((int)buffer[i]);
        ++i;
    }
    putchar((int)'\n');
    return i;
}

int main() {
    readLine();
    printLine();
    return (int)buffer[0];
}