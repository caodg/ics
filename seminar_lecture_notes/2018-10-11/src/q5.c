#include<stdio.h>
#define N 6

const char* maze[N] = {
    "######",
    "     #",
    "#### #",
    "#### #",
    "     #",
    "######"
};

int startI = 1, startJ = 0;
int endI = 4, endJ = 0;
int playerI, playerJ;

void show_maze() {
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < N; j++) {
            if(i == playerI && j == playerJ) {
                putchar('*');
            } else {
                putchar(maze[i][j]);
            }
        }
        putchar('\n');
    }
}

int main() {
    playerI = startI;
    playerJ = startJ;
    show_maze();
}
