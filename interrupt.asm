*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include interrupt.c C:\Users\SIVARA~1\AppData\Local\Temp\interrupt.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\interrupt.if interrupt.asm C:\Users\SIVARA~1\AppData\Local\Temp\interrupt.tmp 
	.port
	.bss	_loopPoint5mS1,1,1
	.bss	_loopPoint5mS2,1
	.bss	_loopPoint5mS3,1
	.bss	_loopPoint1mS,1
	.bss	_loopcount50ms,1
	.bss	_Stepperlowflag,1
	.bss	_Stepcnt,1
	.bss	_Stepperoffdelay,1
	.bss	_Fstepperoffdelay,2,1
	.bss	_Fstepperoffdelay1,2,1
	.bss	_Toggleflag,1
	.bss	_Liftflag,1
	.bss	_Liftbottomcnt,1
	.bss	_Liftbottomcnt1,1
	.bss	_lifthomereset,1
	.bss	_Stepperresetcnt,1
	.bss	_Stepperresetcnt1,1
	.bss	_Stopcount,1
	.bss	_Liftupcount,1
	.bss	_Liftcount,1
	.bss	_Preovloadcnt,1
	.bss	_Cycleautostep,1
	.bss	_Tenmmcycle,1
	.bss	_Tencount,1
	.bss	_Stopbtrfeedflag,1
	.bss	_Blinkflag,1
	.file	"interrupt.c"
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
	.file	"interrupt.c"

	.sect	".cinit"
	.word	1,_loopPoint5mS1
	.word	0

	.sym	_loopPoint5mS1,_loopPoint5mS1,14,2,16
	.globl	_loopPoint5mS1
	.word	1,_loopPoint5mS2
	.word	0

	.sym	_loopPoint5mS2,_loopPoint5mS2,14,2,16
	.globl	_loopPoint5mS2
	.word	1,_loopPoint5mS3
	.word	0

	.sym	_loopPoint5mS3,_loopPoint5mS3,14,2,16
	.globl	_loopPoint5mS3
	.word	1,_loopPoint1mS
	.word	0

	.sym	_loopPoint1mS,_loopPoint1mS,14,2,16
	.globl	_loopPoint1mS
	.word	1,_loopcount50ms
	.word	0

	.sym	_loopcount50ms,_loopcount50ms,14,2,16
	.globl	_loopcount50ms
	.word	1,_Stepperlowflag
	.word	0

	.sym	_Stepperlowflag,_Stepperlowflag,14,2,16
	.globl	_Stepperlowflag
	.word	1,_Stepcnt
	.word	0

	.sym	_Stepcnt,_Stepcnt,14,2,16
	.globl	_Stepcnt
	.word	1,_Stepperoffdelay
	.word	0

	.sym	_Stepperoffdelay,_Stepperoffdelay,14,2,16
	.globl	_Stepperoffdelay
	.globl	_LCfillFlag
	.globl	_mtrwriteflag
	.globl	_Stepperstartcnt
	.globl	_Stepdelaycnt
	.globl	_Stepperautostart
	.word	2,_Fstepperoffdelay
	.float	0.

	.sym	_Fstepperoffdelay,_Fstepperoffdelay,6,2,32
	.globl	_Fstepperoffdelay
	.word	2,_Fstepperoffdelay1
	.float	0.

	.sym	_Fstepperoffdelay1,_Fstepperoffdelay1,6,2,32
	.globl	_Fstepperoffdelay1
	.word	1,_Toggleflag
	.word	0

	.sym	_Toggleflag,_Toggleflag,14,2,16
	.globl	_Toggleflag
	.word	1,_Liftflag
	.word	1

	.sym	_Liftflag,_Liftflag,14,2,16
	.globl	_Liftflag
	.word	1,_Liftbottomcnt
	.word	0

	.sym	_Liftbottomcnt,_Liftbottomcnt,14,2,16
	.globl	_Liftbottomcnt
	.word	1,_Liftbottomcnt1
	.word	0

	.sym	_Liftbottomcnt1,_Liftbottomcnt1,14,2,16
	.globl	_Liftbottomcnt1
	.word	1,_lifthomereset
	.word	0

	.sym	_lifthomereset,_lifthomereset,14,2,16
	.globl	_lifthomereset
	.word	1,_Stepperresetcnt
	.word	0

	.sym	_Stepperresetcnt,_Stepperresetcnt,14,2,16
	.globl	_Stepperresetcnt
	.word	1,_Stepperresetcnt1
	.word	0

	.sym	_Stepperresetcnt1,_Stepperresetcnt1,14,2,16
	.globl	_Stepperresetcnt1
	.word	1,_Stopcount
	.word	0

	.sym	_Stopcount,_Stopcount,14,2,16
	.globl	_Stopcount
	.globl	_Stepperhomeflag
	.word	1,_Liftupcount
	.word	0

	.sym	_Liftupcount,_Liftupcount,14,2,16
	.globl	_Liftupcount
	.word	1,_Liftcount
	.word	0

	.sym	_Liftcount,_Liftcount,14,2,16
	.globl	_Liftcount
	.globl	_Beaterpreovloadflag
	.word	1,_Preovloadcnt
	.word	0

	.sym	_Preovloadcnt,_Preovloadcnt,14,2,16
	.globl	_Preovloadcnt
	.word	1,_Cycleautostep
	.word	0

	.sym	_Cycleautostep,_Cycleautostep,14,2,16
	.globl	_Cycleautostep
	.word	1,_Tenmmcycle
	.word	0

	.sym	_Tenmmcycle,_Tenmmcycle,14,2,16
	.globl	_Tenmmcycle
	.word	1,_Tencount
	.word	0

	.sym	_Tencount,_Tencount,14,2,16
	.globl	_Tencount
	.word	1,_Stopbtrfeedflag
	.word	0

	.sym	_Stopbtrfeedflag,_Stopbtrfeedflag,14,2,16
	.globl	_Stopbtrfeedflag
	.word	1,_Blinkflag
	.word	0

	.sym	_Blinkflag,_Blinkflag,14,2,16
	.globl	_Blinkflag
	.text

	.sym	_overload,_overload,32,2,0
	.globl	_overload

	.func	56
