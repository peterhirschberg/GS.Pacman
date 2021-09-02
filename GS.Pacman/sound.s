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


INTRO_SOUND_ADDR     equ $0000
INTRO_OSC_NUM        equ 0
INTRO_FREQ_HIGH        equ 0
INTRO_FREQ_LOW        equ 40
INTRO_CONTROL        equ SOUND_ONE_SHOT_MODE
INTRO_SIZE            equ $2b

INTER_SOUND_ADDR     equ $2000
INTER_OSC_NUM        equ 0
INTER_FREQ_HIGH        equ 0
INTER_FREQ_LOW        equ 40
INTER_CONTROL        equ SOUND_ONE_SHOT_MODE
INTER_SIZE            equ $2b

SIREN1_SOUND_ADDR     equ $4000
SIREN1_OSC_NUM        equ 0
SIREN1_FREQ_HIGH        equ 0
SIREN1_FREQ_LOW        equ 40
SIREN1_CONTROL        equ SOUND_ONE_SHOT_MODE
SIREN1_SIZE            equ $2b

SIREN2_SOUND_ADDR     equ $6000
SIREN2_OSC_NUM        equ 0
SIREN2_FREQ_HIGH        equ 0
SIREN2_FREQ_LOW        equ 40
SIREN2_CONTROL        equ SOUND_ONE_SHOT_MODE
SIREN2_SIZE            equ $2b

EATDOT_SOUND_ADDR     equ $8000
EATDOT_OSC_NUM        equ 0
EATDOT_FREQ_HIGH        equ 0
EATDOT_FREQ_LOW        equ 40
EATDOT_CONTROL        equ SOUND_ONE_SHOT_MODE
EATDOT_SIZE            equ $2b

EXTRALIFE_SOUND_ADDR     equ $a000
EXTRALIFE_OSC_NUM        equ 0
EXTRALIFE_FREQ_HIGH        equ 0
EXTRALIFE_FREQ_LOW        equ 40
EXTRALIFE_CONTROL        equ SOUND_ONE_SHOT_MODE
EXTRALIFE_SIZE            equ $2b

FRUIT_SOUND_ADDR     equ $b000
FRUIT_OSC_NUM        equ 0
FRUIT_FREQ_HIGH        equ 0
FRUIT_FREQ_LOW        equ 40
FRUIT_CONTROL        equ SOUND_ONE_SHOT_MODE
FRUIT_SIZE            equ $2b

GHOSTSCARED_SOUND_ADDR     equ $c000
GHOSTSCARED_OSC_NUM        equ 0
GHOSTSCARED_FREQ_HIGH        equ 0
GHOSTSCARED_FREQ_LOW        equ 40
GHOSTSCARED_CONTROL        equ SOUND_ONE_SHOT_MODE
GHOSTSCARED_SIZE            equ $2b

EATGHOST_SOUND_ADDR     equ $d000
EATGHOST_OSC_NUM        equ 0
EATGHOST_FREQ_HIGH        equ 0
EATGHOST_FREQ_LOW        equ 40
EATGHOST_CONTROL        equ SOUND_ONE_SHOT_MODE
EATGHOST_SIZE            equ $2b

DEATH_SOUND_ADDR     equ $e000
DEATH_OSC_NUM        equ 0
DEATH_FREQ_HIGH        equ 0
DEATH_FREQ_LOW        equ 40
DEATH_CONTROL        equ SOUND_ONE_SHOT_MODE
DEATH_SIZE            equ $2b


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
		pea INTRO_SOUND_ADDR
		jsl loadIntroSound

        pea INTER_SOUND_ADDR
        jsl loadInterSound
        
        pea SIREN1_SOUND_ADDR
        jsl loadSiren1Sound
        
        pea SIREN2_SOUND_ADDR
        jsl loadSiren2Sound
        
        pea EATDOT_SOUND_ADDR
        jsl loadEatDotSound
        
        pea EATDOT_SOUND_ADDR
        jsl loadEatDotSound
        
        pea EXTRALIFE_SOUND_ADDR
        jsl loadExtraLifeSound
        
        pea FRUIT_SOUND_ADDR
        jsl loadFruitSound
        
        pea GHOSTSCARED_SOUND_ADDR
        jsl loadGhostScaredSound
        
        pea EATGHOST_SOUND_ADDR
        jsl loadEatGhostSound
        
        pea DEATH_SOUND_ADDR
        jsl loadDeathSound
        
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

        lda #17
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

