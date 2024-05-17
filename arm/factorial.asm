;---factorial of 10-----
    AREA Factorial,CODE,READONLY
    ENTRY
NUM EQU 10
    LDR R0,=NUM
    MOV R3,#1
    BL FACT ;CALL SUBROUTINE
    LDR R5,=X
    STR R3,[R5]

HERE B HERE

FACT
    CMP R0,#1
    MULGT R3,R0,R3  ; multiply
    SUBGT R0,R0,#1  ; if num > 1; num = num -1
    BGT FACT   ; repeat if numm > 1
    BX LR      ; return from subroutine


    AREA ANS,DATA,READWRITE
X DCD 0
    END