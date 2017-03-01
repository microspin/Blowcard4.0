*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include motorrunlogicfunctions.c C:\Users\SIVARA~1\AppData\Local\Temp\m
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\motorrunlogicfunctions.if motorrunlogicfunctions.asm C:\Users\SIVARA~1\AppData\Local\Temp\motorrunlogicfunctions.tmp 
	.port
	.bss	_motorCounter,1,1
	.bss	_integralErrorArray,5
	.file	"motorrunlogicfunctions.c"
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
	.file	"motorrunlogicfunctions.c"

	.sect	".cinit"
	.word	1,_motorCounter
	.word	0

	.sym	_motorCounter,_motorCounter,2,2,16
	.globl	_motorCounter
	.globl	_SecondaryMotorOn
	.word	IS1,_integralErrorArray
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
IS1	.set	5

	.sym	_integralErrorArray,_integralErrorArray,52,3,80,,5
	.text

	.sym	_CycleDisp,_CycleDisp,32,2,0
	.globl	_CycleDisp

	.func	15
******************************************************
* FUNCTION DEF : _CycleDisp
******************************************************
_CycleDisp:

LF1	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.sym	_motorCounter,-3+LF1,4,9,16
	.line	2
	.line	3
	LACK	32
	SACL	*+,AR2
	LARK	AR2,-3+LF1
	MAR	*0+
	LAC	* ,2,AR1
	ADLK	_motorNames+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	4
	LACK	64
	SACL	*+
	LACK	37
	SACL	*+,AR2
	LARK	AR2,-3+LF1
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	MAR	*+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
EPI0_1:
	.line	6
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	20,000000000H,1

	.sym	_RunLoopMotorSelectMenu,_RunLoopMotorSelectMenu,34,2,0
	.globl	_RunLoopMotorSelectMenu

	.func	22
******************************************************
* FUNCTION DEF : _RunLoopMotorSelectMenu
******************************************************
_RunLoopMotorSelectMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,17
	LAR	AR0,*0+,AR2

	.sym	_set,1,50,1,208,,13
	.sym	_index,14,2,1,16
	.sym	_key,15,2,1,16
	.sym	_selected,16,2,1,16
	.line	4
	LACK	83
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	108
	SACL	*+
	LACK	101
	SACL	*+
	LACK	99
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	77
	SACL	*+
	LACK	111
	SACL	*+
	LACK	116
	SACL	*+
	LACK	111
	SACL	*+
	LACK	114
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	SACL	*+
	.line	6
	SACL	*+
	.line	7
	SACL	* ,AR1
	.line	9
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	10
	CALL	_DispClear
	.line	12
	SSXM
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	BNZ	L2
	MAR	* ,AR1
L1:
	.line	14
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	15
	LACK	32
	SACL	*+,AR2
	LARK	AR2,14
	MAR	*0+
	LAC	* ,2,AR1
	ADLK	_motorNames+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	16
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	SACL	* 
	.line	17
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L3
	.line	18
	MAR	*-
	LAC	* 
	SUBK	5
	BNZ	L4
	.line	19
	LACK	0
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
	B	L3
L4:
	.line	23
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	24
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	25
	CALL	_DispClear
L3:
	.line	28
	SSXM
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L6
	.line	29
	MAR	*-
	LAC	* 
	BNZ	L7
	.line	30
	LACK	5
	SACL	* ,AR1
	.line	31
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	32
	CALL	_DispClear
	B	L6
L7:
	.line	34
	SUBK	1
	SACL	* ,AR1
	.line	35
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	36
	CALL	_DispClear
L6:
	.line	39
	SSXM
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L9
	.line	40
	MAR	*-
	SPLK	#-1,* 
	.line	41
	LACK	1
	ADRK	2
	SACL	* 
L9:
	.line	43
	LARK	AR2,15
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L10
	.line	44
	LACK	1
	MAR	*+
	SACL	* 
L10:
	.line	12
	LARK	AR2,16
	MAR	*0+
	LAC	* ,AR1
	BZ	L1
L2:
	.line	47
	MAR	* ,AR2
	SBRK	2
	LAC	* 
EPI0_2:
	.line	48
	MAR	* ,AR1
	SBRK	18
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	69,000000000H,17

	.sym	_RunLoopSetMotorSpeed,_RunLoopSetMotorSpeed,36,2,0
	.globl	_RunLoopSetMotorSpeed

	.func	72
