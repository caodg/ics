#include <signal.h>
#include <stdio.h>
#include <unistd.h>

#define READ_RSP(val) asm("movq %%rsp, %0" : "=r"(val))

void sigusr1_handle(int sig) {
    long rsp;
    READ_RSP(rsp);
    printf("sigusr1_handle rsp 0x%lx\n", rsp);
    kill(getpid(), SIGUSR2);
}

void sigusr2_handle(int sig) {
    long rsp;
    READ_RSP(rsp);
    printf("sigusr2_handle rsp 0x%lx\n", rsp);
}

int main() {
    long rsp;
    READ_RSP(rsp);
    printf("main rsp 0x%lx\n", rsp);
    signal(SIGUSR1, sigusr1_handle);
    signal(SIGUSR2, sigusr2_handle);
    kill(getpid(), SIGUSR1);
}
