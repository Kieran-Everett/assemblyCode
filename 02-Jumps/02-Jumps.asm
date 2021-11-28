section .data
    m1: db 7
    m2: db 3

section .text
    global _start

_start:
    
    mov rbx, m2
    loop:
        add rax, m1
        sub rbx, 1
        cmp rbx, 0
        jnz loop