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
        using mazeExchangeData
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
INTRO_FREQ_LOW        equ 9
INTRO_CONTROL        equ SOUND_ONE_SHOT_MODE
INTRO_SIZE            equ $3b

INTER_SOUND_ADDR     equ $0000
INTER_OSC_NUM        equ 0
INTER_FREQ_HIGH        equ 0
INTER_FREQ_LOW        equ 9
INTER_CONTROL        equ SOUND_ONE_SHOT_MODE
INTER_SIZE            equ $3b

SIREN1_SOUND_ADDR     equ $0000
SIREN1_OSC_NUM        equ 2
SIREN1_FREQ_HIGH        equ 0
SIREN1_FREQ_LOW        equ 40
SIREN1_CONTROL        equ SOUND_SWAP_MODE
SIREN1_SIZE            equ $2b

SIREN2_SOUND_ADDR     equ $2000
SIREN2_OSC_NUM        equ 6
SIREN2_FREQ_HIGH        equ 0
SIREN2_FREQ_LOW        equ 50
SIREN2_CONTROL        equ SOUND_SWAP_MODE
SIREN2_SIZE            equ $2b

EATDOT_SOUND_ADDR     equ $4000
EATDOT_OSC_NUM        equ 10
EATDOT_FREQ_HIGH        equ 0
EATDOT_FREQ_LOW        equ 70
EATDOT_CONTROL        equ SOUND_ONE_SHOT_MODE
EATDOT_SIZE            equ $2b

EXTRALIFE_SOUND_ADDR     equ $6000
EXTRALIFE_OSC_NUM        equ 12
EXTRALIFE_FREQ_HIGH        equ 0
EXTRALIFE_FREQ_LOW        equ 40
EXTRALIFE_CONTROL        equ SOUND_ONE_SHOT_MODE
EXTRALIFE_SIZE            equ $2b

FRUIT_SOUND_ADDR     equ $8000
FRUIT_OSC_NUM        equ 14
FRUIT_FREQ_HIGH        equ 0
FRUIT_FREQ_LOW        equ 40
FRUIT_CONTROL        equ SOUND_ONE_SHOT_MODE
FRUIT_SIZE            equ $2b

GHOSTSCARED_SOUND_ADDR     equ $a000
GHOSTSCARED_OSC_NUM        equ 16
GHOSTSCARED_FREQ_HIGH        equ 0
GHOSTSCARED_FREQ_LOW        equ 50
GHOSTSCARED_CONTROL        equ SOUND_SWAP_MODE
GHOSTSCARED_SIZE            equ $2b

EATGHOST_SOUND_ADDR     equ $c000
EATGHOST_OSC_NUM        equ 20
EATGHOST_FREQ_HIGH        equ 0
EATGHOST_FREQ_LOW        equ 40
EATGHOST_CONTROL        equ SOUND_ONE_SHOT_MODE
EATGHOST_SIZE            equ $2b

DEATH_SOUND_ADDR     equ $0000
DEATH_OSC_NUM        equ 22
DEATH_FREQ_HIGH        equ 0
DEATH_FREQ_LOW        equ 12
DEATH_CONTROL        equ SOUND_ONE_SHOT_MODE
DEATH_SIZE            equ $3b


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

        jsr updateSounds

        lda eatDotTimer
        bmi eatDotTimerNeg
        dec eatDotTimer

eatDotTimerNeg anop

        lda lifeTimer
        bmi lifeTimerNeg
        dec lifeTimer

lifeTimerNeg anop

        lda extraLifeSoundTimer
        bmi runSoundDone
        dec extraLifeSoundTimer
        jsr playExtraLifeSound
        
runSoundDone anop

        rts
        

soundInitMusic1 entry
		pea INTRO_SOUND_ADDR
		jsl loadIntroSound

