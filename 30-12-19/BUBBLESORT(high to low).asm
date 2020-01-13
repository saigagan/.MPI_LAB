.model small
assume cs:code, ds:data

data segment
    arr db 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
    count db 10 
    msg db "Sorted Array: $" 
    sep db ", $"
data ends
         
code segment
    mov ax, data
    mov ds, ax
    
    mov cl, count
    sub cl, 1
    
    outer:
        mov bx, cx
        mov si, 0
        
        inner:
            mov al, arr[si]
            mov dl, arr[si+1]
            cmp al, dl
            
            jnc noswap
            mov arr[si], dl
            mov arr[si+1], al
            
        noswap:
            inc si
            cmp si, bx
            jne inner
        loop outer
    
    mov ah, 4ch
    int 21h
    
    
  