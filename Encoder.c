#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/* Encoder.c*/
/* The interrupt captures pulses from the encoders. All other files and functions takes 
the rpm and count values through the GetRpm and GetCount functions.Cumalative counts are
reset either individually or all at one time */

/*all cumaltive counts references have been removed since we aren't using them now*/

static unsigned int filterRpmArray[6] = {0,0,0,0,0,0} ; //Used in FilterRpm

static int M1Count = 0;
static int M2Count = 0;
static int M3Count = 0;
static int M4Count = 0;
static int M5Count = 0;
static int M6Count = 0;
unsigned int M3Mtcount = 0;
unsigned int finmts = 0;

static int FilterRpm(unsigned int motorIndex,unsigned int rpm)
	{unsigned int filterInput = rpm;
	 filterRpmArray[motorIndex] = (unsigned int)((filterRpmArray[motorIndex]*WEIGHT_PREVIOUS_SAMPLE_RPM) + (filterInput * WEIGHT_PRESENT_SAMPLE_RPM)) ;
	 return filterRpmArray[motorIndex];
	 }	 

interrupt void EncoderCapture(void)
{ /* Cumalates edges from the Capture pins and adds them to the correct variable*/
	
	asm(" setc INTM");
	
	if(PIVR == CAPTUREPIN1)							
	{
		M1Count++;
		EVAIFRC = EVAIFRC & 0x0001;					// Clear CAP1 Int Flag
	}

    if(PIVR == CAPTUREPIN2)						
	{
		M2Count++;
		EVAIFRC = EVAIFRC & 0x0002;					// Clear CAP2 Int Flag
	}
	
	if(PIVR == CAPTUREPIN3)					
	{
		M3Count++;
		M3Mtcount++;
		EVAIFRC = EVAIFRC & 0x0004;					// Clear CAP3 Int Flag
	}

	if(PIVR == CAPTUREPIN4)						
	{
		M4Count++;
		EVBIFRC = EVBIFRC & 0x0001;					// Clear CAP4 Int Flag
	}
	
	if(PIVR == CAPTUREPIN5)						// NOT USED. NO CONNECTOR ON BOARD
	{
		M5Count++;
		EVBIFRC = EVBIFRC & 0x0002;					// Clear CAP5 Int Flag
	}
	
	if(PIVR == CAPTUREPIN6)						
	{
		M6Count++;
		EVBIFRC = EVBIFRC & 0x0004;					// Clear CAP6 Int Flag
	}  

	asm(" clrc INTM");
}

int GetRPM(char motorIndex)
{	/* This function returns the rpm of the correct motor.It also resets the count after adding the 
count to a cumalating variable */
	int rpm =0 ;
	int filteredRpm=0;
	switch(motorIndex) 
		{ case CYLINDER:
		  rpm= (int)(M1Count* CNT_TO_RPM_50MS * CYLINDER_GEAR_RATIO);
		  M1Count =0;
		  break;

		  case BEATER:
		  rpm = (int)(M2Count * CNT_TO_RPM_50MS * BEATER_GEAR_RATIO);
		  M2Count =0;
		  break;
		  	
		  case CAGE:
		  rpm= (int)((M3Count * CNT_TO_RPM_50MS ));	// Gives Cage motor shaft speed
		//  finmts  = (M3Mtcount * 0.000109);
		  M3Count =0;
		  break;															//Not Cage Speed
		  	
		  case CYL_FEED:
		//  rpm = (int)((M4Count * CNT_TO_RPM_50MS ) / FEED_MOTORS_INTERNAL_GEAR_RATIO) ; //Gives Feed motor shaft speed
		  rpm = (int)(M4Count * CNT_TO_RPM_50MS ); //Gives Feed motor shaft speed
		  M4Count =0;
		  break;
		  	
		  case LC_FEED:   //BTR_FEED
	//	  rpm = (int)((M6Count * CNT_TO_RPM_50MS ) / FEED_MOTORS_INTERNAL_GEAR_RATIO);  //Gives Feed motor shaft speed	
		  rpm = (int)(M6Count * CNT_TO_RPM_50MS );
		  M6Count =0;
		  break;
		}

	filteredRpm = FilterRpm(motorIndex,rpm);
	return filteredRpm;
}
		  	
void ResetAllRPMCounts(void)
	{/* resets the rpmcounters */
  		  M1Count = 0;	 
		  M2Count = 0; 
		  M3Count = 0; 
		  M4Count = 0;
		  M6Count = 0; 
	}		  	


void ResetFilterRpmArray(void)
	{ unsigned int i =0;
	  for (i=0;i<6;i++)
		{filterRpmArray[i] = 0;
		}
	}