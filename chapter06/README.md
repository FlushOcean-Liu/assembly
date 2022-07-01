# 调用c库函数编译问题

问题原因32位64位不兼容，书上都是32位，要么用32位编译，要么都64位指令
as --32 -o calltest.o calltest.s  
ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o calltest calltest.o -lc  
