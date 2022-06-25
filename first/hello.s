.section .data    # 初始化的变量
output: 
    .ascii "hello world\n"  # .ascii 文本字符串
                            # .asciz 以NULL结束的文本字符串
                            # .byte 字节值
                            # .double 双精度浮点数
                            # .float 单精度浮点数
                            # .int 32位整数
                            # .long 32位整数
                            # .octa 16位整数
                            # .quad 8位整数
                            # .short 16位整数
                            # .single 单精度浮点数

.section .bss     # 未初始化的变量，由0填充的缓冲区
    .lcomm num,20 # lcomm为本地内存区域，由0填充的缓冲区

.section .text    # 汇编语言指令码
    .globl _start  #程序启动入口

_start:
    movl $4, %eax      # 系统调用功能，4为write
    movl $1, %ebx      # 文件描述符，屏幕为1
    movl $output, %ecx # 要打印的字符串
    movl $12, %edx     # 字符串的长度
    int $0x80          # 显示字符串

    movl $0, %eax     
    movl $num, %edi
    movl $65, 1(%edi)  # A 的ascii
    movl $66, 2(%edi)  # B 的ascii
    movl $67, 3(%edi)  # C 的ascii
    movl $68, 4(%edi)  # D 的ascii
    movl $10, 5(%edi)  # \n 的ascii

    movl $4,%eax       # 调用系统功能，4为write
    movl $num,%ecx     # 要打印的字符串
    movl $1, %ebx      # 文件描述符，屏幕为1
    movl $6, %edx      # 字符串长度
    int  $0x80         # 显示字符ABCD

    movl $1, %eax      # 1为退出
    movl $0, %ebx      # 返回给shell的退出代码值

    int  $0x80         # 内核软中断，退出系统
