;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;		EJERCICIO 01
;		
;	SE LEE EL VALOR EN EL PUERTO B Y ESE MISMO VALOR ES SACADO EN
;	EL PUERTO C.
;	PIC16F877A
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
		    PROCESSOR	    16F877A
		    INCLUDE	    <p16f877a.inc>
		    __CONFIG	    _WDT_OFF	&   _HS_OSC	&   _LVP_OFF
		    ORG		    0X0000
		    
;   SE COFIGURAN LOS PUERTOS COMO SALIDA Y ENTRADA RESPECTIVAMENTE Y
;   LOS SETTEAMOS A 0X00
		    
		    CLRF	    PORTA
		    CLRF	    PORTB
		    CLRF	    PORTC
		    CLRF	    PORTD
		    BSF		    STATUS,RP0	    ; NOS MOVEMOS AL BANCO 1
		    MOVLW	    0XFF	    ; CARGAMOS W CON 0XFF
		    MOVWF	    TRISB	    ; VOLVEMOS EL PUERTO B ENT.
		    CLRF	    TRISC	    ; VOLVEMOS EL PUERTO C SAL.
		    BCF		    STATUS,RP0	    ; VAMOS EL BANCO 0
		    
;   RUTINA PARA LEER EL VALOR DEL PUERTO B
LEERPORTB:	    MOVF	    PORTB,W
		    MOVWF	    PORTC
		    GOTO	    LEERPORTB
		    END
		    
		    
