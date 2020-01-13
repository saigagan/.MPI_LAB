.model small
assume cs:code, ds:data

data segment
    arr db 1,6,-2,7,9
    len db 5
    
   data ends
code segment
    mov ax,data
    mov ds,ax
     mov si,offset arr  
     xor cx,cx
     mov cl,len
     mov ax,007fh
     
     max:
        cmp al,[si]
        
         jl nostore
        mov al,[si]
        
        nostore:
        inc si
        loop max
        code ends
   