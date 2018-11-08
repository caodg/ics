# hw5参考答案

## 4.47

A. 使用指针的版本

```c
void bubble(long *data, long count){
    long i, last;
    long* p;
    long* p1;
    for(last = count - 1; last > 0; last --){
        p = data;
        for(i = 0; i < last; i++, p++){
            p1 = p+1;
            if(*p1 < *p){
                long t = *p1;
                *p1 = *p;
                *p = t;
            }
        }
    }
}
```

B. Y86-64代码

```assembly
    .pos 0
    irmovq stack, %rsp
    irmovq data, %rdi
    irmovq $0x4, %rsi
    call bubble
    halt

.align 8
data:
    .quad 0x3
    .quad 0x1
    .quad 0x4
    .quad 0x2

bubble:
    irmovq $1, %rcx
    rrmovq %rsi, %r8
    subq %rcx, %r8    # last = count - 1
    jmp test_1
loop_1:
    rrmovq %rdi, %rax
    irmovq $0, %rdx
    jmp test_2
loop_2:
    mrmovq 8(%rax), %rcx # data[i+1]
    mrmovq (%rax), %rsi # data[i]
    rrmovq %rsi, %r10
    subq %rcx, %r10
    jle loop_2_end # data[i] <= data[i+1]
    rmmovq %rsi, 8(%rax)
    rmmovq %rcx, (%rax)
loop_2_end:
    irmovq $1, %r10
    addq %r10, %rdx
    irmovq $8, %r10
    addq %r10, %rax
test_2:
    rrmovq %rdx, %r10
    subq %r8, %r10
    jl loop_2
    irmovq $1, %r10
    subq %r10, %r8
test_1:
    andq %r8, %r8
    jg loop_1

    ret

.pos 0x400
stack:
```

Y86-64模拟器测试结果

```
Stopped in 120 steps at PC = 0x27.  Status 'HLT', CC Z=1 S=0 O=0
Changes to registers:
%rax:	0x0000000000000000	0x0000000000000030
%rcx:	0x0000000000000000	0x0000000000000002
%rdx:	0x0000000000000000	0x0000000000000001
%rsp:	0x0000000000000000	0x0000000000000400
%rsi:	0x0000000000000000	0x0000000000000001
%rdi:	0x0000000000000000	0x0000000000000028
%r10:	0x0000000000000000	0x0000000000000001

Changes to memory:
0x0028:	0x0000000000000003	0x0000000000000001
0x0030:	0x0000000000000001	0x0000000000000002
0x0038:	0x0000000000000004	0x0000000000000003
0x0040:	0x0000000000000002	0x0000000000000004
0x03f8:	0x0000000000000000	0x0000000000000027
```

## 4.56

当`valC < valP` 选择分支，`valC >= valP`不选择分支，分支预测错误条件变为

```
(E_icode == IJXX && E_ifun != UNCOND && !e_Cnd && E_valC < E_valA ) || 
(E_icode == IJXX && E_ifun != UNCOND && e_Cnd && E_valC >= E_valA )
```

同时需要改变分支预测

```python
# Predict next value of PC
word f_predPC = [
    # BBTFNT: This is where you'll change the branch prediction rule
    f_icode in { ICALL } : f_valC;
    f_icode in { IJXX } && (f_ifun == UNCOND || f_valC < f_valP) : f_valC; # if is not cond jmp or jmp back, take the branch
    f_icode in { IJXX } : f_valP; # if jmp forward, not take the branch
    1 : f_valP;
];
```

 以及分支预测错误时的行为

```python
## What address should instruction be fetched at
word f_pc = [
    # Mispredicted branch.  Fetch at incremented PC
    M_icode == IJXX && M_ifun != UNCOND && !M_Cnd && M_valE < M_valA: M_valA;
    M_icode == IJXX && M_ifun != UNCOND && M_Cnd && M_valE >= M_valA : M_valE;
    # Completion of RET instruction
    W_icode == IRET : W_valM;
    # Default: Use predicted value of PC
    1 : F_predPC;
];

bool D_bubble =
    # Mispredicted branch
    (E_icode == IJXX && E_ifun != UNCOND && !e_Cnd && E_valC < E_valA ) ||
    (E_icode == IJXX && E_ifun != UNCOND && e_Cnd && E_valC >= E_valA ) ||
    # BBTFNT: This condition will change
    # Stalling at fetch while ret passes through pipeline
    # but not condition for a load/use hazard
    !(E_icode in { IMRMOVQ, IPOPQ } && E_dstM in { d_srcA, d_srcB }) &&
    IRET in { D_icode, E_icode, M_icode };

bool E_bubble =
    # Mispredicted branch
    (E_icode == IJXX && E_ifun != UNCOND && !e_Cnd && E_valC < E_valA ) ||
    (E_icode == IJXX && E_ifun != UNCOND && e_Cnd && E_valC >= E_valA ) ||
    # BBTFNT: This condition will change
    # Conditions for a load/use hazard
    E_icode in { IMRMOVQ, IPOPQ } &&
    E_dstM in { d_srcA, d_srcB};
```

我们可以将`E_valC`传到`M_valE`，方便预测错误后的修正，为此，我们需要修改ALU的操作数

```python
## Select input A to ALU
word aluA = [
    E_icode in { IRRMOVQ, IOPQ } : E_valA;
    E_icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IJXX } : E_valC;
    E_icode in { ICALL, IPUSHQ } : -8;
    E_icode in { IRET, IPOPQ } : 8;
    # Other instructions don't need ALU
];

## Select input B to ALU
word aluB = [
    E_icode in { IRMMOVQ, IMRMOVQ, IOPQ, ICALL,
		     IPUSHQ, IRET, IPOPQ } : E_valB;
    E_icode in { IRRMOVQ, IIRMOVQ, IJXX } : 0;
    # Other instructions don't need ALU
];
```
