#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/*Overload History*/
/*******************************************************************
 *
 *    DESCRIPTION: Module meant keep a running array of the last 5 adc current values. so that
 when overload happens you can write that array into the eeprom
 *
 *    AUTHOR: Harsha
 *
 *    HISTORY: 27/4/2013 - reformatted,ran splint. need to check if there are any errors 
 *
 *******************************************************************/

//array to keep storing values to dump into eeprom when overloaded
//no need for beaterfeed cos it doesnt have a current sensor.zero current is 775 in adc reading
static unsigned int adcHistory[4][5]	={(775,775,775,775,775),(775,775,775,775,775),(775,775,775,775,775),(775,775,775,775,775)};	
//array to keep track of which position in adchistory needs to next be written
static unsigned int historyCounter[4] = {0,0,0,0};


void UpdateHistoryArray(int counter)
{/*
 *  FUNCTION: UpdateHistoryarray
 *
 *  PARAMETERS: a counter value that indicates how many times this function has run. 
 *
 *  DESCRIPTION:For each motor update its history array with the its most recent current adc values,and
   update the counter keeping trackof the next empty position in the array.Do this for all 4 motors 
   which have a current sensor.The frequency at which the array is updated is taken from the 
   M[x].histfreq field and an update happens when counter modulus histfreq is zero.
 *
 *  RETURNS: Nothing 
 *
 */

unsigned int readingNo =0;
unsigned int i =0; 

for (i=0;i<4;i++)	//no btr feed 
	{// compare counter to freq history value in motor struct
	 if ((counter % M[i].historySaveFreq)==0)
		{			
		readingNo = historyCounter[i];// history counter[motorIndex] gives the array no for that motor that needs tobe updated
		adcHistory[i][readingNo] = M[i].presentCurrentAdc; //put the curretn adc value into the array which holds the history data

		if (historyCounter[i]<5)		//history counter can only have values 0 -4.
			{historyCounter[i] = historyCounter[i]+1;}//as long as its less than 4,let it increase
		if (historyCounter[i]==5)
			{historyCounter[i] = 0;}		
		}
	}
}

unsigned int SaveHistoryArray(unsigned int motorIndex)
{ /*
 *  FUNCTION: SaveHistoryArray
 *
 *  PARAMETERS:the Overloaded motor for whom you want to save the data
 *
 *  DESCRIPTION: The array values which have been continuously stored are dumped into the eeprom for
 later viewing. Totally 5 sets of data can be stored at a time and a sixth will overwrite the first.
 The dataset no is first read the eeprom, and then the overloadTime, current overload value,
 the motor that was overloaded, and the last 5data pointsare written into the eeprom at that datasets
 location.Then the dataset no isincremented, and so is the totalno of writes, and
 both are then again put into the eeprom.
 *
 *  RETURNS: The dataset no into which data was written
 *
 */


  /* save in order from most recent too last .So take the position of the historycounter, and start saving from there */
  /* returns the dataset value in which data was stored */
  unsigned int datasetNo = 0;
  unsigned int nextDatasetNo = 0;
  unsigned int totalWrites =0; //eeprom read has to be an int
  int adcAddress=0;	//eeprom write has to be an Int
  int latestValue =0; // need to check lower end rollover.
  unsigned int i =0;

  
  datasetNo = EepromRead(DATASETS_NUMBER); //get the dtaset nointo which we need to write data
  if (datasetNo>4)	// check if within limits, else rewrite to zero into eeprom
		{datasetNo = 0;
 		}

//most recentvalue is the value in the array that corresponds to the value of the historycounter
	latestValue = (int) historyCounter[motorIndex];

//starting from the first address write into everyone
	EepromWrite(M[motorIndex].overloadTimeInt, (dataSetEeAddress[datasetNo]+(2 * OVERLOAD_TIME_OFFSET)));//write overload time
	EepromWrite(M[motorIndex].overloadCurrentAdc,(dataSetEeAddress[datasetNo] + (2 * OVERLOAD_ADC_OFFSET))  );//write overload Adc
	EepromWrite(motorIndex,(dataSetEeAddress[datasetNo] + (2 * MOTOR_INDEX_OFFSET)) );//write motorIndex
	for (i=0;i<5;i++)	//make sure we get 5 readings
		{adcAddress = dataSetEeAddress[datasetNo] + (2 * (ADC_OFFSET + i) );  
		EepromWrite(adcHistory[motorIndex][latestValue],adcAddress ) ;
		//increment the counter so that you cycle through all readings in the adcHistory Array
		latestValue = latestValue - 1;
		if (latestValue < 0)	
				{latestValue=4;}
		}
  	
  	//increment the datasetNo and put it in the eeprom
	nextDatasetNo = datasetNo +1;
	EepromWrite(nextDatasetNo,DATASETS_NUMBER);

		//increment total writes no and put it in the eeprom too
	totalWrites = EepromRead(DATASETS_TOTALWRITES);
	totalWrites = totalWrites+1;
	EepromWrite(totalWrites,DATASETS_TOTALWRITES);
		
	return (datasetNo); //return datasets no to display it
  		
  }		

void ResetHistoryArrays(void)
{ /*
 *  FUNCTION: ResetHistoryArrays
 *
 *  PARAMETERS:none
 *
 *  DESCRIPTION: Resets the two arrays associated with the OverloadHistory Module
 *  The twoarrays are historyCounter and adcHistory
 * 
 * RETURNS: Nothing 
 *
 */
 unsigned int i =0;
 unsigned int j =0; 

//make historyCounter = 0;
	for (i= 0;i<5;i++)
	{historyCounter[i]=0;}
//make adcHistory = 0;
	for (i =0;i<5;i++)
		{ for (j=0;j<6;j++)
			{adcHistory[i][j] = 0;
			}
		}
}




void DataLogHistory(unsigned int i)
	{
	/*
 *  FUNCTION: DataLogHistory
 *
 *  PARAMETERS: the motorIndex of the motor which you want to see history data off.Meant for debugging
 this module
 *
 *  DESCRIPTION: Prints out - freq@which data is stored,the current value of the array position,
 datapoint 1, datapoint 2, datapoint3,datapoint 4, datapoint 5
 *
 *  RETURNS: Nothing
 *
 */

	SerialWriteNo(M[i].historySaveFreq);
	SerialWriteComma();
	SerialWriteNo(historyCounter[i]);
	SerialWriteComma();
	SerialWriteNo(adcHistory[i][0]);
	SerialWriteComma();
	SerialWriteNo(adcHistory[i][1]);
	SerialWriteComma();
	SerialWriteNo(adcHistory[i][2]);
	SerialWriteComma();
	SerialWriteNo(adcHistory[i][3]);
	SerialWriteComma();
	SerialWriteNo(adcHistory[i][4]);
	SerialWriteComma();
	SerialWriteNewLine();
			
	}
