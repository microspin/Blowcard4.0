*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include motorrunlogicnew.c C:\Users\SIVARA~1\AppData\Local\Temp\motorru
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\motorrunlogicnew.if motorrunlogicnew.asm C:\Users\SIVARA~1\AppData\Local\Temp\motorrunlogicnew.tmp 
	.port
	.bss	_motorIndex,1,1
	.bss	_motorLimit,1
	.bss	_mtrcnt,1
	.bss	_finmts100,1
	.bss	_cleancount,1
	.bss	_Stepperdircnt,1
	.bss	_Stepperstartcnt,1
	.bss	_Stepdelaycnt,1
	.bss	_Stepperautostart,1
	.bss	_Stepperhomeflag,1
	.bss	_Secondpushbuttonpress,1
	.bss	_lcdDisplay,1
	.bss	_SecondaryMotorOn,1
	.bss	_Machinecleanflag,1
	.bss	_Inchflag,1
	.bss	_sliverdisplay,1
	.bss	_mtrwriteflag,1
	.bss	_PiecingRpm,1
	.file	"motorrunlogicnew.c"
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
	.file	"motorrunlogicnew.c"

	.sect	".cinit"
	.word	1,_motorIndex
	.word	1

	.sym	_motorIndex,_motorIndex,2,3,16
	.word	1,_motorLimit
	.word	1

	.sym	_motorLimit,_motorLimit,2,3,16
	.globl	_lcdDisplay
	.globl	_OpenerfillFlag
	.globl	_LCfillFlag
	.globl	_SecondaryMotorOn
	.globl	_LcchokeFlag
	.globl	_DooropenFlag
	.globl	_SlivercutFlag
	.globl	_sliverdisplay
	.globl	_PiecingRpm
	.globl	_Inchflag
	.globl	_mtrwriteflag
	.globl	_M3Mtcount
	.globl	_finmts
	.word	1,_mtrcnt
	.word	0

	.sym	_mtrcnt,_mtrcnt,14,2,16
	.globl	_mtrcnt
	.word	1,_finmts100
	.word	0

	.sym	_finmts100,_finmts100,14,2,16
	.globl	_finmts100
	.word	1,_cleancount
	.word	0

	.sym	_cleancount,_cleancount,14,2,16
	.globl	_cleancount
	.globl	_Machinecleanflag
	.word	1,_Stepperdircnt
	.word	0

	.sym	_Stepperdircnt,_Stepperdircnt,14,2,16
	.globl	_Stepperdircnt
	.word	1,_Stepperstartcnt
	.word	0

	.sym	_Stepperstartcnt,_Stepperstartcnt,14,2,16
	.globl	_Stepperstartcnt
	.globl	_loopPoint5mS2
	.globl	_Stepcnt
	.word	1,_Stepdelaycnt
	.word	0

	.sym	_Stepdelaycnt,_Stepdelaycnt,14,2,16
	.globl	_Stepdelaycnt
	.globl	_Stepperdelaycnt
	.word	1,_Stepperautostart
	.word	0

	.sym	_Stepperautostart,_Stepperautostart,14,2,16
	.globl	_Stepperautostart
	.globl	_Stepperoffdelay
	.globl	_Fstepperoffdelay
	.globl	_Fstepperoffdelay1
	.globl	_Toggleflag
	.globl	_Liftflag
	.globl	_Liftbottomcnt
	.globl	_Liftbottomcnt1
	.globl	_lifthomereset
	.globl	_Stepperresetcnt
	.globl	_Stepperresetcnt1
	.globl	_Stopcount
	.word	1,_Stepperhomeflag
	.word	1

	.sym	_Stepperhomeflag,_Stepperhomeflag,14,2,16
	.globl	_Stepperhomeflag
	.globl	_Liftupcount
	.globl	_Liftcount
	.globl	_Beaterpreovloadflag
	.globl	_Preovloadcnt
	.word	1,_Secondpushbuttonpress
	.word	0

	.sym	_Secondpushbuttonpress,_Secondpushbuttonpress,14,2,16
	.globl	_Secondpushbuttonpress
	.globl	_Tenmmcycle
	.globl	_Blinkflag
	.text

	.sym	_PauseMotors,_PauseMotors,32,2,0
	.globl	_PauseMotors

	.func	70
******************************************************
* FUNCTION DEF : _PauseMotors
******************************************************
_PauseMotors:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR2

	.sym	_i,1,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* ,AR3
	.line	4
	LARK	AR3,29715
	SPLK	#272,* 
	.line	6
	LACK	64
	SBRK	19
	SACL	* ,AR4
	.line	7
	LARK	AR4,29952
	SACL	* ,AR1
	.line	11
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	14
	LACK	2
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	SSXM
	LAC	* 
	SUBK	6
	BGEZ	L2
L1:
	.line	15
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	ADRK	11
	SACL	* ,AR2
	.line	16
	LT	* ,AR0
	MPYK	20
	PAC
	ADLK	_M+0,0
	SACL	* 
	LAR	AR3,* ,AR3
	LACK	0
	ADRK	12
	SACL	* ,AR2
	.line	14
	LAC	* 
	ADDK	1
	SACL	* 
	LAC	* 
	SUBK	6
	BLZ	L1
L2:
	.line	18
	CALL	_TowerLampGreen_Off,AR1
EPI0_1:
	.line	19
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	88,000000000H,2

	.sym	_RunMachine,_RunMachine,32,2,0
	.globl	_RunMachine

	.func	90
