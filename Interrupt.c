#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"
/* Interrupt.c*/

/* PWM for all the motors is updated once every 50ms.The timer that runs the 0.1ms clock in Timer 2.
And for Latice feed motor, PWM is generated through software, and timer that is used for generating
this PWM is Timer4. This timer is set to interrupt once every 0.1ms. The timer period for the pwm is
further divided within the interrupt function by 100 to create a PWM frequency of 100Hz finally. */


unsigned int loopPoint5mS1 = 0;  //Overload counter fo-r time setting
unsigned int loopPoint5mS2 = 0;
unsigned int loopPoint5mS3 = 0;
unsigned int loopPoint1mS  = 0;
unsigned int loopcount50ms  = 0;

unsigned int Stepperlowflag = 0;
unsigned int Stepcnt = 0;
unsigned int Stepperoffdelay = 0;


extern unsigned int LCfillFlag; //LC Stop/Start Check flag
extern unsigned int mtrwriteflag; //LC Stop/Start Check flag
extern unsigned int Stepperstartcnt;
extern unsigned int Stepdelaycnt;
extern unsigned int Stepperautostart;
float Fstepperoffdelay = 0;
float Fstepperoffdelay1 = 0;

unsigned int Toggleflag = 0;
unsigned int Liftflag = 1;

unsigned int Liftbottomcnt = 0;
unsigned int Liftbottomcnt1 = 0;
unsigned int lifthomereset = 0;
unsigned int Stepperresetcnt = 0;
unsigned int Stepperresetcnt1 = 0;
unsigned int Stopcount = 0;
extern unsigned int Stepperhomeflag;
unsigned int Liftupcount = 0;
unsigned int Liftcount = 0;
extern unsigned int Beaterpreovloadflag;
unsigned int Preovloadcnt = 0;
unsigned int Cycleautostep = 0;
unsigned int Tenmmcycle = 0;
unsigned int Tencount = 0;
unsigned int Stopbtrfeedflag = 0;
unsigned int Blinkflag = 0;

