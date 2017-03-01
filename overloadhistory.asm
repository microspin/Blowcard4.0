*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include overloadhistory.c C:\Users\SIVARA~1\AppData\Local\Temp\overload
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\overloadhistory.if overloadhistory.asm C:\Users\SIVARA~1\AppData\Local\Temp\overloadhistory.tmp 
	.port
	.bss	_adcHistory,20,1
	.bss	_historyCounter,4
	.file	"overloadhistory.c"
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
	.file	"overloadhistory.c"

	.sect	".cinit"
	.word	IS1,_adcHistory
	.word	775
	.word	775
	.word	775
	.word	775
IS1	.set	4

	.sym	_adcHistory,_adcHistory,254,3,320,,4,5
	.word	IS2,_historyCounter
	.word	0
	.word	0
	.word	0
	.word	0
IS2	.set	4

	.sym	_historyCounter,_historyCounter,62,3,64,,4
	.text

	.sym	_UpdateHistoryArray,_UpdateHistoryArray,32,2,0
	.globl	_UpdateHistoryArray

	.func	29
******************************************************
* FUNCTION DEF : _UpdateHistoryArray
******************************************************
_UpdateHistoryArray:

LF1	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+,AR2

	.sym	_counter,-3+LF1,4,9,16
	.sym	_readingNo,1,14,1,16
	.sym	_i,2,14,1,16
	.line	2
	.line	16
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	17
	SACL	* 
	.line	19
	SACL	* 
	ZALS	* 
	SUBK	4
	BGEZ	L2
L1:
	.line	21
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	5
	LAC	* ,AR1
	SACL	*+,AR2
	SBRK	5-LF1
	ZALS	* ,AR1
	CALL	I$$UMOD
	BNZ	L3
	.line	23
	MAR	* ,AR2
	ADRK	5-LF1
	LAC	*-,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR2
	SACL	*+
	.line	24
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR2
	LT	*-
	MPYK	5
	PAC
	RSXM
	ADLK	_adcHistory+0,0
	ADD	* ,AR0
	SACL	* 
	LAR	AR4,* ,AR3
	ADRK	2
	LAC	* ,AR4
	SACL	* ,AR2
	.line	26
	MAR	*+
	LAC	* ,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ZALS	* 
	SUBK	5
	BGEZ	L4
	.line	27
	MAR	* ,AR2
	LAC	* ,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	ADDK	1
	SACL	* ,AR2
	LAC	* ,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR1
	LAC	* ,AR3
	SACL	* 
L4:
	.line	28
	MAR	* ,AR2
	LAC	* ,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* 
	SUBK	5
	BNZ	L3
	.line	29
	MAR	* ,AR2
	LAC	* ,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	SACL	* 
L3:
	.line	19
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SUBK	4
	BLZ	L1
L2:
EPI0_1:
	.line	32
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	60,000000000H,3

	.sym	_SaveHistoryArray,_SaveHistoryArray,46,2,0
	.globl	_SaveHistoryArray

	.func	62
******************************************************
* FUNCTION DEF : _SaveHistoryArray
******************************************************
_SaveHistoryArray:

LF2	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,7
	LAR	AR0,*0+,AR2

	.sym	_motorIndex,-3+LF2,14,9,16
	.sym	_datasetNo,1,14,1,16
	.sym	_nextDatasetNo,2,14,1,16
	.sym	_totalWrites,3,14,1,16
	.sym	_adcAddress,4,4,1,16
	.sym	_latestValue,5,4,1,16
	.sym	_i,6,14,1,16
	.line	2
	.line	21
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	22
	SACL	*+
	.line	23
	SACL	*+
	.line	24
	SACL	*+
	.line	25
	SACL	*+
	.line	26
	SACL	* ,AR1
	.line	29
	LACK	54
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	30
	ZALS	* 
	SUBK	4
	BLEZ	L6
	.line	31
	LACK	0
	SACL	* 
L6:
	.line	35
	SBRK	4-LF2
	LAC	* ,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR2
	ADRK	8-LF2
	SACL	* 
	.line	38
	SBRK	4
	LAC	* ,AR0
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+,AR2
	SBRK	4-LF2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	4
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	39
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR0
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR1
	ADDK	2
	SACL	*+,AR2
	SBRK	4-LF2
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	3
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	40
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR0
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	SSXM
	LAC	* ,AR1
	ADDK	4
	SACL	*+,AR2
	SBRK	4-LF2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	41
	LACK	0
	MAR	* ,AR2
	LARK	AR2,6
	MAR	*0+
	SACL	* 
	ZALS	* 
	SUBK	5
	BGEZ	L8