******************************************************
* FUNCTION DEF : _RunMachine
******************************************************
_RunMachine:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,73
	LAR	AR0,*0+,AR2

	.sym	_breakout,1,2,1,16
	.sym	_key,2,2,1,16
	.sym	_chngRpmEnabled,3,2,1,16
	.sym	_selectedOption,4,2,1,16
	.sym	_out,5,2,1,16
	.sym	_speed,6,4,1,16
	.sym	_cylinder,7,50,1,64,,4
	.sym	_beater,11,50,1,64,,4
	.sym	_star,15,50,1,32,,2
	.sym	_initializing,17,50,1,256,,16
	.sym	_paused,33,50,1,112,,7
	.sym	_sliver,40,50,1,112,,7
	.sym	_Piecing,47,50,1,128,,8
	.sym	_cut,55,50,1,64,,4
	.sym	_lcchoke,59,50,1,160,,10
	.sym	_yes,69,50,1,32,,2
	.sym	_no,71,50,1,32,,2
	.line	5
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	6
	SACL	*+
	.line	7
	SACL	*+
	.line	8
	SACL	*+
	.line	9
	SACL	*+
	.line	11
	SACL	*+
	.line	15
	LACK	67
	SACL	*+
	LACK	89
	SACL	*+
	LACK	76
	SACL	*+
	LACK	0
	SACL	*+
	.line	16
	LACK	66
	SACL	*+
	LACK	84
	SACL	*+
	LACK	82
	SACL	*+
	LACK	0
	SACL	*+
	.line	17
	LACK	42
	SACL	*+
	LACK	0
	SACL	*+
	.line	18
	LACK	73
	SACL	*+
	LACK	110
	SACL	*+
	LACK	105
	SACL	*+
	LACK	116
	SACL	*+
	LACK	105
	SACL	*+
	LACK	97
	SACL	*+
	LACK	108
	SACL	*+
	LACK	105
	SACL	*+
	LACK	122
	SACL	*+
	LACK	105
	SACL	*+
	LACK	110
	SACL	*+
	LACK	103
	SACL	*+
	LACK	46
	SACL	*+
	SACL	*+
	SACL	*+
	LACK	0
	SACL	*+
	.line	19
	LACK	80
	SACL	*+
	LACK	97
	SACL	*+
	LACK	117
	SACL	*+
	LACK	115
	SACL	*+
	LACK	101
	SACL	*+
	LACK	100
	SACL	*+
	LACK	0
	SACL	*+
	.line	20
	LACK	83
	SACL	*+
	LACK	108
	SACL	*+
	LACK	105
	SACL	*+
	LACK	118
	SACL	*+
	LACK	101
	SACL	*+
	LACK	114
	SACL	*+
	LACK	0
	SACL	*+
	.line	21
	LACK	80
	SACL	*+
	LACK	105
	SACL	*+
	LACK	101
	SACL	*+
	LACK	99
	SACL	*+
	LACK	105
	SACL	*+
	LACK	110
	SACL	*+
	LACK	103
	SACL	*+
	LACK	0
	SACL	*+
	.line	22
	LACK	67
	SACL	*+
	LACK	117
	SACL	*+
	LACK	116
	SACL	*+
	LACK	0
	SACL	*+
	.line	23
	LACK	32
	SACL	*+
	LACK	76
	SACL	*+
	LACK	99
	SACL	*+
	LACK	32
	SACL	*+
	LACK	67
	SACL	*+
	LACK	104
	SACL	*+
	LACK	111
	SACL	*+
	LACK	107
	SACL	*+
	LACK	101
	SACL	*+
	LACK	0
	SACL	*+
	.line	24
	LACK	121
	SACL	*+
	LACK	0
	SACL	*+
	.line	25
	LACK	110
	SACL	*+
	LACK	0
	SACL	* ,AR1
	.line	26
	LDPK	_lcdDisplay
	SACL	_lcdDisplay
	.line	29
	LACK	1
	LDPK	_OpenerfillFlag
	SACL	_OpenerfillFlag
	.line	31
	LDPK	_SecondaryMotorOn
	SACL	_SecondaryMotorOn
	.line	32
	LACK	0
	LDPK	_LcchokeFlag
	SACL	_LcchokeFlag
	.line	33
	LDPK	_DooropenFlag
	SACL	_DooropenFlag
	.line	34
	LDPK	_SlivercutFlag
	SACL	_SlivercutFlag
	.line	35
	LDPK	_Machinecleanflag
	SACL	_Machinecleanflag
	.line	36
	SACL	_Inchflag
	.line	37
	SACL	_PiecingRpm
	.line	38
	SACL	_cleancount
	.line	39
	SACL	_Stepperstartcnt
	.line	40
	SACL	_Stepperdircnt
	.line	41
	SACL	_Stepdelaycnt
	.line	42
	LDPK	_Toggleflag
	SACL	_Toggleflag
	.line	43
	LACK	1
	LDPK	_Liftflag
	SACL	_Liftflag
	.line	44
	LACK	0
	LDPK	_Liftupcount
	SACL	_Liftupcount
	.line	45
	LDPK	_Liftcount
	SACL	_Liftcount
	.line	46
	LDPK	_Beaterpreovloadflag
	SACL	_Beaterpreovloadflag
	.line	47
	LDPK	_Preovloadcnt
	SACL	_Preovloadcnt
	.line	48
	LDPK	_Secondpushbuttonpress
	SACL	_Secondpushbuttonpress
	.line	49
	CALL	_DispClear
	.line	50
	CALL	_Stepperhome
	.line	51
	LACK	16
	SACL	*+,AR3
	LARK	AR3,17
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	52
	CALL	_MotorStructInit
	.line	53
	CALL	_InitMenuStruct
	.line	55
	CALL	_InitOptionsStruct
	.line	56
	CALL	_LoadDatalogOptions
	.line	57
	CALL	_InitOverloadStruct
	.line	59
	CALL	_ResetFilterSumArray
	.line	60
	CALL	_ResetOverloadCounterArray
	.line	62
	CALL	_ResetFilterRpmArray
	.line	64
	CALL	_InitMotorPID
	.line	65
	CALL	_ResetIntegralErrorArray
	.line	67
	CALL	_ResetHistoryArrays
	.line	69
	CALL	_ResetAllRPMCounts
	.line	71
	CALL	_DispClear
	.line	73
 clrc INTM
	.line	74
	CALL	_InitMotorHardware
	.line	75
	LACK	1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	78
	LACK	1
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	79
	LACK	0
	LDPK	_Liftbottomcnt
	SACL	_Liftbottomcnt
	.line	80
	LDPK	_Liftbottomcnt1
	SACL	_Liftbottomcnt1
	.line	81
	LDPK	_lifthomereset
	SACL	_lifthomereset
	.line	82
	LDPK	_Stepperresetcnt
	SACL	_Stepperresetcnt
	.line	83
	LDPK	_Stepperresetcnt1
	SACL	_Stepperresetcnt1
	.line	84
	LDPK	_Stopcount
	SACL	_Stopcount
	.line	88
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	SUBK	1
	BZ	L4
	MAR	* ,AR1
