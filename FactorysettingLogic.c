#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"
/*Tools Logic*/
static  unsigned int Sensorset(void);

void FactorySettings(void)
	{
	 char psw;
	 unsigned int selection ;
  	 unsigned int breakout = 0;
	// InitMenuStruct();
	 unsigned int out =0;	//out acts like a signal to jump out from inside one of the menus to the main menu
	 //psw = CheckPassword(1111);     //password changed
	// if (psw == OK)
	 {
	 while (breakout!=1) 
		{ selection = FactorysettingsMenu();//function returns values between 0 and 4
	 	  switch (selection)
			{case 0:
				out = Sensorset();		
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
	}


static  unsigned int Sensorset(void)
	{  unsigned int optionSelect = 0;

	 optionSelect = SensorsetMenu();	// return BACK only
	 
	 //go back to previous menu
	 return 0;
	
	}

void LoadSensorsetOptions(void)
	{//O.doorsens = EepromRead(DOOR_SENS);
	 O.sliversens = EepromRead(SLIVER_SENS);
	 }