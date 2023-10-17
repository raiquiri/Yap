#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    FILE *output_file;
    int size;
    printf("Enter the array size\n");
    scanf("%d", &size);

    srand(time(NULL));

    int array[size];
    for (int i = 0; i < size; i++) {
        array[i] = rand()%100;
    }

    output_file = fopen("task2_o", "w");
    if(output_file == NULL) {
		printf("Error, can`t create file\n");
		return 1;
	}

    for (int i = 0; i < size; i++) {
        fprintf(output_file, "%d ", array[size-i-1]);
    }

    fclose(output_file);
    return 0;
}