L3:
	.line	92
	CALL	_OverloadLogic,AR1
	MAR	* ,AR2
	LARK	AR2,5
	MAR	*0+
	SACL	* 
	.line	99
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L5
	.line	100
	LACK	1
	SBRK	4
	SACL	* 
L5:
	.line	102
	LDPK	_lcdDisplay
	LAC	_lcdDisplay
	BNZ	L6
	.line	103
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,7
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	104
	LACK	64
	SACL	*+
	LACK	21
	SACL	*+,AR3
	LRLK	AR3,_M+1
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	105
	LACK	0
	LDPK	_sliverdisplay
	SACL	_sliverdisplay
	.line	106
	CALL	_TowerLampGreen_On
	.line	107
	CALL	_TowerLampBrown_Off
	.line	108
	BLKD	_motorIndex+0,*+
	CALL	_CycleDisp
	MAR	*-
	.line	112
	LDPK	_O+6
	LAC	_O+6
	BNZ	L7
	.line	114
	CALL	_CheckAllMotors
	LDPK	_O+6
	SACL	_O+6
	.line	115
	LAC	_O+6
	SUBK	1
	BNZ	L7
	.line	117
	CALL	_StartSecondaryMotors
	.line	118
	CALL	_StartFeedMotors
	.line	119
	CALL	_StartbtrFeedMotors
	.line	120
	CALL	_StartLcFeedMotor
L7:
	.line	124
	LDPK	_O+6
	LAC	_O+6
	SUBK	1
	BNZ	L6
	.line	125
	LACK	47
	SACL	*+,AR3
	LARK	AR3,15
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	126
	LACK	1
	MAR	* ,AR2
	LARK	AR2,3
	MAR	*0+
	SACL	* 
	.line	127
	LACK	5
	LDPK	_motorLimit
	SACL	_motorLimit
L6:
	.line	184
	SSXM
	LDPK	_lcdDisplay
	LAC	_lcdDisplay
	SUBK	2
	BNZ	L10
	LAC	_sliverdisplay
	SUBK	1
	BZ	L10
	LAC	_PiecingRpm
	SUBK	1
	BZ	L10
	.line	186
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,33
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	187
	LACK	24
	SACL	*+,AR3
	LARK	AR3,7
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	188
	LACK	40
	SACL	*+,AR3
	LARK	AR3,11
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	189
	LACK	64
	SACL	*+
	LACK	28
	SACL	*+,AR3
	LRLK	AR3,_M+1
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	190
	LACK	64
	SACL	*+
	LACK	44
	SACL	*+,AR3
	LRLK	AR3,_M+21
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
L10:
	.line	193
	SSXM
	LDPK	_lcdDisplay
	LAC	_lcdDisplay
	SUBK	2
	BNZ	L11
	LAC	_sliverdisplay
	SUBK	1
	BNZ	L11
	LAC	_PiecingRpm
	SUBK	1
	BZ	L11
	.line	195
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,40
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	196
	LACK	32
	SACL	*+,AR3
	LARK	AR3,55
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	197
	LACK	24
	SACL	*+,AR3
	LARK	AR3,7
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	198
	LACK	40
	SACL	*+,AR3
	LARK	AR3,11
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	199
	LACK	64
	SACL	*+
	LACK	28
	SACL	*+,AR3
	LRLK	AR3,_M+1
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	200
	LACK	64
	SACL	*+
	LACK	44
	SACL	*+,AR3
	LRLK	AR3,_M+21
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
L11:
	.line	203
	SSXM
	LDPK	_lcdDisplay
	LAC	_lcdDisplay
	SUBK	2
	BNZ	L12
	LAC	_PiecingRpm
	SUBK	1
	BNZ	L12
	.line	205
	MAR	* ,AR1
	LACK	16
	SACL	*+,AR3
	LARK	AR3,47
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	206
	LACK	24
	SACL	*+,AR3
	LARK	AR3,7
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	207
	LACK	40
	SACL	*+,AR3
	LARK	AR3,11
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	208
	LACK	64
	SACL	*+
	LACK	28
	SACL	*+,AR3
	LRLK	AR3,_M+1
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
	.line	209
	LACK	64
	SACL	*+
	LACK	44
	SACL	*+,AR3
	LRLK	AR3,_M+21
	LAC	* ,AR1
	SACL	*+
	CALL	_DispNo
	SBRK	3
L12:
	.line	218
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	220
	SSXM
	LAC	* 
	SUBK	5
	BZ	LL4
	LDPK	_SlivercutFlag
	LAC	_SlivercutFlag
	SUBK	1
	BNZ	L13
