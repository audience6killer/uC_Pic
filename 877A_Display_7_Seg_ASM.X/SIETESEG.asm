;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;		DISPLAY DE SIETE SEGMENTOS CON TABLAS
;
;   MEDIANTE EL USO DE TABLAS SE REALIZARA UN CONTADOR HEX DE 0 A F    
;   SIENDO LA DURACION DE CADA DIGITO DE UN SEEGUNDO
;    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   CONFIGURACION DEL PIC.......................................................
    
		PROCESSOR	16F877A
		INCLUDE		<p16f877a.inc>
		INCLUDE		</home/vill4in/MPLABXProjects/Library.X/RutinasTiempo.asm>
		__CONFIG	0X3F31
		ORG		0X0000
		
;   CONFIGURACION DE LOS PUERTOS................................................
		
		#DEFINE		DISPLAY		PORTD
		CLRF		PORTA
		CLRF		PORTB
		CLRF		PORTC
		CLRF		PORTD
		BSF		STATUS,RP0
		CLRF		TRISD		; PORTD (DISPLAY) COMO SALIDA
		BCF		STATUS,RP0
	
;   PROGRAMA PRINCIPAL..........................................................
		
;   DEBEMOS DECIDIR EN QUE LOCACION DE LA MEMORIA COLOCAR LA TABLA
;   PARA NO PROVOCAR PROBLEMAS CON PCL Y PCLTH, EN ESTE CASO SE DECIDIO NO USAR
;   EL PCLTH UNICAMENTE COLOCANDO LA TABLA EN UN LUGAR APROPIADO PARA DESPLAZAR-
;   SE UNICAMENTE CON PCL
		

		
		
CONTADOR	EQU		0X20		; VARIABLE EN LA RAM
		
		CLRF		CONTADOR	; EMPIEZA DESDE CERO
REPITE:		MOVF		CONTADOR,W
		CALL		TABLA_DIGITOS	; REGRESA EL DIGITO EN HEX EN W
		MOVWF		DISPLAY
		SUBT3V		.3,.203,.234	; DELAY DE 999,999s
		NOP				; 1 + 999,999 = 1s
		INCF		CONTADOR,F
		MOVLW		0X0F
		ANDWF		CONTADOR,1	; CONDICION DE VALIDACION
		GOTO		REPITE
	    
;   DEFINICION DE TABLAS........................................................
		
		ORG		0X0080
TABLA_DIGITOS:	ADDWF		PCL,F
		DT		0x3F, 0x06, 0x5B, 0x4F, 0X66, 0X6D, 0X7D, 0X07, 0X7F, 0X6F, 0x77, 0X7C, 0X39, 0X5E, 0X79, 0X71 
		
		END
		