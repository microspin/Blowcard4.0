*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include menufunctions.c C:\Users\SIVARA~1\AppData\Local\Temp\menufuncti
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\menufunctions.if menufunctions.asm C:\Users\SIVARA~1\AppData\Local\Temp\menufunctions.tmp 
	.port
	.bss	_displayArray$6,10,1
	.bss	_logs$9,10
	.bss	_logs$7,15
	.bss	_displayArray$4,20
	.bss	_displayArray$1,30
	.bss	_displayArray$5,30
	.bss	_displayArray$2,36
	.bss	_displayArray$3,88
	.file	"menufunctions.c"
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
	.file	"menufunctions.c"
	.text

	.sym	_TopLevelMenu,_TopLevelMenu,34,2,0
	.globl	_TopLevelMenu

	.func	13
******************************************************
* FUNCTION DEF : _TopLevelMenu
******************************************************
_TopLevelMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,4
	LAR	AR0,*0+,AR2


	.sect	".cinit"
	.word	IS1,_displayArray$1
	.word	83
	.word	116
	.word	97
	.word	114
	.word	116
	.word	77
	.word	47
	.word	67
	.word	0
	.space	16
	.word	83
	.word	101
	.word	116
	.word	116
	.word	105
	.word	110
	.word	103
	.word	115
	.word	0
	.space	16
	.word	84
	.word	111
	.word	111
	.word	108
	.word	115
	.word	0
IS1	.set	26
	.text

	.sym	_displayArray,_displayArray$1,242,3,480,,3,10
	.sym	_index,1,2,1,16
	.sym	_key,2,2,1,16
	.sym	_selected,3,2,1,16
	.line	6
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	7
	SACL	*+
	.line	8
	SACL	* ,AR1
	.line	10
	CALL	_DispClear
	.line	12
	SSXM
	MAR	* ,AR2
	LARK	AR2,3
	MAR	*0+
	LAC	* 
	BNZ	L2
	SBRK	2
	MAR	* ,AR1
L1:
	.line	14
	LACK	16
	SACL	*+,AR2
	LT	* ,AR1
	MPYK	10
	PAC
	ADLK	_displayArray$1+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	15
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	16
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L3
	.line	17
	MAR	*-
	LAC	* 
	SUBK	4
	BNZ	L4
	.line	18
	LACK	0
	SACL	* ,AR1
	.line	19
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	20
	CALL	_DispClear
	B	L3
L4:
	.line	22
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	23
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	24
	CALL	_DispClear
L3:
	.line	26
	SSXM
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L6
	.line	27
	MAR	*-
	LAC	* 
	BNZ	L7
	.line	28
	LACK	4
	SACL	* ,AR1
	.line	29
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	30
	CALL	_DispClear
	B	L6
L7:
	.line	32
	SUBK	1
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
L6:
	.line	36
	SSXM
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	SUBK	3
	BZ	LL3
	LAC	* 
	SUBK	5
	BNZ	L9
LL3:
	.line	37
	LACK	1
	MAR	*+
	SACL	* 
L9:
	.line	12
	LARK	AR2,3
	MAR	*0+
	LAC	* 
	SBRK	2
	MAR	* ,AR1
	BZ	L1
L2:
	.line	41
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
EPI0_1:
	.line	42
	MAR	* ,AR1
	SBRK	5
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	54,000000000H,4

	.sym	_MachineParametersMenu,_MachineParametersMenu,34,2,0
	.globl	_MachineParametersMenu

	.func	57
******************************************************
* FUNCTION DEF : _MachineParametersMenu
******************************************************
_MachineParametersMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,8
	LAR	AR0,*0+,AR2


	.sect	".cinit"
	.word	IS2,_displayArray$2
	.word	77
	.word	111
	.word	116
	.word	111
	.word	114
	.word	82
	.word	112
	.word	109
	.word	0
	.word	79
	.word	118
	.word	114
	.word	108
	.word	100
	.word	65
	.word	109
	.word	112
	.word	0
	.word	79
	.word	118
	.word	114
	.word	108
	.word	100
	.word	109
	.word	83
	.word	0
	.space	16
	.word	80
	.word	73
	.word	68
	.word	67
	.word	110
	.word	115
	.word	116
	.word	0
