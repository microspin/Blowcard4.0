#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"
float Precentagecalc = 0;
float Tensiondraft = 0;

/*Initialize.C
In the carding machine, 7 motors are used. Of these 6 motors are controlled through
PWM Pins 1,3,5,T1PWM,T2PWM,T4PWM, while the other 1 motor is controlled through software
pwm Motor Pin.

PINS-AS PER SCHEMATIC

SCHEM_NAME	uCPINNO	 PINNAME	EVENTMANAGER	TYPE						MOTOR

FB1 - 	 	57 		CAP1		A				ENCODER INPUT				CYLINDER
FB2 - 	 	55  	CAP2		A				ENCODER	INPUT				BEATER
FB3 - 	 	52  	CAP3		A				ENCODER INPUT				CAGE
FB4 - 	 	60  	CAP4		B				ENCODER	INPUT
PFB -		56		CAP5		B				ENCODER INPUT
1sClock		48		CAP6		B				ENCODER INPUT
DCM1    	36		PWM3    	A				PWM							CYLINDER				
DCM2		31		PWM5	   	A				PWM							BEATER
DCM3		39		PWM1	   	A				PWM							CAGE
DCM4		12		T1PWM/T1CMP	A  				PWM THROUGH TIMER1			LC_FEED
DCM6		13		T2PWM		A				PWM							CYL_FEED
STEPA		5		T4PWM		B				PWM THROUGH TIMER4			BET_FEED
STEPC		89		IOPF5		B				Software PWM				Latice Feed
STEPB		2		IOPF4		B				I/O							Tower Lamp Red
DCM5		28		IOPB3		A				I/O							Tower Lamp Green
STEPD		92		IOPF6		B				I/O							SD Pin Shared

GPIO's
					
					
*/

