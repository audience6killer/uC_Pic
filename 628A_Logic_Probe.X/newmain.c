/*
 * File:   newmain.c
 * Author: vill4in
 *
 * Created on May 14, 2022, 2:20 PM
 */

// Configura la frecuencia de oscilacion
#define _XTAL_FREQ 4000000

#include <xc.h>
#include <pic16f628a.h>

// Cofiguracion de bits
#pragma config FOSC = XT    // External oscillator @ 4MHz
#pragma config MCLRE = ON   // Reset @ MCLR Enabled
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config BOREN = OFF
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config CP = OFF


/*void Delay_Seconds(unsigned char s)
{
    unsigned char i, j;
    
    for(j = 0; j < s; j++)
        for(i = 0; i < 100; i++)
        {
            __delay_ms(10);
        }
}*/

int main(void) {
    
    CMCONbits.CM = 0b111;   // Deshabilitamos el modulo comparador
    TRISAbits.TRISA1 = 1;   //Set pin A0 as an input
    TRISB = 0;  // Set TRISB as an output
    
    const unsigned char b0_b3 = 0b00001111;
    const unsigned char b4_b7 = 0b11110000;
    
    while(1)
    {
        if(PORTAbits.RA1 == 1)
        {
            PORTB = b0_b3;
        }
        else
        {
            PORTB = b4_b7;
        }
    }
    
    return 0;
}