LL4:
	.line	221
	LDPK	_lcdDisplay
	LAC	_lcdDisplay
	BNZ	L13
	.line	222
	CALL	_PauseMotors,AR1
	.line	223
	CALL	_TowerLampBrown_On
	.line	224
	LACK	6
	SACL	*+,AR3
	LARK	AR3,33
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_SerialWriteText
	SBRK	2
	.line	226
	LACK	2
	LDPK	_lcdDisplay
	SACL	_lcdDisplay
	.line	227
	LDPK	_SlivercutFlag
	LAC	_SlivercutFlag
	SUBK	1
	BNZ	L15
	LACK	1
	LDPK	_sliverdisplay
	SACL	_sliverdisplay
L15:
	.line	228
	LACK	1
	SACL	*+
	LACK	200
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	229
	CALL	_DispClear
	.line	230
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	231
	LACK	0
	LDPK	_SecondaryMotorOn
	SACL	_SecondaryMotorOn
	.line	232
	LDPK	_Tenmmcycle
	SACL	_Tenmmcycle
	.line	233
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
L13:
	.line	239
	LDPK	_Beaterpreovloadflag
	LAC	_Beaterpreovloadflag
	SUBK	1
	BNZ	L16
	.line	241
	CALL	_StopFeedMotors,AR1
L16:
	.line	244
	LDPK	_Beaterpreovloadflag
	LAC	_Beaterpreovloadflag
	BNZ	L17
	SSXM
	LDPK	_lcdDisplay
	LAC	_lcdDisplay
	BNZ	L17
	.line	246
	CALL	_StartbtrFeedMotors,AR1
L17:
	.line	249
	LDPK	_OpenerfillFlag
	LAC	_OpenerfillFlag
	BNZ	LL6
	LDPK	_O+6
	LAC	_O+6
	SUBK	1
	BZ	LL5
LL6:
	LDPK	_LcchokeFlag
	LAC	_LcchokeFlag
	SUBK	1
	BNZ	L18
LL5:
	.line	252
	CALL	_StartLcFeedMotor,AR1
L18:
	.line	255
	SSXM
	LDPK	_lcdDisplay
	LAC	_lcdDisplay
	SUBK	2
	BNZ	L19
	LAC	_PiecingRpm
	BNZ	L19
	.line	256
	CALL	_StopLcFeedMotor,AR1
L19:
	.line	259
	LDPK	_OpenerfillFlag
	LAC	_OpenerfillFlag
	SUBK	1
	BNZ	L20
	LDPK	_LcchokeFlag
	LAC	_LcchokeFlag
	BNZ	L20
	SSXM
	LDPK	_lcdDisplay
	LAC	_lcdDisplay
	BNZ	L20
	.line	262
	CALL	_StartLcFeedMotor,AR1
L20:
	.line	265
	SSXM
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	SUBK	1
	BNZ	L21
	.line	266
	CALL	_IncreaseMotorIndex,AR1
L21:
	.line	270
	SSXM
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	SUBK	2
	BNZ	L22
	.line	272
	LDPK	_Stepperdircnt
	LAC	_Stepperdircnt
	ADDK	1
	SACL	_Stepperdircnt
L22:
	.line	276
	LDPK	_Stepperdircnt
	LAC	_Stepperdircnt
	SUBK	1
	BNZ	L23
	.line	278
	LARK	AR3,28826
	LACK	128
	MAR	* ,AR3
	OR	* 
	SACL	* 
L23:
	.line	281
	MAR	* ,AR2
	LAC	* 
	SUBK	4
	BNZ	L24
	.line	283
	LAC	_Stepperstartcnt
	ADDK	1
	SACL	_Stepperstartcnt
L24:
	.line	285
	LAC	_Stepperdircnt
	SUBK	2
	BNZ	L25
	.line	287
	LARK	AR3,28826
	LACK	65407
	MAR	* ,AR3
	AND	* 
	SACL	* 
L25:
	.line	291
	LAC	_Stepperstartcnt
	SUBK	2
	BNZ	L26
	.line	292
	LACK	0
	SACL	_Stepperstartcnt
	.line	293
	LDPK	_loopPoint5mS2
	SACL	_loopPoint5mS2
L26:
	.line	297
	LDPK	_Stepperdircnt
	LAC	_Stepperdircnt
	SUBK	3
	BNZ	L27
	.line	299
	LACK	0
	LDPK	_Stepcnt
	SACL	_Stepcnt
	.line	300
	LDPK	_Stepperdircnt
	SACL	_Stepperdircnt
	.line	301
	SACL	_Stepperstartcnt
	.line	302
	LACK	1
	SACL	_Stepperautostart
	.line	303
	LACK	0
	LDPK	_loopPoint5mS2
	SACL	_loopPoint5mS2
L27:
	.line	307
	LDPK	_Stepperautostart
	LAC	_Stepperautostart
	SUBK	1
	BNZ	L28
	MAR	* ,AR1
	LACK	44
	SACL	*+,AR3
	LARK	AR3,69
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L28:
	.line	309
	LDPK	_Stepperautostart
	LAC	_Stepperautostart
	BNZ	L29
	MAR	* ,AR1
	LACK	44
	SACL	*+,AR3
	LARK	AR3,71
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
L29:
	.line	331
	SSXM
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	LAC	* 
	SUBK	5
	BNZ	L30
	LDPK	_Secondpushbuttonpress
	LAC	_Secondpushbuttonpress
	SUBK	1
	BNZ	L30
	.line	333
	LACK	1
	SACL	_SecondaryMotorOn
	.line	334
	MAR	* ,AR1
	SACL	*+
	LACK	500
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	335
	CALL	_DispClear
	.line	336
	LACK	0
	LDPK	_lcdDisplay
	SACL	_lcdDisplay
	.line	337
	CALL	_KeyScan
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	338
	LACK	0
	LDPK	_sliverdisplay
	SACL	_sliverdisplay
	.line	339
	SACL	_PiecingRpm
	.line	340
	LACK	1
	LDPK	_Tenmmcycle
	SACL	_Tenmmcycle
	.line	341
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
	.line	343
	LACK	0
	SACL	_Secondpushbuttonpress
