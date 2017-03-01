#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/* MotorRunLogic.c */
/* this is the file which controls the Logic when you decide to Start the machine. */

static void IncreaseMotorIndex(void);
static void DecreaseMotorIndex(void);
static void ResetInitialPwms(void);
static void StartSecondaryMotors(void);
static char OverloadLogic(void);


static char motorIndex = BEATER;
static char motorLimit = 1;	// start out with 1 so taht you show only first 2 motors' values 

char lcdDisplay;
//extern unsigned int loopCounter;	//Loop counter used by the history array to compare with set value and thens store
extern unsigned int OpenerfillFlag;
extern unsigned int LCfillFlag;
unsigned int SecondaryMotorOn;
extern unsigned int LcchokeFlag;
extern unsigned int DooropenFlag;
extern unsigned int SlivercutFlag;
unsigned char sliverdisplay;
unsigned char PiecingRpm;
unsigned char Inchflag;
unsigned int mtrwriteflag; //LC Stop/Start Check flag

extern unsigned int M3Mtcount;
extern unsigned int finmts;
unsigned int mtrcnt =0;
unsigned int finmts100 = 0;
unsigned int cleancount = 0;
unsigned int Machinecleanflag;

unsigned int Stepperdircnt = 0;
unsigned int Stepperstartcnt = 0;
extern unsigned int loopPoint5mS2;
extern unsigned int Stepcnt;
unsigned int Stepdelaycnt = 0;
extern unsigned int Stepperdelaycnt;
unsigned int Stepperautostart = 0;
extern unsigned int Stepperoffdelay;
extern float Fstepperoffdelay;
extern float Fstepperoffdelay1;
extern unsigned int Toggleflag;
extern unsigned int Liftflag;
extern unsigned int Liftbottomcnt;
extern unsigned int Liftbottomcnt1;
extern unsigned int lifthomereset;
extern unsigned int Stepperresetcnt;
extern unsigned int Stepperresetcnt1;
extern unsigned int Stopcount;
unsigned int Stepperhomeflag = 1;
extern unsigned int Liftupcount;
extern unsigned int Liftcount; 
extern unsigned int Beaterpreovloadflag;
extern unsigned int Preovloadcnt;
unsigned int Secondpushbuttonpress = 0;
extern unsigned int Tenmmcycle;
extern unsigned int Blinkflag;

void PauseMotors()
	{char i =0; 

	  ACTRA = 0x0110;	//Keep only Btr and Cyl motors On
//	  SetSdPinHigh();	//switches off SD Pin for the 3 Hardware PWM Motors
	  GPTCONA = 0x0040; //switch of hardware T1PWM,T2PWM (LcFd,CylFd)
	  GPTCONB = 0x0040; //switch of hardware T4PWM (BtrFd)
  //  	GPTCONA = GPTCONA & 0xFFFE; //lc feed motor
//	  T4CON=0x0100;		// switch of all software PWM Motors	
//	  SetBtrPinsLow();	// Ensures Btr motors Switch off .Makes the DIO pins low compulsarily.
	  delay(250,MS);   //to ensure the key press dies down here only

	  /* Make allthe paused motors pwm percentages,pwms 0 so that they have to again ramp up.*/
	  for (i=2;i<6;i++)
		{M[i].pwm = 0;
		 M[i].pwmPercentage = 0;
		}
	TowerLampGreen_Off();
	}	

