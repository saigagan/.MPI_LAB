.model small
assume cs:code,ds:data  

data segment                               o
        str db "abcdef$"
        len db 6      
        newline db   10,13,36
        data ends 

code segment
    mov ax,data
    mov ds,ax
    mov cl,len
    mov si,offset str
 
   disp:
        mov dl,[si]
        mov ah,02h
        int 21h  
        
        add si,2
        sub cx,2
        cmp cl,00
                
               
        jg disp  
        
        mov dl,offset newline       
        mov ah,09h
        int 21h
        mov cl,len
        dec cl
        mov si,offset str
 
     disp1:
   
    mov dl,[si+1]
    mov ah,02h
    int 21h
    add si,2
    sub cl,2 
    cmp cl,00
    jg disp1    
    
    mov ah,4ch
    int 21h
 code ends