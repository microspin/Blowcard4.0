*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include machineparametersfunctions.c C:\Users\SIVARA~1\AppData\Local\Te
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\machineparametersfunctions.if machineparametersfunctions.asm C:\Users\SIVARA~1\AppData\Local\Temp\machineparametersfunctions.tmp 
	.port
	.bss	_pidNames$1,9,1
	.file	"machineparametersfunctions.c"
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
	.file	"machineparametersfunctions.c"
	.text

	.sym	_SetMotorSpeed,_SetMotorSpeed,36,2,0
	.globl	_SetMotorSpeed

	.func	16
******************************************************
* FUNCTION DEF : _SetMotorSpeed
******************************************************
_SetMotorSpeed:

LF1	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,17
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF1,2,9,16
	.sym	_param,-4+LF1,2,9,16
	.sym	_maxSpeedLimit,1,4,1,16
	.sym	_minSpeedLimit,2,4,1,16
	.sym	_deltaRpm,3,4,1,16
	.sym	_currentSpeed,4,4,1,16
	.sym	_defaultSpeedLimit,5,4,1,16
	.sym	_speed,6,4,1,16
	.sym	_text,7,50,1,128,,8
	.sym	_selected,15,2,1,16
	.sym	_key,16,2,1,16
	.line	2
	.line	4
	LARK	AR2,-3+LF1
	MAR	*0+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR2
	ADRK	4-LF1
	SACL	* 
	.line	5
	SBRK	4-LF1
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	MAR	*+
	LAC	* ,AR2
	ADRK	5-LF1
	SACL	* 
	.line	6
	SBRK	5-LF1
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	7
	LAC	* ,AR2
	ADRK	6-LF1
	SACL	*+
	.line	7
	LACK	0
	SACL	* 
	.line	8
	SBRK	7-LF1
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	2
	LAC	* ,AR2
	ADRK	8-LF1
	SACL	*+
	.line	9
	LACK	0
	SACL	*+
	.line	10
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	82
	SACL	*+
	LACK	80
	SACL	*+
	LACK	77
	SACL	*+
	LACK	0
	SACL	*+
	.line	11
	SACL	*+
	.line	12
	SACL	* 
	.line	16
	SBRK	20-LF1
	LAC	* 
	SUBK	1
	BNZ	L1
	.line	17
	MAR	*+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	2
	LAC	* ,AR4
	SACL	* ,AR2
	.line	18
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR2
	ADRK	7-LF1
	SACL	* 
L1:
	.line	20
	LARK	AR2,-4+LF1
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L2
	.line	21
	MAR	*+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	5
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	SACL	* ,AR2
	LARK	AR2,-3+LF1
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	SACL	* ,AR2
	.line	22
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR2
	ADRK	7-LF1
	SACL	* 
L2:
	.line	26
	LARK	AR2,4
	MAR	*0+
	LAC	* 
	SBRK	3
	SUB	* 
	BGZ	LL3
	ADRK	3
	LAC	* 
	SBRK	2
	SUB	* 
	BGEZ	L3
LL3:
	.line	27
	LARK	AR2,5
	MAR	*0+
	LAC	*-
	SACL	* 
L3:
	.line	30
	LARK	AR2,4
	MAR	*0+
	LAC	* 
	ADRK	2
	SACL	* ,AR1
	.line	32
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	33
	CALL	_DispClear
	.line	34
	LACK	16
	SACL	*+,AR3
	LARK	AR3,7
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	36
	SSXM
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L5
	SBRK	9
	MAR	* ,AR1
L4:
	.line	38
	LACK	64
	SACL	*+
	LACK	32
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	39
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	SACL	* 
	.line	40
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L6
	.line	41
	SBRK	10
	LAC	* 
	SBRK	5
	SUB	* 
	BGEZ	L6
	.line	42
	ADRK	2
	LAC	* 
	ADRK	3
	ADD	* 
	SACL	* 
L6:
	.line	45
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L8
	.line	46
	SBRK	10
	LAC	* 
	SBRK	4
	SUB	* 
	BLEZ	L8
	.line	47
	ADRK	4
	LAC	* 
	SBRK	3
	SUB	* 
	ADRK	3
	SACL	* 
