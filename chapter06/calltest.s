.code32  # push pop 32位指令
.section .data
output:
	.asciz "This is section %d\n"
.section .text
.globl _start
_start:
	push $1
	push $output
	call printf
	add  $8, %esp     # 清理栈 should clear up stack
	call overhere
	push $3
	push $output
	call printf
	add  $8, %esp
	push $0
	call exit

overhere:
	push  %ebp
	movl  %esp, %ebp  # esp 指针复制到ebp中，函数结束后，可以回复esp
	push  $2
	push  $output
	call  printf
	add   $8, %esp
	movl  %ebp, %esp
	popl  %ebp
	ret
