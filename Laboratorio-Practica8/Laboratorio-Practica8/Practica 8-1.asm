/*
 * Practica_8_1.asm
 *
 *  Created: 14/05/2020 04:37:04 p. m.
 *   Author: Braulio Garc?a
 */ 
  reset: 
    ldi r16, 0x00 

    out ddrb,r16 

    ldi r16,0xFF 
    out ddrd, r16 

    ldi r26, 0x55 
    ldi r27, 0x01 

    ldi r28, 0x55 
    ldi r29, 0x01 
    ldi r22, 0xFF
    ldi r16, 0x20
    sts $007C, r16
    ldi r16, 0x87
    sts $007A, r16
    ldi r16, 0xC7 conversion
    ldi r17, 0x01
    ldi r18, 0x01

  start:
    ldi r21,0x00 
    in r19, pinb 
    cp r27,r29 
    breq comp 
    jmp pila 

    comp:
      cp r26,r28 
      breq vacia 
      jmp pila 

     vacia:
      ldi r21,0xFF 

   pila:
     sbrc r19,0 
      jmp entra 
     sbrc r19,1 
      jmp sale 
     jmp start 

   sale:
     cpi r21,0xFF 
     breq alto 
     LD r17,-X 
     sts $002B,r17 
     jmp wait 

  entra:
    sts $007A,r16;
    lds r17,$0079
    ST X+,r17 
    jmp alto 

    wait: 
      in r19, pinb 
      andi r19, 0x03
      cpi r19, 0x00 
      breq delay 
      jmp wait 
 
       delay:
        ldi  r30, 17
        ldi  r31, 60
        ldi  r20, 204
        L1: dec  r20
      brne L1
      dec  r31
      brne L1
      dec  r30
      brne L1
      jmp start

    alto:
      ldi r17,0x00
      sts $002B,r17 
      jmp wait