void Initialize(void)
{
	//General Setup
	SCSR1 = 0x008D;  	//Sets System clock as input clock frequency(10Mhz) into 4.ie:40Mhz
	SCSR2 = (SCSR2 | 0x000B) & 0x000F; //Disable boot ROM and allocate SARAM into both Data and Program memory spaces.
	WDCR = 0x00E8;		//Disable Watch Dog timer
	WSGR = 0x0040;		// ?

	asm("	SETC INTM");	/* Disable global interrupts */

	/*Pin Initialization*/
	/* The MCRx registers select between a pins acting with itsprimary functionality or its secondary functionality.
	Secondary functionalioty is defined as IO functionality, and primary functionality is PWM,CAPTURE, etc.See page
	115 onwards of the Pdf "TMS320LF/LC240xA DSP Controllers Reference Guide ".Set thepin to zero for secondary functionality  */
	PADATDIR |= 0x0404;		// Set SD pin as output pin 

	MCRA = 0x357B;			// group A pins ,PWMS 1,3,5 ON, CAP1,2,3 ON, T1PWM,T2PWM ON.
	MCRB = 0x0000;			// group B pins // all pins are GPIO's
	MCRC = 0x0B80;			// group C pins //CAP4,5 ,6 are ON  // was  380 changed to 381 to see clkout


	PBDATDIR = PBDATDIR & 0xb800;	// Sets the PWM pins as outputs  old f800
	PBDATDIR = PBDATDIR | 0xb800;

//	PCDATDIR = 0x00F0;  // Make PC4-7 i/o pins outputs, the others are 4 keyboard inputs
	PCDATDIR |= 0x0000;

	PFDATDIR &= 0x7800;	// Cap 5 and Cap 6 are inputs, the bits high are used as SCL, STEPA and Step B respectively from the left. 
	PFDATDIR |= 0x7800;

	/* Setup Interrupts */
	/* Since there are so many interrupts on the DSP, they are divided into 6 main groups.When an interrupts
	is generated the CPU gets an immediate signal telling it from which group it has come.It then has to go
	to the PIVR register where a value that refers to the interrupt from that group which generated the 
	interrupt signal will be loaded.*/
	IFR = 0x003F;	// all 6 levels of interrupt are enabled.
	/*INT4 has all the capture interrupts, INT2 has the timer1 interrupt and INT3 has timer2 and timer 4 interrupts */
	IMR = 0x000E;	// only ints 2,3,4 are unmasked and active. int is active if 1 and unmasked.


	/*** Setup the event manager interrupts ***/
	//(To clear an interrupt write 1 to it)
	// These registers can be read to see if an interrupt was generated.
 	/*Cap1,2,3 are in Event Manager A and CAP 4,5,6 are in Event Manager B.
	Further,Cap 1,2 and 3 are in EVMA's C group. In EVMA's B group is the interrupt for Timer2 which is set for
	interrupt on matching with timer2's period register.
	CAP4,5,6 are in EVMB's C group and Timer 4 is in EVMB's B group and is also set for interrupt generation
	on Timer4 matching with value in timer 4's period register. */
	 
	EVAIFRA = 0xFFFF;		// clear all EVA group A interrupts
	EVAIFRB = 0xFFFF;		// clear all EVA group B interrupts
	EVAIFRC = 0xFFFF;		// clear all EVA group C interrupts
	EVAIMRA = 0x0000;		// enable none of the interrupts on EVA's group A
	EVAIMRB = 0x0001;		// Enable Timer1's interrupt on match with period register
	EVAIMRC = 0x0007;		// Enable interrupts, CAP1,2,and 3

	EVBIFRA = 0xFFFF;		// clear all EVB group A interrupts
	EVBIFRB = 0xFFFF;		// clear all EVB group B interrupts
	EVBIFRC = 0xFFFF;		// clear all EVB group C interrupts
	EVBIMRA = 0x0080;		// enable none of the interrupts on EVB's group A
//	EVBIMRA = 0x0000;		// enable none of the interrupts on EVB's group A
	EVBIMRB = 0x0001;		// Enable Timer 4's interrupt on match with period register
	EVBIMRC = 0x0007;		// Enable interrupts CAP4,5 and 6


	// Capture Registers Initialisation
	CAPFIFOA = 0x1500;		//CAPFIFO keeps track of a capture events till its acknowledged. Only one event is stored,(the last),for CAP1,CAP2 and Cap3.
	CAPCONA = 0x36fc;		//Enable CAP1,2,3(Raising and Falling edges) and make all of them use timer1 as their time base.

	CAPFIFOB = 0x1500;		//CAP4,5,6 keeps track of only 1 entry, like CAPFIFOA
    CAPCONB = 0x30fc;		//Enable CAP4,5,6 (Raising and Falling edges) and make all of them use timer4 as their time base
	
	/*PWMS
	We require control for a maximum of 5 motors independantly.This is divided between the two event managers
	with EVA having 3 motors, and EVB having 2 motor.EVB though, controls the Stepper when needed, 
	by replacing the two DCM motors it other wise can. 
	Each EVManager has 6 full PWM's and 2 TimerPWMs.Of the 6, there are 3 'couples', each couple consisting
	of two pins which will have the same PWM duty value.We need 3 independant PWM's in EVA . The two
	motors in EVB are controlled thorugh a software PWM that is applied using timer 4.
	*/
	// Compare Registers Initialisation
	/* These Set up only the full PWM Pins 1,3 and 5*/
	COMCONA = 0xCA00;	// Enable Compare Operations,reload immediately on match,reload ACTRA immediately,enable outputs
	ACTRA = 0x0000;		// PWM's Forced Low,Ie Start all motors off.

	/* General Purpose Control registers for Timers */
	/* this sets up TIPWM and T4PWM */
	GPTCONA = 0x0040; 	//Enable all GPTimer Compare outputs.Both are forced low. T1PWM,T2PWM
	GPTCONB = 0x0040;	//Enable all GPTimer Compare outputs.Both are forced low. T4PWM

	//TIMERS
	/* Make all Timer Control Registers Zero before we reload new values.They are also disabled. */
	T1CON = 0x0000;
	T2CON = 0x0000;
	T4CON = 0x0000;

 	/* TIMER 1 - Used as a time base for CAP1,2,3 and as a time base for PWM's 1,3,5 and T1PWM for Lc feed*/
 	T1CON = 0x100A;		// Continuous Upcount mode, Reload immediately, Enable Timer1 compare, Prescalar of 1 and clock source is input
	T1CNT = 0x0000;		//clear timer counter
	T1PR  = 4000;		//PWM Period Value for 10Khz MOSFET Switching Frequency, Period 0.1ms
	
	/* Timer2 - Used as a trigger to update the PWM of all the motors and to generate T2PWM for Cyl feed*/
	T2CON = 0x100A;			// Continuous UpCount,Prescalar of x/128, Enable timer operation, no timer compare,
	T2CNT = 0x0000;			// clear timer counter
	T2PR  = 4000;			// set timer period for 0.1ms interrupt

	/* Timer3 - Used as a trigger to check overload*/
	T3CON = 0x104A;			// Continuous UpCount,Prescalar of x/128, Enable timer operation, no timer compare,
	T3CNT = 0x0000;			// clear timer counter
	T3PR  = 20000;			// 1000->25uS , 2000-->50us, 20000-->500us

	/* TIMER4 - Used as a time base for CAP4,5,6 and T4PWM for beater feed motor*/
	T4CON = 0x100A;	// Continuous Up count mode,Reload immedieately, Enable Timer4 compare Disable, timer operations.Prescalar of 1 , and clock source is internal 
	T4CNT = 0x0000;		// clear timer counter
	T4PR  = 4000;
}

