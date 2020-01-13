.model small
assume cs:code,ds:data,es:data                      

data segment
    str1 db "cvr$"
    str2 db "cvr$"
    str3 db "equal$"
    str4 db "not equal$"
    
    count db 3
   
data ends
code segment
  mov ax,data
  mov ds,ax
  mov es,ax
  lea si,str1
  lea di,str2
  
  mov cx,0000
  mov cl,count
  
  repe cmpsb
  
    jnz back     
  
    lea dx, str3
    mov ah,09h
    int 21h
    jmp exit
    
  back: 
  
    lea dx,str4
    mov ah,09h
    int 21h
  
  exit: 
  
     mov ah,4ch
     int 21h
     
     code ends  
  
       