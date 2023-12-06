section .data

section .text
global _start

_start:
	;				add
	;mov eax, 1
	;mov ebx, 2
	;add eax, ebx
	;int 80h
	
	;				sub
	;mov eax, 3
	;mov ebx, 5
	;sub eax, ebx
	;mov ebx, 2
	;add eax, ebx
	;int 80h
	
	;				mul
	;mov al,2
	;mov bl,3
	;mul	bl
	;int 80h
	
	;				div
	mov eax, 11
	mov ecx, 2
	xor edx, edx    ; remainder
	; 				eax get the result
	idiv	ecx
	int	80h
	