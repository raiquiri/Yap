#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
		printf("Error, try again\n");
		return 1;
	}

    int size = atoi(argv[1]);
    if (size <= 0) {
        printf("The size of the array must be a positive number\n");
        return 1;
    }

    srand(time(NULL));

    float array[size];
    for (int i = 0; i < size; i++) {
        array[i] = (float)rand() / RAND_MAX;
        printf("%f ", array[i]);
    }

    return 0;
}