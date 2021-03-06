;
;  controls.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/30/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


controls start
        using globalData
        using controlsData
        using gameData
        using ghostData
        using pacData


checkControls entry

        lda >BUTTON1
        and #$80
        cmp #0
        beq notButton1
        jsr onStartGame

notButton1 anop

        lda enableJoystick
        cmp #1
        bne readKeys

        jsr readJoystick

readKeys anop

        short i,m
        lda >KEYBOARD
        bpl checkKeysDone
        sta >KEYBOARD_STROBE
        long i,m
        and #$007f
        
        cmp #'w'
        beq onJoystickUp
        cmp #'W'
        beq onJoystickUp

        cmp #'s'
        beq onJoystickDown
        cmp #'S'
        beq onJoystickDown

        cmp #'d'
        beq onJoystickRight
        cmp #'D'
        beq onJoystickRight

        cmp #'a'
        beq onJoystickLeft
        cmp #'A'
        beq onJoystickLeft

        cmp #$20
        beq onJoystickButton

        cmp #'q'
        beq onQuit
        cmp #'Q'
        beq onQuit

        cmp #'j'
        beq onEnableJoystick
        cmp #'J'
        beq onEnableJoystick

        cmp #'k'
        beq onDisableJoystick
        cmp #'K'
        beq onDisableJoystick

        cmp #'1'
        beq onStartGame

        cmp #'9'
        beq onRackAdvance

        cmp #'8'
        beq onCheat

checkKeysDone anop
        long i,m
        rts

onJoystickUp anop
        lda #1
        sta joystickUp
        rts

onJoystickDown anop
        lda #1
        sta joystickDown
        rts

onJoystickLeft anop
        lda #1
        sta joystickLeft
        rts

onJoystickRight anop
        lda #1
        sta joystickRight
        rts

onJoystickButton anop
        lda #1
        sta joystickButton
        rts

onEnableJoystick anop
        lda #1
        sta enableJoystick
        rts
        
onDisableJoystick anop
        lda #0
        sta enableJoystick
        rts

onQuit anop

        lda >BUTTON1
        and #$80
        cmp #0
        beq dontQuit
        
        lda #1
        sta shouldQuit
        
dontQuit anop
        rts
        
onStartGame anop

        lda waitingForGameStart
        cmp #0
        bne doStartGame
        rts
        
doStartGame anop

        lda #3
        sta numLives

        rts

onRackAdvance anop

        lda #240-100
        sta levelCompleteTimer

        jsr doLevelComplete
        
        rts
        
onCheat anop
        lda #1
        sta cheatMode
        rts
        


readJoystick entry

        lda >BUTTON1
        and #$80
        cmp #0
        beq checkButton2

        lda #1
        sta joystickButton
        bra readStick

checkButton2 anop

        lda >BUTTON2
        and #$80
        cmp #0
        beq readStick

        lda #1
        sta joystickButton

readStick anop

        jsr asmJoy
        txa
        sta joyX
        tya
        sta joyY


        lda #10
        cmp joyX
        bcs joyLeft

        lda joyX
        cmp #120
        bcs joyRight

        bra interpretY

joyRight anop

        lda #0
        sta joystickLeft
        lda #1
        sta joystickRight
        bra interpretY

joyLeft anop

        lda #1
        sta joystickLeft
        lda #0
        sta joystickRight
        bra interpretY

interpretY anop

        lda #10
        cmp joyY
        bcs joyUp

        lda joyY
        cmp #120
        bcs joyDown

        bra joyDone

joyDown anop

        lda #0
        sta joystickUp
        lda #1
        sta joystickDown
        bra joyDone

joyUp anop

        lda #1
        sta joystickUp
        lda #0
        sta joystickDown
        bra joyDone

joyDone anop

        rts

        


BUTTON1 gequ $c061
BUTTON2 gequ $c062


; ----------------------------------------
; From JoeyLib
; https://skunkworks.kangaroopunch.com/skunkworks/joeylib/-/blob/master/joeylib/src/jIIgs.asm


pret0    equ    1
pret1    equ    2

speed    equ    $00C036
pdl0    equ    $00C064
pdl1    equ    $00C065
ptrig    equ    $00C070


;----------------------------------------
; Reads controller axis
; Thank you to John Brooks for this code!
;----------------------------------------
asmJoy	entry

	php		; Save mx reg size bits
	phb		; Save data bank
	short	m,i	; 8-bit m,x
	sei		; disable interrupts

	ldx	#0	; Zero paddle 0 counter
	phx
	plb		; Set DBR = 0

	ldy	speed	; Read current system speed
	phy		; Save it
	lda	#$80	; Fast/Slow bit
	trb	speed	; Force 1 Mhz

	txy		; Zero paddle 1 counter

	pha		; Dummy data for wait pla
	lda	ptrig	; Start paddle timers. Wait 11 cycles then read pdl0
	pla		; 4c

gotpdl1	xba		; 3c
chkpdl0	lda	pdl0	; 4c. Read pdl0. 10c until pdl1 read
	bpl	gotpdl0	; 2/3c taken if pdl0 is done
	inx		; 2c
	lda	pdl1	; 4c. Read pdl1. 12c until pdl0 read
	bmi	nogots	; 2/3c
	bpl	gotpdl1	; 3c always taken
nogots	iny		; 2c
	jmp	chkpdl0	; 3c
gotpdl0	xba		; 3c
	lda	pdl1	; 4c. Read pdl1. 12c until pdl0 read
	bmi	nogots	; 3c if pdl1 not done

	pla		; Reload original speed
	sta	speed	; Restore it

	plb		; Restore Data Bank

	stx	pret0	; Store result
	tya
	asl	a	; Scale 0-127 pdl1 to 0-254
	sta	pret1

	plp		; Restore mx 8/16 mode and interrupt enable state
	long	m,i

    rts







PDL0    EQU  $C064
PDL1    EQU  $C065
PTRIG   EQU  $C070


joyX dc i2'0'
joyY dc i2'0'
        
        end


controlsData data

joystickUp dc i2'0'
joystickRight dc i2'0'
joystickDown dc i2'0'
joystickLeft dc i2'0'

joystickButton dc i2'0'

enableJoystick dc i2'0'

        end
