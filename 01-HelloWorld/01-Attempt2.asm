; 0x86_64


section .data ; used for storing constants and other stuff, bss is used for variables
    msg: db "Hello World!", 10 ; sets the memory address for the label to the following byte values
    msglen: equ $-msg ; getting the length of the bytes

section .text ; stores the actual code to be ran
    global _start ; defining a global entry point

_start:

    ; format of a syscall
    ; rax = which syscall you want to use
    ; rdi, rsi, rdx, r10, r8, r9 = order of arguments?

    mov rax, 1 ; sys_write
    mov rdi, 1 ; file descriptor, 1 = stdout
    mov rsi, msg ; bytes to add to the buffer
    mov rdx, msglen ; buffer length
    syscall ; execute syscall


    mov rax, 0 ; sys_read
    sub rsp, 8 ; allocate 8-bytes on the stack as a read buffer?
    mov rdi, 0 ; stdin
    lea rsi, [rsp] ; set const char *buf to the 8-byte space on the stack ?
    mov rdx, 1 ; one character
    syscall


    mov rax, 60 ; sys_exit
    mov rdx, 0 ; error_code, 0 = default exit code
    syscall