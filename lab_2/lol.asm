%include "io64.inc"

    

;x - rax
;n - rdi
;i - rbp
section .rodata
    a: dq 106
    m: dq 6075        ;-1 <= b <= 1     
    c: dq 1283            
    n: dq 100
section .text
global main
main:

     
    mov rbp, rsp;
    GET_DEC 8, rax             ; Получаем количество элементов N
    mov rbp, 0
    fld dword [n]
    fld dword[c]
    fld dword [m]
    mov rcx, [m]
.loop_start:
    cmp rbp, [n]
    jge .loop_end
    mul dword[a]
    add rax, [c]
    cdq
    idiv rcx
    mov rax, rdx
          
    PRINT_DEC 8, rax
    PRINT_STRING ' '  

    ;mov eax,edx
    add rbp,1
    jmp .loop_start  
.loop_end:
    xor eax,eax
    ret