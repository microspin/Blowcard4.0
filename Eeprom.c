#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/*EEPROM*/
/*
SDA - IOPD0
SCL - IOPF2
*/
/*At24C02 has 2048 bytes of space*/
/* Device hardware address 110*/
/*Two main functions - EepromWrite and EepromRead.
You can only write an unsigned int, basically a value from 0 to 65536.
Address for read and write is a vale from 0 - 255 , but importantly 
written as a 4 byte hex value ie : 0x000a , 0x000b.
EepromRead reads out two bytes,so address you specify is important, because 
the first of the two bytes is the one you specify.Better to
reference from the addresses from a reference file*/


static void dat_low(void)
{
PDDATDIR &= 0xfffe;				//IOPD0     	//SDA = LOW			
}

static void dat_high(void)
{
PDDATDIR |= 0x0101;				//IOPD0	    	// SDA = HIGH			
}

static void clk_low(void)
{

PFDATDIR &= 0xfffb;				//IOPF2        	//SCL = LOW
}

static void clk_high(void)
{
PFDATDIR |= 0x0404;			//IOPF2	   //SCL = HIGH

}

static void i2c_start(void)
{/*Start Bit -  SDA changes from high to low when SCL is high*/
PDDATDIR |= 0x0100; // set IOPD0 as output
PFDATDIR |= 0x0400; //set IOPF2 as output
dat_high(); 	//make data high
clk_high();		//make clock high	
delay(50,0);
dat_low();		//now make data low.(start bit protocol)
delay(10,0);
clk_low();		//make clock low
delay(10,0);
}

static void i2c_stop(void)
{/* Stop bit - SDA changes from low to high when SCL is high*/
PDDATDIR |= 0x0100; //set IOPD0 as output
PFDATDIR |= 0x0400; //set IOPF2 as output

delay(10,0);
dat_low(); 
delay(10,0);
clk_high();	
delay(10,0);
dat_high();
delay(10,0);
}

static void i2c_write(unsigned int out_data)
{

unsigned int index;
PDDATDIR |= 0x0100; //set IOPD0 as output 
PFDATDIR |= 0x0400; // set IOPF2 as output

	for(index=0;index<8;index++)
	{
		if((out_data & 0x80)== 0x80)
			{dat_high();}
		else
			{dat_low();}
		out_data <<=1;
		delay(10,0);
		clk_high();
		delay(10,0);
		clk_low();
		delay(10,0);
	}

	/*--- now get the "ack" bit to make sure everything is good ---*/
 
	PDDATDIR &= 0xfeff;  // Make IOPD0 input and wait for the bit to go high again after  
						// it falls low to indicate an ACk

	delay(10,0);
	clk_high();
	delay(10,0);
	clk_low();
	delay(10,0);


}

static unsigned int i2c_read(int a)
{
//if a is zero Ack is sent by the uC, and if a = 1 Ack is not sent by uC.
//If ack is sent you can sequentially read the next byte , if ack is not sent you have to send a stop condition

unsigned int index;
unsigned int data = 0x00;
PDDATDIR = 0xfefe;	//Make IOPDO input and set it to zero.

delay(10,0);
	for(index=0; index<8; index++)
	{
		data <<=1;
		clk_high();
		delay(10,0);
		if((PDDATDIR & 0x0001) == 0x01)	//if PD0-SDA goes high
			{data |= 0x01;}
		clk_low();
		delay(10,0);
	}

PDDATDIR |= 0x0100;

	if(a == 0)
		{dat_low();}  // if a=0, then you go can read the next byte sequentially .The 
	else		// last byte you want to read, you make a!=0
		{dat_high();} // Because for sequential read you ack, set to zero, till the last
	delay(10,0); // byte where you dont acknowledge
	clk_high();
	delay(10,0);
	clk_low();
	delay(10,0);
	
	return(data);
}

void EepromWrite(unsigned int data, int address) //data should be unsigned and address should be signed 
{
 /* Write protocol - to write a byte :
Start condition, Device address , Acknowledgement, Write address,
Acknowledgement,8 bit data,Acknowledgement, stopcondition */
/* data is 16 bit data;  and address can be anything from 0 -255*/
	unsigned int byte;

	i2c_start();

	i2c_write(0xac);	//Device Address[1010,110(hardware address),0(for Write)]
	delay(2,1);
	delay(2,1);	//Acknowledge from eeprom comes,but we dont check for it*/
	
	/* Write Address in which data is to be written - address can be from 0 - 255*/
	byte = (unsigned char)(address & 0x00ff);
	i2c_write(byte);
	delay(2,1); //Ack comes
	delay(2,1); 

	/* Data is 16 bit data ie: any value from 0 -65536*/
	byte = (unsigned char)((data & 0xff00) >> 8);
	i2c_write(byte);
	delay(2,1); //Ack comes
	delay(2,1);
	 
	byte = (unsigned char)(data & 0x00ff);
	i2c_write(byte);
	delay(2,1);
	delay(2,1); //Ack comes
	
	i2c_stop(); //Stop Condition sent.
	delay(5,1);

}

unsigned int EepromRead(int address)	//Reads
{
/* Read Protocol - to read a  random byte:
The function reads out a 16 bit no .ie:0-65536
Start condition, Deviceaddress with write bit set,Acknowledgement,Address to read,Ack
Start condition,Device address with read bit set, Ack,EEprom clocks out data,no ack, Stop condition
*/
	unsigned int data=0;
	unsigned char byte;

/* First part - writing the Address you want to read*/
	i2c_start();
	i2c_write(0xac);	//Device address and write bit
	delay(2,1);
	delay(2,1);

	byte = (unsigned char)(address & 0x00ff);
	i2c_write(byte);
	delay(2,1);
	delay(2,1);
	i2c_stop();
	delay(2,1);
	delay(20,1);
	
/*Second part -writing the read command and clocking out the data*/
	i2c_start();
	i2c_write(0xad);	//device address and read bit
	delay(2,1);
	delay(2,1);
	byte = i2c_read(0);	//Read Command with ack sent by uC after data is got.
	data = (data | byte) << 8;//left shift data by 8 positions
	delay(2,1);
	delay(2,1);
    
	byte = i2c_read(0);//Read command with no Ack sent by uC after data is got.
	data = data | byte;
	
	i2c_stop();
	delay(5,1);
	
	return(data);
}

