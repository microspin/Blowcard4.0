*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include initialize.c C:\Users\SIVARA~1\AppData\Local\Temp\initialize.if
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\initialize.if initialize.asm C:\Users\SIVARA~1\AppData\Local\Temp\initialize.tmp 
	.port
	.bss	_Precentagecalc,2,1
	.bss	_Tensiondraft,2,1
	.file	"initialize.c"
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
	.file	"initialize.c"

	.sect	".cinit"
	.word	2,_Precentagecalc
	.float	0.

	.sym	_Precentagecalc,_Precentagecalc,6,2,32
	.globl	_Precentagecalc
	.word	2,_Tensiondraft
	.float	0.

	.sym	_Tensiondraft,_Tensiondraft,6,2,32
	.globl	_Tensiondraft
	.text

	.sym	_Initialize,_Initialize,32,2,0
	.globl	_Initialize

	.func	43
******************************************************
* FUNCTION DEF : _Initialize
******************************************************
_Initialize:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	4
	LARK	AR3,28696
	LACK	141
	SACL	*+
	.line	5
	LACK	11
	OR	* 
	ANDK	15
	SACL	* 
	.line	6
	LACK	232
	ADRK	16
	SACL	* ,AR0
	.line	7
	LACK	64
	SACL	* 
	OUT	* ,0ffffh
	.line	9
	SETC INTM
	.line	15
	MAR	* ,AR3
	ADRK	111
	LACK	1028
	OR	* 
	SACL	* 
	.line	17
	SBRK	8
	SPLK	#13691,* 
	.line	18
	LACK	0
	ADRK	2
	SACL	* 
	.line	19
	ADRK	2
	SPLK	#2944,* 
	.line	22
	LACK	47104
	ADRK	6
	AND	* 
	SACL	* 
	.line	23
	LACK	47104
	OR	* 
	SACL	* 
	.line	26
	ADRK	2
	LAC	* 
	.line	28
	SBRK	6
	LACK	30720
	AND	* 
	SACL	* 
	.line	29
	LACK	30720
	OR	* 
	SACL	* ,AR4
	.line	36
	LARK	AR4,6
	LACK	63
	SACL	* 
	.line	38
	LACK	14
	SBRK	2
	SACL	* 
	.line	50
	LARK	AR5,29743
	SBRK	5
	MAR	* ,AR5
	SAR	AR4,*+
	.line	51
	SAR	AR4,*+
	.line	52
	SAR	AR4,* ,AR4
	.line	53
	MAR	*+,AR5
	SBRK	5
	SAR	AR4,*+,AR4
	.line	54
	MAR	*+,AR5
	SAR	AR4,* ,AR4
	.line	55
	ADRK	6
	MAR	* ,AR5
	MAR	*+
	SAR	AR4,* ,AR4
	.line	57
	LARK	AR5,29999
	SBRK	8
	MAR	* ,AR5
	SAR	AR4,*+
	.line	58
	SAR	AR4,*+
	.line	59
	SAR	AR4,* ,AR4
	.line	60
	ADRK	129
	MAR	* ,AR5
	SBRK	5
	SAR	AR4,* ,AR4
	.line	62
	SBRK	127
	MAR	* ,AR5
	MAR	*+
	SAR	AR4,* ,AR4
	.line	63
	ADRK	6
	MAR	* ,AR5
	MAR	*+
	SAR	AR4,* 
	.line	67
	LARK	AR5,29730
	SPLK	#5376,* 
	.line	68
	SBRK	2
	SPLK	#14076,* 
	.line	70
	LARK	AR5,29986
	SPLK	#5376,* 
	.line	71
	SBRK	2
	SPLK	#12540,* 
	.line	83
	LARK	AR5,29713
	SPLK	#-13824,* ,AR4
	.line	84
	SBRK	7
	MAR	* ,AR5
	ADRK	2
	SAR	AR4,* ,AR4
	.line	88
	ADRK	64
	MAR	* ,AR5
	SBRK	19
	SAR	AR4,* 
	.line	89
	LARK	AR5,29952
	SAR	AR4,* ,AR4
	.line	93
	SBRK	64
	MAR	* ,AR5
	SBRK	252
	SAR	AR4,* 
	.line	94
	ADRK	4
	SAR	AR4,* 
	.line	95
	LARK	AR5,29960
	SAR	AR4,* 
	.line	98
	LARK	AR5,29700
	SPLK	#4106,* 
	.line	99
	SBRK	3
	SAR	AR4,* 
	.line	100
	ADRK	2
	SPLK	#4000,* 
	.line	103
	ADRK	5
	SPLK	#4106,* 
	.line	104
	SBRK	3
	SAR	AR4,* 
	.line	105
	ADRK	2
	SPLK	#4000,* 
	.line	108
	ADRK	253
	SPLK	#4170,* 
	.line	109
	SBRK	3
	SAR	AR4,* 
	.line	110
	ADRK	2
	SPLK	#20000,* 
	.line	113
	ADRK	5
	SPLK	#4106,* 
	.line	114
	SBRK	3
	SAR	AR4,* 
	.line	115
	ADRK	2
	SPLK	#4000,* ,AR1
