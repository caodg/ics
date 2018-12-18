# hw1参考答案

## 10.6

fd2 = 4

## 10.9

```c 
if (Fork() == 0) {
    /* IO Redirection */
    int fd;
    fd = Open("foo.txt", O_RDONLY);
    Dup2(fd, STDIN_FILENO);
    Close(fd);
    Execve("fstatcheck", argv, envp);
}
```
