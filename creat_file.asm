section .data
	pathname	dd	"/var/home/pedromiguel_dev/Projetos/asm/nasm/exemple.txt", 0
	to_write	dd	"Hello world!",0AH,0DH,"$"
	O_RDWR		equ	2	
	S_CREAT_WRITE		equ	101o
	S_RDWR_GROUP		equ	700o

section .text
global _start

_start:
	mov eax, 5
	mov ebx, pathname
	mov ecx, S_CREAT_WRITE	
	mov edx, S_RDWR_GROUP
	int 80h

	mov ebx, eax
	mov eax, 4
	mov ecx, to_write
	mov edx, 15
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h
