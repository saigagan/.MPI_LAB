.model small
assume cs:code, ds:data

data segment
    arr db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
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
    
    ;mov ah, 4ch
    ;int 21h
    
    mov cl, count
    mov si, 0
    
    mov dx, offset msg
    mov ah, 09h
    int 21h
    
    print:        
        mov dl, arr[si] 
        add dl, 30h
        mov ah, 02h
        int 21h
        
        mov dx, offset sep
        mov ah, 09h
        int 21h
            
        inc si
        loop print 
    
    mov ah, 4ch
    int 21h
        
code ends    