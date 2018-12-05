#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    int pid, cnt = 1;
    while ((pid = fork()) > 0)
        cnt++;
    if (!pid)
        return 0;
    while (wait(NULL) > 0)
        ;
    printf("max process cnt: %d\n", cnt);
    return 0;
}
