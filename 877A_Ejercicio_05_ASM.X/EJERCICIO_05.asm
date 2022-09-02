;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 05
;
;	SE LEE EL VALOR DE LOS PUERTOS B Y C, SE RESTA C DE B Y LA
;	MAGNITUD ES DESPLEGADA EN EL PUERTO D
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
;   CONFIGURACION DEL PIC
    
		PROCESSOR	16F877A
		INCLUDE		<p16f877a.inc>
		__CONFIG	0X3F31
		ORG		0X0000
		
;   CONFIGURACION DE LOS PUERTOS
		
		CLRF		PORTB
		CLRF		PORTC
		CLRF		PORTD
		BSF		STATUS,RP0
		CLRF		TRISD
		BCF		STATUS,RP0
		
;   PROGRAMA PRINCIPAL
		
REPITE:		MOVF		PORTC,W
		SUBWF		PORTB,0
		BTFSS		STATUS,C	; EN CASO DE QUE SEA NEGATIVO
		SUBLW		.0
		MOVWF		PORTD
		GOTO	    	REPITE
		END
