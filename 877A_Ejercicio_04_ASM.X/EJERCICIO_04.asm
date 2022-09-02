;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 04
;
;	SE LEE EL VALOR DEL PUERTO B Y C, SE SUMAN LOS VALORES Y EL
;	RESULTADO ES DESPLEGADO EN EL PUERTO D
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
;   CONFIGURACION DEL PIC
    
		PROCESSOR	16F877A
		INCLUDE		<p16f877a.inc>
		__CONFIG	0X3F31
		ORG		0X00
		
;   CONFIGURACION DE LOS PUERTOS
		
		CLRF		PORTB
		CLRF		PORTC
		CLRF		PORTD
		BSF		STATUS,RP0
		CLRF		TRISD
		BCF		STATUS,RP0
		
;   PROGRAMA PRINCIPAL
		
REPITE:		MOVF		PORTB,W
		ADDWF		PORTC,0
		MOVWF		PORTD
		GOTO		REPITE