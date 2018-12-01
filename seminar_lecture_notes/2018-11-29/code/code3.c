#include <signal.h>
#include <stdio.h>
#include <unistd.h>

int a = 0;

void f(int sig) {
    ++a;
    printf("%d\n", a);
    kill(getpid(), SIGTSTP);
    --a;
}

void g(int sig) {
    ++a;
    printf("%d\n", a);
    kill(getpid(), SIGINT);
    --a;
}

int main() {
    signal(SIGINT, f);
    signal(SIGTSTP, g);
    while (1)
        ;
    return 0;
}
