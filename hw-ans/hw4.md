# hw4参考答案

## 3.70

A.

| 字段    | 位移量   |     
| ------- | ------ |
| e1.p    | 0      |
| e1.y    | 8      |
| e2.x    | 0      |
| e2.next | 8      |

B.
总共需要16个字节

C.

```c
void proc(union ele *up) {
    up->e2.x = *(up->e2.next->e1.p) - up->e2.next->e1.y;
}
```

## 4.45

A. 不正确。存入栈中的是改动后的`%rsp`的值。应当存入原值。

B. 
```assembly
movq REG, -8(%rsp)
subq $8, %rsp
```