void RunMachine(void)
	
	{
		
	char breakout = 0;		//Local variable used to exit the while loop and go back to the Top level Menu
	char key = 0;
	char chngRpmEnabled = 0;
	char selectedOption =0;
	char out = 0;
//	char loopcounter =0; used only for testing
	int speed = 0;

//	int prestart = 0;

	char cylinder[] = "CYL";
	char beater[]	= "BTR";
 	char star[] = "*";
	char initializing[] = "Initializing...";
	char paused[] = "Paused";
	char sliver[] = "Sliver";
	char Piecing[] = "Piecing";
	char cut[] = "Cut";
	char lcchoke[] = " Lc Choke";
	char yes[]  = "y";
	char no [] = "n";
	lcdDisplay = FRONT;
//	startfeed = 0;
//	feeddelay = 0;
	OpenerfillFlag = 1;
//	LCfillFlag = 1;
	SecondaryMotorOn = 1;
	LcchokeFlag = 0;
	DooropenFlag = 0;
	SlivercutFlag = 0;
	Machinecleanflag = 0;
	Inchflag  = 0;
    PiecingRpm = 0;
	cleancount = 0;
	Stepperstartcnt = 0;
	Stepperdircnt = 0;
	Stepdelaycnt = 0;
	Toggleflag = 0;
    Liftflag = 1;
	Liftupcount = 0;
    Liftcount = 0;
	Beaterpreovloadflag = 0;
	Preovloadcnt = 0;
	Secondpushbuttonpress = 0;
	DispClear();
	Stepperhome();
	DispText(initializing,0x10);
	MotorStructInit();
	InitMenuStruct();	//for the change speed menu inside
	
	InitOptionsStruct(); // make all the options, including allmotorsOn,anddatalog options 0
	LoadDatalogOptions();//check what needs to be outputted,put it Options into struct after reading from eeprom
	InitOverloadStruct();//make overloaded motor -1 and overload flag  = 0
	/* Reset the arrays used in the Check Overload Functions */
	ResetFilterSumArray();
	ResetOverloadCounterArray();
	/* Reset the array used in FilterRpm*/
	ResetFilterRpmArray();
	/*Init PID variables and array used in calculation of Integral Term */
	InitMotorPID();//VERY IMPORTANT.HAVE TO RUN FOR KP,KI,Km values to be in STRUCT
	ResetIntegralErrorArray(); //Resets array  used to calculate integral error
	/*Reset Arrays used in history Function*/
	ResetHistoryArrays();
	/* Reset Rpm Counts in Encoder .c */
	ResetAllRPMCounts();
	
	DispClear();
	
	asm(" clrc INTM");
	InitMotorHardware();	//Load initial PWM values and enable timer1	
	delay(100,MS);
	
//	Stepperhomeflag = 1;
	Stepperautostart = 1;
	Liftbottomcnt = 0;
	Liftbottomcnt1 = 0;
    lifthomereset = 0;
	Stepperresetcnt = 0;
	Stepperresetcnt1 = 0;
	Stopcount = 0;

//	Stepcnt = 0;
//	PBDATDIR = PBDATDIR & 0xFF7F;
	while (breakout!=1)
		{ //if (trigger ==1)		//if interrupt has occurred
			{ 
			  	
			  out = OverloadLogic();	// inside if overload, all interrupts are stopped
			//  out = RpmerrorLogic();	
			 // out = DooropenCheck(); disable due to checking by ravi
			//  out = MachineCleaning();
			 
			  	

			  	if (out == 1)
			 	 { breakout = 1;}	// go to main menu if overload condition

				if (lcdDisplay==FRONT)
					{DispText(cylinder,0x10);
					 DispNo(M[CYLINDER].presentRpm,0x15,0x40);
					 sliverdisplay = OFF;
					 TowerLampGreen_On();
					 TowerLampBrown_Off();
					 CycleDisp(motorIndex);
			//		 Stepperstartcnt = 1;
						
					/* Actual all motors loop*/
					if (O.allMotorsOn==0) 					
					{
						O.allMotorsOn = CheckAllMotors();	//updates the field in the Options struct directly
				 		if (O.allMotorsOn==1)
				 		{
			 				StartSecondaryMotors();	
			 				StartFeedMotors();	
							StartbtrFeedMotors();	
			 				StartLcFeedMotor();	
			 			//	Stepperautostart = 1;		 
			 			}
					}		
					if (O.allMotorsOn==1)
						{DispText(star,0x2F);
					 	 chngRpmEnabled = 1;
						 motorLimit = 5;		// start showing values of 4 motors.
						}
					}
		/*
			if (finmts == 1)
			{
			 M3Mtcount = 0;
			 finmts = 0;
			 finmts100 ++;  
			}
			if (finmts100 == 100)
			{
			finmts100 = 0;
			mtrcnt++;
			cleancount++;
			}

			if (cleancount >= 20 )
			{
			Machinecleanflag = 1;
			cleancount = 0;
			} 

			if (mtrwriteflag == ON)
			{
			mtrwriteflag = OFF;

			EepromWrite(mtrcnt,mtrscnt);
			}

			DispNo(mtrcnt,0x1c,0x40);
			
			if ( mtrcnt >= 9999)
			{ mtrcnt = 0;}
			*/

			/*
			if (lcdDisplay == CHNGRPM)	
				{selectedOption =	RunLoopMotorSelectMenu();	// here selected option is 0,1,2 that corresponds to Cage,Cylfeed, and beaterFeed
				
				 if ((selectedOption != BACK))
	  					{ speed = RunLoopSetMotorSpeed(selectedOption,RUNLOOP); // set the required speed within that motors limits
						}

				 if (selectedOption == BACK)
					{ // here write all the values in the finalrpm struct into the eeprom
					 char i = 0;
					 for (i=0;i<6;i++)
						{EepromWrite(M[i].finalRpm,U[i].EEfinalRpm); }

					 lcdDisplay = FRONT;
					 delay(200,MS);
					 DispClear();
					 DispText(cylinder,0x10);	// for the other display function 
;					}
				}*/

			if (((lcdDisplay==PAUSED) && (sliverdisplay != 1)) && (PiecingRpm != 1))
				{
				 DispText(paused,0x10); 
				 DispText(cylinder,0x18);
				 DispText(beater,0x28);
				 DispNo(M[CYLINDER].presentRpm,0x1C,0x40);
				 DispNo(M[BEATER].presentRpm,0x2C,0x40);
				}
		
			if (((lcdDisplay==PAUSED) && (sliverdisplay == 1))  && (PiecingRpm != 1))
				{
				 DispText(sliver,0x10); 
				 DispText(cut, 0x20);
				 DispText(cylinder,0x18);
				 DispText(beater,0x28);
				 DispNo(M[CYLINDER].presentRpm,0x1C,0x40);
				 DispNo(M[BEATER].presentRpm,0x2C,0x40);
				}

			if ((lcdDisplay==PAUSED)  && (PiecingRpm == 1))
				{
				 DispText(Piecing,0x10); 
				 DispText(cylinder,0x18);
				 DispText(beater,0x28);
				 DispNo(M[CYLINDER].presentRpm,0x1C,0x40);
				 DispNo(M[BEATER].presentRpm,0x2C,0x40);
				}

			//CHOOSE ONLY ONE! FOR NORMAL OPERATION	 CHOOSE FIRST	
         	//	Datalog(); //NormalDatalog
	    	//	DataLogMotorPID();//(BEATER);	//Datalog used while testing MotorPID
	    	//	DataLogMotorPID(BTR_FEED);	//Datalog used while testing MotorPID
			//	DataLogMotorPID(CYL_FEED);

	  	    key = KeyScan(); 

			if ((key == PUSHBUTTON) || (SlivercutFlag == 1))//Pause Machine 
				{ if (lcdDisplay == FRONT)
					{PauseMotors();
					 TowerLampBrown_On();
					 SerialWriteText(paused,6);
				//	 SerialWriteNewLine(); 		// make pwmpercetage etc zero when paused, and again ramp up.
					 lcdDisplay = PAUSED;
					 if (SlivercutFlag == 1){sliverdisplay = ON;}
					 delay(200,MS);
					 DispClear();
					 key = KeyScan();
					 SecondaryMotorOn=0;
					 Tenmmcycle = 0;
					 Stepdelaycnt = 0;
					// Stepperautostart = 0;

					}	
				}

			if (Beaterpreovloadflag == 1)
			{
				StopFeedMotors();
			}

			if ((Beaterpreovloadflag == 0)&& (lcdDisplay == FRONT))
			{
				StartbtrFeedMotors();
			}

			if(((OpenerfillFlag == 0)&&(O.allMotorsOn==1)) || (LcchokeFlag ==1))

			{
			StartLcFeedMotor();	
			}
				
			if ((lcdDisplay==PAUSED) && (PiecingRpm == OFF))
			{StopLcFeedMotor();}


			if (((OpenerfillFlag == 1) && (LcchokeFlag == 0)) && (lcdDisplay==FRONT))
			{
//			if (lcdDisplay != FRONT){
			StartLcFeedMotor();//}
			}

			if (key == UP)
				{ IncreaseMotorIndex(); 
				}


		 	if (key == DOWN)
				{ 		
				Stepperdircnt++;
				}


			if (Stepperdircnt == 1)
			{
				PBDATDIR = PBDATDIR | 0x0080;
			}
			
			if (key == NO)
			{
				Stepperstartcnt++;
			}
				if (Stepperdircnt == 2)
			{
				PBDATDIR = PBDATDIR & 0xFF7F;
			//	Stepperdircnt = 0;
			}
			
			if (Stepperstartcnt == 2)
			{ Stepperstartcnt = 0;
			loopPoint5mS2 = 0;
			}


				if(Stepperdircnt == 3)
			{	
				Stepcnt = 0;
				Stepperdircnt = 0;
				Stepperstartcnt = 0;
				Stepperautostart = 1;
				loopPoint5mS2 = 0;

			}

			if (Stepperautostart == 1){	DispText(yes,0x2c);}

			if (Stepperautostart == 0){	DispText(no,0x2c);}
				
			//	LcchokeFlag = 0;
			//	TowerLampRed_Off();
				//DecreaseMotorIndex();	
			//	SecondaryMotorOn = 1;		
				
			
		/*	if((PCDATDIR & 0x0004) == 0x0000){Inchflag = ON;} else Inchflag = OFF;

			if ((lcdDisplay == PAUSED) && (PiecingRpm != 1))
			{
			if (Inchflag == ON)
			{StartSecondaryMotors();} else StopSecondaryMotors();
			}*/

		/*	if ((key == YES) && (lcdDisplay = PAUSED))
			{
			StartSecondaryMotors();
			SecondaryMotorOn=1;
			key = KeyScan();
			}*/
			if ((key == PUSHBUTTON)	&& (Secondpushbuttonpress == 1))
			{
			SecondaryMotorOn = 1;
			delay(500,MS);
			DispClear();
			lcdDisplay = FRONT;
			key = KeyScan();
			sliverdisplay = OFF;
			PiecingRpm = OFF;
			Tenmmcycle = 1;
			Stepdelaycnt = 1;
		//	Stepperautostart = 1;
			Secondpushbuttonpress = 0;
			}


		//	if ((key == NO)||(key == PUSHBUTTON))	
			if ((key == PUSHBUTTON)	&& (Secondpushbuttonpress == 0))
				{
	//			 if ((lcdDisplay == PAUSED)&&(SecondaryMotorOn == 1))
				 if (lcdDisplay == PAUSED)

						{ 
       					 TowerLampGreen_On();
						 TowerLampBrown_On();
						 StartSecondaryMotors();
						 StartFeedMotors();
						 StartbtrFeedMotors();	
						 StartLcFeedMotor();
					 	 delay(250,MS);
						 DispClear();
						 sliverdisplay = OFF;
						 PiecingRpm = ON;
						 Tenmmcycle = 1;
						 Stepdelaycnt =1;
					//	 Stepperautostart = 1;
						 Secondpushbuttonpress = 1;
					//	 lcdDisplay = FRONT;						
						}
				key = KeyScan();
				}


			//  trigger = 0;
			}

		}	//closes while
	  
	  
 	} //closes function



