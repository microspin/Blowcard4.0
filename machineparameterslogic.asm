*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include machineparameterslogic.c C:\Users\SIVARA~1\AppData\Local\Temp\m
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\machineparameterslogic.if machineparameterslogic.asm C:\Users\SIVARA~1\AppData\Local\Temp\machineparameterslogic.tmp 
	.port
	.file	"machineparameterslogic.c"
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
	.file	"machineparameterslogic.c"
	.text

	.sym	_RunMachineParameters,_RunMachineParameters,32,2,0
	.globl	_RunMachineParameters

	.func	16
******************************************************
* FUNCTION DEF : _RunMachineParameters
******************************************************
_RunMachineParameters:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,20
	LAR	AR0,*0+,AR2

	.sym	_pw,1,50,1,240,,15
	.sym	_psw,16,2,1,16
	.sym	_selection,17,2,1,16
	.sym	_breakout,18,2,1,16
	.sym	_out,19,2,1,16
	.line	3
	LACK	87
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	114
	SACL	*+
	LACK	111
	SACL	*+
	LACK	110
	SACL	*+
	LACK	103
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
	LACK	0
	SACL	* 
	.line	6
	ADRK	3
	SACL	*+
	.line	7
	SACL	* ,AR1
	.line	8
	CALL	_InitMenuStruct
	.line	9
	LACK	1212
	SACL	*+
	CALL	_CheckPassword
	MAR	*-,AR2
	LARK	AR2,16
	MAR	*0+
	SACL	* 
	.line	12
	SSXM
	ADRK	2
	LAC	* 
	SUBK	1
	BZ	L2
	MAR	* ,AR1
L1:
	.line	14
	CALL	_MachineParametersMenu,AR1
	MAR	* ,AR2
	LARK	AR2,17
	MAR	*0+
	SACL	* 
	B	L3
L4:
	.line	18
	CALL	_MotorSpeedSelect,AR1
	MAR	* ,AR2
	LARK	AR2,19
	MAR	*0+
	SACL	* 
	.line	19
	B	L5
L6:
	.line	21
	CALL	_OverloadCurrentSelect,AR1
	MAR	* ,AR2
	LARK	AR2,19
	MAR	*0+
	SACL	* 
	.line	22
	B	L5
	.line	25
L8:
	.line	27
	CALL	_PidSelect,AR1
	MAR	* ,AR2
	LARK	AR2,19
	MAR	*0+
	SACL	* 
	.line	28
	B	L5
L9:
	.line	30
	LACK	1
	MAR	* ,AR2
	LARK	AR2,19
	MAR	*0+
	SACL	* 
	.line	31
	B	L5
L3:
	.line	15
	SSXM
	LAC	* 
	BZ	L4
	SUBK	1
	BZ	L6
	SUBK	1
	BZ	L5
	SUBK	1
	BZ	L8
	SUBK	1
	BZ	L9
L5:
	.line	33
	SSXM
	MAR	* ,AR2
	LARK	AR2,19
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L10
	.line	35
	LACK	1
	MAR	*-
	SACL	* 
	B	L11
L10:
	.line	39
	LACK	0
	MAR	*-
	SACL	* 
L11:
	.line	12
	LAC	* ,AR1
	SUBK	1
	BNZ	L1
L2:
EPI0_1:
	.line	43
	MAR	* ,AR1
	SBRK	21
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	58,000000000H,20

	.sym	_MotorSpeedSelect,_MotorSpeedSelect,34,3,0

	.func	61
******************************************************
* FUNCTION DEF : _MotorSpeedSelect
******************************************************
_MotorSpeedSelect:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_selectedOption,1,2,1,16
	.sym	_speed,2,14,1,16
	.sym	_breakout,3,2,1,16
	.sym	_out,4,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*-
	.line	7
	SSXM
	LAC	* 
	SUBK	1
	BZ	L13
	MAR	* ,AR1
L12:
	.line	9
	CALL	_MotorSelectMenu,AR1
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	10
	SSXM
	LAC	* 
	SUBK	-1
	BZ	L14
	LAC	* 
	SUBK	-3
	BZ	L14
	.line	12
	MAR	* ,AR1
	LACK	2
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_SetMotorSpeed
	SBRK	2
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	13
	ZALS	* 
	RSXM
	SUBK	-1
	BZ	L14
	.line	15
	LAC	*-,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_SaveMotorSpeed
	SBRK	2
L14:
	.line	18
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	-3
	BNZ	L16
	.line	19
	CALL	_DispClear,AR1
	.line	20
	CALL	_ResetMotorSpeeds
L16:
	.line	22
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	-1
	BNZ	L17
	.line	23
	LACK	1
	ADRK	2
	SACL	*+
	.line	24
	LACK	0
	SACL	* 
L17:
	.line	7
	LARK	AR2,3
	MAR	*0+
	LAC	* ,AR1
	SUBK	1
	BNZ	L12
L13:
	.line	28
	MAR	* ,AR2
	MAR	*+
	LAC	* 
EPI0_2:
	.line	29
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	89,000000000H,5

	.sym	_OverloadCurrentSelect,_OverloadCurrentSelect,34,3,0

	.func	92
