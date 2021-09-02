;
;  sound.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/1/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;
; ********************************************
; Almost all this code/structure is pulled from Jeremy Rand's "BuGS" game
; Github: https://github.com/jeremysrand/BuGS
; ********************************************
;
;  Created by Jeremy Rand on 2020-12-16.
;  Copyright © 2020 Jeremy Rand. All rights reserved.
;


        case on
        mcopy global.macros
        keep global

sound start
        using globalData

SOUND_REG_FREQ_LOW    equ $0000
SOUND_REG_FREQ_HIGH    equ $0020
SOUND_REG_VOLUME    equ $0040
SOUND_REG_POINTER    equ $0080
SOUND_REG_CONTROL    equ $00a0
SOUND_REG_SIZE        equ $00c0

SOUND_HALTED        equ 1
SOUND_STARTED        equ 0

SOUND_ONE_SHOT_MODE    equ 2
SOUND_SWAP_MODE equ 6

SOUND_RIGHT_SPEAKER    equ $10
SOUND_LEFT_SPEAKER    equ $00

SOUND_CONTROL_REG        equ $e1c03c
SOUND_DATA_REG            equ $e1c03d
SOUND_ADDR_LOW            equ $e1c03e
SOUND_ADDR_HIGH         equ $e1c03f
SOUND_SYSTEM_VOLUME        equ $e100ca


EATDOT_SOUND_ADDR     equ $0000
EATDOT_OSC_NUM        equ 0
EATDOT_FREQ_HIGH        equ 0
EATDOT_FREQ_LOW        equ 40
EATDOT_CONTROL        equ SOUND_ONE_SHOT_MODE
EATDOT_SIZE            equ $2b


; Y has the register to write to (16 bit mode)
; A has the value to write (8 bit mode)
; Assuming not in increment mode
writeReg entry
		sta registerValue
writeReg_loop anop
		tya
		sta >SOUND_ADDR_LOW
		_docWait
		lda registerValue
		sta >SOUND_DATA_REG
		tya
		sta >SOUND_ADDR_LOW
		_docWait
		lda >SOUND_DATA_REG
		lda >SOUND_DATA_REG
		cmp registerValue
		bne writeReg_loop
		rts


; Y has the register to write to (16 bit mode)
; A has the value to write (8 bit mode)
; Assuming not in increment mode
writeRegNoRead entry
		sta registerValue
		tya
		sta >SOUND_ADDR_LOW
		_docWait
		lda registerValue
		sta >SOUND_DATA_REG
		rts
        
       
runSound entry

        lda eatDotTimer
        bmi eatDotTimerNeg
        dec eatDotTimer

eatDotTimerNeg anop

        rts
        

soundInit entry
		pea EATDOT_SOUND_ADDR
		jsl loadEatDotSound

; Set registers
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		ldx #soundRegDefaults
soundInit_loop anop
		lda |$0,x
		tay
		lda |$1,x
		jsr writeRegNoRead
		inx
		inx
		cpx #soundRegDefaultsEnd
		blt soundInit_loop
        long m

		rts

playEatDotSound entry

        lda eatDotTimer
        bmi doPlayEatDotSound
        rts
        
doPlayEatDotSound anop

        lda #16
        sta eatDotTimer

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+EATDOT_OSC_NUM,#EATDOT_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EATDOT_OSC_NUM+1,#EATDOT_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+EATDOT_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+EATDOT_OSC_NUM,#EATDOT_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EATDOT_OSC_NUM+1,#EATDOT_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts




registerValue dc i2'0'

soundRegDefaults anop

; Eat dot

		dc i1'SOUND_REG_FREQ_LOW+EATDOT_OSC_NUM',i1'EATDOT_FREQ_LOW'
		dc i1'SOUND_REG_FREQ_LOW+EATDOT_OSC_NUM+1',i1'EATDOT_FREQ_LOW'
		dc i1'SOUND_REG_FREQ_HIGH+EATDOT_OSC_NUM',i1'EATDOT_FREQ_HIGH'
		dc i1'SOUND_REG_FREQ_HIGH+EATDOT_OSC_NUM+1',i1'EATDOT_FREQ_HIGH'
		dc i1'SOUND_REG_SIZE+EATDOT_OSC_NUM',i1'EATDOT_SIZE'
		dc i1'SOUND_REG_SIZE+EATDOT_OSC_NUM+1',i1'EATDOT_SIZE'
		dc i1'SOUND_REG_POINTER+EATDOT_OSC_NUM',i1'EATDOT_SOUND_ADDR/256'
		dc i1'SOUND_REG_POINTER+EATDOT_OSC_NUM+1',i1'EATDOT_SOUND_ADDR/256'
		dc i1'SOUND_REG_CONTROL+EATDOT_OSC_NUM',i1'EATDOT_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
		dc i1'SOUND_REG_CONTROL+EATDOT_OSC_NUM+1',i1'EATDOT_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'


soundRegDefaultsEnd anop


eatDotTimer dc i2'0'

        end
