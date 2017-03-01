*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include factorysettinglogic.c C:\Users\SIVARA~1\AppData\Local\Temp\fact
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\factorysettinglogic.if factorysettinglogic.asm C:\Users\SIVARA~1\AppData\Local\Temp\factorysettinglogic.tmp 
	.port
	.file	"factorysettinglogic.c"
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
	.file	"factorysettinglogic.c"
	.text

	.sym	_FactorySettings,_FactorySettings,32,2,0
	.globl	_FactorySettings

	.func	12
******************************************************
* FUNCTION DEF : _FactorySettings
******************************************************
_FactorySettings:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_psw,1,2,1,16
	.sym	_selection,2,14,1,16
	.sym	_breakout,3,14,1,16
	.sym	_out,4,14,1,16
	.line	5
	LACK	0
	LARK	AR2,3
	MAR	*0+
	SACL	*+
	.line	7
	SACL	*-
	.line	11
	LAC	* 
	SUBK	1
	BZ	L2
	MAR	* ,AR1
L1:
	.line	12
	CALL	_FactorysettingsMenu,AR1
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	B	L3
L4:
	.line	15
	CALL	_Sensorset,AR1
	MAR	* ,AR2
	LARK	AR2,4
	MAR	*0+
	SACL	* 
	.line	16
	B	L5
L6:
	.line	18
	LACK	1
	MAR	* ,AR2
	LARK	AR2,4
	MAR	*0+
	SACL	* 
	.line	19
	B	L5
L3:
	.line	13
	ZALS	* 
	BZ	L4
	ADDK	2
	SSXM
	ADLK	65534,15
	BZ	L6
L5:
	.line	22
	LARK	AR2,4
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L7
	.line	23
	LACK	1
	MAR	*-
	SACL	* 
	B	L8
L7:
	.line	25
	LACK	0
	MAR	*-
	SACL	* 
L8:
	.line	11
	LAC	* ,AR1
	SUBK	1
	BNZ	L1
L2:
EPI0_1:
	.line	28
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	39,000000000H,5

	.sym	_Sensorset,_Sensorset,46,3,0

	.func	42
******************************************************
* FUNCTION DEF : _Sensorset
******************************************************
_Sensorset:
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
	CALL	_SensorsetMenu
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

	.endfunc	50,000000000H,2

	.sym	_LoadSensorsetOptions,_LoadSensorsetOptions,32,2,0
	.globl	_LoadSensorsetOptions

	.func	52
******************************************************
* FUNCTION DEF : _LoadSensorsetOptions
******************************************************
_LoadSensorsetOptions:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	3
	LACK	178
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	LDPK	_O+8
	SACL	_O+8
EPI0_3:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	55,000000000H,1
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	_FactorysettingsMenu
	.global	_SensorsetMenu
	.end