L8:
	.line	49
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L10
	.line	50
	LACK	1
	MAR	*-
	SACL	* 
L10:
	.line	52
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L11
	.line	53
	LACK	1
	MAR	*-
	SACL	* 
	.line	54
	SBRK	9
	SPLK	#-1,* 
L11:
	.line	56
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	36
	SSXM
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	LAC	* 
	SUBK	1
	SBRK	9
	MAR	* ,AR1
	BNZ	L4
L5:
	.line	58
	MAR	* ,AR2
	LARK	AR2,6
	MAR	*0+
	LAC	* 
EPI0_1:
	.line	60
	MAR	* ,AR1
	SBRK	18
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	75,000000000H,17

	.sym	_ResetMotorSpeeds,_ResetMotorSpeeds,32,2,0
	.globl	_ResetMotorSpeeds

	.func	77
******************************************************
* FUNCTION DEF : _ResetMotorSpeeds
******************************************************
_ResetMotorSpeeds:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,14
	LAR	AR0,*0+,AR2

	.sym	_reset,1,50,1,192,,12
	.sym	_i,13,2,1,16
	.line	4
	LACK	82
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	115
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	68
	SACL	*+
	LACK	111
	SACL	*+
	LACK	110
	SACL	*+
	LACK	101
	SACL	*+
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	SACL	* 
	.line	6
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BGEZ	L13
L12:
	.line	7
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	5
	LAC	* ,AR1
	SACL	*+,AR2
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	6
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BLZ	L12
L13:
	.line	9
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	10
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_2:
	.line	11
	SBRK	15
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	87,000000000H,14

	.sym	_SaveMotorSpeed,_SaveMotorSpeed,32,2,0
	.globl	_SaveMotorSpeed

	.func	89
******************************************************
* FUNCTION DEF : _SaveMotorSpeed
******************************************************
_SaveMotorSpeed:

LF3	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,7
	LAR	AR0,*0+,AR2

	.sym	_selectedMotor,-3+LF3,2,9,16
	.sym	_speed,-4+LF3,4,9,16
	.sym	_saved,1,50,1,96,,6
	.line	2
	.line	3
	LACK	83
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	97
	SACL	*+
	LACK	118
	SACL	*+
	LACK	101
	SACL	*+
	LACK	100
	SACL	*+
	LACK	0
	SACL	* 
	.line	4
	SBRK	9-LF3
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	5
	LAC	* ,AR1
	SACL	*+,AR2
	MAR	*-
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	5
	LACK	40
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	6
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_3:
	.line	7
	SBRK	8
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	95,000000000H,7

	.sym	_SetMotorOverloadCurrent,_SetMotorOverloadCurrent,36,2,0
	.globl	_SetMotorOverloadCurrent

	.func	98
******************************************************
* FUNCTION DEF : _SetMotorOverloadCurrent
******************************************************
_SetMotorOverloadCurrent:

LF4	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,23
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF4,2,9,16
	.sym	_overload,1,4,1,16
	.sym	_text,2,50,1,224,,14
	.sym	_amps,16,50,1,80,,5
	.sym	_selected,21,2,1,16
	.sym	_key,22,2,1,16
	.line	2
	.line	3
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	4
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	79
	SACL	*+
	LACK	118
	SACL	*+
	LACK	114
	SACL	*+
	LACK	108
	SACL	*+
	LACK	100
	SACL	*+
	LACK	32
	SACL	*+
	LACK	76
	SACL	*+
	LACK	109
	SACL	*+
	LACK	116
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	LACK	65
	SACL	*+
	LACK	109
	SACL	*+
	LACK	112
	SACL	*+
	LACK	115
	SACL	*+
	LACK	0
	SACL	*+
	.line	6
	SACL	*+
	.line	7
	SACL	* 
	.line	9
	SBRK	25-LF4
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	SACL	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	3
	SACL	* ,AR2
	.line	13
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	ZALS	* 
	SUBK	529
	BLZ	LL8
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	ZALS	* 
	SUBK	770
	BLEZ	L14
