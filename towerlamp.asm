*******************************************************
* TMS320C24xx ANSI C Codegen Version 7.04       
*******************************************************
;	dspac -q -d_DEBUG -v2xx -iC:/CCStudio_v3.3/c2400/cgtools/include towerlamp.c C:\Users\SIVARA~1\AppData\Local\Temp\towerlamp.if 
;	dspopt NOT RUN
;	dspcg -o -q -v2xx C:\Users\SIVARA~1\AppData\Local\Temp\towerlamp.if towerlamp.asm C:\Users\SIVARA~1\AppData\Local\Temp\towerlamp.tmp 
	.port
	.file	"towerlamp.c"
	.file	"regs240x.h"
	.globl	_portffff
	.globl	_portff0f
	.globl	_port0
	.globl	_port1
	.globl	_port2
	.globl	_port3
	.globl	_port4
	.file	"towerlamp.c"
	.text

	.sym	_TowerLampGreen_On,_TowerLampGreen_On,32,2,0
	.globl	_TowerLampGreen_On

	.func	3
******************************************************
* FUNCTION DEF : _TowerLampGreen_On
******************************************************
_TowerLampGreen_On:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28826
	LACK	8
	OR	* 
	SACL	* ,AR1
EPI0_1:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	6,000000000H,1

	.sym	_TowerLampGreen_Off,_TowerLampGreen_Off,32,2,0
	.globl	_TowerLampGreen_Off

	.func	7
******************************************************
* FUNCTION DEF : _TowerLampGreen_Off
******************************************************
_TowerLampGreen_Off:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28826
	LACK	65527
	AND	* 
	SACL	* ,AR1
EPI0_2:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	10,000000000H,1

	.sym	_TowerLampRed_On,_TowerLampRed_On,32,2,0
	.globl	_TowerLampRed_On

	.func	11
******************************************************
* FUNCTION DEF : _TowerLampRed_On
******************************************************
_TowerLampRed_On:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28822
	LACK	16
	OR	* 
	SACL	* ,AR1
EPI0_3:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	14,000000000H,1

	.sym	_TowerLampRed_Off,_TowerLampRed_Off,32,2,0
	.globl	_TowerLampRed_Off

	.func	15
******************************************************
* FUNCTION DEF : _TowerLampRed_Off
******************************************************
_TowerLampRed_Off:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28822
	LACK	65519
	AND	* 
	SACL	* ,AR1
EPI0_4:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	18,000000000H,1

	.sym	_TowerLampBrown_On,_TowerLampBrown_On,32,2,0
	.globl	_TowerLampBrown_On

	.func	20
******************************************************
* FUNCTION DEF : _TowerLampBrown_On
******************************************************
_TowerLampBrown_On:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28822
	LACK	64
	OR	* 
	SACL	* ,AR1
EPI0_5:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	23,000000000H,1

	.sym	_TowerLampBrown_Off,_TowerLampBrown_Off,32,2,0
	.globl	_TowerLampBrown_Off

	.func	25
******************************************************
* FUNCTION DEF : _TowerLampBrown_Off
******************************************************
_TowerLampBrown_Off:
	POPD	*+
	SAR	AR0,*+
	SAR	AR1,*
	LARK	AR0,1
	LAR	AR0,*0+,AR3

	.line	3
	LARK	AR3,28822
	LACK	65471
	AND	* 
	SACL	* ,AR1
EPI0_6:
	.line	4
	SBRK	2
	LAR	AR0,*-
	PSHD	*
	RET

	.endfunc	28,000000000H,1
	.end
