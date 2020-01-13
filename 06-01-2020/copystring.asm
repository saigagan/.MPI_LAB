.model small
assume cs:code,ds:data,es:data
data segment 
    str1 db "cvr$"
    str2 db 10 dup(?)
    count db 4
data ends
code segment  
    start:
    mov ax,data
    mov ds,ax
    mov es,ax
    xor ax,ax
    mov si,offset str1
    mov di,offset str2
    mov cl,count
    cld  
    rep movsb
    mov dx,offset str2
    mov ah,09h
    int 21h
    mov ah,4ch
    int 21h
code ends   
end start
 

