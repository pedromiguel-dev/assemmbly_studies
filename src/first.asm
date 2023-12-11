section .data
;nasm -f elf -o first.o first.asm
;ld -m elf_i386 -o first first.o

section .text
global _start

_start:
	mov	eax, 1
	mov ebx, 1
	int 80h
