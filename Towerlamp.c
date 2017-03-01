#include "regs240x.h"

void TowerLampGreen_On()
{
	PBDATDIR = PBDATDIR | 0x0008;	//IOPB3 High Towerlamp Green On
}
void TowerLampGreen_Off()
{
	PBDATDIR = PBDATDIR & 0xfff7;	//IOPB3 Low	 Towerlamp Green Off
}
void TowerLampRed_On()
{
	PFDATDIR = PFDATDIR | 0x0010;	//IOPF4 High Towerlamp Red On
}
void TowerLampRed_Off()
{
	PFDATDIR = PFDATDIR & 0xffef;	//IOPF4 Low  Towerlamp Red Off
}

void TowerLampBrown_On()
{
	PFDATDIR = PFDATDIR | 0x0040;	//IOPF6 HIGH  VFD Relay ON
}

void TowerLampBrown_Off()
{
	PFDATDIR = PFDATDIR & 0xffbf;	//IOPF6 LOW  VFD Relay Off
}