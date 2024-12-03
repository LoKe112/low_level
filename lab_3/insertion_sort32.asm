section .rodata
    fmt: dq "%d ",  0


section .text
    extern scanf
    extern printf
    extern puts
    extern malloc
    extern free
global main

    ;n- [ebp-4]
    ;i-ebx
    ;j-ecx (во время сортировки)
    ;key - edx
    ;tmp - edi

;n-rax
;i-rbx
;j-rcx (во время сортировки)
;key - rdx
; tmp - rsi
main:
    push esi
    push ebx
    push ebp
    
    mov ebp, esp
    
    sub esp, 4 + 8


    lea eax, [fmt]
    mov [esp], eax
    lea eax, [ebp - 4]
    mov [esp + 4], eax
    call scanf
    
    mov dword[esp], 100
    call malloc
    mov esi, eax
    
    mov ebx, 0
    
    
input_loop:
    lea eax, [fmt]
    mov [esp], eax
    lea eax, [esi + ebx*4] 
    mov [esp + 4], eax
    call scanf
    add ebx, 1                      ; увеличиваем i+=1
    cmp [ebp-4], ebx                    ; i<n
    jg input_loop
    
prepare:
    mov ebx, 1                    ;начальный индекс внешнего цикла i
    
start_sorting:
    cmp ebx, [ebp-4]  ;if (i >= n - 1) goto print_array;
    jge temp
    mov edx, [esi+ebx * 4]    ;minIdx = i;
    mov ecx, ebx    ;j=i
    add ecx, -1      ;j = j-1
    jmp swap

swap:
    jmp check1
    
check1:
    cmp ecx, 0 ;j < 0
    jl insert
    jmp check2
    
check2:
    cmp [esi+ecx * 4], edx ; arr[j] < key
    jle insert
    jmp swap2
    
swap2:
    mov edi, [esi+ecx * 4]
    mov [esi+ecx * 4 + 4], edi
    add ecx, -1
    jmp swap
    
insert:
    mov [esi+ecx * 4 + 4], edx
    add ebx, 1
    jmp start_sorting
        
temp:
    mov ebx, 0
     
    
output_loop:
    cmp ebx, [ebp-4]
    jge end
    lea eax, [fmt]
    mov [esp], eax
    mov eax, [esi + ebx*4] 
    mov [esp + 4], eax
    call printf
    add ebx, 1
    cmp [ebp-4], ebx
    jg output_loop

end:
    mov [esp], esi
    call free   
    leave
    mov ebp, esp
    pop ebx
    pop esi
    ret
 
      