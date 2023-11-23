;This program creates a file, writes the first name, last name and newline character. 
;After that, it rewrites the first name, another last name, and one more newline 
;character to the file. The program uses Linux system calls to perform 
;these operations.

section .data
	name db 'Sviatoslav '
	name_len equ $-name

	surname1 db 'Beautifull'
	surname_len1 equ $-surname1
	
	surname2 db 'Strong'
	surname_len2 equ $-surname2
	
	newline db 10 ; ASCII code for the newline character (\n)

	filename db 'result.txt', 0
	filemode dw 0655o
	
section .text
	global _start

_start:
    mov eax, 5
    mov ebx, filename
    mov ecx, 1
	mov edx, filemode
    int 0x80
	
	mov ebx, eax 	; descriptor
	
	mov eax, 4
	mov ebx, ebx
	mov ecx, name
	mov edx, name_len
	int 0x80

	mov eax, 4
	mov ebx, ebx
	mov ecx, surname1
	mov edx, surname_len1
	int 0x80
	
    mov eax, 4		; '\n'
    mov ebx, ebx
    mov ecx, newline
    mov edx, 1
    int 0x80
	
;///////////////////////////////////////////////////////////////////////////////////////////
	mov eax, 4
	mov ebx, ebx
	mov ecx, name
	mov edx, name_len
	int 0x80
	
	mov eax, 4
	mov ebx, ebx
	mov ecx, surname2
	mov edx, surname_len2
	int 0x80
	
	mov eax, 4
    mov ebx, ebx
    mov ecx, newline
    mov edx, 1
    int 0x80
	
    mov eax, 6
    mov ebx, [ebp-4]
    int 0x80
	
	mov eax, 1
	int 0x80