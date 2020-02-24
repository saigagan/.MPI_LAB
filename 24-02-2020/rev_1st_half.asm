 .model small                      
assume cs:code,ds:data  

data segment                               
        str db "saisai$"
        len db 6  
        
data ends

code segment
    mov ax,data
    mov ds,ax
    mov si,offset str+(len/2-1)
    xor cx,cx
    mov cl,len
    
    disp:
    mov dl,[si]
    mov ah,02h
    int 21h
    
    dec si
    sub cl,02
    cmp cl,00
    jg disp
    
    mov si,offset str+(len/2)
    
    xor cx,cx
    mov cl,len
    
    disp1:
     mov dl,[si]
    mov ah,02h
    int 21h    
    
    inc si
    
    sub cl,2
    cmp cl,01
    
    jg disp1
    
    mov ah,4ch    
    int 21h
code ends