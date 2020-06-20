/*
 * AsmFile1.asm
 *
 *  Created: 11/03/2020 01:30:22 p. m.
 *   Author: Braulio Garc?a
 */
.def b = r20
.def temp = r16
ldi temp, 0x08
sts $0061,temp

ldi temp, 0x80
sts $0061,temp

ldi temp, 0x03
sts $0061,temp

ldi b, 0x00
ldi temp, 0xFF
out ddrb, temp
out portb, b

main:
	ldi b, 0x20
	out portb, b
	call delay
	ldi b, 0x00
	out portb, b
	call delay
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