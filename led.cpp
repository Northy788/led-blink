#include <avr/io.h>
#include <avr/iom2560.h>
#include <util/delay.h>

#define BLACK 0
#define RED 1
#define GREEN 2
#define YELLOW 3
#define BLUE 4
#define MAGENTA 5
#define CYAN 6
#define WHITE 7


// 3ิ bit counter
int main(void)
{
    //set PORTB7 as an OUTPUT
    DDRB = (1 << PB7) | (1 << PB6) | (1 << PB5);
    while (1)
    {
        for (uint8_t i = 0; i < 8; i++)
        {
            PORTB = i << 5;
            _delay_ms(400);
        }
    }
}