IS2	.set	35
	.text

	.sym	_displayArray,_displayArray$2,242,3,576,,4,9
	.sym	_set,1,50,1,64,,4
	.sym	_index,5,2,1,16
	.sym	_key,6,2,1,16
	.sym	_selected,7,2,1,16
	.line	3
	LACK	83
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	101
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
	SACL	* ,AR1
	.line	8
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	9
	CALL	_DispClear
	.line	11
	SSXM
	MAR	* ,AR2
	LARK	AR2,7
	MAR	*0+
	LAC	* 
	BNZ	L11
	MAR	* ,AR1
L10:
	.line	13
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
	LARK	AR2,5
	MAR	*0+
	LT	* ,AR1
	MPYK	9
	PAC
	ADLK	_displayArray$2+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	16
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,6
	MAR	*0+
	SACL	* 
	.line	17
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L12
	.line	18
	MAR	*-
	LAC	* 
	SUBK	3
	BNZ	L13
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
	B	L12
L13:
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
L12:
	.line	28
	SSXM
	MAR	* ,AR2
	LARK	AR2,6
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L15
	.line	29
	MAR	*-
	LAC	* 
	BNZ	L16
	.line	30
	LACK	3
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
	B	L15
L16:
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
L15:
	.line	39
	SSXM
	MAR	* ,AR2
	LARK	AR2,6
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L18
	.line	40
	LACK	4
	MAR	*-
	SACL	* 
	.line	41
	LACK	1
	ADRK	2
	SACL	* 
L18:
	.line	44
	LARK	AR2,6
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L19
	.line	45
	LACK	1
	MAR	*+
	SACL	* 
L19:
	.line	11
	LARK	AR2,7
	MAR	*0+
	LAC	* ,AR1
	BZ	L10
L11:
	.line	48
	MAR	* ,AR2
	SBRK	2
	LAC	* 
EPI0_2:
	.line	49
	MAR	* ,AR1
	SBRK	9
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	105,000000000H,8

	.sym	_MotorSelectMenu,_MotorSelectMenu,34,2,0
	.globl	_MotorSelectMenu

	.func	107
******************************************************
* FUNCTION DEF : _MotorSelectMenu
******************************************************
_MotorSelectMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,17
	LAR	AR0,*0+,AR2


	.sect	".cinit"
	.word	IS3,_displayArray$3
	.word	67
	.word	121
	.word	108
	.word	105
	.word	110
	.word	100
	.word	101
	.word	114
	.word	0
	.space	32
	.word	66
	.word	101
	.word	97
	.word	116
	.word	101
	.word	114
	.word	0
	.space	64
	.word	84
	.word	101
	.word	110
	.word	115
	.word	105
	.word	111
	.word	110
	.word	32
	.word	68
	.word	70
	.word	0
	.word	67
	.word	121
	.word	108
	.word	70
	.word	101
	.word	101
	.word	100
	.word	0
	.space	48
	.word	66
	.word	116
	.word	114
	.word	70
	.word	101
	.word	101
	.word	100
	.word	0
	.space	48
	.word	67
	.word	108
	.word	114
	.word	32
	.word	77
	.word	116
	.word	47
	.word	109
	.word	105
	.word	110
	.word	0
	.word	82
	.word	101
	.word	115
	.word	101
	.word	116
	.word	65
	.word	108
	.word	108
	.word	0
	.space	32
	.word	68
	.word	101
	.word	108
	.word	97
	.word	121
	.word	0
IS3	.set	83
	.text

	.sym	_displayArray,_displayArray$3,242,3,1408,,8,11
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
	BNZ	L21
	SBRK	2
L20:
	.line	14
	LAC	* 
	SUBK	7
	BZ	L22
	.line	15
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L22:
	.line	17
	MAR	* ,AR1
	LACK	32
	SACL	*+,AR2
	LARK	AR2,14
	MAR	*0+
	LT	* ,AR1
	MPYK	11
	PAC
	ADLK	_displayArray$3+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	18
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	SACL	* 
	.line	19
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L23
	.line	20
	MAR	*-
	LAC	* 
	SUBK	7
	BNZ	L24
	.line	21
	LACK	0
	SACL	* ,AR1
	.line	22
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	23
	CALL	_DispClear
	B	L23
