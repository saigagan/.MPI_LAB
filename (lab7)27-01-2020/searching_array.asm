.model small
assume cs:code, ds:data ,es:data

data segment
    str1 db "cvrcse$"
    str2 db "v$"
    count db 06h 
    msg1 db "found: $"   
    msg2 db "not found: $" 
    
data ends
         
code segment
    start:
    mov ax, data
    mov ds, ax     
    mov es, ax 
    
    xor ax,ax
    
    lea di,str1
    mov cl,count

   
    cld
    
    mov al,str2
    repne scasb
    je next  
    
    lea dx,msg2
    jmp back1  
    
    next:lea dx,msg1 
    
    back1:mov ah,09h
    
     int 21h
     mov ah,4ch
     int 21h
code ends           
end start
