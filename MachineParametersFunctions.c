#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/* MachineParameters functions*/
static int ConvertDisplayFormatToAdc(int displayAmps); 
static int ConvertDisplayTimeToInt(int displayTime);
static int ReadPidValueDisplay(char pidIndex,char motorIndex);
static void SavePidValue(char motorIndex,char pidIndex, char pidValue);

int SetMotorSpeed(char motorIndex,char param)  	
{	/* returns -1 if No is pressed, or a number which indicates the speed the user has selected */
/* rearrange the variables for cleaner logic */
	int maxSpeedLimit = U[motorIndex].maxSpeedLimit;
	int minSpeedLimit = U[motorIndex].minSpeedLimit;
	int deltaRpm = M[motorIndex].menuDeltaRpm;
	int currentSpeed= 0;	//variable with the presently set speed
	int defaultSpeedLimit = U[motorIndex].defaultSpeedLimit;
	int speed=0;
	char text[] = "Set RPM";
	char selected =0;
	char key = 0;
	
	/* In tools- testmotors- when you set the speed open with default speed while in machine params
	open with the speed you set in the eeprom ,so that you can change it */
	if (param==TOOLS)
		{M[motorIndex].finalRpm = U[motorIndex].defaultSpeedLimit ; //Update the Struct
		 currentSpeed  = M[motorIndex].finalRpm;
		}
	if (param==PARAMS)
		{M[motorIndex].finalRpm = EepromRead(U[motorIndex].EEfinalRpm) ; //Update the Struct
		currentSpeed  = M[motorIndex].finalRpm;
		}

	//Now check for boundary limits.Especially useful when we change eeproms
	if ((currentSpeed > maxSpeedLimit) || (currentSpeed < minSpeedLimit))
	 	{currentSpeed = defaultSpeedLimit;
		}

	speed = currentSpeed;	// so we dont change the speed we got from the eeprom

	delay(250,MS);			// To slow down the Yes Keypress from the above menu	 	
	DispClear();
	DispText(text,0x10);

	while (selected!=1)
	{
		DispNo(speed,0x20,0x40);
		key=KeyScan();
		if (key == UP)
			{ if (speed< maxSpeedLimit) 
				{speed = speed + deltaRpm;
				}
			}
		 if (key == DOWN)
			{ if (speed > minSpeedLimit) 
				{speed = speed - deltaRpm;}
			}
		if (key == YES)
			{selected = 1 ;
			}
		if (key == NO)
			{selected = 1 ;
			 speed = BACK;
			}		
		delay(250,MS);		
	}
	return speed;

}

void ResetMotorSpeeds(void)
	{/* Used to quickly write the default rpms into the epprom so that in 
 the Machine parameters menu the speeds get reset */ 
	 char reset[] = "Reset Done ";
	 char i =0;
	 for (i=0;i<6;i++) 
		{EepromWrite(U[i].defaultSpeedLimit,U[i].EEfinalRpm);
		}
     DispText(reset,0x10);
	 delay(200,1);
	 }

void SaveMotorSpeed(char selectedMotor, int speed)
	{ /* Saves the speed of the selectedmotor within the eeprom */
	  char saved[] = "Saved";
	  EepromWrite(speed,U[selectedMotor].EEfinalRpm); 
	  DispText(saved,0x28);
	  delay(200,1);
	 }
	

