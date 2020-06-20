;
; Practica6.asm
;
; Created: 05/03/2020 02:10:23 p. m.
; Author : Braulio García
;
.def d = r19
.def b = r20
ldi r16, 0xFF
out ddrd, r16
out ddrb, r16
ldi r16, 0x00
out ddrc, r16
ldi d,0x01
ldi b,0x00
jmp salida

main:
	in r16, PINC
	andi r16,0x03
	cpi r16, 0x00
	brne wait
	jmp main


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
	call delay
	ejecuta:
		in r17, PINC
		andi r17,0x03
		cpi r17, 0x00
			brne ejecuta
	jmp desplaza


desplaza:
	sbrc r16, 0
		jmp izquierda
	jmp derecha

derecha:
	ror d
	brcs saltaPortBDerecha
	ror b
	brcs saltaPortDDerecha
	jmp salida

izquierda:
	rol d
	brcs saltaPortBIzquierda
	rol b
	SBRC b,6
		jmp saltaPortDIzquierda
	clc
	jmp salida

saltaPortBDerecha:
	clr d
	ldi b,0x20
	clc
	jmp salida

saltaPortBIzquierda:
	clr d
	ldi b,0x01
	clc
	jmp salida

saltaPortDIzquierda:
	clr b
	ldi d,0x01
	clc
	jmp salida

saltaPortDDerecha:
	clr b
	ldi d,0x80
	clc
	jmp salida

salida:
	sts $002B,d
	sts $0025,b
	call delay
	jmp main