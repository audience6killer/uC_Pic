/*
 * File:   main.c
 * Author: vill4in
 *
 * Created on May 13, 2022, 3:45 PM
 */
// Define clock frequency
#define _XTAL_FREQ = 4000000

#include <xc.h>

// Configuration
#pragma config MCLRE = OFF
#pragma config WDTE = OFF
#pragma config FOSC = XT
#pragma config PWRTE = OFF
#pragma config BOREN = OFF
#pragma config LVP = OFF
#pragma config CPD = OFF
#pragma config CP = OFF 


int main() {
    TRISB0 = 0;
    
    
    while(1)
    {
        RB0 = 1;
        __delay_ms(1000);
        RB0 = 0;
        __delay_ms(1000);
    }
    return 0;
}