int SetMotorOverloadCurrent(char motorIndex)  	
{	/* returns -1 if No is pressed, or a number which indicates the speed the user has selected */
	int overload = 0;
	char text[] = "Set Ovrld Lmt";
	char amps[] = "Amps";
	char selected =0;
	char key = 0;

	M[motorIndex].overloadCurrentAdc = EepromRead(U[motorIndex].EEoverloadCurrent);	// Update the struc with adc value
    
	//check if the eeprom value is over the limits,and if it is, make it default and write default
	// values into eeprom also.Note that the larger the current, lower the adc value as per the sensor.
    if ((M[motorIndex].overloadCurrentAdc < MAX_OVRLD_CURRENT_ADC) || (M[motorIndex].overloadCurrentAdc > MIN_OVRLD_CURRENT_ADC))
	 	{M[motorIndex].overloadCurrentAdc = DFLT_OVRLD_CURRENT_ADC;
		 EepromWrite(DFLT_OVRLD_CURRENT_ADC,U[motorIndex].EEoverloadCurrent);
		}
	//Convert Adc to Display Format
	
    overload  = ConvertAdcToDisplayFormat(M[motorIndex].overloadCurrentAdc);

	delay(250,MS);			// To slow down the Yes Keypress from the above menu	 	
    DispClear();
	
	DispText(text,0x10);

	while (selected!=1)
	{
		DispNo(overload,0x20,0x21);		// overload set upto single decimal point
		DispText(amps,0x24);			// display 'amps'
		key=KeyScan();
		if (key == UP)
			{ if (overload < MAX_OVRLD_CURRENT_DISPLAY) 
				{overload = overload + 1;}		// This has to be 5 otherwise the functions DisplyToAdc 
			}									//and AdcToDisplay wont work properly.
		 if (key == DOWN)
			{ if (overload > MIN_OVRLD_CURRENT_DISPLAY) 
				{overload = overload - 1;}
			}
		if (key == YES)
			{selected = 1 ;
			}
		if (key == NO)
			{selected = 1 ;
			 overload = BACK;
			}		
		delay(250,MS);				 	
	}
	return overload;

}


void ResetOverloadCurrent(void)
	{char reset[] = "Reset Done ";
	 char i =0;
	 for (i=0;i<5;i++) 
		{EepromWrite(DFLT_OVRLD_CURRENT_ADC,U[i].EEoverloadCurrent);
		}
     DispText(reset,0x10);
	 delay(200,1);
	 }

void SaveMotorOverloadCurrent(char selectedMotor, int overload)
	{char saved[] = "Saved";
	 int adc = 0;
	 adc = ConvertDisplayFormatToAdc(overload);
	 EepromWrite(adc,U[selectedMotor].EEoverloadCurrent); 
	 DispText(saved,0x2A);
	 delay(200,1); 
	}


int SetMotorOverloadTime(char motorIndex)  	
{	/* returns -1 if No is pressed, or a number which indicates the speed the user has selected */
	int overload = 0;
	char text[] = "Set Ovrld Lmt";
	char ms[] = "mS";
	char selected =0;
	char key = 0;

	M[motorIndex].overloadTimeInt = EepromRead(U[motorIndex].EEoverloadTime);	// Update the struct
    M[motorIndex].historySaveFreq = (M[motorIndex].overloadTimeInt / 2);// update the freq counter value in the struct also,(for hygene),since it isdependant onthe overloadtimevalue

	if ((M[motorIndex].overloadTimeInt > MAX_OVRLD_TIME_INT) || (M[motorIndex].overloadTimeInt < MIN_OVRLD_TIME_INT))
	 	{M[motorIndex].overloadTimeInt = DFLT_OVRLD_TIME_INT;
		 EepromWrite(DFLT_OVRLD_TIME_INT,U[motorIndex].EEoverloadTime);
		}

	//convert int to a display time
	overload = ConvertIntToDisplayTime(M[motorIndex].overloadTimeInt);

	delay(250,MS);			// To slow down the Yes Keypress from the above menu	 		
	DispClear();
	
	DispText(text,0x10);
	
	while (selected!=1)
	{
		DispNo(overload,0x20,0x40);		// overload set to display in ms
		DispText(ms,0x24);				//show 'ms'
		key=KeyScan();
		if (key == UP)
			{ if (overload < MAX_OVRLD_TIME_DISPLAY) 
				{overload = overload + OVRLD_DELTA_TIME;}	//increment in 50 ms 
			}
		 if (key == DOWN)
			{ if (overload > MIN_OVRLD_TIME_DISPLAY) 
				{overload = overload - OVRLD_DELTA_TIME;}
			}
		if (key == YES)
			{selected = 1 ;
			}
		if (key == NO)
			{selected = 1 ;
			 overload = -1;
			}		

		delay(250,MS);		
	}
	return overload;

}