; Set registers
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		ldx #soundRegDefaultsIntro
soundInitMusic1_loop anop
		lda |$0,x
		tay
		lda |$1,x
		jsr writeRegNoRead
		inx
		inx
		cpx #soundRegDefaultsEndIntro
		blt soundInitMusic1_loop
        long m

		rts

soundInitMusic2 entry
        pea INTER_SOUND_ADDR
        jsl loadInterSound

; Set registers
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		ldx #soundRegDefaultsInter
soundInitMusic2_loop anop
		lda |$0,x
		tay
		lda |$1,x
		jsr writeRegNoRead
		inx
		inx
		cpx #soundRegDefaultsEndInter
		blt soundInitMusic2_loop
        long m

		rts

soundInitGameSounds entry
 
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

; Set registers
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		ldx #soundRegDefaultsGame
soundInitGameSounds_loop anop
		lda |$0,x
		tay
		lda |$1,x
		jsr writeRegNoRead
		inx
		inx
		cpx #soundRegDefaultsEndGame
		blt soundInitGameSounds_loop
        long m

		rts

soundInitDeathSound entry

        pea DEATH_SOUND_ADDR
        jsl loadDeathSound

; Set registers
        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		ldx #soundRegDefaultsDeath
soundInitDeathSound_loop anop
		lda |$0,x
		tay
		lda |$1,x
		jsr writeRegNoRead
		inx
		inx
		cpx #soundRegDefaultsEndDeath
		blt soundInitDeathSound_loop
        long m

		rts

; MUSIC

playIntroSound entry

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+INTRO_OSC_NUM,#INTRO_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+INTRO_OSC_NUM+1,#INTRO_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+INTRO_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+INTRO_OSC_NUM,#INTRO_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+INTRO_OSC_NUM+1,#INTRO_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts

playInterSound entry

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+INTER_OSC_NUM,#INTER_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+INTER_OSC_NUM+1,#INTER_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+INTER_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+INTER_OSC_NUM,#INTER_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+INTER_OSC_NUM+1,#INTER_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts

; GAME SOUNDS
        
playEatDotSound entry

        lda eatDotTimer
        bmi doPlayEatDotSound
        rts
        
doPlayEatDotSound anop

        lda #12
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

startSiren1Sound entry

        lda siren1SoundPlaying
        cmp #1
        beq siren1SoundAlreadyPlaying
        bra doStartSiren1Sound

siren1SoundAlreadyPlaying anop
        rts

doStartSiren1Sound anop

        lda #1
        sta siren1SoundPlaying

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM,#SIREN1_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+1,#SIREN1_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+2,#SIREN1_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+3,#SIREN1_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+SIREN1_OSC_NUM
        lda #$fff
        jsr writeReg
        iny
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg

		_writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM,#SIREN1_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+1,#SIREN1_CONTROL+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+2,#SIREN1_CONTROL+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+3,#SIREN1_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts

stopSiren1Sound entry

        lda siren1SoundPlaying
        cmp #0
        beq siren1SoundNotPlaying
        bra doStopSiren1Sound

siren1SoundNotPlaying anop
        rts

doStopSiren1Sound anop
  
        lda #0
        sta siren1SoundPlaying

        short m
        _docWait
        lda >SOUND_SYSTEM_VOLUME
        and #$0f
        sta >SOUND_CONTROL_REG

        _writeReg #SOUND_REG_VOLUME+SIREN1_OSC_NUM,#0
        _writeReg #SOUND_REG_VOLUME+SIREN1_OSC_NUM+1,#0
        _writeReg #SOUND_REG_VOLUME+SIREN1_OSC_NUM+1,#0
        _writeReg #SOUND_REG_VOLUME+SIREN1_OSC_NUM+1,#0

        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER

        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN1_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER

        long m

        rts

startSiren2Sound entry

        lda siren2SoundPlaying
        cmp #1
        beq siren2SoundAlreadyPlaying
        bra doStartSiren2Sound

siren2SoundAlreadyPlaying anop
        rts

