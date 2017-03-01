*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include toolslogic.c C:\Users\SIVARA~1\AppData\Local\Temp\toolslogic.if
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\toolslogic.if toolslogic.asm C:\Users\SIVARA~1\AppData\Local\Temp\toolslogic.tmp 
	.port
	.file	"toolslogic.c"
	.file	"regs240x.h"
	.globl	_portffff
	.globl	_portff0f
	.globl	_port0
	.globl	_port1
	.globl	_port2
	.globl	_port3
	.globl	_port4
	.file	"AllHardwareFunctions.h"
	.globl	_MCnt1
	.globl	_Initialize
	.globl	_MotorStructInit
	.globl	_InitMenuStruct
	.globl	_InitOptionsStruct
	.globl	_InitOverloadStruct
	.globl	_InitMotorHardware
	.globl	_InitMotorHardwareTest
	.globl	_DispInit
	.globl	_DispClear
	.globl	_DispText
	.globl	_DispUserText
	.globl	_DispNo
	.globl	_delay1us
	.globl	_delay1ms
	.globl	_delay
	.globl	_EepromRead
	.globl	_EepromWrite
	.globl	_KeysInit
	.globl	_KeyScan
	.globl	_SerialInit
	.globl	_SerialDisable
	.globl	_SerialWriteNo
	.globl	_SerialWriteComma
	.globl	_SerialWriteNewLine
	.globl	_SerialWriteText
	.globl	_SerialWriteMinus
	.globl	_GetRPM
	.globl	_ResetAllRPMCounts
	.globl	_ResetFilterRpmArray
	.globl	_AdcInit
	.globl	_ResetFilterSumArray
	.globl	_AdcFilteredGet
	.globl	_LcFilterGet
	.globl	_ResetOverloadCounterArray
	.globl	_CheckOverload
	.globl	_UpdateHistoryArray
	.globl	_ResetHistoryArrays
	.globl	_SaveHistoryArray
	.file	"AllLogicFunctions.h"
	.globl	_trigger
	.globl	_motorNames
	.globl	_dataSetEeAddress
	.globl	_RunMachine
	.globl	_CycleDisp
	.globl	_RunLoopMotorSelectMenu
	.globl	_RunLoopSetMotorSpeed
	.globl	_UpdateMotorRpm
	.globl	_CheckAllMotors
	.globl	_ApplyPwms
	.globl	_InitMotorPID
	.globl	_UpdateMotorPID
	.globl	_ResetIntegralErrorArray
	.globl	_RunMachineParameters
	.globl	_SetMotorSpeed
	.globl	_ResetMotorSpeeds
	.globl	_SaveMotorSpeed
	.globl	_SetMotorOverloadCurrent
	.globl	_ResetOverloadCurrent
	.globl	_SaveMotorOverloadCurrent
	.globl	_SetMotorOverloadTime
	.globl	_SaveMotorOverloadTime
	.globl	_ResetOverloadTime
	.globl	_ConvertAdcToDisplayFormat
	.globl	_ConvertIntToDisplayTime
	.globl	_SetPid
	.globl	_ResetPidConsts
	.globl	_RunTools
	.globl	_LoadDatalogOptions
	.globl	_SetBtrPinsLow
	.globl	_SetSdPinHigh
	.globl	_StopAllMotors
	.globl	_Datalog
	.globl	_RunMotorTest
	.globl	_UpdateMotorTest
	.globl	_ApplyPwmTest
	.globl	_HistoryMenu
	.globl	_CycleAdcReadings
	.globl	_CheckPassword
	.file	"MotorStruct.h"

	.stag	_Motor,320
	.member	_finalRpm,0,14,8,16
	.member	_presentRpm,16,14,8,16
	.member	_presentCurrentAdc,32,14,8,16
	.member	_overloadCurrentAdc,48,14,8,16
	.member	_overloadTimeInt,64,14,8,16
	.member	_historySaveFreq,80,14,8,16
	.member	_deltaRampPwm,96,14,8,16
	.member	_menuDeltaRpm,112,14,8,16
	.member	_intTarget,128,4,8,16
	.member	_error,144,4,8,16
	.member	_integralError,160,4,8,16
	.member	_pwm,176,14,8,16
	.member	_pwmPercentage,192,14,8,16
	.member	_Kp,208,6,8,32
	.member	_Ki,240,6,8,32
	.member	_Km,272,6,8,32
	.member	_CylenderCurrentADC,304,14,8,16
	.eos

	.stag	_Menu,144
	.member	_maxSpeedLimit,0,14,8,16
	.member	_minSpeedLimit,16,14,8,16
	.member	_defaultSpeedLimit,32,14,8,16
	.member	_EEoverloadCurrent,48,14,8,16
	.member	_EEoverloadTime,64,14,8,16
	.member	_EEfinalRpm,80,14,8,16
	.member	_EEKm,96,14,8,16
	.member	_EEKp,112,14,8,16
	.member	_EEKi,128,14,8,16
	.eos

	.stag	_Options,144
	.member	_logRpm,0,14,8,16
	.member	_logCurrent,16,14,8,16
	.member	_logPwm,32,14,8,16
	.member	_testFlag,48,14,8,16
	.member	_testMotorIndex,64,14,8,16
	.member	_testMotorRpm,80,14,8,16
	.member	_allMotorsOn,96,14,8,16
	.member	_doorsens,112,14,8,16
	.member	_sliversens,128,14,8,16
	.eos

	.stag	_Overload,64
	.member	_overloadedMotor,0,14,8,16
	.member	_overloadFlag,16,14,8,16
	.member	_RpmerrorFlag,32,14,8,16
	.member	_Rpmerrormotor,48,14,8,16
	.eos
	.globl	_M
	.globl	_U
	.globl	_O
	.globl	_OV
	.file	"MenuFunctions.h"
	.globl	_TopLevelMenu
	.globl	_MachineParametersMenu
	.globl	_MotorSelectMenu
	.globl	_DataloggingMenu
	.globl	_ToolsMenu
	.file	"toolslogic.c"
	.text

	.sym	_RunTools,_RunTools,32,2,0
	.globl	_RunTools

	.func	14
