;----take data from ports 0,1,2 and transmit serially---
MOV A, #0FFH
MOV P0, A
MOV P1, A
MOV P2, A
MOV TMOD, #20H
MOV SCON, #50H
MOV TH1, #-6 ;4800 baud rate
SETB TR1
BACK: MOV A, P0
LCALL SEND
MOV A, P1
LCALL SEND
MOV A, P2
LCALL SEND
SJMP BACK


SEND: MOV SBUF, A
HERE: JNB TI, HERE
CLR TI
RET
END