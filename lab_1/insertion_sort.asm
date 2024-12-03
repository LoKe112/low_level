%include "io64.inc"
section .bss
    array resq 1000 

section .text
global main

;n-rax
;i-rbx
;j-rcx (во время сортировки)
;key - rdx
; tmp - rsi
main:
    mov rbp, rsp              
    GET_DEC 8, rax             ; Получаем количество элементов N
    mov rbx, 0                  ; Счетчик для цикла (типа i - index)
    
    
input_loop:
    GET_DEC 8, rcx              ;введеное число
    mov [array+rbx*8], rcx        ;записываем в массив
    PRINT_DEC 8, [array+rbx*8]
    PRINT_STRING ' '                ;вывод через пробел
    add rbx, 1                      ; увеличиваем i+=1
    cmp rax, rbx                    ; i<n
    jg input_loop
    
prepare:
    mov rbx, 1                    ;начальный индекс внешнего цикла i
    
start_sorting:
    cmp rbx, rax  ;if (i >= n - 1) goto print_array;
    jge temp
    mov rdx, [array+rbx * 8]    ;minIdx = i;
    mov rcx, rbx    ;j=i
    add rcx, -1      ;j = j-1
    jmp swap

swap:
    jmp check1
    
check1:
    cmp rcx, 0
    jl insert
    jmp check2
    
check2:
    cmp [array+rcx * 8], rdx
    jle insert
    jmp swap2
    
swap2:
    mov rsi, [array+rcx * 8]
    mov [array+rcx * 8 + 8], rsi
    add rcx, -1
    jmp swap
    
insert:
    mov [array+rcx * 8 + 8], rdx
    add rbx, 1
    jmp start_sorting
        
temp:
    mov rbx, 0
    PRINT_STRING '->'  
    
output_loop:
    cmp rbx, rax
    jge end
    PRINT_DEC 8, [array+rbx*8]
    PRINT_STRING ' '                
    add rbx, 1
    cmp rax, rbx
    jg output_loop

end:
    ret
 
      