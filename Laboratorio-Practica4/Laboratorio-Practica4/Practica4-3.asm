/*
 * Practica4-3.asm
 *
 *  Created: 24/02/2020 09:31:07 a. m.
 *   Author: Braulio Garc?a
 */ 
 
main:
	lds r16, $0026
	sbrc r16,4 ;Push
		jmp EnqueueRam
	sbrc r16, 5 ;Pop
		jmp Altos
	jmp main

Altos:
	cp r26,r28
	brbs 1, Bajos
	jmp DequeueRam

Bajos:
	cp r27,r29
	brbs 1, main
	jmp DequeueRam
	
EnqueueRam:
	andi r16,0x0F
	lds r17, $0023
	lds r18, $0026
	rol r16
	rol r16
	rol r16
	rol r16
	or  r16, r17
	st X+,r16
	jmp main

DequeueRam:
	ld r0,Y+
	STS $002B, r0
	jmp main