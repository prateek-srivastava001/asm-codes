MOV A, #9CH
MOV B, #0AH
DIV AB
MOV R0, B
MOV B, #0AH
DIV AB
MOV R1, B
MOV R2, A