L24:
	.line	25
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	26
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	27
	CALL	_DispClear
L23:
	.line	30
	SSXM
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L26
	.line	31
	MAR	*-
	LAC	* 
	BNZ	L27
	.line	32
	LACK	7
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
L27:
	.line	36
	SUBK	1
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
L26:
	.line	41
	SSXM
	MAR	* ,AR2
	LARK	AR2,15
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L29
	.line	42
	MAR	*-
	SPLK	#-1,* 
	.line	43
	LACK	1
	ADRK	2
	SACL	* 
L29:
	.line	45
	LARK	AR2,15
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L30
	.line	46
	LACK	1
	MAR	*+
	SACL	* 
	.line	47
	SBRK	2
	LAC	* 
	SUBK	6
	BNZ	L30
	.line	48
	SPLK	#-3,* 
L30:
	.line	12
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SBRK	2
	BZ	L20
L21:
	.line	51
	LARK	AR2,14
	MAR	*0+
	LAC	* 
EPI0_3:
	.line	52
	MAR	* ,AR1
	SBRK	18
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	158,000000000H,17

	.sym	_SensorSelectMenu,_SensorSelectMenu,34,2,0
	.globl	_SensorSelectMenu

	.func	161
******************************************************
* FUNCTION DEF : _SensorSelectMenu
******************************************************
_SensorSelectMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,18
	LAR	AR0,*0+,AR2


	.sect	".cinit"
	.word	IS4,_displayArray$4
	.word	68
	.word	111
	.word	111
	.word	114
	.word	115
	.word	101
	.word	110
	.word	115
	.word	0
	.space	16
	.word	83
	.word	108
	.word	105
	.word	118
	.word	101
	.word	114
	.word	115
	.word	101
	.word	110
	.word	115
IS4	.set	20
	.text

	.sym	_displayArray,_displayArray$4,242,3,320,,2,10
	.sym	_set,1,50,1,224,,14
	.sym	_index,15,2,1,16
	.sym	_key,16,2,1,16
	.sym	_selected,17,2,1,16
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
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	110
	SACL	*+
	LACK	115
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
	LARK	AR2,17
	MAR	*0+
	LAC	* 
	BNZ	L33
	SBRK	2
L32:
	.line	14
	LAC	* 
	SUBK	3
	BZ	L34
	.line	15
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L34:
	.line	17
	MAR	* ,AR1
	LACK	32
	SACL	*+,AR2
	LARK	AR2,15
	MAR	*0+
	LT	* ,AR1
	MPYK	10
	PAC
	ADLK	_displayArray$4+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	18
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	SACL	* 
	.line	19
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L35
	.line	20
	MAR	*-
	LAC	* 
	SUBK	3
	BNZ	L36
	.line	21
	LACK	0
	SACL	* ,AR1
	.line	22
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	23
	CALL	_DispClear
	B	L35
L36:
	.line	25
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	26
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	27
	CALL	_DispClear
L35:
	.line	30
	SSXM
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L38
	.line	31
	MAR	*-
	LAC	* 
	BNZ	L39
	.line	32
	LACK	3
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
	B	L38
L39:
	.line	36
	SUBK	1
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
L38:
	.line	41
	SSXM
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L41
	.line	42
	MAR	*-
	SPLK	#-1,* 
	.line	43
	LACK	1
	ADRK	2
	SACL	* 
L41:
	.line	45
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L42
	.line	46
	LACK	1
	MAR	*+
	SACL	* 
L42:
	.line	12
	LARK	AR2,17
	MAR	*0+
	LAC	* 
	SBRK	2
	BZ	L32
L33:
	.line	51
	LARK	AR2,15
	MAR	*0+
	LAC	* 
EPI0_4:
	.line	52
	MAR	* ,AR1
	SBRK	19
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	212,000000000H,18

	.sym	_ToolsMenu,_ToolsMenu,34,2,0
	.globl	_ToolsMenu

	.func	214
