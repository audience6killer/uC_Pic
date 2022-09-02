;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 11
;
;	SI EL PB.0 == 0, EL PD DEBE SACAR 0XF5
;	SI EL PB.0 == 1, EL PD DEBE SACAR 0X24		
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
		
REPITE:		MOVLW		0X24
		BTFSS		PORTB,0
		MOVLW		0XF5
		MOVWF		PORTD
		GOTO		REPITE
		END
				
		