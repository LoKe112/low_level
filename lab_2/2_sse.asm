%include "io64.inc"

section .rodata
    a: dd 5.0
    b: dd -1.0         ;-1 <= b <= 1     
    c: dd 2.71828               
    x: dd 1.0
    result dq 0.0
section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ; Загрузка значений в xmm-регистры
    movss xmm0, [a]    ; xmm0 = a
    movss xmm1, [b]    ; xmm1 = b
    movss xmm2, [x]    ; xmm2 = x
    movss xmm3, [c]    ; xmm3 = c

    ; Вычисление b * x
    mulss xmm1, xmm2   ; xmm1 = b * x

    ; Вычисление a - (b * x)
    subss xmm0, xmm1   ; xmm0 = a - (b * x)

    ; Вычисление (a - (b * x)) / c
    divss xmm0, xmm3   ; xmm0 = (a - (b * x)) / c
    movss [result], xmm0
    xor eax,eax
    ret