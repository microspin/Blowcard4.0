#ifndef MOTORSTRUCT_H_
#define MOTORSTRUCT_H_

/* Struct Declaration*/

/* the total no of variables within the struct must be less than 12. This is because
the bss section of the DSP, where all the global variables are stored, is only 256 bytes
So for 5m motors, each motor requires 256/5 = ~51 bytes.Each variable takes 4 bytes.
So max no of variables is 12.The size of the bss can be changed, but requires us to 
modify the setting files, which presently we dont not know how to do.*/
struct Motor {	
	unsigned int finalRpm;	
	unsigned int presentRpm;
	unsigned int presentCurrentAdc;
	unsigned int overloadCurrentAdc;
	unsigned int overloadTimeInt;
	unsigned int historySaveFreq;
	unsigned int deltaRampPwm;
	unsigned int menuDeltaRpm;
	signed int intTarget;
	signed int error;
	signed int integralError;
	unsigned int pwm;
	unsigned int pwmPercentage;	
	float Kp;
	float Ki;
	float Km;
    unsigned int CylenderCurrentADC;
	};

struct Menu{
	unsigned int maxSpeedLimit;
	unsigned int minSpeedLimit;
	unsigned int defaultSpeedLimit;
	unsigned int EEoverloadCurrent;
	unsigned int EEoverloadTime;
	unsigned int EEfinalRpm;
	unsigned int EEKm;
	unsigned int EEKp;
	unsigned int EEKi;
	};

struct Options{
	unsigned int logRpm;
	unsigned int logCurrent;
	unsigned int logPwm;
	unsigned int testFlag;
	unsigned int testMotorIndex;
	unsigned int testMotorRpm;
	unsigned int allMotorsOn;
	unsigned int doorsens;
	unsigned int sliversens;

	};

struct Overload{
	unsigned int overloadedMotor;
	unsigned int overloadFlag;
	unsigned int RpmerrorFlag;
	unsigned int Rpmerrormotor;

		};

/*declares an array of 5 structs of type motor and overload that is available for all other files
 without allocating memory to it.It needs to be defined once only, in some file.We
 are doing it in main.For more details see 
 http://www.geeksforgeeks.org/understanding-extern-keyword-in-c/
http://cboard.cprogramming.com/c-programming/29913-extern-structs.html and
http://cboard.cprogramming.com/c-programming/139119-how-do-i-declare-array-structures-2.html*/
extern struct Motor M[6];
extern struct Menu U[6];	//U as in User Interface
extern struct Options O;	//only 1 array for this struct
extern struct Overload OV;
#endif