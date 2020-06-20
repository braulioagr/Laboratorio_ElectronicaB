/*
 * practica4-2.asm
 *
 *  Created: 20/02/2020 02:04:38 p. m.
 *   Author: Braulio Garc?a
 */ 
//Configuración del sistema
	ldi r16, 0x00
	sts $0027, r16
	sts $0024, r16
	ldi r18, 0xFF
	sts $002A,r18
	ldi R26, 0x55;Apuntador parte baja
	ldi R27,0x01;Apuntador parte alta
	ldi R28,0x55;Piso parte vaja
	ldi R29, 0x01;Piso parte Alta
	
//MAIN
main:
	lds r16, $0026
	lds r17, $0023
	lds r18, $0026
	andi r16,0x0F
	rol r16
	rol r16
	rol r16
	rol r16
	or  r16, r17
	sbrc r18,4 ;Push
		jmp PushRam
	sbrc r18, 5 ;Pop
		jmp Altos
	jmp main

Altos:
	cp r26,r28
	brbs 1, Bajos
	jmp PopRam

Bajos:
	cp r27,r29
	brbs 1, main
	jmp PopRam
	
PushEEProm:
	st X+,r16
	jmp main

PopEEProm:
	ld r0,-X
	STS $002B, r0
	jmp main