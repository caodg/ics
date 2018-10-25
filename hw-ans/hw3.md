# hw2参考答案

## 3.68
由代码可知

$$
\begin{eqnarray}
5 &\leq& B &\leq& 8 \\
7 &\leq& A &\leq& 10 \\
45 &\leq& AB &\leq& 46
\end{eqnarray}
$$
打表穷举得，$A$ 和 $B$ 取值如下：
| A   | B   |
| --- | --- |
| 9   | 5   |

## 3.69

``` c
#define CNT 7

typedef struct {
    long idx;
    long x[4];
} a_struct;
```
