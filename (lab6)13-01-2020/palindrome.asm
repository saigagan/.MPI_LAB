.model small
assume cs:code,ds:data,es:data

data segment
    src db "malayalam$"
    len db 7
    dest db 20 dup (?) 
    eq_msg db " is a palindrome.$"
    neq_msg db " is not a palindrome.$"
data ends    

code segment
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov si, offset src+len-2   
    mov di, offset dest
              
    xor cx, cx
    mov cl, len
    
    cld
    
    copy:
        mov al, [si]
        mov [di], al
        dec si
        inc di
        loop copy
    
    mov si, offset src
    mov di, offset dest
    
    mov cx, 0000h
    mov cl, len
    
    repe cmpsb 
      
    lea dx, src
    mov ah, 09h
    int 21h
    
    jz eq
    
    lea dx, neq_msg
    mov ah, 09h
    int 21h
    jmp exit
    
    eq:
        lea dx, eq_msg
        mov ah, 09h
        int 21h    
         
    exit:
        mov ah, 4ch
        int 21h    
code ends