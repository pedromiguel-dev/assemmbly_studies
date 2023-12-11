; from stdio.h
extern printf
extern exit

section .data

msg	dd	"Hello world!",0
msg2	dd	"Pedro Miguel",0
fmt	db	"Output is: %s, %s",10,0

section	.text
global main

; printf("%s %s", value, value2)

main:
	push	msg2
	push	msg
	push 	fmt
	call	printf
	push	10
	call 	exit
