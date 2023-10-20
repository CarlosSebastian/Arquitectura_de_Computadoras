.global _start
_start:
	
	MOV R0,#-19	//DIVIDENDO
    MOV R1,#5	//DIVISOR
    MOV R2,#0	//COCIENTE
	MOV R5,#2000
positivo:
	CMP R0,#0 //Verificamos si es Positivo o Negativo
	MOVPL R6,#0	//	Si es positivo
	MOVMI R6,#-1 //	Si es negativo
	STR R6,[R5] //Guardamos si es negativo o positivo
	MULMI R0,R0,R6 //Si es negativo lo convertimos a positivo
	CMP R1,#0 //Verificamos si es Positivo o Negativo
	MOVMI R6,#-1 //	Si es negativo
	MOVPL R6,#0	//	Si es positivo
	STR R6,[R5,#4] //Guardamos si es negativo o positivo
	MULMI R1,R1,R6 //Si es negativo lo convertimos a positivo
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
negativo:
	LDR	R6,[R5]
	LDR	R7,[R5,#4] //Cargamos los valores que tenemos en la memoria en 2 registros
	CMP R6,R7 //Comparamos ambos registros
	MULLT R2,R2,R6
	MULGT R3,R3,R7
	CMPEQ R7,#-1
	MULEQ R3,R3,R7 //Convertimos en negativo el cociente o el residuo dependiendo de los 2 registros anteriores
	