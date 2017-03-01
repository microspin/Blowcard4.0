
#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/*Cylinder 	- pin 79 - ADC 0
  Beater   	- pin 77 - ADC 1
  Cage	   	- pin 74 - ADC 2
  CylinderFD- pin 72 - ADC 3
  BeaterFD	- pin 70 - ADC 4 (In Hardware used this as LC feed)
*/  

//Used in AdcFilteredGet Function.Start at adc zero amps. Keeps the last adc vlaue for each motor

     float AdcValue[6] = {775,775,775,775,775,755};
     float NewAdcValue[6] = {775,775,775,775,775,755};
     float AvgAdcValue[6] = {775,775,775,775,775,755};
     float adcFilterArray[6] = {775,775,775,775,775,755};
     float NewAdcFilterArray[6] = {775,775,775,775,775,755};
	 float LcAdcValue = 775;
	 float LcAdcValue1 = 775;
	 float LcAdcValue2 = 775;
	 float LcAdcValue3 = 775;
	 float NewLcAdcValue = 775;
	 float tempAdc = 0;





//keeps track of no of consecutive times adc value is greater than threshold for each motor
static unsigned int overloadCounterArray[5] = {0,0,0,0,0};
unsigned int LcchokeFlag;
unsigned int Beaterpreovloadflag;

void AdcInit(void)
{    /*
 *  FUNCTION: AdcInit
 *
 *  PARAMETERS: None
 *
 *  DESCRIPTION:initializes the ADC module.
 *
 *  RETURNS: nothing
 *
 */

	ADCTRL1	= 0x4000;	//Reset the ADC module
  
  	asm("nop");  //' delay required according to spru357a, see page 7-21 of TMS ref manual.
    
    ADCTRL1	= 0x0020;
   //' Bit 11-8 = 0000; Since we are using the prescale of only ""2*Clk""
   //' Bit7 = 0; since the conversion logic prescale is Clk/1;; CPS=0
   //' Bit 6=0; Start Stop mode. Sequencer stop after every EOS is reached.
   //' Bit 4 = 0 Dual sequencer mode. SEQ1 and SEQ2 operate as two 8-state sequencers.
   //' Bit 2 = 0 full reference voltage is applied.

    MAXCONV	= 0x0004;
    //' We are using 5 ADC's pots so we write 4 into the MAX CONV register.
	//' the 5 pots have been connected to ADCIN00,01,02 to 04 which are assigned to SEQ1. 
	
	CHSELSEQ1= 0x3210;   
	//' Decides the ADC channel we re going to use. We select ADC0,1,2,3 and whose results will appear in 
	//' in RESULT 0, 1, 2, 3

	CHSELSEQ2= 0x7654;
	//' For the 5th channel we use ADC channel 4.
	//' the first three bytes are not of importance since we require only
	//' the last one (4)

	ADCTRL2	= 0x4202;	
    // Disable any other means of starting the AdC conversion except through a software trigger.
	/*
	bit 14		1:	reset SEQ1
	bit 13		0:	if 1: software trigger for Start-Of-Conversion
	bit 12		0:	SEQ1 busy

	bit 11-10	00:	Interrupt disabled
	bit 9		1:	clear any ADC SEQ1 interrupt
*/
    
}



static unsigned int GetAdc(unsigned int motorIndex)
 {	
	unsigned int adc = 0;

	ADCTRL2 |= 0x2000; // Trigger the ADC. each reading take 13ns. So 5 readings take 12*5 = 70 ns
	
	delay1us();		// give lots of time to finish the reading.
	
	ADCTRL2 &= ~(0x2C0C);  //' Disable the trigger and take the readings.
	
   	 if (motorIndex == CYLINDER)  //Cylinder ADC capture address
	 {adc = RESULT0;
	  adc = adc>>6;	}

	 if (motorIndex == BEATER)    //Beater ADC capture address
	 {adc = RESULT2;
	  adc = adc>>6;	}

	 if (motorIndex == CAGE)     //Cage ADC capture address
	 {adc = RESULT3;
	  adc = adc>>6;	}

	 if (motorIndex == CYL_FEED)  //Cylinder Feed ADC capture address
	 {adc = RESULT4;
	  adc = adc>>6;	}

	 if (motorIndex == BTR_FEED)  //Beater Feed capture address,But currently used for LC Feed
	 {adc = RESULT5;
	  adc = adc>>6;	}

	 if (motorIndex == LC_FEED)  //Beater Feed capture address,But currently used for LC Feed
	 {adc = RESULT1;
	  adc = adc>>6;	}

	return adc;
 }

