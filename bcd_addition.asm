MOV R0, #40H
CLR A
MOV R7, A
MOV R2, #5

AGAIN:  ADD A, @R0
		DA A
		JNC NEXT
		INC R7

NEXT:   INC R0
DJNZ R2, AGAIN