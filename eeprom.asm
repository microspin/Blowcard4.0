*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include eeprom.c C:\Users\SIVARA~1\AppData\Local\Temp\eeprom.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\eeprom.if eeprom.asm C:\Users\SIVARA~1\AppData\Local\Temp\eeprom.tmp 
	.port
	.file	"eeprom.c"
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
	.file	"eeprom.c"
	.text

	.sym	_dat_low,_dat_low,32,3,0

	.func	26
******************************************************
* FUNCTION DEF : _dat_low
******************************************************
_dat_low:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28830
	LACK	65534
	AND	* 
	SACL	* ,AR1
EPI0_1:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	29,000000000H,1

	.sym	_dat_high,_dat_high,32,3,0

	.func	31
******************************************************
* FUNCTION DEF : _dat_high
******************************************************
_dat_high:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28830
	LACK	257
	OR	* 
	SACL	* ,AR1
EPI0_2:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	34,000000000H,1

	.sym	_clk_low,_clk_low,32,3,0

	.func	36
******************************************************
* FUNCTION DEF : _clk_low
******************************************************
_clk_low:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	4
	LARK	AR3,28822
	LACK	65531
	AND	* 
	SACL	* ,AR1
EPI0_3:
	.line	5
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	40,000000000H,1

	.sym	_clk_high,_clk_high,32,3,0

	.func	42
******************************************************
* FUNCTION DEF : _clk_high
******************************************************
_clk_high:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28822
	LACK	1028
	OR	* 
	SACL	* ,AR1
EPI0_4:
	.line	5
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	46,000000000H,1

	.sym	_i2c_start,_i2c_start,32,3,0

	.func	48
******************************************************
* FUNCTION DEF : _i2c_start
******************************************************
_i2c_start:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28830
	LACK	256
	OR	* 
	SACL	* 
	.line	4
	SBRK	8
	LACK	1024
	OR	* 
	SACL	* ,AR1
	.line	5
	CALL	_dat_high
	.line	6
	CALL	_clk_high
	.line	7
	LACK	0
	SACL	*+
	LACK	50
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	8
	CALL	_dat_low
	.line	9
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	10
	CALL	_clk_low
	.line	11
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_5:
	.line	12
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	59,000000000H,1

	.sym	_i2c_stop,_i2c_stop,32,3,0

	.func	61
******************************************************
* FUNCTION DEF : _i2c_stop
******************************************************
_i2c_stop:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28830
	LACK	256
	OR	* 
	SACL	* 
	.line	4
	SBRK	8
	LACK	1024
	OR	* 
	SACL	* ,AR1
	.line	6
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	7
	CALL	_dat_low
	.line	8
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	9
	CALL	_clk_high
	.line	10
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	11
	CALL	_dat_high
	.line	12
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_6:
	.line	13
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	73,000000000H,1

	.sym	_i2c_write,_i2c_write,32,3,0

	.func	75
******************************************************
* FUNCTION DEF : _i2c_write
******************************************************
_i2c_write:

LF7	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+,AR3

	.sym	_out_data,-3+LF7,14,9,16
	.sym	_index,1,14,1,16
	.line	2
	.line	5
	LARK	AR3,28830
	LACK	256
	OR	* 
	SACL	* 
	.line	6
	SBRK	8
	LACK	1024
	OR	* 
	SACL	* ,AR2
	.line	8
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	ZALS	* 
	SUBK	8
	BGEZ	L2
	SBRK	4-LF7
L1:
	.line	10
	LACK	128
	AND	* 
	SUBK	128
	BNZ	L3
	.line	11
	CALL	_dat_high,AR1
	B	L4
L3:
	.line	13
	CALL	_dat_low,AR1
L4:
	.line	14
	MAR	* ,AR2
	LAC	* ,1
	SACL	* ,AR1
	.line	15
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	16
	CALL	_clk_high
	.line	17
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	18
	CALL	_clk_low
	.line	19
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	8
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	* 
	SUBK	8
	SBRK	4-LF7
	BLZ	L1
L2:
	.line	24
	LARK	AR3,28830
	LACK	65279
	MAR	* ,AR3
	AND	* 
	SACL	* ,AR1
	.line	27
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	28
	CALL	_clk_high
	.line	29
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	30
	CALL	_clk_low
	.line	31
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_7:
	.line	34
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	108,000000000H,2

	.sym	_i2c_read,_i2c_read,46,3,0

	.func	110
******************************************************
* FUNCTION DEF : _i2c_read
******************************************************
_i2c_read:

LF8	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+,AR2

	.sym	_a,-3+LF8,4,9,16
	.sym	_index,1,14,1,16
	.sym	_data,2,14,1,16
	.line	2
	.line	7
	LACK	0
	LARK	AR2,2
	MAR	*0+
	SACL	* ,AR3
	.line	8
	LARK	AR3,28830
	SPLK	#-258,* ,AR1
	.line	10
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	11
	LACK	0
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	SACL	* 
	ZALS	* 
	SUBK	8
	BGEZ	L6
	MAR	*+
L5:
	.line	13
	LAC	* ,1
	SACL	* ,AR1
	.line	14
	CALL	_clk_high
	.line	15
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	16
	LARK	AR3,28830
	LACK	1
	MAR	* ,AR3
	AND	* ,AR1
	SACL	* 
	SSXM
	LAC	* 
	SUBK	1
	BNZ	L7
	.line	17
	LACK	1
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	OR	* 
	SACL	* 
