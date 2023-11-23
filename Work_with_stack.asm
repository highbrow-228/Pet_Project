; Working with the stack.

;This program calculates the average of two arrays of integers 
;and writes them to the file, and outputs the results to the screen 
;using Linux system calls as assembly code.

section .data

array1 dw 5, 15, 25, 45, 85
array1_size dw 5

array2 dw 10, 20, 30, 40, 50, 70
array2_size dw 6

filename db "results.txt", 0

section .bss
average1 resd 1
average2 resd 1

buffer resb 256

section .text
global _start

_start:
    push ecx
    lea eax, [array1]

    mov cx, [array1_size]

    call calc_average
    mov [average1], eax

    lea eax, [array2]

    mov cx, [array2_size]

    call calc_average
    mov [average2], eax

    ; Open file for writing
    mov eax, 5
    lea ebx, [filename]
    mov ecx, 0x201
    mov edx, 0x1B6
    int 0x80
    mov esi, eax
    mov eax, 4
    mov ebx, esi
    lea ecx, [average1]
    mov edx, 4
    int 0x80
    lea ecx, [average2]
    int 0x80
    mov eax, 6
    int 0x80

    ; Display results on the screen
    mov eax, 4
    mov ebx, 1
    lea ecx, [average1]
    mov edx, 4
    int 0x80

    lea ecx, [average2]
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

calc_average:
    push ecx
    xor edi, edi
    xor ebx, ebx

.loop:
    add edi, [eax]
    add eax, 2
    inc ebx
    cmp ebx, ecx
    jl .loop

    xor edx, edx
    div ecx
    pop ecx
    ret