L30:
	.line	348
	SSXM
	LAC	* 
	SUBK	5
	BNZ	L31
	LDPK	_Secondpushbuttonpress
	LAC	_Secondpushbuttonpress
	BNZ	L31
	.line	351
	LAC	_lcdDisplay
	SUBK	2
	BNZ	L32
	.line	354
	CALL	_TowerLampGreen_On,AR1
	.line	355
	CALL	_TowerLampBrown_On
	.line	356
	CALL	_StartSecondaryMotors
	.line	357
	CALL	_StartFeedMotors
	.line	358
	CALL	_StartbtrFeedMotors
	.line	359
	CALL	_StartLcFeedMotor
	.line	360
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	361
	CALL	_DispClear
	.line	362
	LACK	0
	LDPK	_sliverdisplay
	SACL	_sliverdisplay
	.line	363
	LACK	1
	SACL	_PiecingRpm
	.line	364
	LDPK	_Tenmmcycle
	SACL	_Tenmmcycle
	.line	365
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
	.line	367
	SACL	_Secondpushbuttonpress
L32:
	.line	370
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
L31:
	.line	88
	SSXM
	MAR	*-
	LAC	* ,AR1
	SUBK	1
	BNZ	L3
L4:
EPI0_2:
	.line	380
	MAR	* ,AR1
	SBRK	74
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	469,000000000H,73

	.sym	_IncreaseMotorIndex,_IncreaseMotorIndex,32,3,0

	.func	473
******************************************************
* FUNCTION DEF : _IncreaseMotorIndex
******************************************************
_IncreaseMotorIndex:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	2
	SSXM
	LDPK	_motorIndex
	LAC	_motorIndex
	SUB	_motorLimit
	BNZ	L33
	.line	3
	LACK	1
	SACL	_motorIndex
	.line	4
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	B	L34
L33:
	.line	7
	LAC	_motorIndex
	ADDK	1
	SACL	_motorIndex
	.line	8
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
L34:
EPI0_3:
	.line	10
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	482,000000000H,1

	.sym	_DecreaseMotorIndex,_DecreaseMotorIndex,32,3,0

	.func	485
******************************************************
* FUNCTION DEF : _DecreaseMotorIndex
******************************************************
_DecreaseMotorIndex:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	2
	SSXM
	LDPK	_motorIndex
	LAC	_motorIndex
	SUBK	1
	BNZ	L35
	.line	3
	BLKD	#_motorLimit,_motorIndex
	.line	4
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	B	L36
L35:
	.line	6
	LAC	_motorIndex
	SUBK	1
	SACL	_motorIndex
	.line	7
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
L36:
EPI0_4:
	.line	9
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	493,000000000H,1

	.sym	_ResetInitialPwms,_ResetInitialPwms,32,3,0

	.func	497
******************************************************
* FUNCTION DEF : _ResetInitialPwms
******************************************************
_ResetInitialPwms:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LRLK	AR3,_M+72
	LACK	5
	SACL	* ,AR1
EPI0_5:
	.line	5
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	501,000000000H,1

	.sym	_StartSecondaryMotors,_StartSecondaryMotors,32,3,0

	.func	503
******************************************************
* FUNCTION DEF : _StartSecondaryMotors
******************************************************
_StartSecondaryMotors:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LRLK	AR3,_M+51
	LACK	1
	SACL	* ,AR1
	.line	4
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	5
	LARK	AR3,29715
	MAR	* ,AR3
	SPLK	#273,* ,AR1
EPI0_6:
	.line	6
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	508,000000000H,1

	.sym	_StopSecondaryMotors,_StopSecondaryMotors,32,3,0

	.func	510
******************************************************
* FUNCTION DEF : _StopSecondaryMotors
******************************************************
_StopSecondaryMotors:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,29715
	SPLK	#272,* ,AR1
	.line	4
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	5
	LRLK	AR3,_M+51
	LACK	0
	MAR	* ,AR3
	SACL	* ,AR1
EPI0_7:
	.line	6
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	515,000000000H,1

	.sym	_StopFeedMotors,_StopFeedMotors,32,3,0

	.func	517
******************************************************
* FUNCTION DEF : _StopFeedMotors
******************************************************
_StopFeedMotors:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,29952
	LACK	64
	SACL	* ,AR1
	.line	4
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	5
	LRLK	AR3,_M+91
	LACK	0
	MAR	* ,AR3
	SACL	* ,AR1
EPI0_8:
	.line	6
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	522,000000000H,1

	.sym	_StartFeedMotors,_StartFeedMotors,32,3,0

	.func	527
******************************************************
* FUNCTION DEF : _StartFeedMotors
******************************************************
_StartFeedMotors:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	3
	CALL	_ResetInitialPwms
	.line	4
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	5
	LARK	AR3,29696
	LACK	68
	MAR	* ,AR3
	OR	* 
	SACL	* ,AR1
EPI0_9:
	.line	8
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	534,000000000H,1

	.sym	_StartbtrFeedMotors,_StartbtrFeedMotors,32,3,0

	.func	536
