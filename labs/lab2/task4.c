#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int randomInt(int start, int end) {
    int num = (rand() % ((end - 1) - start + 1) + start);
    return num;
}

float randomFloat() {
    float num = (float)rand() / RAND_MAX;
    return num;
}

int main(int argc, char *argv[]) {
    if (argc < 4) {
		printf("Error, try again\n");
		return 1;
	}

    int size = atoi(argv[1]);
    if (size <= 0) {
        printf("The size of the array must be a positive number\n");
        return 1;
    }

    int start = atoi(argv[2]);
    int end = atoi(argv[3]);
    if (start > end) {
        int temp = start;
        start = end;
        end = temp;
    }

    srand(time(NULL));

    float array[size];
    for (int i = 0; i < size; i++) {
        array[i] = randomInt(start, end) + randomFloat();
        printf("%f ", array[i]);
    }

    return 0;
}