******************************************************
* FUNCTION DEF : _RunLoopSetMotorSpeed
******************************************************
_RunLoopSetMotorSpeed:

LF3	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,35
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF3,2,9,16
	.sym	_param,-4+LF3,2,9,16
	.sym	_maxSpeedLimit,1,4,1,16
	.sym	_minSpeedLimit,2,4,1,16
	.sym	_currentSpeed,3,4,1,16
	.sym	_defaultSpeedLimit,4,4,1,16
	.sym	_speed,5,4,1,16
	.sym	_text,6,50,1,112,,7
	.sym	_tgt,13,50,1,64,,4
	.sym	_update,17,50,1,128,,8
	.sym	_spaces,25,50,1,128,,8
	.sym	_selected,33,2,1,16
	.sym	_key,34,2,1,16
	.line	2
	.line	4
	LARK	AR2,-3+LF3
	MAR	*0+
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR2
	ADRK	4-LF3
	SACL	* 
	.line	5
	SBRK	4-LF3
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	MAR	*+
	LAC	* ,AR2
	ADRK	5-LF3
	SACL	*+
	.line	6
	LACK	0
	SACL	* 
	.line	7
	SBRK	6-LF3
	LT	* ,AR0
	MPYK	9
	PAC
	ADLK	_U+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	2
	LAC	* ,AR2
	ADRK	7-LF3
	SACL	*+
	.line	8
	LACK	0
	SACL	*+
	.line	9
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	82
	SACL	*+
	LACK	80
	SACL	*+
	LACK	77
	SACL	*+
	LACK	0
	SACL	*+
	.line	10
	LACK	84
	SACL	*+
	LACK	103
	SACL	*+
	LACK	116
	SACL	*+
	LACK	0
	SACL	*+
	.line	11
	LACK	85
	SACL	*+
	LACK	112
	SACL	*+
	LACK	100
	SACL	*+
	LACK	97
	SACL	*+
	LACK	116
	SACL	*+
	LACK	101
	SACL	*+
	LACK	100
	SACL	*+
	LACK	0
	SACL	*+
	.line	12
	LACK	32
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	LACK	0
	SACL	*+
	.line	13
	SACL	*+
	.line	14
	SACL	* 
	.line	18
	SBRK	38-LF3
	LAC	* 
	SUBK	1
	BNZ	L11
	.line	19
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
	.line	20
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR2
	ADRK	6-LF3
	SACL	* 
L11:
	.line	22
	LARK	AR2,-4+LF3
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L12
	.line	23
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
	LARK	AR2,-3+LF3
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	SACL	* ,AR2
	.line	24
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR2
	ADRK	6-LF3
	SACL	* 
L12:
	.line	26
	LARK	AR2,-4+LF3
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L13
	.line	28
	MAR	*+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR2
	ADRK	6-LF3
	SACL	* 
L13:
	.line	31
	LARK	AR2,3
	MAR	*0+
	LAC	* 
	SBRK	2
	SUB	* 
	BGZ	LL5
	ADRK	2
	LAC	*-
	SUB	* 
	BGEZ	L14
LL5:
	.line	32
	LARK	AR2,4
	MAR	*0+
	LAC	*-
	SACL	* 
L14:
	.line	35
	LARK	AR2,3
	MAR	*0+
	LAC	* 
	ADRK	2
	SACL	* ,AR1
	.line	37
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	38
	CALL	_DispClear
	.line	40
	LACK	16
	SACL	*+,AR3
	LARK	AR3,6
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	41
	LACK	25
	SACL	*+,AR3
	LARK	AR3,13
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	43
	SSXM
	MAR	* ,AR2
	LARK	AR2,33
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L16
	SBRK	36-LF3
	MAR	* ,AR1
L15:
	.line	45
	LACK	64
	SACL	*+
	LACK	28
	SACL	*+,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	46
	LACK	64
	SACL	*+
	LACK	32
	SACL	*+,AR2
	LARK	AR2,5
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	47
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,34
	MAR	*0+
	SACL	* 
	.line	48
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L17
	.line	49
	SBRK	29
	LAC	* 
	SBRK	4
	SUB	* 
	BGEZ	L17
	.line	50
	ADRK	4
	LAC	* 
	ADDK	1
	SACL	* 
L17:
	.line	53
	LARK	AR2,34
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L19
	.line	54
	SBRK	29
	LAC	* 
	SBRK	3
	SUB	* 
	BLEZ	L19
	.line	55
	ADRK	3
	LAC	* 
	SUBK	1
	SACL	* 
