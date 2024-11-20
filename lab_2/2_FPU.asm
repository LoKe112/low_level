%include "io64.inc"

section .rodata
    a: dd 5.0
    b: dd -1.0         ;-1 <= b <= 1     
    c: dd 2.71828               
    x: dd 1.0
    
section .text
global main

    
main:
    mov rbp, rsp; for correct debugging
    ;bx *
    ;a bx -
    ;a bx - c /
    fld dword[b]
    fld dword[x]
    fmul st0, st1        
    fstp st1
    fld dword [a]
    fsub st0, st1
    fstp st1    
    fld dword [c]
    fdiv st1, st0
    fstp st0
    fstp st0
    xor eax,eax
    ret