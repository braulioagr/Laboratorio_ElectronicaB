;
; Practica 6_2.asm
;
; Created: 06/03/2019 11:24:23 a. m.
; Author : mygtg
;


; Replace with your application code
LDI R16, 0xFF
OUT DDRD, R16
OUT DDRB, R16
LDI R16, 0x00
OUT DDRC, R16
LDI R17, 0x01
LDI R18, 0x00
LDI R20, 0xFF
LDI R19, 0x00;Para verificar si la salida sera negada o normal
JMP STARTDL

STARTDL:
	IN R16, PINC
	CPI R16, 0x00
	BREQ NEXT1
	LSR R16;;Comprueba si el boton1 (bit0) esta presionado
	BRCC NOBOTON1
	CALL BOTONAZO;Si el bit0 esta en 1 se ejecuta este call
NOBOTON1: 
	LSR R16;Coprueba si el boton 2(bit 1) esta presionado
	BRCC NOBOTON2
	JMP BOTONB;Si el bit1 esta en 1 se ejecuta REinicia la secuencia
NOBOTON2:
	LSR R16;Comprueba si el boton3 (bit2) esta presionado
	BRCC NOBOTON3
	COM R18; si esta en 1s se negara a salida de los puertos
NOBOTON3:
	LSR R16;Comprueba si el boton4 (bit3) esta presionado
	BRCC NEXT1
	JMP BOTOND;Finaliza el programa

NEXT1:;Muestra la salida normal en el puerto D
	CPI R18, 0x00
	BREQ NEGAR1
	COM R17
NEGAR1:	
	OUT PORTB, R18
    OUT PORTD, R17
	CPI R18, 0x00
	BREQ NEGAR2
	COM R17
NEGAR2:
	CALL DELAY
	LSL R17
	BRSH STARTDL
	LDI R17, 0x01
	OUT PORTD, R18
	JMP STARTBL

	; Primera ejecucino de salida en el pruero D
	ROLES:
	LSR R17
	LSR R17
STARTBL:
	IN R16, PINC
	CPI R16, 0x00
	BREQ NEXT2
	LSR R16;;Comprueba si el boton1 (bit0) esta presionado
	BRCC NOBOTON11
	CALL BOTONAZO;Si el bit0 esta en 1 se ejecuta este call
NOBOTON11: 
	LSR R16;Coprueba si el boton 2(bit 1) esta presionado
	BRCC NOBOTON22
	JMP BOTONB;Si el bit1 esta en 1 se ejecuta este call
NOBOTON22:
	LSR R16;Comprueba si el boton3 (bit2) esta presionado
	BRCC NOBOTON33
	COM R18; si esta en 1s se negara a salida de los puertos
NOBOTON33:
	LSR R16;Comprueba si el boton4 (bit3) esta presionado
	BRCC NEXT2
	JMP BOTOND;Finaliza el programa
NEXT2:
	SBRC R18, 0;Salta si el bit es 0, si es 1 la sig instruccion negara la salida mostrada en R17
	COM R17
	OUT PORTD, R18
	OUT PORTB, R17
	SBRC R18, 0
	COM R17
	CALL DELAY
	LSL R17
	LSL R17
	LSL R17
	BRSH ROLES ;
	LSR R17
	LSR R17
	OUT PORTB, R18
	LDI R17, 0x20
STARTBR:
	IN R16, PINC
	CPI R16, 0x00
	BREQ NEXT3
	LSR R16;;Comprueba si el boton1 (bit0) esta presionado
	BRCC NOBOTON111
	CALL BOTONAZO;Si el bit0 esta en 1 se ejecuta este call
NOBOTON111: 
	LSR R16;Coprueba si el boton 2(bit 1) esta presionado
	BRCC NOBOTON222
	JMP BOTONB;Si el bit1 esta en 1 se ejecuta este call
NOBOTON222:
	LSR R16;Comprueba si el boton3 (bit2) esta presionado
	BRCC NOBOTON333
	COM R18; si esta en 1s se negara a salida de los puertos
NOBOTON333:
	LSR R16;Comprueba si el boton4 (bit3) esta presionado
	BRCC NEXT3
	JMP BOTOND;Finaliza el programa
NEXT3:
	SBRC R18, 0
	COM R17
	OUT PORTD, R18
	OUT PORTB, R17
	SBRC R18, 0
	COM R17
	CALL DELAY
	LSR R17
	BRSH STARTBR
	OUT PORTB, R18
	LDI R17, 0x80
STARTDR:
	IN R16, PINC
	CPI R16, 0x00
	BREQ NEXT4
	LSR R16;;Comprueba si el boton1 (bit0) esta presionado
	BRCC NOBOTON1111
	CALL BOTONAZO;Si el bit0 esta en 1 se ejecuta este call
NOBOTON1111: 
	LSR R16;Coprueba si el boton 2(bit 1) esta presionado
	BRCC NOBOTON2222
	JMP BOTONB;Si el bit1 esta en 1 se ejecuta este call
NOBOTON2222:
	LSR R16;Comprueba si el boton3 (bit2) esta presionado
	BRCC NOBOTON3333
	COM R18; si esta en 1s se negara a salida de los puertos
NOBOTON3333:
	LSR R16;Comprueba si el boton4 (bit3) esta presionado
	BRCC NEXT4
	JMP BOTOND;Finaliza el programa
NEXT4:
	SBRC R18, 0
	COM R17
	OUT PORTB, R18
    OUT PORTD, R17
	SBRC R18, 0
	COM R17
	CALL DELAY
	LSR R17
	BRSH STARTDR
	LDI R17, 0x01
	OUT PORTD, R18
	JMP STARTDL
	
BOTONAZO:
	IN R16, PINC
	LSR R16
	BRCS BOTONAZO
	CALL DELAY
BOTONA:
	IN R16, PINC
	LSR R16
	BRCC BOTONA
	RET

BOTONB:
	OUT PORTD, R19
	OUT PORTB, R19
	LDI R17, 0x01
	JMP STARTDL

DELAY:
	LDI R22, 0x25
RR2:
	LDI R20, 0xFF
RR1:
	LDI R21, 0xFF
RR:
	NOP
	DEC R21
	BRNE RR
	DEC R20
	BRNE RR1
	DEC R22
	BRNE RR2
	RET

BOTOND:
	LDI R16, 0x00
	OUT PORTB, R16
	OUT PORTD, R16
	rjmp BOTOND