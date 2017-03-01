#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"


/* Delay */

/* IC running at 40Mhz. Per instruction, time taken is 1/40Mhz= 25*10^-9 s
For 1 us you need 40 instructions  ie 40*25*10-9 = 1*10-6
for 1 ms you need 1000* 40 or 40000 instructions.*/

void delay1us(void)
{// unsigned int i = 0;	
//	for (i=0; i<2; i++);	//with nothing inside it takes about 1.25uS for this loop to run.Seen on Scope
}

void delay1ms(void)
{
	unsigned int i = 0;			//On scope gives 1.008 ms
	for (i=0; i<4000; i++);
}

void delay(unsigned int time,unsigned int isMilli)
{unsigned int i;
 if (isMilli>=1)
	{for (i=0; i<time; i++)
		{delay1ms();}
	}
 if (isMilli==0)
	{for (i=0; i<time; i++)
		{delay1us();}
	}
}

