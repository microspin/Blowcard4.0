#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/*DISPLAY.C

PINS-AS PER PRESENT SCHEMATIC

LCD in 4BIT MODE

SCHEM_NAME	uCPINNO	 PORTNO	 LCDPINNO    LCDPINNAME
DISPA - 	 51 	- IOPE0 -  11 	   - 	D4
DISPB - 	 45  	- IOPE1 -  12 	   - 	D5
DISPC - 	 43  	- IOPE2 -  13	   - 	D6
DISPD - 	 41  	- IOPE3 -  14       -    D7

DispEnA0    38		- IOPE4    6			ENABLE
DispEnA1	32		- IOPE5	   5			READ/WRITE		HIGH-READ ,LOW-WRITE
DispEnA2	27		- IOPE6	   4			RS				HIGH-DATA REGISTER,LOW- INSTRUCTION REGISTER
DispEnA3	37		- IOPA7	   NC	       NOT CONNECTED

*/

static unsigned int f=0;

static unsigned int convert_decimal(unsigned int temp1)
{
/* Converts an integer into its 32 bit hexadecimal equivalent ie: 1234 becomes 0x1234 */
unsigned int temp;
unsigned int temp2;
temp=temp1/(unsigned int)1000;
temp2=temp * (unsigned int)0x1000;
temp1=temp1-temp * (unsigned int)1000;
temp=temp1/(unsigned int)100;
temp2=temp2+temp * (unsigned int)0x100;
temp1=temp1-temp * (unsigned int)100;
temp=temp1/(unsigned int)10;
temp2=temp2+temp * (unsigned int)0x10;
temp1=temp1-temp * (unsigned int)10;
temp=temp1/(unsigned int)1;
temp2=temp2+temp * (unsigned int)0x01;
return temp2;
}

static void WriteByte(unsigned int value)
{
/*Writes a byte to the LCD  
Value has to be be  only a 4 bit hexadecimal. if you want to send an 8 bit variable 
split it into two and send it in two operations 

Protocol
Set Enable Low; Set RS high for data, or low for instruction;set Enable High,
Put Data out through the 4 lines; Set R/W to Write ; Set Enable Low;Set R/W to read

PEDATADIR is a 16 bit register, first 8 bits are data pins PE0 to PE7 and bits
8-15 are direction pins for PE0 to PE7 respectively */


value = value & 0x0f;	//take only the 4 least significant bits of value

PEDATDIR = 0x7f20 ; //except PE7 direction of rest is o/p. Also PE5,R/W is High, set to read.
delay1ms();
//delay(100,0); //delay 1 ms
/* E Low, R/W High, RS Low */

PEDATDIR=PEDATDIR | 0x0010; //Set Enable
delay1us();
if(f== 0x01)
{PEDATDIR = 0x7f20;}  	// Set R/W bit, Clear R/S bit  // for sending command
else
{ PEDATDIR = 0x7f60;}			//Set R/W bit, set R/S bit    // for sending data
delay1us();

PEDATDIR = PEDATDIR & 0xfff0;	//PortE = PortE & 0xffF0 .Set Enable high
PEDATDIR = PEDATDIR | value;	//PortE = PortE | value  //Put value into D4-D7
delay1us();
PEDATDIR = PEDATDIR & 0xffdf;	 //Set R/W to W 
delay1us();
PEDATDIR = PEDATDIR | 0x10;		//setbit(Enable)//Doesnt do anythin.enable alrady set
delay1us();
PEDATDIR = PEDATDIR & 0xffef;	//Clear Enable
delay1us();
PEDATDIR = PEDATDIR | 0x20;		//Set R/W to R
delay1us();
}

static void WriteCtrl( unsigned int value )
{/* Writes an instruction command to the LCD*/

f= 0x01;		// to indicate that an Instruction command is being sent
WriteByte( value >> 4 );
delay1ms();
delay1ms();
//delay(200,0);
WriteByte( value );
}

static void WriteData( unsigned int value )
{/* Writes Data to the LCD */ 
f= 0xff;	//to indicate data is being sent
WriteByte( value >> 4 );
delay1ms();
delay1ms();
//delay(200,0);
WriteByte( value );
}



void DispInit(void)
{
/* Wait a bit after power-up */

delay1ms();
delay1ms();
delay(200,1);

/* Initialize the LCD to 4-bit mode */
f= 0x01;	// command mode

WriteByte(0x02); //cursor home
delay1ms();
//delay(30,1);

WriteByte(0x02);
delay1ms();

//delay(20,1);

WriteByte(0x02);
delay1ms();

WriteCtrl(0x28);//lcd 4 bit mode, 2 lines
delay1ms();

WriteCtrl(0x14); // move cursor 1 character right
delay1ms();

WriteCtrl(0x08); //blank the display
delay1ms();

WriteCtrl(0x0e); //turn on visible underline cursor
delay1ms();

WriteCtrl(0x06);// cursor increment no shift
delay1ms();

WriteCtrl(0x01); // clear screen
delay1ms();
delay1ms();
//delay(100,1);

WriteCtrl(0x02);// cursor home
delay1ms();

//delay(30,1);
}

