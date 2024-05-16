MOV A, #10010011B              ;store number in accumulator
MOV R7, #08H                   ;counter coz 8 bits so 8 times loop
MOV R5, #00H                   ;to store result
BACK: RRC A                    ;RRC-> rotate right with carry, basically sends the last digit in front as a carry
JNC L1                         ;if no carry then jump to L1 else execute the next instruction
INC R5                         ;increment r5 coz we found a 1 coz CY=1 because prev statement wudnt have let this execute if CY was 0
L1: DJNZ R7, BACK              ;decrement and jump if r7 not equal to 0
HERE: SJMP HERE                ;stay here indefinitely
END