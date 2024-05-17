MOV A, #6
JNB ACC.0, YES           ; if ACC.0 = 0, it's even
MOV R1, #1H    ; r1 = 1, if odd
YES: MOV R0, #1H ; r0 = 0, if even
END