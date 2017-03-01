*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include toolslogicfunctions.c C:\Users\SIVARA~1\AppData\Local\Temp\tool
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\toolslogicfunctions.if toolslogicfunctions.asm C:\Users\SIVARA~1\AppData\Local\Temp\toolslogicfunctions.tmp 
	.port
	.file	"toolslogicfunctions.c"
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
	.file	"toolslogicfunctions.c"
	.text

	.sym	_SetMotorPwmPercent,_SetMotorPwmPercent,46,2,0
	.globl	_SetMotorPwmPercent

	.func	15
******************************************************
* FUNCTION DEF : _SetMotorPwmPercent
******************************************************
_SetMotorPwmPercent:

LF1	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,19
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF1,14,9,16
	.sym	_pwmPercent,1,14,1,16
	.sym	_text,2,50,1,240,,15
	.sym	_selected,17,14,1,16
	.sym	_key,18,14,1,16
	.line	2
	.line	5
	LACK	15
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	6
	LACK	83
	SACL	*+
	LACK	101
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	80
	SACL	*+
	LACK	119
	SACL	*+
	LACK	109
	SACL	*+
	LACK	80
	SACL	*+
	LACK	101
	SACL	*+
	LACK	114
	SACL	*+
	LACK	99
	SACL	*+
	LACK	101
	SACL	*+
	LACK	110
	SACL	*+
	LACK	116
	SACL	*+
	LACK	0
	SACL	*+
	.line	7
	SACL	*+
	.line	8
	SACL	* ,AR1
	.line	10
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	11
	CALL	_DispClear
	.line	13
	LACK	16
	SACL	*+,AR3
	LARK	AR3,2
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	15
	MAR	* ,AR2
	LARK	AR2,17
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L2
	SBRK	16
	MAR	* ,AR1
L1:
	.line	17
	LACK	32
	SACL	*+
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	18
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,18
	MAR	*0+
	SACL	* 
	.line	19
	LAC	* 
	SUBK	1
	BNZ	L3
	.line	20
	SBRK	17
	ZALS	* 
	SUBK	90
	BGEZ	L3
	.line	21
	ADDK	91
	SACL	* 
L3:
	.line	24
	LARK	AR2,18
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L5
	.line	25
	SBRK	17
	ZALS	* 
	SUBK	90
	BLEZ	L5
	.line	26
	ADDK	89
	SACL	* 
L5:
	.line	28
	LARK	AR2,18
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L7
	.line	29
	LACK	1
	MAR	*-
	SACL	* 
L7:
	.line	31
	LARK	AR2,18
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L8
	.line	32
	LACK	1
	MAR	*-
	SACL	* 
	.line	33
	SBRK	16
	SPLK	#65535,* 
L8:
	.line	35
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	15
	MAR	* ,AR2
	LARK	AR2,17
	MAR	*0+
	LAC	* 
	SUBK	1
	SBRK	16
	MAR	* ,AR1
	BNZ	L1
L2:
	.line	37
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	ZALS	* 
EPI0_1:
	.line	39
	MAR	* ,AR1
	SBRK	20
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	53,000000000H,19

	.sym	_LoadDatalogOptions,_LoadDatalogOptions,32,2,0
	.globl	_LoadDatalogOptions

	.func	56
******************************************************
* FUNCTION DEF : _LoadDatalogOptions
******************************************************
_LoadDatalogOptions:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	2
	LACK	50
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	LDPK	_O+1
	SACL	_O+1
	.line	3
	LACK	52
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	LDPK	_O+2
	SACL	_O+2
	.line	4
	LACK	48
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	LDPK	_O
	SACL	_O
	.line	6
	LACK	178
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	LDPK	_O+8
	SACL	_O+8
EPI0_2:
	.line	7
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	62,000000000H,1

	.sym	_SetBtrPinsLow,_SetBtrPinsLow,32,2,0
	.globl	_SetBtrPinsLow

	.func	64
******************************************************
* FUNCTION DEF : _SetBtrPinsLow
******************************************************
_SetBtrPinsLow:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	2
	LARK	AR3,28822
	LACK	-9
	AND	* 
	SACL	* 
	.line	3
	LACK	-17
	AND	* 
	SACL	* 
	.line	4
	LACK	-33
	AND	* 
	SACL	* ,AR1
