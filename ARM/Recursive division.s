.global _start
_start:
	@R0 = 19 o 13 residuo ,R2 = 4 Divisor , R3 = Cociente
	@SR = 200 <- hexa
DIVISION:
	MOV R1, #1
	PUSH {R1, LR}
	CMP R2, R0
	BLE ELSE
	MOV R1, #0
	ADD SP, SP, #8
	MOV PC, LR
ELSE:
	SUB R0, R0, R2
	BL DIVISION
	POP {R4, LR}
	ADD R3, R4, R3
	MOV PC, LR 