; Intro

		dc i1'SOUND_REG_FREQ_LOW+INTRO_OSC_NUM',i1'INTRO_FREQ_LOW'
		dc i1'SOUND_REG_FREQ_LOW+INTRO_OSC_NUM+1',i1'INTRO_FREQ_LOW'
		dc i1'SOUND_REG_FREQ_HIGH+INTRO_OSC_NUM',i1'INTRO_FREQ_HIGH'
		dc i1'SOUND_REG_FREQ_HIGH+INTRO_OSC_NUM+1',i1'INTRO_FREQ_HIGH'
		dc i1'SOUND_REG_SIZE+INTRO_OSC_NUM',i1'INTRO_SIZE'
		dc i1'SOUND_REG_SIZE+INTRO_OSC_NUM+1',i1'INTRO_SIZE'
		dc i1'SOUND_REG_POINTER+INTRO_OSC_NUM',i1'INTRO_SOUND_ADDR/256'
		dc i1'SOUND_REG_POINTER+INTRO_OSC_NUM+1',i1'INTRO_SOUND_ADDR/256'
		dc i1'SOUND_REG_CONTROL+INTRO_OSC_NUM',i1'INTRO_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
		dc i1'SOUND_REG_CONTROL+INTRO_OSC_NUM+1',i1'INTRO_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'


; Intermission
        
        dc i1'SOUND_REG_FREQ_LOW+INTER_OSC_NUM',i1'INTER_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+INTER_OSC_NUM+1',i1'INTER_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+INTER_OSC_NUM',i1'INTER_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+INTER_OSC_NUM+1',i1'INTER_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+INTER_OSC_NUM',i1'INTER_SIZE'
        dc i1'SOUND_REG_SIZE+INTER_OSC_NUM+1',i1'INTER_SIZE'
        dc i1'SOUND_REG_POINTER+INTER_OSC_NUM',i1'INTER_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+INTER_OSC_NUM+1',i1'INTER_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+INTER_OSC_NUM',i1'INTER_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+INTER_OSC_NUM+1',i1'INTER_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'
        

; Siren1
        
        dc i1'SOUND_REG_FREQ_LOW+SIREN1_OSC_NUM',i1'SIREN1_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+SIREN1_OSC_NUM+1',i1'SIREN1_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+SIREN1_OSC_NUM',i1'SIREN1_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+SIREN1_OSC_NUM+1',i1'SIREN1_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+SIREN1_OSC_NUM',i1'SIREN1_SIZE'
        dc i1'SOUND_REG_SIZE+SIREN1_OSC_NUM+1',i1'SIREN1_SIZE'
        dc i1'SOUND_REG_POINTER+SIREN1_OSC_NUM',i1'SIREN1_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+SIREN1_OSC_NUM+1',i1'SIREN1_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+SIREN1_OSC_NUM',i1'SIREN1_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+SIREN1_OSC_NUM+1',i1'SIREN1_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'
        

; Siren2
        
        dc i1'SOUND_REG_FREQ_LOW+SIREN2_OSC_NUM',i1'SIREN2_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+SIREN2_OSC_NUM+1',i1'SIREN2_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+SIREN2_OSC_NUM',i1'SIREN2_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+SIREN2_OSC_NUM+1',i1'SIREN2_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+SIREN2_OSC_NUM',i1'SIREN2_SIZE'
        dc i1'SOUND_REG_SIZE+SIREN2_OSC_NUM+1',i1'SIREN2_SIZE'
        dc i1'SOUND_REG_POINTER+SIREN2_OSC_NUM',i1'SIREN2_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+SIREN2_OSC_NUM+1',i1'SIREN2_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+SIREN2_OSC_NUM',i1'SIREN2_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+SIREN2_OSC_NUM+1',i1'SIREN2_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'


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
        

; Extra life
        
        dc i1'SOUND_REG_FREQ_LOW+EXTRALIFE_OSC_NUM',i1'EXTRALIFE_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+EXTRALIFE_OSC_NUM+1',i1'EXTRALIFE_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+EXTRALIFE_OSC_NUM',i1'EXTRALIFE_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+EXTRALIFE_OSC_NUM+1',i1'EXTRALIFE_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+EXTRALIFE_OSC_NUM',i1'EXTRALIFE_SIZE'
        dc i1'SOUND_REG_SIZE+EXTRALIFE_OSC_NUM+1',i1'EXTRALIFE_SIZE'
        dc i1'SOUND_REG_POINTER+EXTRALIFE_OSC_NUM',i1'EXTRALIFE_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+EXTRALIFE_OSC_NUM+1',i1'EXTRALIFE_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+EXTRALIFE_OSC_NUM',i1'EXTRALIFE_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+EXTRALIFE_OSC_NUM+1',i1'EXTRALIFE_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'
        

