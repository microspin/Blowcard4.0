#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"
/*Main.c*/

//Define all Global Variables , and Structs here.
struct Motor M[6];
struct Menu U[6];
struct Options O;
struct Overload OV;
extern unsigned int mtrcnt;
char MCnt1=  0;		//for Beater Feed
char trigger = 0;	//Define the trigger variable. Is used to run things only one time in the  
					//motor run loop
char motorNames[6][4] = {"CYL","BTR","CGE","CFD","BFD","LFD"} ;
//addresses have to be int
int dataSetEeAddress[5]= {DATASET1_ADDRESS,DATASET2_ADDRESS,DATASET3_ADDRESS,DATASET4_ADDRESS,DATASET5_ADDRESS};

void main()
{
int i;
char selection = 0;
char ver[] = "VER:BC_17_01_00   ";
StopAllMotors();
Initialize();			//Initialize System Registrys
DispInit();             //Display Initialize	
DispClear();			//Clear Display	
mtrcnt = EepromRead(mtrscnt);
//DispNo(mtrcnt,0x20,0x20);
DispText(ver,0x10);     //Display Version No
delay(2000,MS);     //Millisec delay loop
AdcInit();  		 //Initialize Adc Module
SerialInit();		//Serial out Initialize 

MotorStructInit();		// Create initial struct

delay(3000,1);			//3 seconds delay
DispClear(); 
TowerLampGreen_Off();
TowerLampRed_Off();
TowerLampBrown_On();

while(1)	//Main start loop when M/C ON
	{
	TowerLampBrown_On();
	TowerLampGreen_Off();
	TowerLampRed_Off();
	 selection = TopLevelMenu();	//function to cycle through options on keypress and return selected option
		switch (selection)
		{case 0:
			RunMachine();			//Start the Machine
			 break;
			
		 case 1:
			RunMachineParameters();	//Menu operations to set Machine Parameters
			break;
			
		 case 2:
			RunTools();				//Menu operations to set Tools and other options
			break;

		 case 3:
			FactorySettings();
			break;
			
		}	  	
	}	// closes While

}// closes main