EPI0_3:
	.line	5
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	68,000000000H,1

	.sym	_SetSdPinHigh,_SetSdPinHigh,32,2,0
	.globl	_SetSdPinHigh

	.func	70
******************************************************
* FUNCTION DEF : _SetSdPinHigh
******************************************************
_SetSdPinHigh:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	2
	LARK	AR3,28824
	LACK	4
	OR	* 
	SACL	* ,AR1
EPI0_4:
	.line	2
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	71,000000000H,1

	.sym	_StopAllMotors,_StopAllMotors,32,2,0
	.globl	_StopAllMotors

	.func	78
******************************************************
* FUNCTION DEF : _StopAllMotors
******************************************************
_StopAllMotors:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	2
	LARK	AR3,29715
	LACK	0
	SACL	* 
	.line	3
	LACK	64
	SBRK	19
	SACL	* ,AR4
	.line	4
	LARK	AR4,29952
	SACL	* ,AR1
	.line	5
	CALL	_SetSdPinHigh
EPI0_5:
	.line	7
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	84,000000000H,1

	.sym	_RunMotorTest,_RunMotorTest,34,2,0
	.globl	_RunMotorTest

	.func	87
******************************************************
* FUNCTION DEF : _RunMotorTest
******************************************************
_RunMotorTest:

LF6	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,35
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF6,2,9,16
	.sym	_pwmPercent,-4+LF6,4,9,16
	.sym	_tgt,1,50,1,32,,2
	.sym	_enc,3,50,1,80,,5
	.sym	_crnt,8,50,1,48,,3
	.sym	_overload,11,50,1,288,,18
	.sym	_breakout,29,2,1,16
	.sym	_breakout1,30,2,1,16
	.sym	_out,31,2,1,16
	.sym	_key,32,2,1,16
	.sym	_adcFilterCurrentInmA,33,14,1,16
	.sym	_adcCurrentInmA,34,14,1,16
	.line	2
	LACK	37
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	0
	SACL	*+
	.line	3
	LACK	69
	SACL	*+
	LACK	110
	SACL	*+
	LACK	99
	SACL	*+
	LACK	58
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	LACK	73
	SACL	*+
	LACK	58
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	LACK	67
	SACL	*+
	LACK	117
	SACL	*+
	LACK	114
	SACL	*+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	110
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	79
	SACL	*+
	LACK	118
	SACL	*+
	LACK	101
	SACL	*+
	LACK	114
	SACL	*+
	LACK	108
	SACL	*+
	LACK	111
	SACL	*+
	LACK	97
	SACL	*+
	LACK	100
	SACL	*+
	LACK	33
	SACL	*+
	LACK	0
	SACL	*+
	.line	6
	SACL	*+
	.line	7
	SACL	*+
	.line	8
	SACL	*+
	.line	9
	SACL	*+
	.line	10
	SACL	*+
	.line	11
	SACL	* ,AR1
	.line	14
	CALL	_DispClear
	.line	15
	LACK	16
	SACL	*+,AR2
	LARK	AR2,-3+LF6
	MAR	*0+
	LAC	* ,2,AR1
	ADLK	_motorNames+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	16
	LACK	22
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	17
	LACK	32
	SACL	*+
	LACK	20
	SACL	*+,AR2
	LARK	AR2,-4+LF6
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	18
	LACK	25
	SACL	*+,AR3
	LARK	AR3,8
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	19
	LACK	67
	SACL	*+
	LACK	27
	SACL	*+,AR2
	LARK	AR2,33
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	20
	LACK	32
	SACL	*+,AR3
	LARK	AR3,3
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	22
	LACK	0
	LDPK	_trigger
	SACL	_trigger
	.line	26
	SSXM
	MAR	* ,AR2
	LARK	AR2,29
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L10
L9:
	.line	28
	LDPK	_trigger
	LAC	_trigger
	SUBK	1
	BNZ	L11
	.line	29
	LARK	AR3,28828
	LACK	16
	MAR	* ,AR3
	OR	* 
	SACL	* ,AR1
	.line	32
	CALL	_OverloadLogic
	.line	33
	LALK	FL0
	RPTK	1
	TBLR	*+
	LALK	FL1
	RPTK	1
	TBLR	*+
	LALK	FL2
	RPTK	1
	TBLR	*+
	LALK	FL3
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LARK	AR2,-3+LF6
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	2
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$DIV
	LALK	FL4
	RPTK	1
	TBLR	*+
	CALL	F$$SUB
	CALL	F$$DIV
	CALL	F$$MUL
	CALL	F$$FTOI
	ABS
	MAR	* ,AR2
	ADRK	37-LF6
	SACL	* ,AR1
	.line	34
	LALK	FL5
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	ZALS	*-,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	LALK	FL6
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$ADD
	CALL	F$$FTOU
	MAR	* ,AR2
	SACL	* ,AR1
	.line	36
	LACK	64
	SACL	*+
	LACK	36
	SACL	*+,AR2
	SBRK	36-LF6
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
	.line	37
	LACK	32
	SACL	*+
	LACK	20
	SACL	*+,AR2
	LARK	AR2,-3+LF6
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	38
	LACK	67
	SACL	*+
	LACK	27
	SACL	*+,AR2
	LARK	AR2,33
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	40
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,32
	MAR	*0+
	SACL	* 
	.line	42
	SSXM
	LAC	* 
	SUBK	4
	BZ	LL8
	MAR	*-
	LAC	* 
	SUBK	1
	BNZ	L12
