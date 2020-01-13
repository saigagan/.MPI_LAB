.model small
data segment
data ends

code segment
    mov ax, 1h
    mov cx, 5h  ; change this to find factorial of another number

    fact:
        mul cx
        loop fact
    int 21h
code ends