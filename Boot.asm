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
	mov ah,0x0e
	mov bx,testString

	call print_string
	mov bx,string2
	call print_string
	jmp end_pgm

print_string:
	mov al,[bx]
	cmp al,0
	je end_print
	int 0x10
	add bx,1
	jmp print_string

end_print:
	ret 

testString:	db 'Hello' ,0xa ,0xd,0
string2:	db 'World',0xa,0xd,0

end_pgm:
	jmp $
	times 510-($-$$) db 0
	dw 0xaa55