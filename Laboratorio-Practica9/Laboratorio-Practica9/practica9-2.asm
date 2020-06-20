/*
 * practica9_2.asm
 *
 *  Created: 20/05/2020 03:30:09 p. m.
 *   Author: Braulio Garc?a
 */ 
 
.def motor=r16
.def band=r17
.def config=r18
.ORG 0x00
jmp reset

.ORG 0x02
jmp ManejoINT0


.ORG 0x04
jmp ManejoINT1

.ORG 0x100 ;Dirección 100h del programa.
reset:
    ldi config, 0b0000_0111
	ldi band,0xFF
    sts $0069,config ;EICRA = r18, habilitando INT0 con flanco positivo e INT1 con cambios logicos
    ldi config, 0b0000_0011
    out EIMSK, config ;EIMSK = r18, habilitando INT0.
    ldi config,0x00 
    out ddrd, config
    ldi config,0xFF
    out ddrb, config
    ldi motor,0x01
    sei
    jmp main

.ORG 0x500
main:
    out portb,motor
    rjmp main

.ORG 0x700
ManejoINT0:
	cpi band,0x00
	lds config, 0x5F
	sbic 18,1
		reti
    rol motor
    sbrc motor,4
        ldi motor,0x01
    ldi  r30, 17
    ldi  r31, 60
    ldi  r20, 204
    L1: dec  r20
		brne L1
        dec  r31
		brne L1
		dec  r30
		brne L1
    reti

.ORG 0x900
ManejoINT1:
	in config,pind
	sbic 18,3
		ldi band,0xff
	sbis 18,3
		ldi band,0x00
	reti