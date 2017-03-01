*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include encoder.c C:\Users\SIVARA~1\AppData\Local\Temp\encoder.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\encoder.if encoder.asm C:\Users\SIVARA~1\AppData\Local\Temp\encoder.tmp 
	.port
	.bss	_filterRpmArray,6,1
	.bss	_M1Count,1
	.bss	_M2Count,1
	.bss	_M3Count,1
	.bss	_M4Count,1
	.bss	_M5Count,1
	.bss	_M6Count,1
	.bss	_M3Mtcount,1
	.bss	_finmts,1
	.file	"encoder.c"
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
	.file	"encoder.c"

	.sect	".cinit"
	.word	IS1,_filterRpmArray
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
IS1	.set	6

	.sym	_filterRpmArray,_filterRpmArray,62,3,96,,6
	.word	1,_M1Count
	.word	0

	.sym	_M1Count,_M1Count,4,3,16
	.word	1,_M2Count
	.word	0

	.sym	_M2Count,_M2Count,4,3,16
	.word	1,_M3Count
	.word	0

	.sym	_M3Count,_M3Count,4,3,16
	.word	1,_M4Count
	.word	0

	.sym	_M4Count,_M4Count,4,3,16
	.word	1,_M5Count
	.word	0

	.sym	_M5Count,_M5Count,4,3,16
	.word	1,_M6Count
	.word	0

	.sym	_M6Count,_M6Count,4,3,16
	.word	1,_M3Mtcount
	.word	0

	.sym	_M3Mtcount,_M3Mtcount,14,2,16
	.globl	_M3Mtcount
	.word	1,_finmts
	.word	0

	.sym	_finmts,_finmts,14,2,16
	.globl	_finmts
	.text

	.sym	_FilterRpm,_FilterRpm,36,3,0

	.func	28
******************************************************
* FUNCTION DEF : _FilterRpm
******************************************************
_FilterRpm:

LF1	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF1,14,9,16
	.sym	_rpm,-4+LF1,14,9,16
	.sym	_filterInput,1,14,1,16
	.line	2
	LARK	AR2,-4+LF1
	MAR	*0+
	LAC	* 
	ADRK	5-LF1
	SACL	* ,AR1
	.line	3
	LALK	FL0
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	LALK	FL1
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	SBRK	4-LF1
	LAC	* ,AR0
	ADLK	_filterRpmArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$MUL
	CALL	F$$ADD
	CALL	F$$FTOU
	SACL	* ,AR2
	LAC	* ,AR0
	ADLK	_filterRpmArray+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	SACL	* ,AR2
	.line	4
	LAC	* ,AR0
	ADLK	_filterRpmArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* 
EPI0_1:
	.line	5
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	32,000000000H,2

	.sym	_EncoderCapture,_EncoderCapture,32,2,0
	.globl	_EncoderCapture

	.func	34
******************************************************
* FUNCTION DEF : _EncoderCapture
******************************************************
_EncoderCapture:
	CALL	I$$SAVE
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	4
 setc INTM
	.line	6
	LARK	AR3,28702
	SSXM
	MAR	* ,AR3
	LAC	* 
	SUBK	51
	BNZ	L1
	.line	8
	LDPK	_M1Count
	LAC	_M1Count
	ADDK	1
	SACL	_M1Count
	.line	9
	LARK	AR4,29745
	LACK	1
	MAR	* ,AR4
	AND	* 
	SACL	* 
L1:
	.line	12
	MAR	* ,AR3
	LAC	* 
	SUBK	52
	BNZ	L2
	.line	14
	LDPK	_M2Count
	LAC	_M2Count
	ADDK	1
	SACL	_M2Count
	.line	15
	LARK	AR4,29745
	LACK	2
	MAR	* ,AR4
	AND	* 
	SACL	* 
L2:
	.line	18
	MAR	* ,AR3
	LAC	* 
	SUBK	53
	BNZ	L3
	.line	20
	LDPK	_M3Count
	LAC	_M3Count
	ADDK	1
	SACL	_M3Count
	.line	21
	LAC	_M3Mtcount
	ADDK	1
	SACL	_M3Mtcount
	.line	22
	LARK	AR4,29745
	LACK	4
	MAR	* ,AR4
	AND	* 
	SACL	* 
L3:
	.line	25
	MAR	* ,AR3
	LAC	* 
	SUBK	54
	BNZ	L4
	.line	27
	LDPK	_M4Count
	LAC	_M4Count
	ADDK	1
	SACL	_M4Count
	.line	28
	LARK	AR4,30001
	LACK	1
	MAR	* ,AR4
	AND	* 
	SACL	* 
L4:
	.line	31
	MAR	* ,AR3
	LAC	* 
	SUBK	55
	BNZ	L5
	.line	33
	LDPK	_M5Count
	LAC	_M5Count
	ADDK	1
	SACL	_M5Count
	.line	34
	LARK	AR4,30001
	LACK	2
	MAR	* ,AR4
	AND	* 
	SACL	* 