LL8:
	.line	43
	LACK	1
	LARK	AR2,29
	MAR	*0+
	SACL	* ,AR1
	.line	44
	CALL	_StopAllMotors
	.line	45
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
L12:
	.line	48
	LACK	0
	LDPK	_trigger
	SACL	_trigger
	.line	50
	LARK	AR3,28828
	LACK	-17
	MAR	* ,AR3
	AND	* 
	SACL	* 
L11:
	.line	26
	SSXM
	MAR	* ,AR2
	LARK	AR2,29
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L9
L10:
	.line	54
	LACK	1
EPI0_6:
	.line	56
	MAR	* ,AR1
	SBRK	36
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	142,000000000H,35

	.sym	_UpdateMotorTest,_UpdateMotorTest,32,2,0
	.globl	_UpdateMotorTest

	.func	145
******************************************************
* FUNCTION DEF : _UpdateMotorTest
******************************************************
_UpdateMotorTest:

LF7	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF7,2,9,16
	.sym	_pwmPercent,-4+LF7,4,9,16
	.sym	_deltaPwm,1,2,1,16
	.sym	_numerator,2,5,1,32
	.sym	_maxPwm,4,4,1,16
	.line	2
	.line	4
	LACK	1
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	5
	LACK	0
	SACL	*+
	SACH	*+
	.line	6
	SPLK	#4000,* 
	.line	11
	SBRK	7-LF7
	LAC	* ,AR1
	SACL	*+
	CALL	_GetRPM
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
	MAR	*+
	SACL	* ,AR2
	.line	13
	SSXM
	LAC	* 
	SUBK	6
	BGEZ	L13
	.line	14
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* ,AR2
	MAR	*-
	SUBS	* 
	BGEZ	L14
	.line	15
	MAR	*+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* 
	SUBK	90
	BGEZ	L14
	.line	16
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	LAC	* ,AR2
	ADRK	4-LF7
	ADD	* ,AR1
	SACL	*+,AR2
	SBRK	4-LF7
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L14:
	.line	19
	MAR	* ,AR2
	LARK	AR2,-3+LF7
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* ,AR2
	MAR	*-
	SUBS	* 
	BLEZ	L16
	.line	20
	MAR	*+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	12
	ZALS	* 
	SUBK	1
	BLEZ	L16
	.line	21
	MAR	* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	11
	LAC	* ,AR2
	ADRK	4-LF7
	SUB	* ,AR1
	SACL	*+,AR2
	SBRK	4-LF7
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	LAC	* ,AR3
	ADRK	11
	SACL	* 
L16:
	.line	27
	MAR	* ,AR1
	LALK	FL7
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LARK	AR2,-3+LF7
	MAR	*0+
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
	ADRK	5-LF7
	SACL	*+
	SACH	*+
	.line	28
	SSXM
	LAC	* ,AR1
	SACL	*+
	SACH	*+,AR2
	SBRK	2
	ZALS	*+
	ADDH	* ,AR1
	CALL	L$$DIVS
	SACL	*+,AR2
	SBRK	6-LF7
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
L13:
EPI0_7:
	.line	31
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	175,000000000H,5

	.sym	_ApplyPwmTest,_ApplyPwmTest,32,2,0
	.globl	_ApplyPwmTest

	.func	179
