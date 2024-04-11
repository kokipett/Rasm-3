.global String_equals

.data
//w1 = byte of string 1
//w2 = byte of string 2

//X2 = offset
//X3 = offset
//X20 = 1

.text

//INPUT: X0 (string) and X1 (strnig)
//OUTPUT: bytes 0/1, 0 = false, 1 = true

String_equals:

	STR	X30,	[SP,#-16]!
	//STR	X1,	[SP,#-16]!
	STR	X2,	[SP,#-16]!
	STR	X3,	[SP,#-16]!
		//STR	X2,	[SP,#-16]!
	//STR	X3,	[SP,#-16]!
/*
//get string length in x2
	BL	String_length
	MOV	X3,X0


//get second string length in x3
	MOV	X0, X1
	STR	X1,[SP,#-16]!
	BL	String_length
	MOV	X4,X0

//compare lengths
	CMP	X3,X4
	BNE	False

	MOV	X2, #1
	MOV	X4, #0

	LDR	X1,[SP], #16
	LDR	X0,[SP], #16
	LDR	X30,[SP], #16
*/
//for every byte x0 and x1

	MOV	X2,#0
	MOV	X3,#0

	loop1:
		LDRB	W8,[X0,X2]
		LDRB	W9,[X1,X3]

		CMP	W8,#0
		BEQ	Check

		CMP	W9,#0
		BEQ	Check

		CMP	W8,W9
		BNE	False

		ADD	X2,X2,#1
		ADD	X3,X3,#1
		B	loop1

	//MOV	X2,#0
	
	/*Loop:
		LDRB	W3, [X0]
		LDRB	W4, [X1]

		CMP	W3,#0
		BEQ	Check

		CMP	W4,#0
		BEQ	Check

		CMP	W3,W4
		BNE	False

		//ADD	X3,X3,#1
		B	Loop
*/
	Check:
		CMP	W8,W9
		BEQ	True
		B 	False


	False:
		MOV	X0,#0
		B	End
	True:
		MOV	X0,#1
		B	End


	End:
		LDR	X3,[SP], #16
		LDR	X2,[SP], #16
		//LDR	X1,[SP], #16
		//LDR	X0,[SP], #16
		LDR	X30,[SP], #16

		RET
.end