******************************************************
* FUNCTION DEF : _StartbtrFeedMotors
******************************************************
_StartbtrFeedMotors:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	4
	LRLK	AR3,_M+92
	LACK	5
	SACL	* ,AR1
	.line	5
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	7
	LARK	AR3,29952
	LACK	68
	MAR	* ,AR3
	OR	* 
	SACL	* ,AR1
EPI0_10:
	.line	9
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	544,000000000H,1

	.sym	_StartLcFeedMotor,_StartLcFeedMotor,32,3,0

	.func	548
******************************************************
* FUNCTION DEF : _StartLcFeedMotor
******************************************************
_StartLcFeedMotor:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	4
	LRLK	AR3,_M+112
	LACK	1
	SACL	* ,AR1
	.line	5
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	6
	LARK	AR3,29696
	LACK	65
	MAR	* ,AR3
	OR	* 
	SACL	* ,AR1
EPI0_11:
	.line	7
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	554,000000000H,1

	.sym	_StopLcFeedMotor,_StopLcFeedMotor,32,3,0

	.func	556
******************************************************
* FUNCTION DEF : _StopLcFeedMotor
******************************************************
_StopLcFeedMotor:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,29696
	LACK	65534
	AND	* 
	SACL	* ,AR1
	.line	4
	LACK	1
	SACL	*+
	LACK	250
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	5
	LRLK	AR3,_M+111
	LACK	0
	MAR	* ,AR3
	SACL	* ,AR1
EPI0_12:
	.line	7
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	562,000000000H,1

	.sym	_OverloadLogic,_OverloadLogic,34,3,0

	.func	564
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
	BNZ	L37
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
	.line	19
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	BNZ	L37
	MAR	* ,AR1
L38:
	.line	21
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,44
	MAR	*0+
	SACL	* 
	.line	22
	SSXM
	LAC	* 
	SUBK	3
	BNZ	L40
	.line	23
	LACK	1
	SBRK	43
	SACL	* ,AR1
	.line	24
	CALL	_DispClear
	.line	25
	LACK	1
	SACL	*+
	LACK	1000
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	26
	LACK	1
	MAR	* ,AR2
	LARK	AR2,45
	MAR	*0+
	SACL	* 
L40:
	.line	19
	SSXM
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR1
	BZ	L38
L37:
	.line	30
	SSXM
	MAR	* ,AR2
	LARK	AR2,45
	MAR	*0+
	LAC	* 
EPI0_13:
	.line	31
	MAR	* ,AR1
	SBRK	48
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	594,000000000H,47

	.sym	_RpmerrorLogic,_RpmerrorLogic,34,3,0

	.func	597
******************************************************
* FUNCTION DEF : _RpmerrorLogic
******************************************************
_RpmerrorLogic:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,16
	LAR	AR0,*0+,AR2

	.sym	_breakout2,1,2,1,16
	.sym	_rpmerror,2,50,1,176,,11
	.sym	_key,13,2,1,16
	.sym	_out,14,2,1,16
	.sym	_datasetNo,15,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	LACK	82
	SACL	*+
	LACK	80
	SACL	*+
	LACK	77
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
	LACK	33
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*+
	.line	6
	SACL	* 
	.line	8
	LDPK	_OV+2
	LAC	_OV+2
	SUBK	1
	BNZ	L41
	.line	10
	CALL	_StopAllMotors,AR1
	.line	11
	CALL	_DispClear
	.line	12
 setc INTM
	.line	13
	LACK	16
	SACL	*+
	LDPK	_OV+3
	LAC	_OV+3,2
	ADLK	_motorNames+0,0
	SACL	*+
	CALL	_DispText
	SBRK	2
	.line	14
	LACK	32
	SACL	*+,AR3
	LARK	AR3,2
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	16
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	BNZ	L41
	MAR	* ,AR1
L42:
	.line	18
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	SACL	* 
	.line	19
	SSXM
	LAC	* 
	SUBK	3
	BNZ	L44
	.line	20
	LACK	1
	SBRK	12
	SACL	* ,AR1
	.line	21
	CALL	_DispClear
	.line	22
	LACK	1
	SACL	*+
	LACK	1000
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	23
	LACK	1
	MAR	* ,AR2
	LARK	AR2,14
	MAR	*0+
	SACL	* 
L44:
	.line	16
	SSXM
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR1
	BZ	L42
L41:
	.line	27
	SSXM
	MAR	* ,AR2
	LARK	AR2,14
	MAR	*0+
	LAC	* 
EPI0_14:
	.line	28
	MAR	* ,AR1
	SBRK	17
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	624,000000000H,16

	.sym	_DooropenCheck,_DooropenCheck,34,3,0

	.func	626
******************************************************
* FUNCTION DEF : _DooropenCheck
******************************************************
_DooropenCheck:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,16
	LAR	AR0,*0+,AR2

	.sym	_breakout2,1,2,1,16
	.sym	_dooropen,2,50,1,176,,11
	.sym	_key,13,2,1,16
	.sym	_out,14,2,1,16
	.sym	_datasetNo,15,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	LACK	68
	SACL	*+
	LACK	111
	SACL	*+
	SACL	*+
	LACK	114
	SACL	*+
	LACK	32
	SACL	*+
	LACK	79
	SACL	*+
	LACK	112
	SACL	*+
	LACK	101
	SACL	*+
	LACK	110
	SACL	*+
	LACK	33
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*+
	.line	6
	SACL	* 
	.line	8
	LDPK	_DooropenFlag
	LAC	_DooropenFlag
	SUBK	1
	BNZ	L45
	.line	10
	CALL	_StopAllMotors,AR1
	.line	11
	CALL	_TowerLampRed_On
	.line	12
	CALL	_TowerLampGreen_Off
	.line	13
	CALL	_DispClear
	.line	14
 setc INTM
	.line	15
	LACK	32
	SACL	*+,AR3
	LARK	AR3,2
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	18
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	BNZ	L45
	MAR	* ,AR1
