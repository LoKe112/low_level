section .rodata
    x : dq 10.1
    y : dq 2.0
section .text
    extern access2
    
global main
main:
    mov rbp, rsp

    sub rsp, 1000

    mov rdx, 0
    movsd xmm2, qword[y]
    movsd xmm3, qword[x]
    
    call access2 

    add rsp, 1000

    ret