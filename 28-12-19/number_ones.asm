.model small
assume cs:code,ds:data
data segment
n db "one$"   
data ends
code segment
    mov ax,data
    mov ds,ax
    mov al,07h
    xor bl,bl
    xor cx,cx
    mov cx,8
    label1:shr al,1
    jnc label2
    inc bl
    label2:loop label1
    mov dl,bl
    mov ah,02h
    add dl,48
    INT 21h
code ends