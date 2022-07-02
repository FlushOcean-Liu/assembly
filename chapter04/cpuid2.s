.section .data  #数据段，可选
output:
    .asciz "The processor Vendor ID is '%s'\n"  #asciz 以空字符结尾的文本字符串

.section .bss
    .lcomm buffer, 12

.section .text  #文本段，必须有
.globl _start
_start:
    movl $0, %eax         # 清零eax
    cpuid                 # 该命令收集厂商ID，分散在3个输出寄存器中，ebx、edx、ecx

    movl $buffer, %edi
    movl %ebx, (%edi)
    movl %edx, 4(%edi)
    movl %ecx, 8(%edi)

    push $buffer
    push $output
    call printf
    addl $8, %esp
    push $0
   
    call exit

