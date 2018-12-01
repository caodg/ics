#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void handle(int sig) {
    sigset_t set;
    sigpending(&set);
    printf("is member: %d\n", sigismember(&set, SIGINT));
    kill(getpid(), SIGINT);
    sigpending(&set);
    printf("and now is member: %d\n", sigismember(&set, SIGINT));
    exit(0);
}

int main() {
    signal(SIGINT, handle);
    while (1)
        ;
    return 0;
}