; Fruit
        
        dc i1'SOUND_REG_FREQ_LOW+FRUIT_OSC_NUM',i1'FRUIT_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+FRUIT_OSC_NUM+1',i1'FRUIT_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+FRUIT_OSC_NUM',i1'FRUIT_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+FRUIT_OSC_NUM+1',i1'FRUIT_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+FRUIT_OSC_NUM',i1'FRUIT_SIZE'
        dc i1'SOUND_REG_SIZE+FRUIT_OSC_NUM+1',i1'FRUIT_SIZE'
        dc i1'SOUND_REG_POINTER+FRUIT_OSC_NUM',i1'FRUIT_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+FRUIT_OSC_NUM+1',i1'FRUIT_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+FRUIT_OSC_NUM',i1'FRUIT_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+FRUIT_OSC_NUM+1',i1'FRUIT_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'
        

; Ghost scared
        
        dc i1'SOUND_REG_FREQ_LOW+GHOSTSCARED_OSC_NUM',i1'GHOSTSCARED_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+GHOSTSCARED_OSC_NUM+1',i1'GHOSTSCARED_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+GHOSTSCARED_OSC_NUM',i1'GHOSTSCARED_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+GHOSTSCARED_OSC_NUM+1',i1'GHOSTSCARED_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+GHOSTSCARED_OSC_NUM',i1'GHOSTSCARED_SIZE'
        dc i1'SOUND_REG_SIZE+GHOSTSCARED_OSC_NUM+1',i1'GHOSTSCARED_SIZE'
        dc i1'SOUND_REG_POINTER+GHOSTSCARED_OSC_NUM',i1'GHOSTSCARED_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+GHOSTSCARED_OSC_NUM+1',i1'GHOSTSCARED_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM',i1'GHOSTSCARED_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+1',i1'GHOSTSCARED_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'
        

; Eat ghost
        
        dc i1'SOUND_REG_FREQ_LOW+EATGHOST_OSC_NUM',i1'EATGHOST_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+EATGHOST_OSC_NUM+1',i1'EATGHOST_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+EATGHOST_OSC_NUM',i1'EATGHOST_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+EATGHOST_OSC_NUM+1',i1'EATGHOST_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+EATGHOST_OSC_NUM',i1'EATGHOST_SIZE'
        dc i1'SOUND_REG_SIZE+EATGHOST_OSC_NUM+1',i1'EATGHOST_SIZE'
        dc i1'SOUND_REG_POINTER+EATGHOST_OSC_NUM',i1'EATGHOST_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+EATGHOST_OSC_NUM+1',i1'EATGHOST_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+EATGHOST_OSC_NUM',i1'EATGHOST_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+EATGHOST_OSC_NUM+1',i1'EATGHOST_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'
        

; Death
        
        dc i1'SOUND_REG_FREQ_LOW+DEATH_OSC_NUM',i1'DEATH_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_LOW+DEATH_OSC_NUM+1',i1'DEATH_FREQ_LOW'
        dc i1'SOUND_REG_FREQ_HIGH+DEATH_OSC_NUM',i1'DEATH_FREQ_HIGH'
        dc i1'SOUND_REG_FREQ_HIGH+DEATH_OSC_NUM+1',i1'DEATH_FREQ_HIGH'
        dc i1'SOUND_REG_SIZE+DEATH_OSC_NUM',i1'DEATH_SIZE'
        dc i1'SOUND_REG_SIZE+DEATH_OSC_NUM+1',i1'DEATH_SIZE'
        dc i1'SOUND_REG_POINTER+DEATH_OSC_NUM',i1'DEATH_SOUND_ADDR/256'
        dc i1'SOUND_REG_POINTER+DEATH_OSC_NUM+1',i1'DEATH_SOUND_ADDR/256'
        dc i1'SOUND_REG_CONTROL+DEATH_OSC_NUM',i1'DEATH_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER'
        dc i1'SOUND_REG_CONTROL+DEATH_OSC_NUM+1',i1'DEATH_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER'
        


soundRegDefaultsEnd anop


eatDotTimer dc i2'0'

        end