******************************************************
* FUNCTION DEF : _ToolsMenu
******************************************************
_ToolsMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,10
	LAR	AR0,*0+,AR2


	.sect	".cinit"
	.word	IS5,_displayArray$5
	.word	84
	.word	101
	.word	115
	.word	116
	.word	77
	.word	111
	.word	116
	.word	111
	.word	114
	.word	0
	.word	76
	.word	111
	.word	103
	.word	79
	.word	112
	.word	116
	.word	110
	.word	115
	.word	0
	.space	16
	.word	83
	.word	116
	.word	101
	.word	112
	.word	112
	.word	116
	.word	101
	.word	115
	.word	116
	.word	0
IS5	.set	30
	.text

	.sym	_displayArray,_displayArray$5,242,3,480,,3,10
	.sym	_set,1,50,1,96,,6
	.sym	_index,7,2,1,16
	.sym	_key,8,2,1,16
	.sym	_selected,9,2,1,16
	.line	3
	LACK	71
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	111
	SACL	*+
	LACK	32
	SACL	*+
	LACK	84
	SACL	*+
	LACK	111
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*+
	.line	6
	SACL	* ,AR1
	.line	7
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	8
	CALL	_DispClear
	.line	10
	SSXM
	MAR	* ,AR2
	LARK	AR2,9
	MAR	*0+
	LAC	* 
	BNZ	L44
	MAR	* ,AR1
L43:
	.line	14
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	17
	LACK	32
	SACL	*+,AR2
	LARK	AR2,7
	MAR	*0+
	LT	* ,AR1
	MPYK	10
	PAC
	ADLK	_displayArray$5+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	18
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,8
	MAR	*0+
	SACL	* 
	.line	19
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L45
	.line	20
	MAR	*-
	LAC	* 
	SUBK	2
	BNZ	L46
	.line	21
	LACK	0
	SACL	* ,AR1
	.line	22
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	23
	CALL	_DispClear
	B	L45
L46:
	.line	25
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	26
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	27
	CALL	_DispClear
L45:
	.line	29
	SSXM
	MAR	* ,AR2
	LARK	AR2,8
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L48
	.line	30
	MAR	*-
	LAC	* 
	BNZ	L49
	.line	31
	LACK	2
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
	B	L48
L49:
	.line	35
	SUBK	1
	SACL	* ,AR1
	.line	36
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	37
	CALL	_DispClear
L48:
	.line	39
	SSXM
	MAR	* ,AR2
	LARK	AR2,8
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L51
	.line	40
	MAR	*-
	SPLK	#-2,* 
	.line	41
	LACK	1
	ADRK	2
	SACL	* ,AR1
	.line	42
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
L51:
	.line	44
	SSXM
	MAR	* ,AR2
	LARK	AR2,8
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L52
	.line	45
	LACK	1
	MAR	*+
	SACL	* ,AR1
	.line	46
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
L52:
	.line	10
	SSXM
	MAR	* ,AR2
	LARK	AR2,9
	MAR	*0+
	LAC	* ,AR1
	BZ	L43
L44:
	.line	52
	MAR	* ,AR2
	SBRK	2
	LAC	* 
EPI0_5:
	.line	53
	MAR	* ,AR1
	SBRK	11
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	266,000000000H,10

	.sym	_FactorysettingsMenu,_FactorysettingsMenu,34,2,0
	.globl	_FactorysettingsMenu

	.func	268
******************************************************
* FUNCTION DEF : _FactorysettingsMenu
******************************************************
_FactorysettingsMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,10
	LAR	AR0,*0+,AR2


	.sect	".cinit"
	.word	IS6,_displayArray$6
	.word	83
	.word	101
	.word	110
	.word	115
	.word	111
	.word	114
	.word	115
	.word	101
	.word	116
	.word	0
IS6	.set	10
	.text

	.sym	_displayArray,_displayArray$6,242,3,160,,1,10
	.sym	_set,1,50,1,96,,6
	.sym	_index,7,2,1,16
	.sym	_key,8,2,1,16
	.sym	_selected,9,2,1,16
	.line	3
	LACK	71
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	111
	SACL	*+
	LACK	32
	SACL	*+
	LACK	84
	SACL	*+
	LACK	111
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*+
	.line	6
	SACL	* ,AR1
	.line	7
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	8
	CALL	_DispClear
	.line	10
	SSXM
	MAR	* ,AR2
	LARK	AR2,9
	MAR	*0+
	LAC	* 
	BNZ	L54
	MAR	* ,AR1
