.model small
assume as:code, ds:data

data segment
    msg db "Enter a Number:$"
    n_line DB 0AH,0DH,"$"
    e db " is an even number.$"
    o db " is an odd number.$"
data ends

code segment
    mov ax, data
    mov ds, ax
    
    mov bl, 10h
    mov cx, 0h
    
    mov dx, offset msg
    mov ah, 09h
    int 21h 
    mov dx, offset n_line
    mov ah, 09h
    int 21h              
               
    mov ah, 01h
    int 21h
    sub al, 30h
    mul bl 
    add cl, al
    mov ah, 01h
    int 21h
    sub al, 30h
    mul bl 
    add cl, al
    mov ah, 01h
    int 21h
    sub al, 30h
    add cl, al 
    
    shr cl, 1
    jc odd
    
    even:
        mov dx, offset e
        jmp exit
    
    odd:
        mov dx, offset o
    
    exit:
        mov ah, 09h
        int 21h
    
code ends    