L46:
	.line	20
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,13
	MAR	*0+
	SACL	* 
	.line	21
	SSXM
	LAC	* 
	SUBK	3
	BNZ	L48
	.line	23
	CALL	_TowerLampRed_Off,AR1
	.line	24
	LACK	1
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
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
	LARK	AR2,14
	MAR	*0+
	SACL	* 
L48:
	.line	18
	SSXM
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR1
	BZ	L46
L45:
	.line	31
	SSXM
	MAR	* ,AR2
	LARK	AR2,14
	MAR	*0+
	LAC	* 
EPI0_15:
	.line	32
	MAR	* ,AR1
	SBRK	17
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	657,000000000H,16

	.sym	_MachineCleaning,_MachineCleaning,34,3,0

	.func	659
******************************************************
* FUNCTION DEF : _MachineCleaning
******************************************************
_MachineCleaning:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,20
	LAR	AR0,*0+,AR2

	.sym	_breakout2,1,2,1,16
	.sym	_cleanmachine,2,50,1,240,,15
	.sym	_key,17,2,1,16
	.sym	_out,18,2,1,16
	.sym	_datasetNo,19,2,1,16
	.line	2
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	.line	3
	LACK	67
	SACL	*+
	LACK	108
	SACL	*+
	LACK	101
	SACL	*+
	LACK	97
	SACL	*+
	LACK	110
	SACL	*+
	LACK	32
	SACL	*+
	LACK	77
	SACL	*+
	LACK	97
	SACL	*+
	LACK	99
	SACL	*+
	LACK	104
	SACL	*+
	LACK	105
	SACL	*+
	LACK	110
	SACL	*+
	LACK	101
	SACL	*+
	LACK	33
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	SACL	*+
	.line	5
	SACL	*+
	.line	6
	SACL	* 
	.line	8
	LDPK	_Machinecleanflag
	LAC	_Machinecleanflag
	SUBK	1
	BNZ	L49
	.line	10
	CALL	_StopAllMotors,AR1
	.line	11
	CALL	_TowerLampRed_On
	.line	12
	CALL	_TowerLampGreen_Off
	.line	13
	CALL	_DispClear
	.line	14
 setc INTM
	.line	15
	LACK	32
	SACL	*+,AR3
	LARK	AR3,2
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	18
	SSXM
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	BNZ	L49
	MAR	* ,AR1
L50:
	.line	20
	CALL	_KeyScan,AR1
	MAR	* ,AR2
	LARK	AR2,17
	MAR	*0+
	SACL	* 
	.line	21
	SSXM
	LAC	* 
	SUBK	3
	BNZ	L52
	.line	23
	CALL	_TowerLampRed_Off,AR1
	.line	24
	LACK	1
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
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
	LARK	AR2,18
	MAR	*0+
	SACL	* 
L52:
	.line	18
	SSXM
	LARK	AR2,1
	MAR	*0+
	LAC	* ,AR1
	BZ	L50
L49:
	.line	31
	SSXM
	MAR	* ,AR2
	LARK	AR2,18
	MAR	*0+
	LAC	* 
EPI0_16:
	.line	32
	MAR	* ,AR1
	SBRK	21
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	690,000000000H,20

	.sym	_Stepperhome,_Stepperhome,32,3,0

	.func	692
******************************************************
* FUNCTION DEF : _Stepperhome
******************************************************
_Stepperhome:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,42
	LAR	AR0,*0+,AR2

	.sym	_homming,1,50,1,208,,13
	.sym	_fillcotton,14,50,1,192,,12
	.sym	_liftposition,26,50,1,224,,14
	.sym	_key,40,2,1,16
	.sym	_i,41,14,1,16
	.line	3
	LACK	76
	LARK	AR2,1
	MAR	*0+
	SACL	*+
	LACK	105
	SACL	*+
	LACK	102
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	72
	SACL	*+
	LACK	111
	SACL	*+
	LACK	109
	SACL	*+
	SACL	*+
	LACK	105
	SACL	*+
	LACK	110
	SACL	*+
	LACK	103
	SACL	*+
	LACK	0
	SACL	*+
	.line	4
	LACK	70
	SACL	*+
	LACK	105
	SACL	*+
	LACK	108
	SACL	*+
	SACL	*+
	LACK	32
	SACL	*+
	LACK	67
	SACL	*+
	LACK	111
	SACL	*+
	LACK	116
	SACL	*+
	SACL	*+
	LACK	111
	SACL	*+
	LACK	110
	SACL	*+
	LACK	0
	SACL	*+
	.line	5
	LACK	76
	SACL	*+
	LACK	105
	SACL	*+
	LACK	102
	SACL	*+
	LACK	116
	SACL	*+
	LACK	32
	SACL	*+
	LACK	112
	SACL	*+
	LACK	111
	SACL	*+
	LACK	115
	SACL	*+
	LACK	105
	SACL	*+
	LACK	116
	SACL	*+
	LACK	105
	SACL	*+
	LACK	111
	SACL	*+
	LACK	110
	SACL	*+
	LACK	0
	SACL	*+
	.line	6
	SACL	* ,AR1
	.line	8
	CALL	_DispClear
	.line	9
	LACK	16
	SACL	*+,AR3
	LARK	AR3,1
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	10
	LARK	AR3,28826
	LACK	128
	MAR	* ,AR3
	OR	* 
	SACL	* 
	.line	11
	LACK	64
	AND	* ,AR1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	64
	BNZ	L54
	MAR	* ,AR3