doStartSiren2Sound anop

        lda #1
        sta siren2SoundPlaying

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM,#SIREN2_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+1,#SIREN2_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+2,#SIREN2_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+3,#SIREN2_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+SIREN2_OSC_NUM
        lda #$fff
        jsr writeReg
        iny
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg

		_writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM,#SIREN2_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+1,#SIREN2_CONTROL+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+2,#SIREN2_CONTROL+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+3,#SIREN2_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts

stopSiren2Sound entry

        lda siren2SoundPlaying
        cmp #0
        beq siren2SoundNotPlaying
        bra doStopSiren2Sound

siren2SoundNotPlaying anop
        rts

doStopSiren2Sound anop

        lda #0
        sta siren2SoundPlaying

        short m
        _docWait
        lda >SOUND_SYSTEM_VOLUME
        and #$0f
        sta >SOUND_CONTROL_REG

        _writeReg #SOUND_REG_VOLUME+SIREN2_OSC_NUM,#0
        _writeReg #SOUND_REG_VOLUME+SIREN2_OSC_NUM+1,#0
        _writeReg #SOUND_REG_VOLUME+SIREN2_OSC_NUM+1,#0
        _writeReg #SOUND_REG_VOLUME+SIREN2_OSC_NUM+1,#0

        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER

        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+SIREN2_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER

        long m

        rts

triggerExtraLifeSound entry
        lda #2*60
        sta extraLifeSoundTimer
        rts
        
playExtraLifeSound entry

        lda lifeTimer
        bmi doPlayLifeSound
        rts
        
doPlayLifeSound anop

        lda #12
        sta lifeTimer

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+EXTRALIFE_OSC_NUM,#EXTRALIFE_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EXTRALIFE_OSC_NUM+1,#EXTRALIFE_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+EXTRALIFE_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+EXTRALIFE_OSC_NUM,#EXTRALIFE_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EXTRALIFE_OSC_NUM+1,#EXTRALIFE_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts

playFruitSound entry

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+FRUIT_OSC_NUM,#FRUIT_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+FRUIT_OSC_NUM+1,#FRUIT_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+FRUIT_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+FRUIT_OSC_NUM,#FRUIT_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+FRUIT_OSC_NUM+1,#FRUIT_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts

startScaredSound entry

        lda scaredSoundPlaying
        cmp #1
        beq scaredSoundAlreadyPlaying
        bra doStartScaredSound

scaredSoundAlreadyPlaying anop
        rts

doStartScaredSound anop

        lda #1
        sta scaredSoundPlaying

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM,#GHOSTSCARED_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+1,#GHOSTSCARED_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+2,#GHOSTSCARED_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+3,#GHOSTSCARED_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+GHOSTSCARED_OSC_NUM
        lda #$fff
        jsr writeReg
        iny
        lda #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg
        iny
        lda #$ff
        eor #$ff
        jsr writeReg

		_writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM,#GHOSTSCARED_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+1,#GHOSTSCARED_CONTROL+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+2,#GHOSTSCARED_CONTROL+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+3,#GHOSTSCARED_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts

stopScaredSound entry

        lda scaredSoundPlaying
        cmp #0
        beq scaredSoundNotPlaying
        bra doStopScaredSound

scaredSoundNotPlaying anop
        rts

doStopScaredSound anop

        lda #0
        sta scaredSoundPlaying

        short m
        _docWait
        lda >SOUND_SYSTEM_VOLUME
        and #$0f
        sta >SOUND_CONTROL_REG

        _writeReg #SOUND_REG_VOLUME+GHOSTSCARED_OSC_NUM,#0
        _writeReg #SOUND_REG_VOLUME+GHOSTSCARED_OSC_NUM+1,#0
        _writeReg #SOUND_REG_VOLUME+GHOSTSCARED_OSC_NUM+1,#0
        _writeReg #SOUND_REG_VOLUME+GHOSTSCARED_OSC_NUM+1,#0

        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_LEFT_SPEAKER

        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+1,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_RIGHT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+2,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER
        _writeReg #SOUND_REG_CONTROL+GHOSTSCARED_OSC_NUM+3,#SOUND_ONE_SHOT_MODE+SOUND_HALTED+SOUND_LEFT_SPEAKER

        long m

        rts