LL8:
	.line	14
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	SPLK	#673,* ,AR2
	.line	15
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	LAC	* ,AR1
	SACL	*+
	LACK	673
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
L14:
	.line	19
	MAR	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	LAC	* ,AR1
	SACL	*+
	CALL	_ConvertAdcToDisplayFormat
	MAR	*-,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* ,AR1
	.line	21
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	22
	CALL	_DispClear
	.line	24
	LACK	16
	SACL	*+,AR3
	LARK	AR3,2
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	26
	SSXM
	MAR	* ,AR2
	LARK	AR2,21
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L16
	SBRK	20
	MAR	* ,AR1
L15:
	.line	28
	LACK	33
	SACL	*+
	LACK	32
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	29
	LACK	36
	SACL	*+,AR3
	LARK	AR3,16
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	30
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,22
	MAR	*0+
	SACL	* 
	.line	31
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L17
	.line	32
	SBRK	21
	LAC	* 
	SUBK	60
	BGEZ	L17
	.line	33
	ADDK	61
	SACL	* 
L17:
	.line	35
	LARK	AR2,22
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L19
	.line	36
	SBRK	21
	LAC	* 
	SUBK	3
	BLEZ	L19
	.line	37
	ADDK	2
	SACL	* 
L19:
	.line	39
	LARK	AR2,22
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L21
	.line	40
	LACK	1
	MAR	*-
	SACL	* 
L21:
	.line	42
	LARK	AR2,22
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L22
	.line	43
	LACK	1
	MAR	*-
	SACL	* 
	.line	44
	SBRK	20
	SPLK	#-1,* 
L22:
	.line	46
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	26
	SSXM
	MAR	* ,AR2
	LARK	AR2,21
	MAR	*0+
	LAC	* 
	SUBK	1
	SBRK	20
	MAR	* ,AR1
	BNZ	L15
L16:
	.line	48
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
EPI0_4:
	.line	50
	MAR	* ,AR1
	SBRK	24
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	147,000000000H,23

	.sym	_ResetOverloadCurrent,_ResetOverloadCurrent,32,2,0
	.globl	_ResetOverloadCurrent

	.func	150
******************************************************
* FUNCTION DEF : _ResetOverloadCurrent
******************************************************
_ResetOverloadCurrent:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,14
	LAR	AR0,*0+,AR2

	.sym	_reset,1,50,1,192,,12
	.sym	_i,13,2,1,16
	.line	2
	LACK	82
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	115
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	68
	SACL	*+
	LACK	111
	SACL	*+
	LACK	110
	SACL	*+
	LACK	101
	SACL	*+
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	SACL	* 
	.line	4
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BGEZ	L24
L23:
	.line	5
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	LAC	* ,AR1
	SACL	*+
	LACK	673
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	4
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BLZ	L23
L24:
	.line	7
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	8
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_5:
	.line	9
	SBRK	15
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	158,000000000H,14

	.sym	_SaveMotorOverloadCurrent,_SaveMotorOverloadCurrent,32,2,0
	.globl	_SaveMotorOverloadCurrent

	.func	160
******************************************************
* FUNCTION DEF : _SaveMotorOverloadCurrent
******************************************************
_SaveMotorOverloadCurrent:

LF6	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,8
	LAR	AR0,*0+,AR2

	.sym	_selectedMotor,-3+LF6,2,9,16
	.sym	_overload,-4+LF6,4,9,16
	.sym	_saved,1,50,1,96,,6
	.sym	_adc,7,4,1,16
	.line	2
	LACK	83
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	97
	SACL	*+
	LACK	118
	SACL	*+
	LACK	101
	SACL	*+
	LACK	100
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	SACL	* 
	.line	4
	SBRK	11-LF6
	LAC	* ,AR1
	SACL	*+
	CALL	_ConvertDisplayFormatToAdc
	MAR	*-,AR2
	LARK	AR2,7
	MAR	*0+
	SACL	* 
	.line	5
	SBRK	10-LF6
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	LAC	* ,AR1
	SACL	*+,AR2
	ADRK	10-LF6
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	6
	LACK	42
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	7
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_6:
	.line	8
	SBRK	9
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	167,000000000H,8

	.sym	_SetMotorOverloadTime,_SetMotorOverloadTime,36,2,0
	.globl	_SetMotorOverloadTime

	.func	170
