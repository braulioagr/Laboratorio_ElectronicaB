;
; Laboratorio-Practica10.asm
;
; Created: 25/05/2020 12:54:03 p. m.
; Author : Braulio García
;

/**/
.def config = r16
.def motor = r17;

.org 0x00
jmp reset

.org 0x001E //direccion de TIMER0_COMPB 
jmp MANEJO_TIMER0_B

.org 0x100 ;Dirección 100h del programa.
reset:
    ldi config, 0xFF 
    sts $0024, config
    ldi config, 0x00 
    sts $002A, config
    ldi config, 0x04 
    sts $006E, config// configuracion del registro de Mascara de interrupcion  de TC0 
    ldi config, 0x00 
    sts $0046, config // configuracion de contador TC0 
    ldi config, 0x08
    sts $0048, config // configuracion del registro de comparacion B de TC0 
    sei 
    ldi config, 0x07 
    sts $0045, config// Configuracion de TC0 Control Register B  
    ldi motor, 0x01
    ldi config,0x00
    jmp main

.org 0x500
main:
    out portb,motor
    rjmp main

.org 0x700
MANEJO_TIMER0_B:
    rol motor
    sbrc motor,6
        ldi motor,0x01
    ldi config, 0x00 
    sts $0046, config // configuracion de contador TC0 
    reti