L7:
	.line	42
	LAC	* ,AR0
	ADDK	3
	SACL	* 
	LT	* ,AR2
	MPYK	2
	SBRK	5
	LAC	* ,AR0
	ADLK	_dataSetEeAddress+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR2
	APAC
	ADRK	3
	SACL	* 
	.line	43
	LAC	* ,AR1
	SACL	*+,AR2
	SBRK	7-LF2
	LT	* 
	MPYK	5
	PAC
	RSXM
	ADLK	_adcHistory+0,0
	ADRK	8-LF2
	ADD	* ,AR0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	45
	SSXM
	MAR	* ,AR2
	LARK	AR2,5
	MAR	*0+
	LAC	* 
	SUBK	1
	SACL	* 
	.line	46
	LAC	* 
	BGEZ	L9
	.line	47
	LACK	4
	SACL	* 
L9:
	.line	41
	MAR	*+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SUBK	5
	BLZ	L7
L8:
	.line	51
	SBRK	5
	LAC	*+
	ADDK	1
	SACL	* ,AR1
	.line	52
	LACK	54
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	55
	LACK	56
	SACL	*+
	CALL	_EepromRead
	MAR	*-,AR2
	LARK	AR2,3
	MAR	*0+
	SACL	* 
	.line	56
	ADDK	1
	SACL	* ,AR1
	.line	57
	LACK	56
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_EepromWrite
	SBRK	2
	.line	59
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	ZALS	* 
EPI0_2:
	.line	61
	MAR	* ,AR1
	SBRK	8
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	122,000000000H,7

	.sym	_ResetHistoryArrays,_ResetHistoryArrays,32,2,0
	.globl	_ResetHistoryArrays

	.func	124
******************************************************
* FUNCTION DEF : _ResetHistoryArrays
******************************************************
_ResetHistoryArrays:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+,AR2

	.sym	_i,1,14,1,16
	.sym	_j,2,14,1,16
	.line	13
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	14
	SACL	*-
	.line	17
	SACL	* 
	ZALS	* 
	SUBK	5
	BGEZ	L11
L10:
	.line	18
	LAC	* ,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	SACL	* ,AR2
	.line	17
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SUBK	5
	BLZ	L10
L11:
	.line	20
	LACK	0
	SACL	* 
	ZALS	* 
	SUBK	5
	BGEZ	L13
	MAR	*+
L12:
	.line	21
	LACK	0
	SACL	* 
	ZALS	* 
	SUBK	6
	BGEZ	L15
	MAR	*-
	RSXM ;;;
L14:
	.line	22
	LT	*+
	MPYK	5
	PAC
	ADLK	_adcHistory+0,0
	ADD	* ,AR0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	SACL	* ,AR2
	.line	21
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	*-
	SUBK	6
	BLZ	L14
L15:
	.line	20
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	*+
	SUBK	5
	BLZ	L12
L13:
EPI0_3:
	.line	25
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	148,000000000H,3

	.sym	_DataLogHistory,_DataLogHistory,32,2,0
	.globl	_DataLogHistory

	.func	153
******************************************************
* FUNCTION DEF : _DataLogHistory
******************************************************
_DataLogHistory:

LF4	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR2

	.sym	_i,-3+LF4,14,9,16
	.line	2
	.line	16
	LARK	AR2,-3+LF4
	MAR	*0+
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	ADRK	5
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	17
	CALL	_SerialWriteComma
	.line	18
	MAR	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LAC	* ,AR0
	ADLK	_historyCounter+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	19
	CALL	_SerialWriteComma
	.line	20
	MAR	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LT	* ,AR0
	MPYK	5
	PAC
	ADLK	_adcHistory+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	21
	CALL	_SerialWriteComma
	.line	22
	MAR	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LT	* ,AR0
	MPYK	5
	PAC
	ADLK	_adcHistory+1,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	23
	CALL	_SerialWriteComma
	.line	24
	MAR	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LT	* ,AR0
	MPYK	5
	PAC
	ADLK	_adcHistory+2,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	25
	CALL	_SerialWriteComma
	.line	26
	MAR	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LT	* ,AR0
	MPYK	5
	PAC
	ADLK	_adcHistory+3,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	27
	CALL	_SerialWriteComma
	.line	28
	MAR	* ,AR2
	LARK	AR2,-3+LF4
	MAR	*0+
	LT	* ,AR0
	MPYK	5
	PAC
	ADLK	_adcHistory+4,0
	SACL	* 
	LAR	AR3,* ,AR3
	LAC	* ,AR1
	SACL	*+
	CALL	_SerialWriteNo
	MAR	*-
	.line	29
	CALL	_SerialWriteComma
	.line	30
	CALL	_SerialWriteNewLine
EPI0_4:
	.line	32
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	184,000000000H,1
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	I$$UMOD
	.end