******************************************************
* FUNCTION DEF : _RunTools
******************************************************
_RunTools:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,4
	LAR	AR0,*0+,AR2

	.sym	_selection,1,14,1,16
	.sym	_breakout,2,14,1,16
	.sym	_out,3,14,1,16
	.line	4
	LACK	0
	LARK	AR2,2
	MAR	*0+
	SACL	*+
	.line	5
	SACL	*-
	.line	6
	LAC	* 
	SUBK	1
	BZ	L2
	MAR	* ,AR1
L1:
	.line	7
	CALL	_ToolsMenu,AR1
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	B	L3
L4:
	.line	10
	CALL	_Test,AR1
	MAR	* ,AR2
	LARK	AR2,3
	MAR	*0+
	SACL	* 
	.line	11
	B	L5
L6:
	.line	13
	CALL	_Datalogging,AR1
	MAR	* ,AR2
	LARK	AR2,3
	MAR	*0+
	SACL	* 
	.line	14
	B	L5
L7:
	.line	16
	CALL	_steppertestrun,AR1
	MAR	* ,AR2
	LARK	AR2,3
	MAR	*0+
	SACL	* 
	.line	17
	B	L5
L8:
	.line	19
	LACK	1
	MAR	* ,AR2
	LARK	AR2,3
	MAR	*0+
	SACL	* 
	.line	20
	B	L5
L3:
	.line	8
	ZALS	* 
	BZ	L4
	SUBK	1
	BZ	L6
	SUBK	1
	BZ	L7
	ADDK	4
	SSXM
	ADLK	65534,15
	BZ	L8
L5:
	.line	23
	LARK	AR2,3
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L9
	.line	24
	LACK	1
	MAR	*-
	SACL	* 
	B	L10
L9:
	.line	26
	LACK	0
	MAR	*-
	SACL	* 
L10:
	.line	6
	LAC	* ,AR1
	SUBK	1
	BNZ	L1
L2:
EPI0_1:
	.line	28
	MAR	* ,AR1
	SBRK	5
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	41,000000000H,4

	.sym	_Datalogging,_Datalogging,46,3,0

	.func	44
******************************************************
* FUNCTION DEF : _Datalogging
******************************************************
_Datalogging:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_optionSelect,1,14,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* ,AR1
	.line	4
	CALL	_DataloggingMenu
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	7
	LACK	0
