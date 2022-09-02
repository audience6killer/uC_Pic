;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;		EJERCICIO 02
;		
;	SE LEE EL VALOR EN EL PUERTO B LE SUME 0X54 Y ESE VALOR SEA SACADO EN
;	EL PUERTO C.
;	PIC16F877A
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		PROCESSOR	16F877A
		INCLUDE	<p16f877a.inc>
		__CONFIG	_WDT_OFF & _LVP_OFF & _HS_OSC
		ORG		0X0000
		    
;   SE CONFIGURAN LOS PUERTOS
		    
		CLRF	PORTA
		CLRF	PORTB
		CLRF	PORTC
		CLRF	PORTD
		BSF	STATUS,RP0
		CLRF	TRISC		; PORTC COMO SALIDA
		BCF	STATUS,RP0	; BANCO 0

;   RUTINA PRINCIPAL
REPETIR:	MOVF	PORTB,W
		ADDLW	0X54		; SUMAMOS W CON 0X54, SE QUEDDA EN W
		MOVWF	PORTC
	        GOTO	REPETIR
		END

