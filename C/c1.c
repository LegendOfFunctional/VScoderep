#include <stdio.h>

int main() {
    int variable = 10; 
    int *ptr = &variable;
    printf("Original Value: %d\n", variable);
    printf("Address of variable: %p\n", &variable);
    *ptr = 18;
    printf("Updated Value: %d\n", variable);

    return 0;
}
