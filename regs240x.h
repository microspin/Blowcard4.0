/* ==================================================================================
File name:        regs240x.h                     
                    
Originator:	Digital Control Systems Group
			Texas Instruments

Description:   F240x register definitions.
=====================================================================================
 History:
-------------------------------------------------------------------------------------
 9-15-2000	Release	Rev 1.0                                                  
---------------------------------------------------------------------------------- */

#ifndef __REGS240X_H__
#define __REGS240X_H__



#define IMR                *((volatile int *)0x0004)    /*   Interrupt Mask Register             */
#define IFR                *((volatile int *)0x0006)    /*   Interrupt Flag Register             */
#define SCSR1              *((volatile int *)0x7018)    /*   System Control &  Status Reg. 1     */
#define SCSR2              *((volatile int *)0x7019)    /*   System Control &  Status Reg. 2     */
#define DINR               *((volatile int *)0x701C)    /*   Device Identification Register.     */
#define PIVR               *((volatile int *)0x701E)    /*   Peripheral Interrupt Vector Reg.    */
#define PIRQR0             *((volatile int *)0x7010)    /*   Periph Interrupt Request Reg 0.     */
#define PIRQR1             *((volatile int *)0x7011)    /*   Periph Interrupt Request Reg 1.     */
#define PIRQR2             *((volatile int *)0x7012)    /*   Periph Interrupt Request Reg 2.     */
#define PIACKR0            *((volatile int *)0x7014)    /*   Periph Interrupt Acknowledge Reg 0. */
#define PIACKR1            *((volatile int *)0x7015)    /*   Periph Interrupt Acknowledge Reg 1. */
#define PIACKR2            *((volatile int *)0x7016)    /*   Periph Interrupt Acknowledge Reg 2. */
#define XINT1CR            *((volatile int *)0x7070)    /*   Ext. interrupt 1 config reg for X241*/
#define XINT2CR            *((volatile int *)0x7071)    /*   External interrupt 2 config. X241/2/*/
#define MCRA               *((volatile int *)0x7090)    /*   Output Control Reg A                */
#define OCRA               *((volatile int *)0x7090)    /*   Output Control Reg A                */
#define MCRB               *((volatile int *)0x7092)    /*   Output Control Reg B                */
#define OCRB               *((volatile int *)0x7092)    /*   Output Control Reg B                */
#define MCRC               *((volatile int *)0x7094)    /*   Output Control Reg C                */
#define ISRA               *((volatile int *)0x7094)    /*   Input Status Reg A x240x only       */
#define ISRB               *((volatile int *)0x7096)    /*   Input Status Reg B x240x only       */
#define PADATDIR           *((volatile int *)0x7098)    /*   I/O port A Data & Direction reg.    */
#define PBDATDIR           *((volatile int *)0x709A)    /*   I/O port B Data & Direction reg.    */
#define PCDATDIR           *((volatile int *)0x709C)    /*   I/O port C Data & Direction reg.    */
#define PDDATDIR           *((volatile int *)0x709E)    /*   I/O port D Data & Direction reg.    */
#define PEDATDIR           *((volatile int *)0x7095)    /*   I/O port E Data & Direction reg.    */
#define PFDATDIR           *((volatile int *)0x7096)    /*   I/O port F Data & Direction reg.    */
#define WDCNTR             *((volatile int *)0x7023)    /*   WD Counter reg                      */
#define WDKEY              *((volatile int *)0x7025)    /*   WD Key reg                          */
#define WDCR               *((volatile int *)0x7029)    /*   WD Control reg                      */
#define ADCTRL1            *((volatile int *)0x70A0)    /*   ADC Control Reg1                    */
#define ADCTRL2            *((volatile int *)0x70A1)    /*   ADC Control Reg2                    */
#define MAXCONV            *((volatile int *)0x70A2)    /*   Maximum conversion channels register*/
#define CHSELSEQ1          *((volatile int *)0x70A3)    /*   Channel select Sequencing control re*/
#define CHSELSEQ2          *((volatile int *)0x70A4)    /*   Channel select Sequencing control re*/
#define CHSELSEQ3          *((volatile int *)0x70A5)    /*   Channel select Sequencing control re*/
#define CHSELSEQ4          *((volatile int *)0x70A6)    /*   Channel select Sequencing control re*/
#define AUTO_SEQ_SR        *((volatile int *)0x70A7)    /*   Auto-sequence status register       */
#define RESULT0            *((volatile int *)0x70A8)    /*   Conversion result buffer register 0 */
#define RESULT1            *((volatile int *)0x70A9)    /*   Conversion result buffer register 1 */
#define RESULT2            *((volatile int *)0x70AA)    /*   Conversion result buffer register 2 */
#define RESULT3            *((volatile int *)0x70AB)    /*   Conversion result buffer register 3 */
#define RESULT4            *((volatile int *)0x70AC)    /*   Conversion result buffer register 4 */
#define RESULT5            *((volatile int *)0x70AD)    /*   Conversion result buffer register 5 */
#define RESULT6            *((volatile int *)0x70AE)    /*   Conversion result buffer register 6 */
#define RESULT7            *((volatile int *)0x70AF)    /*   Conversion result buffer register 7 */
#define RESULT8            *((volatile int *)0x70B0)    /*   Conversion result buffer register 8 */
#define RESULT9            *((volatile int *)0x70B1)    /*   Conversion result buffer register 9 */
#define RESULT10           *((volatile int *)0x70B2)    /*   Conversion result buffer register 10*/
#define RESULT11           *((volatile int *)0x70B3)    /*   Conversion result buffer register 11*/
#define RESULT12           *((volatile int *)0x70B4)    /*   Conversion result buffer register 12*/
#define RESULT13           *((volatile int *)0x70B5)    /*   Conversion result buffer register 13*/
#define RESULT14           *((volatile int *)0x70B6)    /*   Conversion result buffer register 14*/
#define RESULT15           *((volatile int *)0x70B7)    /*   Conversion result buffer register 15*/
#define CALIBRATION        *((volatile int *)0x70B8)    /*   Calib result, used to correct subseq*/
#define SPICCR             *((volatile int *)0x7040)    /*   SPI Config Control Reg              */
#define SPICTL             *((volatile int *)0x7041)    /*   SPI Operation Control Reg           */
#define SPISTS             *((volatile int *)0x7042)    /*   SPI Status Reg                      */
#define SPIBRR             *((volatile int *)0x7044)    /*   SPI Baud rate control reg           */
#define SPIRXEMU           *((volatile int *)0x7046)    /*   SPI Emulation buffer reg            */
#define SPIRXBUF           *((volatile int *)0x7047)    /*   SPI Serial receive buffer reg       */
#define SPITXBUF           *((volatile int *)0x7048)    /*   SPI Serial transmit buffer reg      */
#define SPIDAT             *((volatile int *)0x7049)    /*   SPI Serial data reg                 */
#define SPIPRI             *((volatile int *)0x704F)    /*   SPI Priority control reg            */
#define SCICCR             *((volatile int *)0x7050)    /*   SCI Communication control reg       */
#define SCICTL1            *((volatile int *)0x7051)    /*   SCI Control reg1                    */
#define SCIHBAUD           *((volatile int *)0x7052)    /*   SCI Baud Rate MSbyte reg            */
#define SCILBAUD           *((volatile int *)0x7053)    /*   SCI Baud Rate LSbyte reg            */
#define SCICTL2            *((volatile int *)0x7054)    /*   SCI Control reg2                    */
#define SCIRXST            *((volatile int *)0x7055)    /*   SCI Receiver Status reg             */
#define SCIRXEMU           *((volatile int *)0x7056)    /*   SCI Emulation Data Buffer reg       */
#define SCIRXBUF           *((volatile int *)0x7057)    /*   SCI Receiver Data buffer reg        */
#define SCITXBUF           *((volatile int *)0x7059)    /*   SCI Transmit Data buffer reg        */
#define SCIPRI             *((volatile int *)0x705F)    /*   SCI Priority control reg            */
#define GPTCONA            *((volatile int *)0x7400)    /*   GP Timer control register A .       */
#define T1CNT              *((volatile int *)0x7401)    /*   GP Timer 1 counter register.        */
#define T1CMPR             *((volatile int *)0x7402)    /*   GP Timer 1 compare register.        */
#define T1PR               *((volatile int *)0x7403)    /*   GP Timer 1 period register.         */
#define T1PER              *((volatile int *)0x7403)    /*   GP Timer 1 period register.         */
#define T1CON              *((volatile int *)0x7404)    /*   GP Timer 1 control register.        */
#define T2CNT              *((volatile int *)0x7405)    /*   GP Timer 2 counter register.        */
#define T2CMPR             *((volatile int *)0x7406)    /*   GP Timer 2 compare register.        */
#define T2PR               *((volatile int *)0x7407)    /*   GP Timer 2 period register.         */
#define T2PER              *((volatile int *)0x7407)    /*   GP Timer 2 period register.         */
#define T2CON              *((volatile int *)0x7408)    /*   GP Timer 2 control register.        */
#define COMCONA            *((volatile int *)0x7411)    /*   Compare control register A.         */
#define ACTRA              *((volatile int *)0x7413)    /*   Full compare action control register*/
#define DBTCONA            *((volatile int *)0x7415)    /*   Dead-band timer control register A. */
#define CMPR1              *((volatile int *)0x7417)    /*   Full compare unit compare register1 */
#define CMPR2              *((volatile int *)0x7418)    /*   Full compare unit compare register2 */
#define CMPR3              *((volatile int *)0x7419)    /*   Full compare unit compare register3 */
#define CAPCONA            *((volatile int *)0x7420)    /*   Capture control register A.         */
#define CAPFIFOA           *((volatile int *)0x7422)    /*   Capture FIFO status register A.     */
#define CAP1FIFO           *((volatile int *)0x7423)    /*   Capture Channel 1 FIFO Top          */
#define CAP2FIFO           *((volatile int *)0x7424)    /*   Capture Channel 2 FIFO Top          */
#define CAP3FIFO           *((volatile int *)0x7425)    /*   Capture Channel 3 FIFO Top          */
#define CAP1FBOT           *((volatile int *)0x7427)    /*   Bottom reg. pf capture FIFO stack 1 */
#define CAP2FBOT           *((volatile int *)0x7427)    /*   Bottom reg. pf capture FIFO stack 2 */
#define CAP3FBOT           *((volatile int *)0x7427)    /*   Bottom reg. pf capture FIFO stack 3 */
#define EVAIMRA            *((volatile int *)0x742C)    /*   Group A Interrupt Mask Register A   */
#define EVAIMRB            *((volatile int *)0x742D)    /*   Group B Interrupt Mask Register A   */
#define EVAIMRC            *((volatile int *)0x742E)    /*   Group C Interrupt Mask Register A   */
#define EVAIFRA            *((volatile int *)0x742F)    /*   Group A Interrupt Flag Register A   */
#define EVAIFRB            *((volatile int *)0x7430)    /*   Group B Interrupt Flag Register A   */
#define EVAIFRC            *((volatile int *)0x7431)    /*   Group C Interrupt Flag Register A   */
#define GPTCONB            *((volatile int *)0x7500)    /*   GP Timer control register B .       */
#define T3CNT              *((volatile int *)0x7501)    /*   GP Timer 3 counter register.        */
#define T3CMPR             *((volatile int *)0x7502)    /*   GP Timer 3 compare register.        */
#define T3PR               *((volatile int *)0x7503)    /*   GP Timer 3 period register.         */
#define T3PER              *((volatile int *)0x7503)    /*   GP Timer 3 period register.         */
#define T3CON              *((volatile int *)0x7504)    /*   GP Timer 3 control register.        */
#define T4CNT              *((volatile int *)0x7505)    /*   GP Timer 4 counter register.        */
#define T4CMPR             *((volatile int *)0x7506)    /*   GP Timer 4 compare register.        */
#define T4PR               *((volatile int *)0x7507)    /*   GP Timer 4 period register.         */
#define T4PER              *((volatile int *)0x7507)    /*   GP Timer 4 period register.         */
#define T4CON              *((volatile int *)0x7508)    /*   GP Timer 4 control register.        */
#define COMCONB            *((volatile int *)0x7511)    /*   Compare control register B.         */
#define ACTRB              *((volatile int *)0x7513)    /*   Full compare action control register*/
#define DBTCONB            *((volatile int *)0x7515)    /*   Dead-band timer control register B. */
#define CMPR4              *((volatile int *)0x7517)    /*   Full compare unit compare register1 */
#define CMPR5              *((volatile int *)0x7518)    /*   Full compare unit compare register2 */
#define CMPR6              *((volatile int *)0x7519)    /*   Full compare unit compare register3 */
#define CAPCONB            *((volatile int *)0x7520)    /*   Capture control register B.         */
#define CAPFIFOB           *((volatile int *)0x7522)    /*   Capture FIFO status register B.     */
#define CAP4FIFO           *((volatile int *)0x7523)    /*   Capture Channel 1 FIFO Top B        */
#define CAP5FIFO           *((volatile int *)0x7524)    /*   Capture Channel 2 FIFO Top B        */
#define CAP6FIFO           *((volatile int *)0x7525)    /*   Capture Channel 3 FIFO Top B        */
#define CAP4FBOT           *((volatile int *)0x7527)    /*   Bottom reg. pf capture FIFO stack 1 */
#define CAP5FBOT           *((volatile int *)0x7527)    /*   Bottom reg. pf capture FIFO stack 2 */
#define CAP6FBOT           *((volatile int *)0x7527)    /*   Bottom reg. pf capture FIFO stack 3 */
#define EVBIMRA            *((volatile int *)0x752C)    /*   Group A Interrupt Mask Register B   */
#define EVBIMRB            *((volatile int *)0x752D)    /*   Group B Interrupt Mask Register B   */
#define EVBIMRC            *((volatile int *)0x752E)    /*   Group C Interrupt Mask Register B   */
#define EVBIFRA            *((volatile int *)0x752F)    /*   Group A Interrupt Flag Register B   */
#define EVBIFRB            *((volatile int *)0x7530)    /*   Group B Interrupt Flag Register B   */
#define EVBIFRC            *((volatile int *)0x7531)    /*   Group C Interrupt Flag Register B   */
#define CANMDER            *((volatile int *)0x7100)    /*   CAN Mailbox Direction/Enable reg    */
#define CANTCR             *((volatile int *)0x7101)    /*   CAN Transmission Control Reg        */
#define CANRCR             *((volatile int *)0x7102)    /*   CAN Recieve COntrol Reg             */
#define CANMCR             *((volatile int *)0x7103)    /*   CAN Master Control Reg              */
#define CANBCR2            *((volatile int *)0x7104)    /*   CAN Bit COnfig Reg 2                */
#define CANBCR1            *((volatile int *)0x7105)    /*   CAN Bit Config Reg 1                */
#define CANESR             *((volatile int *)0x7106)    /*   CAN Error Status Reg                */
#define CANGSR             *((volatile int *)0x7107)    /*   CAN Global Status Reg               */
#define CANCEC             *((volatile int *)0x7108)    /*   CAN Trans and Rcv Err counters      */
#define CANIFR             *((volatile int *)0x7109)    /*   CAN Interrupt Flag Registers        */
#define CANIMR             *((volatile int *)0x710a)    /*   CAN Interrupt Mask Registers        */
#define CANLAM0H           *((volatile int *)0x710b)    /*   CAN Local Acceptance Mask MBx0/1    */
#define CANLAM0L           *((volatile int *)0x710c)    /*   CAN Local Acceptance Mask MBx0/1    */
#define CANLAM1H           *((volatile int *)0x710d)    /*   CAN Local Acceptance Mask MBx2/3    */
#define CANLAM1L           *((volatile int *)0x710e)    /*   CAN Local Acceptance Mask MBx2/3    */
#define CANMSGID0L         *((volatile int *)0x7200)    /*   CAN Message ID for mailbox 0 (lower */
#define CANMSGID0H         *((volatile int *)0x7201)    /*   CAN Message ID for mailbox 0 (upper */
#define CANMSGCTRL0        *((volatile int *)0x7202)    /*   CAN RTR and DLC                     */
#define CANMBX0A           *((volatile int *)0x7204)    /*   CAN 2 of 8 bytes of Mailbox 0       */
#define CANMBX0B           *((volatile int *)0x7205)    /*   CAN 2 of 8 bytes of Mailbox 0       */
#define CANMBX0C           *((volatile int *)0x7206)    /*   CAN 2 of 8 bytes of Mailbox 0       */
#define CANMBX0D           *((volatile int *)0x7207)    /*   CAN 2 of 8 bytes of Mailbox 0       */
#define CANMSGID1L         *((volatile int *)0x7208)    /*   CAN Message ID for mailbox 1 (lower */
#define CANMSGID1H         *((volatile int *)0x7209)    /*   CAN Message ID for mailbox 1 (upper */
#define CANMSGCTRL1        *((volatile int *)0x720A)    /*   CAN RTR and DLC                     */
#define CANMBX1A           *((volatile int *)0x720C)    /*   CAN 2 of 8 bytes of Mailbox 1       */
#define CANMBX1B           *((volatile int *)0x720D)    /*   CAN 2 of 8 bytes of Mailbox 1       */
#define CANMBX1C           *((volatile int *)0x720E)    /*   CAN 2 of 8 bytes of Mailbox 1       */
#define CANMBX1D           *((volatile int *)0x720F)    /*   CAN 2 of 8 bytes of Mailbox 1       */
#define CANMSGID2L         *((volatile int *)0x7210)    /*   CAN Message ID for mailbox 2 (lower */
#define CANMSGID2H         *((volatile int *)0x7211)    /*   CAN Message ID for mailbox 2 (upper */
#define CANMSGCTRL2        *((volatile int *)0x7212)    /*   CAN RTR and DLC                     */
#define CANMBX2A           *((volatile int *)0x7214)    /*   CAN 2 of 8 bytes of Mailbox 2       */
#define CANMBX2B           *((volatile int *)0x7215)    /*   CAN 2 of 8 bytes of Mailbox 2       */
#define CANMBX2C           *((volatile int *)0x7216)    /*   CAN 2 of 8 bytes of Mailbox 2       */
#define CANMBX2D           *((volatile int *)0x7217)    /*   CAN 2 of 8 bytes of Mailbox 2       */
#define CANMSGID3L         *((volatile int *)0x7218)    /*   CAN Message ID for mailbox 3 (lower */
#define CANMSGID3H         *((volatile int *)0x7219)    /*   CAN Message ID for mailbox 3 (upper */
#define CANMSGCTRL3        *((volatile int *)0x721A)    /*   CAN RTR and DLC                     */
#define CANMBX3A           *((volatile int *)0x721C)    /*   CAN 2 of 8 bytes of Mailbox 3       */
#define CANMBX3B           *((volatile int *)0x721D)    /*   CAN 2 of 8 bytes of Mailbox 3       */
#define CANMBX3C           *((volatile int *)0x721E)    /*   CAN 2 of 8 bytes of Mailbox 3       */
#define CANMBX3D           *((volatile int *)0x721F)    /*   CAN 2 of 8 bytes of Mailbox 3       */
#define CANMSGID4L         *((volatile int *)0x7220)    /*   CAN Message ID for mailbox 4 (lower */
#define CANMSGID4H         *((volatile int *)0x7221)    /*   CAN Message ID for mailbox 4 (upper */
#define CANMSGCTRL4        *((volatile int *)0x7222)    /*   CAN RTR and DLC                     */
#define CANMBX4A           *((volatile int *)0x7224)    /*   CAN 2 of 8 bytes of Mailbox 4       */
#define CANMBX4B           *((volatile int *)0x7225)    /*   CAN 2 of 8 bytes of Mailbox 4       */
#define CANMBX4C           *((volatile int *)0x7226)    /*   CAN 2 of 8 bytes of Mailbox 4       */
#define CANMBX4D           *((volatile int *)0x7227)    /*   CAN 2 of 8 bytes of Mailbox 4       */
#define CANMSGID5L         *((volatile int *)0x7228)    /*   CAN Message ID for mailbox 5 (lower */
#define CANMSGID5H         *((volatile int *)0x7229)    /*   CAN Message ID for mailbox 5 (upper */
#define CANMSGCTRL5        *((volatile int *)0x722A)    /*   CAN RTR and DLC                     */
#define CANMBX5A           *((volatile int *)0x722C)    /*   CAN 2 of 8 bytes of Mailbox 5       */
#define CANMBX5B           *((volatile int *)0x722D)    /*   CAN 2 of 8 bytes of Mailbox 5       */
#define CANMBX5C           *((volatile int *)0x722E)    /*   CAN 2 of 8 bytes of Mailbox 5       */
#define CANMBX5D           *((volatile int *)0x722F)    /*   CAN 2 of 8 bytes of Mailbox 5       */
/*--------------------------------------------------------------------------*/
/* I/O space mapped registers						    */
/*--------------------------------------------------------------------------*/
#define WSGR	portffff	
ioport unsigned portffff;       /* Wait-State Generator Control Reg */

#define FCMR	portff0f	/* Flash mode control register */
ioport unsigned portff0f;
ioport unsigned port0;
ioport unsigned port1;
ioport unsigned port2;
ioport unsigned port3;
ioport unsigned port4;  

#define DAC0	port0
#define DAC1	port1
#define DAC2	port2
#define DAC3	port3
#define DACL	port4

#endif /*__REGS240X_H__  */

