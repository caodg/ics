# hw2参考答案

## 3.58

```c
long decode2(long x, long y, long z) {
    y -= z;
    x *= y;
    return ((y << 63) >> 63) ^ x;
    // 即 return (((y - z) << 63) >> 63) ^ (x * (y - z));
}
```

## 3.59

$$
\begin{aligned}
p &= 2^{64} p_h + p_l \\
  &= xy \\
  &= (2^{64} x_h + x_l)( 2^{64} y_h + y_l)\\
  &= 2^{128} x_h y_h + 2^{64} x_h y_l + 2^{64} x_l y_h + x_l y_l\\
  &= 2^{64}(x_h y_l + x_l y_h) + x_l y_l
\end{aligned}
$$

其中权重为$2^{128}$的项$x_h y_h$因为精度限制无法表示，被截断

为叙述方便起见，设

$$
\begin{aligned}
z &= 2^{64} z_h + z_l\\
  &= x_l y_l
\end{aligned}
$$

于是有

$$
\begin{aligned}
p &= 2^{64} p_h + p_l \\
  &= 2^{64}(x_h y_l + x_l y_h) + x_l y_l\\
  &= 2^{64}(z_h + x_h y_l + x_l y_h) + z_l\\
p_h &= z_h + x_h y_l + x_l y_h\\
p_l &= z_l
\end{aligned}
$$

```assembly
store_prod:
  movq    %rdx, %rax    # rax = y_l
  cqto                  # rdx = y_h，y的符号扩展高位
  movq    %rsi, %rcx    # rcx = x
  sarq    $63, %rcx     # rcx = x_h, x的符号扩展高位
  imulq   %rax, %rcx    # rcx = x_h * y_l
  imulq   %rsi, %rdx    # rdx = x_l * y_h
  addq    %rdx, %rcx    # rcx= x_h * y_l + x_l * y_h
  mulq    %rsi          # rax = z_l, rdx = z_h
  addq    %rcx, %rdx    # rdx = z_h+x_h*y_l+x_l*y_h
  movq    %rax, (%rdi)  # p_l = rax=z_l
  movq    %rdx, 8(%rdi) # p_h = rdx=z_h+x_h*y_l+x_l*y_h
  ret
```

## 3.60

A.
| variable |               register                |
|:--------:|:-------------------------------------:|
|    x     |                 %rdi                  |
|    n     | %esi %ecx(写其中任意一个或两个都给分) | 
|  result  |                 %rax                  |
|   mask   |                 %rdx                  |

B.
| variable | init value |
|:--------:|:----------:|
|  result  |     0      |
|   mask   |     1      |

C. `mask != 0`

D. `mask << (n & 0xFF)`（本次作业中有没有与都给分）

E. `result |= x & mask`

F.

```c
long loop(long x, int n) {
    long result = 0;
    long mask;
    for (mask = 1; mask != 0; mask << (n & 0xFF)) {
        result |= x & mask;
    }
    return result;
}
```

## 3.62

```c
typedef enum { MODE_A, MODE_B, MODE_C, MODE_D, MODE_E } mode_t;

long switch3(long *p1, long *p2, mode_t action) {
    long result = 0;
    switch (action) {
    case MODE_A:
        result = *p2;
        *p2 = *p1;
        break;
    case MODE_B:
        result = *p1;
        result += *p2;
        *p1 = result;
        break;
    case MODE_C:
        *p1 = 59;
        result = *p2;
        break;
    case MODE_D:
        *p1 = *p2;
        result = 27;
        break;
    case MODE_E:
        result = 27;
        break;
    default:
        result = 12;
        break;
    }
    return result;
}

```

## 3.64

```c
#define R 7
#define S 5
#define T 13

long A[R][S][T];

long store_ele(long i, long j, long k, long *dest) {
    *dest = A[i][j][k];
    return sizeof(A);
}
```

A. 地址数值直接运算：`addr = A + (i * S * T + j * T + k) * sizeof(long)`

B. `R == 7, S == 5, T == 13`
