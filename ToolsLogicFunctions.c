#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

//ToolsFunctions.c

//extern unsigned int LcchokeFlag;
static void ResetDataSets(void);

unsigned int SetMotorPwmPercent(unsigned int motorIndex)  	
{	/* returns -1 if No is pressed, or a number which indicates the speed the user has selected */
/* rearrange the variables for cleaner logic */

	unsigned int pwmPercent = DEFAULT_PWM_PERCENTAGE;
	char text[] = "Set PwmPercent";
	unsigned int selected =0;
	unsigned int key = 0;
	
	delay(200,MS);			// To slow down the Yes Keypress from the above menu	 	
	DispClear();
	
	DispText(text,0x10);

	while (selected!=1)
	{
		DispNo(pwmPercent,0x20,0x20);
		key=KeyScan();
		if (key == UP)
			{ if (pwmPercent< MAX_PWM_PERCENTAGE ) 
				{pwmPercent = pwmPercent +  DELTA_PWM_PERCENTAGE ;
				}
			}
		 if (key == DOWN)
			{ if (pwmPercent > MAX_PWM_PERCENTAGE) 
				{pwmPercent = pwmPercent -  DELTA_PWM_PERCENTAGE;}
			}
		 if (key == YES)
			{selected = 1 ;
			}
		 if (key == NO)
			{selected = 1 ;
			 pwmPercent = BACK;
			}		
		delay(250,MS);		
	}
	return pwmPercent;

}


void LoadDatalogOptions(void)
	{O.logCurrent = EepromRead(DATALOGGING_FLAG_CURRENT);
	 O.logPwm = EepromRead(DATALOGGING_FLAG_PWM);
	 O.logRpm = EepromRead(DATALOGGING_FLAG_RPM);
//	 O.doorsens = EepromRead(DOOR_SENS);
	 O.sliversens = EepromRead(SLIVER_SENS);
	 }

void SetBtrPinsLow(void)       //unset feed motors i/o pins
	{  B_UNSET(PFDATDIR,3);
	   B_UNSET(PFDATDIR,4);
	   B_UNSET(PFDATDIR,5);
	}

void SetSdPinHigh(void)
	{B_SET(PADATDIR,2); }

/*void StopInputFeed(void)
{
	LcchokeFlag = 1;
}*/
		 
void StopAllMotors(void)
	{  ACTRA = 0x0000;	//switch of hardware PWM1,3,5 (cage,cyl,beater Motors)
	   GPTCONA = 0x0040; //switch of hardware T1PWM,T2PWM (LcFd,CylFd)
	   GPTCONB = 0x0040; //switch of hardware T4PWM (BtrFd)
	   SetSdPinHigh();	//Make logic High for SD Pin, to switch off all Motor PWMs
//	   SetBtrPinsLow();	// Ensures feed motors Switch off, Makes the DIO pins low compulsarily.
	}
				 

char RunMotorTest(char motorIndex,int pwmPercent)
{  	char tgt[] = "%";
	char enc[] = "Enc:";
	char crnt[]= "I:";
	char overload[] = "Current Overload!";
	char breakout = 0;
	char breakout1 = 0;
	char out = 0;
	char key =0;
	unsigned int adcFilterCurrentInmA=0;
	unsigned int adcCurrentInmA=0;

	/*put the display functions that arent going to change above the whileloop so that it runs once */
	DispClear();
	DispText(motorNames[motorIndex],0x10);
	DispText(tgt,0x16);
	DispNo(pwmPercent,0x14,0x20);
	DispText(crnt,0x19);
	DispNo(adcFilterCurrentInmA,0x1B,0x43);
	DispText(enc,0x20);

	trigger = FALSE;		// start out by waiting for the int to make this true

/* ARCHITECTURE 2 - with Update Motor running in Interrupt */
		
	while (breakout!=1)
		{
		if (trigger ==TRUE)
			{B_SET(PCDATDIR,4);
		/* Datalogging - check options struct, and then log data out. */
			 //Datalog();
			 OverloadLogic();
			 adcCurrentInmA = abs(((2.5-((M[motorIndex].presentCurrentAdc * 3.3)/1023.0))/0.125) * 1000.0);
			 adcFilterCurrentInmA = (adcFilterCurrentInmA * 0.98) + (adcCurrentInmA * 0.02); //Lowpass filter to remove display variations
			 
			 DispNo(M[motorIndex].presentRpm,0x24,0x40);
			 DispNo(M[motorIndex].pwmPercentage,0x14,0x20);
			 DispNo(adcFilterCurrentInmA,0x1B,0x43);
	   		 
	   		 key= KeyScan();

			 if ((key == NO)||(out ==1))
				{ breakout = 1;
			  	  StopAllMotors();
				  delay(250,MS);   //to ensure the key press dies down here only
				}

			 trigger = FALSE;

			 B_UNSET(PCDATDIR,4);
			} // closes  if trigger == true
		}  //closes if breakout != 1
		
	return 1;

}


