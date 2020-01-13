.model small
assume cs:code,ds:data
data segment
  p db "positive number$"
  n db "negative number$" 
  a db 2h
  
data ends
code segment   
  mov ax,data
  mov ds,ax
  
  mov al,a
  rol al,1
  jnc pv
  jc nv 
  pv:mov dx,offset p
  jmp exit
  nv:mov dx,offset n
  exit:mov ah,09h
  int 21h
code ends
     