******************************************************
* FUNCTION DEF : _overload
******************************************************
_overload:
	CALL	I$$SAVE
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	3
 setc INTM
	.line	5
	LARK	AR3,28702
	SSXM
	MAR	* ,AR3
	LAC	* 
	SUBK	47
	BNZ	L1
	.line	7
	LDPK	_loopPoint5mS1
	LAC	_loopPoint5mS1
	ADDK	1
	SACL	_loopPoint5mS1
	.line	8
	LAC	_loopPoint5mS3
	ADDK	1
	SACL	_loopPoint5mS3
	.line	17
	LAC	_loopPoint5mS3
	SUBK	30
	BNZ	L2
	.line	20
	MAR	* ,AR1
	LACK	1
	SACL	*+
	CALL	_CheckpreOverload
	MAR	*-
	.line	21
	LACK	0
	LDPK	_loopPoint5mS3
	SACL	_loopPoint5mS3
L2:
	.line	25
	LDPK	_Beaterpreovloadflag
	LAC	_Beaterpreovloadflag
	SUBK	1
	BNZ	L3
	.line	27
	LARK	AR3,29952
	LACK	64
	MAR	* ,AR3
	SACL	* 
	.line	28
	LDPK	_Preovloadcnt
	LAC	_Preovloadcnt
	ADDK	1
	SACL	_Preovloadcnt
	.line	29
	ZALS	_Preovloadcnt
	SUBK	8000
	BLZ	L3
	.line	31
	LACK	0
	LDPK	_Beaterpreovloadflag
	SACL	_Beaterpreovloadflag
	.line	32
	LDPK	_Preovloadcnt
	SACL	_Preovloadcnt
L3:
	.line	39
	LDPK	_Stepperautostart
	LAC	_Stepperautostart
	SUBK	1
	BNZ	L5
	.line	41
	LDPK	_loopPoint5mS2
	LAC	_loopPoint5mS2
	ADDK	1
	SACL	_loopPoint5mS2
	.line	42
	LAC	_Stopbtrfeedflag
	BNZ	L5
	.line	44
	LARK	AR3,29952
	LACK	64
	MAR	* ,AR3
	SACL	* 
L5:
	.line	48
	LDPK	_lifthomereset
	LAC	_lifthomereset
	SUBK	1
	BNZ	L7
	.line	50
	LAC	_loopPoint5mS2
	ADDK	1
	SACL	_loopPoint5mS2
L7:
	.line	54
	LAC	_Cycleautostep
	SUBK	1
	BNZ	L8
	.line	56
	LACK	1
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
	.line	57
	LACK	0
	LDPK	_Cycleautostep
	SACL	_Cycleautostep
L8:
	.line	60
	LAC	_Tenmmcycle
	SUBK	1
	BNZ	L9
	.line	62
	LAC	_Tencount
	ADDK	1
	SACL	_Tencount
	.line	63
	LAC	_Tencount
	SUBK	2000
	BNZ	L9
	.line	65
	LACK	0
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	66
	LACK	1
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
	.line	67
	LACK	0
	LDPK	_Tenmmcycle
	SACL	_Tenmmcycle
	.line	68
	SACL	_Tencount
L9:
	.line	73
	LDPK	_Stepdelaycnt
	LAC	_Stepdelaycnt
	SUBK	1
	BNZ	L11
	.line	74
	LDPK	_Stepperoffdelay
	LAC	_Stepperoffdelay
	ADDK	1
	SACL	_Stepperoffdelay
	.line	75
	MAR	* ,AR1
	LALK	FL0
	RPTK	1
	TBLR	*+
	ZALS	_Stepperoffdelay
	CALL	F$$UTOF
	CALL	F$$MUL
	MAR	*-
	ZALH	*-
	ADDS	* 
	SACL	_Fstepperoffdelay
	SACH	_Fstepperoffdelay+1
L11:
	.line	79
	MAR	* ,AR1
	LALK	FL1
	RPTK	1
	TBLR	*+
	RPTK	1
	BLKD	_Fstepperoffdelay+0,*+
	CALL	F$$GE
	BZ	L12
	.line	81
	LACK	0
	LDPK	_Stepperoffdelay
	SACL	_Stepperoffdelay
	.line	82
	LALK	FL2
	LRLK	AR3,_Fstepperoffdelay+0
	MAR	* ,AR3
	RPTK	1
	TBLR	*+
	.line	83
	MAR	* ,AR1
	RPTK	1
	BLKD	_Fstepperoffdelay1+0,*+
	CALL	F$$INCR
	SACL	_Fstepperoffdelay1
	SACH	_Fstepperoffdelay1+1
	SBRK	2
L12:
	.line	87
	LACK	5
	SACL	*+,AR3
	LRLK	AR3,_M+140
	ZALS	* ,AR1
	CALL	I$$UDIV
	CALL	F$$UTOF
	RPTK	1
	BLKD	_Fstepperoffdelay1+0,*+
	CALL	F$$GE
	BZ	L13
	.line	90
	LACK	1
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	91
	LACK	0
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
	.line	92
	LALK	FL2
	LRLK	AR4,_Fstepperoffdelay+0
	MAR	* ,AR4
	RPTK	1
	TBLR	*+
	.line	93
	LALK	FL2
	LRLK	AR4,_Fstepperoffdelay1+0
	RPTK	1
	TBLR	*+
	.line	94
	LACK	0
	LDPK	_Stepperoffdelay
	SACL	_Stepperoffdelay
	.line	95
	LACK	1
	SACL	_Tenmmcycle
L13:
	.line	98
	LDPK	_loopPoint5mS1
	LAC	_loopPoint5mS1
	SUBK	120
	BNZ	L14
	.line	100
	MAR	* ,AR1
	LACK	0
	SACL	*+
	CALL	_CheckOverload
	MAR	*-
	.line	101
	LACK	1
	SACL	*+
	CALL	_CheckOverload
	MAR	*-
	.line	102
	LACK	2
	SACL	*+
	CALL	_CheckOverload
	MAR	*-
	.line	103
	LACK	3
	SACL	*+
	CALL	_CheckOverload
	MAR	*-
	.line	104
	LACK	4
	SACL	*+
	CALL	_CheckOverload
	MAR	*-
	.line	105
	LACK	5
	SACL	*+
	CALL	_CheckOverload
	MAR	*-
	.line	106
	LACK	0
	LDPK	_loopPoint5mS1
	SACL	_loopPoint5mS1
L14:
	.line	110
	ZALS	_loopPoint5mS2
	SUBK	2
	BLZ	L15
	.line	112
	LARK	AR3,28822
	LACK	32
	MAR	* ,AR3
	OR	* 
	SACL	* 
	.line	113
	LAC	_Stepperlowflag
	ADDK	1
	SACL	_Stepperlowflag
L15:
	.line	116
	ZALS	_Stepperlowflag
	SUBK	2
	BLZ	L16
	.line	118
	LARK	AR3,28822
	LACK	65503
	MAR	* ,AR3
	AND	* 
	SACL	* 
	.line	119
	LACK	0
	SACL	_loopPoint5mS2
	.line	120
	SACL	_Stepperlowflag
	.line	122
	LAC	_Liftflag
	SUBK	1
	BNZ	L17
	LAC	_Stopcount
	BNZ	L17
	.line	124
	LAC	_Stepperresetcnt
	ADDK	1
	SACL	_Stepperresetcnt
	.line	125
	LAC	_Stepperresetcnt
	SUBK	20000
	BNZ	L17
	.line	126
	LAC	_Stepperresetcnt1
	ADDK	1
	SACL	_Stepperresetcnt1
	.line	127
	LACK	0
	SACL	_Stepperresetcnt
L17:
	.line	131
	LAC	_Stepperresetcnt1
	SUBK	1
	BNZ	L19
	.line	133
	LACK	0
	SACL	_Liftflag
	.line	134
	SACL	_Toggleflag
	.line	135
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	136
	LDPK	_Tenmmcycle
	SACL	_Tenmmcycle
	.line	137
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
	.line	138
	LALK	FL2
	LRLK	AR4,_Fstepperoffdelay+0
	MAR	* ,AR4
	RPTK	1
	TBLR	*+
	.line	139
	LACK	1
	LDPK	_lifthomereset
	SACL	_lifthomereset
	.line	140
	LACK	0
	SACL	_Stopbtrfeedflag
	.line	141
	LACK	128
	MAR	* ,AR3
	ADRK	4
	OR	* 
	SACL	* 
	.line	142
	LAC	_Liftbottomcnt
	ADDK	1
	SACL	_Liftbottomcnt
	.line	143
	ZALS	_Liftbottomcnt
	SUBK	20000
	BLZ	L19
	.line	145
	LAC	_Liftbottomcnt1
	ADDK	1
	SACL	_Liftbottomcnt1
	.line	146
	LACK	0
	SACL	_Liftbottomcnt
L19:
	.line	150
	LAC	_Toggleflag
	SUBK	1
	BNZ	L16
	.line	152
	LAC	_Stepcnt
	ADDK	1
	SACL	_Stepcnt
	.line	153
	LACK	1
	SACL	_Stopcount
	.line	154
	LAC	_Stepcnt
	SUBK	100
	BNZ	L16
	.line	156
	LARK	AR3,28826
	LACK	128
	XOR	* 
	SACL	* 
	.line	157
	LACK	0
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	158
	LDPK	_Stepcnt
	SACL	_Stepcnt
	.line	160
	SACL	_Toggleflag
	.line	161
	LACK	1
	SACL	_Liftflag
	.line	162
	LACK	0
	SACL	_Stopcount
	.line	163
	LACK	1
	SACL	_Cycleautostep
	.line	164
	LAC	_Liftupcount
	SUBK	1
	BNZ	L16
	.line	166
	LAC	_Stepperresetcnt
	SUBK	120
	SACL	_Stepperresetcnt