EPI0_1:
	.line	116
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	158,000000000H,1

	.sym	_MotorStructInit,_MotorStructInit,32,2,0
	.globl	_MotorStructInit

	.func	161
******************************************************
* FUNCTION DEF : _MotorStructInit
******************************************************
_MotorStructInit:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	2
	LACK	0
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+0
	SACL	* ,AR4
	.line	3
	LRLK	AR4,_M+1
	LACK	0
	SACL	* ,AR5
	.line	4
	LRLK	AR5,_M+2
	SACL	* 
	.line	6
	LRLK	AR5,_M+3
	SPLK	#542,* ,AR1
	.line	7
	LACK	10
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+4
	SACL	* ,AR4
	.line	8
	LRLK	AR4,_M+4
	RSXM
	LAC	* ,14,AR5
	LRLK	AR5,_M+5
	SACH	* ,1
	.line	9
	LRLK	AR5,_M+6
	LACK	1
	SACL	* 
	.line	10
	LRLK	AR5,_M+7
	LACK	50
	SACL	* 
	.line	11
	LRLK	AR5,_M+8
	LACK	0
	SACL	* 
	.line	12
	LRLK	AR5,_M+9
	SACL	* 
	.line	13
	LRLK	AR5,_M+10
	SACL	* 
	.line	14
	LRLK	AR5,_M+11
	LACK	10
	SACL	* 
	.line	15
	LRLK	AR5,_M+12
	LACK	0
	SACL	* 
	.line	16
	LRLK	AR5,_M+13
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	17
	LRLK	AR5,_M+15
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	18
	LRLK	AR5,_M+17
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	20
	MAR	* ,AR1
	LACK	2
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+20
	SACL	* ,AR4
	.line	21
	LRLK	AR4,_M+21
	LACK	0
	SACL	* ,AR5
	.line	22
	LRLK	AR5,_M+22
	SACL	* 
	.line	24
	LRLK	AR5,_M+23
	SPLK	#542,* ,AR1
	.line	25
	LACK	12
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+24
	SACL	* ,AR4
	.line	26
	LRLK	AR4,_M+24
	RSXM
	LAC	* ,14,AR5
	LRLK	AR5,_M+25
	SACH	* ,1
	.line	27
	LRLK	AR5,_M+26
	LACK	1
	SACL	* 
	.line	28
	LRLK	AR5,_M+27
	LACK	10
	SACL	* 
	.line	29
	LRLK	AR5,_M+28
	LACK	0
	SACL	* 
	.line	30
	LRLK	AR5,_M+29
	SACL	* 
	.line	31
	LRLK	AR5,_M+30
	SACL	* 
	.line	32
	LRLK	AR5,_M+31
	LACK	10
	SACL	* 
	.line	33
	LRLK	AR5,_M+32
	LACK	0
	SACL	* 
	.line	34
	LRLK	AR5,_M+33
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	35
	LRLK	AR5,_M+35
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	36
	LRLK	AR5,_M+37
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	40
	MAR	* ,AR1
	LALK	FL1
	RPTK	1
	TBLR	*+
	LACK	4
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR0
	SACL	* 
	LT	* 
	LACK	1
	SACL	*
	MPYU	*
	SPL	* 
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	LALK	FL2
	RPTK	1
	TBLR	*+
	CALL	F$$ADD
	MAR	*-
	ZALH	*-
	ADDS	* 
	LDPK	_Precentagecalc
	SACL	_Precentagecalc
	SACH	_Precentagecalc+1
	.line	41
	RPTK	1
	BLKD	_Precentagecalc+0,*+
	LACK	174
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	CALL	F$$UTOF
	CALL	F$$DIV
	MAR	*-
	ZALH	*-
	ADDS	* 
	LDPK	_Tensiondraft
	SACL	_Tensiondraft
	SACH	_Tensiondraft+1
	.line	43
	LALK	FL3
	RPTK	1
	TBLR	*+
	RPTK	1
	BLKD	_Tensiondraft+0,*+
	CALL	F$$DIV
	CALL	F$$FTOU
	LRLK	AR3,_M+40
	MAR	* ,AR3
	SACL	* ,AR4
	.line	44
	LRLK	AR4,_M+41
	LACK	0
	SACL	* ,AR5
	.line	45
	LRLK	AR5,_M+42
	SACL	* 
	.line	46
	LRLK	AR5,_M+43
	SPLK	#639,* ,AR1
	.line	48
	LACK	14
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+44
	SACL	* ,AR4
	.line	49
	LRLK	AR4,_M+44
	RSXM
	LAC	* ,14,AR5
	LRLK	AR5,_M+45
	SACH	* ,1
	.line	50
	LRLK	AR5,_M+46
	LACK	6
	SACL	* 
	.line	51
	LRLK	AR5,_M+47
	LACK	1
	SACL	* 
	.line	52
	LRLK	AR5,_M+48
	LACK	0
	SACL	* 
	.line	53
	LRLK	AR5,_M+49
	SACL	* 
	.line	54
	LRLK	AR5,_M+50
	SACL	* 
	.line	55
	LRLK	AR5,_M+51
	LACK	1
	SACL	* 
	.line	56
	LRLK	AR5,_M+52
	LACK	0
	SACL	* 
	.line	57
	LRLK	AR5,_M+53
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	58
	LRLK	AR5,_M+55
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	59
	LRLK	AR5,_M+57
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	61
	MAR	* ,AR1
	LACK	6
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+60
	SACL	* ,AR4
	.line	62
	LRLK	AR4,_M+61
	LACK	0
	SACL	* ,AR5
	.line	63
	LRLK	AR5,_M+62
	SACL	* 
	.line	64
	LRLK	AR5,_M+63
	SPLK	#639,* ,AR1
	.line	66
	LACK	16
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+64
	SACL	* ,AR4
	.line	67
	LRLK	AR4,_M+64
	RSXM
	LAC	* ,14,AR5
	LRLK	AR5,_M+65
	SACH	* ,1
	.line	68
	LRLK	AR5,_M+66
	LACK	40
	SACL	* 
	.line	69
	LRLK	AR5,_M+67
	LACK	1
	SACL	* 
	.line	70
	LRLK	AR5,_M+68
	LACK	0
	SACL	* 
	.line	71
	LRLK	AR5,_M+69
	SACL	* 
	.line	72
	LRLK	AR5,_M+70
	SACL	* 
	.line	73
	LRLK	AR5,_M+71
	SACL	* 
	.line	74
	LRLK	AR5,_M+72
	LACK	5
	SACL	* 
	.line	75
	LRLK	AR5,_M+73
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	76
	LRLK	AR5,_M+75
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	77
	LRLK	AR5,_M+77
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	79
	MAR	* ,AR1
	LACK	8
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+80
	SACL	* ,AR4
	.line	80
	LRLK	AR4,_M+81
	LACK	0
	SACL	* ,AR5
	.line	81
	LRLK	AR5,_M+82
	SACL	* 
	.line	82
	LRLK	AR5,_M+83
	SPLK	#620,* ,AR1
	.line	84
	LACK	18
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+84
	SACL	* ,AR4
	.line	85
	LRLK	AR4,_M+84
	RSXM
	LAC	* ,14,AR5
	LRLK	AR5,_M+85
	SACH	* ,1
	.line	86
	LRLK	AR5,_M+86
	LACK	40
	SACL	* 
	.line	87
	LRLK	AR5,_M+87
	LACK	1
	SACL	* 
	.line	88
	LRLK	AR5,_M+88
	LACK	0
	SACL	* 
	.line	89
	LRLK	AR5,_M+89
	SACL	* 
	.line	90
	LRLK	AR5,_M+90
	SACL	* 
	.line	91
	LRLK	AR5,_M+91
	SACL	* 
	.line	92
	LRLK	AR5,_M+92
	LACK	5
	SACL	* 
	.line	93
	LRLK	AR5,_M+93
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	94
	LRLK	AR5,_M+95
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	95
	LRLK	AR5,_M+97
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	97
	MAR	* ,AR1
	LALK	FL4
	RPTK	1
	TBLR	*+
	LACK	174
	SACL	*+
	CALL	_EepromRead
	MAR	*-
	CALL	F$$UTOF
	CALL	F$$DIV
	CALL	F$$FTOU
	LRLK	AR3,_M+100
	MAR	* ,AR3
	SACL	* ,AR4
	.line	99
	LRLK	AR4,_M+101
	LACK	0
	SACL	* ,AR5
	.line	100
	LRLK	AR5,_M+102
	SACL	* 
	.line	101
	LRLK	AR5,_M+103
	SPLK	#639,* 
	.line	104
	LRLK	AR5,_M+106
	LACK	10
	SACL	* 
	.line	105
	LRLK	AR5,_M+107
	LACK	1
	SACL	* 
	.line	109
	LRLK	AR5,_M+111
	SACL	* 
	.line	110
	LRLK	AR5,_M+112
	SACL	* ,AR1
	.line	115
	LACK	184
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR3
	LRLK	AR3,_M+140
	SACL	* ,AR4
	.line	116
	LRLK	AR4,_M+141
	LACK	0
	SACL	* ,AR5
	.line	117
	LRLK	AR5,_M+142
	SACL	* 
	.line	119
	LRLK	AR5,_M+147
	LACK	1
	SACL	* ,AR1
