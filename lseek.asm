section .data
	pathname	dd	"/var/home/pedromiguel_dev/Projetos/asm/nasm/exemple.txt", 0
	O_RDWR		equ	2	

section .bss
	buffer:	resb	10

section .text
global _start

_start:
	; opening 5 syscall
	mov eax, 5
	mov ebx, pathname
	mov ecx, 0
	int 80h	
	
	; seeking 19 syscall, start at 20 bytes, SEEK_SET
	mov ebx, eax
	mov eax, 19
	mov ecx, 20
	mov edx, 0
	int 80h

	; reaading from seek
	mov eax, 3
	mov ecx, buffer
	mov edx, 10
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