L53:
	.line	14
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	17
	LACK	32
	SACL	*+,AR2
	LARK	AR2,7
	MAR	*0+
	LT	* ,AR1
	MPYK	10
	PAC
	ADLK	_displayArray$6+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	18
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,8
	MAR	*0+
	SACL	* 
	.line	19
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L55
	.line	20
	MAR	*-
	LAC	* 
	SUBK	1
	BNZ	L56
	.line	21
	LACK	0
	SACL	* ,AR1
	.line	22
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	23
	CALL	_DispClear
	B	L55
L56:
	.line	25
	LAC	* 
	ADDK	1
	SACL	* ,AR1
	.line	26
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	27
	CALL	_DispClear
L55:
	.line	29
	SSXM
	MAR	* ,AR2
	LARK	AR2,8
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L58
	.line	30
	MAR	*-
	LAC	* 
	BNZ	L59
	.line	31
	LACK	1
	SACL	* ,AR1
	.line	32
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	33
	CALL	_DispClear
	B	L58
L59:
	.line	35
	SUBK	1
	SACL	* ,AR1
	.line	36
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	37
	CALL	_DispClear
L58:
	.line	39
	SSXM
	MAR	* ,AR2
	LARK	AR2,8
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L61
	.line	40
	MAR	*-
	SPLK	#-2,* 
	.line	41
	LACK	1
	ADRK	2
	SACL	* ,AR1
	.line	42
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
L61:
	.line	44
	SSXM
	MAR	* ,AR2
	LARK	AR2,8
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L62
	.line	45
	LACK	1
	MAR	*+
	SACL	* ,AR1
	.line	46
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	47
	SSXM
	MAR	* ,AR2
	LARK	AR2,7
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L62
	.line	48
	SPLK	#-2,* 
L62:
	.line	10
	LARK	AR2,9
	MAR	*0+
	LAC	* ,AR1
	BZ	L53
L54:
	.line	52
	MAR	* ,AR2
	SBRK	2
	LAC	* 
EPI0_6:
	.line	53
	MAR	* ,AR1
	SBRK	11
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	320,000000000H,10

	.sym	_DataloggingMenu,_DataloggingMenu,34,2,0
	.globl	_DataloggingMenu

	.func	325
******************************************************
* FUNCTION DEF : _DataloggingMenu
******************************************************
_DataloggingMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,33
	LAR	AR0,*0+,AR3


	.sect	".cinit"
	.word	IS7,_logs$7
	.word	82
	.word	80
	.word	77
	.word	0
	.space	16
	.word	67
	.word	82
	.word	78
	.word	84
	.word	0
	.word	80
	.word	87
	.word	77
	.word	0
IS7	.set	14
	.text

	.sym	_logs,_logs$7,242,3,240,,3,5

	.sect	".const"
	.sblock	".const"
.init0$8$$1:
	.word	48
	.word	50
	.word	52
	.text
	.sym	_eeprom,1,52,1,48,,3
	.sym	_displayArray,4,50,1,192,,12
	.sym	_saved,16,50,1,96,,6
	.sym	_star,22,50,1,32,,2
	.sym	_clear,24,50,1,32,,2
	.sym	_enteredLoop,26,2,1,16
	.sym	_parameter,27,2,1,16
	.sym	_parameterValue,28,2,1,16
	.sym	_changeParameters,29,2,1,16
	.sym	_index,30,2,1,16
	.sym	_key,31,2,1,16
	.sym	_selected,32,2,1,16
	.line	4
	LARK	AR3,1
	MAR	*0+
	RPTK	2
	BLKD	.init0$8$$1+0,*+
	.line	5
	LACK	76
	MAR	* ,AR2
	LARK	AR2,4
	MAR	*0+
	SACL	*+
	LACK	111
	SACL	*+
	LACK	103
	SACL	*+
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	SACL	*+
	LACK	105
	SACL	*+
	LACK	110
	SACL	*+
	LACK	103
	SACL	*+
	LACK	115
	SACL	*+
	LACK	0
	SACL	*+
	.line	6
	LACK	83
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
	.line	7
	LACK	42
	SACL	*+
	LACK	0
	SACL	*+
	.line	8
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	9
	SACL	*+
	.line	13
	SACL	*+
	.line	14
	SACL	*+
	.line	15
	SACL	*+
	.line	16
	SACL	*+
	.line	17
	SACL	*+
	.line	18
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
	MAR	* ,AR2
	LARK	AR2,27
	MAR	*0+
	LAR	AR3,* ,AR3
	MAR	*0+
	MAR	*+
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,28
	MAR	*0+
	SACL	* 
	.line	25
	SSXM
	ADRK	4
	LAC	* 
	BNZ	L65
	MAR	* ,AR1
L64:
	.line	27
	LACK	16
	SACL	*+,AR3
	LARK	AR3,4
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	28
	LACK	32
	SACL	*+,AR2
	LARK	AR2,27
	MAR	*0+
	LT	* ,AR1
	MPYK	5
	PAC
	ADLK	_logs$7+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	36
	LACK	32
	SACL	*+
	LACK	37
	SACL	*+,AR2
	LARK	AR2,28
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	38
	SSXM
	MAR	* ,AR2
	LARK	AR2,29
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L66
	.line	39
	MAR	* ,AR1
	LACK	47
	SACL	*+,AR3
	LARK	AR3,22
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	40
	LACK	31
	SACL	*+,AR3
	LARK	AR3,24
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L66:
	.line	42
	SSXM
	MAR	* ,AR2
	LARK	AR2,29
	MAR	*0+
	LAC	* 
	BNZ	L67
	.line	43
	MAR	* ,AR1
	LACK	47
	SACL	*+,AR3
	LARK	AR3,24
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	44
	LACK	31
	SACL	*+,AR3
	LARK	AR3,22
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L67:
	.line	48
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,31
	MAR	*0+
	SACL	* 
	.line	52
	SSXM
	SBRK	2
	LAC	* 
	SUBK	1
	BNZ	L68
	.line	53
	ADRK	2
	LAC	* 
	SUBK	1
	BZ	LL11
	LAC	* 
	SUBK	2
	BNZ	L68
LL11:
	.line	54
	SBRK	3
	LAC	* 
	LARK	AR3,1
	BZ	LL12
	LARK	AR3,0
LL12:
	SAR	AR3,* ,AR1
	.line	55
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
L68:
	.line	57
	SSXM
	MAR	* ,AR2
	LARK	AR2,29
	MAR	*0+
	LAC	* 
	BNZ	L70
	.line	58
	ADRK	2
	LAC	* 
	SUBK	1
	BNZ	L71
	.line	59
	SBRK	4
	LAC	* 
	SUBK	2
	BNZ	L72
	.line	60
	LACK	0
	SACL	* ,AR1
	.line	61
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	62
	CALL	_DispClear
	B	L73
L72:
	.line	65
	LAC	* 
	ADDK	1
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
L73:
	.line	69
	MAR	* ,AR2
	LARK	AR2,27
	MAR	*0+
	LAR	AR3,* ,AR3
	MAR	*0+
	MAR	*+
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,28
	MAR	*0+
	SACL	* 
L71:
	.line	73
	SSXM
	LARK	AR2,31
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L70
	.line	74
	SBRK	4
	LAC	* 
	BNZ	L75
	.line	75
	LACK	2
	SACL	* ,AR1
	.line	76
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	77
	CALL	_DispClear
	B	L76
L75:
	.line	80
	SUBK	1
	SACL	* ,AR1
	.line	81
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	82
	CALL	_DispClear
L76:
	.line	84
	MAR	* ,AR2
	LARK	AR2,27
	MAR	*0+
	LAR	AR3,* ,AR3
	MAR	*0+
	MAR	*+
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,28
	MAR	*0+
	SACL	* 
L70:
	.line	91
	SSXM
	LARK	AR2,31
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L77
	.line	92
	SBRK	2
	LAC	* 
	BNZ	L78
	.line	93
	MAR	*+
	SPLK	#-1,* 
	.line	94
	LACK	1
	ADRK	2
	SACL	* 
L78:
	.line	96
	LARK	AR2,29
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L79
	.line	97
	LACK	0
	SACL	* 
L79:
	.line	100
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	101
	CALL	_DispClear
