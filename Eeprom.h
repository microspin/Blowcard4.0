#ifndef EEPROM_H_
#define EEPROM_H_

/*EEPROM.H*/

//FinalRpm
#define CYL_RPM 0x0000
#define BTR_RPM 0x0002
#define CGE_RPM 0x0004
#define CYL_FD_RPM 0x0006
#define BTR_FD_RPM 0x0008
#define LC_FD_RPM 0x00AE

//Overload Time
#define CYL_OVRLD_TIME 0x000A
#define BTR_OVRLD_TIME 0x000C
#define CGE_OVRLD_TIME 0x000E
#define CYL_FD_OVRLD_TIME 0x0010
#define BTR_FD_OVRLD_TIME 0x0012

//Overload Amps
#define CYL_OVRLD_AMPS 0x0014
#define BTR_OVRLD_AMPS 0x0016
#define CGE_OVRLD_AMPS 0x0018
#define CYL_FD_OVRLD_AMPS 0x001A
#define BTR_FD_OVRLD_AMPS 0x001C

//OutputMtrs
#define CYL_OUTPT_MTS 0x001E
#define BTR_OUTPT_MTS 0x0020
#define CGE_OUTPUT_MTS 0x0022
#define CYL_FD_OUTPUT_MTS 0x0024
#define BTR_FD_OUTPUT_MTS 0x0026

//Energy Options
#define ENERGY_FLAG 0x0028		//either 1 or 0
//#define ENERGY_VALUE 0x002A		//KW Value

//Output Mtrs Options
#define OUTPUTMTRS_FLAG 0x002C		//either 1 or 0
#define OUTPUTMTRS_VALUE 0x002E		//OutputMtrs Value

//Datalogging Options
#define DATALOGGING_FLAG_RPM 0x0030		//each is either 1 or 0
#define DATALOGGING_FLAG_CURRENT 0x0032	
#define DATALOGGING_FLAG_PWM	0x0034


/*Datasets are in the format, 
OverloadTimeInt		0x0040
OverloadAdcInt 		0x0042
Overloaded Motor	0x0044
ADCvalue most recent0x0046
AdcValue 2			0x0048
AdcValue 3			0x004A	
AdcValue 4			0x004C
Adcvalue 5			0x004E
Theirs another address, called Datasets no, which keeps track of the no of datasets that have been generated upto 
a maximum of 5.When reset, this no is made zero, and all the address have 999 written into them. When the data is read
by the code, into the UI, it check for this no, and only if the value read is not 999, is the data 
*/
#define DATASETS_NUMBER		0x0036
#define DATASETS_TOTALWRITES	0x0038
/* Addresses 3A - 3F are empty*/ 
#define DATASET1_ADDRESS	0x0040
#define DATASET2_ADDRESS	0x0050
#define DATASET3_ADDRESS	0x0060
#define DATASET4_ADDRESS	0x0070
#define DATASET5_ADDRESS	0x0080	//up till 8E is taken


/* PID CONSTANT ADDRESSES*/
#define CYL_KM	0x0090
#define CYL_KP	0x0092
#define CYL_KI	0x0094

#define BTR_KM	0x0096
#define BTR_KP	0x0098
#define BTR_KI	0x009A
	
#define CGE_KM	0x009C
#define CGE_KP	0x009E
#define CGE_KI	0x00A0

#define CFD_KM	0x00A2
#define CFD_KP	0x00A4
#define CFD_KI	0x00A6

#define BFD_KM	0x00A8
#define BFD_KP	0x00AA
#define BFD_KI	0x00AC

#define CONV_DELAY	0x00B8
#define SLIVER_SENS  0x00B2

#define mtrscnt 0x00cc
#endif