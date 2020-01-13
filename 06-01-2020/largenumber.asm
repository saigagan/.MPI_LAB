.model small
assume cs:code, ds:data

data segment
    arr db 1,2,3,4,9
    len db 5
    large db ?
   data ends
code segment
    mov ax,data
    mov ds,ax
     lea si,arr
     mov al,arr[si]
     mov large,al
     mov cl,len
     
     repeat:
     mov al,arr[si]
     cmp large,al
     jg nochange
     mov large,al
     
     nochange
     inc si
     mov ah,4ch
     int 21h
     code end
   