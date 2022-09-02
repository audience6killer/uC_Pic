/*
 * File:   newmain.c
 * Author: vill4in
 *
 * ESTADO: TERMINADO
 * 
 * Created on May 14, 2022, 11:33 PM
 */

#define _XTAL_FREQ 4000000

#include <xc.h>

// Configuracion
#pragma config FOSC = XT
#pragma config MCLRE = OFF
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config BOREN = OFF
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config CP = OFF

// Nombrar pines
#define D1 PORTAbits.RA0
#define D2 PORTAbits.RA1
#define D3 PORTAbits.RA2
#define D4 PORTAbits.RA3

#define DISPLAY PORTB

#pragma -fshort-float

/*  Definimos los valores que deben ser enviados al diplay para ser mostrados 
 *  iniciando desde el CERO, al final se encuentra el punto
 */
const unsigned char DIGITOS[] = {0x3F, 0x06, 0x5B, 0x4F, 0X66, 0X6D, 0X7D, 
                                    0X07, 0X7F, 0X6F, 0x80};

// 
//  Enumeracion con los digitos posibles
//
enum ENABLE {Di1, Di2, Di3, Di4}; 

//
//  Esructura que encapsula los digitos de un numero entero
//
struct DigitosEntero
{
    unsigned char millares;
    unsigned char centenas;
    unsigned char decenas; 
    unsigned char unidades;
};

//
//  Struct que encapsula los digitos de un numero decimal, solo un decimal
//
struct DigitosUnDecimal
{
    unsigned char centenas;
    unsigned char decenas;
    unsigned char unidades; 
    unsigned char decimas;
    unsigned char PUNTO;
};

//
//  Struct que encapsula los digitos de un numero decimal, dos decimales
//
struct DigitosDosDecimal
{
    unsigned char decenas;
    unsigned char unidades; 
    unsigned char decimas;
    unsigned char centesimas;
    unsigned char PUNTO;
};

//
//  Struct que encapsula los digitos de un numero decimal, tres decimales
//
struct DigitosTresDecimal
{
    unsigned char unidades; 
    unsigned char decimas;
    unsigned char centesimas;
    unsigned char milesimas;
    unsigned char PUNTO;
};

//
//  Esta funcion muestra el digito elegido
//
void display(unsigned char digito, enum ENABLE noDigito);

//
//  Esta funcion nos permite separar cualquier entero entre
//  0 y 9999; 0 < unsigned int < 65,535  
//
struct DigitosEntero digitosEntero(const unsigned int entero);

//
//  Esta funcion nos permite separar cualquier decimal positivo entre
//  0 y 999.9  
//
struct DigitosUnDecimal digitosUnDecimal(const float decimal);

//
//  Esta funcion nos permite separar cualquier decimal positivo entre
//  0 y 99.99  
//
struct DigitosDosDecimal digitosDosDecimal(const float decimal);

//
//  Esta funcion nos permite separar cualquier decimal positivo entre
//  0 y 9.999  
//
struct DigitosTresDecimal digitosTresDecimal(const float decimal);



void main(void) {
    
    CMCONbits.CM = 0b111; // Deshabilitamos el comparador para usar RA0-RA3 como I/O
    TRISB = 0;  // Puerto B como salidas
    TRISAbits.TRISA0 = 0;   // Configuramos como salidas los habilitadores de Dig
    TRISAbits.TRISA1 = 0;
    TRISAbits.TRISA2 = 0;
    TRISAbits.TRISA3 = 0;
    
    //const unsigned char numeros[] = {0,1,2,3,4,5,6,7,8,9,128};
    
    while(1)
    {
        float numero = 0.001;
        
        for(unsigned char j = 0; j <= 2000; j++)
        {
            struct DigitosTresDecimal digitos = digitosTresDecimal((const float)numero);
           
            for(unsigned char i = 0;  i < 25; i++)
            {
                if(digitos.unidades != 0)
                {
                    display(digitos.unidades, Di1);
                    __delay_ms(1);
                    
                    display(digitos.decimas, Di2);
                    __delay_ms(1);
                    
                    display(digitos.centesimas, Di3);
                    __delay_ms(1);
                    
                    display(digitos.milesimas, Di4);
                    __delay_ms(1);
                    
                    display(digitos.PUNTO, Di1);
                    __delay_ms(1);
                         
                }
                else
                {
                    if(digitos.decimas != 0)
                    {
                        display(digitos.PUNTO, Di1);
                        __delay_ms(1);
                        
                        display(digitos.decimas, Di2);
                        __delay_ms(1);
                        
                        display(digitos.centesimas, Di3);
                        __delay_ms(1);
                        
                        display(digitos.milesimas, Di4);
                        __delay_ms(2);
                    }
                    else
                    {
                        if(digitos.centesimas != 0)
                        {
                            display(digitos.PUNTO, Di1);
                            __delay_ms(1);
                            
                            display(digitos.centesimas, Di3);
                            __delay_ms(2);
                            
                            display(digitos.milesimas, Di4);
                            __delay_ms(2);
                        }
                        else
                        {
                            display(digitos.PUNTO, Di1);
                            __delay_ms(3);
                            
                            display(digitos.milesimas, Di4);
                            __delay_ms(2);
                        }
                    }
                }
                
            }
            numero = numero + (float)0.001;
        }
        
        
    }
    return;
}

