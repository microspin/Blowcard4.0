#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/* OVERLOAD HISTORY MENU .c*/

char HistoryMenu(void)
	{	char dataset[] = "DataSet" ;
		char resetAll[] ="ResetAll";
		char totalWrites[] = "TotalWrites";
		char resetted[]	= "Resetted!";
	  	char ms[] = "mS";
	  	char noData[] ="No Data!";
	  
	  	char datasetNo = 0; // in-function variable that keeps track of which variable you want to look at
	  	char motorIndex = 0;//variable to show the name of the correct motor that overloaded
		char totalWritesInt= 0;//variable toshow the total no of writes
		char overloadTime = 0;	//actual overload timevalue
		char overloadTimeInt = 0; //
	 	char noDataIndicator = 0;	

	  	char key =0;
	  	char selected =0;
		
		DispClear();
		DispText(dataset,0x10);
		DispNo(datasetNo,0x19,0x22);

		/*update the motor and overloadlimit nos from the eeprom*/
		motorIndex = EepromRead(dataSetEeAddress[datasetNo] + ( 2 * MOTOR_INDEX_OFFSET )) ;
		overloadTimeInt = EepromRead(dataSetEeAddress[datasetNo]+(2 * OVERLOAD_TIME_OFFSET));
		overloadTime = ConvertIntToDisplayTime(overloadTimeInt);
				
		while(selected!= 1)
			{	if (datasetNo<5)
					{	if ((motorIndex>4) || (motorIndex<0))	// Check for Nodata by looking at motorIndex and seeing values beyondlimits.
							{DispText(dataset,0x10);
							 DispNo(datasetNo,0x19,0x22);
							 DispText(noData,0x20);
							 noDataIndicator = 1;	 			// Keep track that theres no data
							 }
				
						if ((motorIndex<=4 )&&(motorIndex>=0))
							{DispText(dataset,0x10);
							DispNo(datasetNo,0x19,0x22);
							DispText(motorNames[motorIndex],0x20);
					  		DispNo(overloadTime,0x25,0x40);
					  		DispText(ms,0x29);
							noDataIndicator = 0;				// keep track that there is data
							}						
					}

				 if (datasetNo == 5)
					{	DispText(totalWrites,0x10);
					 	totalWritesInt = EepromRead(DATASETS_TOTALWRITES);
						DispNo(totalWritesInt,0x1C,0x20);
					}
				  if (datasetNo == 6)
					{	DispText(resetAll,0x10);
					}

				key = KeyScan();
			 	if (key == UP)
					{	if (datasetNo == 6) 
							{datasetNo = 0;
							delay(250,MS);
							DispClear();
							}
						else
				    		{datasetNo++;
					 		delay(250,MS);
					 		DispClear();
							}

						if (datasetNo<5)
							{motorIndex = EepromRead(dataSetEeAddress[datasetNo] + ( 2 * MOTOR_INDEX_OFFSET )) ;
							overloadTimeInt = EepromRead(dataSetEeAddress[datasetNo]+(2 * OVERLOAD_TIME_OFFSET));
							overloadTime = ConvertIntToDisplayTime(overloadTimeInt);
							}
					}

			 	if (key == DOWN)
					{	if (datasetNo == 0) 
							{datasetNo = 6;
							delay(250,MS);
							DispClear();
							}
					
						else
				   	 		{datasetNo--;
					 		delay(250,MS);
					 		DispClear();
							}

						if (datasetNo<5)
							{motorIndex = EepromRead(dataSetEeAddress[datasetNo] + ( 2 * MOTOR_INDEX_OFFSET )) ;
							overloadTimeInt = EepromRead(dataSetEeAddress[datasetNo]+(2 * OVERLOAD_TIME_OFFSET));
							overloadTime = ConvertIntToDisplayTime(overloadTimeInt);
							}
					}

				if (key == YES)
					{	/* if theres no Data dont allowanything to happen if you press yes */
					if (datasetNo<5)
						{if (noDataIndicator==1)
							{selected =0; 
							}
						 if (noDataIndicator == 0)
							{selected = 1;}
						}
					/* nothing happens if you press yes in datasetNo ==5,total writes */

					/* if in resetAll, reset from inside and show a reset Done message*/
					if (datasetNo== 6)
						{ResetDataSets();
						 DispText(resetted,0x20);
						 delay(200,1);
						 DispClear();
						 selected = 0 ;
						}
					
					}
			
				if (key == NO)
					{datasetNo = BACK;		//Back
				 	selected = 1 ;
					}

			}	//closes while				

	return datasetNo;
	}


void CycleAdcReadings(char dataset) 
	{char star[]= "*";
	 char lmt[] = "Lmt";
	char readingNo = 0;
	char adcReading = 0;
	char key = 0;
	char selected = 0;
	
	int adcOVLevel = 0; //adc overload level	
	/* get initial adc reading from eeprom for readingNo = 0; */
	/*Calculate the time at which reading was taken, given the overload limit and reading no */

	adcReading = EepromRead(dataSetEeAddress[dataset] + (2 * (ADC_OFFSET + readingNo)));//read Adc from the eeprom
	adcOVLevel = EepromRead(dataSetEeAddress[dataset] + ( 2 * OVERLOAD_ADC_OFFSET));	//read overload adc level from eeprom
	DispClear();
		
	while (selected!= 1)
	{	DispText(star,0x10);
		DispNo(dataset,0x11,0x22);
		DispText(star,0x12);

		DispNo(readingNo,0x14,0x22);
    	DispNo(adcReading,0x20,0x40);
	
		DispText(lmt,0x18);		//display lmt
		DispNo(adcOVLevel,0x1C,0x40);
		
		key = KeyScan();

		if (key == UP)
			{	if (readingNo == 4) 
					{readingNo = 0;
					delay(250,MS);
					DispClear();
					}
			  	else
			    	{readingNo++;
				 	delay(250,MS);
				 	DispClear();
				 	}
			/*update the adc and overload time nos from the eeprom*/
			adcReading = EepromRead(dataSetEeAddress[dataset] + (2 * (ADC_OFFSET + readingNo)));//read Adc from the eeprom
		
			}
		 if (key == DOWN)														  
		 { if (readingNo == 0) 
				{readingNo = 4;
				delay(250,MS);
				DispClear();
				}
			  else
			     {readingNo--;
				 delay(250,MS);
				 DispClear();
				 }
			/*update the adc and overload time nos from the eeprom*/
			adcReading = EepromRead(dataSetEeAddress[dataset] + (2 * (ADC_OFFSET + readingNo)));//read Adc
	
			}

		if (key == NO)
			{
			 selected = 1 ;
			 delay(250,MS);
			
			}	

		}	// closes while loop

	}
 


static void ResetDataSets(void)
	{char i=0;
	for (i=0;i<5;i++)
		{EepromWrite(NODATA,(dataSetEeAddress[i]+(2 * MOTOR_INDEX_OFFSET ))) ;
		EepromWrite(NODATA,(dataSetEeAddress[i]+(2 * OVERLOAD_TIME_OFFSET)));
		}
	EepromWrite(0,DATASETS_TOTALWRITES);
	EepromWrite(0,DATASETS_NUMBER);	// this is the number read by theoverload logic to see where to write the next set of data can bemaximum of 4
	}