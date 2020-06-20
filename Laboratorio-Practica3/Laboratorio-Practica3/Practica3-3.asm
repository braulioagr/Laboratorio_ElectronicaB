/*
 * Practica3_3.asm
 *
 *  Created: 18/02/2020 10:25:59 a. m.
 *   Author: Braulio García
 */ 
 
//Configuración del sistema
	LDI r16, 0x00
	STS $0027, r16
	LDI r16, 0xFF
	STS $002A,r16
//MAIN
main:
	LDI r16, $0026
	SBIC 16,4
		jmp suma
	SBIC 16,5
		jmp resta
	jmp main ; Mandamos llamar a la etiqueta con el switch-case improvisado

suma:
	jmp main
resta:
	jmp main