******************************************************
* FUNCTION DEF : _OverloadCurrentSelect
******************************************************
_OverloadCurrentSelect:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_selectedOption,1,2,1,16
	.sym	_overload,2,14,1,16
	.sym	_breakout,3,2,1,16
	.sym	_out,4,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*-
	.line	7
	SSXM
	LAC	* 
	SUBK	1
	BZ	L19
	MAR	* ,AR1
L18:
	.line	9
	CALL	_MotorSelectMenu,AR1
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	10
	SSXM
	LAC	* 
	SUBK	-1
	BZ	L20
	LAC	* 
	SUBK	-3
	BZ	L20
	.line	12
	SUBK	3
	MAR	* ,AR1
	SACL	*+
	CALL	_SetMotorOverloadCurrent
	MAR	*-,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	13
	ZALS	* 
	RSXM
	SUBK	-1
	BZ	L20
	.line	15
	LAC	*-,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_SaveMotorOverloadCurrent
	SBRK	2
L20:
	.line	18
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	-3
	BNZ	L22
	.line	19
	CALL	_DispClear,AR1
	.line	20
	CALL	_ResetOverloadCurrent
L22:
	.line	23
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	-1
	BNZ	L23
	.line	24
	LACK	1
	ADRK	2
	SACL	*+
	.line	25
	LACK	0
	SACL	* 
L23:
	.line	7
	LARK	AR2,3
	MAR	*0+
	LAC	* ,AR1
	SUBK	1
	BNZ	L18
L19:
	.line	29
	MAR	* ,AR2
	MAR	*+
	LAC	* 
EPI0_3:
	.line	30
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	121,000000000H,5

	.sym	_OverloadTimeSelect,_OverloadTimeSelect,34,3,0

	.func	126
******************************************************
* FUNCTION DEF : _OverloadTimeSelect
******************************************************
_OverloadTimeSelect:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_selectedOption,1,2,1,16
	.sym	_overload,2,14,1,16
	.sym	_breakout,3,2,1,16
	.sym	_out,4,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*-
	.line	7
	SSXM
	LAC	* 
	SUBK	1
	BZ	L25
	MAR	* ,AR1
L24:
	.line	9
	CALL	_MotorSelectMenu,AR1
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	10
	SSXM
	LAC	* 
	SUBK	-1
	BZ	L26
	LAC	* 
	SUBK	-3
	BZ	L26
	.line	12
	SUBK	3
	MAR	* ,AR1
	SACL	*+
	CALL	_SetMotorOverloadTime
	MAR	*-,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	13
	ZALS	* 
	RSXM
	SUBK	-1
	BZ	L26
	.line	15
	LAC	*-,AR1
	SACL	*+,AR2
	LAC	* ,AR1
	SACL	*+
	CALL	_SaveMotorOverloadTime
	SBRK	2
L26:
	.line	19
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	-3
	BNZ	L28
	.line	20
	CALL	_DispClear,AR1
	.line	21
	CALL	_ResetOverloadTime
L28:
	.line	24
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	-1
	BNZ	L29
	.line	25
	LACK	1
	ADRK	2
	SACL	*+
	.line	26
	LACK	0
	SACL	* 
L29:
	.line	7
	LARK	AR2,3
	MAR	*0+
	LAC	* ,AR1
	SUBK	1
	BNZ	L24
L25:
	.line	30
	MAR	* ,AR2
	MAR	*+
	LAC	* 
EPI0_4:
	.line	31
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	156,000000000H,5

	.sym	_PidSelect,_PidSelect,34,3,0

	.func	160
******************************************************
* FUNCTION DEF : _PidSelect
******************************************************
_PidSelect:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,5
	LAR	AR0,*0+,AR2

	.sym	_selectedOption,1,2,1,16
	.sym	_out1,2,3,1,16
	.sym	_breakout,3,2,1,16
	.sym	_out,4,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*-
	.line	7
	SSXM
	LAC	* 
	SUBK	1
	BZ	L31
	MAR	* ,AR1
L30:
	.line	9
	CALL	_MotorSelectMenu,AR1
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	.line	10
	SSXM
	LAC	* 
	SUBK	-1
	BZ	L32
	LAC	* 
	SUBK	-3
	BZ	L32
	.line	12
	SUBK	3
	MAR	* ,AR1
	SACL	*+
	CALL	_SetPid
	MAR	*-,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
L32:
	.line	16
	SSXM
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	-3
	BNZ	L33
	.line	17
	CALL	_DispClear,AR1
	.line	18
	CALL	_ResetPidConsts
L33:
	.line	21
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	-1
	BNZ	L34
	.line	22
	LACK	1
	ADRK	2
	SACL	*+
	.line	23
	LACK	0
	SACL	* 
L34:
	.line	7
	LARK	AR2,3
	MAR	*0+
	LAC	* ,AR1
	SUBK	1
	BNZ	L30
L31:
	.line	27
	MAR	* ,AR2
	MAR	*+
	LAC	* 
EPI0_5:
	.line	28
	MAR	* ,AR1
	SBRK	6
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	187,000000000H,5
	.end
