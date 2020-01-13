.model small
assume cs:code,ds:data
data segment
  n db "helloworld$"
 code segment
   mov ax,data
   mov ds,ax
   mov ax,offset n
   mov ah,09h
   int 21h
   code ends
   