L19:
	.line	57
	LARK	AR2,34
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L21
	.line	59
	SBRK	37-LF3
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	ADRK	8-LF3
	LAC	* ,AR3
	SACL	* ,AR1
	.line	60
	LACK	40
	SACL	*+,AR3
	LARK	AR3,17
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	61
	LACK	1
	SACL	*+
	LACK	300
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	62
	LACK	40
	SACL	*+,AR3
	LARK	AR3,25
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L21:
	.line	64
	SSXM
	MAR	* ,AR2
	LARK	AR2,34
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L22
	.line	65
	LACK	1
	MAR	*-
	SACL	* 
	.line	66
	SBRK	28
	SPLK	#-1,* 
L22:
	.line	68
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	43
	SSXM
	MAR	* ,AR2
	LARK	AR2,33
	MAR	*0+
	LAC	* 
	SUBK	1
	SBRK	36-LF3
	MAR	* ,AR1
	BNZ	L15
L16:
	.line	70
	MAR	* ,AR2
	LARK	AR2,5
	MAR	*0+
	LAC	* 
EPI0_3:
	.line	71
	MAR	* ,AR1
	SBRK	36
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	142,000000000H,35

	.sym	_UpdateMotorRpm,_UpdateMotorRpm,32,2,0
	.globl	_UpdateMotorRpm

	.func	145
******************************************************
* FUNCTION DEF : _UpdateMotorRpm
******************************************************
_UpdateMotorRpm:

LF4	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF4,2,9,16
	.sym	_numerator,1,5,1,32
	.line	2
	.line	10
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	SACH	* 
	.line	11
	SSXM
	SBRK	5-LF4
	LAC	* 
	SUBK	2
	BNZ	L23
	.line	14
	ADDK	2
	MAR	* ,AR1
	SACL	*+
	CALL	_GetRPM
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
	MAR	*+
	SACL	* 
	.line	16
	LDPK	_SecondaryMotorOn
	LAC	_SecondaryMotorOn
	BNZ	L24
	.line	18
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	MAR	*+
	ZALS	* 
	SUBK	300
	BGZ	L25
	.line	19
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L25
	.line	20
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L25:
	.line	23
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	MAR	*+
	ZALS	* 
	SUBK	300
	BLEZ	L27
	.line	24
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L27:
	.line	27
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF4
	SACL	*+
	SACH	*-,AR1
	.line	28
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF4
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L24:
	.line	31
	LAC	_SecondaryMotorOn
	SUBK	1
	BNZ	L23
	.line	33
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	MAR	*+
	ZALS	* ,AR3
	SUBS	* 
	BGZ	L29
	.line	34
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L29
	.line	35
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L29:
	.line	38
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	MAR	*+
	ZALS	* ,AR3
	SUBS	* 
	BLEZ	L31
	.line	39
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L31:
	.line	42
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF4
	SACL	*+
	SACH	*-,AR1
	.line	43
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF4
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L23:
	.line	47
	SSXM
	MAR	* ,AR2
	LAC	* 
	SUBK	5
	BNZ	L32
	.line	50
	ADDK	5
	MAR	* ,AR1
	SACL	*+
	CALL	_GetRPM
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
	MAR	*+
	SACL	* 
	.line	52
	LDPK	_SecondaryMotorOn
	LAC	_SecondaryMotorOn
	BNZ	L33
	.line	54
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	MAR	*+
	ZALS	* 
	SUBK	300
	BGZ	L34
	.line	55
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L34
	.line	56
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L34:
	.line	59
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	MAR	*+
	ZALS	* 
	SUBK	300
	BLEZ	L36
	.line	60
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L36:
	.line	63
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF4
	SACL	*+
	SACH	*-,AR1
	.line	64
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF4
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L33:
	.line	67
	LAC	_SecondaryMotorOn
	SUBK	1
	BNZ	L32
	.line	69
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	MAR	*+
	ZALS	* ,AR3
	SUBS	* 
	BGZ	L38
	.line	70
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L38
	.line	71
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L38:
	.line	74
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	MAR	*+
	ZALS	* ,AR3
	SUBS	* 
	BLEZ	L40
	.line	75
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L40:
	.line	78
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF4
	SACL	*+
	SACH	*-,AR1
	.line	79
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF4
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L32:
EPI0_4:
	.line	95
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	239,000000000H,3

	.sym	_UpdateMotorPwm,_UpdateMotorPwm,32,2,0
	.globl	_UpdateMotorPwm

	.func	242
