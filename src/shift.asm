section .data

section .text
global _start

_start:
		mov 		eax, 2		; eax -> 0b10
		shr 		eax, 1		; eax -> 0b01		equivalent to div by 2
		
		mov 		eax, 10		; eax -> 0b1010
		shl 		eax, 1		; eax -> 0b10100	equivalent to mul by 2
		