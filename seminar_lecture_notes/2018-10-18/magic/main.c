#include <stdio.h>
#define STACK_SIZE 4096

extern long magic(void *foo, long arg) asm("magic");
extern long p(long depth) asm("p");
long s[STACK_SIZE] asm("s");
long *top asm("top");

void magic_init() { top = s + STACK_SIZE; }

int main() {
    magic_init();
    magic(p, 7);
    return 0;
}