void UpdateMotorTest(char motorIndex,int pwmPercent)
	{/* Checks Pwm Percent and compares */

	char deltaPwm = TEST_DELTA_PWM;
	long int numerator =0;
	int maxPwm = MAX_PWM_HARDWARE;
	
//	if(motorIndex==CYL_FEED) {deltaPwm=40.0;}
//	if(motorIndex==BTR_FEED) {deltaPwm=40.0;}
	
	M[motorIndex].presentRpm = GetRPM(motorIndex);
		
	if (motorIndex<6)
		{ if ( M[motorIndex].pwmPercentage < pwmPercent )
	 			{if (M[motorIndex].pwmPercentage < MAX_PWM_PERCENTAGE)	
	 				{M[motorIndex].pwm = M[motorIndex].pwm + deltaPwm;}
				}
		 
		  if ( M[motorIndex].pwmPercentage > pwmPercent )
				{if (M[motorIndex].pwmPercentage > MIN_PWM_PERCENTAGE)
					{ M[motorIndex].pwm = M[motorIndex].pwm - deltaPwm;
					}
				}

		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ maxPwm);
		}	
			
	}



void ApplyPwmTest(char motorIndex)
{   if (motorIndex==CYLINDER) 		//Used to switch  on the correct motor 
	{CMPR2 = M[CYLINDER].pwm ;}

    if (motorIndex==BEATER)
	{CMPR3 = M[BEATER].pwm ;}

    if (motorIndex==CAGE)
	{CMPR1 = M[CAGE].pwm ;}

    if (motorIndex==CYL_FEED)
	{T2CMPR = M[CYL_FEED].pwm;}
			
    if (motorIndex==BTR_FEED)
	{T4CMPR = M[BTR_FEED].pwm;}

	if (motorIndex==LC_FEED)
	{T1CMPR = M[LC_FEED].pwm;}
}

char CheckPassword(unsigned char GetPsw)
{
	unsigned char psw=0;
	unsigned int Skey1=0xff;
	unsigned int i,j=0;
	unsigned char digit=4;
	unsigned int cnt1=0,cnt2=0,cnt3=0,cnt4=0;
	char EntPsw[] = "Enter Password  ";
	unsigned int PassWord=0;
	unsigned int PassWordBl=0;

	DispClear();
	DispText(EntPsw,0x10);
	delay(300,MS);

	while(Skey1 != NO)
	{
		//i++; if(i>=15000) {Skey1=KeyScan(); i=0;} else {Skey1=0xff;}
		Skey1=KeyScan();
		if(Skey1 == UP)
		{
			delay(100,MS);

			if(digit==1)
			{
				cnt1++;
				if(cnt1 == 10)
				cnt1=0;
			}
			if(digit==2)
			{
				cnt2++;
				if(cnt2 == 10)
				cnt2=0;
			}
			if(digit==3)
			{
				cnt3++;
				if(cnt3 == 10)
				cnt3=0;
			}
			if(digit==4)
			{
				cnt4++;
				if(cnt4 == 10)
				cnt4=0;
			}					
			 
		} 
				
		if(Skey1 == DOWN)
		{
			delay(100,MS);
			digit--;
			if(digit == 0)
			digit=4;
		}

		PassWord = (cnt4 * 1000) + (cnt3 * 100) + (cnt2 * 10) + cnt1 ;
		
		if(digit==4){PassWordBl = 0x26;}
		if(digit==3){PassWordBl = 0x27;}
		if(digit==2){PassWordBl = 0x28;}
		if(digit==1){PassWordBl = 0x29;}

		j++;
		if((j==20000)||(Skey1!=0xff)){DispNo(PassWord, 0x26, 0x40);}
		if((j>=60000)&&(Skey1==0xff)){DispNo(PassWordBl, PassWordBl, 0x01); j=0;}

		if(Skey1 == YES)
		{
			char PswEr[]= "Psw Error..        ";
			if(PassWord == GetPsw) {psw=OK;} else {DispText(PswEr,0x20); delay(500,MS); psw=0;} //Hide to disable passward option
			Skey1 = NO;									
		}
	}
 DispClear();
 return psw;
}

static char OverloadLogic(void)
	{char breakout1 = 0;
	 char overload[] = "Current Overload!";
	 char msg1[]	= "OverloadData in";
	 char msg2[]  = "DataSet";
	 char key =0;
	 char out =0;
	 char datasetNo = 0;

	 if (OV.overloadFlag == 1)		
			{ StopAllMotors(); //stops allmotors!
			  DispClear();
			  asm(" setc INTM");		// Disable all Interrupts
			  DispText(motorNames[OV.overloadedMotor],0x10);
			  DispText(overload,0x20);
		
			/*write the last values in the  history array into the eeprom */

			  	
			  while (breakout1== 0)
			 	{
			 	  key = KeyScan();		//functions disabled to restart machine by power switch
				  if (key == YES)
						{breakout1= 1;	 
						 DispClear();
					 	 delay(1000,MS);
						 out = 1;
					 	}
			  	} 
			}	//closes if ov.overloadflag ==1
	return out;
	}

