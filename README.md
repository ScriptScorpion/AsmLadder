# How to compile:
* For Linux: `nasm -f elf64 main.asm -o exe.o && ld exe.o -o exe`
  
* For Windows: `nasm -f win64 main.asm -f exe.obj && ld exe.obj -o exe.exe`
