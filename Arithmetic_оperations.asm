;Add (A = B + C): Reads the values of B and C from memory, 
;adds them, and writes the result to variable A.

;Subtract (D = A - E): Reads the values of A and E from memory, 
;subtracts the value of E from A, and writes the result to the variable D.

section .text
global _start

_start:
; A = B + C
mov eax, [B]
mov ebx, [C]
add eax, '0'
add ebx, '0'
add eax, ebx
sub eax, '0'
mov [A], eax

mov eax, 4
mov ebx, 1
mov ecx, A
mov edx, 4
int 0x80


mov eax, 4
mov ebx, 1
mov ecx, space
mov edx, space_len
int 0x80

; D = A - E
mov eax, [A]
mov ebx, [E]
sub eax, ebx
mov [D], eax

mov eax, 4
mov ebx, 1
mov ecx, D
mov edx, 4
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, nl
mov edx, nl_len
int 0x80

mov eax, 1
xor ebx, ebx
int 0x80

section .data
B dd 3
C dd 1
E dd 2
D dd 4
A dd 4

msg db "Result: ", 10, 0
msg_len equ $-msg

space db " ", 0
space_len equ $-space

nl db 10
nl_len equ $-nl