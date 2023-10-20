.global _start
_start:
	
MOV R5, #0x3F000000
ORR R5, R5, #0x800000
MOV R4, #0x40000000
ORR R4, R4, #0xF00000
BL FLOATING_POINT_SUM
MOV R6, #0
MOV R4, #0x40000000
ORR R4, R4, #0xB00000
MOV R5, #0x40000000
ORR R5, R5, #0x600000
BL FLOATING_POINT_SUM
B END

FLOATING_POINT_SUM:
	SUB SP, SP, #12
	STR R5, [SP, #-4]
	STR R4, [SP]
	
	@; PASO 1: Conseguir los exponentes de los sumandos 1 y 2
    LSL R0, R4, #1
	AND R0, R0, #0xFF000000
	LSR R0, R0, #24         @; R0: Exponente del sumando 1
	LSL R1, R5, #1
	AND R1, R1, #0xFF000000
    LSR R1, R1, #24         @; R1: Exponente del sumando 2
    
	@; PASO 2: Conseguir las mantissas de los sumandos 1 y 2
    AND R2, R4, #0xFFFFFF   
	ORR R2, R2, #0x800000   @; R2: Mantissa del sumando 1
    AND R3, R5, #0xFFFFFF   
	ORR R3, R3, #0x800000   @; R3: Mantissa del sumando 2
	
	@; PASO 3: Comparando los exponentes por sustracción y verificando cual es el mayor
    SUBS R7, R1, R0
	BPL OMITIR_1
		@ En caso que la resta sea menor a 0, será necesario intercambiar valores antes de continuar
    SUB R7, R0, R1
		@;Restamos por segunda vez para obtener el resultado positivo
	MOV R8, R1
    MOV R1, R0
    MOV R0, R8
		@; Intercambio en los exponentes
    MOV R8, R3
    MOV R3, R2
    MOV R2, R8
		@; Intercambio en las mantissas
	
	OMITIR_1:
	@; R7: La diferencia no negativa entre los exponentes
	@; R1: Almacena el exponente mayor
	
	@; PASO 4: Desplazar hacia la derecha la mantisa con menor exponente
    LSR R2, R2, R7
    
	@; PASO 5: Procedemos a sumar las mantissas
    ADD R3, R3, R2
	@; R3: Alamcena el resultado de la suma
    MOV R2, #0
	
    @; Paso 6: Normalizamos la mantisa en caso de que la suma cause overflow o la diferencia es cero
    CMP R3, #0x01000000
    
	BMI OMITIR_3
    LSR R3, R3, #1
    ADD R1, R1, #1
	
	OMITIR_3:
    @; Paso 7: Juntando el exponente y la mantissa en un solo registro
	LSL R1, R1, #23
	SUB R3, R3, #0x800000
	
	ORR R6, R1, R3
	@; R6: Resultado de la suma de dos números flotantes positivos
	
	LDR R5, [SP, #-4]
	LDR R4, [SP]
	ADD SP, SP, #12
	MOV PC, LR

END: