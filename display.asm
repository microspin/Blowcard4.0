*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include display.c C:\Users\SIVARA~1\AppData\Local\Temp\display.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\display.if display.asm C:\Users\SIVARA~1\AppData\Local\Temp\display.tmp 
	.port
	.bss	_f,1,1
	.file	"display.c"
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
	.file	"display.c"

	.sect	".cinit"
	.word	1,_f
	.word	0

	.sym	_f,_f,14,3,16
	.text

	.sym	_convert_decimal,_convert_decimal,46,3,0

	.func	31
******************************************************
* FUNCTION DEF : _convert_decimal
******************************************************
_convert_decimal:

LF1	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+

	.sym	_temp1,-3+LF1,14,9,16
	.sym	_temp,1,14,1,16
	.sym	_temp2,2,14,1,16
	.line	2
	.line	6
	LACK	1000
	SACL	*+,AR2
	LARK	AR2,-3+LF1
	MAR	*0+
	ZALS	* ,AR1
	CALL	I$$UDIV
	MAR	* ,AR2
	ADRK	4-LF1
	SACL	*+,AR0
	.line	7
	SACL	* 
	LAC	* ,12,AR2
	SACL	*-
	.line	8
	LT	* 
	MPYK	1000
	SBRK	4-LF1
	LAC	* 
	SPAC
	SACL	* ,AR1
	.line	9
	LACK	100
	SACL	*+,AR2
	ZALS	* ,AR1
	CALL	I$$UDIV
	MAR	* ,AR2
	ADRK	4-LF1
	SACL	* 
	.line	10
	LAC	*+,8
	ADD	* 
	SACL	*-
	.line	11
	LT	* 
	MPYK	100
	SBRK	4-LF1
	LAC	* 
	SPAC
	SACL	* ,AR1
	.line	12
	LACK	10
	SACL	*+,AR2
	ZALS	* ,AR1
	CALL	I$$UDIV
	MAR	* ,AR2
	ADRK	4-LF1
	SACL	* 
	.line	13
	LAC	*+,4
	ADD	* 
	SACL	*-
	.line	14
	LT	* 
	MPYK	10
	SBRK	4-LF1
	LAC	* 
	SPAC
	SACL	* 
	.line	15
	LAC	* 
	ADRK	4-LF1
	SACL	* 
	.line	16
	LAC	*+
	ADD	* 
	SACL	* 
	.line	17
	ZALS	* 
EPI0_1:
	.line	18
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	48,000000000H,3

	.sym	_WriteByte,_WriteByte,32,3,0

	.func	50
******************************************************
* FUNCTION DEF : _WriteByte
******************************************************
_WriteByte:

LF2	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_value,-3+LF2,14,9,16
	.line	2
	.line	15
	LACK	15
	LARK	AR2,-3+LF2
	MAR	*0+
	AND	* 
	SACL	* ,AR3
	.line	17
	LARK	AR3,28821
	SPLK	#32544,* ,AR1
	.line	18
	CALL	_delay1ms
	.line	22
	LARK	AR3,28821
	LACK	16
	MAR	* ,AR3
	OR	* 
	SACL	* ,AR1
	.line	23
	CALL	_delay1us
	.line	24
	LDPK	_f
	LAC	_f
	SUBK	1
	BNZ	L1
	.line	25
	LARK	AR3,28821
	MAR	* ,AR3
	SPLK	#32544,* 
	B	L2
L1:
	.line	27
	LARK	AR3,28821
	MAR	* ,AR3
	SPLK	#32608,* 
L2:
	.line	28
	CALL	_delay1us,AR1
	.line	30
	LARK	AR3,28821
	LACK	65520
	MAR	* ,AR3
	AND	* 
	SACL	* 
	.line	31
	LAC	* ,AR2
	LARK	AR2,-3+LF2
	MAR	*0+
	OR	* ,AR3
	SACL	* ,AR1
	.line	32
	CALL	_delay1us
	.line	33
	LARK	AR3,28821
	LACK	65503
	MAR	* ,AR3
	AND	* 
	SACL	* ,AR1
	.line	34
	CALL	_delay1us
	.line	35
	LARK	AR3,28821
	LACK	16
	MAR	* ,AR3
	OR	* 
	SACL	* ,AR1
	.line	36
	CALL	_delay1us
	.line	37
	LARK	AR3,28821
	LACK	65519
	MAR	* ,AR3
	AND	* 
	SACL	* ,AR1
	.line	38
	CALL	_delay1us
	.line	39
	LARK	AR3,28821
	LACK	32
	MAR	* ,AR3
	OR	* 
	SACL	* ,AR1
	.line	40
	CALL	_delay1us
EPI0_2:
	.line	41
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	90,000000000H,1

	.sym	_WriteCtrl,_WriteCtrl,32,3,0

	.func	92
******************************************************
* FUNCTION DEF : _WriteCtrl
******************************************************
_WriteCtrl:

LF3	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_value,-3+LF3,14,9,16
	.line	2
	.line	4
	LACK	1
	LDPK	_f
	SACL	_f
	.line	5
	RSXM
	LARK	AR2,-3+LF3
	MAR	*0+
	LAC	* ,11,AR1
	SACH	*+,1
	CALL	_WriteByte
	MAR	*-
	.line	6
	CALL	_delay1ms
	.line	7
	CALL	_delay1ms
	.line	9
	MAR	* ,AR2
	LARK	AR2,-3+LF3
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_WriteByte
	MAR	*-
EPI0_3:
	.line	10
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	101,000000000H,1

	.sym	_WriteData,_WriteData,32,3,0

	.func	103
******************************************************
* FUNCTION DEF : _WriteData
******************************************************
_WriteData:

LF4	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_value,-3+LF4,14,9,16
	.line	2
	.line	3
	LACK	255
	LDPK	_f
	SACL	_f
	.line	4
	RSXM
	LARK	AR2,-3+LF4
	MAR	*0+
	LAC	* ,11,AR1
	SACH	*+,1
	CALL	_WriteByte
	MAR	*-
	.line	5
	CALL	_delay1ms
	.line	6
	CALL	_delay1ms
	.line	8
	MAR	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_WriteByte
	MAR	*-
EPI0_4:
	.line	9
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	111,000000000H,1

	.sym	_DispInit,_DispInit,32,2,0
	.globl	_DispInit

	.func	115
******************************************************
* FUNCTION DEF : _DispInit
******************************************************
_DispInit:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	5
	CALL	_delay1ms
	.line	6
	CALL	_delay1ms
	.line	7
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	10
	LACK	1
	LDPK	_f
	SACL	_f
	.line	12
	LACK	2
	SACL	*+
	CALL	_WriteByte
	MAR	*-
	.line	13
	CALL	_delay1ms
	.line	16
	LACK	2
	SACL	*+
	CALL	_WriteByte
	MAR	*-
	.line	17
	CALL	_delay1ms
	.line	21
	LACK	2
	SACL	*+
	CALL	_WriteByte
	MAR	*-
	.line	22
	CALL	_delay1ms
	.line	24
	LACK	40
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
	.line	25
	CALL	_delay1ms
	.line	27
	LACK	20
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
	.line	28
	CALL	_delay1ms
	.line	30
	LACK	8
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
	.line	31
	CALL	_delay1ms
	.line	33
	LACK	14
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
	.line	34
	CALL	_delay1ms
	.line	36
	LACK	6
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
	.line	37
	CALL	_delay1ms
	.line	39
	LACK	1
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
	.line	40
	CALL	_delay1ms
	.line	41
	CALL	_delay1ms
	.line	44
	LACK	2
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
	.line	45
	CALL	_delay1ms
EPI0_5:
	.line	48
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	162,000000000H,1

	.sym	_DispClear,_DispClear,32,2,0
	.globl	_DispClear

	.func	164
******************************************************
* FUNCTION DEF : _DispClear
******************************************************
_DispClear:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	4
	LACK	1
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
	.line	5
	CALL	_delay1ms
	.line	6
	CALL	_delay1ms
EPI0_6:
	.line	8
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	171,000000000H,1

	.sym	_DispText,_DispText,32,2,0
	.globl	_DispText

	.func	173
******************************************************
* FUNCTION DEF : _DispText
******************************************************
_DispText:

LF7	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+,AR2

	.sym	_string,-3+LF7,18,9,16
	.sym	_place,-4+LF7,14,9,16
	.sym	_i,1,14,1,16
	.sym	_len,2,14,1,16
	.line	2
	.line	3
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	4
	SACL	* ,AR1
	.line	5
	LACK	2
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-,AR2
	.line	6
	LACK	240
	LARK	AR2,-4+LF7
	MAR	*0+
	AND	* 
	SUBK	16
	BNZ	L3
	.line	7
	LACK	15
	AND	* ,AR1
	ADDK	128
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
L3:
	.line	9
	LACK	240
	MAR	* ,AR2
	LARK	AR2,-4+LF7
	MAR	*0+
	AND	* 
	SUBK	32
	BNZ	L4
	.line	10
	LACK	15
	AND	* ,AR1
	ADDK	192
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
L4:
	.line	12
	MAR	* ,AR2
	LARK	AR2,-3+LF7
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_strlen
	MAR	*-,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	*-
	.line	14
	LACK	0
	SACL	* 
	ZALS	*+
	SUBS	* 
	BGEZ	L6
	MAR	*-
L5:
	.line	15
	LAC	* 
	SBRK	4-LF7
	ADD	* ,AR0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* 
	BZ	L6
	.line	16
	.line	17
	MAR	* ,AR2
	LAC	* 
	ADRK	4-LF7
	ADD	* ,AR0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	14
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	*+
	SUBS	*-
	BLZ	L5
L6:
EPI0_7:
	.line	19
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	191,000000000H,3

	.sym	_DispNo,_DispNo,32,2,0
	.globl	_DispNo

	.func	207
******************************************************
* FUNCTION DEF : _DispNo
******************************************************
_DispNo:

