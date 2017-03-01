#include "regs240x.h"
#include "AllLogicDefines.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"
#include "AllHardwareFunctions.h"


extern char lcdDisplay;
unsigned int FillCount=0;
unsigned int SignalHigh=0;
unsigned int OpenerfillFlag;
unsigned int LCFillCount=0;
unsigned int LCSignalHigh=0;
unsigned int LCfillFlag;
unsigned int DooropenFlag = 0;
unsigned int SlivercutFlag = 0;
//unsigned int LcOnTimeSec=10;
/*
void OpenerFillCheck(void)	//fuction call at 50mS interrupt, in all motor on condition J4 connector
{      //This has to be changed to beater door sensor

	if ((PCDATDIR & 0x0020) != 0) {if(OpenerfillFlag==1) {FillCount++;} SignalHigh = 1;} // blocked condition IOPC5
	if ((PCDATDIR & 0x0020) == 0) {FillCount=0; SignalHigh = 0;} // Unblock condition
 	if ((FillCount/20) >= M[Convey_Delay].finalRpm) {OpenerfillFlag = 1;} else OpenerfillFlag=0;	//20 fill counts equalto 1 sec

}*/

/*
void OpenerFillCheck(void)	//fuction call at 50mS interrupt, in all motor on condition J4 connector
{

	if ((PCDATDIR & 0x0020) != 0) //Block 
	{OpenerfillFlag = 0;          //Motor Stop
	FillCount=0;                  //Count reset
	}

	if ((PCDATDIR & 0x0020) == 0)  //Unblock
	{ 
		FillCount++;              //Count start
	}
	
	if ((FillCount/20) >= 4)      // Count reaches or croses 4 second
	{
		OpenerfillFlag=1;         //Motor start
	}
}
*/

/*
void LCFillCheck(void)	//fuction call at 50mS interrupt, in all motor on condition J3 Connector
{

	if ((PCDATDIR & 0x0040) != 0) {if(LCfillFlag==1) {LCFillCount++;} LCSignalHigh = 1;}
	if ((PCDATDIR & 0x0040) == 0) {LCFillCount=0; LCSignalHigh = 0;}
 	if ((LCFillCount/20) >= 5) {LCfillFlag = 0;} else LCfillFlag=1;	//20 fill counts equalto 1 sec

}*/

void DooropenSensor(void)	//J3 Connector Door open sensor (Contact low, Non contact high)
{
//	 if (O.logRpm == 1)
//	 {
	 if(((PBDATDIR & 0x0002) == 0x0002) || ((PCDATDIR & 0x0040) == 0x0040))
//	 if(((PCDATDIR & 0x0040) == 0x0040) && ((PBDATDIR & 0x0040) == 0x0040))
	 {DooropenFlag = ON;  } 
	 else DooropenFlag = OFF;
//	 }
}

void SlivercutSensor(void)	//J5 Connector Door open sensor (block low, unblock high)
{	
//	 if (O.logCurrent == 1)
//	 {
	 if((PCDATDIR & 0x0010) == 0x0000){SlivercutFlag = OFF;} else SlivercutFlag = ON;
//	 }
}




