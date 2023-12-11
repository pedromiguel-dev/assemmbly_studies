section .data
section .text
global main

add_two:
	push	ebp
	mov 	ebp, esp
	mov	eax, [ebp + 8]		; second parameter
	mov	ebx, [ebp + 12]		; first parameter
	add 	eax, ebx
	pop	ebp
	ret

main:
	push	4
	push	1
	call 	add_two
	mov	ebx, eax
	mov	eax, 
	int 	80h
