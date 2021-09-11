;
;  score.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/10/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

score start
        using spritesData
        using scoreData


addToScore entry

        clc
        adc currentScore
        sta currentScore

        lda #1
        sta scoreDirty

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

        lda #$ff
        sta spriteColor

        jsr parseColor

        lda #90
        sta spriteX
        lda #9
        sta spriteY

        lda #ALPHAINDEX_0
        jsr drawAlphaSpriteByIndex

        lda #0
        sta scoreDirty

        rts

scoreNotZero anop

        lda #$ff
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


scoreDigits anop
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'4'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'
        dc i2'-1'

digitIndex dc i2'0'

scoreDirty dc i2'1'

        end



scoreData data

currentScore dc i4'$1234'

        end
