/*
 * File:   main.c
 * Author: vill4in
 * In this project, eight LEDs are connected to PORTB of a PIC16F628A-type
 * microcontroller, and the microcontroller is operated from an 8-MHz crystal. When the
 * power is applied to the microcontroller (or when the microcontroller is reset), the LEDs
 * turn ON alternately in an anticlockwise manner where only one LED is ON at any time.
 * A 1-s delay is used between each output so that the LEDs can be seen turning ON
 * and OFF.
 * 
 * The LED will be turned up by current sinking
 * Created on May 13, 2022, 11:52 PM
 */

// Oscillator clock
#define _XTAL_FREQ 4000000

#include <xc.h>

// Configuration
#pragma config FOSC = XT    // EXTERNAL OSCILLATOR AT 4MHZ
#pragma config MCLRE = ON   // RESET WHEN GROUNDED
#pragma config WDTE = OFF   // WATCHDOG TIMER OFF
#pragma config PWRTE = OFF  // POWER-UP TIMER DISABLED
#pragma config BOREN = OFF  // BROWN-OUT RESET DISABLED
#pragma config LVP = OFF    // LOW-VOLTAGE PROGRAMMING DISABLED
#pragma config CPD = OFF    // DATA CODE PROTECTION DISABLED
#pragma config CP = OFF     // FLASH PROGRAM PROTECTION DISABLED
// END CONFIGURATION

/*
 * THIS FUNCTION CREATES SECONDS DEALY. THE ARGUMENT SPECIFIES THE DELAY IN SEC.
 */
void DelaySeconds(unsigned char s)
{
    unsigned char i, j;
    
    for(j = 0; j < s; j++)
    {
        for(i = 0; i < 100; i++)
            __delay_ms(10);
    }
}

int main(void) {
    unsigned char I = 0b00000001;
    
    TRISB = 0;
    
    while(1)
    {
        PORTB = I;
        DelaySeconds((unsigned char)1);
        I = I << 1;
        if(I == 0)
            I = 0b00000001;
    }
    return 0;
}
