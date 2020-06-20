/*
 * Practica10_2.asm
 *
 *  Created: 25/05/2020 12:54:45 p. m.
 *   Author: Braulio Garc?a
 */ 
 
.def config = r16
.def control = r19

.org 0x00
jmp config_sist
.org 0x002A //direccion del vector de interrupcion del ADC.
jmp adc_int
.org 0x100 

config_sist:
    ldi control,0x00 
    sts $0064,control // registro PRR se pone todo en 0 para controlar la energia que se consume
    ldi control,0x20
    sts $007C,control// Se ajusta con 0010_0000  para configigurar que se usa AREF,ajusta el resultado a la izquierda,y // seleccionamos el canal A0 de lectura 
    ldi control,0x8F // 88 = 1000_1111 se busca que ADIE(bit 3 este en alto para habilitar interrupciones.)
    sts $007A,control
    ldi control,0xCF
    ldi config,0xFF
    out ddrd,config
    ldi config,0x00
    out ddrb,config
    out ddrc,config
    sei
    jmp main 

.org 0x500
main:
    in r20,pinb
    sbrc r20,0
    jmp convierte
    JMP main
convierte:
    sts $007A,control
    co:
        lds r31,$007A
        sbrs r31,6
            jmp main
        jmp co

.org 0x700
adc_int: //etiqueta para la interrupcion del ADC.
    lds r31,$0079
    sts $002B,r31//sacar el valor de la lectura realizada con el ADC a las salidas del puerto D.
    reti