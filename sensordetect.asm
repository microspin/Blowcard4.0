*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include sensordetect.c C:\Users\SIVARA~1\AppData\Local\Temp\sensordetec
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\sensordetect.if sensordetect.asm C:\Users\SIVARA~1\AppData\Local\Temp\sensordetect.tmp 
	.port
	.bss	_FillCount,1,1
	.bss	_SignalHigh,1
	.bss	_LCFillCount,1
	.bss	_LCSignalHigh,1
	.bss	_DooropenFlag,1
	.bss	_SlivercutFlag,1
	.bss	_OpenerfillFlag,1
	.bss	_LCfillFlag,1
	.file	"sensordetect.c"
	.file	"regs240x.h"
	.globl	_portffff
	.globl	_portff0f
	.globl	_port0
	.globl	_port1
	.globl	_port2
	.globl	_port3
	.globl	_port4
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
	.file	"sensordetect.c"
	.globl	_lcdDisplay

	.sect	".cinit"
	.word	1,_FillCount
	.word	0

	.sym	_FillCount,_FillCount,14,2,16
	.globl	_FillCount
	.word	1,_SignalHigh
	.word	0

	.sym	_SignalHigh,_SignalHigh,14,2,16
	.globl	_SignalHigh
	.globl	_OpenerfillFlag
	.word	1,_LCFillCount
	.word	0

	.sym	_LCFillCount,_LCFillCount,14,2,16
	.globl	_LCFillCount
	.word	1,_LCSignalHigh
	.word	0

	.sym	_LCSignalHigh,_LCSignalHigh,14,2,16
	.globl	_LCSignalHigh
	.globl	_LCfillFlag
	.word	1,_DooropenFlag
	.word	0

	.sym	_DooropenFlag,_DooropenFlag,14,2,16
	.globl	_DooropenFlag
	.word	1,_SlivercutFlag
	.word	0

	.sym	_SlivercutFlag,_SlivercutFlag,14,2,16
	.globl	_SlivercutFlag
	.text

	.sym	_DooropenSensor,_DooropenSensor,32,2,0
	.globl	_DooropenSensor

	.func	63
******************************************************
* FUNCTION DEF : _DooropenSensor
******************************************************
_DooropenSensor:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	5
	LARK	AR3,28826
	LACK	2
	AND	* ,AR1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	2
	BZ	LL3
	LACK	64
	MAR	* ,AR3
	ADRK	2
	AND	* ,AR1
	SACL	* 
	LAC	* 
	SUBK	64
	BNZ	L1
LL3:
	.line	7
	LACK	1
	LDPK	_DooropenFlag
	SACL	_DooropenFlag
	B	L2
L1:
	.line	8
	LACK	0
	LDPK	_DooropenFlag
	SACL	_DooropenFlag
L2:
EPI0_1:
	.line	10
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	72,000000000H,1

	.sym	_SlivercutSensor,_SlivercutSensor,32,2,0
	.globl	_SlivercutSensor

	.func	74
******************************************************
* FUNCTION DEF : _SlivercutSensor
******************************************************
_SlivercutSensor:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	5
	LARK	AR3,28828
	BIT	* ,11
	BBNZ	L3
	LACK	0
	LDPK	_SlivercutFlag
	SACL	_SlivercutFlag
	B	L4
L3:
	LACK	1
	LDPK	_SlivercutFlag
	SACL	_SlivercutFlag
L4:
EPI0_2:
	.line	7
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	80,000000000H,1

	.sym	_OpenerfillFlag,_OpenerfillFlag,14,2,16
	.globl	_OpenerfillFlag

	.sym	_LCfillFlag,_LCfillFlag,14,2,16
	.globl	_LCfillFlag
	.end
