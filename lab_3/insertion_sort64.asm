section .rodata
    fmt: dq "%lld ",  0

section .text
    extern scanf
    extern printf
    extern puts
    extern malloc
    extern free

global main
    ;n- [rbp-8]
    ;i-r12
    ;j-r13 (во время сортировки)
    ;key - r14
    ;tmp - r15

;n-rax
;i-rbx
;j-rcx (во время сортировки)
;key - rdx
; tmp - rsi
main:
    mov rbp, rsp; for correct debugging
    push rsi
    push rbp
    mov rbp, rsp; for correct debugging
    
    sub rsp, 8 + 32
    
    lea rcx, [fmt] 
    lea rdx, [rbp - 8] 
    call scanf
    
    mov rcx, 100
    call malloc
    mov rsi, rax
    mov r12, 0
    
    
input_loop:
    lea rcx, [fmt] 
    lea rdx, [rsi + r12*8] 
    call scanf               ;вывод через пробел
    add r12, 1                      ; увеличиваем i+=1
    cmp [rbp-8], r12                    ; i<n
    jg input_loop
    
prepare:
    mov r12, 1                    ;начальный индекс внешнего цикла i
    
start_sorting:
    cmp r12, [rbp-8]  ;if (i >= n - 1) goto print_array;
    jge temp
    mov r14, [rsi+r12 * 8]    ;minIdx = i;
    mov r13, r12    ;j=i
    add r13, -1      ;j = j-1
    jmp swap

swap:
    jmp check1
    
check1:
    cmp r13, 0 ;j < 0
    jl insert
    jmp check2
    
check2:
    cmp [rsi+r13 * 8], r14 ; arr[j] < key
    jle insert
    jmp swap2
    
swap2:
    mov r15, [rsi+r13 * 8]
    mov [rsi+r13 * 8 + 8], r15
    add r13, -1
    jmp swap
    
insert:
    mov [rsi+r13 * 8 + 8], r14
    add r12, 1
    jmp start_sorting
        
temp:
    mov r12, 0

    
output_loop:
    cmp r12, [rbp-8]
    jge end
    lea rcx, [fmt]
    mov rdx, [rsi + r12*8] 
    call printf              
    add r12, 1
    cmp [rbp-8], r12
    jg output_loop

end:
    mov rcx, rsi
    call free
            
    leave
    mov rbp, rsp
    pop rsi
    ret
 
      