interrupt void overload(void)
{
	asm(" setc INTM");

	if (PIVR == TIMER3INTERRUPT)	//0.5mS or 500uS
	{		
		loopPoint5mS1++;
		loopPoint5mS3++;
		
	//	if (Cottonemptyflag == 1){
	/*	if (Stepperstartcnt == 1){

		loopPoint5mS2++;

		}*/

		if( loopPoint5mS3 == 30) //30ms
		
		{
			CheckpreOverload(BEATER);
			loopPoint5mS3 = 0;
			
		}
		
		if (Beaterpreovloadflag == 1)
		{
			GPTCONB = 0x0040;
			Preovloadcnt++;
			if (Preovloadcnt >= 8000)
			{
				Beaterpreovloadflag = 0;
				Preovloadcnt = 0;
			//	GPTCONB = GPTCONB | 0x0044;
			//	M[BTR_FEED].pwmPercentage= BTR_FD_INIT_PWM_PERCENTAGE;
			}
		}


		if (Stepperautostart == 1)
		{
			loopPoint5mS2++;
			if (Stopbtrfeedflag == 0)
			{
			GPTCONB = 0x0040;
			}
		}

		if (lifthomereset == 1)
		{
			loopPoint5mS2++;
	//		GPTCONB = 0x0040;
		}

		if ( Cycleautostep == 1)
		{
			Stepdelaycnt = 1;
			Cycleautostep = 0;
		}	

		if (Tenmmcycle == 1)
		{	
			Tencount++;
			if(Tencount == 2000)
				{	
					Stepperautostart = 0;
					Stepdelaycnt = 1;
					Tenmmcycle = 0;
					Tencount = 0;
				}
		}
		

		if (Stepdelaycnt == 1)
		{	Stepperoffdelay++;
			Fstepperoffdelay = (Stepperoffdelay * 0.0005);

		} 

		if (Fstepperoffdelay >= 5)
		{	
			Stepperoffdelay = 0;
			Fstepperoffdelay = 0;
			Fstepperoffdelay1++;
		}
			

		if ( Fstepperoffdelay1 >= ((M[Convey_Delay].finalRpm) / 5))
//		if ( Fstepperoffdelay >= M[Convey_Delay].finalRpm)
	{
		Stepperautostart = 1;
		Stepdelaycnt = 0;
		Fstepperoffdelay = 0;
		Fstepperoffdelay1 = 0;
		Stepperoffdelay = 0;
		Tenmmcycle = 1;
	}
		
		if (loopPoint5mS1 == 120) // 0.5mS * 120 = 60mS
		{
	    	CheckOverload(CYLINDER); //Check cylinder overload
			CheckOverload(BEATER);   //Check beater overload
		 	CheckOverload(CAGE);     //Check cage overload
			CheckOverload(CYL_FEED); //Check cylinder feed overload////by ravi
			CheckOverload(BTR_FEED); //Check beater feed overload
			CheckOverload(LC_FEED);
	    	loopPoint5mS1 = 0;
		//	Liftcount++;   // 
		}

		if (loopPoint5mS2 >= 2)
		{	
			PFDATDIR = PFDATDIR | 0x0020;
			Stepperlowflag++;
		}

			if (Stepperlowflag >= 2)
		{
	     	PFDATDIR = PFDATDIR & 0xffdf;
			loopPoint5mS2 = 0;
			Stepperlowflag = 0;

				if ((Liftflag == 1) && (Stopcount == 0))
				{
					Stepperresetcnt++;
					if (Stepperresetcnt == 20000)
					{	Stepperresetcnt1++;
						Stepperresetcnt = 0;
					}
				}

				if(Stepperresetcnt1 == 1)
				{	
					Liftflag = 0;
					Toggleflag = 0;
					Stepperautostart = 0;
					Tenmmcycle = 0;
					Stepdelaycnt = 0;
					Fstepperoffdelay = 0;
					lifthomereset = 1;
					Stopbtrfeedflag = 0;
					PBDATDIR = PBDATDIR | 0x0080;
					Liftbottomcnt++;
					if (Liftbottomcnt >= 20000)
						{	
							Liftbottomcnt1++;
							Liftbottomcnt = 0;
						}
				}

				if (Toggleflag  == 1)
				{
					Stepcnt++;
					Stopcount = 1;
					if (Stepcnt == 100)
						{
							B_TOGGLE(PBDATDIR,7);
							Stepperautostart = 0;
							Stepcnt = 0;
						//	Stepdelaycnt = 1;
							Toggleflag = 0;
							Liftflag = 1;
							Stopcount = 0;
							Cycleautostep = 1;
							if (Liftupcount == 1)
								{
									Stepperresetcnt = (Stepperresetcnt - 120);
								}
					   	}

				}
		} 
		
		if (Stepperautostart == 1) 
		{	
			if (((PCDATDIR & 0x0020) != 0x0020) && (Liftflag == 1))   //check untill its lifting
			{	
				B_TOGGLE(PBDATDIR,7); //change direction
				Toggleflag = 1;
				Liftflag = 0;
				Tenmmcycle = 0;
				Stepdelaycnt = 0;
				Tenmmcycle = 0;
				Tencount = 0;
				Stepperoffdelay = 0;
				Fstepperoffdelay = 0;
				Stopbtrfeedflag = 1;
			} 
		}


		if ((PBDATDIR & 0x0040) != 0x0040)
		{
			Liftbottomcnt1 = 1;
		//	Liftcount++;
			Liftupcount = 0;
    	//	Liftcount = 0;
		}

		if ((PBDATDIR & 0x0040) == 0x0040)
		{
			Liftupcount = 1;
		}

						
		if (Liftbottomcnt1 >= 1)
		{
			Stepperautostart = 0;
			lifthomereset = 0;
		//	Blinkflag = 1;
			if ((PCDATDIR & 0x0020) != 0x0020)
			{
			Stepperresetcnt = 0;
			Stepperresetcnt1 = 0;
			Stepperautostart = 1;
			lifthomereset = 0;
			PBDATDIR = PBDATDIR & 0xFF7F; 
			Liftflag = 1;
			Toggleflag = 0;
			Liftbottomcnt = 0;
			Liftbottomcnt1 = 0;
		//	Blinkflag = 0;
			}
		}


		EVBIFRA = EVBIFRA & 0x0080;	//clear timer 4 flag
	}
	asm(" clrc INTM");
}