EPI0_2:
	.line	9
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	52,000000000H,2

	.sym	_Test,_Test,46,3,0

	.func	57
******************************************************
* FUNCTION DEF : _Test
******************************************************
_Test:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_selectedOption,1,14,1,16
	.sym	_pwmPercent,2,14,1,16
	.sym	_breakout,3,14,1,16
	.sym	_out,4,14,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*-
	.line	7
	LAC	* 
	SUBK	1
	BZ	L12
	MAR	* ,AR1
L11:
	.line	9
	CALL	_MotorSelectMenu,AR1
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	10
	ZALS	* 
	RSXM
	SUBK	-1
	BZ	L13
	ZALS	* 
	SUBK	-2
	BZ	L13
	ZALS	* 
	SUBK	-3
	BZ	L13
	.line	12
	LAC	* ,AR1
	SACL	*+
	CALL	_SetMotorPwmPercent
	MAR	*-,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	13
	ZALS	* 
	RSXM
	SUBK	-1
	BZ	L13
	.line	15
	CALL	_MotorStructInit,AR1
	.line	17
	CALL	_InitOptionsStruct
	.line	20
	LACK	1
	LDPK	_O+3
	SACL	_O+3
	.line	21
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	BLDD	*+,#_O+4
	.line	22
	BLDD	* ,#_O+5,AR1
	.line	24
	CALL	_LoadDatalogOptions
	.line	25
 clrc INTM
	.line	28
	BLKD	_O+4,*+
	CALL	_InitMotorHardwareTest
	MAR	*-
	.line	29
	BLKD	_O+5,*+
	BLKD	_O+4,*+
	CALL	_RunMotorTest
	SBRK	2
	MAR	* ,AR2
	LARK	AR2,4
	MAR	*0+
	SACL	* 
	.line	30
 setc INTM
	.line	32
	LACK	0
	LDPK	_O+3
	SACL	_O+3
	.line	33
	LDPK	_O+4
	SPLK	#65535,_O+4
	.line	34
	LDPK	_O+5
	SACL	_O+5
	.line	36
	LDPK	_O+1
	SACL	_O+1
	.line	37
	LDPK	_O+2
	SACL	_O+2
	.line	38
	LDPK	_O
	SACL	_O
L13:
	.line	45
	LARK	AR2,1
	MAR	*0+
	ZALS	* 
	RSXM
	SUBK	-2
	BNZ	L15
	.line	47
	LACK	1
	ADRK	2
	SACL	*+
	.line	48
	SACL	* 
L15:
	.line	50
	LARK	AR2,1
	MAR	*0+
	ZALS	* 
	SUBK	-1
	BNZ	L16
	.line	51
	LACK	1
	ADRK	2
	SACL	*+
	.line	52
	LACK	0
	SACL	* 
L16:
	.line	7
	LARK	AR2,3
	MAR	*0+
	LAC	* ,AR1
	SUBK	1
	BNZ	L11
L12:
	.line	57
	MAR	* ,AR2
	MAR	*+
	ZALS	* 
EPI0_3:
	.line	59
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	115,000000000H,5

	.sym	_History,_History,46,3,0

	.func	118
******************************************************
* FUNCTION DEF : _History
******************************************************
_History:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,4
	LAR	AR0,*0+,AR2

	.sym	_breakout,1,14,1,16
	.sym	_out,2,14,1,16
	.sym	_dataset,3,14,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	SACL	*+
	.line	4
	SACL	* 
	.line	6
	SBRK	2
	LAC	* 
	SUBK	1
	BZ	L18
	MAR	* ,AR1
L17:
	.line	8
	CALL	_HistoryMenu,AR1
	MAR	* ,AR2
	LARK	AR2,3
	MAR	*0+
	SACL	* 
	.line	9
	ZALS	* 
	RSXM
	SUBK	-1
	BZ	L19
	.line	10
	LAC	* ,AR1
	SACL	*+
	CALL	_CycleAdcReadings
	MAR	*-
L19:
	.line	13
	MAR	* ,AR2
	LARK	AR2,3
	MAR	*0+
	ZALS	* 
	RSXM
	SUBK	-1
	BNZ	L20
	.line	14
	LACK	1
	SBRK	2
	SACL	*+
	.line	15
	LACK	0
	SACL	* 