******************************************************
* FUNCTION DEF : _ApplyPwmTest
******************************************************
_ApplyPwmTest:

LF8	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF8,2,9,16
	.line	2
	SSXM
	LARK	AR2,-3+LF8
	MAR	*0+
	LAC	* 
	BNZ	L18
	.line	3
	LRLK	AR3,_M+11
	LARK	AR4,29720
	MAR	* ,AR3
	LAC	* ,AR4
	SACL	* 
L18:
	.line	5
	MAR	* ,AR2
	LAC	* 
	SUBK	1
	BNZ	L19
	.line	6
	LRLK	AR3,_M+31
	LARK	AR4,29721
	MAR	* ,AR3
	LAC	* ,AR4
	SACL	* 
L19:
	.line	8
	MAR	* ,AR2
	LAC	* 
	SUBK	2
	BNZ	L20
	.line	9
	LRLK	AR3,_M+51
	LARK	AR4,29719
	MAR	* ,AR3
	LAC	* ,AR4
	SACL	* 
L20:
	.line	11
	MAR	* ,AR2
	LAC	* 
	SUBK	3
	BNZ	L21
	.line	12
	LRLK	AR3,_M+71
	LARK	AR4,29702
	MAR	* ,AR3
	LAC	* ,AR4
	SACL	* 
L21:
	.line	14
	MAR	* ,AR2
	LAC	* 
	SUBK	4
	BNZ	L22
	.line	15
	LRLK	AR3,_M+91
	LARK	AR4,29958
	MAR	* ,AR3
	LAC	* ,AR4
	SACL	* 
L22:
	.line	17
	MAR	* ,AR2
	LAC	* 
	SUBK	5
	BNZ	L23
	.line	18
	LRLK	AR3,_M+111
	LARK	AR4,29698
	MAR	* ,AR3
	LAC	* ,AR4
	SACL	* 
L23:
EPI0_8:
	.line	19
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	197,000000000H,1

	.sym	_CheckPassword,_CheckPassword,34,2,0
	.globl	_CheckPassword

	.func	199
******************************************************
* FUNCTION DEF : _CheckPassword
******************************************************
_CheckPassword:

LF9	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,49
	LAR	AR0,*0+,AR2

	.sym	_GetPsw,-3+LF9,12,9,16
	.sym	_psw,1,12,1,16
	.sym	_Skey1,2,14,1,16
	.sym	_i,3,14,1,16
	.sym	_j,4,14,1,16
	.sym	_digit,5,12,1,16
	.sym	_cnt1,6,14,1,16
	.sym	_cnt2,7,14,1,16
	.sym	_cnt3,8,14,1,16
	.sym	_cnt4,9,14,1,16
	.sym	_EntPsw,10,50,1,272,,17
	.sym	_PassWord,27,14,1,16
	.sym	_PassWordBl,28,14,1,16
	.line	2
	.line	3
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	4
	LACK	255
	SACL	* 
	.line	5
	LACK	0
	ADRK	2
	SACL	*+
	.line	6
	LACK	4
	SACL	*+
	.line	7
	LACK	0
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	.line	8
	LACK	69
	SACL	*+
	LACK	110
	SACL	*+
	LACK	116
	SACL	*+
	LACK	101
	SACL	*+
	LACK	114
	SACL	*+
	LACK	32
	SACL	*+
	LACK	80
	SACL	*+
	LACK	97
	SACL	*+
	LACK	115
	SACL	*+
	SACL	*+
	LACK	119
	SACL	*+
	LACK	111
	SACL	*+
	LACK	114
	SACL	*+
	LACK	100
	SACL	*+
	LACK	32
	SACL	*+
	SACL	*+
	LACK	0
	SACL	*+
	.line	9
	SACL	*+
	.line	10
	SACL	* ,AR1
	.line	12
	CALL	_DispClear
	.line	13
	LACK	16
	SACL	*+,AR3
	LARK	AR3,10
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	14
	LACK	1
	SACL	*+
	LACK	300
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	16
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	SUBK	4
	BZ	L25
	MAR	* ,AR1