void ResetFilterSumArray(void)
	{unsigned int i = 0;
	for (i=0;i<6;i++)
		{
		adcFilterArray[i] = 775;	/// zero amps
		NewAdcFilterArray[i] = 775;	/// zero amps

		}
	}

unsigned int LcFilterGet(unsigned int motorIndex)
{
      if (motorIndex == LC_FEED){

      AdcValue[motorIndex] = GetAdc(motorIndex);
	  if ( AdcValue[motorIndex] <= 772)                      //if Adc value lesser then 0.15 Amps go to in the loop
	  { 
	  	if (tempAdc <= AdcValue[motorIndex])                     //Newly added for tempAdc
		{
	  		NewAdcValue[motorIndex] =  AdcValue[motorIndex];
		}
		else
		{
			NewAdcValue[motorIndex] =  tempAdc;
		}
		tempAdc = AdcValue[motorIndex];
	  }
	  else
	  {
	  	NewAdcValue[motorIndex] = NewAdcFilterArray[motorIndex];
	  }
	  NewAdcFilterArray[motorIndex] =  NewAdcValue[motorIndex];
	  
	  AvgAdcValue[motorIndex] =(float)(778-((778 - NewAdcValue[motorIndex]) * (M[LC_FEED].pwmPercentage/100.0)));
	   
	  LcAdcValue  = LcAdcValue1;
	  LcAdcValue1 = LcAdcValue2;
	  LcAdcValue2 = LcAdcValue3;
	  LcAdcValue3 = AvgAdcValue[motorIndex];

	  if(((LcAdcValue + LcAdcValue1 + LcAdcValue2 + LcAdcValue3) <= (2940)) || ( (AvgAdcValue[motorIndex]) >= (750)))
	  {NewLcAdcValue = AvgAdcValue[motorIndex];}

	  else{NewLcAdcValue = LcAdcValue2;}

	  adcFilterArray[motorIndex] = NewLcAdcValue;
	
    	return adcFilterArray[motorIndex];



}
}


unsigned int AdcFilteredGet(unsigned int motorIndex)
	{/*
 *  FUNCTION: AdcFilteredGet
 *
 *  PARAMETERS:	The motor for whom you want to get the filtered current data
 *
 *  DESCRIPTION: The function get the latest adcvalue,and appies a low pass filter so that
 rapid spikes on the line are filtered out
 *
 *  RETURNS: the latest filtered adc value
 *
 */		


 	  AdcValue[motorIndex] = GetAdc(motorIndex);
	  
//	  if(motorIndex == 0) {CylenderCurrentADC = filterInput;}
		
	 /*Filtering logic
	  a low pass filter to ensure rapid spikes on the adc line dont cause false overload signals. 
	  Each pass updates the filterSumArrayin the correct element depending on the motor.Only the last data value is saved.

	  For details see Filter Excel sheet and EDN pdf in Docs folder.
	*/
	// calculate presentadc value  = previous samplewight* previous filteredoutput + presentsample weight * filter input
	adcFilterArray[motorIndex] = (float)(adcFilterArray[motorIndex] * WEIGHT_PREVIOUS_SAMPLE_ADC) + (AdcValue[motorIndex] * WEIGHT_PRESENT_SAMPLE_ADC) ;
//	adcFilterArray[motorIndex] = filterInput;

	return adcFilterArray[motorIndex];
	}	  	

