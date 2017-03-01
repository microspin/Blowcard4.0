#ifndef ALLLOGICFUNCTIONS_H_
#define ALLLOGICFUNCTIONS_H_

//Logic Global Variables
extern char trigger ; /*Declare the Varible here. Define it in motor RunLogic.use it there and in 
					   Interrupt.c. Used in Architecture 1 */
extern char motorNames[6][4];/*Declare this array as global so that it can be used anywhere*/
extern int dataSetEeAddress[5];//Array of addresses of poistions where various datasets start

//All Logic functions Prototypes

//MotorRunLogicNew
void RunMachine(void);

//MotorRunLogicFunctions
void CycleDisp(int motorCounter);
char RunLoopMotorSelectMenu(void);
int RunLoopSetMotorSpeed(char motorIndex,char param) ;
void UpdateMotorRpm(char motorIndex);
char CheckAllMotors(void);
void ApplyPwms(void);
void InitMotorPID(void);
void UpdateMotorPID(char motorIndex);
void ResetIntegralErrorArray(void);

//MachineParametersLogic
void RunMachineParameters(void);

//MachineParameters Functions
int SetMotorSpeed(char motorIndex,char param);
void ResetMotorSpeeds(void);
void SaveMotorSpeed(char selectedMotor, int speed);
int SetMotorOverloadCurrent(char motorIndex);
void ResetOverloadCurrent(void);
void SaveMotorOverloadCurrent(char selectedMotor, int overload);
int SetMotorOverloadTime(char motorIndex);
void SaveMotorOverloadTime(char selectedMotor, int overload);
void ResetOverloadTime(void);
int ConvertAdcToDisplayFormat(int adc );
int ConvertIntToDisplayTime(int overloadTime);
char SetPid(char motorIndex);
void ResetPidConsts(void);

//Tools Logic
void RunTools(void);

//Tools Logic Functions
void LoadDatalogOptions(void);
void SetBtrPinsLow(void);
void SetSdPinHigh(void);
void StopAllMotors(void);
void Datalog(void);
char RunMotorTest(char motorIndex,int rpm);
void UpdateMotorTest(char motorIndex,int rpm);
void ApplyPwmTest(char motorIndex);
char HistoryMenu(void);
void CycleAdcReadings(char dataset) ;
char CheckPassword(unsigned char GetPsw);

#endif
