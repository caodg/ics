.globl magic
magic:
  pushq %rbp
  movq %rsp, %rbp
  pushq %rbx
  pushq %r13

  movq top(%rip), %rax
  movq %rsp, %rbx
  movq %rsp, top(%rip)
  movq %rax, %rsp

  movq %rdi, %rax
  movq %rsi, %rdi
  callq *%rax

  movq %rbx, %rsp

  popq %r13
  popq %rbx
  popq %rbp
  ret
