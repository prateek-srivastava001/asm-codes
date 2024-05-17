;---transfer block of 4 word from ROM to RAM after complementing----
    AREA prog,CODE,READONLY
    ENTRY
    MOV R0,#4
    LDR R1,=X
    LDR R2,=Y
LOOP
    LDR R3,[R1],#4
    MVN R3,R3
    STR R3,[R2],#4
    SUBS R0,R0,#1
    CMP R0, #0
BNE LOOP

X DCD 0,1,2,0xFFFFFFFF
    AREA data1,DATA,READWRITE
Y DCD 0,0,0,0
    END