EPI0_2:
	.line	121
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	281,000000000H,1

	.sym	_InitMenuStruct,_InitMenuStruct,32,2,0
	.globl	_InitMenuStruct

	.func	284
******************************************************
* FUNCTION DEF : _InitMenuStruct
******************************************************
_InitMenuStruct:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	2
	LRLK	AR3,_U+0
	SPLK	#1800,* ,AR4
	.line	3
	LRLK	AR4,_U+1
	SPLK	#1000,* ,AR5
	.line	4
	LRLK	AR5,_U+2
	SPLK	#1200,* 
	.line	5
	LRLK	AR5,_U+5
	LACK	0
	SACL	* 
	.line	6
	LRLK	AR5,_U+3
	LACK	20
	SACL	* 
	.line	7
	LRLK	AR5,_U+4
	LACK	10
	SACL	* 
	.line	8
	LRLK	AR5,_U+6
	LACK	144
	SACL	* 
	.line	9
	LRLK	AR5,_U+7
	LACK	146
	SACL	* 
	.line	10
	LRLK	AR5,_U+8
	LACK	148
	SACL	* 
	.line	13
	LRLK	AR5,_U+9
	SPLK	#1800,* 
	.line	14
	LRLK	AR5,_U+10
	SPLK	#300,* 
	.line	15
	LRLK	AR5,_U+11
	SPLK	#500,* 
	.line	16
	LRLK	AR5,_U+14
	LACK	2
	SACL	* 
	.line	17
	LRLK	AR5,_U+12
	LACK	22
	SACL	* 
	.line	18
	LRLK	AR5,_U+13
	LACK	12
	SACL	* 
	.line	19
	LRLK	AR5,_U+15
	LACK	150
	SACL	* 
	.line	20
	LRLK	AR5,_U+16
	LACK	152
	SACL	* 
	.line	21
	LRLK	AR5,_U+17
	LACK	154
	SACL	* 
	.line	25
	LRLK	AR5,_U+18
	LACK	20
	SACL	* 
	.line	26
	LRLK	AR5,_U+19
	LACK	1
	SACL	* 
	.line	27
	LRLK	AR5,_U+20
	LACK	3
	SACL	* 
	.line	28
	LRLK	AR5,_U+23
	LACK	4
	SACL	* 
	.line	29
	LRLK	AR5,_U+21
	LACK	24
	SACL	* 
	.line	30
	LRLK	AR5,_U+22
	LACK	14
	SACL	* 
	.line	31
	LRLK	AR5,_U+24
	LACK	156
	SACL	* 
	.line	32
	LRLK	AR5,_U+25
	LACK	158
	SACL	* 
	.line	33
	LRLK	AR5,_U+26
	LACK	160
	SACL	* 
	.line	35
	LRLK	AR5,_U+27
	LACK	75
	SACL	* 
	.line	36
	LRLK	AR5,_U+28
	LACK	3
	SACL	* 
	.line	37
	LRLK	AR5,_U+29
	LACK	15
	SACL	* 
	.line	38
	LRLK	AR5,_U+32
	LACK	6
	SACL	* 
	.line	39
	LRLK	AR5,_U+30
	LACK	26
	SACL	* 
	.line	40
	LRLK	AR5,_U+31
	LACK	16
	SACL	* 
	.line	41
	LRLK	AR5,_U+33
	LACK	162
	SACL	* 
	.line	42
	LRLK	AR5,_U+34
	LACK	164
	SACL	* 
	.line	43
	LRLK	AR5,_U+35
	LACK	166
	SACL	* 
	.line	45
	LRLK	AR5,_U+36
	LACK	90
	SACL	* 
	.line	46
	LRLK	AR5,_U+37
	LACK	3
	SACL	* 
	.line	47
	LRLK	AR5,_U+38
	LACK	15
	SACL	* 
	.line	48
	LRLK	AR5,_U+41
	LACK	8
	SACL	* 
	.line	49
	LRLK	AR5,_U+39
	LACK	28
	SACL	* 
	.line	50
	LRLK	AR5,_U+40
	LACK	18
	SACL	* 
	.line	51
	LRLK	AR5,_U+42
	LACK	168
	SACL	* 
	.line	52
	LRLK	AR5,_U+43
	LACK	170
	SACL	* 
	.line	53
	LRLK	AR5,_U+44
	LACK	172
	SACL	* 
	.line	55
	LRLK	AR5,_U+45
	LACK	41
	SACL	* 
	.line	56
	LRLK	AR5,_U+46
	LACK	5
	SACL	* 
	.line	57
	LRLK	AR5,_U+47
	LACK	20
	SACL	* 
	.line	58
	LRLK	AR5,_U+50
	LACK	174
	SACL	* 
	.line	65
	LRLK	AR5,_U+63
	SPLK	#300,* 
	.line	66
	LRLK	AR5,_U+64
	LACK	1
	SACL	* 
	.line	67
	LRLK	AR5,_U+65
	LACK	4
	SACL	* 
	.line	68
	LRLK	AR5,_U+68
	LACK	184
	SACL	* ,AR1