/*
 *  DECLARACION DE FUNCIONES
 *
 */
void display(const unsigned char digito, enum ENABLE noDigito)
{
    unsigned char digitoElegido;
    
    D1 = 0;
    D2 = 0;
    D3 = 0;
    D4 = 0;
    
    switch(digito)
    {
        case 0: digitoElegido = DIGITOS[0];
                break;
        case 1: digitoElegido = DIGITOS[1];
                break;
        case 2: digitoElegido = DIGITOS[2];
                break;
        case 3: digitoElegido = DIGITOS[3];
                break;
        case 4: digitoElegido = DIGITOS[4];
                break;
        case 5: digitoElegido = DIGITOS[5];
                break;
        case 6: digitoElegido = DIGITOS[6];
                break;
        case 7: digitoElegido = DIGITOS[7];
                break;
        case 8: digitoElegido = DIGITOS[8];
                break;
        case 9: digitoElegido = DIGITOS[9];
                break;
        case 128: digitoElegido = DIGITOS[10]; // Es el punto
                break;
        default: break;
    };
    
    switch(noDigito)
    {
        case Di1: D1 = 1;
        break;
        case Di2: D2 = 1;
        break;
        case Di3: D3 = 1;
        break;
        case Di4: D4 = 1;
        break;
        default: break;
    };
    
    DISPLAY = digitoElegido;
    
}
struct DigitosEntero digitosEntero(const unsigned int entero)
{
    
    // Obtenemos los millares
    unsigned char millares = entero / (const unsigned int)1000;
    unsigned int resto = entero % 1000;
    
    // Obtenemos las centenas
    unsigned char centenas = (unsigned char)(resto / (const unsigned int)100);
    resto = resto % 100;
    
    // Obtenemos las decenas
    unsigned char decenas = (unsigned char)(resto / (const unsigned int)10);
    resto = resto % (const unsigned int)10;
    
    // Obtenemos las unidades 
    unsigned char unidades = (unsigned char)resto;
    
    struct DigitosEntero digitos = {millares, centenas, decenas, unidades};
    
    return digitos;
    
}
struct DigitosUnDecimal digitosUnDecimal(const float decimal)
{
    struct DigitosUnDecimal miDecimal;
    
    miDecimal.PUNTO = 128;
    
    if(decimal < 999.9 && decimal >= 0)
    {
        unsigned int resto = decimal * (const float)10.0;
        
        // Obtenemos las centenas
        miDecimal.centenas = (unsigned char)(resto / (const unsigned int)1000);
        resto = resto % 1000;
        
        // Obtenemos las decenas
        miDecimal.decenas = (unsigned char)(resto / (const unsigned int)100);
        resto = resto % 100;
        
        // Obtenemos las unidades
        miDecimal.unidades = (unsigned char)(resto / (const unsigned int)10);
        resto = resto % 10;
        
        // Obtenemos las decimas
        miDecimal.decimas = (unsigned char)resto;
    }
    else
    {
        miDecimal.centenas = 0;
        miDecimal.decenas = 0;
        miDecimal.unidades = 0;
        miDecimal.decimas = 0;
        
    }
    
    return miDecimal;
}

struct DigitosDosDecimal digitosDosDecimal(const float decimal)
{
    struct DigitosDosDecimal miDecimal;
    
    miDecimal.PUNTO = 128;
    
    if(decimal < 99.99 && decimal >= 0)
    {
        unsigned int resto = decimal * (const float)100.0;
        
        // Obtenemos las decenas
        miDecimal.decenas = (unsigned char)(resto / (const unsigned int)1000);
        resto = resto % 1000;
        
        // Obtenemos las unidades
        miDecimal.unidades = (unsigned char)(resto / (const unsigned int)100);
        resto = resto % 100;
        
        // Obtenemos los decimales
        miDecimal.decimas = (unsigned char)(resto / (const unsigned int)10);
        resto = resto % 10;
        
        // Obtenemos las centesimas
        miDecimal.centesimas = (unsigned char)resto;
    }
    else
    {
        miDecimal.decenas = 0;
        miDecimal.unidades = 0;
        miDecimal.decimas = 0;
        miDecimal.centesimas = 0;
    }
    
    return miDecimal;
    
}
struct DigitosTresDecimal digitosTresDecimal(const float decimal)
{
    struct DigitosTresDecimal miDecimal;
    
    miDecimal.PUNTO = 128; int resto = decimal * (const float)1000.0;
        
    
    if(decimal < 9.999 && decimal >= 0)
    {
        unsigned int resto = decimal * (const float)1000.0;
        
        // Obtenemos las unidades
        miDecimal.unidades = (unsigned char)(resto / (const unsigned int)1000);
        resto = resto % 1000;
        
        // Obtenemos las decenas
        miDecimal.decimas = (unsigned char)(resto / (const unsigned int)100);
        resto = resto % 100;
        
        // Obtenemos las unidades
        miDecimal.centesimas = (unsigned char)(resto / (const unsigned int)10);
        resto = resto % 10;
        
        // Obtenemos las decimas
        miDecimal.milesimas = (unsigned char)resto;
    }
    else
    {
        miDecimal.unidades = 0;
        miDecimal.decimas = 0;
        miDecimal.centesimas = 0;
        miDecimal.milesimas = 0;
    }
    
    return miDecimal;
}