******************************************************
* FUNCTION DEF : _UpdateMotorPwm
******************************************************
_UpdateMotorPwm:

LF5	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF5,2,9,16
	.sym	_numerator,1,5,1,32
	.line	2
	.line	3
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	SACH	* 
	.line	4
	SSXM
	SBRK	5-LF5
	LAC	* 
	SUBK	4
	BNZ	L41
	.line	6
	LDPK	_SecondaryMotorOn
	LAC	_SecondaryMotorOn
	BNZ	L41
	.line	8
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* 
	SUBK	10
	BGEZ	L43
	.line	9
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L43
	.line	10
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L43:
	.line	13
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* 
	SUBK	10
	BLEZ	L45
	.line	14
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	10
	BLEZ	L45
	.line	15
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L45:
	.line	19
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF5
	SACL	*+
	SACH	*-,AR1
	.line	20
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF5
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L41:
	.line	23
	SSXM
	MAR	* ,AR2
	LAC	* 
	SUBK	4
	BNZ	L47
	.line	25
	LDPK	_SecondaryMotorOn
	LAC	_SecondaryMotorOn
	SUBK	1
	BNZ	L47
	.line	27
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	12
	ZALS	* ,AR3
	SUBS	* 
	BGEZ	L49
	.line	28
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L49
	.line	29
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L49:
	.line	32
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	12
	ZALS	* ,AR3
	SUBS	* 
	BLEZ	L51
	.line	33
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	10
	BLEZ	L51
	.line	34
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L51:
	.line	38
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF5
	SACL	*+
	SACH	*-,AR1
	.line	39
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF5
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L47:
	.line	43
	SSXM
	MAR	* ,AR2
	LAC	* 
	SUBK	5
	BNZ	L53
	.line	45
	LDPK	_SecondaryMotorOn
	LAC	_SecondaryMotorOn
	BNZ	L53
	.line	47
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	LAC	* 
	BNZ	L55
	.line	48
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L55
	.line	49
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L55:
	.line	52
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* 
	SUBK	1
	BLEZ	L57
	.line	53
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	10
	BLEZ	L57
	.line	54
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L57:
	.line	58
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF5
	SACL	*+
	SACH	*-,AR1
	.line	59
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF5
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L53:
	.line	62
	SSXM
	MAR	* ,AR2
	LAC	* 
	SUBK	5
	BNZ	L59
	.line	64
	LDPK	_SecondaryMotorOn
	LAC	_SecondaryMotorOn
	SUBK	1
	BNZ	L59
	.line	66
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	12
	ZALS	* ,AR3
	SUBS	* 
	BGEZ	L61
	.line	67
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L61
	.line	68
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L61:
	.line	71
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	12
	ZALS	* ,AR3
	SUBS	* 
	BLEZ	L63
	.line	72
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	10
	BLEZ	L63
	.line	73
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L63:
	.line	77
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF5
	SACL	*+
	SACH	*-,AR1
	.line	78
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF5
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L59:
	.line	82
	SSXM
	MAR	* ,AR2
	LAC	* 
	SUBK	3
	BNZ	L65
	.line	84
	LDPK	_SecondaryMotorOn
	LAC	_SecondaryMotorOn
	BNZ	L65
	.line	86
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* 
	SUBK	10
	BGEZ	L67
	.line	87
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L67
	.line	88
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L67:
	.line	91
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* 
	SUBK	10
	BLEZ	L69
	.line	92
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	10
	BLEZ	L69
	.line	93
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L69:
	.line	97
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF5
	SACL	*+
	SACH	*-,AR1
	.line	98
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF5
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L65:
	.line	101
	SSXM
	MAR	* ,AR2
	LAC	* 
	SUBK	3
	BNZ	L71
	.line	103
	LDPK	_SecondaryMotorOn
	LAC	_SecondaryMotorOn
	SUBK	1
	BNZ	L71
	.line	105
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	12
	ZALS	* ,AR3
	SUBS	* 
	BGEZ	L73
	.line	106
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	3600
	BGZ	L73
	.line	107
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	6
	LAC	* ,AR4
	ADRK	11
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L73:
	.line	110
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	12
	ZALS	* ,AR3
	SUBS	* 
	BLEZ	L75
	.line	111
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* 
	SUBK	10
	BLEZ	L75
	.line	112
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	11
	LAC	* ,AR3
	ADRK	6
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L75:
	.line	116
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF5
	SACL	*+
	SACH	*-,AR1
	.line	117
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF5
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L71:
EPI0_5:
	.line	121
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	362,000000000H,3

	.sym	_CheckAllMotors,_CheckAllMotors,34,2,0
	.globl	_CheckAllMotors

	.func	364
