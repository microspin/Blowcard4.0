*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include delay.c C:\Users\SIVARA~1\AppData\Local\Temp\delay.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\delay.if delay.asm C:\Users\SIVARA~1\AppData\Local\Temp\delay.tmp 
	.port
	.file	"delay.c"
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
	.file	"delay.c"
	.text

	.sym	_delay1us,_delay1us,32,2,0
	.globl	_delay1us

	.func	17
******************************************************
* FUNCTION DEF : _delay1us
******************************************************
_delay1us:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

EPI0_1:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	20,000000000H,1

	.sym	_delay1ms,_delay1ms,32,2,0
	.globl	_delay1ms

	.func	22
******************************************************
* FUNCTION DEF : _delay1ms
******************************************************
_delay1ms:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_i,1,14,1,16
	.line	3
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	4
	SACL	* 
	ZALS	* 
	SUBK	4000
	BGEZ	L2
L1:
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SUBK	4000
	BLZ	L1
L2:
EPI0_2:
	.line	5
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	26,000000000H,2

	.sym	_delay,_delay,32,2,0
	.globl	_delay

	.func	28
******************************************************
* FUNCTION DEF : _delay
******************************************************
_delay:

LF3	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_time,-3+LF3,14,9,16
	.sym	_isMilli,-4+LF3,14,9,16
	.sym	_i,1,14,1,16
	.line	2
	.line	3
	LARK	AR2,-4+LF3
	MAR	*0+
	LAC	* 
	BZ	L3
	.line	4
	LACK	0
	ADRK	5-LF3
	SACL	* 
	ZALS	* 
	SBRK	4-LF3
	SUBS	* 
	BGEZ	L3
	MAR	* ,AR1
L4:
	.line	5
	CALL	_delay1ms,AR1
	.line	4
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SBRK	4-LF3
	SUBS	* ,AR1
	BLZ	L4
L3:
	.line	7
	MAR	* ,AR2
	LARK	AR2,-4+LF3
	MAR	*0+
	LAC	* 
	BNZ	L6
	.line	8
	LACK	0
	ADRK	5-LF3
	SACL	* 
	ZALS	* 
	SBRK	4-LF3
	SUBS	* 
	BGEZ	L6
	MAR	* ,AR1
L7:
	.line	9
	CALL	_delay1us,AR1
	.line	8
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SBRK	4-LF3
	SUBS	* ,AR1
	BLZ	L7
L6:
EPI0_3:
	.line	11
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	38,000000000H,2
	.end
