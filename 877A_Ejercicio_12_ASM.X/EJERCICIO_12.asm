;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 11
;
;	SI EL PB.7 == 0 Y PC.3 == 0 => PD = 0XF3 Y PA = 0X89 
;	SI EL PB.7 == 0 Y PC.3 == 1 => PD = 0X45 Y PA = 0X7C 
;	SI EL PB.7 == 1 Y PC.3 == 0 => PD = 0X94 Y PA = 0X42 
;	SI EL PB.7 == 1 Y PC.3 == 1 => PD = 0XFF Y PA = 0XDE	
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
		CLRF		TRISA
		BCF		STATUS,RP0
		
;   PROGRAMA PRINCIPAL
		
REPITE:		BTFSS		PORTB,7
		GOTO		PORTB7_CERO
		BTFSS		PORTC,3
		GOTO		PORTC3_CERO
		GOTO		PORTC3_UNO
		
PORTB7_CERO:	BTFSS		PORTC,3
		END
		
		


		
		


