#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/*KEYSCAN*/

/*
SCHEM_NAME  uCPinNo		PORTNAME   KEY
KB1			14			IOPC0		UP
KB2			85			IOPC1		NO
KB3			21			IOPC2		DOWN	
KB4			22			IOPC3		YES
		    49			IOPC7		PUSHBUTTON

The Keyboard pins are all inputs,since the bits 8-15 in PCDATADIR are all zero. the pins are pulled high 
by a pull up resistor in the hardware.when pressed they are grounded.
*/


void KeysInit(void)
{
//	PCDATDIR|=0xF000; //F for the IO pins
//	delay(10,1);
}




char KeyScan(void)
{	char key=0;
	if((PCDATDIR & 0x0001)==0)
		{delay(5,MS);		//Debounce
		 if((PCDATDIR & 0x0001)==0)
			{key= UP;}
		} 

	else if((PCDATDIR & 0x0002)==0)
		{delay(5,MS);
    	 if((PCDATDIR & 0x0002)==0)
			 {key= NO;}
		}

	else if((PCDATDIR & 0x0004)==0)
        {delay(5,MS);
        if((PCDATDIR & 0x0004)==0)
	          {key=DOWN;}
	}
//	else if(((PCDATDIR & 0x0008)==0) || ((PBDATDIR & 0x0002)==0))
	else if((PCDATDIR & 0x0008)==0)
	     {delay(5,MS);
          //  if(((PCDATDIR & 0x0008)==0) || ((PBDATDIR & 0x0002)==0))
			if((PCDATDIR & 0x0008)==0)
	          {key=YES;}
         }
	else if((PCDATDIR & 0x0080)==0)	//check this from J2 to J5 0x0080 to 0x0010
	     {delay(5,MS);
            if((PCDATDIR & 0x0080)==0)
	          {key=PUSHBUTTON;}
         }
	else
	key = 0xff;

	return key;

}