EPI0_3:
	.line	71
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	354,000000000H,1

	.sym	_InitOptionsStruct,_InitOptionsStruct,32,2,0
	.globl	_InitOptionsStruct

	.func	356
******************************************************
* FUNCTION DEF : _InitOptionsStruct
******************************************************
_InitOptionsStruct:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	2
	LACK	0
	LDPK	_O
	SACL	_O
	.line	3
	LDPK	_O+1
	SACL	_O+1
	.line	4
	LDPK	_O+2
	SACL	_O+2
	.line	5
	LDPK	_O+3
	SACL	_O+3
	.line	6
	LDPK	_O+4
	SPLK	#65535,_O+4
	.line	7
	LDPK	_O+5
	SACL	_O+5
	.line	8
	LDPK	_O+6
	SACL	_O+6
	.line	9
	LDPK	_O+7
	SACL	_O+7
	.line	10
	LDPK	_O+8
	SACL	_O+8
EPI0_4:
	.line	11
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	366,000000000H,1

	.sym	_InitOverloadStruct,_InitOverloadStruct,32,2,0
	.globl	_InitOverloadStruct

	.func	368
******************************************************
* FUNCTION DEF : _InitOverloadStruct
******************************************************
_InitOverloadStruct:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	2
	LDPK	_OV
	SPLK	#65535,_OV
	.line	3
	LACK	0
	LDPK	_OV+1
	SACL	_OV+1
	.line	4
	LDPK	_OV+2
	SACL	_OV+2