L53:
	.line	15
	LARK	AR3,28822
	LACK	32
	OR	* 
	SACL	* ,AR1
	.line	16
	CALL	_delay1ms
	.line	17
	LARK	AR3,28822
	LACK	65503
	MAR	* ,AR3
	AND	* 
	SACL	* ,AR1
	.line	18
	CALL	_delay1ms
	.line	11
	LARK	AR3,28826
	LACK	64
	MAR	* ,AR3
	AND	* ,AR1
	SACL	* 
	SSXM
	LAC	* ,AR3
	SUBK	64
	BZ	L53
L54:
	.line	24
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	25
	CALL	_DispClear
	.line	26
	LACK	16
	SACL	*+,AR3
	LARK	AR3,14
	MAR	*0+,AR1
	SAR	AR3,*+
	CALL	_DispText
	SBRK	2
	.line	27
	LACK	0
	MAR	* ,AR2
	LARK	AR2,40
	MAR	*0+
	SACL	* ,AR1
	.line	28
	LACK	1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	29
	SSXM
	MAR	* ,AR2
	LARK	AR2,40
	MAR	*0+
	LAC	* 
	SUBK	3
	BZ	L56
	MAR	* ,AR3
L55:
	.line	32
	LARK	AR3,28828
	BIT	* ,8
	BBNZ	L57
	.line	33
	LACK	3
	MAR	* ,AR2
	LARK	AR2,40
	MAR	*0+
	SACL	* ,AR1
	.line	34
	LACK	1
	SACL	*+
	LACK	20
	SACL	*+
	CALL	_delay
	SBRK	2
L57:
	.line	29
	SSXM
	MAR	* ,AR2
	LARK	AR2,40
	MAR	*0+
	LAC	* ,AR3
	SUBK	3
	BNZ	L55
L56:
	.line	55
	MAR	* ,AR1
	LACK	1
	SACL	*+
	LACK	100
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	56
	LARK	AR3,28826
	LACK	65407
	MAR	* ,AR3
	AND	* 
	SACL	* ,AR2
	.line	57
	LACK	0
	LARK	AR2,41
	MAR	*0+
	SACL	* 
	ZALS	* 
	SUBK	2000
	BGEZ	L59
	MAR	* ,AR3
L58:
	.line	59
	LARK	AR3,28822
	LACK	32
	OR	* 
	SACL	* ,AR1
	.line	60
	CALL	_delay1ms
	.line	61
	LARK	AR3,28822
	LACK	65503
	MAR	* ,AR3
	AND	* 
	SACL	* ,AR1
	.line	62
	CALL	_delay1ms
	.line	57
	MAR	* ,AR2
	LARK	AR2,41
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* ,AR3
	SUBK	2000
	BLZ	L58
L59:
	.line	65
	CALL	_DispClear,AR1
	.line	66
	LACK	0
	MAR	* ,AR2
	LARK	AR2,40
	MAR	*0+
	SACL	* ,AR1
	.line	67
	LDPK	_Stepperhomeflag
	SACL	_Stepperhomeflag
EPI0_17:
	.line	69
	SBRK	43
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	760,000000000H,42

	.sym	_Stepperdirchange,_Stepperdirchange,32,2,0
	.globl	_Stepperdirchange

	.func	764
******************************************************
* FUNCTION DEF : _Stepperdirchange
******************************************************
_Stepperdirchange:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+

	.line	3
	LDPK	_Stepcnt
	LAC	_Stepcnt
	SUBK	2000
	BNZ	L60
	.line	5
	LARK	AR3,28826
	LACK	128
	MAR	* ,AR3
	XOR	* 
	SACL	* 
L60:
	.line	8
	LAC	_Stepcnt
	SUBK	3000
	BNZ	L61
	.line	10
	LARK	AR3,28826
	LACK	128
	MAR	* ,AR3
	XOR	* 
	SACL	* 
	.line	11
	LACK	0
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	12
	LDPK	_Stepcnt
	SACL	_Stepcnt
	.line	13
	LACK	1
	LDPK	_Stepdelaycnt
	SACL	_Stepdelaycnt
L61:
	.line	16
	MAR	* ,AR1
	LACK	5
	SACL	*+,AR3
	LRLK	AR3,_M+140
	ZALS	* ,AR1
	CALL	I$$UDIV
	CALL	F$$UTOF
	RPTK	1
	BLKD	_Fstepperoffdelay1+0,*+
	CALL	F$$GE
	BZ	L62
	.line	18
	LACK	1
	LDPK	_Stepperautostart
	SACL	_Stepperautostart
	.line	19
	LACK	0
	SACL	_Stepdelaycnt
L62:
EPI0_18:
	.line	23
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	786,000000000H,1

	.sym	_lcdDisplay,_lcdDisplay,2,2,16
	.globl	_lcdDisplay

	.sym	_SecondaryMotorOn,_SecondaryMotorOn,14,2,16
	.globl	_SecondaryMotorOn

	.sym	_Machinecleanflag,_Machinecleanflag,14,2,16
	.globl	_Machinecleanflag

	.sym	_Inchflag,_Inchflag,12,2,16
	.globl	_Inchflag

	.sym	_sliverdisplay,_sliverdisplay,12,2,16
	.globl	_sliverdisplay

	.sym	_mtrwriteflag,_mtrwriteflag,14,2,16
	.globl	_mtrwriteflag

	.sym	_PiecingRpm,_PiecingRpm,12,2,16
	.globl	_PiecingRpm
*****************************************************
* UNDEFINED REFERENCES                              *
*****************************************************
	.global	_TowerLampGreen_Off
	.global	_TowerLampRed_Off
	.global	_TowerLampGreen_On
	.global	_TowerLampBrown_Off
	.global	_TowerLampBrown_On
	.global	_TowerLampRed_On
	.global	I$$UDIV
	.global	F$$UTOF
	.global	F$$GE
	.end