******************************************************
* FUNCTION DEF : _SetMotorOverloadTime
******************************************************
_SetMotorOverloadTime:

LF7	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,21
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF7,2,9,16
	.sym	_overload,1,4,1,16
	.sym	_text,2,50,1,224,,14
	.sym	_ms,16,50,1,48,,3
	.sym	_selected,19,2,1,16
	.sym	_key,20,2,1,16
	.line	2
	.line	3
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	4
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	79
	SACL	*+
	LACK	118
	SACL	*+
	LACK	114
	SACL	*+
	LACK	108
	SACL	*+
	LACK	100
	SACL	*+
	LACK	32
	SACL	*+
	LACK	76
	SACL	*+
	LACK	109
	SACL	*+
	LACK	116
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	LACK	109
	SACL	*+
	LACK	83
	SACL	*+
	LACK	0
	SACL	*+
	.line	6
	SACL	*+
	.line	7
	SACL	* 
	.line	9
	SBRK	23-LF7
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	4
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	SACL	* ,AR2
	LARK	AR2,-3+LF7
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	4
	SACL	* ,AR2
	.line	10
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	RSXM
	ADRK	4
	LAC	* ,14,AR1
	SACH	* ,1,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	5
	SACL	* ,AR2
	.line	12
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	4
	ZALS	* 
	SUBK	20
	BLEZ	L25
	.line	13
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	8
	ADRK	4
	SACL	* ,AR2
	.line	14
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	4
	LAC	* ,AR1
	SACL	*+
	LACK	8
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
L25:
	.line	18
	MAR	* ,AR2
	LARK	AR2,-3+LF7
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	4
	LAC	* ,AR1
	SACL	*+
	CALL	_ConvertIntToDisplayTime
	MAR	*-,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* ,AR1
	.line	20
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	21
	CALL	_DispClear
	.line	23
	LACK	16
	SACL	*+,AR3
	LARK	AR3,2
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	25
	SSXM
	MAR	* ,AR2
	LARK	AR2,19
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L27
	SBRK	18
	MAR	* ,AR1
L26:
	.line	27
	LACK	64
	SACL	*+
	LACK	32
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	28
	LACK	36
	SACL	*+,AR3
	LARK	AR3,16
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	29
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,20
	MAR	*0+
	SACL	* 
	.line	30
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L28
	.line	31
	SBRK	19
	LAC	* 
	SUBK	1000
	BGEZ	L28
	.line	32
	ADDK	1050
	SACL	* 
L28:
	.line	34
	LARK	AR2,20
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L30
	.line	35
	SBRK	19
	LAC	* 
	BLEZ	L30
	.line	36
	SUBK	50
	SACL	* 
L30:
	.line	38
	LARK	AR2,20
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L32
	.line	39
	LACK	1
	MAR	*-
	SACL	* 
L32:
	.line	41
	LARK	AR2,20
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L33
	.line	42
	LACK	1
	MAR	*-
	SACL	* 
	.line	43
	SBRK	18
	SPLK	#-1,* 
L33:
	.line	46
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	25
	SSXM
	MAR	* ,AR2
	LARK	AR2,19
	MAR	*0+
	LAC	* 
	SUBK	1
	SBRK	18
	MAR	* ,AR1
	BNZ	L26
L27:
	.line	48
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
EPI0_7:
	.line	50
	MAR	* ,AR1
	SBRK	22
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	219,000000000H,21

	.sym	_ResetOverloadTime,_ResetOverloadTime,32,2,0
	.globl	_ResetOverloadTime

	.func	221