EPI0_5:
	.line	6
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	373,000000000H,1

	.sym	_InitMotorHardware,_InitMotorHardware,32,2,0
	.globl	_InitMotorHardware

	.func	375
******************************************************
* FUNCTION DEF : _InitMotorHardware
******************************************************
_InitMotorHardware:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_i,1,2,1,16
	.line	4
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	5
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BGEZ	L2
L1:
	.line	6
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	MAR	*+
	SACL	* ,AR2
	.line	5
	LAC	* 
	ADDK	1
	SACL	* 
	LAC	* 
	SUBK	6
	BLZ	L1
L2:
	.line	9
	LRLK	AR3,_M+51
	LARK	AR4,29719
	MAR	* ,AR3
	LAC	* ,AR4
	SACL	*+,AR5
	.line	10
	LRLK	AR5,_M+11
	LAC	* ,AR4
	SACL	*+,AR5
	.line	11
	LRLK	AR5,_M+31
	LAC	* ,AR4
	SACL	* ,AR5
	.line	12
	LRLK	AR5,_M+112
	LAC	* ,AR4
	SBRK	23
	SACL	* ,AR5
	.line	13
	LRLK	AR5,_M+72
	LAC	* ,AR4
	ADRK	4
	SACL	* ,AR5
	.line	14
	LRLK	AR5,_M+92
	LARK	AR4,29958
	LAC	* ,AR4
	SACL	* 
	.line	17
	SBRK	215
	SPLK	#-1,*+
	.line	18
	SPLK	#-1,*+
	.line	19
	SPLK	#-1,* 
	.line	21
	ADRK	254
	SPLK	#-1,*+
	.line	22
	SPLK	#-1,*+
	.line	23
	SPLK	#-1,* ,AR5
	.line	26
	LARK	AR5,29700
	SPLK	#4170,* 
	.line	27
	LACK	0
	SBRK	3
	SACL	* 
	.line	28
	ADRK	2
	SPLK	#4000,* 
	.line	31
	ADRK	5
	SPLK	#4170,* 
	.line	32
	SBRK	3
	SACL	* 
	.line	33
	ADRK	2
	SPLK	#4000,* ,AR4
	.line	36
	SBRK	45
	SPLK	#4170,* 
	.line	37
	SBRK	3
	SACL	* 
	.line	38
	ADRK	2
	SPLK	#20000,* 
	.line	41
	ADRK	5
	SPLK	#4170,* 
	.line	42
	SBRK	3
	SACL	* 
	.line	43
	ADRK	2
	SPLK	#4000,* 
	.line	45
	SBRK	244
	SPLK	#272,* ,AR5
	.line	47
	LARK	AR5,28824
	LACK	65531
	AND	* 
	SACL	* 
	.line	49
	LARK	AR5,6
	LACK	63
	SACL	* ,AR1