L20:
	.line	6
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR1
	SUBK	1
	BNZ	L17
L18:
	.line	19
	MAR	* ,AR2
	MAR	*+
	ZALS	* 
EPI0_4:
	.line	20
	MAR	* ,AR1
	SBRK	5
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	137,000000000H,4

	.sym	_steppertestrun,_steppertestrun,46,3,0

	.func	139
******************************************************
* FUNCTION DEF : _steppertestrun
******************************************************
_steppertestrun:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,16
	LAR	AR0,*0+,AR2

	.sym	_breakout,1,14,1,16
	.sym	_out,2,14,1,16
	.sym	_dataset,3,14,1,16
	.sym	_teststepcount,4,14,1,16
	.sym	_teststepdircnt,5,14,1,16
	.sym	_startflag,6,14,1,16
	.sym	_key,7,2,1,16
	.sym	_dir,8,50,1,48,,3
	.sym	_dir1,11,50,1,80,,5
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*+
	.line	6
	SACL	*+
	.line	7
	LACK	1
	SACL	*+
	.line	8
	LACK	0
	SACL	*+
	.line	9
	LACK	117
	SACL	*+
	LACK	112
	SACL	*+
	LACK	0
	SACL	*+
	.line	10
	LACK	100
	SACL	*+
	LACK	111
	SACL	*+
	LACK	119
	SACL	*+
	LACK	110
	SACL	*+
	LACK	0
	SACL	* ,AR1
	.line	11
	CALL	_DispClear
	.line	12
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L22
	MAR	* ,AR3
L21:
	.line	14
	LARK	AR3,28828
	BIT	* ,15
	BBNZ	L24
L23:
	.line	16
	LARK	AR3,28822
	LACK	32
	OR	* 
	SACL	* ,AR1
	.line	17
	LACK	1
	SACL	*+
	LACK	4
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	18
	LARK	AR3,28822
	LACK	65503
	MAR	* ,AR3
	AND	* 
	SACL	* ,AR1
	.line	19
	LACK	1
	SACL	*+
	LACK	4
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	20
	MAR	* ,AR2
	LARK	AR2,4
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* ,AR3
	.line	14
	LARK	AR3,28828
	BIT	* ,15
	BBZ	L23
L24:
	.line	24
	MAR	* ,AR1
	LACK	64
	SACL	*+
	LACK	28
	SACL	*+,AR2
	LARK	AR2,4
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	26
	LARK	AR3,28828
	MAR	* ,AR3
	BIT	* ,12
	BBNZ	L25
	.line	27
	LACK	0
	MAR	* ,AR2
	LARK	AR2,4
	MAR	*0+
	SACL	* 
L25:
	.line	29
	MAR	* ,AR3
	BIT	* ,13
	BBNZ	L26
	.line	30
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	5
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	31
	LARK	AR3,28828
	MAR	* ,AR3
	BIT	* ,13
	BBNZ	L26
	.line	33
	SBRK	2
	LACK	128
	XOR	* 
	SACL	* ,AR2
	.line	34
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
L26:
	.line	38
	MAR	* ,AR2
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L28
	.line	40
	MAR	* ,AR1
	LACK	24
	SACL	*+,AR3
	LARK	AR3,8
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L28:
	.line	43
	MAR	* ,AR2
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L29
	.line	45
	CALL	_DispClear,AR1
	.line	46
	LACK	24
	SACL	*+,AR3
	LARK	AR3,11
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	47
	LACK	0
	MAR	* ,AR2
	LARK	AR2,5
	MAR	*0+
	SACL	* 
L29:
	.line	51
	LARK	AR3,28828
	MAR	* ,AR3
	BIT	* ,14
	BBNZ	L30
	.line	53
	LACK	1
	MAR	* ,AR2
	SBRK	4
	SACL	*+
	.line	54
	LACK	0
	SACL	* 
L30:
	.line	12
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR3
	SUBK	1
	BNZ	L21
L22:
	.line	58
	MAR	* ,AR2
	MAR	*+
	ZALS	* 
EPI0_5:
	.line	59
	MAR	* ,AR1
	SBRK	17
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	197,000000000H,16
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	_SetMotorPwmPercent
	.end