/* Create an initial MotorStruct for loading values into */
void MotorStructInit(void)			//
{	M[CYLINDER].finalRpm = EepromRead(CYL_RPM) ;
	M[CYLINDER].presentRpm = 0;
	M[CYLINDER].presentCurrentAdc = 0;
//	M[CYLINDER].overloadCurrentAdc = EepromRead(CYL_OVRLD_AMPS);
	M[CYLINDER].overloadCurrentAdc = CYL_LIMIT_CURRENT;
	M[CYLINDER].overloadTimeInt = EepromRead(CYL_OVRLD_TIME);
	M[CYLINDER].historySaveFreq = (M[CYLINDER].overloadTimeInt / 2);
	M[CYLINDER].deltaRampPwm = CYL_RAMP_PWM;
	M[CYLINDER].menuDeltaRpm= CYL_DELTA_RPM;
	M[CYLINDER].intTarget = 0;
	M[CYLINDER].error = 0;
	M[CYLINDER].integralError = 0;
	M[CYLINDER].pwm = CYL_INIT_PWM ;
	M[CYLINDER].pwmPercentage =0; //Not used for motors with HW PWM
	M[CYLINDER].Kp = 0;
	M[CYLINDER].Ki = 0;
	M[CYLINDER].Km = 0;

	M[BEATER].finalRpm = EepromRead(BTR_RPM);
	M[BEATER].presentRpm = 0;
	M[BEATER].presentCurrentAdc = 0;
//	M[BEATER].overloadCurrentAdc = EepromRead(BTR_OVRLD_AMPS);
	M[BEATER].overloadCurrentAdc = BTR_LIMIT_CURRENT;
	M[BEATER].overloadTimeInt =  EepromRead(BTR_OVRLD_TIME);
	M[BEATER].historySaveFreq = (M[BEATER].overloadTimeInt / 2);
	M[BEATER].deltaRampPwm = BTR_RAMP_PWM;
	M[BEATER].menuDeltaRpm= BTR_DELTA_RPM;
	M[BEATER].intTarget =0;
	M[BEATER].error = 0;
	M[BEATER].integralError = 0;
	M[BEATER].pwm = BTR_INIT_PWM;
	M[BEATER].pwmPercentage = 0;	//Not used for motors with HW PWM
	M[BEATER].Kp = 0;
	M[BEATER].Ki = 0;
	M[BEATER].Km = 0;

//	M[CAGE].finalRpm = (EepromRead(CGE_RPM)* CAGE_METERS_MIN_CONV);
//    M[CAGE].finalRpm = EepromRead(CGE_RPM);
	Precentagecalc = (1 +((1 * EepromRead(CGE_RPM)) * 0.01));
	Tensiondraft = (EepromRead(LC_FD_RPM) / Precentagecalc);
//	M[CAGE].finalRpm = ((EepromRead(LC_FD_RPM))/ (1 + (1 * EepromRead(CGE_RPM)) / 100) / CLR_METERS_MIN_CONV);
	M[CAGE].finalRpm = (Tensiondraft / CLR_METERS_MIN_CONV);	
	M[CAGE].presentRpm = 0;
	M[CAGE].presentCurrentAdc = 0;
	M[CAGE].overloadCurrentAdc = CGE_LIMIT_CURRENT;
//	M[CAGE].overloadCurrentAdc = EepromRead(CGE_OVRLD_AMPS);
	M[CAGE].overloadTimeInt =  EepromRead(CGE_OVRLD_TIME);
	M[CAGE].historySaveFreq = (M[CAGE].overloadTimeInt / 2);
	M[CAGE].deltaRampPwm = CGE_RAMP_PWM;
	M[CAGE].menuDeltaRpm= CGE_DELTA_RPM;
	M[CAGE].intTarget = 0;
	M[CAGE].error = 0;
	M[CAGE].integralError = 0;
	M[CAGE].pwm = CGE_INIT_PWM;
	M[CAGE].pwmPercentage = 0;		//Not used for motors with HW PWM
	M[CAGE].Kp = 0;
	M[CAGE].Ki = 0;
	M[CAGE].Km = 0;

	M[CYL_FEED].finalRpm =  EepromRead(CYL_FD_RPM);
	M[CYL_FEED].presentRpm = 0;
	M[CYL_FEED].presentCurrentAdc = 0;
	M[CYL_FEED].overloadCurrentAdc = CFD_LIMIT_CURRENT;
//	M[CYL_FEED].overloadCurrentAdc = EepromRead(CYL_FD_OVRLD_AMPS);
	M[CYL_FEED].overloadTimeInt = EepromRead(CYL_FD_OVRLD_TIME);
	M[CYL_FEED].historySaveFreq = (M[CYL_FEED].overloadTimeInt / 2);
	M[CYL_FEED].deltaRampPwm = CYL_FD_RAMP_PWM_PERCENTAGE;
	M[CYL_FEED].menuDeltaRpm= CYL_FD_DELTA_RPM;
	M[CYL_FEED].intTarget = 0;
	M[CYL_FEED].error = 0;
	M[CYL_FEED].integralError = 0;
	M[CYL_FEED].pwm = 0;		//Not used for Feed motors 
	M[CYL_FEED].pwmPercentage = CYL_FD_INIT_PWM_PERCENTAGE;
	M[CYL_FEED].Kp = 0;
	M[CYL_FEED].Ki = 0;
	M[CYL_FEED].Km = 0;

	M[BTR_FEED].finalRpm = EepromRead(BTR_FD_RPM);
	M[BTR_FEED].presentRpm = 0;
	M[BTR_FEED].presentCurrentAdc = 0;
	M[BTR_FEED].overloadCurrentAdc = BFD_LIMIT_CURRENT;
//	M[BTR_FEED].overloadCurrentAdc =  EepromRead(BTR_FD_OVRLD_AMPS) ;
	M[BTR_FEED].overloadTimeInt = EepromRead(BTR_FD_OVRLD_TIME);
	M[BTR_FEED].historySaveFreq = (M[BTR_FEED].overloadTimeInt / 2);
	M[BTR_FEED].deltaRampPwm = BTR_FD_RAMP_PWM_PERCENTAGE;
	M[BTR_FEED].menuDeltaRpm= BTR_FD_DELTA_RPM;
	M[BTR_FEED].intTarget = 0;
	M[BTR_FEED].error = 0;
	M[BTR_FEED].integralError = 0;
	M[BTR_FEED].pwm = 0;	//Not used for Feed motors
	M[BTR_FEED].pwmPercentage=BTR_FD_INIT_PWM_PERCENTAGE;
	M[BTR_FEED].Kp = 0;
	M[BTR_FEED].Ki = 0;
	M[BTR_FEED].Km = 0;	

	M[LC_FEED].finalRpm = (EepromRead(LC_FD_RPM) / CAGE_METERS_MIN_CONV);
//	M[LC_FEED].finalRpm = EepromRead(LC_FD_RPM);
	M[LC_FEED].presentRpm = 0;
	M[LC_FEED].presentCurrentAdc = 0;
	M[LC_FEED].overloadCurrentAdc =  LFD_LIMIT_CURRENT;
//	M[LC_FEED].overloadTimeInt = EepromRead(BTR_FD_OVRLD_TIME);
//	M[LC_FEED].historySaveFreq = (M[BTR_FEED].overloadTimeInt / 2);
	M[LC_FEED].deltaRampPwm = LC_FD_RAMP_PWM_PERCENTAGE;
	M[LC_FEED].menuDeltaRpm= LC_FD_DELTA_RPM;
//	M[LC_FEED].intTarget = 0;
//	M[LC_FEED].error = 0;
//	M[LC_FEED].integralError = 0;
	M[LC_FEED].pwm = 1;	//Not used for Feed motors
	M[LC_FEED].pwmPercentage=LC_FD_INIT_PWM_PERCENTAGE;
//	M[LC_FEED].Kp = 0;
//	M[LC_FEED].Ki = 0;
//	M[LC_FEED].Km = 0;	

	M[Convey_Delay].finalRpm = EepromRead(CONV_DELAY) ;
	M[Convey_Delay].presentRpm = 0;
	M[Convey_Delay].presentCurrentAdc = 0;
//	M[CYLINDER].overloadCurrentAdc = EepromRead(CYL_OVRLD_AMPS);
	M[Convey_Delay].menuDeltaRpm= Convey_Delay_Delta;
	
}
	