L24:
	.line	19
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	20
	LAC	* 
	SUBK	1
	BNZ	L26
	.line	22
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	24
	MAR	* ,AR2
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L27
	.line	26
	MAR	*+
	LAC	* 
	ADDK	1
	SACL	* 
	.line	27
	LAC	* 
	SUBK	10
	BNZ	L27
	.line	28
	LACK	0
	SACL	* 
L27:
	.line	30
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L29
	.line	32
	ADRK	2
	LAC	* 
	ADDK	1
	SACL	* 
	.line	33
	LAC	* 
	SUBK	10
	BNZ	L29
	.line	34
	LACK	0
	SACL	* 
L29:
	.line	36
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L31
	.line	38
	ADRK	3
	LAC	* 
	ADDK	1
	SACL	* 
	.line	39
	LAC	* 
	SUBK	10
	BNZ	L31
	.line	40
	LACK	0
	SACL	* 
L31:
	.line	42
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L26
	.line	44
	ADRK	4
	LAC	* 
	ADDK	1
	SACL	* 
	.line	45
	LAC	* 
	SUBK	10
	BNZ	L26
	.line	46
	LACK	0
	SACL	* 
L26:
	.line	51
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L35
	.line	53
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	54
	MAR	* ,AR2
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	1
	SACL	* 
	.line	55
	LAC	* 
	BNZ	L35
	.line	56
	LACK	4
	SACL	* 
L35:
	.line	59
	LARK	AR2,8
	MAR	*0+
	LT	*+
	MPYK	100
	PAC
	LT	* 
	MPYK	1000
	APAC
	SBRK	2
	LT	*-
	MPYK	10
	APAC
	ADD	* 
	ADRK	21
	SACL	* 
	.line	61
	SBRK	22
	LAC	* 
	SUBK	4
	BNZ	L37
	LACK	38
	ADRK	23
	SACL	* 
L37:
	.line	62
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L38
	LACK	39
	ADRK	23
	SACL	* 
L38:
	.line	63
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L39
	LACK	40
	ADRK	23
	SACL	* 
L39:
	.line	64
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L40
	LACK	41
	ADRK	23
	SACL	* 
L40:
	.line	66
	LARK	AR2,4
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	.line	67
	LAC	* 
	SUBK	20000
	BZ	LL13
	SBRK	2
	LAC	* 
	SUBK	255
	BZ	L41
LL13:
	MAR	* ,AR1
	LACK	64
	SACL	*+
	LACK	38
	SACL	*+,AR2
	LARK	AR2,27
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
L41:
	.line	68
	MAR	* ,AR2
	LARK	AR2,4
	MAR	*0+
	ZALS	* 
	BNV	$+2
	ADRK	25
	SACL	*+
	SACH	*-
	LT	*+
	MPYK	1
	LPH	* 
	RSXM
	LACK	60000
	SPAC
	BNV	$+6
	BLZ	L42
	B	$+4
	BGZ	L42
	SBRK	28
	LAC	* 
	SUBK	255
	BNZ	L42
	MAR	* ,AR1
	LACK	1
	SACL	*+,AR2
	ADRK	26
	LAC	* ,AR1
	SACL	*+
	SACL	*+
	CALL	_DispNo
	SBRK	3
	LACK	0
	MAR	* ,AR2
	LARK	AR2,4
	MAR	*0+
	SACL	* 
L42:
	.line	70
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L43
	.block	70
	.sym	_PswEr,29,50,1,320,,20
	.line	72
	LACK	80
	ADRK	27
	SACL	*+
	LACK	115
	SACL	*+
	LACK	119
	SACL	*+
	LACK	32
	SACL	*+
	LACK	69
	SACL	*+
	LACK	114
	SACL	*+
	SACL	*+
	LACK	111
	SACL	*+
	LACK	114
	SACL	*+
	LACK	46
	SACL	*+
	SACL	*+
	LACK	32
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	SACL	*+
	LACK	0
	SACL	* 
	.line	73
	SBRK	21
	LAC	* 
	SBRK	30-LF9
	SUB	* 
	BNZ	L44
	LACK	6
	ADRK	4-LF9
	SACL	* 
	B	L45