******************************************************
* FUNCTION DEF : _CheckAllMotors
******************************************************
_CheckAllMotors:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_allMotorsOn1,1,2,1,16
	.line	4
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* ,AR3
	.line	5
	LRLK	AR3,_M+0
	ZALS	* ,AR4
	SUBK	50
	LRLK	AR4,_M+1
	ANDK	0FFFFh
	SUBS	* 
	BGZ	L77
	.line	9
	LACK	1
	MAR	* ,AR2
	SACL	* 
L77:
	.line	11
	SSXM
	MAR	* ,AR2
	LAC	* 
EPI0_6:
	.line	12
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	375,000000000H,2

	.sym	_ApplyPwms,_ApplyPwms,32,2,0
	.globl	_ApplyPwms

	.func	377
******************************************************
* FUNCTION DEF : _ApplyPwms
******************************************************
_ApplyPwms:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	7
	LRLK	AR3,_M+11
	ZALS	* 
	SUBK	3600
	BGZ	L78
	LRLK	AR4,_M+11
	MAR	* ,AR4
	ZALS	* 
	SUBK	10
	BLZ	L78
	.line	8
	LRLK	AR5,_M+11
	LARK	AR4,29720
	SSXM
	MAR	* ,AR5
	LAC	* ,AR4
	SACL	* 
L78:
	.line	10
	LRLK	AR4,_M+31
	MAR	* ,AR4
	ZALS	* 
	SUBK	3600
	BGZ	L79
	LRLK	AR5,_M+31
	MAR	* ,AR5
	ZALS	* 
	SUBK	10
	BLZ	L79
	.line	11
	LRLK	AR5,_M+31
	LARK	AR4,29721
	SSXM
	LAC	* ,AR4
	SACL	* 
L79:
	.line	13
	LRLK	AR4,_M+51
	MAR	* ,AR4
	ZALS	* 
	SUBK	3600
	BGZ	L80
	LRLK	AR5,_M+51
	MAR	* ,AR5
	ZALS	* 
	SUBK	10
	BLZ	L80
	.line	14
	LRLK	AR5,_M+51
	LARK	AR4,29719
	SSXM
	LAC	* ,AR4
	SACL	* 
L80:
	.line	16
	LRLK	AR4,_M+71
	MAR	* ,AR4
	ZALS	* 
	SUBK	3600
	BGZ	L81
	LRLK	AR5,_M+71
	MAR	* ,AR5
	ZALS	* 
	SUBK	10
	BLZ	L81
	.line	17
	LRLK	AR5,_M+71
	LARK	AR4,29702
	SSXM
	LAC	* ,AR4
	SACL	* 
L81:
	.line	19
	LRLK	AR4,_M+91
	MAR	* ,AR4
	ZALS	* 
	SUBK	3600
	BGZ	L82
	LRLK	AR5,_M+91
	MAR	* ,AR5
	ZALS	* 
	SUBK	10
	BLZ	L82
	.line	20
	LRLK	AR5,_M+91
	LARK	AR4,29958
	SSXM
	LAC	* ,AR4
	SACL	* 
L82:
	.line	22
	LRLK	AR4,_M+111
	MAR	* ,AR4
	ZALS	* 
	SUBK	3600
	BGZ	L83
	LRLK	AR5,_M+111
	MAR	* ,AR5
	ZALS	* 
	SUBK	10
	BLZ	L83
	.line	23
	LRLK	AR5,_M+111
	LARK	AR4,29698
	SSXM
	LAC	* ,AR4
	SACL	* 
L83:
EPI0_7:
	.line	24
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	400,000000000H,1

	.sym	_UpdateMotorPID,_UpdateMotorPID,32,2,0
	.globl	_UpdateMotorPID

	.func	403
******************************************************
* FUNCTION DEF : _UpdateMotorPID
******************************************************
_UpdateMotorPID:

LF8	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,4
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF8,2,9,16
	.sym	_numerator,1,5,1,32
	.sym	_calcPwm,3,14,1,16
	.line	3
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	SACH	*+
	.line	4
	SACL	* 
	.line	6
	SSXM
	SBRK	6-LF8
	LAC	* 
	SUBK	3
	BGEZ	L84
	.line	7
	ADDK	3
	MAR	* ,AR1
	SACL	*+
	CALL	_GetRPM
	MAR	*-
	SACL	* ,AR2
	LARK	AR2,-3+LF8
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	MAR	*+
	SACL	* ,AR2
	.line	10
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	8
	ZALS	* ,AR3
	SUBS	* 
	BGZ	L85
	.line	12
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	ADRK	8
	LAC	* ,AR1
	ADDK	2
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	8
	SACL	* 
L85:
	.line	15
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	8
	ZALS	* ,AR3
	SUBS	* 
	BLEZ	L86
	.line	17
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	ADRK	8
	LAC	* ,AR1
	SUBK	2
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	8
	SACL	* 
L86:
	.line	20
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	8
	LAC	* ,AR3
	MAR	*+
	SUB	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	9
	SACL	* ,AR2
	.line	22
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	ADRK	9
	LAC	* 
	SUBK	350
	BLZ	L87
	.line	25
	MAR	* ,AR2
	BLDD	* ,#_OV+3
	.line	26
	LACK	1
	LDPK	_OV+2
	SACL	_OV+2
L87:
	.line	35
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	10
	LAC	* 
	SUBK	-10000
	BGZ	L88
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	10
	LAC	* 
	ADDK	100
	SACL	* 
L88:
	.line	36
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	10
	LAC	* 
	SUBK	10000
	BLZ	L89
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	10
	LAC	* 
	SUBK	100
	SACL	* 
L89:
	.line	37
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	10
	LAC	* 
	SUBK	10000
	BGEZ	L90
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	10
	LAC	* 
	SUBK	-10000
	BLEZ	L90
	.line	38
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	9
	LAC	* ,AR4
	ADRK	10
	ADD	* ,AR1
	SACL	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	10
	SACL	* 
L90:
	.line	45
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	10
	LAC	* ,AR1
	CALL	F$$ITOF
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	15
	LAC	*+,AR1
	SACL	*+,AR3
	LAC	*-,AR1
	SACL	*+
	CALL	F$$MUL
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	ADRK	9
	LAC	* ,AR1
	CALL	F$$ITOF
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	13
	LAC	*+,AR1
	SACL	*+,AR3
	LAC	*-,AR1
	SACL	*+
	CALL	F$$MUL
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	ADRK	8
	LAC	* ,AR1
	CALL	F$$ITOF
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	17
	LAC	*+,AR1
	SACL	*+,AR3
	LAC	*-,AR1
	SACL	*+
	CALL	F$$MUL
	CALL	F$$ADD
	CALL	F$$ADD
	CALL	F$$FTOU
	MAR	* ,AR2
	ADRK	6-LF8
	SACL	* 
	.line	46
	ZALS	* 
	SUBK	3600
	BGZ	L91
	.line	47
	SBRK	6-LF8
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	ADRK	6-LF8
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L91:
	.line	50
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	SBRK	6-LF8
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$FTOL
	MAR	* ,AR2
	ADRK	4-LF8
	SACL	*+
	SACH	*-,AR1
	.line	51
	LACK	4000
	SACL	*+
	SACH	*+,AR2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	5-LF8
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	12
	SACL	* 
L84:
EPI0_8:
	.line	54
	MAR	* ,AR1
	SBRK	5
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	456,000000000H,4

	.sym	_ResetIntegralErrorArray,_ResetIntegralErrorArray,32,2,0
	.globl	_ResetIntegralErrorArray

	.func	457
******************************************************
* FUNCTION DEF : _ResetIntegralErrorArray
******************************************************
_ResetIntegralErrorArray:
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
	BGEZ	L93
L92:
	.line	4
	LAC	* ,AR0
	RSXM
	ADLK	_integralErrorArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	SACL	* ,AR2
	.line	3
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BLZ	L92
L93:
EPI0_9:
	.line	5
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	461,000000000H,2
*************************************************
* DEFINE FLOATING POINT CONSTANTS               *
*************************************************
	.text
FL0:	.float	1.e2
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	F$$UTOF
	.global	F$$MUL
	.global	F$$FTOL
	.global	L$$DIVS
	.global	F$$ITOF
	.global	F$$ADD
	.global	F$$FTOU
	.end