void InitMenuStruct(void)
	{U[CYLINDER].maxSpeedLimit = CYL_MAX_RPM;
	 U[CYLINDER].minSpeedLimit = CYL_MIN_RPM;
	 U[CYLINDER].defaultSpeedLimit = CYL_DFLT_RPM;
	 U[CYLINDER].EEfinalRpm = CYL_RPM ;
	 U[CYLINDER].EEoverloadCurrent = CYL_OVRLD_AMPS ;
	 U[CYLINDER].EEoverloadTime = CYL_OVRLD_TIME ;
	 U[CYLINDER].EEKm = CYL_KM;
	 U[CYLINDER].EEKp = CYL_KP;
	 U[CYLINDER].EEKi = CYL_KI;


	 U[BEATER].maxSpeedLimit = BTR_MAX_RPM;
	 U[BEATER].minSpeedLimit = BTR_MIN_RPM;
	 U[BEATER].defaultSpeedLimit = BTR_DFLT_RPM;
	 U[BEATER].EEfinalRpm = BTR_RPM ;
	 U[BEATER].EEoverloadCurrent = BTR_OVRLD_AMPS ;
	 U[BEATER].EEoverloadTime = BTR_OVRLD_TIME ;
	 U[BEATER].EEKm = BTR_KM;
	 U[BEATER].EEKp = BTR_KP;
	 U[BEATER].EEKi = BTR_KI;


 
	 U[CAGE].maxSpeedLimit = CGE_MAX_RPM;
	 U[CAGE].minSpeedLimit = CGE_MIN_RPM;
 	 U[CAGE].defaultSpeedLimit = CGE_DFLT_RPM;
 	 U[CAGE].EEfinalRpm = CGE_RPM ;
	 U[CAGE].EEoverloadCurrent = CGE_OVRLD_AMPS ;
	 U[CAGE].EEoverloadTime = CGE_OVRLD_TIME ;
     U[CAGE].EEKm = CGE_KM;
	 U[CAGE].EEKp = CGE_KP;
	 U[CAGE].EEKi = CGE_KI;

	 U[CYL_FEED].maxSpeedLimit = CYL_FD_MAX_RPM;
	 U[CYL_FEED].minSpeedLimit = CYL_FD_MIN_RPM;
	 U[CYL_FEED].defaultSpeedLimit = CYL_FD_DFLT_RPM;
	 U[CYL_FEED].EEfinalRpm = CYL_FD_RPM ;
	 U[CYL_FEED].EEoverloadCurrent = CYL_FD_OVRLD_AMPS ;
	 U[CYL_FEED].EEoverloadTime = CYL_FD_OVRLD_TIME ;
     U[CYL_FEED].EEKm = CFD_KM;
	 U[CYL_FEED].EEKp = CFD_KP;
	 U[CYL_FEED].EEKi = CFD_KI;

	 U[BTR_FEED].maxSpeedLimit = BTR_FD_MAX_RPM;
	 U[BTR_FEED].minSpeedLimit = BTR_FD_MIN_RPM;
     U[BTR_FEED].defaultSpeedLimit = BTR_FD_DFLT_RPM;
     U[BTR_FEED].EEfinalRpm = BTR_FD_RPM ;
	 U[BTR_FEED].EEoverloadCurrent = BTR_FD_OVRLD_AMPS ;
	 U[BTR_FEED].EEoverloadTime = BTR_FD_OVRLD_TIME ;
	 U[BTR_FEED].EEKm = BFD_KM;
	 U[BTR_FEED].EEKp = BFD_KP;
	 U[BTR_FEED].EEKi = BFD_KI;

	 U[LC_FEED].maxSpeedLimit = LC_FD_MAX_RPM;
	 U[LC_FEED].minSpeedLimit = LC_FD_MIN_RPM;
     U[LC_FEED].defaultSpeedLimit = LC_FD_DFLT_RPM;
     U[LC_FEED].EEfinalRpm = LC_FD_RPM ;
//	 U[LC_FEED].EEoverloadCurrent = LC_FD_OVRLD_AMPS ;
//	 U[LC_FEED].EEoverloadTime = LC_FD_OVRLD_TIME ;
//	 U[LC_FEED].EEKm = LCFD_KM;
//	 U[LC_FEED].EEKp = LCFD_KP;
//	 U[LC_FEED].EEKi = LCFD_KI;

	 U[Convey_Delay].maxSpeedLimit = Convey_Delay_Max;
	 U[Convey_Delay].minSpeedLimit = Convey_Delay_Min;
	 U[Convey_Delay].defaultSpeedLimit = Convey_Delay_DFLT;
	 U[Convey_Delay].EEfinalRpm = CONV_DELAY ;


    }

