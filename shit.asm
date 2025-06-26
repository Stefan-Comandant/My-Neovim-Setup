.section text
global _start
_start:
    MOV eax,1
    MOV ebx,0
    INT 0x80
    CALL foo
    
foo:
