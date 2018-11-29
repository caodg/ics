# 第十周

#### 吕栋杰 1600012793

## 7.6

| 符号  | swap.o.symtab条目？ | 符号类型 | 定义符号的模块 | 节     |
| ----- | ------------------- | -------- | -------------- | ------ |
| buf   | 有                  | 外部     | m.o            | .data |
| bufp0 | 有                  | 全局     | swap.o         | .data  |
| bufp1 | 有                  | 局部     | swap.o         | .bss   |
| swap  | 有                  | 全局     | swap.o         | .text  |
| temp  | 无                  | ---      | ---            | ---    |
| incr  | 有                  | 局部     | swap.o         | .text  |
| count | 有                  | 局部     | swap.o         | .bss   |

说明：
+ 在链接之前，`swap.o`符号表中`buf`在`UNDEF`伪节，链接之后，`buf`在最终可执行文件的`.data`段
+ 符号表里并不会把符号标成`EXTERN`，符号表里类型只可能有`STB_GLOBAL`，`STB_LOCAL`，`STB_WEAK`（弱引用）。`buf`在符号表里标记的类型为`GLOBAL`。但是做题时候就看出题人意思吧。

## 7.7

```c
static double x;

void f() {
    x = -0.0;
}
```

因为题目没有说清楚，还有其他改法，只要输出对就都算对

## 7.9

`bar.c`中的弱符号`main`和`foo6.c`中的强符号`main`链接。访问全局变量时会根据地址加载值，因此`p2`会读取并输出`main`函数在`.text`段的第一个字节。