L5:
	.line	37
	MAR	* ,AR3
	LAC	* 
	SUBK	56
	BNZ	L6
	.line	39
	LDPK	_M6Count
	LAC	_M6Count
	ADDK	1
	SACL	_M6Count
	.line	40
	LARK	AR4,30001
	LACK	4
	MAR	* ,AR4
	AND	* 
	SACL	* 
L6:
	.line	43
 clrc INTM
EPI0_2:
	.line	44
	MAR	* ,AR1
	SBRK	1
	B	I$$REST,AR1   ;and return

	.endfunc	77,000000000H,1

	.sym	_GetRPM,_GetRPM,36,2,0
	.globl	_GetRPM

	.func	79
******************************************************
* FUNCTION DEF : _GetRPM
******************************************************
_GetRPM:

LF3	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF3,2,9,16
	.sym	_rpm,1,4,1,16
	.sym	_filteredRpm,2,4,1,16
	.line	2
	.line	4
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	5
	SACL	* 
	B	L7
L8:
	.line	8
	MAR	* ,AR1
	LALK	FL2
	RPTK	1
	TBLR	*+
	LALK	FL3
	RPTK	1
	TBLR	*+
	SSXM
	LDPK	_M1Count
	LAC	_M1Count
	CALL	F$$ITOF
	CALL	F$$MUL
	CALL	F$$MUL
	CALL	F$$FTOI
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	9
	LACK	0
	SACL	_M1Count
	.line	10
	B	L9
L10:
	.line	13
	MAR	* ,AR1
	LALK	FL2
	RPTK	1
	TBLR	*+
	LALK	FL3
	RPTK	1
	TBLR	*+
	SSXM
	LDPK	_M2Count
	LAC	_M2Count
	CALL	F$$ITOF
	CALL	F$$MUL
	CALL	F$$MUL
	CALL	F$$FTOI
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	14
	LACK	0
	SACL	_M2Count
	.line	15
	B	L9
L11:
	.line	18
	MAR	* ,AR1
	LALK	FL3
	RPTK	1
	TBLR	*+
	SSXM
	LDPK	_M3Count
	LAC	_M3Count
	CALL	F$$ITOF
	CALL	F$$MUL
	CALL	F$$FTOI
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	20
	LACK	0
	SACL	_M3Count
	.line	21
	B	L9
L12:
	.line	25
	MAR	* ,AR1
	LALK	FL3
	RPTK	1
	TBLR	*+
	SSXM
	LDPK	_M4Count
	LAC	_M4Count
	CALL	F$$ITOF
	CALL	F$$MUL
	CALL	F$$FTOI
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	26
	LACK	0
	SACL	_M4Count
	.line	27
	B	L9
L13:
	.line	31
	MAR	* ,AR1
	LALK	FL3
	RPTK	1
	TBLR	*+
	SSXM
	LDPK	_M6Count
	LAC	_M6Count
	CALL	F$$ITOF
	CALL	F$$MUL
	CALL	F$$FTOI
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	32
	LACK	0
	SACL	_M6Count
	.line	33
	B	L9
L7:
	.line	6
	SSXM
	SBRK	5-LF3
	LAC	* 
	BZ	L8
	SUBK	1
	BZ	L10
	SUBK	1
	BZ	L11
	SUBK	1
	BZ	L12
	SUBK	2
	BZ	L13
L9:
	.line	36
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR1
	SACL	*+,AR2
	SBRK	4-LF3
	LAC	* ,AR1
	SACL	*+
	CALL	_FilterRpm
	SBRK	2
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	37
	LAC	* 
EPI0_3:
	.line	38
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	116,000000000H,3

	.sym	_ResetAllRPMCounts,_ResetAllRPMCounts,32,2,0
	.globl	_ResetAllRPMCounts

	.func	118
******************************************************
* FUNCTION DEF : _ResetAllRPMCounts
******************************************************
_ResetAllRPMCounts:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	3
	LACK	0
	LDPK	_M1Count
	SACL	_M1Count
	.line	4
	SACL	_M2Count
	.line	5
	SACL	_M3Count
	.line	6
	SACL	_M4Count
	.line	7
	SACL	_M6Count
EPI0_4:
	.line	8
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	125,000000000H,1

	.sym	_ResetFilterRpmArray,_ResetFilterRpmArray,32,2,0
	.globl	_ResetFilterRpmArray

	.func	128
******************************************************
* FUNCTION DEF : _ResetFilterRpmArray
******************************************************
_ResetFilterRpmArray:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_i,1,14,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	3
	SACL	* 
	ZALS	* 
	SUBK	6
	BGEZ	L15
L14:
	.line	4
	LAC	* ,AR0
	ADLK	_filterRpmArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	SACL	* ,AR2
	.line	3
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SUBK	6
	BLZ	L14
L15:
EPI0_5:
	.line	6
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	133,000000000H,2
*************************************************
* DEFINE FLOATING POINT CONSTANTS               *
*************************************************
	.text
FL0:	.float	3.e-1
FL1:	.float	7.e-1
FL2:	.float	1.3333
FL3:	.float	4.7244
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	F$$UTOF
	.global	F$$MUL
	.global	F$$ADD
	.global	F$$FTOU
	.global	I$$SAVE
	.global	I$$REST
	.global	F$$ITOF
	.global	F$$FTOI
	.end
