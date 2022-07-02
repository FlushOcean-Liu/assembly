.section .data  # 数据段中定义数据时，它必须被包含在可执行程序中，必须使用特点值初始化它
buffer:
    .fill 10000
.section .text
.globl _start
_start:
movl $1, %eax
movl $0, %ebx
int $0x80
