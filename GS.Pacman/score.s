;
;  score.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/10/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


score start
        using spritesData
        using gameData
        using scoreData


; Pac-Dot = 10 Pts
; Power Pellet = 50 Pts
; 1st Ghost = 200 Pts
; 2nd Ghost = 400 Pts
; 3rd Ghost = 800 Pts
; 4th Ghost = 1600 Pts
; Cherry = 100 Pts
; Strawberry = 300 Pts
; Orange = 500 Pts
; Apple = 700 Pts
; Melon = 1000 Pts
; Galaxian = 2000 Pts
; Bell = 3000 Pts
; Key = 5000 Pts


checkExtraLife entry

        ldx #SCOREINDEX_10000
        lda scoreDigits,x
        cmp scoreDigitOldExtraLife
        bne addExtraLife
        rts
        
addExtraLife anop
        sta scoreDigitOldExtraLife

; extra life!
        
        inc numLives
        jsr drawLives
        
        jsr triggerExtraLifeSound
        
        rts
        

add10ToScore entry

        lda currentScore
        clc
        adc #10
        sta currentScore

        ldx #1
        ldy #SCOREINDEX_10
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty
        
        jsr checkExtraLife

        rts

add50ToScore entry

        lda currentScore
        clc
        adc #50
        sta currentScore

        ldx #5
        ldy #SCOREINDEX_10
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add100ToScore entry

        lda currentScore
        clc
        adc #100
        sta currentScore

        ldx #1
        ldy #SCOREINDEX_100
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add200ToScore entry

        lda currentScore
        clc
        adc #200
        sta currentScore

        ldx #2
        ldy #SCOREINDEX_100
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add300ToScore entry

        lda currentScore
        clc
        adc #300
        sta currentScore

        ldx #3
        ldy #SCOREINDEX_100
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts


add400ToScore entry

        lda currentScore
        clc
        adc #400
        sta currentScore

        ldx #4
        ldy #SCOREINDEX_100
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add500ToScore entry

        lda currentScore
        clc
        adc #400
        sta currentScore

        ldx #5
        ldy #SCOREINDEX_100
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add700ToScore entry

        lda currentScore
        clc
        adc #700
        sta currentScore

        ldx #7
        ldy #SCOREINDEX_100
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add800ToScore entry

        lda currentScore
        clc
        adc #800
        sta currentScore

        ldx #8
        ldy #SCOREINDEX_100
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty
        
        jsr checkExtraLife

        rts


add1000ToScore entry

        lda currentScore
        clc
        adc #1000
        sta currentScore

        ldx #1
        ldy #SCOREINDEX_1000
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add1600ToScore entry

        lda currentScore
        clc
        adc #1600
        sta currentScore

        ldx #6
        ldy #SCOREINDEX_100
        addToScore

        ldx #1
        ldy #SCOREINDEX_1000
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add2000ToScore entry

        lda currentScore
        clc
        adc #2000
        sta currentScore

        ldx #2
        ldy #SCOREINDEX_1000
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add3000ToScore entry

        lda currentScore
        clc
        adc #3000
        sta currentScore

        ldx #3
        ldy #SCOREINDEX_1000
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts

add5000ToScore entry

        lda currentScore
        clc
        adc #5000
        sta currentScore

        ldx #5
        ldy #SCOREINDEX_1000
        addToScore

        jsr checkHighScore

        lda #1
        sta scoreDirty

        jsr checkExtraLife

        rts


checkHighScore entry

        lda currentScore
        cmp highScore
        bcs updateHighScore
        rts

updateHighScore anop

        ldx #0
        lda scoreDigits,x
        sta highScoreDigits,x
        inx
        inx
        lda scoreDigits,x
        sta highScoreDigits,x
        inx
        inx
        lda scoreDigits,x
        sta highScoreDigits,x
        inx
        inx
        lda scoreDigits,x
        sta highScoreDigits,x
        inx
        inx
        lda scoreDigits,x
        sta highScoreDigits,x
        inx
        inx
        lda scoreDigits,x
        sta highScoreDigits,x
        inx
        inx
        lda scoreDigits,x
        sta highScoreDigits,x
        inx
        inx
        lda scoreDigits,x
        sta highScoreDigits,x

        lda currentScore
        sta highScore

        lda #1
        sta highScoreDirty

        rts





