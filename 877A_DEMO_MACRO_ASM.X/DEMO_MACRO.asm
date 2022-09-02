;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;		DEMO PARA LAS MACROS DE SUBRUTINAS DE TIEMPO
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   CONFIGURACION DEL PIC.......................................................
    
		PROCESSOR	16F877A
		INCLUDE		<p16f877a.inc>
		__CONFIG	0X3F31
		ORG		0X0000
		
;   LIBRERIAS
		INCLUDE		</home/vill4in/MPLABXProjects/Library.X/RutinasTiempo.asm>
		
;   CONFIGURACION DE LOS PUERTOS................................................

		CLRF		PORTA
		CLRF		PORTB
		CLRF		PORTC
		CLRF		PORTD
		BSF		STATUS,RP0
		CLRF		TRISD
		BCF		STATUS,RP0
		
;   PROGRAMA PRINCIPAL
;VAR1		EQU	0X64
;VAR2		EQU	0X65
;VAR3		EQU	0X66
;AUXV2		EQU	0X67
;AUXV3		EQU	0X68
;	
;		MOVLW	.2
;		MOVWF	VAR1		; VALOR DE MAYOR PESO EN ANIDACION
;		MOVLW	.1
;		MOVWF	VAR2
;		MOVLW	.2		; VALOR DE MENOR PESO EN ANIDACION
;		MOVWF	VAR3
;		
;ST3V:		MOVF	VAR2,W		; VAR2
;		MOVWF	AUXV2
;RECARGA3V:	MOVF	VAR3,W		; VAR3
;		MOVWF	AUXV3
;DECRE3V:	NOP
;		NOP
;		NOP
;		NOP
;		DECFSZ	AUXV3,F		; VAR3_AUX
;		GOTO	$-5
;		DECFSZ	AUXV2,F		; VAR2_AUX
;		GOTO	$-9
;		DECFSZ	VAR1,F		; VAR1
;		GOTO	($+13)
;		nop
;		nop
;		nop
;		nop
		SUBT3V		.3,.203,.234
		SUBT2V		.2,.6
		SUBT1V		.7
		NOP
		
		END