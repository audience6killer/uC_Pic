;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			EJERCICIO 03
;    
;	SE LEE EL PUERTO B, A ESE VALOR SE LE RESTA 0X3C Y EL RESULTADO 
;	ES SACADO POR EL PUERTO C
;    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   CONFIGURACION DEL PIC

		PROCESSOR	16F877A 
		__CONFIG	0X3F31
		INCLUDE		<p16f877a.inc>
		ORG		0X0000
		
;   CONFIGURACION  DE LOS PUERTOS
	
		CLRF		PORTB
		CLRF		PORTC
		BSF		STATUS,RP0
		CLRF		TRISC
		BCF		STATUS,RP0
		
;   PROGRAMA PRINCIPAL

;   AL UTILIZAR SUBWF SE EMPLEA EL BIT DE ACARREO 'C' EN EL REGISTRO STATUS
;   SI EL BIT DE ACARREO SE PONE EN 1: EL RESULTADO ES CERO O POSITIVO
;   SI EL BIT DE ACARREO SE PONE EN 0: EL RESULTADO ES NEGATIVO
;   EN ESTE EJERCICIO SI EL RESULTADO ES NEGATIVO, SIMPLEMENTE HAREMOS:
;   0 - W PARA OBTENER LA MAGNITUD DEL RESULTADO
		
REPITE:		MOVLW		0X3C
		SUBWF		PORTB,0		    ; SE GUARDA DE NUEVO EN W
		BTFSS		STATUS,C
		SUBLW		.0
		MOVWF		PORTC
		GOTO		REPITE
		END
				