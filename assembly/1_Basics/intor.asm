section .data
    msg db "Hello, World!", 0xA   ; Define the message (newline at the end)
    len equ $ - msg               ; Calculate the length of the message

section .text
    global _start                 ; Entry point for the program

_start:
    ; Write syscall
    mov eax, 4                    ; syscall: write
    mov ebx, 1                    ; file descriptor: stdout
    mov ecx, msg                  ; address of the message
    mov edx, len                  ; length of the message
    int 0x80                      ; interrupt to call the kernel

    ; Exit syscall
    mov eax, 1                    ; syscall: exit
    xor ebx, ebx                  ; exit code: 0
    int 0x80                      ; interrupt to call the kernel
