/*
 * File:   digit_display_test.c
 * Author: vill4in
 *
 * Programa que desplegara digitos en el display dependiendo del numero de
 * decimas que se deseen usar
 * ESTADO: TERMINADO
 * 
 * Created on May 27, 2022, 11:10 PM
 */

//  Frecuencia del oscilador
#define _XTAL_FREQ 4000000

//  Usaremos float de 24bit
#pragma -fshort-float

//================================================  
//  Configuracion del pic
//================================================
#pragma config FOSC = XT    //  Oscilador externo de baja frec
#pragma config MCLRE = OFF  //  Sin reset en MCLR
#pragma config WDTE = OFF   //  WatchDog Timer deshabilitado
#pragma config PWRTE = OFF
#pragma config BOREN = OFF
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config CP = OFF

//==================================================
//  Definimos los pines que usaremos
//==================================================
#define DISPLAY PORTB
#define D1 PORTAbits.RA2    // Solo se desplegaran dos digitos, D1 = unidades
#define D2 PORTAbits.RA3    

//==================================================
//  Variables globales
//==================================================
const unsigned char DIGITOS[] = {0x3F, 0x06, 0x5B, 0x4F, 0X66, 0X6D, 0X7D, 
                                    0X07, 0X7F, 0X6F, 0x80};

//==================================================
//  Librerias
//==================================================
#include <xc.h>

//==================================================
//  Funciones
//==================================================
enum ENABLE {Di1, Di2};

struct DigitosEntero
{
    unsigned char unidades;
    unsigned char decenas;
    unsigned char centenas;
    unsigned char millares;
};

//  Funcion que imprimira el digito elegido en la posicion espoecificada
void display(enum ENABLE posicion, unsigned char digito );

struct DigitosEntero descomponerEntero(unsigned int numero);

int main(void) {
    
    //  Deshabilitamos el comparador de los puertos del TRISA
    CMCONbits.CM = 0b111;
    OPTION_REGbits.T0CS = 0;
    //   Definimoas el PORTB como salidas
    TRISB = 0;
    
    //  Definimos los habilitadores de digito
    TRISAbits.TRISA2 = 0;
    TRISAbits.TRISA3 = 0;
    
    unsigned int mostrar = 23;
    
    struct DigitosEntero miEntero = descomponerEntero(mostrar);
    
    while(1)
    {
        display(Di1, miEntero.unidades);
        __delay_ms(5);
        display(Di2, miEntero.decenas);
        __delay_ms(5);
    }
    
    return 0;
}

//===================================================
//  Implementacion de las funciones
//===================================================
void display(enum ENABLE posicion, unsigned char digito )
{
    unsigned char digitoHex;
    
    D1 = 0;
    D2 = 0;
    
    //  Elegimos el digito a mostrar
    switch(digito)
    {
        case 0: digitoHex = DIGITOS[0];
        break;
        case 1: digitoHex = DIGITOS[1];
        break;
        case 2: digitoHex = DIGITOS[2];
        break;
        case 3: digitoHex = DIGITOS[3];
        break;
        case 4: digitoHex = DIGITOS[4];
        break;
        case 5: digitoHex = DIGITOS[5];
        break;
        case 6: digitoHex = DIGITOS[6];
        break;
        case 7: digitoHex = DIGITOS[7];
        break;
        case 8: digitoHex = DIGITOS[8];
        break;
        case 9: digitoHex = DIGITOS[9];
        break;
        case 10: digitoHex = DIGITOS[10];
        break;
        case 128: digitoHex = DIGITOS[11];
        break;
        default: break;
    }
    
    switch(posicion)
    {
        case Di1: D1 = 1;
        break;
        case Di2: D2 = 1;
        break;
        default:
        break;   
    }
    
    PORTB = digitoHex;
    
}

struct DigitosEntero descomponerEntero(unsigned int numero)
{
    unsigned int resto;
    struct DigitosEntero miEntero;
    
    miEntero.millares = numero / 1000;
    resto = numero % 1000;
    
    miEntero.centenas = resto / 100;
    resto = resto % 100;
    
    miEntero.decenas = resto / 10;
    resto = resto % 10;
    
    miEntero.unidades = resto;
    
    return miEntero;
}