section .data

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
		mov			eax, 3
		mov			ebx, 2
		cmp			eax, ebx		; sub 3 - 2, the outcome tells the bigger num
		jl			lesser
		jmp			ending
		
lesser:
		mov 		ecx,1
ending:
		int 		80h