LF8	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_value,-3+LF8,14,9,16
	.sym	_place,-4+LF8,14,9,16
	.sym	_type,-5+LF8,14,9,16
	.sym	_value1,1,14,1,16
	.line	2
	.line	15
	LARK	AR2,-3+LF8
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_convert_decimal
	MAR	*-,AR2
	LARK	AR2,-3+LF8
	MAR	*0+
	SACL	* ,AR1
	.line	16
	LACK	2
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-,AR2
	.line	17
	LACK	240
	LARK	AR2,-4+LF8
	MAR	*0+
	AND	* 
	SUBK	16
	BNZ	L8
	.line	18
	LACK	15
	AND	* ,AR1
	ADDK	128
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
L8:
	.line	19
	LACK	240
	MAR	* ,AR2
	LARK	AR2,-4+LF8
	MAR	*0+
	AND	* 
	SUBK	32
	BNZ	L9
	.line	20
	LACK	15
	AND	* ,AR1
	ADDK	192
	SACL	*+
	CALL	_WriteCtrl
	MAR	*-
L9:
	.line	22
	MAR	* ,AR2
	LARK	AR2,-5+LF8
	MAR	*0+
	LAC	* 
	SUBK	64
	BNZ	L10
	.line	24
	RSXM
	LACK	61440
	ADRK	2
	AND	* ,AR0
	SACL	* 
	LAC	* ,3,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	25
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	26
	LACK	3840
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,7,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	27
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	28
	LACK	240
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,11,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	29
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	30
	LACK	15
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* 
	ADRK	4-LF8
	SACL	* ,AR1
	.line	31
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
L10:
	.line	34
	MAR	* ,AR2
	LARK	AR2,-5+LF8
	MAR	*0+
	LAC	* 
	SUBK	65
	BNZ	L11
	.line	36
	RSXM
	LACK	61440
	ADRK	2
	AND	* ,AR0
	SACL	* 
	LAC	* ,3,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	37
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	38
	LACK	3840
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,7,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	39
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	40
	LACK	240
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,11,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	41
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
	.line	42
	LACK	46
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	43
	LACK	15
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* 
	ADRK	4-LF8
	SACL	* ,AR1
	.line	44
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
L11:
	.line	48
	MAR	* ,AR2
	LARK	AR2,-5+LF8
	MAR	*0+
	LAC	* 
	SUBK	66
	BNZ	L12
	.line	50
	RSXM
	LACK	61440
	ADRK	2
	AND	* ,AR0
	SACL	* 
	LAC	* ,3,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	51
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	52
	LACK	3840
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,7,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	53
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
	.line	54
	LACK	46
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	55
	LACK	240
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,11,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	56
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	57
	LACK	15
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* 
	ADRK	4-LF8
	SACL	* ,AR1
	.line	58
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
L12:
	.line	61
	MAR	* ,AR2
	LARK	AR2,-5+LF8
	MAR	*0+
	LAC	* 
	SUBK	67
	BNZ	L13
	.line	63
	RSXM
	LACK	61440
	ADRK	2
	AND	* ,AR0
	SACL	* 
	LAC	* ,3,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	64
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
	.line	65
	LACK	46
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	66
	LACK	3840
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,7,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	67
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	68
	LACK	240
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,11,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	69
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	70
	LACK	15
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* 
	ADRK	4-LF8
	SACL	* ,AR1
	.line	71
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
L13:
	.line	74
	MAR	* ,AR2
	LARK	AR2,-5+LF8
	MAR	*0+
	LAC	* 
	SUBK	32
	BNZ	L14
	.line	76
	LACK	240
	ADRK	2
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,11,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	77
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	78
	LACK	15
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* 
	ADRK	4-LF8
	SACL	* ,AR1
	.line	79
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
L14:
	.line	82
	MAR	* ,AR2
	LARK	AR2,-5+LF8
	MAR	*0+
	LAC	* 
	SUBK	33
	BNZ	L15
	.line	84
	LACK	240
	ADRK	2
	AND	* ,AR0
	SACL	* 
	RSXM
	LAC	* ,11,AR2
	ADRK	4-LF8
	SACH	* ,1
	.line	85
	LAC	* ,AR1
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
	.line	86
	LACK	46
	SACL	*+
	CALL	_WriteData
	MAR	*-,AR2
	.line	87
	LACK	15
	LARK	AR2,-3+LF8
	MAR	*0+
	AND	* 
	ADRK	4-LF8
	SACL	* ,AR1
	.line	88
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
L15:
	.line	91
	MAR	* ,AR2
	LARK	AR2,-5+LF8
	MAR	*0+
	LAC	* 
	SUBK	34
	BNZ	L16
	.line	93
	LACK	15
	ADRK	2
	AND	* 
	ADRK	4-LF8
	SACL	* ,AR1
	.line	94
	ADDK	48
	SACL	*+
	CALL	_WriteData
	MAR	*-
L16:
	.line	98
	MAR	* ,AR2
	LARK	AR2,-5+LF8
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L17
	.line	100
	MAR	* ,AR1
	LACK	46
	SACL	*+
	CALL	_WriteData
	MAR	*-
L17:
EPI0_8:
	.line	103
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	309,000000000H,2
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	I$$UDIV
	.global	_strlen
	.end
