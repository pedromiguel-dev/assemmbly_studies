section .data

section .text
global _start

_start:
		mov eax, 0b1010
		not eax
		and eax, 0xF
		int 80h
		