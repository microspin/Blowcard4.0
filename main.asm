*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include main.c C:\Users\SIVARA~1\AppData\Local\Temp\main.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\main.if main.asm C:\Users\SIVARA~1\AppData\Local\Temp\main.tmp 
	.port
	.bss	_trigger,1,1
	.bss	_MCnt1,1
	.bss	_OV,4
	.bss	_dataSetEeAddress,5
	.bss	_O,9
	.bss	_motorNames,24
	.bss	_U,54
	.bss	_M,120
	.file	"main.c"
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
	.file	"main.c"
	.globl	_mtrcnt

	.sect	".cinit"
	.word	1,_MCnt1
	.word	0

	.sym	_MCnt1,_MCnt1,2,2,16
	.globl	_MCnt1
	.word	1,_trigger
	.word	0

	.sym	_trigger,_trigger,2,2,16
	.globl	_trigger
	.word	IS1,_motorNames
	.word	67
	.word	89
	.word	76
	.word	0
	.word	66
	.word	84
	.word	82
	.word	0
	.word	67
	.word	71
	.word	69
	.word	0
	.word	67
	.word	70
	.word	68
	.word	0
	.word	66
	.word	70
	.word	68
	.word	0
	.word	76
	.word	70
	.word	68
	.word	0
IS1	.set	24

	.sym	_motorNames,_motorNames,242,2,384,,6,4
	.globl	_motorNames
	.word	IS2,_dataSetEeAddress
	.word	64
	.word	80
	.word	96
	.word	112
	.word	128
IS2	.set	5

	.sym	_dataSetEeAddress,_dataSetEeAddress,52,2,80,,5
	.globl	_dataSetEeAddress
	.text

	.sym	_main,_main,32,2,0
	.globl	_main

	.func	24
******************************************************
* FUNCTION DEF : _main
******************************************************
_main:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,22
	LAR	AR0,*0+,AR2

	.sym	_i,1,4,1,16
	.sym	_selection,2,2,1,16
	.sym	_ver,3,50,1,304,,19
	.line	4
	LACK	0
	LARK	AR2,2
	MAR	*0+
	SACL	*+
	.line	5
	LACK	86
	SACL	*+
	LACK	69
	SACL	*+
	LACK	82
	SACL	*+
	LACK	58
	SACL	*+
	LACK	66
	SACL	*+
	LACK	67
	SACL	*+
	LACK	95
	SACL	*+
	LACK	49
	SACL	*+
	LACK	55
	SACL	*+
	LACK	95
	SACL	*+
	LACK	48
	SACL	*+
	LACK	49
	SACL	*+
	LACK	95
	SACL	*+
	LACK	48
	SACL	*+
	SACL	*+
	LACK	32
	SACL	*+
	SACL	*+
	SACL	*+
	LACK	0
	SACL	* ,AR1
	.line	6
	CALL	_StopAllMotors
	.line	7
	CALL	_Initialize
	.line	8
	CALL	_DispInit
	.line	9
	CALL	_DispClear
	.line	10
	LACK	204
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	LDPK	_mtrcnt
	SACL	_mtrcnt
	.line	12
	LACK	16
	SACL	*+,AR3
	LARK	AR3,3
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	13
	LACK	1
	SACL	*+
	LACK	2000
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	14
	CALL	_AdcInit
	.line	15
	CALL	_SerialInit
	.line	17
	CALL	_MotorStructInit
	.line	19
	LACK	1
	SACL	*+
	LACK	3000
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	20
	CALL	_DispClear
	.line	21
	CALL	_TowerLampGreen_Off
	.line	22
	CALL	_TowerLampRed_Off
	.line	23
	CALL	_TowerLampBrown_On
L1:
	.line	27
	CALL	_TowerLampBrown_On,AR1
	.line	28
	CALL	_TowerLampGreen_Off
	.line	29
	CALL	_TowerLampRed_Off
	.line	30
	CALL	_TopLevelMenu
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	B	L3
L4:
	.line	33
	CALL	_RunMachine,AR1
	.line	34
	B	L5
L6:
	.line	37
	CALL	_RunMachineParameters,AR1
	.line	38
	B	L5
L7:
	.line	41
	CALL	_RunTools,AR1
	.line	42
	B	L5
L8:
	.line	45
	CALL	_FactorySettings,AR1
	.line	46
	B	L5
L3:
	.line	31
	SSXM
	LAC	* 
	BZ	L4
	SUBK	1
	BZ	L6
	SUBK	1
	BZ	L7
	SUBK	1
	BZ	L8
L5:
	.line	49
	MAR	* ,AR1
	B	L1
	.endfunc	74,000000000H,22

	.sym	_M,_M,56,2,1920,_Motor,6
	.globl	_M

	.sym	_O,_O,8,2,144,_Options
	.globl	_O

	.sym	_U,_U,56,2,864,_Menu,6
	.globl	_U

	.sym	_OV,_OV,8,2,64,_Overload
	.globl	_OV
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	_TowerLampGreen_Off
	.global	_TowerLampRed_Off
	.global	_TowerLampBrown_On
	.global	_FactorySettings
	.end
