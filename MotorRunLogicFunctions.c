#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

char motorCounter =0;
extern unsigned int SecondaryMotorOn;
static signed int integralErrorArray[5]= {0,0,0,0,0};	//used in MotorUpdatePID only
//int rpm = 0;
	
void CycleDisp(int motorCounter)
	{ 
	DispText(motorNames[motorCounter],0x20);
    DispNo(M[motorCounter].presentRpm,0x25,0x40);
			  				  
	}

char RunLoopMotorSelectMenu(void)
	{/*uses the staic motornames array defined at the top of this file */
	 //youcan only select Cage, and the 2 feed motors*/
	 char set[] = "Select Motor";	 
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option

	 delay(250,MS);			// To slow down the Yes Keypress from the above menu	 
	 DispClear();
		
	 while (selected==0)
		{
		 DispText(set,0x10);
		 DispText(motorNames[index],0x20);
		 key = KeyScan();
		 if (key == UP)
			{ if (index == 5)	//index  BFD 
				{index = 0;		//index CGE
				 delay(250,MS);
				 DispClear();}
			  else
			     {index++;
				 delay(250,MS);
				 DispClear();
				 }
			}
		 if (key == DOWN)
			{ if (index == 0) 
				{index = 5;
				delay(250,MS);
				DispClear();}
			  else
			     {index--;
				 delay(250,MS);
				 DispClear();
				 }
			}
		if (key == NO)
			{index = -1;		//Back
			 selected = 1 ;
			}	
		if (key == YES)
			{selected = 1 ;
			}	
		}	// closes while loop
	return index;
	}


int RunLoopSetMotorSpeed(char motorIndex,char param)  	
{	/* returns -1 if No is pressed, or a number which indicates the speed the user has selected */
/* rearrange the variables for cleaner logic */
	int maxSpeedLimit = U[motorIndex].maxSpeedLimit;
	int minSpeedLimit = U[motorIndex].minSpeedLimit;
	int currentSpeed= 0;	//variable with the presently set speed
	int defaultSpeedLimit = U[motorIndex].defaultSpeedLimit;
	int speed=0;
	char text[] = "SetRPM";
	char tgt[] = "Tgt";
	char update[] = "Updated";	
	char spaces[] = "       ";	// to wipe out "updated"
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
	if (param==RUNLOOP)
		{
		 currentSpeed = M[motorIndex].finalRpm;} 

	//Now check for boundary limits.Especially useful when we change eeproms
	if ((currentSpeed > maxSpeedLimit) || (currentSpeed < minSpeedLimit))
	 	{currentSpeed = defaultSpeedLimit;
		}

	speed = currentSpeed;	// so we dont change the speed we got from the eeprom

	delay(250,MS);			// To slow down the Yes Keypress from the above menu	 	
	DispClear();
	
	DispText(text,0x10);
	DispText(tgt,0x19);

	while (selected!=1)
	{	
		DispNo(M[motorIndex].finalRpm,0x1C,0x40);
		DispNo(speed,0x20,0x40);
		key=KeyScan();
		if (key == UP)
			{ if (speed< maxSpeedLimit) 
				{speed = speed + 1;
				}
			}
		 if (key == DOWN)
			{ if (speed > minSpeedLimit) 
				{speed = speed - 1;}
			}
		if (key == YES)
			{//Update Struct
			 M[motorIndex].finalRpm = speed;	
			 DispText(update,0x28);
			 delay(300,MS);
			 DispText(spaces,0x28);	
			}
		if (key == NO)
			{selected = 1 ;
			 speed = BACK;
			}		
		delay(250,MS);		
	}
	return speed;
}


