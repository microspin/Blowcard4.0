#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/* NMI.c*/
/*In case theres a hardware error and an NMI gets generated, stop allmotors, and display
and error message */

interrupt void Nmi(void)
{	char nmi[] = "NMI Error!";
	char reset[] = "Reset M/c!";
	int x;
		
	asm(" setc INTM");	//Disable all interrupts. 
	StopAllMotors();	// Stop all motors
	
	DispClear();
//	asm("nop");
	while(1)
		{
			DispText(nmi,0x10);
			DispText(reset,0x20);
		}
}	