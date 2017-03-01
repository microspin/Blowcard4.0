#ifndef ALLLOGICDEFINES_H_
#define ALLLOGICDEFINES_H_
/* Machine Defines */

/*BOOLEAN LOGIC*/
#define TRUE 1
#define FALSE 0

/*Menu Defines */
#define BACK -1
#define MAINMENU -2
#define RESETALL -3

/* SetSpeed Function Defines*/
//used to select between options in the set speed function
#define TOOLS 1
#define PARAMS 2
#define RUNLOOP 3

/*Timer Period Defines */
//if timer has prescalar of 1
#define TENKHZFREQ 4000		// 100uS period
#define FORTYKHZFREQ 1000	//25uS	period

//if timer has prescalar of 128

#define TWENTYHZFREQ	15625	//50ms period
//#define TWENTYHZFREQ	12500	//40ms period  25hz
//#define TWENTYHZFREQ	9384	//30ms period  33hz
//#define TWENTYHZFREQ	7812	//25ms period  40hz


//Motor Defines
#define CYLINDER 0
#define BEATER 1
#define CAGE 2
#define CYL_FEED 3
#define BTR_FEED 4
#define LC_FEED 5
#define Convey_Delay 7

/*RPM CONSTANTS */
/* 125 slots,therefore 250 edges per rotation. 
RPM = (no of edges in 50ms*20(no of 50ms /sec)*60(no of seconds) )/250(no of counts per rotation) */
/* that is, no of edges in 50ms* 24/5 = no of edges in 50ms * 4.8 */
//#define CNT_TO_RPM_50MS 4.8	// if you change the interrupt interval you have to change this.
#define CNT_TO_RPM_50MS 4.7244  //no. encoder teeths 127

/*Gear Ratios*/
#define CYLINDER_GEAR_RATIO 1.3333
#define BEATER_GEAR_RATIO 1.3333 //pil 56/40 0.71428
#define CAGE_METERS_MIN_CONV 0.039821 //changing value 36.56
#define FEED_MOTORS_INTERNAL_GEAR_RATIO 48
#define BTR_FEED_GEAR_RATIO 5		// to be used
#define CLR_METERS_MIN_CONV 0.033339 //changing value 36.56






/* RAMP UP/DOWN DEFINES */
/*these are the delta values added to the motors PWM when the speed is not yet the desired speed */
#define CYL_RAMP_PWM	1
#define BTR_RAMP_PWM	1
#define	CGE_RAMP_PWM 	6
#define CYL_FD_RAMP_PWM_PERCENTAGE 40
#define BTR_FD_RAMP_PWM_PERCENTAGE 40
#define LC_FD_RAMP_PWM_PERCENTAGE 10

/*INITIAL PWM's */
#define CYL_INIT_PWM 10
#define BTR_INIT_PWM 10
#define CGE_INIT_PWM 1
#define CYL_FD_INIT_PWM_PERCENTAGE  5	//Both the feed motors have a software pwm
#define BTR_FD_INIT_PWM_PERCENTAGE  5
#define LC_FD_INIT_PWM_PERCENTAGE 1

/*PWM LIMITS ...*/
/* The limits of the speed of some motors is set by setting limits to the PWM.The 
PWM compare period cant go more than these values.Used in Update Motor Function */

#define MAX_PWM_HARDWARE 4000	//max cmpr value possible.

#define MAX_PWM 	3600		// 75% 
#define MIN_PWM		10			// .25%
#define DEFAULT_PWM 1200	// Not used since we made the tools function RPM instead of PWM

#define MAX_PWM_PERCENTAGE 	90
#define MIN_PWM_PERCENTAGE	01
#define DEFAULT_PWM_PERCENTAGE 15
#define DELTA_PWM_PERCENTAGE 1

/* RPM limits */
#define CYL_MAX_RPM 	1800
#define CYL_MIN_RPM		1000
#define CYL_DFLT_RPM	1200
#define CYL_DELTA_RPM	50

#define BTR_MAX_RPM 	1800
#define BTR_MIN_RPM		300
#define BTR_DFLT_RPM	500
#define BTR_DELTA_RPM	10

//Change according to whether your using UpdateMotor Pwm or updateMotorRpm in the Interrupt
							// UpdateMotorPwm	UpdateMotorRpm
#define CGE_MAX_RPM 	20		//100				250
#define CGE_MIN_RPM		01		//3					10
#define CGE_DFLT_RPM	03	//15				100
#define CGE_DELTA_RPM	01		//1					10

#define CYL_FD_MAX_RPM	75		//100				30
#define CYL_FD_MIN_RPM	03		//3					01
#define CYL_FD_DFLT_RPM 15		//15				10
#define CYL_FD_DELTA_RPM 01		//1					01

#define BTR_FD_MAX_RPM 	90		//100				30
#define BTR_FD_MIN_RPM	03		//3					01
#define BTR_FD_DFLT_RPM	15		//15				10
#define BTR_FD_DELTA_RPM 01		//1					01