L44:
	MAR	* ,AR1
	LACK	32
	SACL	*+,AR3
	LARK	AR3,29
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	LACK	1
	SACL	*+
	LACK	500
	SACL	*+
	CALL	_delay
	SBRK	2
	LACK	0
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
L45:
	.line	74
	LACK	4
	MAR	*+
	SACL	* 
	.endblock	74
L43:
	.line	16
	LAC	* ,AR1
	SUBK	4
	BNZ	L24
L25:
	.line	77
	CALL	_DispClear,AR1
	.line	78
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
EPI0_9:
	.line	79
	MAR	* ,AR1
	SBRK	50
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	277,000000000H,49

	.sym	_OverloadLogic,_OverloadLogic,34,3,0

	.func	279
******************************************************
* FUNCTION DEF : _OverloadLogic
******************************************************
_OverloadLogic:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,47
	LAR	AR0,*0+,AR2

	.sym	_breakout1,1,2,1,16
	.sym	_overload,2,50,1,288,,18
	.sym	_msg1,20,50,1,256,,16
	.sym	_msg2,36,50,1,128,,8
	.sym	_key,44,2,1,16
	.sym	_out,45,2,1,16
	.sym	_datasetNo,46,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	LACK	67
	SACL	*+
	LACK	117
	SACL	*+
	LACK	114
	SACL	*+
	SACL	*+
	LACK	101
	SACL	*+
	LACK	110
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	79
	SACL	*+
	LACK	118
	SACL	*+
	LACK	101
	SACL	*+
	LACK	114
	SACL	*+
	LACK	108
	SACL	*+
	LACK	111
	SACL	*+
	LACK	97
	SACL	*+
	LACK	100
	SACL	*+
	LACK	33
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	LACK	79
	SACL	*+
	LACK	118
	SACL	*+
	LACK	101
	SACL	*+
	LACK	114
	SACL	*+
	LACK	108
	SACL	*+
	LACK	111
	SACL	*+
	LACK	97
	SACL	*+
	LACK	100
	SACL	*+
	LACK	68
	SACL	*+
	LACK	97
	SACL	*+
	LACK	116
	SACL	*+
	LACK	97
	SACL	*+
	LACK	32
	SACL	*+
	LACK	105
	SACL	*+
	LACK	110
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	LACK	68
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
	.line	6
	SACL	*+
	.line	7
	SACL	*+
	.line	8
	SACL	* 
	.line	10
	LDPK	_OV+1
	LAC	_OV+1
	SUBK	1
	BNZ	L46
	.line	11
	CALL	_StopAllMotors,AR1
	.line	12
	CALL	_DispClear
	.line	13
 setc INTM
	.line	14
	LACK	16
	SACL	*+
	LDPK	_OV
	LAC	_OV,2
	ADLK	_motorNames+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	15
	LACK	32
	SACL	*+,AR3
	LARK	AR3,2
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	20
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	BNZ	L46
	MAR	* ,AR1
L47:
	.line	22
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,44
	MAR	*0+
	SACL	* 
	.line	23
	SSXM
	LAC	* 
	SUBK	3
	BNZ	L49
	.line	24
	LACK	1
	SBRK	43
	SACL	* ,AR1
	.line	25
	CALL	_DispClear
	.line	26
	LACK	1
	SACL	*+
	LACK	1000
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	27
	LACK	1
	MAR	* ,AR2
	LARK	AR2,45
	MAR	*0+
	SACL	* 
L49:
	.line	20
	SSXM
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR1
	BZ	L47
L46:
	.line	31
	SSXM
	MAR	* ,AR2
	LARK	AR2,45
	MAR	*0+
	LAC	* 
EPI0_10:
	.line	32
	MAR	* ,AR1
	SBRK	48
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	310,000000000H,47
*************************************************
* DEFINE FLOATING POINT CONSTANTS               *
*************************************************
	.text
FL0:	.float	1.e3
FL1:	.float	1.25e-1
FL2:	.float	1.023e3
FL3:	.float	3.3
FL4:	.float	2.5
FL5:	.float	2.e-2
FL6:	.float	9.8e-1
FL7:	.float	1.e2
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	L$$DIVS
	.global	F$$UTOF
	.global	F$$MUL
	.global	F$$DIV
	.global	F$$SUB
	.global	F$$FTOI
	.global	F$$ADD
	.global	F$$FTOU
	.global	F$$FTOL
	.end
