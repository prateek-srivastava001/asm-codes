;----x^2 + 3x + 5--------
AREA prog,CODE,READONLY
ENTRY
MUL R1, R0, R0  ; r1 = x^2
MUL R2, R0, #3  ; r2 = 3x
ADD R3, R1, R2  ; r3 = x^2 + 3x
ADD R3, R3, #5  ; r3 = x^2 + 3x + 5 
LDR R5,=X
STR R3,[R5]

AREA ANS,DATA,READWRITE
X DCD 0
END