******************************************************
* FUNCTION DEF : _ResetOverloadTime
******************************************************
_ResetOverloadTime:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,14
	LAR	AR0,*0+,AR2

	.sym	_reset,1,50,1,192,,12
	.sym	_i,13,2,1,16
	.line	2
	LACK	82
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	115
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	68
	SACL	*+
	LACK	111
	SACL	*+
	LACK	110
	SACL	*+
	LACK	101
	SACL	*+
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	SACL	* 
	.line	4
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BGEZ	L35
L34:
	.line	5
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	4
	LAC	* ,AR1
	SACL	*+
	LACK	8
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	4
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BLZ	L34
L35:
	.line	7
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	8
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_8:
	.line	9
	SBRK	15
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	229,000000000H,14

	.sym	_SaveMotorOverloadTime,_SaveMotorOverloadTime,32,2,0
	.globl	_SaveMotorOverloadTime

	.func	231
******************************************************
* FUNCTION DEF : _SaveMotorOverloadTime
******************************************************
_SaveMotorOverloadTime:

LF9	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,8
	LAR	AR0,*0+,AR2

	.sym	_selectedMotor,-3+LF9,2,9,16
	.sym	_overload,-4+LF9,4,9,16
	.sym	_saved,1,50,1,96,,6
	.sym	_overloadInt,7,4,1,16
	.line	2
	LACK	83
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	97
	SACL	*+
	LACK	118
	SACL	*+
	LACK	101
	SACL	*+
	LACK	100
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	SACL	* 
	.line	4
	SBRK	11-LF9
	LAC	* ,AR1
	SACL	*+
	CALL	_ConvertDisplayTimeToInt
	MAR	*-,AR2
	LARK	AR2,7
	MAR	*0+
	SACL	* 
	.line	5
	SBRK	10-LF9
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	4
	LAC	* ,AR1
	SACL	*+,AR2
	ADRK	10-LF9
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	6
	LACK	40
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	7
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_9:
	.line	8
	SBRK	9
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	238,000000000H,8

	.sym	_ConvertAdcToDisplayFormat,_ConvertAdcToDisplayFormat,36,2,0
	.globl	_ConvertAdcToDisplayFormat

	.func	242
******************************************************
* FUNCTION DEF : _ConvertAdcToDisplayFormat
******************************************************
_ConvertAdcToDisplayFormat:

LF10	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_adc,-3+LF10,4,9,16
	.sym	_deltaAmps,1,4,1,16
	.sym	_actualAmpsTen,2,4,1,16
	.sym	_displayAmps,3,4,1,16
	.sym	_mod,4,2,1,16
	.line	2
	.line	3
	LACK	775
	LARK	AR2,-3+LF10
	MAR	*0+
	SUB	* 
	ADRK	4-LF10
	SACL	* 
	.line	4
	LT	*+,AR0
	MPYK	10
	SPL	* 
	SSXM
	LAC	* ,AR2
	ABS
	SACL	* ,AR1
	.line	5
	LACK	41
	SACL	*+,AR2
	LAC	*+,AR1
	CALL	I$$DIV
	MAR	* ,AR2
	SACL	* ,AR1
	.line	7
	LACK	10
	SACL	*+,AR2
	SSXM
	LAC	*+,AR1
	CALL	I$$DIV
	MAR	* ,AR2
	SACL	* 
	.line	8
	LT	*-
	MPYK	10
	SSXM
	LAC	* 
	SPAC
	BZ	L36
	.line	9
	LAC	* 
	ADDK	1
	SACL	* 
L36:
	.line	10
	LAC	* 
EPI0_10:
	.line	11
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	252,000000000H,5

	.sym	_ConvertDisplayFormatToAdc,_ConvertDisplayFormatToAdc,36,3,0

	.func	254
******************************************************
* FUNCTION DEF : _ConvertDisplayFormatToAdc
******************************************************
_ConvertDisplayFormatToAdc:

LF11	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,4
	LAR	AR0,*0+,AR2

	.sym	_displayAmps,-3+LF11,4,9,16
	.sym	_deltaAdc,1,4,1,16
	.sym	_deltaAdcActual,2,4,1,16
	.sym	_actualAdc,3,4,1,16
	.line	2
	LARK	AR2,-3+LF11
	MAR	*0+
	LT	* 
	MPYK	41
	ADRK	4-LF11
	SPL	* ,AR1
	.line	3
	LACK	10
	SACL	*+,AR2
	SSXM
	LAC	*+,AR1
	CALL	I$$DIV
	MAR	* ,AR2
	SACL	*+
	.line	4
	NEG
	ADDK	775
	SACL	* 
	.line	5
	SSXM
	LAC	* 