EPI0_6:
	.line	50
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	424,000000000H,2

	.sym	_InitMotorHardwareTest,_InitMotorHardwareTest,32,2,0
	.globl	_InitMotorHardwareTest

	.func	426
******************************************************
* FUNCTION DEF : _InitMotorHardwareTest
******************************************************
_InitMotorHardwareTest:

LF7	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF7,2,9,16
	.sym	_i,1,2,1,16
	.line	2
	.line	5
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	6
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BGEZ	L4
L3:
	.line	7
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	MAR	*+
	SACL	* ,AR2
	.line	6
	LAC	* 
	ADDK	1
	SACL	* 
	LAC	* 
	SUBK	6
	BLZ	L3
L4:
	.line	10
	LRLK	AR3,_M+51
	LARK	AR4,29719
	MAR	* ,AR3
	LAC	* ,AR4
	SACL	*+,AR5
	.line	11
	LRLK	AR5,_M+11
	LAC	* ,AR4
	SACL	*+,AR5
	.line	12
	LRLK	AR5,_M+31
	LAC	* ,AR4
	SACL	* ,AR5
	.line	13
	LRLK	AR5,_M+112
	LAC	* ,AR4
	SBRK	23
	SACL	* ,AR5
	.line	14
	LRLK	AR5,_M+72
	LAC	* ,AR4
	ADRK	4
	SACL	* ,AR5
	.line	15
	LRLK	AR5,_M+92
	LARK	AR4,29958
	LAC	* ,AR4
	SACL	* 
	.line	18
	SBRK	215
	SPLK	#-1,*+
	.line	19
	SPLK	#-1,*+
	.line	20
	SPLK	#-1,* 
	.line	22
	ADRK	254
	SPLK	#-1,*+
	.line	23
	SPLK	#-1,*+
	.line	24
	SPLK	#-1,* ,AR5
	.line	27
	LARK	AR5,29700
	SPLK	#4170,* 
	.line	28
	LACK	0
	SBRK	3
	SACL	* 
	.line	29
	ADRK	2
	SPLK	#4000,* 
	.line	32
	ADRK	5
	SPLK	#4170,* 
	.line	33
	SBRK	3
	SACL	* 
	.line	34
	ADRK	2
	SPLK	#4000,* ,AR4
	.line	37
	SBRK	45
	SPLK	#4170,* 
	.line	38
	SBRK	3
	SACL	* 
	.line	39
	ADRK	2
	SPLK	#20000,* 
	.line	42
	ADRK	5
	SPLK	#4170,* 
	.line	43
	SBRK	3
	SACL	* 
	.line	44
	ADRK	2
	SPLK	#4000,* ,AR5
	.line	46
	LARK	AR5,28824
	LACK	65531
	AND	* 
	SACL	* 
	.line	48
	LARK	AR5,6
	LACK	63
	SACL	* ,AR2
	.line	52
	SBRK	4-LF7
	LAC	* 
	BNZ	L5
	.line	53
	LARK	AR5,29696
	LACK	64
	MAR	* ,AR5
	SACL	* ,AR4
	.line	54
	SBRK	7
	SACL	* 
	.line	55
	LACK	16
	SBRK	237
	SACL	* 
