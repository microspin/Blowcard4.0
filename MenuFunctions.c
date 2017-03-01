#include "regs240x.h"
#include "AllHardwareFunctions.h"
#include "AllHardwareDefines.h"
#include "AllLogicFunctions.h"
#include "AllLogicDefines.h"
#include "MotorStruct.h"
#include "MenuFunctions.h"
#include "Eeprom.h"

/* Menu operations */


char TopLevelMenu(void)
	{static char displayArray[3][10] = {"StartM/C","Settings","Tools"};
/* the display array has to be static or the memory allocation for the array 
causes garbage to be displayed.Why - I dont know!. Also, use a 2d array rather 
than a pointer array */	 
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option
	
	 DispClear();
	 
	 while (selected==0)
		{
		 DispText(displayArray[index],0x10); 
		 key = KeyScan();
		 if (key == UP)     //Stratup menu option changing from 1--3
			{ if (index == 4)  //Selection index, we have 3 option in startup menu
				{index = 0;
				delay(250,MS);
				DispClear();}
			  else
			     {index++;
				 delay(250,MS);
				 DispClear();}
			}
		 if (key == DOWN)   //Stratup menu option changing from 3--1
			{ if (index == 0) 
				{index = 4;
				delay(250,MS);
				DispClear();}
			  else
			     {index--;
				 delay(250,MS);
				 DispClear();}
			}
		if ((key == YES)||(key == PUSHBUTTON))
			{selected = 1 ;} //If  selected = 1 while loop will break, and selected index no will be returned	

		}// closes while loop
			
	return index;
	}


char MachineParametersMenu(void)
	{static char displayArray[4][9] = {"MotorRpm","OvrldAmp","OvrldmS","PIDCnst"};
	 char set[] = "Set";
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option
	
	 delay(250,MS);
	 DispClear();

	 while (selected==0)
		{
		 DispText(set,0x10);		//Show 'Set'

		 DispText(displayArray[index],0x20);
		 key = KeyScan();
		 if (key == UP)
			{ if (index == 3) 
				{index = 0;
				delay(250,MS);
				 DispClear();}
			  else
			     {index++;
				 delay(250,MS);
				 DispClear();
				 }
			}
		 if (key == DOWN)
			{ if (index == 0) 
				{index = 3;
				delay(250,MS);
				DispClear();}
			  else
			     {index--;
				 delay(250,MS);
				 DispClear();
				 }
			}
		if (key == NO)
			{index = 4;		// Go back to main menu
			 selected = 1 ;
			}

		if (key == YES)
			{selected = 1 ;
			}	
		}	// closes while loop
	return index;
	}

char MotorSelectMenu(void)
	{
	 static char displayArray[8][11] = {"Cylinder","Beater","Tension DF","CylFeed","BtrFeed","Clr Mt/min","ResetAll","Delay"};
	 char set[] = "Select Motor";	 
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option

	 delay(250,MS);			// To slow down the Yes Keypress from the above menu	 
	 DispClear();

	 while (selected==0)
		{		
		if ((index!=7 ))
			{DispText(set,0x10);}		//Show Change

		 DispText(displayArray[index],0x20);
		 key = KeyScan();
		 if (key == UP)
			{ if (index == 7) 
				{index = 0;
				 delay(250,MS);
				 DispClear();}
			  else
			     {index++;
				 delay(250,MS);
				 DispClear();
				 }
			}
		 if (key == DOWN)
			{ if (index == 0) 
				{index = 7;
				delay(250,MS);
				DispClear();}
			  else
			     {index--;
				 delay(250,MS);
				 DispClear();
				 }
			}
		if (key == NO)
			{index = -1;		//Back
			 selected = 1 ;
			}	
		if (key == YES)
			{selected = 1 ;
			 if (index == 6)
				{index = RESETALL;}
			}	
		}	// closes while loop
	return index;
	}

	
char SensorSelectMenu(void)
	{
	 static char displayArray[2][10] = {"Doorsens","Sliversens"};
	 char set[] = "Select Sensor";	 
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option

	 delay(250,MS);			// To slow down the Yes Keypress from the above menu	 
	 DispClear();

	 while (selected==0)
		{		
		if ((index!=3 ))
			{DispText(set,0x10);}		//Show Change

		 DispText(displayArray[index],0x20);
		 key = KeyScan();
		 if (key == UP)
			{ if (index == 3) 
				{index = 0;
				 delay(250,MS);
				 DispClear();}
			  else
			     {index++;
				 delay(250,MS);
				 DispClear();
				 }
			}
		 if (key == DOWN)
			{ if (index == 0) 
				{index = 3;
				delay(250,MS);
				DispClear();}
			  else
			     {index--;
				 delay(250,MS);
				 DispClear();
				 }
			}
		if (key == NO)
			{index = -1;		//Back
			 selected = 1 ;
			}	
		if (key == YES)
			{selected = 1 ;
		//	 if (index == 3)
		//		{index = RESETALL;}
			}	
		}	// closes while loop
	return index;
	}