static void IncreaseMotorIndex(void)
	{if (motorIndex == motorLimit) 
		{motorIndex = BEATER;		// so that you dont show Cyl since its already there in the top Line 
		delay(250,MS);
		}
	else
	   	{motorIndex++;
	 	delay(250,MS);
	 	}
	}

 
static void DecreaseMotorIndex(void)
	{if (motorIndex == BEATER) 
		{motorIndex = motorLimit;
		delay(250,MS);}
	else
	   	{motorIndex--;
	 	delay(250,MS);
	 	}
	}

//static void PauseMotors(void)

static void ResetInitialPwms(void)
{
 M[CYL_FEED].pwmPercentage = CYL_FD_INIT_PWM_PERCENTAGE;
// M[BTR_FEED].pwmPercentage= BTR_FD_INIT_PWM_PERCENTAGE;
}

static void StartSecondaryMotors(void)
	{ 
	M[CAGE].pwm = CGE_INIT_PWM;
	delay(250,MS);
	ACTRA= 0x0111;	//Enable Cage motor
	}

static void StopSecondaryMotors(void)
	{ 
	  ACTRA = 0x0110;	//Keep only Btr and Cyl motors On
	  delay(250,MS);   //to ensure the key press dies down here only
	  M[CAGE].pwm = 0;
	}

