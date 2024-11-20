%include "io64.inc"

section .rodata
    a: dd 5.0
    b: dd 4.0        ;-1 <= b <= 1     
    c: dd 1.0    
    
section.bss
    x: resd 1         
    
section .text
global main    
main:
    mov rbp, rsp; for correct debugging
    movss xmm0, [a]    ; xmm0 = a
    movss xmm1, [b]    ; xmm1 = b
    movss xmm2, [c]    ; xmm2 = c
    mulss xmm1, xmm2
    subss xmm0, xmm2
    divss xmm1, xmm0
    xor eax,eax
            
    ret