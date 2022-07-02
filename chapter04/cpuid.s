.section .data  #数据段，可选
output:
    .ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"

.section .text  #文本段，必须有
.globl _start
_start:
    movl $0, %eax         # 清零eax
    cpuid                 # 该命令收集厂商ID，分散在3个输出寄存器中，ebx、edx、ecx

    movl $output, %edi    # 创建一个指针，处理内存中声明的output变量时会用到这个指针
    movl %ebx, 28(%edi)   # 括号外数字表示相对于output标签放置的位置，这个数字与
                          # edi寄存器中的地址相加
    movl %edx, 32(%edi)
    movl %ecx, 36(%edi)

    # 放置好厂商ID字符串片断后，可以显示信息
    movl $4, %eax         # eax包含系统调用值，系统调用4--write函数
    movl $1, %ebx         # ebx包含要写入的文件描述符
    movl $output, %ecx    # ecx包含字符串的开头
    movl $42, %edx        # edx包含字符串的长度
    
    int $0x80             # Linux系统调用，使用int指令码，生成具有0x80的软件中断，
                          # 执行具体函数有eax寄存器值来决定
    movl $1, %eax         # 系统调用1--退出函数
    movl $0, %ebx         # ebx包含程序返回给shell的退出代码值，按照汇编语言程序内
                          # 的情况在shell脚本生成不同结果，零值表示程序成功执行了
    int $0x80
