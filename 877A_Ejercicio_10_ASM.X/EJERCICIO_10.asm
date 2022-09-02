;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 10
;
;	SE LEE EL NIBBLE BAJO DEL PC
;	Y SAQUE ES VALOR COMO EL NIBBLE ALTO DE PD
;	LEE EL NIBBLE ALTO DE PB
;	Y SAQUE ESE VALOR COMO EL NIBLE BAJO DEL PD    
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   CONFIGURACION DEL PIC.......................................................
    
		PROCESSOR	16F877A
		INCLUDE		<p16f877a.inc>
		__CONFIG	0X3F31
		ORG		0X0000
		
;   CONFIGURACION DE LOS PUERTOS................................................

		CLRF		PORTA
		CLRF		PORTB
		CLRF		PORTC
		CLRF		PORTD
		BSF		STATUS,RP0
		CLRF		TRISD
		BCF		STATUS,RP0
		
;   PROGRAMA PRINCIPAL
	    
REPITE:		MOVF		PORTC,W
		ANDLW		b'00001111'
		MOVWF		0X20
		SWAPF		0X20,1
		MOVF		PORTB,W
		ANDLW		b'11110000'
		SWAPF		0X21,W
		ADDWF		PORTC,W
		MOVWF		PORTD
		GOTO		REPITE
		END
