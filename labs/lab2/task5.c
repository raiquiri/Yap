#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[100];
    float price;
} Product;

int compare(const void *x1, const void *x2) {
    Product *product_x1 = (Product*) x1;
    Product *product_x2 = (Product*) x2;
     if (product_x1->price < product_x2->price) {
        return -1;
    }
    else if (product_x1->price > product_x2->price) {
        return 1;
    }
    else {
        return 0;
    }
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
		printf("Error, try again\n");
		return 1;
	}

    FILE *inputFile, *outputFile;
    char line[100];
    
    inputFile = fopen(argv[1], "r");
    if (inputFile == NULL) {
        printf("Can`t open file\n");
        return 1;
    }

    outputFile = fopen(argv[2], "w");
    if (outputFile == NULL) {
        printf("Can`t create file\n");
        fclose(inputFile);
        return 1;
    }

    int numLines = 0;
    while (fgets(line, 100, inputFile) != NULL) {
        numLines++;
    }

    rewind(inputFile);

    Product product[numLines];
    int numProduct = 0;
    while (fscanf(inputFile, "%s %f", product[numProduct].name, &product[numProduct].price) == 2) {
        numProduct++;
    }

    qsort(product, numProduct, sizeof(Product), compare);

    for (int i = 0; i < numProduct; i++) {
        fprintf(outputFile, "%s %.1f\n", product[i].name, product[i].price);
    }

    fclose(inputFile);
    fclose(outputFile);

    return 0;
}