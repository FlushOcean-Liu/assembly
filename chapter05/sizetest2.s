.section .bss  # bss段中声明的数据不包含在可执行程序中，data段包含
    .lcomm buffer, 10000
.section .text
.globl _start
_start:
movl $1, %eax
movl $0, %ebx
int $0x80
