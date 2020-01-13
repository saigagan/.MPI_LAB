.model small
assume cs:code,ds:data

data segment
    src db "This is a string.$"
    len db 18
    dest db 20 dup (?)
data ends    

code segment
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov si, offset src    
    mov di, offset dest
              
    xor cl, cl          
    mov cl, len
    
    cld
    
    rep movsb
    
    mov dx, offset dest
    mov ah, 09h
    int 21h
    
    mov ah, 4ch
    int 21h
    
code ends