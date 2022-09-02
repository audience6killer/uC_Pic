;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 07
;
;	SE LEE EL VALOR DE LOS PUERTOS B Y C, SI PB >= PC ENTONCES SE 
;	DESPLIEGA EL VALOR 0XAB EN EL PUERTO D, SI PB < PC, ENTOCES 
;	SE DESPLIEGA 0XC5
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
;   CONFIGURACION DEL PIC.......................................................
    
		PROCESSOR	16F877A
		INCLUDE		<p16f877a.inc>
		__CONFIG	0X3F31
		ORG		0X0000
		
;   CONFIGURACION DE LOS PUERTOS................................................

		CLRF		PORTB
		CLRF		PORTC
		CLRF		PORTD
		BSF		STATUS,RP0
		CLRF		TRISD
		BCF		STATUS,RP0
		
;   PROGRAMA PRINCIPAL..........................................................
;   PARA DEFINIR LAS RELACIONES MAYOR O IGUAL, MENOR QUE, RESTAREMOS
;   C DE B:
;   SI EL BIT DE ACARREO SE PONE EN 1: EL RESULTADO ES CERO O POSITIVO
;   SI EL BIT DE ACARREO SE PONE EN 0: EL RESULTADO ES NEGATIVO
		

REPITE:		MOVF		PORTC,W
		SUBWF		PORTB,0
		MOVLW		0XAB
		BTFSS		STATUS,C
		MOVLW		0XC5
		MOVWF		PORTD
		GOTO		REPITE
		END
		
		
		