void InitOptionsStruct(void)
	{O.logRpm = 0;
	 O.logCurrent = 0;
	 O.logPwm =0;
	 O.testFlag	  = FALSE;
	 O.testMotorIndex = -1;	// because -Cylinder is zero
	 O.testMotorRpm = 0;
	 O.allMotorsOn = 0;
	 O.doorsens = 0;
	 O.sliversens = 0;
	}

void InitOverloadStruct(void)
	{ OV.overloadedMotor = -1;	// because Cylinder is zero 
	  OV.overloadFlag = 0;
	  OV.RpmerrorFlag = 0;

	}

void InitMotorHardware(void)
	{/*This function initializes all the motor hardware. Basically the Timers, and  Capture Pins.Call  the 
	function only after running the init struct function */
	char i= 0;
	for (i=0;i<6;i++)
		{M[i].presentRpm= 0; }	//Make current rpm zero for all motors
	
	// Set Initial PWMs for allmotors
	CMPR1 = M[CAGE].pwm;	//Initial Duty for PWM1 and 2
	CMPR2 = M[CYLINDER].pwm; //Initial Duty for PWM3 and 4
	CMPR3 = M[BEATER].pwm;	//Initial Duty for PWM5 and 6
	T1CMPR = M[LC_FEED].pwmPercentage;
	T2CMPR = M[CYL_FEED].pwmPercentage;
	T4CMPR = M[BTR_FEED].pwmPercentage;

	/*** Clear any pending interrupts ***/
	EVAIFRA = 0xFFFF;		// clear all EVA group A interrupts
	EVAIFRB = 0xFFFF;		// clear all EVA group B interrupts
	EVAIFRC = 0xFFFF;		// clear all EVA group C interrupts

	EVBIFRA = 0xFFFF;		// clear all EVB group A interrupts
	EVBIFRB = 0xFFFF;		// clear all EVB group B interrupts
	EVBIFRC = 0xFFFF;		// clear all EVB group C interrupts

	/* TIMER1 - Used to generate T1PWM for LC feed motor*/
	T1CON = 0x104A;		//Enables Timer
	T1CNT = 0x0000;		//clear timer counter
	T1PR  = 4000;

	/* TIMER2 - Used to generate 0.1ms periodic interrupt and T2Pwm for cyl feed motor ***/
	T2CON = 0x104A;			// Continuous UpCount,Prescalar of x/128, Enable timer operation,timer compare,
	T2CNT = 0x0000;			// clear timer counter
	T2PR  = 4000;	// set timer period for 50ms interrupt

	/* TIMER3 - Used as a trigger to check overload*/
	T3CON = 0x104A;			// Continuous UpCount,Prescalar of x/128, Enable timer operation, no timer compare,
	T3CNT = 0x0000;			// clear timer counter
	T3PR  = 20000;			// 1000->25uS , 2000-->500us

	/* TIMER4 - Used to generate T4PWM for beater feed motor*/
	T4CON = 0x104A;	// Continuous Up count mode,Reload immedieately, Enable Timer4 compare, timer operations.Prescalar of 1 , and clock source is internal 
	T4CNT = 0x0000;		// clear timer counter
	T4PR  = 4000;	

	ACTRA = 0x0110;		// Only switch on PWMs3,5 as Active low, pwm3-cylinder & Pwm5-Beater.

	PADATDIR &= 0xfffb;	// Clear SD pin PA2.Set it to Zero
				
	IFR = 0x003F;		//Clear any Global Interrupt Flags that have been set
}	

