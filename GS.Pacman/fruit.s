;
;  fruit.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/14/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


fruit start
        using mazeExchangeData
        using spritesData
        using gameData
        using pacData
        using fruitData


runFruit entry

        lda fruitTimer
        cmp #0
        beq timerNotRunning

        dec fruitTimer

; check pac to see if fruit has been eaten

        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        cmp #13
        bne fruitNotEaten
        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        cmp #13
        bne checkFruitTileNext
        bra eatFruit

checkFruitTileNext anop

        cmp #14
        bne fruitNotEaten

eatFruit anop

        jsr playFruitSound
        lda #0
        sta fruitTimer

; TODO: ADD POINTS TO SCORE

        lda #3*60
        sta fruitScoreTimer

fruitNotEaten anop
timerNotRunning anop

        lda fruitScoreTimer
        cmp #0
        beq scoreTimerNotRunning

        dec fruitScoreTimer

scoreTimerNotRunning anop

        lda eatenDotCount
        cmp #36
        beq startFruit
        cmp #136
        beq startFruit

        rts

startFruit anop

        lda fruitTimer
        cmp #0
        beq doStartFruit
        rts

doStartFruit anop

        lda #60*10
        sta fruitTimer

        rts



drawFruit entry

        lda #$6c
        sta spriteX
        lda #$69
        sta spriteY

        lda fruitScoreTimer
        cmp #0
        bne doDrawPoints

        lda fruitTimer
        cmp #0
        bne doDrawFruit
        rts

doDrawPoints anop

        lda #0
        sta fruitTimer

        lda fruitScoreTimer
        cmp #1
        beq eraseFruit

        lda #SPRITE_1000R ; #SPRITE_100
        jsr drawSpriteByIndex

        rts

doDrawFruit anop

        lda fruitTimer
        cmp #1
        bne dontEraseFruit

eraseFruit anop

        jsr eraseSpriteRect

        rts

dontEraseFruit anop

        lda levelNum
    lda #1
        asl a
        tax
        lda fruitSprites,x
        jsr drawSpriteByIndex

        rts


drawFruitRack entry

        rts


killFruit entry

        stz fruitTimer
        stz fruitScoreTimer

        lda #$6c
        sta spriteX
        lda #$69
        sta spriteY

        jsr eraseSpriteRect

        rts



fruitTimer dc i2'0'
fruitScoreTimer dc i2'0'


fruitSprites anop
        dc i2'SPRITE_CHERRY'        ; 0
        dc i2'SPRITE_STRAWBERRY'    ; 1
        dc i2'SPRITE_PEACH'         ; 2
        dc i2'SPRITE_PEACH'         ; 3
        dc i2'SPRITE_APPLE'         ; 4
        dc i2'SPRITE_APPLE'         ; 5
        dc i2'SPRITE_MELON'         ; 6
        dc i2'SPRITE_MELON'         ; 7
        dc i2'SPRITE_GALAX'         ; 8
        dc i2'SPRITE_GALAX'         ; 9
        dc i2'SPRITE_BELL'         ; 10
        dc i2'SPRITE_BELL'         ; 11
        dc i2'SPRITE_KEY'         ; 12
        dc i2'SPRITE_KEY'         ; 13


fruitPoints anop
        dc i2'100'      ; 0
        dc i2'300'      ; 1
        dc i2'500'      ; 2
        dc i2'500'      ; 3
        dc i2'700'      ; 4
        dc i2'700'      ; 5
        dc i2'1000'      ; 6
        dc i2'1000'      ; 7
        dc i2'2000'      ; 8
        dc i2'2000'      ; 9
        dc i2'3000'      ; 10
        dc i2'3000'      ; 11
        dc i2'5000'      ; 12
        dc i2'5000'      ; 13



        end


fruitData data

        end


; 13.5, 13

; 70 -> 36 dots
; 170 -> 136 dots
;
; 10 seconds
;
; Current level + 6 previous levels

;
; Cherry
; Strawberry
; Peach
; Peach
; Apple
; Apple
; Grapes
; Grapes
; Galaxian
; Galaxian
; Bell
; Bell
; Key...
;

