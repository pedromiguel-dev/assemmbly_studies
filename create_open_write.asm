section .data
	O_CREAT		equ		0100o
	O_RDWR 		equ		0002o
	flags 		equ		O_CREAT + O_RDWR

	hello		db 		"Hey, what file do you wanna create/open?  "
	hello_s		equ 	$-hello

	warning		db		"Please write th insides of it", 0xA, 0
	warning_s	equ		$-warning
	
	open_fail	db		"Failed to open file, aborting...",0xA, 0
	open_fail_s equ		$-open_fail

	file_test	db		"pedro2.txt"
	
section .bss		
	file:		resb	1
	user_i:		resd	20
	buffer:		resd	1024
	

section .text
global _start


open_file:
	;eax: filename
	mov ebx, eax
	mov eax, 5
	mov ecx, flags
	mov edx, 0777o
	int 80h
	ret	

print:
	; eax: size, ebx: buffer
	mov edx, eax
	mov ecx, ebx

	mov eax, 4
	mov ebx, 1
	int 80h
	ret
	
read_console:
	; eax: buffer_s, ebx: bufer
	mov edx, eax
	mov ecx, ebx
	
	mov eax, 3
	xor ebx, ebx
	int 80h
	ret
	
write_file:
	; eax: fd, ebx: buffer, ecx: size
	mov edx, ecx
	mov ecx, ebx
	mov	ebx, eax

	mov eax, 4
	int 80h
	ret
	
open_failed:
	mov eax, open_fail_s
	mov ebx, open_fail
	call print
	call exit
	
	
exit:
	mov eax, 1
	xor ebx, 0
	int 80h	


_start:
	mov eax, hello_s
	mov ebx, hello
	call print	

	mov eax, 3
	xor ebx, ebx
	mov ecx, user_i
	mov edx, 20
	int 80h
	
		openning:
		mov eax, user_i
		call open_file
		mov [file], eax
		cmp eax, 0
		jl	open_failed

	mov eax, warning_s
	mov ebx, warning
	call print

		storing:
		mov eax, 1024
		mov ebx, buffer
		call read_console

		writing:	
		mov ecx, eax	
		mov	eax, [file]
		mov ebx, buffer
		call write_file
		
	call exit