char ToolsMenu(void)
	{static char displayArray[3][10] = {"TestMotor","LogOptns","Stepptest"};
	 char set[] = "Go To";
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option
	 delay(250,MS);
	 DispClear();	 
	 
	 while (selected==0)
		{
		// if (index!=2)
		// {
		 DispText(set,0x10);		//Show 'Set'
		// }

		 DispText(displayArray[index],0x20);
		 key = KeyScan();
		 if (key == UP)
			{ if (index == 2) 
				 {index = 0;
				 delay(250,MS);
				DispClear();}
			  else
			     {index++;
				 delay(250,MS);
				  DispClear();}
			}
		 if (key == DOWN)
			{ if (index == 0) 
				{index = 2;
				delay(250,MS);
				 DispClear();}
			  else
			     {index--;
				 delay(250,MS);
				 DispClear();}
			}
		if (key == NO)
			{index = MAINMENU;		// Go back to main menu
			 selected = 1 ;
			 delay(250,MS);
			}
		if (key == YES)
			{selected = 1 ;
			 delay(250,MS);
		/*	if (index == 2)
				{index = MAINMENU;}
		*/
			}
		}	// closes while loop
	return index;
	}
	
char FactorysettingsMenu(void)
	{static char displayArray[1][10] = {"Sensorset"};
	 char set[] = "Go To";
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option
	 delay(250,MS);
	 DispClear();	 
	 
	 while (selected==0)
		{
		// if (index!=2)
		// {
		 DispText(set,0x10);		//Show 'Set'
		// }

		 DispText(displayArray[index],0x20);
		 key = KeyScan();
		 if (key == UP)
			{ if (index == 1 ) 
				 {index = 0;
				 delay(250,MS);
				DispClear();}
			  else
			     {index++;
				 delay(250,MS);
				  DispClear();}
			}
		 if (key == DOWN)
			{ if (index == 0) 
				{index = 1;
				delay(250,MS);
				 DispClear();}
			  else
			     {index--;
				 delay(250,MS);
				 DispClear();}
			}
		if (key == NO)
			{index = MAINMENU;		// Go back to main menu
			 selected = 1 ;
			 delay(250,MS);
			}
		if (key == YES)
			{selected = 1 ;
			 delay(250,MS);
			if (index == 1)
				{index = MAINMENU;}
		
			}
		}	// closes while loop
	return index;
	}




char DataloggingMenu(void)
	{
	 static char logs[3][5]   = {"RPM","CRNT","PWM"};
	 int eeprom[3]	  = {DATALOGGING_FLAG_RPM,DATALOGGING_FLAG_CURRENT,DATALOGGING_FLAG_PWM};
	 char displayArray[] = "LogSettings";
	 char saved[] = "Saved";
	 char star[] = "*";
	 char clear[] =" ";
	 char enteredLoop =0;
	/* to be changed.right now above array needs to be defined in this file, the Tools Logic Functions File and in
	the runMachine Functions . global it somehow? */

	 char parameter= 0;	// flag to denote which parameter, rpm,current or pwm
	 char parameterValue = 0;	// flag to denote on or off. off is 0, on is 1
	 char changeParameters = 0;
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option
	 
	 delay(250,MS);	// to suppress previous key press
	 DispClear();
	
	 parameterValue = EepromRead(eeprom[parameter]);

	 while (selected==0)
		{
		 DispText(displayArray,0x10);
		 DispText(logs[parameter],0x20);		// display rpm,current,pwm

		//quick check. should write the correct value into eeprom if wrong
	/*	 if ((parameterValue>1)|| (parameterValue<0))
				{parameterValue = 0;
				 EepromWrite(0,eeprom[parameter]);
				}*/

		 DispNo(parameterValue,0x25,0x20);	

		 if (changeParameters==1)
		 	{ DispText(star,0x2F);
			  DispText(clear,0x1F);
			}
		 if (changeParameters==0)
		 	{DispText(clear,0x2F);
			 DispText(star,0x1F);
			 }


		 key = KeyScan();
		
		/* if youre within change parameters,pressing up or down toggles between on and off.If youre not
		within change paramters, up and down cycle through the parameter options ,and update the display*/
		 if (changeParameters==1)
		 	{if ((key == UP)|| (key==DOWN))
					{parameterValue = !parameterValue;
					 delay(200,MS);}
			}
		 if (changeParameters==0)
			{	if (key == UP)
					{ if (parameter == 2) 
						 	{parameter = 0;
					  	 	 delay(250,MS);
					  		 DispClear();
					  		}
				      else
				     	{parameter++;
					 	delay(250,MS);
					 	DispClear();
						}
				parameterValue = EepromRead(eeprom[parameter]);	// to reload the correct values from the eeprom

					}		// closes if key == up

			 	if (key == DOWN)
					{ if (parameter == 0) 
						{parameter = 2;
						delay(250,MS);
					 	DispClear();
					 	}
				  	  else
				     	{parameter--;
					 	delay(250,MS);
					 	DispClear();
						}
				parameterValue = EepromRead(eeprom[parameter]);

					}	// closes if key == Down
			}	// closes else

		/* when you press no, if youre in change parameters, you come out. If your already outside, you exit and
		go back to above menu */
		 if (key == NO)
			{if (changeParameters==0)
				{ index = BACK;		// go to  tools menu
			 	 selected = 1 ;
				}
			if (changeParameters ==1)
				{changeParameters  =0;
				}
				
			 delay(250,MS);
			 DispClear();
			}	// closes if key==no

		/* when you press yes, if you havent yet entered change parameters you enter it.In change paramters
		if you press yes, you save the value */
		 enteredLoop =0;
		 if (key == YES)
			{if (changeParameters==0)
				{changeParameters = 1;
				 enteredLoop=1;
				 }

			 if (changeParameters ==1)
			 	{ if (enteredLoop == 0)		//Dont allow it to save, when you've just entered 
						{
			 	 		 EepromWrite(parameterValue,eeprom[parameter]);
			 	 		 DispText(saved,0x2A);
			 	 		 delay(200,MS);	  	
						 
						}
				}

			delay(250,MS);		 
			DispClear();
			} 	// closes if key==yes
	
				
		}	// closes while loop
return index;
	}

