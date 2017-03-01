*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include overloadhistorymenu.c C:\Users\SIVARA~1\AppData\Local\Temp\over
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\overloadhistorymenu.if overloadhistorymenu.asm C:\Users\SIVARA~1\AppData\Local\Temp\overloadhistorymenu.tmp 
	.port
	.file	"overloadhistorymenu.c"
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
	.file	"overloadhistorymenu.c"
	.text

	.sym	_HistoryMenu,_HistoryMenu,34,2,0
	.globl	_HistoryMenu

	.func	12
******************************************************
* FUNCTION DEF : _HistoryMenu
******************************************************
_HistoryMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,60
	LAR	AR0,*0+,AR2

	.sym	_dataset,1,50,1,128,,8
	.sym	_resetAll,9,50,1,144,,9
	.sym	_totalWrites,18,50,1,192,,12
	.sym	_resetted,30,50,1,160,,10
	.sym	_ms,40,50,1,48,,3
	.sym	_noData,43,50,1,144,,9
	.sym	_datasetNo,52,2,1,16
	.sym	_motorIndex,53,2,1,16
	.sym	_totalWritesInt,54,2,1,16
	.sym	_overloadTime,55,2,1,16
	.sym	_overloadTimeInt,56,2,1,16
	.sym	_noDataIndicator,57,2,1,16
	.sym	_key,58,2,1,16
	.sym	_selected,59,2,1,16
	.line	2
	LACK	68
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	97
	SACL	*+
	LACK	116
	SACL	*+
	LACK	97
	SACL	*+
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	LACK	82
	SACL	*+
	LACK	101
	SACL	*+
	LACK	115
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	65
	SACL	*+
	LACK	108
	SACL	*+
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	LACK	84
	SACL	*+
	LACK	111
	SACL	*+
	LACK	116
	SACL	*+
	LACK	97
	SACL	*+
	LACK	108
	SACL	*+
	LACK	87
	SACL	*+
	LACK	114
	SACL	*+
	LACK	105
	SACL	*+
	LACK	116
	SACL	*+
	LACK	101
	SACL	*+
	LACK	115
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	LACK	82
	SACL	*+
	LACK	101
	SACL	*+
	LACK	115
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	100
	SACL	*+
	LACK	33
	SACL	*+
	LACK	0
	SACL	*+
	.line	6
	LACK	109
	SACL	*+
	LACK	83
	SACL	*+
	LACK	0
	SACL	*+
	.line	7
	LACK	78
	SACL	*+
	LACK	111
	SACL	*+
	LACK	32
	SACL	*+
	LACK	68
	SACL	*+
	LACK	97
	SACL	*+
	LACK	116
	SACL	*+
	LACK	97
	SACL	*+
	LACK	33
	SACL	*+
	LACK	0
	SACL	*+
	.line	9
	SACL	*+
	.line	10
	SACL	*+
	.line	11
	SACL	*+
	.line	12
	SACL	*+
	.line	13
	SACL	*+
	.line	14
	SACL	*+
	.line	16
	SACL	*+
	.line	17
	SACL	* ,AR1
	.line	19
	CALL	_DispClear
	.line	20
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	21
	LACK	34
	SACL	*+
	LACK	25
	SACL	*+,AR2
	LARK	AR2,52
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	24
	SSXM
	MAR	* ,AR2
	LARK	AR2,52
	MAR	*0+
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR1
	ADDK	4
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,53
	MAR	*0+
	SACL	*-
	.line	25
	SSXM
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,56
	MAR	*0+
	SACL	* ,AR1
	.line	26
	SACL	*+
	CALL	_ConvertIntToDisplayTime
	MAR	*-,AR2
	LARK	AR2,55
	MAR	*0+
	SACL	* 
	.line	28
	SSXM
	ADRK	4
	LAC	* 
	SUBK	1
	BZ	L2
	SBRK	7
L1:
	.line	29
	LAC	* 
	SUBK	5
	BGEZ	L3
	.line	30
	MAR	*+
	LAC	* 
	SUBK	4
	BGZ	LL3
	LAC	* 
	BGEZ	L4
LL3:
	.line	31
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	32
	LACK	34
	SACL	*+
	LACK	25
	SACL	*+,AR2
	LARK	AR2,52
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	33
	LACK	32
	SACL	*+,AR3
	LARK	AR3,43
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	34
	LACK	1
	MAR	* ,AR2
	LARK	AR2,57
	MAR	*0+
	SACL	* 
