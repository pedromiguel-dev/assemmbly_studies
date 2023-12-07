section .data
	pathname	dd	"/var/home/pedromiguel_dev/Projetos/asm/nasm/exemple.txt", 0
	O_RDWR		equ	2	

section .bss
	buffer:	resb	1024

section .text
global _start

read:
	mov ebx, eax	; file desc
	mov eax, 3
	mov ecx, buffer
	mov edx, 1024
	int 80h
	ret
print:
	; stdout is 1
	mov ebx, 1
	mov eax, 4
	mov ecx, buffer
	mov edx, 1024
	int 80h
	ret

open:
	mov eax,5
	mov ebx,pathname
	mov ecx,O_RDWR
	int 80h
	ret

_start:
	call open
	call read
	call print
	mov ebx, eax
	mov eax, 1	
	int 80h	