char SensorsetMenu(void)
	{
	 static char logs[2][5]   = {"Door","Slv"};
	 int eeprom[1]	  = {SLIVER_SENS};
	 char displayArray[] = "SensorSet";
	 char saved[] = "Saved";
	 char star[] = "*";
	 char clear[] =" ";
	 char enteredLoop =0;
	/* to be changed.right now above array needs to be defined in this file, the Tools Logic Functions File and in
	the runMachine Functions . global it somehow? */

	 char parameter= 0;	// flag to denote which parameter, rpm,current or pwm
	 char parameterValue = 0;	// flag to denote on or off. off is 0, on is 1
	 char changeParameters = 0;
	 char index = 0;
	 char key = 0;
	 char selected = 0;		// make this 1 only when youve chosen your option
	 
	 delay(250,MS);	// to suppress previous key press
	 DispClear();
	
	 parameterValue = EepromRead(eeprom[parameter]);

	 while (selected==0)
		{
		 DispText(displayArray,0x10);
		 DispText(logs[parameter],0x20);		// display rpm,current,pwm

		//quick check. should write the correct value into eeprom if wrong
		 /*if ((parameterValue>1)|| (parameterValue<0))
				{parameterValue = 0;
				 EepromWrite(0,eeprom[parameter]);
				}*/

		 DispNo(parameterValue,0x25,0x20);	

		 if (changeParameters==1)
		 	{ DispText(star,0x2F);
			  DispText(clear,0x1F);
			}
		 if (changeParameters==0)
		 	{DispText(clear,0x2F);
			 DispText(star,0x1F);
			 }


		 key = KeyScan();
		
		/* if youre within change parameters,pressing up or down toggles between on and off.If youre not
		within change paramters, up and down cycle through the parameter options ,and update the display*/
		 if (changeParameters==1)
		 	{if ((key == UP)|| (key==DOWN))
					{parameterValue = !parameterValue;
					 delay(200,MS);}
			}
		 if (changeParameters==0)
			{	if (key == UP)
					{ if (parameter == 2) 
						 	{parameter = 0;
					  	 	 delay(250,MS);
					  		 DispClear();
					  		}
				      else
				     	{parameter++;
					 	delay(250,MS);
					 	DispClear();
						}
				parameterValue = EepromRead(eeprom[parameter]);	// to reload the correct values from the eeprom

					}		// closes if key == up

			 	if (key == DOWN)
					{ if (parameter == 0) 
						{parameter = 2;
						delay(250,MS);
					 	DispClear();
					 	}
				  	  else
				     	{parameter--;
					 	delay(250,MS);
					 	DispClear();
						}
				parameterValue = EepromRead(eeprom[parameter]);

					}	// closes if key == Down
			}	// closes else

		/* when you press no, if youre in change parameters, you come out. If your already outside, you exit and
		go back to above menu */
		 if (key == NO)
			{if (changeParameters==0)
				{ index = BACK;		// go to  tools menu
			 	 selected = 1 ;
				}
			if (changeParameters ==1)
				{changeParameters  =0;
				}
				
			 delay(250,MS);
			 DispClear();
			}	// closes if key==no

		/* when you press yes, if you havent yet entered change parameters you enter it.In change paramters
		if you press yes, you save the value */
		 enteredLoop =0;
		 if (key == YES)
			{if (changeParameters==0)
				{changeParameters = 1;
				 enteredLoop=1;
				 }

			 if (changeParameters ==1)
			 	{ if (enteredLoop == 0)		//Dont allow it to save, when you've just entered 
						{
			 	 		 EepromWrite(parameterValue,eeprom[parameter]);
			 	 		 DispText(saved,0x2A);
			 	 		 delay(200,MS);	  	
						 
						}
				}

			delay(250,MS);		 
			DispClear();
			} 	// closes if key==yes
	
				
		}	// closes while loop
return index;
	}








