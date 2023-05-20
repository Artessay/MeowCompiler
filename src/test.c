int add(int a, int b) {
    return a + b;
}

int main() {
    int a[20];
    a[0] = 4;
    a[1] = add(1, 2);

    return a[1];
}