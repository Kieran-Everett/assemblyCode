; helloWorld.asm
; x86

; Comments are like so

global _start

section .text: ; program stuff

_start:
    mov eax, 0x4 ; uses the write syscall
    mov ebx, 1 ; use stdout
    mov ecx, message ; use message as buffer
    mov edx, message_length ; length of the buffer needed
    int 0x80 ; invoke syscall

    ; exit the program

    mov eax, 0x1
    mov ebx, 0
    int 0x80

section .data: ; data
    message: db "Hello World!", 0xA
    message_length equ $-message ; get length of message