void UpdateMotorRpm(char motorIndex)
	{/* Updates the motor speed when run.In the carding machine there is only ramp up of
	the motors and no pid control.The speed of ramp up is set by the variable deltaRamp. 
	The function gets the current RPM, checks if it is less or more than the final rpm
	and then either increases or decreases the motors speed.Here we increase the pwm
	or pwm percentage by the value in ramp up period and apply it in the ApplyPWM
	function */
	/* Limits ofthe pwm are set so that pwm never goes above that for safety */
	/* Also TO CHECK - what happens if we put a full PID control logic */
	long numerator=0;
	if (motorIndex==2)
		{ 
			
		  M[motorIndex].presentRpm = GetRPM(motorIndex);

		if (SecondaryMotorOn == 0)
		{  
		  if ( M[motorIndex].presentRpm <= 300)
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}
		/* if theres an option to ramp down,then check that pwm > MIN PWM*/ 
		  if ( M[motorIndex].presentRpm > 300 )
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		
		if (SecondaryMotorOn == 1)
		{  
		  if ( M[motorIndex].presentRpm <= M[motorIndex].finalRpm)
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}
		/* if theres an option to ramp down,then check that pwm > MIN PWM*/ 
		  if ( M[motorIndex].presentRpm > M[motorIndex].finalRpm )
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		}
				
		if (motorIndex==5)
		{ 
			
		  M[motorIndex].presentRpm = GetRPM(motorIndex);

		if (SecondaryMotorOn == 0)
		{  
		  if ( M[motorIndex].presentRpm <= 300)
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}
		/* if theres an option to ramp down,then check that pwm > MIN PWM*/ 
		  if ( M[motorIndex].presentRpm > 300 )
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		
		if (SecondaryMotorOn == 1)
		{  
		  if ( M[motorIndex].presentRpm <= M[motorIndex].finalRpm)
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}
		/* if theres an option to ramp down,then check that pwm > MIN PWM*/ 
		  if ( M[motorIndex].presentRpm > M[motorIndex].finalRpm )
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		}
	


   /* if (motorIndex>=3)
		{ M[motorIndex].presentRpm = GetRPM(motorIndex);
		  if ( M[motorIndex].presentRpm <= M[motorIndex].finalRpm )
		  		{if (M[motorIndex].pwmPercentage <= MAX_PWM_PERCENTAGE)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwmPercentage = M[motorIndex].pwmPercentage + M[motorIndex].deltaRampPwm;}
				}

		  if ( M[motorIndex].presentRpm > M[motorIndex].finalRpm )
	 			{M[motorIndex].pwmPercentage = M[motorIndex].pwmPercentage - M[motorIndex].deltaRampPwm;}
		}*/
	}