L16:
	.line	173
	LDPK	_Stepperautostart
	LAC	_Stepperautostart
	SUBK	1
	BNZ	L24
	.line	175
	LARK	AR3,28828
	LACK	32
	MAR	* ,AR3
	AND	* ,AR1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	32
	BZ	L24
	LDPK	_Liftflag
	LAC	_Liftflag
	SUBK	1
	BNZ	L24
	.line	177
	MAR	* ,AR3
	SBRK	2
	LACK	128
	XOR	* 
	SACL	* ,AR4
	.line	178
	LACK	1
	SACL	_Toggleflag
	.line	179
	LACK	0
	SACL	_Liftflag
	.line	180
	SACL	_Tenmmcycle
	.line	181
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
	.line	182
	LDPK	_Tenmmcycle
	SACL	_Tenmmcycle
	.line	183
	SACL	_Tencount
	.line	184
	SACL	_Stepperoffdelay
	.line	185
	LALK	FL2
	LRLK	AR4,_Fstepperoffdelay+0
	RPTK	1
	TBLR	*+
	.line	186
	LACK	1
	SACL	_Stopbtrfeedflag
L24:
	.line	191
	LARK	AR3,28826
	LACK	64
	MAR	* ,AR3
	AND	* ,AR1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	64
	BZ	L26
	.line	193
	LACK	1
	LDPK	_Liftbottomcnt1
	SACL	_Liftbottomcnt1
	.line	195
	LACK	0
	SACL	_Liftupcount
L26:
	.line	199
	LACK	64
	MAR	* ,AR3
	AND	* ,AR1
	SACL	* 
	LAC	* 
	SUBK	64
	BNZ	L27
	.line	201
	LACK	1
	LDPK	_Liftupcount
	SACL	_Liftupcount
L27:
	.line	205
	LDPK	_Liftbottomcnt1
	LAC	_Liftbottomcnt1
	BZ	L28
	.line	207
	LACK	0
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	208
	LDPK	_lifthomereset
	SACL	_lifthomereset
	.line	210
	LACK	32
	MAR	* ,AR3
	ADRK	2
	AND	* ,AR1
	SACL	* 
	LAC	* 
	SUBK	32
	BZ	L28
	.line	212
	LACK	0
	SACL	_Stepperresetcnt
	.line	213
	SACL	_Stepperresetcnt1
	.line	214
	LACK	1
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	215
	LACK	0
	LDPK	_lifthomereset
	SACL	_lifthomereset
	.line	216
	LACK	65407
	MAR	* ,AR3
	SBRK	2
	AND	* 
	SACL	* 
	.line	217
	LACK	1
	SACL	_Liftflag
	.line	218
	LACK	0
	SACL	_Toggleflag
	.line	219
	SACL	_Liftbottomcnt
	.line	220
	SACL	_Liftbottomcnt1
L28:
	.line	226
	LARK	AR3,29999
	LACK	128
	MAR	* ,AR3
	AND	* 
	SACL	* 
L1:
	.line	228
 clrc INTM
EPI0_1:
	.line	229
	MAR	* ,AR1
	SBRK	1
	B	I$$REST,AR1   ;and return

	.endfunc	284,000000000H,1

	.sym	_Timer,_Timer,32,2,0
	.globl	_Timer

	.func	287
