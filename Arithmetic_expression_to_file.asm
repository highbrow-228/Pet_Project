; F=(g+h)-(i+j) 

section .text
global _start

_start:

; g + h
mov eax, [g]
mov ebx, [h]
add eax, ebx

; i + j
mov ebx, j
mov ecx, i
add ebx, ecx

; (g + h) - (i + j)
sub eax, ebx
add eax, '0'

; F = (g + h) - (i + j)
mov [F], eax

; відкриваємо файл
mov eax, 5
mov ebx, file_name
mov ecx, 0x201
mov edx, 0644
int 0x80

mov esi, eax

; записуємо змінну F у файл
mov ebx, esi
mov ecx, F
mov edx, 4
mov eax, 4
int 0x80

; закриваємо файл
mov eax, 6
mov ebx, esi
int 0x80

; виводимо змінну F на консоль
mov eax, 4
mov ebx, 1
mov ecx, F
mov edx, 4
int 0x80

; виводимо символ кінця рядка на консоль
mov eax, 4
mov ebx, 1
mov ecx, nl
mov edx, nl_len
int 0x80

; виходимо з програми
mov eax, 1
xor ebx, ebx
int 0x80

section .data
nl db 10
nl_len equ $ - nl

g dd 4
h dd 4
i dd 1
j dd 1
F dd 0
file_name db "
