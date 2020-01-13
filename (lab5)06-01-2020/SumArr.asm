.model small
assume cs:code, ds:data

data segment
    arr db 1, 2, 3, 4, 5
    len db 5
data ends

code segment
    mov ax, data
    mov ds, ax
    mov si, offset arr
    
    xor cx, cx
    mov cl, len
    mov ax, 0000h
    
    max:      
        add al, [si]
        inc si
        loop max
code ends    