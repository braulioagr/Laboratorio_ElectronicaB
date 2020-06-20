/*
 * practica3_2.asm
 *
 *  Created: 18/02/2020 09:01:50 a. m.
 *   Author: Braulio García
 */ 
 
LDI R16, 0xFF
STS $002A, R16
LDI R16, 0x00 ;Puerto C y numero de 4 bits
LDI R20, 0x00 ;Puerto B y numero de 5 bits, el mas significativo  es el push buton
STS $0027, R16
STS $0024, R20
main:
	LDS r16, $0026
	SBRS R16,4
		jmp main
	jmp multiplica; Mandamos llamar a la etiqueta que se encarga de multiplicar

multiplica:	
	ANDI r16,0x0F
	LDS r20, $0023
	ANDi r20, 0x0F
	MUL r20, r16
	STS $002B, r0
	jmp main