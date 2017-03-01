*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include adc.c C:\Users\SIVARA~1\AppData\Local\Temp\adc.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\adc.if adc.asm C:\Users\SIVARA~1\AppData\Local\Temp\adc.tmp 
	.port
	.bss	_AdcValue,12,1
	.bss	_NewAdcValue,12
	.bss	_AvgAdcValue,12
	.bss	_adcFilterArray,12
	.bss	_NewAdcFilterArray,12
	.bss	_LcAdcValue,2,1
	.bss	_LcAdcValue1,2,1
	.bss	_LcAdcValue2,2,1
	.bss	_LcAdcValue3,2,1
	.bss	_NewLcAdcValue,2,1
	.bss	_tempAdc,2,1
	.bss	_overloadCounterArray,5
	.bss	_LcchokeFlag,1
	.bss	_Beaterpreovloadflag,1
	.file	"adc.c"
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
	.file	"adc.c"

	.sect	".cinit"
	.word	IS1,_AdcValue
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.55e2
IS1	.set	12

	.sym	_AdcValue,_AdcValue,54,2,192,,6
	.globl	_AdcValue
	.word	IS2,_NewAdcValue
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.55e2
IS2	.set	12

	.sym	_NewAdcValue,_NewAdcValue,54,2,192,,6
	.globl	_NewAdcValue
	.word	IS3,_AvgAdcValue
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.55e2
IS3	.set	12

	.sym	_AvgAdcValue,_AvgAdcValue,54,2,192,,6
	.globl	_AvgAdcValue
	.word	IS4,_adcFilterArray
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.55e2
IS4	.set	12

	.sym	_adcFilterArray,_adcFilterArray,54,2,192,,6
	.globl	_adcFilterArray
	.word	IS5,_NewAdcFilterArray
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.75e2
	.float	7.55e2
IS5	.set	12

	.sym	_NewAdcFilterArray,_NewAdcFilterArray,54,2,192,,6
	.globl	_NewAdcFilterArray
	.word	2,_LcAdcValue
	.float	7.75e2

	.sym	_LcAdcValue,_LcAdcValue,6,2,32
	.globl	_LcAdcValue
	.word	2,_LcAdcValue1
	.float	7.75e2

	.sym	_LcAdcValue1,_LcAdcValue1,6,2,32
	.globl	_LcAdcValue1
	.word	2,_LcAdcValue2
	.float	7.75e2

	.sym	_LcAdcValue2,_LcAdcValue2,6,2,32
	.globl	_LcAdcValue2
	.word	2,_LcAdcValue3
	.float	7.75e2

	.sym	_LcAdcValue3,_LcAdcValue3,6,2,32
	.globl	_LcAdcValue3
	.word	2,_NewLcAdcValue
	.float	7.75e2

	.sym	_NewLcAdcValue,_NewLcAdcValue,6,2,32
	.globl	_NewLcAdcValue
	.word	2,_tempAdc
	.float	0.

	.sym	_tempAdc,_tempAdc,6,2,32
	.globl	_tempAdc
	.word	IS6,_overloadCounterArray
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
IS6	.set	5

	.sym	_overloadCounterArray,_overloadCounterArray,62,3,80,,5
	.globl	_LcchokeFlag
	.globl	_Beaterpreovloadflag
	.text

	.sym	_AdcInit,_AdcInit,32,2,0
	.globl	_AdcInit

	.func	41
******************************************************
* FUNCTION DEF : _AdcInit
******************************************************
_AdcInit:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	13
	LARK	AR3,28832
	SPLK	#16384,* 
	.line	15
nop
	.line	17
	LACK	32
	SACL	* 
	.line	24
	LACK	4
	ADRK	2
	SACL	*+
	.line	28
	SPLK	#12816,*+
	.line	32
	SPLK	#30292,* 
	.line	37
	SBRK	3
	SPLK	#16898,* ,AR1
EPI0_1:
	.line	48
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	88,000000000H,1

	.sym	_GetAdc,_GetAdc,46,3,0

	.func	92
******************************************************
* FUNCTION DEF : _GetAdc
******************************************************
_GetAdc:

LF2	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF2,14,9,16
	.sym	_adc,1,14,1,16
	.line	2
	.line	3
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* ,AR3
	.line	5
	LARK	AR3,28833
	LACK	8192
	OR	* 
	SACL	* ,AR1
	.line	7
	CALL	_delay1us
	.line	9
	LARK	AR3,28833
	LACK	-11277
	MAR	* ,AR3
	AND	* 
	SACL	* ,AR2
	.line	11
	LARK	AR2,-3+LF2
	MAR	*0+
	LAC	* 
	BNZ	L1
	.line	12
	MAR	* ,AR3
	ADRK	7
	LAC	* ,AR2
	ADRK	4-LF2
	SACL	* 
	.line	13
	RSXM
	LAC	* ,9
	SACH	* ,1
L1:
	.line	15
	LARK	AR2,-3+LF2
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L2
	.line	16
	LARK	AR3,28842
	MAR	* ,AR3
	LAC	* ,AR2
	ADRK	4-LF2
	SACL	* 
	.line	17
	RSXM
	LAC	* ,9
	SACH	* ,1
L2:
	.line	19
	LARK	AR2,-3+LF2
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L3
	.line	20
	LARK	AR3,28843
	MAR	* ,AR3
	LAC	* ,AR2
	ADRK	4-LF2
	SACL	* 
	.line	21
	RSXM
	LAC	* ,9
	SACH	* ,1
L3:
	.line	23
	LARK	AR2,-3+LF2
	MAR	*0+
	LAC	* 
	SUBK	3
	BNZ	L4
	.line	24
	LARK	AR3,28844
	MAR	* ,AR3
	LAC	* ,AR2
	ADRK	4-LF2
	SACL	* 
	.line	25
	RSXM
	LAC	* ,9
	SACH	* ,1
L4:
	.line	27
	LARK	AR2,-3+LF2
	MAR	*0+
	LAC	* 
	SUBK	4
	BNZ	L5
	.line	28
	LARK	AR3,28845
	MAR	* ,AR3
	LAC	* ,AR2
	ADRK	4-LF2
	SACL	* 
	.line	29
	RSXM
	LAC	* ,9
	SACH	* ,1
L5:
	.line	31
	LARK	AR2,-3+LF2
	MAR	*0+
	LAC	* 
	SUBK	5
	BNZ	L6
	.line	32
	LARK	AR3,28841
	MAR	* ,AR3
	LAC	* ,AR2
	ADRK	4-LF2
	SACL	* 
	.line	33
	RSXM
	LAC	* ,9
	SACH	* ,1
L6:
	.line	35
	LARK	AR2,1
	MAR	*0+
	ZALS	* 
EPI0_2:
	.line	36
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	127,000000000H,2

	.sym	_ResetFilterSumArray,_ResetFilterSumArray,32,2,0
	.globl	_ResetFilterSumArray

	.func	129
******************************************************
* FUNCTION DEF : _ResetFilterSumArray
******************************************************
_ResetFilterSumArray:
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
	BGEZ	L8
L7:
	.line	5
	LAC	* ,1,AR0
	ADLK	_adcFilterArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	6
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_NewAdcFilterArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LALK	FL0
	RPTK	1
	TBLR	*+
	.line	3
	MAR	* ,AR2
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SUBK	6
	BLZ	L7
L8:
EPI0_3:
	.line	9
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	137,000000000H,2

	.sym	_LcFilterGet,_LcFilterGet,46,2,0
	.globl	_LcFilterGet

	.func	139
******************************************************
* FUNCTION DEF : _LcFilterGet
******************************************************
_LcFilterGet:

LF4	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF4,14,9,16
	.line	2
	.line	3
	LARK	AR2,-3+LF4
	MAR	*0+
	LAC	* 
	SUBK	5
	BNZ	EPI0_4
	.line	5
	LAC	* ,AR1
	SACL	*+
	CALL	_GetAdc
	MAR	*-
	CALL	F$$UTOF
	MAR	*-,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LAC	* ,1,AR0
	ADLK	_AdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	ZALH	*-
	ADDS	* ,AR3
	SACL	*+
	SACH	*-,AR1
	.line	6
	LALK	FL1
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_AdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	*+,AR1
	SACL	*+,AR3
	LAC	*-,AR1
	SACL	*+
	CALL	F$$LE
	BZ	L10
	.line	8
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_AdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	*+,AR1
	SACL	*+,AR3
	LAC	*-,AR1
	SACL	*+
	RPTK	1
	BLKD	_tempAdc+0,*+
	CALL	F$$LE
	BZ	L11
	.line	10
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_AdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LAC	* ,1,AR0
	ADLK	_NewAdcValue+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ZALS	*+
	ADDH	*-,AR4
	SACL	*+
	SACH	*-
	B	L12
L11:
	.line	14
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_NewAdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LDPK	_tempAdc
	ZALS	_tempAdc
	ADDH	_tempAdc+1
	SACL	*+
	SACH	*-
L12:
	.line	16
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_AdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ZALS	*+
	ADDH	*-
	LDPK	_tempAdc
	SACL	_tempAdc
	SACH	_tempAdc+1
	B	L13
L10:
	.line	20
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_NewAdcFilterArray+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LAC	* ,1,AR0
	ADLK	_NewAdcValue+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ZALS	*+
	ADDH	*-,AR4
	SACL	*+
	SACH	*-
L13:
	.line	22
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_NewAdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LAC	* ,1,AR0
	ADLK	_NewAdcFilterArray+0,0
	SACL	* 
	LAR	AR4,* ,AR3
	ZALS	*+
	ADDH	*-,AR4
	SACL	*+
	SACH	*-,AR1
	.line	24
	LALK	FL2
	RPTK	1
	TBLR	*+
	LRLK	AR3,_M+112
	MAR	* ,AR3
	ZALS	* ,AR1
	CALL	F$$UTOF
	CALL	F$$DIV
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_NewAdcValue+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	LAC	*+,AR1
	SACL	*+,AR4
	LAC	*-,AR1
	SACL	*+
	LALK	FL3
	RPTK	1
	TBLR	*+
	CALL	F$$SUB
	CALL	F$$MUL
	LALK	FL3
	RPTK	1
	TBLR	*+
	CALL	F$$SUB
	MAR	*-,AR2
	LAC	* ,1,AR0
	ADLK	_AvgAdcValue+0,0
	SACL	* 
	LAR	AR4,* ,AR1
	ZALH	*-
	ADDS	* ,AR4
	SACL	*+
	SACH	*-,AR2
	.line	26
	LDPK	_LcAdcValue1
	ZALS	_LcAdcValue1
	ADDH	_LcAdcValue1+1
	SACL	_LcAdcValue
	SACH	_LcAdcValue+1
	.line	27
	ZALS	_LcAdcValue2
	ADDH	_LcAdcValue2+1
	SACL	_LcAdcValue1
	SACH	_LcAdcValue1+1
	.line	28
	ZALS	_LcAdcValue3
	ADDH	_LcAdcValue3+1
	SACL	_LcAdcValue2
	SACH	_LcAdcValue2+1
	.line	29
	LAC	* ,1,AR0
	ADLK	_AvgAdcValue+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ZALS	*+
	ADDH	*-,AR1
	SACL	_LcAdcValue3
	SACH	_LcAdcValue3+1
	.line	31
	LALK	FL4
	RPTK	1
	TBLR	*+
	RPTK	1
	BLKD	_LcAdcValue3+0,*+
	RPTK	1
	BLKD	_LcAdcValue2+0,*+
	RPTK	1
	BLKD	_LcAdcValue1+0,*+
	RPTK	1
	BLKD	_LcAdcValue+0,*+
	CALL	F$$ADD
	CALL	F$$ADD
	CALL	F$$ADD
	CALL	F$$LE
	BNZ	LL6
	LALK	FL5
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_AvgAdcValue+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	LAC	*+,AR1
	SACL	*+,AR4
	LAC	*-,AR1
	SACL	*+
	CALL	F$$GE
	BZ	L14
LL6:
	.line	32
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_AvgAdcValue+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ZALS	*+
	ADDH	*-
	SACL	_NewLcAdcValue
	SACH	_NewLcAdcValue+1
	B	L15
L14:
	.line	34
	ZALS	_LcAdcValue2
	ADDH	_LcAdcValue2+1
	SACL	_NewLcAdcValue
	SACH	_NewLcAdcValue+1
L15:
	.line	36
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_adcFilterArray+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ZALS	_NewLcAdcValue
	ADDH	_NewLcAdcValue+1
	SACL	*+
	SACH	*-,AR2
	.line	38
	LAC	* ,1,AR0
	ADLK	_adcFilterArray+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	LAC	*+,AR1
	SACL	*+,AR4
	LAC	*-,AR1
	SACL	*+
	CALL	F$$FTOU
EPI0_4:
	.line	43
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	181,000000000H,1

	.sym	_AdcFilteredGet,_AdcFilteredGet,46,2,0
	.globl	_AdcFilteredGet

	.func	184
******************************************************
* FUNCTION DEF : _AdcFilteredGet
******************************************************
_AdcFilteredGet:

LF5	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF5,14,9,16
	.line	2
	.line	15
	LARK	AR2,-3+LF5
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_GetAdc
	MAR	*-
	CALL	F$$UTOF
	MAR	*-,AR2
	LARK	AR2,-3+LF5
	MAR	*0+
	LAC	* ,1,AR0
	ADLK	_AdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	ZALH	*-
	ADDS	* ,AR3
	SACL	*+
	SACH	*-,AR1
	.line	26
	LALK	FL6
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_AdcValue+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	*+,AR1
	SACL	*+,AR3
	LAC	*-,AR1
	SACL	*+
	CALL	F$$MUL
	LALK	FL7
	RPTK	1
	TBLR	*+
	MAR	* ,AR2
	LAC	* ,1,AR0
	ADLK	_adcFilterArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	*+,AR1
	SACL	*+,AR3
	LAC	*-,AR1
	SACL	*+
	CALL	F$$MUL
	CALL	F$$ADD
	MAR	*-,AR2
	LAC	* ,1,AR0
	ADLK	_adcFilterArray+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	ZALH	*-
	ADDS	* ,AR3
	SACL	*+
	SACH	*-,AR2
	.line	29
	LAC	* ,1,AR0
	ADLK	_adcFilterArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	*+,AR1
	SACL	*+,AR3
	LAC	*-,AR1
	SACL	*+
	CALL	F$$FTOU
EPI0_5:
	.line	30
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	213,000000000H,1

	.sym	_ResetOverloadCounterArray,_ResetOverloadCounterArray,32,2,0
	.globl	_ResetOverloadCounterArray

	.func	215
******************************************************
* FUNCTION DEF : _ResetOverloadCounterArray
******************************************************
_ResetOverloadCounterArray:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_i,1,14,1,16
	.line	13
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	14
	SACL	* 
	ZALS	* 
	SUBK	5
	BGEZ	L17
L16:
	.line	16
	LAC	* ,AR0
	ADLK	_overloadCounterArray+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	SACL	* ,AR2
	.line	14
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SUBK	5
	BLZ	L16
L17:
EPI0_6:
	.line	18
	MAR	* ,AR1
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	232,000000000H,2

	.sym	_CheckOverload,_CheckOverload,32,2,0
	.globl	_CheckOverload

	.func	235
******************************************************
* FUNCTION DEF : _CheckOverload
******************************************************
_CheckOverload:

LF7	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF7,14,9,16
	.line	2
	.line	32
	LARK	AR2,-3+LF7
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_AdcFilteredGet
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
	ADRK	2
	SACL	* ,AR2
	.line	35
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR4,* ,AR4
	ADRK	2
	ZALS	* ,AR3
	ADRK	3
	SUBS	* 
	BGZ	L18
	.line	37
	MAR	* ,AR2
	BLDD	* ,#_OV,AR1
	.line	45
	LACK	1
	LDPK	_OV+1
	SACL	_OV+1
	.line	46
	CALL	_StopAllMotors
	.line	47
	CALL	_TowerLampRed_On
	.line	48
	CALL	_TowerLampGreen_Off
L18:
EPI0_7:
	.line	51
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	285,000000000H,1

	.sym	_CheckpreOverload,_CheckpreOverload,32,2,0
	.globl	_CheckpreOverload

	.func	288
******************************************************
* FUNCTION DEF : _CheckpreOverload
******************************************************
_CheckpreOverload:

LF8	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF8,14,9,16
	.line	2
	.line	32
	LARK	AR2,-3+LF8
	MAR	*0+
	LAC	* ,AR1
	SACL	*+
	CALL	_AdcFilteredGet
	MAR	*-
	SACL	* ,AR2
	LARK	AR2,-3+LF8
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	ADRK	2
	SACL	* ,AR2
	.line	35
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	2
	ZALS	* 
	SUBK	600
	BGZ	L19
	.line	39
	LACK	1
	LDPK	_Beaterpreovloadflag
	SACL	_Beaterpreovloadflag
L19:
EPI0_8:
	.line	42
	MAR	* ,AR1
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	329,000000000H,1

	.sym	_LcchokeFlag,_LcchokeFlag,14,2,16
	.globl	_LcchokeFlag

	.sym	_Beaterpreovloadflag,_Beaterpreovloadflag,14,2,16
	.globl	_Beaterpreovloadflag
*************************************************
* DEFINE FLOATING POINT CONSTANTS               *
*************************************************
	.text
FL0:	.float	7.75e2
FL1:	.float	7.72e2
FL2:	.float	1.e2
FL3:	.float	7.78e2
FL4:	.float	2.94e3
FL5:	.float	7.5e2
FL6:	.float	5.e-2
FL7:	.float	9.5e-1
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	F$$UTOF
	.global	F$$LE
	.global	F$$DIV
	.global	F$$SUB
	.global	F$$MUL
	.global	F$$ADD
	.global	F$$GE
	.global	F$$FTOU
	.global	_TowerLampRed_On
	.global	_TowerLampGreen_Off
	.end
