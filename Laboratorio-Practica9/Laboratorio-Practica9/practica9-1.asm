;
; Laboratorio-Practica9.asm
;
; Created: 18/05/2020 12:39:37 p. m.
; Author : Braulio García
;


; Replace with your application code

.def motor=r16

.ORG 0x00
jmp reset

.ORG 0x02
jmp ManejoINT0

.ORG 0x100 ;Dirección 100h del programa.
reset:
    ldi motor, 0b00000011
    sts $0069,motor ;EICRA = r16, habilitando INT0 con flanco positivo
    LDI r16, 0b0000_0001
    OUT 0x1D, r16 ;EIMSK = r16, habilitando INT0.
    ldi motor,0x00 
    out ddrd, motor
    ldi motor,0xFF
    out ddrb, motor
    ldi motor,0x01
    sei
    jmp main

.ORG 0x500
main:
    out portb,motor
    rjmp main

.ORG 0x700
ManejoINT0:
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
