section .data
	; db 1 byte, 8 bits
	; dw 2 bytes, 16 bits 
	; dd 4 bytes, 32 bits
	; dq 8 bytes, 64 bits
	; dt 10 bytes, 801 bits
	num		db		1
	num2	db		2
	char	db		'A'
		
section .text
global _start

;	e(x)x 32 bits
;	-(x)x 16 bits
;	-(x)l 08 bits (lower half)
;	-(x)h 08 bits (higher half)	

_start:
	mov 	bl, [char]
	mov 	cl, [num2]
	mov		eax, 1
	int 	80h
