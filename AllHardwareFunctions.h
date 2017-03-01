#ifndef ALLHARDWAREFUNCTIONS_H_
#define ALLHARDWAREFUNCTIONS_H_

/*Global Variable for Software pwm */
extern char MCnt1;
/* All hardware functions Prototypes */

//Initialize
void Initialize(void);
void MotorStructInit(void);
void InitMenuStruct(void);
void InitOptionsStruct(void);
void InitOverloadStruct(void);
void InitMotorHardware(void);
void InitMotorHardwareTest(char motorIndex);

//Display
void DispInit(void);
void DispClear(void);
void DispText( char* string, unsigned int place);
void DispUserText( const char stringtext[], unsigned int place);
void DispNo(unsigned int value,unsigned int place, unsigned int type);

//Delay
void delay1us(void);
void delay1ms(void);
void delay(unsigned int time,unsigned int isMilli);

//Eeprom
unsigned int EepromRead(int address);
void EepromWrite(unsigned int data, int address);


//Keypad
void KeysInit(void);
char KeyScan(void);

//Serial
void SerialInit(void);
void SerialDisable(void);
void SerialWriteNo(unsigned int number);
void SerialWriteComma(void);
void SerialWriteNewLine(void);
void SerialWriteText(char* string,unsigned int length);
void SerialWriteMinus(void);

//Encoder.c
int  GetRPM(char motorIndex);
void ResetAllRPMCounts(void);
void ResetFilterRpmArray(void);

//ADC.c
void AdcInit(void);
void ResetFilterSumArray(void);
unsigned int AdcFilteredGet(unsigned int motorIndex);
unsigned int LcFilterGet(unsigned int motorIndex);
void ResetOverloadCounterArray(void);
void CheckOverload(unsigned int motorIndex);
void UpdateHistoryArray(int counter);
void ResetHistoryArrays(void);
unsigned int SaveHistoryArray(unsigned int motorIndex);

#endif