#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

extern float AdcValue[];
extern float AvgAdcValue[];
extern unsigned int SignalHigh;
extern unsigned int OpenerfillFlag;
extern unsigned int FillCount;
extern unsigned int LCSignalHigh;
extern unsigned int LCfillFlag;
extern unsigned int LCCount;
extern unsigned int Stepperresetcnt;
extern unsigned int Liftupcount;
//DataLog.c
void Datalog(void)
{char amp[] = "ADC ";
 char pwm[] = "PWM%";
 char rpm[] = "RPM ";
 char i =0;

 if (O.logCurrent == 1)
	{
	SerialWriteText(amp,4);
	SerialWriteComma();
	for (i=0;i<6;i++)
		{//amps =  ConvertAdcToDisplayFormat(M[i].presentCurrentAdc);
		 SerialWriteNo(M[i].presentCurrentAdc);
		 SerialWriteComma();
		}

	}

 if (O.logPwm == 1)
	{ 
	SerialWriteText(pwm,4);
	SerialWriteComma();
	for (i=0;i<6;i++)	
		{SerialWriteNo(M[i].pwmPercentage); 
		 SerialWriteComma();
		}

	}
 if (O.logRpm == 1)
	{ 
	SerialWriteText(rpm,4);
	SerialWriteComma();
	for (i=0;i<6;i++)	
		{SerialWriteNo(M[i].presentRpm); 
		 SerialWriteComma();
		}
	}
	SerialWriteNewLine();
}		

void DataLogMotorPID(void)
{
//SerialWriteNo(M[0].presentCurrentAdc); //Filtered ADC Value, will get the output of called motorindex
//SerialWriteComma();
//SerialWriteNo(AdcValue[0]); //Non-Filtered ADC Value, will get the output of called motorindex
//SerialWriteComma();

/*SerialWriteNo(M[motorIndex].overloadCurrentAdc); 
SerialWriteComma();
SerialWriteNo((unsigned int)(M[motorIndex].Km * 100));
SerialWriteComma();
SerialWriteNo((unsigned int)(M[motorIndex].Kp *100));
SerialWriteComma();
SerialWriteNo((unsigned int)(M[motorIndex].Ki * 100));
SerialWriteComma();*/
//SerialWriteNo(M[0].finalRpm);   //Set RPM
//SerialWriteComma();
//SerialWriteNo(M[0].presentRpm); //Actual RPM
//SerialWriteComma();
/*SerialWriteNo(M[motorIndex].intTarget);
serialWriteComma();
if (M[motorIndex].error < 0 )
	{SerialWriteMinus();
	SerialWriteNo(abs(M[motorIndex].error));
	}
else
	{SerialWriteNo(M[motorIndex].error);
	}
SerialWriteComma();
if (M[motorIndex].integralError < 0 )
	{SerialWriteMinus();
	SerialWriteNo(abs(M[motorIndex].integralError));
	}
else
	{SerialWriteNo(M[motorIndex].integralError);
	}
SerialWriteComma();
*/
//SerialWriteNo(M[motorIndex].finalRpm);
//SerialWriteComma();

SerialWriteNo(Stepperresetcnt / 10);
SerialWriteComma();
SerialWriteNo(Liftupcount);
SerialWriteComma();

SerialWriteNo(M[BEATER].presentRpm);
SerialWriteComma();

SerialWriteNo(M[BEATER].presentCurrentAdc);
SerialWriteComma();
SerialWriteNo(M[BTR_FEED].presentCurrentAdc);
SerialWriteComma();
SerialWriteNo(M[CYL_FEED].presentCurrentAdc);
SerialWriteComma();

//SerialWriteNo(M[motorIndex].pwm);
//SerialWriteComma();

//SerialWriteNo(M[motorIndex].intTarget);
//SerialWriteComma();
//SerialWriteNo(M[motorIndex].error);
//SerialWriteComma();

//SerialWriteNo(M[motorIndex].integralError);
//SerialWriteComma();


SerialWriteNo(M[BEATER].pwmPercentage);   //Actual Running PWM Percentage of all motors
SerialWriteComma();

SerialWriteNo(M[BEATER].pwm);   //Actual Running PWM Percentage of all motors
SerialWriteComma();

SerialWriteNo(M[BTR_FEED].pwm);   //Actual Running PWM Percentage of all motors
SerialWriteComma();

SerialWriteNo(M[CYL_FEED].pwm);   //Actual Running PWM Percentage of all motors
SerialWriteComma();
//SerialWriteNo(CMPR2);
//SerialWriteComma();
/*
SerialWriteNo(M[4].finalRpm);
SerialWriteComma();
SerialWriteNo(M[4].pwm);
SerialWriteComma();
SerialWriteNo(M[4].pwmPercentage);   //Actual Running PWM Percentage of all motors
SerialWriteComma();
SerialWriteNo(T4CMPR);
SerialWriteComma();
*/
SerialWriteNewLine();
		
}


void DataLogSignal(void)  //Used to log LC FEED Automatic stop sensor signal 
{
SerialWriteNo(SignalHigh); //LC Feed Sensor Signal 
SerialWriteComma();
SerialWriteNo(OpenerfillFlag); //LC Motor Stop Signal
SerialWriteComma();
SerialWriteNo(FillCount);  //LC Sensor Cut count
SerialWriteComma();
SerialWriteNewLine();		
}


