MOV P2, #0FFH		; make P2 an input port

K1: MOV P1, #00H			; ground all rows at once
MOV A, P2					; read all columns
ANL A, #00001111B			; mask unused bits
CJNE A, #00001111B, K2		; check if key pressed
SJMP K1	

K2: ACALL DELAY
ANL A, #00001111B
CJNE A, #00001111B, CHECKROW	;key pressed, find row
SJMP K2							;check till key pressed

CHECKROW: MOV P1, #11111110B	; ground row 0
MOV A, P2					; read all cols
ANL A, #00001111B			; mask unused bits
CJNE A, #00001111B, ROW_0		; key row 0, find col

MOV P1, #11111101B		; ground row 1
MOV A, P2
ANL A, #00001111B
CJNE A, #00001111B, ROW_1

MOV P1, #11111011B
MOV A, P2
ANL A, #00001111B
CJNE A, #00001111B, ROW_2

MOV P1, #11110111B
MOV A, P2
ANL A, #00001111B
CJNE A, #00001111B, ROW_3

LJMP K1		; if none, false input so repeat

ROW_0: MOV DPTR, #KCODE0
SJMP FIND
ROW_1: MOV DPTR, #KCODE1
SJMP FIND
ROW_2: MOV DPTR, #KCODE2
SJMP FIND
ROW_3: MOV DPTR, #KCODE3
SJMP FIND

FIND: RRC A	;if any CY bit low
JNC MATCH	;if zero then get ASCII code
INC DPTR	; search further
SJMP FIND

MATCH: CLR A		; A = 0 (MATCH FOUND)
MOVC A, @A+DPTR		; GET ASCII FROM TABLE
MOV P0, A			; DISPLAY PRESSED KEY
LJMP K1


DELAY: MOV R0, #0FFH
AGAIN: MOV R1, #0FFH
HERE: DJNZ R1, HERE
DJNZ R0, AGAIN
RET

ORG 300H
KCODE0: DB '0','1','2','3'
KCODE1: DB '4','5','6','7'
KCODE2: DB '8','9','A','B'
KCODE3: DB 'C','D','E','F'

END