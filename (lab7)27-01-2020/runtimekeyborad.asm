.model small
assume cs:code, ds:data ,es:data

data segment
  len db 10
  str db 11 dup('$') 
    
data ends
         
code segment
    start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov cx,0000h
    mov cl,len
    
    lea di,str
    
    inp:
    mov ah,01h
    int 21h
    
     stosb
     loop inp
     
     lea dx,str
     mov ah,09h
     int 21h  
     
     mov ah,4ch
     int 21h
     code ends    
   