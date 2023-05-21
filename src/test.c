// #define MaxN 10000

// int scanf(char *__format, ...);

int printf(char *__format, ...);

int getchar();

// int array[10000];
int arr[10];

int quickSort(int left, int right) {
    printf("\nquickSort %d %d\n", left, right);

    int i = left, j = right;
    int mid = (left + right) / 2;
    int pivot = arr[mid];

    printf("before while loop\n");

    while (i <= j) {
        printf("%d %d\n", i, j);
        while (arr[i] < pivot){
            // ++i;
            i = i + 1;
        }

        while (arr[j] > pivot){
            // --j;
            printf("j %d arr[j] %d pivot %d\n", j, arr[j], pivot);
            j = j - 1;
            printf("j %d arr[j] %d pivot %d\n", j, arr[j], pivot);
        }
        
        printf("now %d %d\n", i, j);
        if (i <= j) {
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
            // ++i; --j;
            i = i + 1;
            j = j - 1;
        }
    }

    printf("after while loop\n");

    
        getchar();

    if (left < j){
        quickSort(left, j);
    }
    if (i < right){
        quickSort(i, right);
    }

    return 0;
}

int main() {

    int n = 4;

    arr[0] = 3; 
    arr[1] = 6;
    arr[2] = 5;
    arr[3] = 9;
    // arr[4] = 2;
    // arr[5] = 1;
    // arr[6] = 0;
    // arr[7] = 4;
    // arr[8] = 8;
    // arr[9] = 7;

    printf("before quicksort\n");

    quickSort(0, n - 1);

    printf("after quicksort\n");

    for (int i = 0; i < n; i = i + 1) {
        printf("%d\n", arr[i]);
    }

    printf("end\n");

    return 0;
}