void UpdateMotorPwm(char motorIndex)
	{//Set the final pwm you want through the menu where you set final pwm
	long numerator=0;
	if (motorIndex==BTR_FEED)
		{ 
		if (SecondaryMotorOn == 0)
		{
		  if ( M[motorIndex].pwmPercentage < 10)	
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}

		  if ( M[motorIndex].pwmPercentage > 10)	
	 			{if (M[motorIndex].pwm > MIN_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
				}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		}
	if (motorIndex==BTR_FEED)
		{ 
		if (SecondaryMotorOn == 1)
		{
		  if ( M[motorIndex].pwmPercentage < M[motorIndex].finalRpm)	
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}

		  if ( M[motorIndex].pwmPercentage > M[motorIndex].finalRpm)	
	 			{if (M[motorIndex].pwm > MIN_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
				}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		}
	
	if (motorIndex==LC_FEED)
		{ 
		if (SecondaryMotorOn == 0)
		{
		  if ( M[motorIndex].pwmPercentage < 1)	
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}

		  if ( M[motorIndex].pwmPercentage > 1)	
	 			{if (M[motorIndex].pwm > MIN_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
				}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		}	
	if (motorIndex==LC_FEED)
		{ 
		if (SecondaryMotorOn == 1)
		{
		  if ( M[motorIndex].pwmPercentage < M[motorIndex].finalRpm)	
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}

		  if ( M[motorIndex].pwmPercentage > M[motorIndex].finalRpm)	
	 			{if (M[motorIndex].pwm > MIN_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
				}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		}	
	
	if (motorIndex==CYL_FEED)
		{ 
		if (SecondaryMotorOn == 0)
		{
		  if ( M[motorIndex].pwmPercentage < 10)	
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}

		  if ( M[motorIndex].pwmPercentage > 10)	
	 			{if (M[motorIndex].pwm > MIN_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
				}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		}
		if (motorIndex==CYL_FEED)
		{ 
		if (SecondaryMotorOn == 1)
		{
		  if ( M[motorIndex].pwmPercentage < M[motorIndex].finalRpm)	
	 			{if (M[motorIndex].pwm <= MAX_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm + M[motorIndex].deltaRampPwm;}
				}

		  if ( M[motorIndex].pwmPercentage > M[motorIndex].finalRpm)	
	 			{if (M[motorIndex].pwm > MIN_PWM)	// ensures that if no encoder is attached, pwm doesnt kep rising
	 				{M[motorIndex].pwm = M[motorIndex].pwm - M[motorIndex].deltaRampPwm;}
				}
		/* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		  numerator = M[motorIndex].pwm * 100.0;
	      M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
		}
		}		

	}

char CheckAllMotors(void)
	{/* Check if all the motors need to be on.All motors areswitched on only after the 
	two main motors reach their full speed */
	 char allMotorsOn1 = 0;		//Local variable
	 if(M[CYLINDER].presentRpm >= (M[CYLINDER].finalRpm - 50))
	//	{if ( M[BEATER].presentRpm >= (M[BEATER].finalRpm - 50) ) 
		//	 allMotorsOn1 = 1; //new added for testing
			//	 allMotorsOn1 = 1; 
				{ allMotorsOn1 = 1; }
		//}
	return allMotorsOn1;
	}

void ApplyPwms(void)
	{ /* Check if the pwms arent out of range wrt the max and min limits and then apply them
		Though each time this loop is run all the motors are checked and applied,
		it shouldnt matter initially when all the motors arent on, because ACTRA is off
		for cage and timer 4 is off too */
	
	  if ((M[CYLINDER].pwm <= MAX_PWM ) && (M[CYLINDER].pwm >= MIN_PWM) )
	  	{CMPR2 = M[CYLINDER].pwm ;}

	  if ((M[BEATER].pwm <= MAX_PWM ) && (M[BEATER].pwm >= MIN_PWM) )
		{ CMPR3 = M[BEATER].pwm; }

	  if ((M[CAGE].pwm <= MAX_PWM ) && (M[CAGE].pwm >= MIN_PWM) )
	  	{ CMPR1 = M[CAGE].pwm;}

	  if ((M[CYL_FEED].pwm <= MAX_PWM) && (M[CYL_FEED].pwm >= MIN_PWM) )
		{ T2CMPR = M[CYL_FEED].pwm;}

	  if ((M[BTR_FEED].pwm <= MAX_PWM) && (M[BTR_FEED].pwm >= MIN_PWM) )
	    { T4CMPR = M[BTR_FEED].pwm;}

      if ((M[LC_FEED].pwm <= MAX_PWM ) && (M[LC_FEED].pwm >= MIN_PWM) )
	  	{ T1CMPR = M[LC_FEED].pwm;}
	}


void UpdateMotorPID(char motorIndex)

	{long numerator =0;
	 unsigned int calcPwm = 0;	// calculated PWM.
	// only works for the three hardware PWM motors.
	if (motorIndex<3)
		{ M[motorIndex].presentRpm = GetRPM(motorIndex);

	// Ramp up only till we reach the set value.Then dont even enter the below loop.
		if (M[motorIndex].intTarget <= M[motorIndex].finalRpm) 
			{	//speed of ramp up set by pidDeltaRpm
				M[motorIndex].intTarget = M[motorIndex].intTarget + PID_DELTA_TARGET_RPM;	// create new target
   			}
			// Ramp up only till we reach the set value.Then dont even enter the below loop.
		if (M[motorIndex].intTarget > M[motorIndex].finalRpm) 
			{	//speed of ramp up set by pidDeltaRpm
				M[motorIndex].intTarget = M[motorIndex].intTarget - PID_DELTA_TARGET_RPM;	// create new target
   			}

   	    M[motorIndex].error = M[motorIndex].intTarget - M[motorIndex].presentRpm; // calculate error.Calculate from int target so that while ramping error is proportional to error at that point 
		
		if ( M[motorIndex].error >= 350)
		{
		
		OV.Rpmerrormotor = motorIndex;
		OV.RpmerrorFlag = 1;

		}
		
		 /*Integral Error Calculation Method 1. But have to put limits.
		 To prevent windup,start integral calculation only after flyer has almost reached its set speed */
//		 if ((M[motorIndex].finalRpm - M[motorIndex].presentRpm) <= ANTI_WINDUP_DELTA_RPM)
				//{ 
			
				if (M[motorIndex].integralError<=-10000){M[motorIndex].integralError+=100;}
				if (M[motorIndex].integralError>=10000){M[motorIndex].integralError-=100;}
				if ((M[motorIndex].integralError<10000)&&(M[motorIndex].integralError>-10000))
				     		{M[motorIndex].integralError = M[motorIndex].integralError + M[motorIndex].error ; }
			
				//	}
/*			else
				{ M[motorIndex].integralError = 0; }
*/			

  	    calcPwm = (unsigned int)((M[motorIndex].Km * M[motorIndex].intTarget) + (M[motorIndex].Kp * M[motorIndex].error) + (M[motorIndex].Ki * M[motorIndex].integralError));
  	    if (calcPwm <= MAX_PWM)
			{M[motorIndex].pwm  = calcPwm;}
  	 /* calculate the pwmpercentage and put that into pwmpercentage so you can display it.For the Feed motors
		anyway your manipulating pwm only through pwm percentage*/
		numerator = M[motorIndex].pwm * 100.0;
	    M[motorIndex].pwmPercentage = (unsigned int)(numerator/ MAX_PWM_HARDWARE);
			
		}
	}
void ResetIntegralErrorArray(void)
	{char i =0;	
	 for (i=0;i<5;i++)
		{ integralErrorArray[i]= 0;}
	}

/*
void RpmError(void)
{
			 char rpmerror[] = "Rpm Error!";
			  StopAllMotors(); //stops allmotors!
			  DispClear();
			  asm(" setc INTM");		// Disable all Interrupts
			  DispText(motorNames[OV.rpmerror],0x10);
			  DispText(rpmerror,0x20);
}*/
