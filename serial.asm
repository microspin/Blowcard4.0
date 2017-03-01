*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include serial.c C:\Users\SIVARA~1\AppData\Local\Temp\serial.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\serial.if serial.asm C:\Users\SIVARA~1\AppData\Local\Temp\serial.tmp 
	.port
	.file	"serial.c"
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
	.file	"serial.c"
	.text

	.sym	_SerialInit,_SerialInit,32,2,0
	.globl	_SerialInit

	.func	16
******************************************************
* FUNCTION DEF : _SerialInit
******************************************************
_SerialInit:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	4
	LARK	AR3,28696
	LACK	64
	OR	* 
	SACL	* 
	.line	5
	LACK	231
	ADRK	56
	SACL	*+
	.line	6
	LACK	34
	SACL	* 
	.line	7
	LACK	0
	ADRK	3
	SACL	* 
	.line	10
	SBRK	2
	SACL	*+
	.line	12
	LACK	129
	SACL	* 
	.line	14
	LACK	104
	ADRK	12
	SACL	* 
	.line	16
	LACK	34
	SBRK	14
	SACL	* ,AR1
EPI0_1:
	.line	18
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	33,000000000H,1

	.sym	_SerialDisable,_SerialDisable,32,2,0
	.globl	_SerialDisable

	.func	35
******************************************************
* FUNCTION DEF : _SerialDisable
******************************************************
_SerialDisable:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28753
	LACK	0
	SACL	* 
	.line	4
	ADRK	3
	SACL	* 
	.line	5
	SBRK	60
	LACK	-65
	AND	* 
	SACL	* ,AR1
EPI0_2:
	.line	6
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	40,000000000H,1

	.sym	_SerialWriteNo,_SerialWriteNo,32,2,0
	.globl	_SerialWriteNo

	.func	42
******************************************************
* FUNCTION DEF : _SerialWriteNo
******************************************************
_SerialWriteNo:

LF3	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,15
	LAR	AR0,*0+

	.sym	_number,-3+LF3,14,9,16
	.sym	_TxString,1,50,1,80,,5
	.sym	_TxArr,6,50,1,80,,5
	.sym	_i,11,2,1,16
	.sym	_l,12,2,1,16
	.sym	_k,13,4,1,16
	.line	2
	.line	9
	LACK	1000
	SACL	*+,AR2
	LARK	AR2,-3+LF3
	MAR	*0+
	ZALS	* ,AR1
	CALL	I$$UDIV
	MAR	* ,AR2
	ADRK	15-LF3
	SACL	* 
	.line	10
	ADDK	48
	SBRK	6
	SACL	* 
	.line	12
	ADRK	6
	LT	* 
	MPYK	1000
	ADRK	2
	SPL	* 
	SBRK	17-LF3
	LAC	* 
	ADRK	17-LF3
	SUB	*-
	SACL	* ,AR1
	.line	13
	LACK	100
	SACL	*+,AR2
	SSXM
	LAC	*-,AR1
	CALL	I$$DIV
	MAR	* ,AR2
	SACL	* ,AR1
	.line	14
	ADDK	48
	SACL	* 
	LAC	* ,AR2
	SBRK	5
	SACL	* 
	.line	16
	ADRK	5
	LT	*+
	MPYK	100
	SSXM
	LAC	* 
	SPAC
	SACL	* ,AR1
	.line	17
	LACK	10
	SACL	*+,AR2
	LAC	*-,AR1
	CALL	I$$DIV
	MAR	* ,AR2
	SACL	* ,AR1
	.line	18
	ADDK	48
	SACL	* 
	LAC	* ,AR2
	SBRK	4
	SACL	* 
	.line	20
	ADRK	4
	LT	*+
	MPYK	10
	SSXM
	LAC	* 
	SPAC
	SACL	*-
	.line	21
	SACL	* ,AR1
	.line	22
	ADDK	48
	SACL	* 
	LAC	* ,AR2
	SBRK	3
	SACL	* 
	.line	24
	LACK	0
	ADRK	2
	SACL	* 
	LAC	* 
	SUBK	3
	BGZ	L2
L1:
	.line	26
	LAR	AR3,* ,AR3
	MAR	*0+,AR2
	LAR	AR4,* ,AR4
	MAR	*0+,AR3
	ADRK	6
	LAC	* ,AR4
	MAR	*+
	SACL	* ,AR2
	.line	27
	LAR	AR3,* ,AR3
	MAR	*0+
	LARK	AR4,28761
	MAR	*+
	LAC	* ,AR4
	SACL	* ,AR3
L3:
	.line	28
	LARK	AR3,28756
	BIT	* ,8
	BBZ	LL5
	LACK	1
	B	LL6
