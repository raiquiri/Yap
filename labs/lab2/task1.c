#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int size;
    printf("Enter the array size\n");
    scanf("%d", &size);

    srand(time(NULL));

    int array[size];
    for (int i = 0; i < size; i++) {
        array[i] = rand()%100;
        printf("%d ", array[i]);
    }

    return 0;
}