EPI0_11:
	.line	6
	MAR	* ,AR1
	SBRK	5
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	259,000000000H,4

	.sym	_ConvertIntToDisplayTime,_ConvertIntToDisplayTime,36,2,0
	.globl	_ConvertIntToDisplayTime

	.func	261
******************************************************
* FUNCTION DEF : _ConvertIntToDisplayTime
******************************************************
_ConvertIntToDisplayTime:

LF12	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_overloadTime,-3+LF12,4,9,16
	.sym	_msTime,1,4,1,16
	.line	2
	LARK	AR2,-3+LF12
	MAR	*0+
	LT	* 
	MPYK	50
	ADRK	4-LF12
	SPL	* 
	.line	3
	SSXM
	LAC	* 
EPI0_12:
	.line	4
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	264,000000000H,2

	.sym	_ConvertDisplayTimeToInt,_ConvertDisplayTimeToInt,36,3,0

	.func	267
******************************************************
* FUNCTION DEF : _ConvertDisplayTimeToInt
******************************************************
_ConvertDisplayTimeToInt:

LF13	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+

	.sym	_displayTime,-3+LF13,4,9,16
	.sym	_overloadInt,1,4,1,16
	.line	2
	LACK	50
	SACL	*+,AR2
	SSXM
	LARK	AR2,-3+LF13
	MAR	*0+
	LAC	* ,AR1
	CALL	I$$DIV
	MAR	* ,AR2
	ADRK	4-LF13
	SACL	* 
	.line	3
	SSXM
	LAC	* 
EPI0_13:
	.line	4
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	270,000000000H,2

	.sym	_SetPid,_SetPid,34,2,0
	.globl	_SetPid

	.func	272
******************************************************
* FUNCTION DEF : _SetPid
******************************************************
_SetPid:

LF14	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,18
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF14,2,9,16

	.sect	".cinit"
	.word	IS1,_pidNames$1
	.word	75
	.word	109
	.word	0
	.word	75
	.word	112
	.word	0
	.word	75
	.word	105
	.word	0
IS1	.set	9
	.text

	.sym	_pidNames,_pidNames$1,242,3,144,,3,3
	.sym	_saved,1,50,1,96,,6
	.sym	_star,7,50,1,32,,2
	.sym	_clear,9,50,1,32,,2
	.sym	_enteredLoop,11,2,1,16
	.sym	_pidIndex,12,2,1,16
	.sym	_pidDisplayInt,13,2,1,16
	.sym	_changeParameters,14,2,1,16
	.sym	_index,15,2,1,16
	.sym	_key,16,2,1,16
	.sym	_selected,17,2,1,16
	.line	2
	.line	4
	LACK	83
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	97
	SACL	*+
	LACK	118
	SACL	*+
	LACK	101
	SACL	*+
	LACK	100
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	LACK	42
	SACL	*+
	LACK	0
	SACL	*+
	.line	6
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	7
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
	SACL	* ,AR1
	.line	16
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	17
	CALL	_DispClear
	.line	19
	MAR	* ,AR2
	LARK	AR2,-3+LF14
	MAR	*0+
	LAC	* ,AR1
	SACL	*+,AR2
	ADRK	15-LF14
	LAC	* ,AR1
	SACL	*+
	CALL	_ReadPidValueDisplay
	SBRK	2
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	SACL	* 
	.line	21
	SSXM
	ADRK	4
	LAC	* 
	BNZ	L38
	SBRK	20-LF14
	MAR	* ,AR1