L4:
	.line	37
	SSXM
	LARK	AR2,53
	MAR	*0+
	LAC	* 
	SUBK	4
	BGZ	L3
	LAC	* 
	BLZ	L3
	.line	38
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	39
	LACK	34
	SACL	*+
	LACK	25
	SACL	*+,AR2
	LARK	AR2,52
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	40
	LACK	32
	SACL	*+,AR2
	LARK	AR2,53
	MAR	*0+
	LAC	* ,2,AR1
	ADLK	_motorNames+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	41
	LACK	64
	SACL	*+
	LACK	37
	SACL	*+,AR2
	LARK	AR2,55
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	42
	LACK	41
	SACL	*+,AR3
	LARK	AR3,40
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	43
	LACK	0
	MAR	* ,AR2
	LARK	AR2,57
	MAR	*0+
	SACL	* 
L3:
	.line	47
	SSXM
	LARK	AR2,52
	MAR	*0+
	LAC	* 
	SUBK	5
	BNZ	L6
	.line	48
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,18
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	49
	LACK	56
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,54
	MAR	*0+
	SACL	* ,AR1
	.line	50
	LACK	32
	SACL	*+
	LACK	28
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
L6:
	.line	52
	SSXM
	MAR	* ,AR2
	LARK	AR2,52
	MAR	*0+
	LAC	* 
	SUBK	6
	BNZ	L7
	.line	53
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,9
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L7:
	.line	56
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,58
	MAR	*0+
	SACL	* 
	.line	57
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L8
	.line	58
	SBRK	6
	LAC	* 
	SUBK	6
	BNZ	L9
	.line	59
	LACK	0
	SACL	* ,AR1
	.line	60
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	61
	CALL	_DispClear
	B	L10
L9:
	.line	64
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	65
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	66
	CALL	_DispClear
L10:
	.line	69
	SSXM
	MAR	* ,AR2
	LARK	AR2,52
	MAR	*0+
	LAC	* 
	SUBK	5
	BGEZ	L8
	.line	70
	ADLK	_dataSetEeAddress+5,0
	MAR	* ,AR0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	ADDK	4
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,53
	MAR	*0+
	SACL	*-
	.line	71
	SSXM
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,56
	MAR	*0+
	SACL	* ,AR1
	.line	72
	SACL	*+
	CALL	_ConvertIntToDisplayTime
	MAR	*-,AR2
	LARK	AR2,55
	MAR	*0+
	SACL	* 
L8:
	.line	76
	SSXM
	LARK	AR2,58
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L12
	.line	77
	SBRK	6
	LAC	* 
	BNZ	L13
	.line	78
	LACK	6
	SACL	* ,AR1
	.line	79
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	80
	CALL	_DispClear
	B	L14
L13:
	.line	84
	SUBK	1
	SACL	* ,AR1
	.line	85
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	86
	CALL	_DispClear
L14:
	.line	89
	SSXM
	MAR	* ,AR2
	LARK	AR2,52
	MAR	*0+
	LAC	* 
	SUBK	5
	BGEZ	L12
	.line	90
	ADLK	_dataSetEeAddress+5,0
	MAR	* ,AR0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	ADDK	4
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,53
	MAR	*0+
	SACL	*-
	.line	91
	SSXM
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,56
	MAR	*0+
	SACL	* ,AR1
	.line	92
	SACL	*+
	CALL	_ConvertIntToDisplayTime
	MAR	*-,AR2
	LARK	AR2,55
	MAR	*0+
	SACL	* 
L12:
	.line	96
	SSXM
	LARK	AR2,58
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L16
	.line	98
	SBRK	6
	LAC	* 
	SUBK	5
	BGEZ	L17
	.line	99
	ADRK	5
	LAC	* 
	SUBK	1
	BNZ	L18
	.line	100
	LACK	0
	ADRK	2
	SACL	* 
L18:
	.line	102
	LARK	AR2,57
	MAR	*0+
	LAC	* 
	BNZ	L17
	.line	103
	LACK	1
	ADRK	2
	SACL	* 
L17:
	.line	108
	LARK	AR2,52
	MAR	*0+
	LAC	* 
	SUBK	6
	BNZ	L16
	.line	109
	CALL	_ResetDataSets,AR1
	.line	110
	LACK	32
	SACL	*+,AR3
	LARK	AR3,30
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	111
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	112
	CALL	_DispClear
	.line	113
	LACK	0
	MAR	* ,AR2
	LARK	AR2,59
	MAR	*0+
	SACL	* 
L16:
	.line	118
	SSXM
	LARK	AR2,58
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L21
	.line	119
	SBRK	6
	SPLK	#-1,* 
	.line	120
	LACK	1
	ADRK	7
	SACL	* 
L21:
	.line	28
	LARK	AR2,59
	MAR	*0+
	LAC	* 
	SUBK	1
	SBRK	7
	BNZ	L1
L2:
	.line	125
	LARK	AR2,52
	MAR	*0+
	LAC	* 
EPI0_1:
	.line	126
	MAR	* ,AR1
	SBRK	61
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	137,000000000H,60

	.sym	_CycleAdcReadings,_CycleAdcReadings,32,2,0
	.globl	_CycleAdcReadings

	.func	140