#define LC_FD_MAX_RPM 	41		//100				30
#define LC_FD_MIN_RPM	05		//3					01
#define LC_FD_DFLT_RPM	20	//15				10
#define LC_FD_DELTA_RPM 01		//1					01

#define Convey_Delay_Max 	300
#define Convey_Delay_Min	01
#define Convey_Delay_DFLT	04
#define Convey_Delay_Delta	01



//OUTPUTMTRS
#define MAX_OUTPUT_MTRS 99
#define MIN_OUTPUT_MTRS 1
#define DEFAULT_OUTPUT_MTRS 25

//Pwm Percentage to Actual pwm Constant
#define PWM_CONSTANT 40

//Test Delta PWM  ( For all the Motors )
# define TEST_DELTA_PWM 1

//FILTER PARAMETERS FOR ADC and RPM
#define WEIGHT_PREVIOUS_SAMPLE_ADC 0.95		//past + present weight has to be 1
#define WEIGHT_PRESENT_SAMPLE_ADC 0.05

#define WEIGHT_PREVIOUS_SAMPLE_RPM 0.70
#define WEIGHT_PRESENT_SAMPLE_RPM 0.30

//WEIGHT PARAMETERS for PID Integral Term
#define WEIGHT_PREVIOUS_SAMPLE_ERROR 0.80
#define WEIGHT_PRESENT_SAMPLE_ERROR 0.20		//past + present should be 1


/* ADC Defines */
/* LEM Sensor in 5A setting. Sensor Outputs 2.5V at 0A and 1.875V at 5A. At zero amp,
therefore, the adc reading is (2.5/3.3)*1023 = 775 steps.
So 1A produces a change of 0.625/5 = 0.125 V ~ 125mV. 
Also, 3.3V = 1023 steps. Hence, 1 adc step = 3.3/1023 = .003 V, or 3mV.
Hence 125 mV = 1A = 41 Adc Steps.And each Adc Step = 1/41 = .024 A or 24mA . 

1A = 125mv = 41 Adc Step, each adcStep = 24mA = 3mV */ 

#define ADC_TO_MILLIAMP 24
#define ADC_AT_ZERO_AMPS 775
#define AMPS_TO_ADC 41	// actual value  is 41.
#define CONVERT_TO_AMPS 10	//data is stored as amps*10 to avoid floats

////OVERLOAD AMPS
#define MAX_OVRLD_CURRENT_ADC  529   	// denotes 6 Amps
#define MIN_OVRLD_CURRENT_ADC  770		//denotes 1 Amp
#define DFLT_OVRLD_CURRENT_ADC 673		//2.5 Amps



#define MAX_OVRLD_CURRENT_DISPLAY  60	// denotes 6 Amps
#define MIN_OVRLD_CURRENT_DISPLAY  03	//denotes 1 Amp  denotes 04 for 0.4Amps min

#define CYL_LIMIT_CURRENT 542    // 6 Amps
#define BTR_LIMIT_CURRENT 542    // 6 Amps 
#define CGE_LIMIT_CURRENT 639    // 3.5 Amps 
#define CFD_LIMIT_CURRENT 639    // 3.5 Amps	
#define BFD_LIMIT_CURRENT 620    // 4 Amps
#define LFD_LIMIT_CURRENT 639    // 3.5 Amps

//OVERLOAD TIME
#define MAX_OVRLD_TIME_INT  20		// denotes 1000ms
#define MIN_OVRLD_TIME_INT  0		//50ms
#define DFLT_OVRLD_TIME_INT 8		  //400ms
#define OVRLD_DELTA_TIME 50		//Because we check once every 50 ms,in the trigger loop

#define MAX_OVRLD_TIME_DISPLAY  1000		// denotes 1000ms
#define MIN_OVRLD_TIME_DISPLAY  0

//Main Motor Loop DisplayOptions

#define FRONT	0
#define CHNGRPM 1
#define PAUSED 2

/*intermediete Target delta rpm value for PID loop */
#define PID_DELTA_TARGET_RPM 2	// for RAMP UP SPEED

//PID Menu CONSTS
#define DFLT_PID_VALUE 100	// become 1.00 inside
#define DELTA_PID_VALUE	01	// value by which pid changes in the menu
#define MAX_PID_VALUE  500  //	means 5.00
#define MIN_PID_VALUE	00	//0.01

//EEPROM OFFSETS FOR HISTORY
#define OVERLOAD_TIME_OFFSET	0
#define OVERLOAD_ADC_OFFSET		1
#define MOTOR_INDEX_OFFSET		2
#define ADC_OFFSET				3

//parameter usedto denote no good data in history function
#define NODATA					-1

//ANTI WINDUP RPMVALUE FOR INTEGRAL ERROR TERM
#define ANTI_WINDUP_DELTA_RPM 500		// start calculating integral term only when present rpm is 50 rpm less than set speed

#define ON 1

#define OFF 0
#endif