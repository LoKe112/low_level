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
    ; Загрузка значений в FPU регистры
    ;
    fld dword [b]      ; ST(0) = b
    fld dword [c]      ; ST(1) = c
    fmul st1, st0
    fld dword [a]
    fsub st0, st1
    fdiv st0, st2
    xor eax,eax
            
    ret