static void StopFeedMotors(void)
	{ 
	  GPTCONB = 0x0040;	//Btr feed stop
	  delay(250,MS);   //to ensure the key press dies down here only
	  M[BTR_FEED].pwm = 0;
	}




static void StartFeedMotors(void)
{ 
	ResetInitialPwms();
	delay(250,MS);
	GPTCONA = GPTCONA | 0x0044; //start CylFd
//	GPTCONB = GPTCONB | 0x0044; //start BtrFd

}

static void StartbtrFeedMotors(void)
{ 
	//ResetInitialPwms();
	M[BTR_FEED].pwmPercentage= BTR_FD_INIT_PWM_PERCENTAGE;
	delay(250,MS);
//	GPTCONA = GPTCONA | 0x0044; //start CylFd
	GPTCONB = GPTCONB | 0x0044; //start BtrFd

}



static void StartLcFeedMotor(void)

{
 	M[LC_FEED].pwmPercentage = LC_FD_INIT_PWM_PERCENTAGE;
 	delay(250,MS);
 	GPTCONA = GPTCONA | 0x0041;
}

static void StopLcFeedMotor(void)
{
	GPTCONA = GPTCONA & 0xFFFE;
	delay(250,MS);   //to ensure the key press dies down here only
	 M[LC_FEED].pwm = 0;
//	GPTCONA = 0x0040;
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


static char RpmerrorLogic(void)
	{char breakout2 = 0;
	 char rpmerror[] = "RPM Error!";
	 char key =0;
	 char out =0;
	 char datasetNo = 0;

	 if (OV.RpmerrorFlag == 1)		
			{ 
			  StopAllMotors(); //stops allmotors!
			  DispClear();
			  asm(" setc INTM");		// Disable all Interrupts
			  DispText(motorNames[OV.Rpmerrormotor],0x10);
			  DispText(rpmerror,0x20);
			/*write the last values in the  history array into the eeprom */	  	
			  while (breakout2== 0)
			 	{
			 	  key = KeyScan();		//functions disabled to restart machine by power switch
				  if (key == YES)
						{breakout2= 1;	 
						 DispClear();
					 	 delay(1000,MS);
						 out = 1;
					 	}
			  	} 
			}	//closes if ov.overloadflag ==1
	return out;
	}

static char DooropenCheck(void)
	{char breakout2 = 0;
	 char dooropen[] = "Door Open!";
	 char key =0;
	 char out =0;
	 char datasetNo = 0;

	 if (DooropenFlag == 1)		
			{ 
			  StopAllMotors(); //stops allmotors!
			  TowerLampRed_On();     //Tower Lamp Red ON
			  TowerLampGreen_Off();
			  DispClear();
			  asm(" setc INTM");		// Disable all Interrupts
			  DispText(dooropen,0x20);
		
			/*write the last values in the  history array into the eeprom */	  	
			  while (breakout2== 0)
			 	{
			 	  key = KeyScan();		//functions disabled to restart machine by power switch
				  if (key == YES)
						{
 						TowerLampRed_Off();
						 breakout2= 1;	 
						 DispClear();
					 	 delay(1000,MS);
						 out = 1;
					 	}
			  	} 
			}	//closes if ov.overloadflag ==1
	return out;
	}

static char MachineCleaning(void)
	{char breakout2 = 0;
	 char cleanmachine[] = "Clean Machine!";
	 char key =0;
	 char out =0;
	 char datasetNo = 0;

	 if (Machinecleanflag == 1)		
			{ 
			  StopAllMotors(); //stops allmotors!
			  TowerLampRed_On();     //Tower Lamp Red ON
			  TowerLampGreen_Off();
			  DispClear();
			  asm(" setc INTM");		// Disable all Interrupts
			  DispText(cleanmachine,0x20);
		
			/*write the last values in the  history array into the eeprom */	  	
			  while (breakout2== 0)
			 	{
			 	  key = KeyScan();		//functions disabled to restart machine by power switch
				  if (key == YES)
						{
 						 TowerLampRed_Off();
						 breakout2= 1;	 
						 DispClear();
					 	 delay(1000,MS);
						 out = 1;
					 	}
			  	} 
			}	//closes if ov.overloadflag ==1
	return out;
	}

static void Stepperhome(void)	//J5 Connector Door open sensor (block low, unblock high)
{	   	
	 char homming[] = "Lift Homming";
	 char fillcotton[] = "Fill Cotton";
	 char liftposition[] = "Lift position";
	 char key =0;
	 unsigned int i;
	 DispClear();
	 DispText(homming,0x10);
	 PBDATDIR = PBDATDIR | 0x0080; // (Assuming Backward)
	 while((PBDATDIR & 0x0040) == 0x0040) 
 	// key = KeyScan();
//	 while(key != YES)
	 {
	 	PFDATDIR = PFDATDIR | 0x0020;
		delay1ms();
		PFDATDIR = PFDATDIR & 0xffdf;
	 	delay1ms();

		/*if((PCDATDIR & 0x0008)==0)
	          {key=YES;}*/
	//	key = KeyScan();
	}
	delay(100,MS);
	DispClear();
	DispText(fillcotton,0x10);
	key = 0;
	delay(100,MS);
	while (key != YES)
	{

	if((PCDATDIR & 0x0080)==0)
	          {key=YES;
			 delay(20,MS);}
	}
	/*
	delay(100,MS);
	PBDATDIR = PBDATDIR & 0xFF7F; //(Assuming Forward)
	
	DispClear();
	DispText(liftposition,0x10);
	key = 0;
	delay(100,MS);
	while(key != YES)
		{

		PFDATDIR = PFDATDIR | 0x0020;
		delay(4,MS);
		PFDATDIR = PFDATDIR & 0xffdf;
	 	delay(4,MS);

		if((PCDATDIR & 0x0008)==0)
	          {key=YES;}
		}*/
		delay(100,MS);
		PBDATDIR = PBDATDIR & 0xFF7F; //(Assuming Forward)
		for (i=0; i<2000; i++)
		{
		PFDATDIR = PFDATDIR | 0x0020;
		delay1ms();
		PFDATDIR = PFDATDIR & 0xffdf;
	 	delay1ms();
		}

		DispClear();
		key = 0;
		Stepperhomeflag = 0;

}



void Stepperdirchange(void)
{
	if (Stepcnt == 2000)
	{
    B_TOGGLE(PBDATDIR,7);
	}

	if (Stepcnt == 3000)
	{
	B_TOGGLE(PBDATDIR,7);
	Stepperautostart = 0;
	Stepcnt = 0;
	Stepdelaycnt = 1;
	}

	if ( Fstepperoffdelay1 >= ((M[Convey_Delay].finalRpm) / 5))
	{
		Stepperautostart = 1;
		Stepdelaycnt = 0;
	}
		
		
}






