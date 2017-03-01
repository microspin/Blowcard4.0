#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"
/*Tools Logic*/
static  unsigned int Datalogging(void);
static  unsigned int Test(void);
static  unsigned int History(void) ;

void RunTools(void)
	{
	 unsigned int selection ;
  	 unsigned int breakout = 0;
	 unsigned int out =0;	//out acts like a signal to jump out from inside one of the menus to the main menu
	 while (breakout!=1) 
		{ selection = ToolsMenu();//function returns values between 0 and 4
	 	  switch (selection)
			{case 0:
				out = Test();		
				break;			
		 	 case 1:
				out = Datalogging();
				break;
			 case 2 :
				out = steppertestrun();
		 	 	break;
		 	 case MAINMENU:		// go back to main menu
				out = 1;
				break;

			}
		if (out == 1)
			{breakout =1;}
		else 
			{breakout =0 ;}
		}//closes while
	}


static  unsigned int Datalogging(void)
	{  unsigned int optionSelect = 0;

	 optionSelect = DataloggingMenu();	// return BACK only
	 
	 //go back to previous menu
	 return 0;
	
	}



	 
static unsigned int Test(void)
{	  unsigned int selectedOption = 0;
	  unsigned int pwmPercent = 0;
	  unsigned int breakout = 0;
	  unsigned int out = 0;

	  while (breakout!=1)
		{ //returns -2 if selection is main menu and -1 if back is pressed.Else usual motor index
		  selectedOption = MotorSelectMenu();//if you press reset nothing happens
		  if ((selectedOption != BACK) && (selectedOption != MAINMENU) && (selectedOption!= RESETALL))
	  			{
	  			 pwmPercent = SetMotorPwmPercent(selectedOption); // set the required speed in RPM within that motors limits
		  		 if (pwmPercent!= BACK)					 // if  back button is not pressed
					{
					 MotorStructInit();// Load initial pwms into the struct variable, and resetting all other variables
				
					 InitOptionsStruct(); //prepare the options struct for the motor run loop 
			/* Load the values you want in the Options Struct here.We need this cause were going to
			 access these values in the interrupt. */
					 O.testFlag = TRUE;		// To indicate to the interrupt that we re running a test 
					 O.testMotorIndex = selectedOption;	// to indicate to the interrupt which motor to run
					 O.testMotorRpm = pwmPercent;

					 LoadDatalogOptions();	// to be done only after init'ing options struct	
					asm(" clrc INTM");		//Enable all interrupts
					
			/* Switches on the correct ACTRA or Timer 4 for the feedmotors. Also switches on Timer2,and enables all capture pins.*/ 
					 InitMotorHardwareTest(O.testMotorIndex); // Here the Motor PWM will start 
					 out = RunMotorTest(O.testMotorIndex,O.testMotorRpm);//Run motor Control Loop
					asm(" setc INTM");		// Disable all Interrupts
			/* Once we come out, we set the test flag back to zero, and clear the testmotorIndex */
					 O.testFlag = FALSE;	 
					 O.testMotorIndex = -1;	 
					 O.testMotorRpm=0;
					 // make the datalog options zero also
					 O.logCurrent = 0;
					 O.logPwm=0;
					 O.logRpm=0;
			/*if overloaded need to stop all the filtering operations and reset the array counters.*/

				     }

		}	// closesif breakout!=1

		  if (selectedOption == MAINMENU)
				{ 
				  breakout = 1;
				  out = 1;
				}
		  if (selectedOption == BACK)
				{ breakout = 1;
				  out = 0;
				}
				 					
		}// closes while 
		  	 	 
		return out;

}


static unsigned int History(void)
	{  unsigned int breakout = 0;
	   unsigned int out = 0;	
	   unsigned int dataset = 0;
	 
	 while (breakout!=1)
		{ //returns -1 if back and -3 if reset all is pressed.Else sends out the dataset no you want to See */
		  dataset = HistoryMenu();
		  if ((dataset != BACK) )
			{CycleAdcReadings(dataset);	// remains inside till all the readings are done.and thencome out to the previous menu	
			}	

		  if (dataset == BACK)
				{ breakout = 1;
				  out = 0;
				}
		}

	return out;
	}

static unsigned int steppertestrun(void)
	{  unsigned int breakout = 0;
	   unsigned int out = 0;	
	   unsigned int dataset = 0;
	   unsigned int teststepcount = 0;
	   unsigned int teststepdircnt = 0;
	   unsigned int startflag = 1;
	   char key = 0;
	   char dir[]  = "up";
	   char dir1[]  = "down";
	   DispClear();
	 while (breakout!=1)
		{ 
		while((PCDATDIR & 0x0001)==0) //up
		{
		PFDATDIR = PFDATDIR | 0x0020;
		delay(4,MS);
		PFDATDIR = PFDATDIR & 0xffdf;
	 	delay(4,MS);
		teststepcount++;
	//	DispNo(teststepcount,0x1C,0x40);
		}

		DispNo(teststepcount,0x1C,0x40);

		if((PCDATDIR & 0x0008)==0) 
	{	teststepcount = 0;}

		if((PCDATDIR & 0x0004)==0) //down
		{delay(5,MS);
			if((PCDATDIR & 0x0004)==0)
			{
		B_TOGGLE(PBDATDIR,7);
		teststepdircnt++;
		}
		}
		
		if(teststepdircnt == 1)
		{	
		DispText(dir,0x18);
		}
		
		if(teststepdircnt == 2)
		{	
		DispClear();
		DispText(dir1,0x18);
		teststepdircnt = 0;
	
		}
		
		if((PCDATDIR & 0x0002)==0) //  no
		{
		breakout = 1;
	    out = 0; 
		}
	}

	return out;
	}
	