L5:
	.line	57
	MAR	* ,AR2
	LAC	* 
	SUBK	1
	BNZ	L6
	.line	58
	LARK	AR4,29696
	LACK	64
	MAR	* ,AR4
	SACL	* ,AR5
	.line	59
	LARK	AR5,29952
	SACL	* ,AR4
	.line	60
	ADRK	19
	SPLK	#256,* 
L6:
	.line	62
	MAR	* ,AR2
	LAC	* 
	SUBK	2
	BNZ	L7
	.line	63
	LARK	AR4,29696
	LACK	64
	MAR	* ,AR4
	SACL	* ,AR5
	.line	64
	LARK	AR5,29952
	SACL	* ,AR4
	.line	65
	LACK	1
	ADRK	19
	SACL	* 
L7:
	.line	67
	MAR	* ,AR2
	LAC	* 
	SUBK	3
	BNZ	L8
	.line	68
	LARK	AR4,29715
	LACK	0
	MAR	* ,AR4
	SACL	* 
	.line	69
	LACK	64
	ADRK	237
	SACL	* ,AR5
	.line	70
	LARK	AR5,29696
	LACK	68
	SACL	* 
L8:
	.line	72
	MAR	* ,AR2
	LAC	* 
	SUBK	4
	BNZ	L9
	.line	73
	LARK	AR4,29715
	LACK	0
	MAR	* ,AR4
	SACL	* 
	.line	74
	LACK	64
	SBRK	19
	SACL	* ,AR5
	.line	75
	LARK	AR5,29952
	LACK	68
	SACL	* 