L77:
	.line	106
	LACK	0
	MAR	* ,AR2
	LARK	AR2,26
	MAR	*0+
	SACL	* 
	.line	107
	SSXM
	ADRK	5
	LAC	* 
	SUBK	3
	BNZ	L80
	.line	108
	SBRK	2
	LAC	* 
	BNZ	L81
	.line	109
	LACK	1
	SACL	* 
	.line	110
	SBRK	3
	SACL	* 
L81:
	.line	113
	LARK	AR2,29
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L82
	.line	114
	SBRK	3
	LAC	* 
	BNZ	L82
	.line	116
	MAR	*+
	LAR	AR3,*+,AR3
	MAR	*0+
	MAR	*+
	LAC	* ,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	117
	LACK	42
	SACL	*+,AR3
	LARK	AR3,16
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	118
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
L82:
	.line	123
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	124
	CALL	_DispClear
L80:
	.line	25
	SSXM
	MAR	* ,AR2
	LARK	AR2,32
	MAR	*0+
	LAC	* ,AR1
	BZ	L64
L65:
	.line	129
	MAR	* ,AR2
	SBRK	2
	LAC	* 
EPI0_7:
	.line	130
	MAR	* ,AR1
	SBRK	34
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	454,000000000H,33

	.sym	_SensorsetMenu,_SensorsetMenu,34,2,0
	.globl	_SensorsetMenu

	.func	456
******************************************************
* FUNCTION DEF : _SensorsetMenu
******************************************************
_SensorsetMenu:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,29
	LAR	AR0,*0+,AR3


	.sect	".cinit"
	.word	IS8,_logs$9
	.word	68
	.word	111
	.word	111
	.word	114
	.word	0
	.word	83
	.word	108
	.word	118
	.word	0
IS8	.set	9
	.text

	.sym	_logs,_logs$9,242,3,160,,2,5

	.sect	".const"
.init1$10$$2:
	.word	178
	.text
	.sym	_eeprom,1,52,1,16,,1
	.sym	_displayArray,2,50,1,160,,10
	.sym	_saved,12,50,1,96,,6
	.sym	_star,18,50,1,32,,2
	.sym	_clear,20,50,1,32,,2
	.sym	_enteredLoop,22,2,1,16
	.sym	_parameter,23,2,1,16
	.sym	_parameterValue,24,2,1,16
	.sym	_changeParameters,25,2,1,16
	.sym	_index,26,2,1,16
	.sym	_key,27,2,1,16
	.sym	_selected,28,2,1,16
	.line	4
	LARK	AR3,1
	MAR	*0+
	BLKD	.init1$10$$2+0,*+,AR2
	.line	5
	LACK	83
	LARK	AR2,2
	MAR	*0+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	110
	SACL	*+
	LACK	115
	SACL	*+
	LACK	111
	SACL	*+
	LACK	114
	SACL	*+
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	0
	SACL	*+
	.line	6
	LACK	83
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
	.line	7
	LACK	42
	SACL	*+
	LACK	0
	SACL	*+
	.line	8
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	9
	SACL	*+
	.line	13
	SACL	*+
	.line	14
	SACL	*+
	.line	15
	SACL	*+
	.line	16
	SACL	*+
	.line	17
	SACL	*+
	.line	18
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
	MAR	* ,AR2
	LARK	AR2,23
	MAR	*0+
	LAR	AR3,* ,AR3
	MAR	*0+
	MAR	*+
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,24
	MAR	*0+
	SACL	* 
	.line	25
	SSXM
	ADRK	4
	LAC	* 
	BNZ	L85
	MAR	* ,AR1
