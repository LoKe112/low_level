%include "io64.inc"

section .rodata
    x: dd 3.7             

section .bss
    result: resd 1         

section .text
global main

main:
    mov rbp, rsp           

    movss xmm0, dword [x]  
    roundss xmm1, xmm0, 1  ;0 - ближайшее, 1 - вниз, 2 - вверх, 3 - к нулю
    cvtss2si eax, xmm1    ; Преобразуем округлённое значение из xmm1 в целое и сохраняем в eax
    mov [result], eax      ; Сохраняем в result

    PRINT_DEC 4, eax       
    NEWLINE

    xor eax, eax           
    ret