void ResetOverloadCounterArray(void)   //Not Used
	{/*
 *  FUNCTION: ResetOverloadCounterArray
 *
 *  PARAMETERS:Nothing
 *
 *  DESCRIPTION:Resets the overload time counter array. needs to be called before a new machine start
 cycle. For example if youve done test,and then now want to run the machine
 *
 *  RETURNS: nothing
 *
 */
	unsigned int i = 0;
	for (i=0;i<5;i++)
		{
		overloadCounterArray[i] = 0;
		}
	}


void CheckOverload(unsigned int motorIndex)
	{/*


 *  FUNCTION: CheckOverload
 *
 *  PARAMETERS: the motor for whom you want tocheck if an overload has happened
 *
 *  DESCRIPTION: the main function used to tie up all the parts of the ADc-current sensor module.
 It calls the Adcmodule to get the filtered current, and if its greater than the set threshold, 
 increments the counter used to keep track of how long has passed since the overload.It then compares
 that time with the threshold time,and if equal sets the overload flag in the overload struct.
 If the current has not passed the threshold current,it sets the time counter to zero. This means
 even if there has been a few overloads,the moment there is even one less than thresholdcurrent event, 
 the counter is reset to zero and again needs to start.
 *
 *  RETURNS: Nothing
 *
 */

	/* - if this function is run multiple times consecutively, like it will be in the normal 
	running mode, it will overwrite the data in the Overload Struct. So you ll only have the last overloaded
	motor in the motor loop as the cause. but the rarity of two motors getting overloaded in the exact same
	pass is very small */
//	if (motorIndex == LC_FEED)
//	{
	//	M[motorIndex].presentCurrentAdc = LcFilterGet(motorIndex); //For LC Feed 
	//}
	//else
//	if
//	{
		M[motorIndex].presentCurrentAdc = AdcFilteredGet(motorIndex); //For Other Motors Except LC Feed
//	}

	if (M[motorIndex].presentCurrentAdc <= M[motorIndex].overloadCurrentAdc)  //Checks for Overload with the set Value
			{					 
					OV.overloadedMotor = motorIndex; //write which motor got overloaded
					//if(motorIndex == LC_FEED)//If LC feed got overloaded 
					//{
				//	LcchokeFlag =1;           //Enable this flag to "1"
				//	}

				//	else //If other motor got overload
				//	{
					  OV.overloadFlag = 1;   //Enable this flag "1" 
					  StopAllMotors();       //Stop all motor Immediately
					  TowerLampRed_On();     //Tower Lamp Red ON
					  TowerLampGreen_Off();  //Tower Lamp Green OFf
				//	 }
			}
	}


void CheckpreOverload(unsigned int motorIndex)
	{/*


 *  FUNCTION: CheckOverload
 *
 *  PARAMETERS: the motor for whom you want tocheck if an overload has happened
 *
 *  DESCRIPTION: the main function used to tie up all the parts of the ADc-current sensor module.
 It calls the Adcmodule to get the filtered current, and if its greater than the set threshold, 
 increments the counter used to keep track of how long has passed since the overload.It then compares
 that time with the threshold time,and if equal sets the overload flag in the overload struct.
 If the current has not passed the threshold current,it sets the time counter to zero. This means
 even if there has been a few overloads,the moment there is even one less than thresholdcurrent event, 
 the counter is reset to zero and again needs to start.
 *
 *  RETURNS: Nothing
 *
 */

	/* - if this function is run multiple times consecutively, like it will be in the normal 
	running mode, it will overwrite the data in the Overload Struct. So you ll only have the last overloaded
	motor in the motor loop as the cause. but the rarity of two motors getting overloaded in the exact same
	pass is very small */
//	if (motorIndex == LC_FEED)
//	{
	//	M[motorIndex].presentCurrentAdc = LcFilterGet(motorIndex); //For LC Feed 
	//}
	//else
//	if
//	{
		M[motorIndex].presentCurrentAdc = AdcFilteredGet(motorIndex); //For Other Motors Except LC Feed
//	}

	if (M[motorIndex].presentCurrentAdc <= 600)  //Checks for Overload with the set Value
			{					 
					
				//	OV.overloadedMotor = motorIndex; //write which motor got overloaded
					Beaterpreovloadflag = 1;
				
			}
	}