void ResetOverloadTime(void)
	{char reset[] = "Reset Done ";
	 char i =0;
	 for (i=0;i<5;i++) 
		{EepromWrite(DFLT_OVRLD_TIME_INT,U[i].EEoverloadTime);
		}
     DispText(reset,0x10);
	 delay(200,1);
	 }

void SaveMotorOverloadTime(char selectedMotor, int overload)
	{char saved[] = "Saved";
	 int overloadInt = 0;
	 overloadInt = ConvertDisplayTimeToInt(overload);
	 EepromWrite(overloadInt,U[selectedMotor].EEoverloadTime); 
	 DispText(saved,0x28);
	 delay(200,1); 
	}


//used in main motor loop
int ConvertAdcToDisplayFormat(int adc )
	{ //Two Cases , one for 3.5 amps, one for 3.0 amps
	  int deltaAmps = ADC_AT_ZERO_AMPS - adc;		//775 - 632,652 = 143 ,123
	  int actualAmpsTen = abs(deltaAmps*10);				//1430,1230								
	  int displayAmps = ((actualAmpsTen/AMPS_TO_ADC)); 	//1430/41,1230/41 = 34,30
	
	  char mod = (displayAmps/10);				//mod = 3,3			
	  if ((displayAmps - 10*mod) != 0)			// (34 - 30), (30-30) = 4, 0, only 4 will pass
		{ displayAmps = displayAmps + 1; }		// 34+1 = 35	
	  return displayAmps;
	}

static int ConvertDisplayFormatToAdc(int displayAmps)	//displayAmps willbe a number like 25,denoting 7.5 
	{ int deltaAdc = displayAmps*AMPS_TO_ADC ;   // 25*41 = 1025
	  int deltaAdcActual = (deltaAdc/10);
	  int actualAdc =ADC_AT_ZERO_AMPS - deltaAdcActual ;	// = 775 - 102 = 670
	  return actualAdc;
	}

int ConvertIntToDisplayTime(int overloadTime)
	{ int msTime = overloadTime * 50 ;
	  return msTime;
	  }


static int ConvertDisplayTimeToInt(int displayTime)
	{ int overloadInt= displayTime / 50 ;
	  return overloadInt;
	  }