void DispClear(void)
{

WriteCtrl(0x01);
delay1ms();
delay1ms();
//delay(100,1);
}

void DispText( char* string, unsigned int place)
{//string = StringName ; place is a value from 10 to 1F, for first line , and 20 to 2F for the second line
unsigned int i =0;
unsigned int len = 0;
WriteCtrl(0x02); // Send Cursor to home
if((place & 0xF0)==0x10)
	WriteCtrl(0x80+(place & 0x0F)); 

if((place & 0xF0)==0x20) 
	WriteCtrl(0xC0 + (place & 0x0F));

len = strlen(string);
//DispNo(len,0x28,0x40);
for(i=0;i<len;i++)	// write upto 16 characters
{	if(!string[i])
	break;
	WriteData(string[i]);
}
}

/*
void DispUserText(const char stringtext[], unsigned char place)
{//stringtext = String in form " harsha and Siva" always less than 16 characters including spaces 
//;  place is a value from 10 to 1F, for first line , and 20 to 2F for the second line
//http://stackoverflow.com/questions/3513481/passing-array-of-character-strings-to-function
/*see http://stackoverflow.com/questions/11511473/embedded-c-passing-a-string-to-function
char tempArray[20] ;
strcpy( tempArray,stringtext);
DispText(tempArray,place);
 
} 

*/

void DispNo(unsigned int value,unsigned int place, unsigned int type)
{
/* Value is a 2,3,or 4 digit integer. Type tells the function the formatting, and the no of digits.
Type can be -
0x40 - 4 digit integer ie: 1234
0x41 - 3 digit integer with 1 decimal spot ie: 123.4
0x42 - 2 digit integer with 2 decimal spots ie: 12.34
0x43 - 1 digit and 3 decimal spots ie: 1.234
0x20 - 2 digit integer ie: 12
0x21 - 1 digit and 1 decimal spot ie: 1.2 
Place is the position on the lcd to show the no.It takes a value from 10 to 1F, for first line , and 20 to 2F for the second line
*/

unsigned int value1;	
value=convert_decimal(value);  // converts a decimal into a hexadecimal  ie: 1234 becomes 0x1234
WriteCtrl(0x02);	// cursor home
if((place & 0xF0)==0x10) 
	WriteCtrl(0x80+(place & 0x0F));  //line 1 place
if((place & 0xF0)==0x20)	
	WriteCtrl(0xC0+(place & 0x0F));  // line 2 place

if(type == 0x40)	// 4 digit integer
{
value1=(value&0xF000)>>12;
WriteData(value1+0x30);  // converts the hexadecimal value into the corresponding ascii value
value1=(value&0x0F00)>>8;//ie: 0x30 is 0 in ascii. so add 0x01 to 0x30 gives 0x31 which is 1 in char
WriteData(value1+0x30); // which is what the lcd needs to display 1
value1=(value&0x00F0)>>4;
WriteData(value1+0x30);
value1=value&0x000F;
WriteData(value1+0x30);
}

if(type == 0x41)	// 3 digit integer and 1 decimal spot ie: 234.9
{
value1=(value&0xF000)>>12;
WriteData(value1+0x30);
value1=(value&0x0F00)>>8;
WriteData(value1+0x30);
value1=(value&0x00F0)>>4;
WriteData(value1+0x30);
WriteData(0x2e);	// decimal point in ascii
value1=value&0x000F;
WriteData(value1+0x30);
}


if(type == 0x42) // 2 digit integer and 2 decimal spots ie:23.45
{
value1=(value&0xF000)>>12;
WriteData(value1+0x30);
value1=(value&0x0F00)>>8;
WriteData(value1+0x30);
WriteData(0x2e);
value1=(value&0x00F0)>>4;
WriteData(value1+0x30);
value1=value&0x000F;
WriteData(value1+0x30);
}

if(type == 0x43)  // 1 integer and 3 decimal spots - ie :1.234
{
value1=(value&0xF000)>>12;
WriteData(value1+0x30);
WriteData(0x2e);
value1=(value&0x0F00)>>8;
WriteData(value1+0x30);
value1=(value&0x00F0)>>4;
WriteData(value1+0x30);
value1=value&0x000F;
WriteData(value1+0x30);
}

if(type == 0x20)		//2 digit integer - ie : 23
{
value1=(value&0x00F0)>>4;
WriteData(value1+0x30);
value1=value&0x000F;
WriteData(value1+0x30);
}

if(type == 0x21)		// 1 integer and 1 decimal spot ie: 1.2
{
value1=(value&0x00F0)>>4;
WriteData(value1+0x30);
WriteData(0x2e);
value1=value&0x000F;
WriteData(value1+0x30);
}

if(type == 0x22)		// 1 integer  ie: 1
{
value1=value&0x000F;
WriteData(value1+0x30);
}

// dot point, example ' .'  , used to Blink char
if(type == 0x01)
	{
		WriteData(0x2e);
	}

}