L37:
	.line	23
	LACK	16
	SACL	*+,AR2
	LAC	* ,2,AR1
	ADLK	_motorNames+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	24
	LACK	21
	SACL	*+,AR2
	LARK	AR2,12
	MAR	*0+
	LT	* ,AR1
	MPYK	3
	PAC
	ADLK	_pidNames$1+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	26
	LACK	66
	SACL	*+
	LACK	32
	SACL	*+,AR2
	LARK	AR2,13
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	28
	SSXM
	MAR	* ,AR2
	LARK	AR2,14
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L39
	.line	29
	MAR	* ,AR1
	LACK	47
	SACL	*+,AR3
	LARK	AR3,7
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	30
	LACK	31
	SACL	*+,AR3
	LARK	AR3,9
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L39:
	.line	32
	SSXM
	MAR	* ,AR2
	LARK	AR2,14
	MAR	*0+
	LAC	* 
	BNZ	L40
	.line	33
	MAR	* ,AR1
	LACK	47
	SACL	*+,AR3
	LARK	AR3,9
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	34
	LACK	31
	SACL	*+,AR3
	LARK	AR3,7
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L40:
	.line	38
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	SACL	* 
	.line	42
	SSXM
	SBRK	2
	LAC	* 
	SUBK	1
	BNZ	L41
	.line	43
	ADRK	2
	LAC	* 
	SUBK	1
	BNZ	L42
	.line	44
	SBRK	3
	LAC	* 
	SUBK	500
	BNZ	L43
	.line	45
	LACK	0
	SACL	* ,AR1
	.line	46
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	47
	CALL	_DispClear
	B	L42
L43:
	.line	50
	ADDK	501
	SACL	* ,AR1
	.line	51
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	52
	CALL	_DispClear
L42:
	.line	58
	SSXM
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L41
	.line	59
	SBRK	3
	LAC	* 
	BNZ	L46
	.line	60
	SPLK	#500,* ,AR1
	.line	61
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	62
	CALL	_DispClear
	B	L41
L46:
	.line	65
	SUBK	1
	SACL	* ,AR1
	.line	66
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	67
	CALL	_DispClear
L41:
	.line	75
	SSXM
	MAR	* ,AR2
	LARK	AR2,14
	MAR	*0+
	LAC	* 
	BNZ	L48
	.line	76
	ADRK	2
	LAC	* 
	SUBK	1
	BNZ	L49
	.line	77
	SBRK	4
	LAC	* 
	SUBK	2
	BNZ	L50
	.line	78
	LACK	0
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
	B	L51
L50:
	.line	83
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	84
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	85
	CALL	_DispClear
L51:
	.line	87
	MAR	* ,AR2
	LARK	AR2,-3+LF14
	MAR	*0+
	LAC	* ,AR1
	SACL	*+,AR2
	ADRK	15-LF14
	LAC	* ,AR1
	SACL	*+
	CALL	_ReadPidValueDisplay
	SBRK	2
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	SACL	* 
L49:
	.line	91
	SSXM
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L48
	.line	92
	SBRK	4
	LAC	* 
	BNZ	L53
	.line	93
	LACK	2
	SACL	* ,AR1
	.line	94
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	95
	CALL	_DispClear
	B	L54
L53:
	.line	98
	SUBK	1
	SACL	* ,AR1
	.line	99
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	100
	CALL	_DispClear
L54:
	.line	102
	MAR	* ,AR2
	LARK	AR2,-3+LF14
	MAR	*0+
	LAC	* ,AR1
	SACL	*+,AR2
	ADRK	15-LF14
	LAC	* ,AR1
	SACL	*+
	CALL	_ReadPidValueDisplay
	SBRK	2
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	SACL	* 
L48:
	.line	109
	SSXM
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L55
	.line	110
	SBRK	2
	LAC	* 
	BNZ	L56
	.line	111
	MAR	*+
	SPLK	#-1,* 
	.line	112
	LACK	1
	ADRK	2
	SACL	* 
L56:
	.line	114
	LARK	AR2,14
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L57
	.line	115
	LACK	0
	SACL	* 
L57:
	.line	118
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	119
	CALL	_DispClear
L55:
	.line	124
	LACK	0
	MAR	* ,AR2
	LARK	AR2,11
	MAR	*0+
	SACL	* 
	.line	125
	SSXM
	ADRK	5
	LAC	* 
	SUBK	3
	BNZ	L58
	.line	126
	SBRK	2
	LAC	* 
	BNZ	L59
	.line	127
	LACK	1
	SACL	* 
	.line	128
	SBRK	3
	SACL	* 
