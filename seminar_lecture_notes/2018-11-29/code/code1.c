#include <stdio.h>
#include <unistd.h>

int main() {
    printf("A");
    if (fork() == 0) {
        printf("B");
    } else {
        printf("C");
    }
    return 0;
}
