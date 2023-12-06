section .data

		list db 1,2,3,4

section .text
global _start

	; je 		jump equals
	; jle		jump less equals
	; jne		jump not equals
	; jg 		jump greater
	; jge		jump greater equals
	; jz		jump zero
	; jnz		jump not zero

_start:
		mov			eax, 0
		mov 		cl,  0

loop:
		mov			bl,  [list + eax]
		add			cl,	 bl
		inc			eax
		cmp			eax, 4
		je			ending
		jmp			loop
		
ending:
		mov eax, 1
		mov ebx, 1
		int 80h
		ret