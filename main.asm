section .data
    text: db "*", 0
    textlen: equ $-text-1
    count: dq 0
    enemy: dq 1
    nl: db 10 ; 10 - newline character
    SizeOfLadder: dq 6 ; Change it to size of ladder you want
section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, textlen
    syscall
    inc qword [count]
    mov r8, [enemy]
    mov r9, [count]
    cmp r9, r8      ; if r9 < r8 jump to start
    jl _start
    jmp newline     ; else add newline

newline:
    mov r10, qword [SizeOfLadder]
    mov rax, 1
    mov rdi, 1
    mov rsi, nl
    mov rdx, 1
    syscall
    inc qword [enemy]
    mov qword [count], 0
    cmp qword [enemy], r10  ; if enemy value is less then 6 jump to start
    jl _start 
    jmp exit              ; else exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
    