interrupt void Timer(void)
{ /* both timer 4 and timer 2 are level 2 interrupts. The PIVR value will tell the CPU which interrupt has 
	created the INT 2 interrupt signal */
	asm(" setc INTM");
/*	if(PIVR == TIMER4INTERRUPT)		//0.1mS or 100uS	
	{ // this function is the equivalent of Apply PWM for the latice feed motor 	
	
		if(LCfillFlag == 1)			//100Hz software pwm for Lattice feed
		{ 
			MCnt1++; //Counter for Latice Feed
		   	if(MCnt1 >= FEED_MTR_PERIOD) {MCnt1=0;} //Reset Mcnt1
		   
		   	if(MCnt1 <= M[BTR_FEED].pwmPercentage)
		   	{B_SET(PFDATDIR,LAT_FEED_PIN);}   //Make Lattice pin High 			
		   
		   	if(MCnt1 > M[BTR_FEED].pwmPercentage)
		   	{B_UNSET(PFDATDIR,LAT_FEED_PIN);}    //Make Lat_Feed pin Low(Lattice Feed)
			
		}
		else {B_UNSET(PFDATDIR,LAT_FEED_PIN);}

		EVBIFRB = EVBIFRB & 0x0001;	//clear timer 4 flag	
	}
*/	
	if (PIVR == TIMER2INTERRUPT)   //0.1mS or 100uS
	{ /* this interrupt starts the update speed loop within the main loop.*/

		loopPoint1mS++;
		
		if(loopPoint1mS>=500)  //0.1 * 500 = 50mS Loop
		{

			loopcount50ms++;
			{

			if (loopcount50ms >= 18000)
			{
				mtrwriteflag = ON;
				loopcount50ms = 0;

			} 
			}

			if (O.testFlag==TRUE)		//if Test Loop
			{
				UpdateMotorTest(O.testMotorIndex,O.testMotorRpm);
			 	ApplyPwmTest(O.testMotorIndex);
				DataLogMotorPID();
				trigger = TRUE;
			}
			else						// normal motor running Loop
			{
				if (O.allMotorsOn==0)	 
				{
					UpdateMotorPID(CYLINDER); //Cylinder motor PID control 
					UpdateMotorPID(BEATER);   //Beater motor PID control		  
				}
				if (O.allMotorsOn==1)
				{
					UpdateMotorPID(CYLINDER); //Cylinder motor PID control
					UpdateMotorPID(BEATER);   //Beater motor PID control
				    UpdateMotorRpm(CAGE);     //Cage motor RPM closed Loop Control
					UpdateMotorPwm(CYL_FEED); //Cylinder Feed PWM control(Open loop)
					UpdateMotorPwm(BTR_FEED); //Beater Feed PWM control(Open loop)
				    UpdateMotorRpm(LC_FEED);  //LC Feed PWM control(Open loop)	 
				}
				
			 //  	OpenerFillCheck(); //LC feed stop
			 /*	if (Stepperhomeflag == 1)
				{	
			 		Stepperhome();
			 	} */
				DooropenSensor();
				SlivercutSensor();
				DataLogMotorPID();
			//	Stepperdirchange();
				ApplyPwms();       //Apply PWM with the generated pwm values
			//	DataLogMotorPID(CYLINDER); // Datalog as per the called the motor
			//    DataLogMotorPID(CYLINDER);
				trigger = TRUE; // Trigger = 1 main loop executes in "motorRunLogicNew.c"
			}
			loopPoint1mS=0;
		}

		T2CNT=0; //Reset Timer 2 Counter Register
		EVAIFRB = EVAIFRB & 0x0001;	//clear timer 2 flag	

	}
	asm(" clrc INTM");
}




