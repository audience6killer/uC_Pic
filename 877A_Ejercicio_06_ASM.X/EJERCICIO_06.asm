;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 06
;
;	SE LEE EL VALOR DE LOS PUERTOS B Y C, SI PB = PC ENTONCES SE 
;	DESPLIEGA EL VALOR 0XFD EN EL PUERTO D, SI PB /= PB, ENTOCES 
;	SE DESPLIEGA 0X24
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
;   PARA SABER SI AMBOS VALORES SON IGUALES, REALIZAREMOS UNA RESTA
;   SI EL ZERO-BIT EN EL REGISTRO STATUS ES 1 LA OPERACION TUVO COMO
;   RESULTADO 0, INDICANDONOS QUE LOS VALORES SON IDENTICOS, DE LO 
;   CONTRARIO, ZERO-BIT SERA 0 INDICANDONOS QUE NO SON IGUALES
		
REPITE:		MOVF		PORTB,W
		SUBWF		PORTC,0
		MOVLW		0XFD
		BTFSS		STATUS,Z
		MOVLW		0X24
		MOVWF		PORTD
		GOTO		REPITE
		END
		