char SetPid(char motorIndex)
	{
	 static char pidNames[3][3]   = {"Km","Kp","Ki"};
	 char saved[] = "Saved";
	 char star[] = "*";
	 char clear[] =" ";
	 char enteredLoop =0;

	 char pidIndex= 0;	// flag to denote which parameter, km,kp,or ki
	 char pidDisplayInt =0;
	 char changeParameters = 0;
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option
	 
	 delay(250,MS);	// to suppress previous key press
	 DispClear();
	
	 pidDisplayInt = ReadPidValueDisplay(pidIndex,motorIndex);

	 while (selected==0)
		{
		 DispText(motorNames[motorIndex],0x10);
		 DispText(pidNames[pidIndex],0x15);		// display rpm,current,pwm

		 DispNo(pidDisplayInt,0x20,0x42);	

		 if (changeParameters==1)
		 	{ DispText(star,0x2F);
			  DispText(clear,0x1F);
			}
		 if (changeParameters==0)
		 	{DispText(clear,0x2F);
			 DispText(star,0x1F);
			 }


		 key = KeyScan();
		
		/* if youre within change parameters,pressing up or down toggles between on and off.If youre not
		within change paramters, up and down cycle through the parameter options ,and update the display*/
		 if (changeParameters==1)
		 	{	if (key == UP)
					{ if (pidDisplayInt == MAX_PID_VALUE) 
						 	{pidDisplayInt = MIN_PID_VALUE;
					  	 	 delay(250,MS);
					  		 DispClear();
					  		}
				      else
				     	{pidDisplayInt += DELTA_PID_VALUE;
					 	delay(250,MS);
					 	DispClear();
						}
			//	parameterValue = EepromRead(eeprom[parameter]);	// to reload the correct values from the eeprom

					}		// closes if key == up

			 	if (key == DOWN)
					{ if (pidDisplayInt == MIN_PID_VALUE) 
						{pidDisplayInt = MAX_PID_VALUE;
						delay(250,MS);
					 	DispClear();
					 	}
				  	  else
				     	{pidDisplayInt-= DELTA_PID_VALUE;
					 	delay(250,MS);
					 	DispClear();
						}

					}	// closes if key == Down

			}	// closes if change parameters == 1


		 if (changeParameters==0)
			{	if (key == UP)
					{ if (pidIndex == 2) 
						 	{pidIndex = 0;
					  	 	 delay(250,MS);
					  		 DispClear();
					  		}
				      else
				     	{pidIndex++;
					 	delay(250,MS);
					 	DispClear();
						}
				 pidDisplayInt = ReadPidValueDisplay(pidIndex,motorIndex);

					}		// closes if key == up

			 	if (key == DOWN)
					{ if (pidIndex == 0) 
						{pidIndex = 2;
						delay(250,MS);
					 	DispClear();
					 	}
				  	  else
				     	{pidIndex--;
					 	delay(250,MS);
					 	DispClear();
						}
		  		pidDisplayInt = ReadPidValueDisplay(pidIndex,motorIndex);

					}	// closes if key == Down
			}	// closes else

		/* when you press no, if youre in change parameters, you come out. If your already outside, you exit and
		go back to above menu */
		 if (key == NO)
			{if (changeParameters==0)
				{ index = BACK;		// go to  tools menu
			 	 selected = 1 ;
				}
			if (changeParameters ==1)
				{changeParameters  =0;
				}
				
			 delay(250,MS);
			 DispClear();
			}	// closes if key==no

		/* when you press yes, if you havent yet entered change parameters you enter it.In change paramters
		if you press yes, you save the value */
		 enteredLoop =0;
		 if (key == YES)
			{if (changeParameters==0)
				{changeParameters = 1;
				 enteredLoop=1;
				 }

			 if (changeParameters ==1)
			 	{ if (enteredLoop == 0)		//Dont allow it to save, when you've just entered 
						{
			 	 		 SavePidValue(motorIndex,pidIndex,pidDisplayInt);
			 	 		 DispText(saved,0x2A);
			 	 		 delay(200,MS);	  	
						 
						}
				}

			delay(250,MS);		 
			DispClear();
			} 	// closes if key==yes
	
				
		}	// closes while loop
return index;
	}


void ResetPidConsts(void)
	{char reset[] = "Reset Done ";
	 char i =0;
	 for (i=0;i<5;i++) 
		{EepromWrite(DFLT_PID_VALUE,U[i].EEKm);
		 EepromWrite(DFLT_PID_VALUE,U[i].EEKp);
		 EepromWrite(DFLT_PID_VALUE,U[i].EEKi);
		}
     DispText(reset,0x10);
	 delay(200,1);
	 }

static int ReadPidValueDisplay(char pidIndex,char motorIndex)
	{//int pidValue outputs a integer,not a float. While displaying just put the 
	 // correctpoint and show it 
	int pidValue =0; 
	if (pidIndex == 0)	//read Km for that motor
		{ pidValue = EepromRead(U[motorIndex].EEKm); }
	if (pidIndex == 1)	//read Kp for that motor
		{ pidValue = EepromRead(U[motorIndex].EEKp); }
	if (pidIndex == 2)	//read Ki for that motor
		{ pidValue = EepromRead(U[motorIndex].EEKi); }
	return pidValue;
	}


static void SavePidValue(char motorIndex,char pidIndex, char pidValue)
	{
	if (pidIndex == 0)	//read Km for that motor
		{ EepromWrite(pidValue,U[motorIndex].EEKm); }
	if (pidIndex == 1)	//read Kp for that motor
		{ EepromWrite(pidValue,U[motorIndex].EEKp); }
	if (pidIndex == 2)	//read Ki for that motor
		{ EepromWrite(pidValue,U[motorIndex].EEKi); }
	}