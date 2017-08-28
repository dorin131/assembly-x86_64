%include "macros.asm"

section .text
    global main
    
main:
    mov rbp, rsp; for correct debugging 
    print msg1
    read name, 16
    print msg2
    print name
    exit
    
section .data
    msg1        db  'what is your name?',10,0   ;10 is for carriage return
    msg2        db  'hello ',0
    SYS_EXIT    equ 60    
    
section .bss
    name resb 16                        ;reserve 16 bytes for name