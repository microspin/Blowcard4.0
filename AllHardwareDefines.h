#ifndef ALLHARDWAREDEFINES_H_
#define ALLHARDWAREDEFINES_H_
/*Interrupt Defines */
/* Taken from Page 209 of the Pdf "TMS320 DSP Controllers Reference Guide " */
/* these are the values that will be loaded into the PIVR register when an edge is seen on the Capture Pins*/
#define CAPTUREPIN1 0x33
#define CAPTUREPIN2 0x34 
#define CAPTUREPIN3 0x35 
#define CAPTUREPIN4 0x36 
#define CAPTUREPIN5 0x37 
#define CAPTUREPIN6 0x38
#define TIMER4INTERRUPT 0x39
#define TIMER2INTERRUPT 0x2b
#define TIMER3INTERRUPT 0x2f

/* Timer Defines*/
/* this is the value that sets the PWM frequency for the feed motors.
The timer 4 period is 2.5ms.Presently the pwm percentage is set at 400Hz, for which the
timer 4 needs to be reset every 100 counts. ie: 2.5ms*100 = 25ms. Therefore per second, no of
time  periods will be 1/(2.5*10^-3)= 400  which is the PWM frequency for the Feed motors.*/
#define FEED_MTR_PERIOD 100

//Keys Define
#define	UP				01
#define	DOWN			02
#define	YES 			03
#define	NO				04 
#define PUSHBUTTON		05
#define OK              06

//Delay Defines
#define MS 1
#define US 0

//PIN DEFINES

#define BTR_FEED_PIN 	3
#define CYL_FEED_PIN 	4
#define LAT_FEED_PIN    5

/* Macros used for bit toggling .See http://www.catonmat.net/blog/low-level-bit-hacks-you-absolutely-must-know
for full explanation. n can be between 0 and 7.
*/
/* test if n-th bit in x is set.Return 1 or 0 */
#define B_IS_SET(x, n)   (((x) & (1<<(n)))?1:0)

/* set n-th bit in x .xis port name,usually PXDATADIR Make bit 1*/
#define B_SET(x, n)      ((x) |= (1<<(n)))

/* unset n-th bit in x .Make bit 0*/
#define B_UNSET(x, n)    ((x) &= ~(1<<(n)))

/* toggle n-th bit in x */
#define B_TOGGLE(x, n)   ((x) ^= (1<<(n)))

/*
//STACK MONITOR DEFINES
#define STACK_END_ADDRESS 2048
#define STACK_TOP_ADDRESS 4096
#define STACK_SIZE		2048
#define STACK_MONITOR_MARGIN 100	//what should the margin be??
*/


#endif