LL5:
	LACK	0
LL6:
	BZ	L3
	.line	24
	MAR	* ,AR2
	LARK	AR2,11
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	3
	BLEZ	L1
L2:
EPI0_3:
	.line	32
	MAR	* ,AR1
	SBRK	16
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	73,000000000H,15

	.sym	_SerialWriteComma,_SerialWriteComma,32,2,0
	.globl	_SerialWriteComma

	.func	75
******************************************************
* FUNCTION DEF : _SerialWriteComma
******************************************************
_SerialWriteComma:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	2
	LARK	AR3,28761
	LACK	44
	SACL	* 
L4:
	.line	3
	LARK	AR3,28756
	BIT	* ,8
	BBZ	LL9
	LACK	1
	B	LL10
LL9:
	LACK	0
LL10:
	BZ	L4
EPI0_4:
	.line	5
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	79,000000000H,1

	.sym	_SerialWriteNewLine,_SerialWriteNewLine,32,2,0
	.globl	_SerialWriteNewLine

	.func	81
******************************************************
* FUNCTION DEF : _SerialWriteNewLine
******************************************************
_SerialWriteNewLine:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	2
	LARK	AR3,28761
	LACK	10
	SACL	* 
L5:
	.line	3
	LARK	AR3,28756
	BIT	* ,8
	BBZ	LL13
	LACK	1
	B	LL14
LL13:
	LACK	0
LL14:
	BZ	L5
EPI0_5:
	.line	5
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	85,000000000H,1

	.sym	_SerialWriteMinus,_SerialWriteMinus,32,2,0
	.globl	_SerialWriteMinus

	.func	87
******************************************************
* FUNCTION DEF : _SerialWriteMinus
******************************************************
_SerialWriteMinus:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	2
	LARK	AR3,28761
	LACK	45
	SACL	* 
L6:
	.line	3
	LARK	AR3,28756
	BIT	* ,8
	BBZ	LL17
	LACK	1
	B	LL18
LL17:
	LACK	0
LL18:
	BZ	L6
EPI0_6:
	.line	5
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	91,000000000H,1

	.sym	_SerialWriteText,_SerialWriteText,32,2,0
	.globl	_SerialWriteText

	.func	93
******************************************************
* FUNCTION DEF : _SerialWriteText
******************************************************
_SerialWriteText:

LF7	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_string,-3+LF7,18,9,16
	.sym	_length,-4+LF7,14,9,16
	.sym	_i,1,12,1,16
	.line	2
	.line	5
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	ZALS	* 
	SBRK	5-LF7
	SUBS	* 
	BGEZ	L8
	ADRK	5-LF7
L7:
	.line	7
	LAC	* 
	SBRK	4-LF7
	ADD	* ,AR0
	SACL	* 
	LAR	AR3,* ,AR3
	LARK	AR4,28761
	SSXM
	LAC	* ,AR4
	SACL	* ,AR3
L9:
	.line	8
	LARK	AR3,28756
	BIT	* ,8
	BBZ	LL21
	LACK	1
	B	LL22
LL21:
	LACK	0
LL22:
	BZ	L9
	.line	5
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SBRK	5-LF7
	SUBS	* 
	ADRK	5-LF7
	BLZ	L7
L8:
EPI0_7:
	.line	12
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	104,000000000H,2

	.sym	_WaitForTxRdyFlag,_WaitForTxRdyFlag,32,2,0
	.globl	_WaitForTxRdyFlag

	.func	107
******************************************************
* FUNCTION DEF : _WaitForTxRdyFlag
******************************************************
_WaitForTxRdyFlag:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_counter,1,14,1,16
	.sym	_breakout,2,14,1,16
	.line	13
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	14
	SACL	* 
	.line	15
	LAC	* 
	SUBK	1
	BZ	L11
	MAR	* ,AR3
L10:
	.line	16
	LARK	AR3,28756
	BIT	* ,8
	BBZ	LL25
	LACK	1
	B	LL26
LL25:
	LACK	0
LL26:
	SUBK	1
	BNZ	L12
	.line	17
	LACK	1
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	B	L13
L12:
	.line	19
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	.line	20
	ZALS	* 
	ADRK	2
	SACL	*+
	SACH	*-
	LT	*+
	MPYK	1
	LPH	* 
	RSXM
	LACK	65000
	SPAC
	BNZ	L13
	.line	21
	LACK	1
	SBRK	2
	SACL	* 
L13:
	.line	15
	LARK	AR2,2
	MAR	*0+
	LAC	* ,AR3
	SUBK	1
	BNZ	L10
L11:
EPI0_8:
	.line	24
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	130,000000000H,5
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	I$$UDIV
	.global	I$$DIV
	.end