L9:
	.line	77
	MAR	* ,AR2
	LAC	* 
	SUBK	5
	BNZ	L10
	.line	78
	LARK	AR4,29715
	LACK	0
	MAR	* ,AR4
	SACL	* 
	.line	79
	LACK	64
	ADRK	237
	SACL	* ,AR5
	.line	80
	LARK	AR5,29696
	LACK	65
	SACL	* 
L10:
EPI0_7:
	.line	81
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	506,000000000H,2

	.sym	_InitMotorPID,_InitMotorPID,32,2,0
	.globl	_InitMotorPID

	.func	508
******************************************************
* FUNCTION DEF : _InitMotorPID
******************************************************
_InitMotorPID:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,8
	LAR	AR0,*0+,AR2

	.sym	_i,1,2,1,16
	.sym	_pidValue1,2,6,1,32
	.sym	_pidValue2,4,6,1,32
	.sym	_pidValue3,6,6,1,32
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	4
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	5
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	7
	LACK	0
	SBRK	7
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BGEZ	L12
L11:
	.line	8
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	ADRK	10
	SACL	* ,AR2
	.line	9
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	ADRK	8
	SACL	* ,AR2
	.line	10
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	ADRK	9
	SACL	* ,AR2
	.line	12
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
	MAR	*-
	CALL	F$$UTOF
	MAR	*-
	ZALH	*-
	ADDS	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	*+
	SACH	*-,AR1
	.line	13
	LALK	FL5
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LAC	*+,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	F$$DIV
	MAR	* ,AR2
	SBRK	2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	ZALH	*-
	ADDS	* ,AR3
	ADRK	17
	SACL	*+
	SACH	*-,AR2
	.line	15
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
	MAR	*-
	CALL	F$$UTOF
	MAR	*-
	ZALH	*-
	ADDS	* ,AR2
	LARK	AR2,4
	MAR	*0+
	SACL	*+
	SACH	*-,AR1
	.line	16
	LALK	FL5
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LAC	*+,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	F$$DIV
	MAR	* ,AR2
	SBRK	4
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	ZALH	*-
	ADDS	* ,AR3
	ADRK	13
	SACL	*+
	SACH	*-,AR2
	.line	18
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
	MAR	*-
	CALL	F$$UTOF
	MAR	*-
	ZALH	*-
	ADDS	* ,AR2
	LARK	AR2,6
	MAR	*0+
	SACL	*+
	SACH	*-,AR1
	.line	19
	LALK	FL5
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LAC	*+,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	F$$DIV
	MAR	* ,AR2
	SBRK	6
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	MAR	*-
	ZALH	*-
	ADDS	* ,AR3
	ADRK	15
	SACL	*+
	SACH	*-,AR2
	.line	7
	LAC	* 
	ADDK	1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	5
	BLZ	L11
L12:
EPI0_8:
	.line	22
	MAR	* ,AR1
	SBRK	9
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	529,000000000H,8
*************************************************
* DEFINE FLOATING POINT CONSTANTS               *
*************************************************
	.text
FL0:	.float	0.
FL1:	.float	1.e-2
FL2:	.float	1.
FL3:	.float	3.3339e-2
FL4:	.float	3.9821e-2
FL5:	.float	1.e2
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	F$$UTOF
	.global	F$$MUL
	.global	F$$ADD
	.global	F$$DIV
	.global	F$$FTOU
	.end
