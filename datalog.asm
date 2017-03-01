*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include datalog.c C:\Users\SIVARA~1\AppData\Local\Temp\datalog.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\datalog.if datalog.asm C:\Users\SIVARA~1\AppData\Local\Temp\datalog.tmp 
	.port
	.file	"datalog.c"
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
	.file	"datalog.c"
	.globl	_AdcValue
	.globl	_AvgAdcValue
	.globl	_SignalHigh
	.globl	_OpenerfillFlag
	.globl	_FillCount
	.globl	_LCSignalHigh
	.globl	_LCfillFlag
	.globl	_LCCount
	.globl	_Stepperresetcnt
	.globl	_Liftupcount
	.text

	.sym	_Datalog,_Datalog,32,2,0
	.globl	_Datalog

	.func	21
******************************************************
* FUNCTION DEF : _Datalog
******************************************************
_Datalog:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,17
	LAR	AR0,*0+,AR2

	.sym	_amp,1,50,1,80,,5
	.sym	_pwm,6,50,1,80,,5
	.sym	_rpm,11,50,1,80,,5
	.sym	_i,16,2,1,16
	.line	2
	LACK	65
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	68
	SACL	*+
	LACK	67
	SACL	*+
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	LACK	80
	SACL	*+
	LACK	87
	SACL	*+
	LACK	77
	SACL	*+
	LACK	37
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	LACK	82
	SACL	*+
	LACK	80
	SACL	*+
	LACK	77
	SACL	*+
	LACK	32
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	SACL	* 
	.line	7
	LDPK	_O+1
	LAC	_O+1
	SUBK	1
	BNZ	L1
	.line	9
	MAR	* ,AR1
	LACK	4
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_SerialWriteText
	SBRK	2
	.line	10
	CALL	_SerialWriteComma
	.line	11
	LACK	0
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BGEZ	L1
L2:
	.line	13
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	2
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	14
	CALL	_SerialWriteComma
	.line	11
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BLZ	L2
L1:
	.line	19
	LDPK	_O+2
	LAC	_O+2
	SUBK	1
	BNZ	L4
	.line	21
	MAR	* ,AR1
	LACK	4
	SACL	*+,AR3
	LARK	AR3,6
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_SerialWriteText
	SBRK	2
	.line	22
	CALL	_SerialWriteComma
	.line	23
	LACK	0
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BGEZ	L4
L5:
	.line	24
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	25
	CALL	_SerialWriteComma
	.line	23
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BLZ	L5
L4:
	.line	29
	LDPK	_O
	LAC	_O
	SUBK	1
	BNZ	L7
	.line	31
	MAR	* ,AR1
	LACK	4
	SACL	*+,AR3
	LARK	AR3,11
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_SerialWriteText
	SBRK	2
	.line	32
	CALL	_SerialWriteComma
	.line	33
	LACK	0
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BGEZ	L7
L8:
	.line	34
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	MAR	*+
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	35
	CALL	_SerialWriteComma
	.line	33
	MAR	* ,AR2
	LARK	AR2,16
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BLZ	L8
L7:
	.line	38
	CALL	_SerialWriteNewLine,AR1
EPI0_1:
	.line	39
	SBRK	18
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	59,000000000H,17

	.sym	_DataLogMotorPID,_DataLogMotorPID,32,2,0
	.globl	_DataLogMotorPID

	.func	61
******************************************************
* FUNCTION DEF : _DataLogMotorPID
******************************************************
_DataLogMotorPID:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	42
	LACK	10
	SACL	*+
	LDPK	_Stepperresetcnt
	ZALS	_Stepperresetcnt
	CALL	I$$UDIV
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	43
	CALL	_SerialWriteComma
	.line	44
	BLKD	_Liftupcount+0,*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	45
	CALL	_SerialWriteComma
	.line	47
	LRLK	AR3,_M+21
	MAR	* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	48
	CALL	_SerialWriteComma
	.line	50
	LRLK	AR3,_M+22
	MAR	* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	51
	CALL	_SerialWriteComma
	.line	52
	LRLK	AR3,_M+82
	MAR	* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	53
	CALL	_SerialWriteComma
	.line	54
	LRLK	AR3,_M+62
	MAR	* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	55
	CALL	_SerialWriteComma
	.line	69
	LRLK	AR3,_M+32
	MAR	* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	70
	CALL	_SerialWriteComma
	.line	72
	LRLK	AR3,_M+31
	MAR	* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	73
	CALL	_SerialWriteComma
	.line	75
	LRLK	AR3,_M+91
	MAR	* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	76
	CALL	_SerialWriteComma
	.line	78
	LRLK	AR3,_M+71
	MAR	* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	79
	CALL	_SerialWriteComma
	.line	92
	CALL	_SerialWriteNewLine
EPI0_2:
	.line	94
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	154,000000000H,1

	.sym	_DataLogSignal,_DataLogSignal,32,2,0
	.globl	_DataLogSignal

	.func	157
******************************************************
* FUNCTION DEF : _DataLogSignal
******************************************************
_DataLogSignal:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	3
	BLKD	_SignalHigh+0,*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	4
	CALL	_SerialWriteComma
	.line	5
	BLKD	_OpenerfillFlag+0,*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	6
	CALL	_SerialWriteComma
	.line	7
	BLKD	_FillCount+0,*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	8
	CALL	_SerialWriteComma
	.line	9
	CALL	_SerialWriteNewLine
EPI0_3:
	.line	10
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	166,000000000H,1
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	I$$UDIV
	.end
