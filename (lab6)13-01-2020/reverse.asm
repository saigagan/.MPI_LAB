.model small
assume cs:code,ds:data,es:data                      

data segment
    
    str1 db "cvr$"
    str2 db 4 dup(?)
    
data ends

code segment
  
  mov ax,data
  mov ds,ax
  mov es,ax 
  
  lea si,str2
  lea di,str1
   
  add di,2
  mov cx,3 

   reverse: 
   
    mov al,[di] 
    mov [si],al
    inc si
    dec di 
    
   loop reverse  
    mov [si],"$"
    mov dx,offset str2
    mov ah,09h
    int 21h
    mov ah,4ch    
    int 21h
  
 code ends  
  
       