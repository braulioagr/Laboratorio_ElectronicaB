;
; Laboratorio-Practica7.asm
;
; Created: 17/03/2020 07:52:06 p. m.
; Author : Braulio García
;

;
; Laboratorio-Practica3.asm
;
; Created: 13/02/2020 01:19:10 p. m.
; Author : Braulio García
;
ldi r16, 0xFF
out ddrd, r16
out ddrb, r16
ldi r16, 0x00
out ddrc, r16
ldi r20,0x84
jmp Convierte

main:
    ldi r19,0x01
    out PORTB,r19
    in r18,PINC
    andi r18,0x0F
    cpi r18,0x00
    brne Convierte
    rol r19
    out PORTB,r19
    in r18,PINC
    andi r18,0x0F
    cpi r18,0x00
    brne Convierte
    rol r19
    out PORTB,r19
    in r18,PINC
    andi r18,0x0F
    cpi r18,0x00
    brne Convierte
    rol r19
    out PORTB,r19
    in r18,PINC
    andi r18,0x0F
    cpi r18,0x00
    brne Convierte
    jmp main
; Si el valor es igual al numero  buscado saltamos en cada caso

delay:
	ldi  r21, 41
	ldi  r22, 150
	ldi  r23, 128
L1:
	dec  r23
	brne L1
	dec  r22
	brne L1
	dec  r21
	brne L1
	ret

wait:
    rol r18
    rol r18
    rol r18
    rol r18
    or r19,r18
    mov r20,r19
	call delay
	ejecuta:
		in r17, PINC
		andi r17,0x0F
		cpi r17, 0x00
			brne ejecuta
	jmp Convierte
Convierte:
    rol r18
    rol r18
    rol r18
    rol r18
    or r19,r18
    mov r20,r19
    CPI r20, 0x14
    brbs 1, zero
    CPI r20, 0x88
    brbs 1, uno
    CPI r20, 0x84
    brbs 1, dos
    CPI r20, 0x82
    brbs 1, tres
    CPI r20, 0x48
    brbs 1, cuatro
    CPI r20, 0x44
    brbs 1, cinco
    CPI r20, 0x42
    brbs 1, seis
    CPI r20, 0x28
    brbs 1, siete
    CPI r20, 0x24
    brbs 1, ocho
    CPI r20, 0x22
    brbs 1, nueve
    CPI r20, 0x81
    brbs 1, A
    CPI r20, 0x41
    brbs 1, B
    CPI r20, 0x21
    brbs 1, C
    CPI r20, 0x11
    brbs 1, D
    CPI r20, 0x12
    brbs 1, E
    CPI r20, 0x18
    brbs 1, F
    jmp main

;Asignamos el valor de salida mapeado para los 7 segmentos al registro 18 eso es en todas las etiquetas que empiecen con "CONVIERTE"
zero:
    ldi r20, 0x3F
    jmp Salida

uno:
    ldi r20, 0x86
    jmp Salida

dos:
    ldi r20, 0b01011011
    jmp Salida

tres:
    ldi r20, 0xCF
    jmp Salida

cuatro:
    ldi r20, 0x66
    jmp Salida

cinco:
    ldi r20, 0xED
    jmp Salida

seis:
    ldi r20, 0x7D
    jmp Salida

siete:
    ldi r20, 0xC7
    jmp Salida

ocho:
    ldi r20, 0x7F
    jmp Salida

nueve:
    ldi r20, 0xEF
    jmp Salida

A:
    ldi r20, 0x77
    jmp Salida

B:
    ldi r20, 0xFC
    jmp Salida

C:
    ldi r20, 0x39
    jmp Salida

D:
    ldi r20, 0xDE
    jmp Salida

E:
    ldi r20, 0x79
    jmp Salida

F:
    ldi r20, 0xF1
    jmp Salida

;Asignamos al portD lo que tenga en el registro 18 y volvemos al ciclo
Salida:
    out PORTD,r20
    jmp main