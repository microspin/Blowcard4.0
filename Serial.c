#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"
/* RS232 Module*/

/* Make sure the settings are Correct in the Serial port Reading Software or youll get junk characters
Baud rate = 38400 , Even Parity, 8 char bits and 2 stop bits */
/* Since we ve enabled the sciinterrupt,when the txbufferis empty the TXRDY flag willbe set,
indicating we can again write to the buffer.pollthis flag and if 1, write the next bit */

void SerialInit(void)
{
//	B_SET(SCSR1,6);			// Enable SCI Module in system control and Status Register 1
	SCSR1 = SCSR1 | 0x040;	// Enable SCI Module in system control and Status Register 1
	SCICCR   = 0xE7;		// Commn Control Register,2 stop bits, even parity, parity enable and 8 char bits
	SCICTL1 = 0x0022;		// Transmitter Enable,Reciever Disable, Software Reset
	SCICTL2 = 0x0000;		// Disable transmitter interrupt.//changed by harsha on 6/6/13from 0x0001

	// Baudrate set to 38400	
	SCIHBAUD = 0x00;		// for 9600, value =0x0208 , to be loaded in H baudand L baud
							// for 38400, value = 0x0081, check pg290 of datasheet,
	SCILBAUD = 0x81;		// Baud-Select Registers (SCIHBAUD,SCILBAUD)

	SCIPRI = 0x0068;		// TxInt high priority

	SCICTL1 = 0x0022;		//Make SW reset = 0, and initialize the SCI module
//	B_UNSET(SCICTL1,5);
}

void SerialDisable(void)
{ 
	SCICTL1 = 0x00;		// Disable all Flags
	SCICTL2 = 0x00;
	B_UNSET(SCSR1,6);	//disable the module in the System control and Status register 1 register
}

void SerialWriteNo(unsigned int number)
{/* by default sends out 4 digit nos.Pads the beginning digits with zero if the no of digits is less*/
	char TxString[5];
	char TxArr[5];	//kept 5 even though we need only 4
	char i;
	char l;
	int k;

	l = number/1000;		//number = 1234  l = 1
	TxArr[0] = l + 48;		
	
	k = number - (l*1000);  // k = 234
	l = k/100;				//	l =2
	TxArr[1] = l + 48;

	k = k - (l*100);       //k = 34
	l = k/10;				//l = 3
	TxArr[2] = l + 48;

	k = k - (l*10);			//k = 4
	l = k;		 			//l = 4
	TxArr[3] = l + 48;

	for(i=0;i<=3;i++)
	{	
		TxString[i] = (char)TxArr[i];
		SCITXBUF = TxString[i];
		while(B_IS_SET(SCICTL2,7)==0)
			{;}				// will become 1,making condition false
	//	delay(400,0);		//Keep this as low as possible.
	}						//80uS per Byte at 38400 baud rate
}

void SerialWriteComma(void)
	{	SCITXBUF = ','; 
		while(B_IS_SET(SCICTL2,7)==0)
			{;}				// will become 1,making condition false
	}

void SerialWriteNewLine(void)
	{ SCITXBUF = '\n';
	while(B_IS_SET(SCICTL2,7)==0)
			{;}				// will become 1,making condition false
	}

void SerialWriteMinus(void)
	{ SCITXBUF = '-';
	while(B_IS_SET(SCICTL2,7)==0)
			{;}				// will become 1,making condition false
	}

void SerialWriteText(char* string,unsigned int length)
{//length gives the length of the string, including spaces

unsigned char i;
for(i=0;i<length;i++)	
{
SCITXBUF = (string[i]);
while(B_IS_SET(SCICTL2,7)==0)
			{;}				// will become 1,making condition false
}

}


void WaitForTxRdyFlag(void)
	{/*
 *  FUNCTION: WaitForTxRdyFlag
 *
 *  PARAMETERS:Nothing
 *
 *  DESCRIPTION:This function waits for the bit to be set in the registry indicating that the Last byte has been
 sent, but itautomatically breaks out after a certain time in case that bit has still not been set.
 *
 *  RETURNS: Nothing
 *
 */
 unsigned int counter =0;
	  unsigned int breakout = 0;
	  while(breakout!= 1)
		{if (B_IS_SET(SCICTL2,7)==1)
			{breakout =1;}
		 else
		 	{counter ++ ;
			 if (counter ==65000) 
			 	{ breakout = 1 ;}
			}
		}
	}
	  

