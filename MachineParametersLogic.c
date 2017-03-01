#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/*Machine Parameters Logic */
static char MotorSpeedSelect(void);
static char OverloadCurrentSelect(void);
static char OverloadTimeSelect(void);
static char PidSelect(void);

void RunMachineParameters(void)
{
	 char pw[] = "Wrong Password";	
	 char psw;
     char selection ;
	 char breakout = 0;
	 char out =0;	//out acts like a signal to jump out from inside one of the menus to the main menu
	 InitMenuStruct();
	 psw = CheckPassword(1212);     //password changed
//	 if (psw == OK)
	 {
	 	while (breakout!=1) 
		{ 
			selection = MachineParametersMenu();//function returns values between 0 and 4
	 	  	switch (selection)
			{
			case 0:
				out = MotorSpeedSelect();		
				break;			
		 	case 1:
				out = OverloadCurrentSelect();
				break;
		 	case 2:
			//	out = OverloadTimeSelect();
				break;
			case 3:
				out = PidSelect();
				break;
		 	case 4:		// go back to main menu
				out = 1;
				break;			
			}
			if (out == 1)
			{
				breakout=1;
			}
			else 
			{
				breakout =0 ;
			}
		} //closes while
	}
}

/*  Logic for Motor Speed Select*/
static char MotorSpeedSelect(void)
	{ char selectedOption = 0;
	  unsigned int speed = 0;
	  char breakout = 0;
	  char out = 0;
	 
	  while (breakout!=1)
		{  //returns -2 if selection is main menu and -1 if back is pressed.Else usual motor index
	  		selectedOption = MotorSelectMenu();	
	 		if ((selectedOption != BACK) && (selectedOption!= RESETALL))
	  			{  
	  	    		speed = SetMotorSpeed(selectedOption,PARAMS); // set the required speed within that motors limits
	   	 			if (speed!= BACK)							// if back button hasnt been pressed
	     				{ 
	     				SaveMotorSpeed(selectedOption,speed);  	// write the speed into the correct address
		 				}	
				}
			if (selectedOption == RESETALL)
				{ DispClear();
				  ResetMotorSpeeds();		// Write Default speeds back into eeprom
				}
			if (selectedOption == BACK)	// go back onemenu step
				{ breakout = 1;
				  out = 0;
				}
		}	//closes while

	   return out;	 
	}

//Second level Control logic for OverloadCurrent Menu
static char OverloadCurrentSelect(void)
	{ char selectedOption = 0;
	  unsigned int overload = 0;
	  char breakout = 0;
	  char out = 0;
	 
	  while (breakout!=1)
		{  //returns -2 if selection is main menu and -1 if back is pressed.Else usual motor index
	  		selectedOption = MotorSelectMenu();	
	 		if ((selectedOption != BACK) &&  (selectedOption!= RESETALL))
	  			{
	  	    	 	overload = SetMotorOverloadCurrent(selectedOption); // set the required overload within that motors limits
	  	    	    if (overload!= BACK)							// if back button hasnt been pressed
	     				{ 
	     				SaveMotorOverloadCurrent(selectedOption,overload);  // write the overload into the correct address
		 				}	
				}
			if (selectedOption == RESETALL)
				{ DispClear();
				  ResetOverloadCurrent();
				}
		
			if (selectedOption == BACK)
				{ breakout = 1;
				  out = 0;
				}
		}	//closes while
	
	return out;	
	}



//Second level Control logic for OverloadTime Menu
static char OverloadTimeSelect(void)
	{ char selectedOption = 0;
	  unsigned int overload = 0;
	  char breakout = 0;
	  char out = 0;
	 
	  while (breakout!=1)
		{  //returns -2 if selection is main menu and -1 if back is pressed.Else usual motor index
	  		selectedOption = MotorSelectMenu();	
	 		if ((selectedOption != BACK) && (selectedOption!= RESETALL))
	  			{
	  	    	 	overload = SetMotorOverloadTime(selectedOption); // set the required overload within that motors limits
	  	    	    if (overload!= BACK)							// if back button hasnt been pressed
	     				{ 
	     				SaveMotorOverloadTime(selectedOption,overload);  	// write the overload into the correct address
		 				}	
				}

			if (selectedOption == RESETALL)
				{ DispClear();
				  ResetOverloadTime();
				}
		
			if (selectedOption == BACK)
				{ breakout = 1;
				  out = 0;
				}
		}	//closes while
	
	return out;	
	}


//Second level Control logic for Pid Select
static char PidSelect(void)
	{ char selectedOption = 0;
	  short out1 = 0;
	  char breakout = 0;
	  char out = 0;
	 
	  while (breakout!=1)
		{  //returns -2 if selection is main menu and -1 if back is pressed.Else usual motor index
	  		selectedOption = MotorSelectMenu();	
	 		if ((selectedOption != BACK) && (selectedOption!= RESETALL))
	  			{
	  	    	 	out1 = SetPid(selectedOption); // set the required overload within that motors limits
	  	    	    //out 1 will 	
				}

			if (selectedOption == RESETALL)
				{ DispClear();
				  ResetPidConsts();
				}
		
			if (selectedOption == BACK)
				{ breakout = 1;
				  out = 0;
				}
		}	//closes while
	
	return out;	
	}







