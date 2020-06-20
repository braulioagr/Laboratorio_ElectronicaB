;
; Laboratorio-Practica3.asm
;
; Created: 13/02/2020 01:19:10 p. m.
; Author : Braulio García
;
//Configuración del sistema
	LDI r16, 0x00
	STS $0027, r16
	LDI r18, 0xFF
	STS $002A,r18
//MAIN
START:
	LDS r16, $0026
	SBIS 16,4
		jmp START
	jmp Convierte; Mandamos llamar a la etiqueta con el switch-case improvisado

; Si el valor es igual al numero  buscado saltamos en cada caso
Convierte:		
	CPI r16, 0x10
	BRBS 1, CONVIERTE0
	CPI r16, 0x11
	BRBS 1, CONVIERTE1
	CPI r16, 0x12
	BRBS 1, CONVIERTE2
	CPI r16, 0x13
	BRBS 1, CONVIERTE3
	CPI r16, 0x14
	BRBS 1, CONVIERTE4
	CPI r16, 0x15
	BRBS 1, CONVIERTE5
	CPI r16, 0x16
	BRBS 1, CONVIERTE6
	CPI r16, 0x17
	BRBS 1, CONVIERTE7
	CPI r16, 0x18
	BRBS 1, CONVIERTE8
	CPI r16, 0x19
	BRBS 1, CONVIERTE9
	CPI r16, 0x1A
	BRBS 1, CONVIERTE10
	CPI r16, 0x1B
	BRBS 1, CONVIERTE11
	CPI r16, 0x1C
	BRBS 1, CONVIERTE12
	CPI r16, 0x1D
	BRBS 1, CONVIERTE13
	CPI r16, 0x1E
	BRBS 1, CONVIERTE14
	CPI r16, 0x1F
	BRBS 1, CONVIERTE15
	jmp START

;Asignamos el valor de salida mapeado para los 7 segmentos al registro 18 eso es en todas las etiquetas que empiecen con "CONVIERTE"
CONVIERTE0:
	LDI r18, 0x7E
	jmp Salida

CONVIERTE1:
	LDI r18, 0x30
	jmp Salida

CONVIERTE2:
	LDI r18, 0x6D
	jmp Salida

CONVIERTE3:
	LDI r18, 0x79
	jmp Salida

CONVIERTE4:
	LDI r18, 0x33
	jmp Salida

CONVIERTE5:
	LDI r18, 0x5B
	jmp Salida

CONVIERTE6:
	LDI r18, 0x1F
	jmp Salida

CONVIERTE7:
	LDI r18, 0x71
	jmp Salida

CONVIERTE8:
	LDI r18, 0x7F
	jmp Salida

CONVIERTE9:
	LDI r18, 0x73
	jmp Salida

CONVIERTE10:
	LDI r18, 0x77
	jmp Salida

CONVIERTE11:
	LDI r18, 0x1F
	jmp Salida

CONVIERTE12:
	LDI r18, 0x4E
	jmp Salida

CONVIERTE13:
	LDI r18, 0x3D
	jmp Salida

CONVIERTE14:
	LDI r18, 0x4F
	jmp Salida

CONVIERTE15:
	LDI r18, 0x47
	jmp Salida

;Asignamos al portD lo que tenga en el registro 18 y volvemos al ciclo
Salida:
	STS $002B, r18
	jmp START