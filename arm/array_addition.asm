AREA ADDITION,CODE,READONLY
ENTRY
    LDR R1,=VALUE1
    LDR R5,[R1],#4
    MOV R8,#0
    MOV R9,#0
LOOP
    LDR R2,[R1],#4
    ADDS R8,R8,R2
    ADC R9,R9,#0
    SUBS R5,R5,#1
    CMP R5, #0
    BNE LOOP

    LDR R4,=RESULT
    STR R8,[R4],#4
    STR R9,[R4]


VALUE1 DCD 0x4, 0x00000000F, 0x12345678, 0xFA128032
AREA DATA2,DATA,READWRITE
RESULT DCD 0x0, 0x0
END