L84:
	.line	27
	LACK	16
	SACL	*+,AR3
	LARK	AR3,2
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	28
	LACK	32
	SACL	*+,AR2
	LARK	AR2,23
	MAR	*0+
	LT	* ,AR1
	MPYK	5
	PAC
	ADLK	_logs$9+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	36
	LACK	32
	SACL	*+
	LACK	37
	SACL	*+,AR2
	LARK	AR2,24
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	38
	SSXM
	MAR	* ,AR2
	LARK	AR2,25
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L86
	.line	39
	MAR	* ,AR1
	LACK	47
	SACL	*+,AR3
	LARK	AR3,18
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	40
	LACK	31
	SACL	*+,AR3
	LARK	AR3,20
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L86:
	.line	42
	SSXM
	MAR	* ,AR2
	LARK	AR2,25
	MAR	*0+
	LAC	* 
	BNZ	L87
	.line	43
	MAR	* ,AR1
	LACK	47
	SACL	*+,AR3
	LARK	AR3,20
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	44
	LACK	31
	SACL	*+,AR3
	LARK	AR3,18
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L87:
	.line	48
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,27
	MAR	*0+
	SACL	* 
	.line	52
	SSXM
	SBRK	2
	LAC	* 
	SUBK	1
	BNZ	L88
	.line	53
	ADRK	2
	LAC	* 
	SUBK	1
	BZ	LL15
	LAC	* 
	SUBK	2
	BNZ	L88
LL15:
	.line	54
	SBRK	3
	LAC	* 
	LARK	AR3,1
	BZ	LL16
	LARK	AR3,0
LL16:
	SAR	AR3,* ,AR1
	.line	55
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
L88:
	.line	57
	SSXM
	MAR	* ,AR2
	LARK	AR2,25
	MAR	*0+
	LAC	* 
	BNZ	L90
	.line	58
	ADRK	2
	LAC	* 
	SUBK	1
	BNZ	L91
	.line	59
	SBRK	4
	LAC	* 
	SUBK	2
	BNZ	L92
	.line	60
	LACK	0
	SACL	* ,AR1
	.line	61
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	62
	CALL	_DispClear
	B	L93
L92:
	.line	65
	LAC	* 
	ADDK	1
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
L93:
	.line	69
	MAR	* ,AR2
	LARK	AR2,23
	MAR	*0+
	LAR	AR3,* ,AR3
	MAR	*0+
	MAR	*+
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,24
	MAR	*0+
	SACL	* 
L91:
	.line	73
	SSXM
	LARK	AR2,27
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L90
	.line	74
	SBRK	4
	LAC	* 
	BNZ	L95
	.line	75
	LACK	2
	SACL	* ,AR1
	.line	76
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	77
	CALL	_DispClear
	B	L96
L95:
	.line	80
	SUBK	1
	SACL	* ,AR1
	.line	81
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	82
	CALL	_DispClear
L96:
	.line	84
	MAR	* ,AR2
	LARK	AR2,23
	MAR	*0+
	LAR	AR3,* ,AR3
	MAR	*0+
	MAR	*+
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,24
	MAR	*0+
	SACL	* 
L90:
	.line	91
	SSXM
	LARK	AR2,27
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L97
	.line	92
	SBRK	2
	LAC	* 
	BNZ	L98
	.line	93
	MAR	*+
	SPLK	#-1,* 
	.line	94
	LACK	1
	ADRK	2
	SACL	* 
L98:
	.line	96
	LARK	AR2,25
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L99
	.line	97
	LACK	0
	SACL	* 
L99:
	.line	100
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	101
	CALL	_DispClear
L97:
	.line	106
	LACK	0
	MAR	* ,AR2
	LARK	AR2,22
	MAR	*0+
	SACL	* 
	.line	107
	SSXM
	ADRK	5
	LAC	* 
	SUBK	3
	BNZ	L100
	.line	108
	SBRK	2
	LAC	* 
	BNZ	L101
	.line	109
	LACK	1
	SACL	* 
	.line	110
	SBRK	3
	SACL	* 
L101:
	.line	113
	LARK	AR2,25
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L102
	.line	114
	SBRK	3
	LAC	* 
	BNZ	L102
	.line	116
	MAR	*+
	LAR	AR3,*+,AR3
	MAR	*0+
	MAR	*+
	LAC	* ,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	117
	LACK	42
	SACL	*+,AR3
	LARK	AR3,12
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	118
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
L102:
	.line	123
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	124
	CALL	_DispClear
L100:
	.line	25
	SSXM
	MAR	* ,AR2
	LARK	AR2,28
	MAR	*0+
	LAC	* ,AR1
	BZ	L84
L85:
	.line	129
	MAR	* ,AR2
	SBRK	2
	LAC	* 
EPI0_8:
	.line	130
	MAR	* ,AR1
	SBRK	30
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	585,000000000H,29
	.end
