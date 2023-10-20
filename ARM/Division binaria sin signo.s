.global _start
_start:
	
	MOV R0,#147	//DIVIDENDO
    MOV R1,#4	//DIVISOR
    MOV R2,#0	//COCIENTE
    MOV R3,R0	//RESIDUO
division:
	CLZ R12,R3 //Contar leading zeros del residuo
	CLZ R11,R1 //Contar leading zeros del divisor
	SUB R10,R11,R12 //Almacenar diferencia de leading zeros del divisor y el residuo en R10
	LSL R4,R1,R10 //Almacenamos en R4 el divisor shifteado a la izquierda R10 veces
sub:
	SUBS R3,R3,R4 //Restar R4 del residuo y activa flags
	ADDMI R3,R3,R4 //Si la resta es negativa, restablecer residuo
	LSL R2,R2,#1
	ADDPL R2,R2,#1 //Cociente++ si la primera resta de la funcion sub es positiva o cero
	LSR	R4,R4,#1
	CMP R4,R1 
	BGE sub //Ir a branch si R4 es mayor o igual que R1