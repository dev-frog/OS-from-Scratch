;; boot for demo os

	org 0x7c00

	;; set video mode
	mov ah,0x00
	mov al,0x03
	int 0x10

	;; Change color/palette
	mov ah,0x0b
	mov bh,0x00
	mov bl,0x01
	int 0x10


	;; tele type output
	mov bx,testString

	call printf
	mov bx,string2
	call printf

	mov bx,0x12AB
	call printh

	;; End program
	jmp $

	include 'include/printf.asm'
	include 'include/printh.asm'


testString:	db 'Hello' ,0xa ,0xd,0
string2:	db 'Hex: ',0

	times 510-($-$$) db 0
	dw 0xaa55