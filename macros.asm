;-------------------------------
;Macro: read
;Parameter 1: where to store the text
;Parameter 2: size of parameter 1

%macro read 2
    mov rax, SYS_READ
    mov rdi, 0          ;standard input
    mov rsi, %1         ;store text at address of parameter 1
    mov rdx, %2         ;length of expected name is parameter 2
    syscall
%endmacro

;-------------------------------
;Macro: print
;Parameter 1: text to print

%macro print 1
    mov rax, %1
    call _print
%endmacro

;input: rax as pointer to string
;output: print string at rax
_print:
    push rax            ;rax will contain address to our text
    mov rbx, 0          ;set character counter to 0
_printLoop:
    inc rax             ;iterating through our string
    inc rbx             ;incrementing the counter
    mov cl, [rax]       ;move to cl (8bit) the current character
    cmp cl, 0           ;compare to 0 to check if we reached the end of string
    jne _printLoop      ;if it's not 0 then continue iterating
    
    mov rax, SYS_WRITE
    mov rdi, 1          ;file descriptor (1 - standard output)
    pop rsi             ;pop to rsi the value that was pushed by rax
    mov rdx, rbx        ;set the string length
    syscall
    ret

;-------------------------------
;Macro: exit

%macro exit 0
    mov rax, SYS_EXIT   ;id for sys_exit
    mov rdi, 0          ;error code (0 - no error)
    syscall
%endmacro

;-------------------------------
;Constants

SYS_WRITE   equ 1
SYS_READ    equ 0