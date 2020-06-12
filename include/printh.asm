;; Printing hexidecimal values
;; Ascii    '0' - '9' = hex 0x30-0x39
;; Ascii    'A' - 'F' = hex 0x41-0x46
;; Ascii    'a' - 'f' = hex 0x61-0x66

printh:
    pusha
    mov cx,0    ;initialize loop counter

h_loop:
    cmp cx,4
    je end_h_loop

    ;; convert hex to ascii
    mov ax,dx
    and ax,0x000F   ; 0x000B
    add al,0x30
    cmp al,0x39     ; is hex are 0-9 
    jle hexNumber
    add al,0x7      ; to get 'A' - 'F'

    ;; move ascii to hex
hexNumber:
    mov bx,hex_String + 5
    sub bx,cx        ; substract loop counte
    mov [bx],al
    ror dx,4         ; rotate right by 4 bits
    
    add cx,1
    jmp h_loop

end_h_loop:
    mov bx,hex_String
    call printf
    popa
    ret

    ;; Data Section
hex_String: db '0x0000',0