drawScore entry

        lda scoreDirty
        cmp #0
        bne doDrawScore
        rts

doDrawScore anop

        lda currentScore
        cmp #0
        bne scoreNotZero

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #90
        sta spriteX
        lda #9
        sta spriteY

        lda #ALPHAINDEX_0
        jsr drawAlphaSpriteByIndex

        lda spriteX
        sec
        sbc #8
        sta spriteX

        lda #ALPHAINDEX_0
        jsr drawAlphaSpriteByIndex

        lda #0
        sta scoreDirty

        rts

scoreNotZero anop

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #90
        sta spriteX
        lda #9
        sta spriteY

        lda #0
        sta digitIndex

drawScoreLoop anop

        lda digitIndex
        asl a
        tay
        lda scoreDigits,y
        bmi drawScoreDone
        asl a
        asl a
        jsr drawAlphaSpriteByIndex

        inc digitIndex
        lda digitIndex
        cmp #8
        beq drawScoreDone

        lda spriteX
        sec
        sbc #8
        sta spriteX

        bra drawScoreLoop

drawScoreDone anop

        lda #0
        sta scoreDirty

        rts


drawHighScore entry

        lda highScoreDirty
        cmp #0
        bne doDrawHighScore
        rts

doDrawHighScore anop

        lda highScore
        cmp #0
        bne highScoreNotZero

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #174
        sta spriteX
        lda #9
        sta spriteY

        lda #ALPHAINDEX_0
        jsr drawAlphaSpriteByIndex

        lda spriteX
        sec
        sbc #8
        sta spriteX

        lda #ALPHAINDEX_0
        jsr drawAlphaSpriteByIndex

        lda #0
        sta highScoreDirty

        rts

highScoreNotZero anop

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #174
        sta spriteX
        lda #9
        sta spriteY

        lda #0
        sta digitIndex

drawHighScoreLoop anop

        lda digitIndex
        asl a
        tay
        lda highScoreDigits,y
        bmi drawHighScoreDone
        asl a
        asl a
        jsr drawAlphaSpriteByIndex

        inc digitIndex
        lda digitIndex
        cmp #8
        beq drawHighScoreDone

        lda spriteX
        sec
        sbc #8
        sta spriteX

        bra drawHighScoreLoop

drawHighScoreDone anop

        lda #0
        sta highScoreDirty

        rts

        
initScore entry

        lda #0
        sta currentScore
        sta currentScore+2

        lda #1
        sta scoreDirty
        sta highScoreDirty
        
        lda #0
        ldx #SCOREINDEX_1
        sta scoreDigits,x
        ldx #SCOREINDEX_10
        sta scoreDigits,x
        lda #-1
        ldx #SCOREINDEX_100
        sta scoreDigits,x
        ldx #SCOREINDEX_1000
        sta scoreDigits,x
        ldx #SCOREINDEX_10000
        sta scoreDigits,x
        ldx #SCOREINDEX_100000
        sta scoreDigits,x
        ldx #SCOREINDEX_1000000
        sta scoreDigits,x
        ldx #SCOREINDEX_10000000
        sta scoreDigits,x
        
        sta scoreDigitOldExtraLife
        
        rts
        


SCOREINDEX_1       gequ    2*0
SCOREINDEX_10       gequ    2*1
SCOREINDEX_100       gequ    2*2
SCOREINDEX_1000       gequ    2*3
SCOREINDEX_10000       gequ    2*4
SCOREINDEX_100000       gequ    2*5
SCOREINDEX_1000000       gequ    2*6
SCOREINDEX_10000000       gequ    2*7


scoreDigits anop
        dc i2'0'
        dc i2'0'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'

highScoreDigits anop
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'

digitIndex dc i2'0'

scoreDigitOldExtraLife dc i2'-1'

        end



scoreData data

currentScore dc i4'0'
oldScore dc i4'0'

highScore dc i4'0'

scoreDirty dc i2'1'
highScoreDirty dc i2'1'

        end