L59:
	.line	131
	LARK	AR2,14
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L60
	.line	132
	SBRK	3
	LAC	* 
	BNZ	L60
	.line	134
	ADRK	2
	LAC	*-,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+,AR2
	SBRK	15-LF14
	LAC	* ,AR1
	SACL	*+
	CALL	_SavePidValue
	SBRK	3
	.line	135
	LACK	42
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	136
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
L60:
	.line	141
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	142
	CALL	_DispClear
L58:
	.line	21
	SSXM
	MAR	* ,AR2
	LARK	AR2,17
	MAR	*0+
	LAC	* 
	SBRK	20-LF14
	MAR	* ,AR1
	BZ	L37
L38:
	.line	147
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	LAC	* 
EPI0_14:
	.line	148
	MAR	* ,AR1
	SBRK	19
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	419,000000000H,18

	.sym	_ResetPidConsts,_ResetPidConsts,32,2,0
	.globl	_ResetPidConsts

	.func	422
******************************************************
* FUNCTION DEF : _ResetPidConsts
******************************************************
_ResetPidConsts:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,14
	LAR	AR0,*0+,AR2

	.sym	_reset,1,50,1,192,,12
	.sym	_i,13,2,1,16
	.line	2
	LACK	82
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	115
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	68
	SACL	*+
	LACK	111
	SACL	*+
	LACK	110
	SACL	*+
	LACK	101
	SACL	*+
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	SACL	* 
	.line	4
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BGEZ	L63
L62:
	.line	5
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	6
	LAC	* ,AR1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	6
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	7
	LAC	* ,AR1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	7
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	8
	LAC	* ,AR1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	4
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BLZ	L62
L63:
	.line	9
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	10
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_15:
	.line	11
	SBRK	15
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	432,000000000H,14

	.sym	_ReadPidValueDisplay,_ReadPidValueDisplay,36,3,0

	.func	434
******************************************************
* FUNCTION DEF : _ReadPidValueDisplay
******************************************************
_ReadPidValueDisplay:

LF16	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_pidIndex,-3+LF16,2,9,16
	.sym	_motorIndex,-4+LF16,2,9,16
	.sym	_pidValue,1,4,1,16
	.line	2
	.line	4
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	5
	SSXM
	SBRK	4-LF16
	LAC	* 
	BNZ	L64
	.line	6
	MAR	*-
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	6
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
L64:
	.line	7
	SSXM
	LARK	AR2,-3+LF16
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L65
	.line	8
	MAR	*-
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	7
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
L65:
	.line	9
	SSXM
	LARK	AR2,-3+LF16
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L66
	.line	10
	MAR	*-
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	8
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
L66:
	.line	11
	SSXM
	LARK	AR2,1
	MAR	*0+
	LAC	* 
EPI0_16:
	.line	12
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	445,000000000H,2

	.sym	_SavePidValue,_SavePidValue,32,3,0

	.func	448
******************************************************
* FUNCTION DEF : _SavePidValue
******************************************************
_SavePidValue:

LF17	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF17,2,9,16
	.sym	_pidIndex,-4+LF17,2,9,16
	.sym	_pidValue,-5+LF17,2,9,16
	.line	2
	.line	3
	SSXM
	LARK	AR2,-4+LF17
	MAR	*0+
	LAC	* 
	BNZ	L67
	.line	4
	MAR	*+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	6
	LAC	* ,AR1
	SACL	*+,AR2
	SBRK	2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
L67:
	.line	5
	SSXM
	MAR	* ,AR2
	LARK	AR2,-4+LF17
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L68
	.line	6
	MAR	*+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	7
	LAC	* ,AR1
	SACL	*+,AR2
	SBRK	2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
L68:
	.line	7
	SSXM
	MAR	* ,AR2
	LARK	AR2,-4+LF17
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L69
	.line	8
	MAR	*+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	8
	LAC	* ,AR1
	SACL	*+,AR2
	SBRK	2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
L69:
EPI0_17:
	.line	9
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	456,000000000H,1
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	I$$DIV
	.end