L7:
	.line	18
	CALL	_clk_low,AR1
	.line	19
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	11
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	LAC	* 
	ADDK	1
	SACL	* 
	ZALS	*+
	SUBK	8
	BLZ	L5
L6:
	.line	22
	LARK	AR3,28830
	LACK	256
	MAR	* ,AR3
	OR	* 
	SACL	* ,AR2
	.line	24
	SSXM
	LARK	AR2,-3+LF8
	MAR	*0+
	LAC	* 
	BNZ	L8
	.line	25
	CALL	_dat_low,AR1
	B	L9
L8:
	.line	27
	CALL	_dat_high,AR1
L9:
	.line	28
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	29
	CALL	_clk_high
	.line	30
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	31
	CALL	_clk_low
	.line	32
	LACK	0
	SACL	*+
	LACK	10
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	34
	MAR	* ,AR2
	LARK	AR2,2
	MAR	*0+
	ZALS	* 
EPI0_8:
	.line	35
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	144,000000000H,3

	.sym	_EepromWrite,_EepromWrite,32,2,0
	.globl	_EepromWrite

	.func	146
******************************************************
* FUNCTION DEF : _EepromWrite
******************************************************
_EepromWrite:

LF9	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,2
	LAR	AR0,*0+

	.sym	_data,-3+LF9,14,9,16
	.sym	_address,-4+LF9,4,9,16
	.sym	_byte,1,14,1,16
	.line	2
	.line	9
	CALL	_i2c_start
	.line	11
	LACK	172
	SACL	*+
	CALL	_i2c_write
	MAR	*-
	.line	12
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	13
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	16
	LACK	255
	MAR	* ,AR2
	LARK	AR2,-4+LF9
	MAR	*0+
	AND	* 
	ADRK	5-LF9
	SACL	* 
	.line	17
	LAC	* ,AR1
	SACL	*+
	CALL	_i2c_write
	MAR	*-
	.line	18
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	19
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	22
	RSXM
	LACK	65280
	MAR	* ,AR2
	LARK	AR2,-3+LF9
	MAR	*0+
	AND	* ,AR0
	SACL	* 
	LAC	* ,7,AR2
	ADRK	4-LF9
	SACH	* ,1
	.line	23
	LAC	* ,AR1
	SACL	*+
	CALL	_i2c_write
	MAR	*-
	.line	24
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	25
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	27
	LACK	255
	MAR	* ,AR2
	LARK	AR2,-3+LF9
	MAR	*0+
	AND	* 
	ADRK	4-LF9
	SACL	* ,AR1
	.line	28
	SACL	*+
	CALL	_i2c_write
	MAR	*-
	.line	29
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	30
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	32
	CALL	_i2c_stop
	.line	33
	LACK	1
	SACL	*+
	LACK	5
	SACL	*+
	CALL	_delay
	SBRK	2
EPI0_9:
	.line	35
	SBRK	3
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	180,000000000H,2

	.sym	_EepromRead,_EepromRead,46,2,0
	.globl	_EepromRead

	.func	182
******************************************************
* FUNCTION DEF : _EepromRead
******************************************************
_EepromRead:

LF10	.set	0

	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,3
	LAR	AR0,*0+,AR2

	.sym	_address,-3+LF10,4,9,16
	.sym	_data,1,14,1,16
	.sym	_byte,2,12,1,16
	.line	2
	.line	8
	LACK	0
	LARK	AR2,1
	MAR	*0+
	SACL	* ,AR1
	.line	12
	CALL	_i2c_start
	.line	13
	LACK	172
	SACL	*+
	CALL	_i2c_write
	MAR	*-
	.line	14
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	15
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	17
	LACK	255
	MAR	* ,AR2
	LARK	AR2,-3+LF10
	MAR	*0+
	AND	* 
	ADRK	5-LF10
	SACL	* 
	.line	18
	LAC	* ,AR1
	SACL	*+
	CALL	_i2c_write
	MAR	*-
	.line	19
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	20
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	21
	CALL	_i2c_stop
	.line	22
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	23
	LACK	1
	SACL	*+
	LACK	20
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	26
	CALL	_i2c_start
	.line	27
	LACK	173
	SACL	*+
	CALL	_i2c_write
	MAR	*-
	.line	28
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	29
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	30
	LACK	0
	SACL	*+
	CALL	_i2c_read
	MAR	*-,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	31
	LAC	*-
	OR	* ,AR0
	SACL	* 
	LAC	* ,8,AR2
	SACL	* ,AR1
	.line	32
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	33
	LACK	1
	SACL	*+
	LACK	2
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	35
	LACK	0
	SACL	*+
	CALL	_i2c_read
	MAR	*-,AR2
	LARK	AR2,2
	MAR	*0+
	SACL	* 
	.line	36
	LAC	*-
	OR	* 
	SACL	* ,AR1
	.line	38
	CALL	_i2c_stop
	.line	39
	LACK	1
	SACL	*+
	LACK	5
	SACL	*+
	CALL	_delay
	SBRK	2
	.line	41
	MAR	* ,AR2
	LARK	AR2,1
	MAR	*0+
	ZALS	* 
EPI0_10:
	.line	42
	MAR	* ,AR1
	SBRK	4
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	223,000000000H,3
	.end