******************************************************
* FUNCTION DEF : _CycleAdcReadings
******************************************************
_CycleAdcReadings:

LF2	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,12
	LAR	AR0,*0+,AR2

	.sym	_dataset,-3+LF2,2,9,16
	.sym	_star,1,50,1,32,,2
	.sym	_lmt,3,50,1,64,,4
	.sym	_readingNo,7,2,1,16
	.sym	_adcReading,8,2,1,16
	.sym	_key,9,2,1,16
	.sym	_selected,10,2,1,16
	.sym	_adcOVLevel,11,4,1,16
	.line	2
	LACK	42
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	LACK	76
	SACL	*+
	LACK	109
	SACL	*+
	LACK	116
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*+
	.line	6
	SACL	*+
	.line	7
	SACL	*+
	.line	9
	SACL	* ,AR0
	.line	13
	ADDK	3
	SACL	* 
	LT	* ,AR2
	MPYK	2
	SSXM
	SBRK	14-LF2
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR1
	APAC
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,8
	MAR	*0+
	SACL	* 
	.line	14
	SSXM
	SBRK	11-LF2
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR1
	ADDK	2
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,11
	MAR	*0+
	SACL	* ,AR1
	.line	15
	CALL	_DispClear
	.line	17
	SSXM
	MAR	* ,AR2
	LARK	AR2,10
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L23
	MAR	* ,AR1
L22:
	.line	18
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	19
	LACK	34
	SACL	*+
	LACK	17
	SACL	*+,AR2
	LARK	AR2,-3+LF2
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	20
	LACK	18
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	22
	LACK	34
	SACL	*+
	LACK	20
	SACL	*+,AR2
	LARK	AR2,7
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	23
	LACK	64
	SACL	*+
	LACK	32
	SACL	*+,AR2
	LARK	AR2,8
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	25
	LACK	24
	SACL	*+,AR3
	LARK	AR3,3
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	26
	LACK	64
	SACL	*+
	LACK	28
	SACL	*+,AR2
	LARK	AR2,11
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	28
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,9
	MAR	*0+
	SACL	* 
	.line	30
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L24
	.line	31
	SBRK	2
	LAC	* 
	SUBK	4
	BNZ	L25
	.line	32
	LACK	0
	SACL	* ,AR1
	.line	33
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	34
	CALL	_DispClear
	B	L26
L25:
	.line	37
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	38
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	39
	CALL	_DispClear
L26:
	.line	42
	SSXM
	MAR	* ,AR2
	LARK	AR2,7
	MAR	*0+
	LAC	* ,AR0
	ADDK	3
	SACL	* 
	LT	* ,AR2
	MPYK	2
	SBRK	10-LF2
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR1
	APAC
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,8
	MAR	*0+
	SACL	* 
L24:
	.line	45
	SSXM
	LARK	AR2,9
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L27
	.line	46
	SBRK	2
	LAC	* 
	BNZ	L28
	.line	47
	LACK	4
	SACL	* ,AR1
	.line	48
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	49
	CALL	_DispClear
	B	L29
L28:
	.line	52
	SUBK	1
	SACL	* ,AR1
	.line	53
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	54
	CALL	_DispClear
L29:
	.line	57
	SSXM
	MAR	* ,AR2
	LARK	AR2,7
	MAR	*0+
	LAC	* ,AR0
	ADDK	3
	SACL	* 
	LT	* ,AR2
	MPYK	2
	SBRK	10-LF2
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR1
	APAC
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,8
	MAR	*0+
	SACL	* 
L27:
	.line	61
	SSXM
	LARK	AR2,9
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L30
	.line	63
	LACK	1
	MAR	*+
	SACL	* ,AR1
	.line	64
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
L30:
	.line	17
	SSXM
	MAR	* ,AR2
	LARK	AR2,10
	MAR	*0+
	LAC	* ,AR1
	SUBK	1
	BNZ	L22
L23:
EPI0_2:
	.line	70
	MAR	* ,AR1
	SBRK	13
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	209,000000000H,12

	.sym	_ResetDataSets,_ResetDataSets,32,3,0

	.func	213
******************************************************
* FUNCTION DEF : _ResetDataSets
******************************************************
_ResetDataSets:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_i,1,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	3
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BGEZ	L32
L31:
	.line	4
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR1
	ADDK	4
	SACL	*+
	RSXM
	LACK	65535
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	5
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR0
	RSXM
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	LACK	65535
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	3
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BLZ	L31
L32:
	.line	7
	MAR	* ,AR1
	LACK	56
	SACL	*+
	LACK	0
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	8
	LACK	54
	SACL	*+
	LACK	0
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
EPI0_3:
	.line	9
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	221,000000000H,2
	.end