******************************************************
* FUNCTION DEF : _Timer
******************************************************
_Timer:
	CALL	I$$SAVE
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	4
 setc INTM
	.line	25
	LARK	AR3,28702
	SSXM
	MAR	* ,AR3
	LAC	* 
	SUBK	43
	BNZ	L30
	.line	28
	LDPK	_loopPoint1mS
	LAC	_loopPoint1mS
	ADDK	1
	SACL	_loopPoint1mS
	.line	30
	ZALS	_loopPoint1mS
	SUBK	500
	BLZ	L31
	.line	33
	LAC	_loopcount50ms
	ADDK	1
	SACL	_loopcount50ms
	.line	36
	ZALS	_loopcount50ms
	SUBK	18000
	BLZ	L32
	.line	38
	LACK	1
	LDPK	_mtrwriteflag
	SACL	_mtrwriteflag
	.line	39
	LACK	0
	LDPK	_loopcount50ms
	SACL	_loopcount50ms
L32:
	.line	44
	LDPK	_O+3
	LAC	_O+3
	SUBK	1
	BNZ	L33
	.line	46
	MAR	* ,AR1
	BLKD	_O+5,*+
	BLKD	_O+4,*+
	CALL	_UpdateMotorTest
	SBRK	2
	.line	47
	BLKD	_O+4,*+
	CALL	_ApplyPwmTest
	MAR	*-
	.line	48
	CALL	_DataLogMotorPID
	.line	49
	LACK	1
	LDPK	_trigger
	SACL	_trigger
	B	L34
L33:
	.line	53
	LDPK	_O+6
	LAC	_O+6
	BNZ	L35
	.line	55
	MAR	* ,AR1
	LACK	0
	SACL	*+
	CALL	_UpdateMotorPID
	MAR	*-
	.line	56
	LACK	1
	SACL	*+
	CALL	_UpdateMotorPID
	MAR	*-
L35:
	.line	58
	LDPK	_O+6
	LAC	_O+6
	SUBK	1
	BNZ	L36
	.line	60
	MAR	* ,AR1
	LACK	0
	SACL	*+
	CALL	_UpdateMotorPID
	MAR	*-
	.line	61
	LACK	1
	SACL	*+
	CALL	_UpdateMotorPID
	MAR	*-
	.line	62
	LACK	2
	SACL	*+
	CALL	_UpdateMotorRpm
	MAR	*-
	.line	63
	LACK	3
	SACL	*+
	CALL	_UpdateMotorPwm
	MAR	*-
	.line	64
	LACK	4
	SACL	*+
	CALL	_UpdateMotorPwm
	MAR	*-
	.line	65
	LACK	5
	SACL	*+
	CALL	_UpdateMotorRpm
	MAR	*-
L36:
	.line	73
	CALL	_DooropenSensor,AR1
	.line	74
	CALL	_SlivercutSensor
	.line	75
	CALL	_DataLogMotorPID
	.line	77
	CALL	_ApplyPwms
	.line	80
	LACK	1
	LDPK	_trigger
	SACL	_trigger
L34:
	.line	82
	LACK	0
	LDPK	_loopPoint1mS
	SACL	_loopPoint1mS
L31:
	.line	85
	LARK	AR3,29701
	LACK	0
	MAR	* ,AR3
	SACL	* 
	.line	86
	LACK	1
	ADRK	43
	AND	* 
	SACL	* 
L30:
	.line	89
 clrc INTM
EPI0_2:
	.line	90
	MAR	* ,AR1
	SBRK	1
	B	I$$REST,AR1   ;and return

	.endfunc	376,000000000H,1
*************************************************
* DEFINE FLOATING POINT CONSTANTS               *
*************************************************
	.text
FL0:	.float	5.e-4
FL1:	.float	5.
FL2:	.float	0.
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	_CheckpreOverload
	.global	F$$UTOF
	.global	F$$MUL
	.global	F$$GE
	.global	F$$INCR
	.global	I$$UDIV
	.global	I$$SAVE
	.global	I$$REST
	.global	_DataLogMotorPID
	.global	_UpdateMotorPwm
	.global	_DooropenSensor
	.global	_SlivercutSensor
	.end
