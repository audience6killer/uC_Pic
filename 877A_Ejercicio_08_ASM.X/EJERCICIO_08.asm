;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 08
;
;	SE LEE EL VALOR DE LOS PUERTOS B Y C
;	SI PB <= PC ENTONCES PD SACA 0XDF Y PA 0X8F 
;	SI PB > PC ENTONCES PD SACA 0X34 Y PA 0X6A
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
		CLRF		TRISA
		CLRF		TRISD
		BCF		STATUS,RP0
		
;   PROGRAMA PRINCIPAL..........................................................
;   SI EL BIT DE ACARREO SE PONE EN 1: EL RESULTADO ES CERO O POSITIVO
;   SI EL BIT DE ACARREO SE PONE EN 0: EL RESULTADO ES NEGATIVO
		
REPITE:		MOVF		PORTB,W
		SUBWF		PORTC,0
		BTFSS		STATUS,C
		GOTO		PC_MENOR
		MOVLW		0XDF 
		MOVWF		PORTD
		MOVLW		0X8F
		MOVWF		PORTA
		GOTO		REPITE
PC_MENOR:	MOVLW		0X34 
		MOVWF		PORTD
		MOVLW		0X6A
		MOVWF		PORTA
		GOTO		REPITE
		END
		
		


