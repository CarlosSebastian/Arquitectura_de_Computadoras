.global main
main:
	MOV R0,#1
	MOV R1,#0
	MOV R2,#1
	MOV R3,#1
loop:
	ADD R3,R3,#1
	CMP R3,R0
	PUSHLE {R2}
	ADDLE R2,R2,R1
	POPLE {R1}
	BLE loop
done:
	MOV R0,R1
	//BX lr