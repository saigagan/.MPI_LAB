.model small
assume cs:code, ds:data

data segment
   str db "abcdefg$"
   len db 7
data ends
         
code segment
    mov ax, data
    mov ds, ax 
    
    mov cx,0000h
    mov cl,len
    
    lea si,str
    
    disp: 
    
    mov dl,[si]
    mov ah,02h
     int 21h
     
    add si,2
    sub cx,2  
    cmp cx,0h
    
    jg  disp
    
    
    mov ah,4ch
    int 21h
    
code ends