playEatGhostSound entry

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+EATGHOST_OSC_NUM,#EATGHOST_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EATGHOST_OSC_NUM+1,#EATGHOST_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+EATGHOST_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+EATGHOST_OSC_NUM,#EATGHOST_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+EATGHOST_OSC_NUM+1,#EATGHOST_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts

playDeathSound entry

        short m
		_docWait

		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		sta >SOUND_CONTROL_REG

		_writeReg #SOUND_REG_CONTROL+DEATH_OSC_NUM,#DEATH_CONTROL+SOUND_HALTED+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+DEATH_OSC_NUM+1,#DEATH_CONTROL+SOUND_HALTED+SOUND_LEFT_SPEAKER

		ldy #SOUND_REG_VOLUME+DEATH_OSC_NUM
        lda #$ff
		jsr writeReg
		iny
        lda #$ff
		eor #$ff
		jsr writeReg

		_writeReg #SOUND_REG_CONTROL+DEATH_OSC_NUM,#DEATH_CONTROL+SOUND_RIGHT_SPEAKER
		_writeReg #SOUND_REG_CONTROL+DEATH_OSC_NUM+1,#DEATH_CONTROL+SOUND_LEFT_SPEAKER
        long m
		rts


updateSounds entry

; The pitch increases at the following eaten dot counts
; 82
; 148
; 180
; 196

        lda eatenDotCount
        cmp #196
        bcs pitch4
        cmp #180
        bcs pitch3
        cmp #148
        bcs pitch2
        cmp #82
        bcs pitch1

pitch0 anop
        ldy #0
        bra levelDone

pitch1 anop
        ldy #2
        bra levelDone

pitch2 anop
        ldy #4
        bra levelDone

pitch3 anop
        ldy #6
        bra levelDone

pitch4 anop
        ldy #8
        bra levelDone


levelDone anop

		short m
		lda >SOUND_SYSTEM_VOLUME
		and #$0f
		ora #$20
		sta >SOUND_CONTROL_REG

		lda #SOUND_REG_FREQ_LOW+SIREN1_OSC_NUM
		sta >SOUND_ADDR_LOW
		lda sirenFreqs,y
		sta >SOUND_DATA_REG
		sta >SOUND_DATA_REG
		sta >SOUND_DATA_REG
		sta >SOUND_DATA_REG

		lda #SOUND_REG_FREQ_HIGH+SIREN1_OSC_NUM
		sta >SOUND_ADDR_LOW
		lda sirenFreqs+1,y
		sta >SOUND_DATA_REG
		sta >SOUND_DATA_REG
		sta >SOUND_DATA_REG
		sta >SOUND_DATA_REG
		long m

        rts


sirenFreqs anop
        dc i2'40'
        dc i2'44'
        dc i2'48'
        dc i2'52'
        dc i2'54'


registerValue dc i2'0'

siren1SoundPlaying dc i2'0'
siren2SoundPlaying dc i2'0'
scaredSoundPlaying dc i2'0'


; Intro

soundRegDefaultsIntro anop

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

soundRegDefaultsEndIntro anop

; Intermission
soundRegDefaultsInter anop

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
        
soundRegDefaultsEndInter anop

soundRegDefaultsGame anop

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
        
soundRegDefaultsEndGame anop

; Death
soundRegDefaultsDeath anop

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

soundRegDefaultsEndDeath anop


eatDotTimer dc i2'0'
lifeTimer dc i2'0'
extraLifeSoundTimer dc i2'-1'

        end