void InitMotorHardwareTest(char motorIndex)
	{/* This function is used to switch on the correct motor only, by including logic to set ACTRA correctly
	depending on the motorIndex.It switches on Timer2 and allthe capture pins always, but switches on timer4
	only if the motor selected is one of the feed motors. */
	char i= 0;
	for (i=0;i<6;i++)
		{M[i].presentRpm= 0; }	//Make current rpm zero for all motors
	
	// Get initial PWMs from MotorStruct Init.
	CMPR1 = M[CAGE].pwm;	//Initial Duty for PWM1 and 2
	CMPR2 = M[CYLINDER].pwm; //Initial Duty for PWM3 and 4
	CMPR3 = M[BEATER].pwm;	//Initial Duty for PWM5 and 6
	T1CMPR = M[LC_FEED].pwmPercentage;
	T2CMPR = M[CYL_FEED].pwmPercentage;
	T4CMPR = M[BTR_FEED].pwmPercentage;

	/*** Clear any pending interrupts ***/
	EVAIFRA = 0xFFFF;		// clear all EVA group A interrupts
	EVAIFRB = 0xFFFF;		// clear all EVA group B interrupts
	EVAIFRC = 0xFFFF;		// clear all EVA group C interrupts

	EVBIFRA = 0xFFFF;		// clear all EVB group A interrupts
	EVBIFRB = 0xFFFF;		// clear all EVB group B interrupts
	EVBIFRC = 0xFFFF;		// clear all EVB group C interrupts

	/* TIMER1 - Used to generate T1PWM for LC feed motor*/
	T1CON = 0x104A;		//Enables Timer
	T1CNT = 0x0000;		//clear timer counter
	T1PR  = 4000;

	/* TIMER2 - Used to generate 0.1ms periodic interrupt and T2Pwm for cyl feed motor ***/
	T2CON = 0x104A;			// Continuous UpCount,Prescalar of x/128, Enable timer operation,timer compare,
	T2CNT = 0x0000;			// clear timer counter
	T2PR  = 4000;	// set timer period for 50ms interrupt

	/* TIMER3 - Used as a trigger to check overload*/
	T3CON = 0x104A;			// Continuous UpCount,Prescalar of x/128, Enable timer operation, no timer compare,
	T3CNT = 0x0000;			// clear timer counter
	T3PR  = 20000;			// 1000->25uS , 2000-->500us

	/* TIMER4 - Used to generate T4PWM for beater feed motor*/
	T4CON = 0x104A;	// Continuous Up count mode,Reload immedieately, Enable Timer4 compare, timer operations.Prescalar of 1 , and clock source is internal 
	T4CNT = 0x0000;		// clear timer counter
	T4PR  = 4000;	
	
	PADATDIR &= 0xfffb;				// Clear SD pin PA2.Set it to Zero
				
	IFR = 0x003F;					//Clear any Global Interrupt Flags that have been set

	/* Additional Logic for Test Function */
	/* Switch on only one motor pwm pin and disable others */ 
    if (motorIndex==CYLINDER) 
	{GPTCONA = 0x0040;
	 GPTCONB = 0x0040;
	 ACTRA   = 0x0010;}
    
    if (motorIndex==BEATER)
	{GPTCONA = 0x0040;
	 GPTCONB = 0x0040;
	 ACTRA   = 0x0100;}
    
    if (motorIndex==CAGE)
	{GPTCONA = 0x0040;
	 GPTCONB = 0x0040;
	 ACTRA   = 0x0001;}

    if (motorIndex==CYL_FEED)		// we want only one of the feed motors to switch on, so we make the
	{ACTRA   = 0x0000;
	 GPTCONB = 0x0040;				// other feed motors pwmpercentage field is so low that it is practically zero.
     GPTCONA = 0x0044;}

    if (motorIndex==BTR_FEED)		// below
	{ACTRA   = 0x0000;
	 GPTCONA = 0x0040;
	 GPTCONB = 0x0044;}

	if (motorIndex == LC_FEED)
	{ACTRA   = 0x0000;
	 GPTCONB = 0x0040;
	 GPTCONA = 0x0041;}
}

void InitMotorPID(void)
	{char i=0;
	 float pidValue1= 0;
	 float pidValue2= 0;
	 float pidValue3= 0;

	 for (i=0;i<5;i++)
		{M[i].integralError = 0;
	 	M[i].intTarget = 0;
	 	M[i].error = 0;
	
		pidValue1 = EepromRead(U[i].EEKm);
		M[i].Km = (float)pidValue1/100;

		pidValue2 = EepromRead(U[i].EEKp);
		M[i].Kp = (float)pidValue2/100;

		pidValue3 = EepromRead(U[i].EEKi);
		M[i].Ki = (float)pidValue3/100;

	 	}
	}
