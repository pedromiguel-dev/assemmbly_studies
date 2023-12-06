section .data
		; p $xmm0.v4_float[0]
		x dd 3.14
		y dd 2.1
		
section .text
global _start

_start:
		movss		xmm0,	[x]
		movss		xmm1,	[y]
		;addss		xmm0,	xmm1		; adding
		ucomiss		xmm0,   xmm1		; compare float
		; JB
		; JBE
		; JA
		; JAE
		ja			greater
		jmp			end

greater:
		mov 		ecx,	1

end:
		mov 		eax, 	1
		mov 		ebx, 	1
		int			80h