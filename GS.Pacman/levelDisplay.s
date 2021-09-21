;
;  levelDisplay.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/17/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


levelDisplay start
        using gameData
        using levelDisplayData
        using spritesData


incrementLevel entry

        lda levelNum
        clc
        adc #1
        sta displayLevelNum

        ldx #1
        ldy #LEVELINDEX_1
        addToLevel

        lda #1
        sta levelDirty

        rts


drawLevel entry

        lda levelDirty
        cmp #0
        bne doDrawLevel
        rts

doDrawLevel anop

        lda displayLevelNum

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #260
        sta spriteX
        lda #9
        sta spriteY

        lda #0
        sta digitIndex

drawLevelLoop anop

        lda digitIndex
        asl a
        tay
        lda levelDigits,y
        bmi drawLevelDone
        asl a
        asl a
        jsr drawAlphaSpriteByIndex

        inc digitIndex
        lda digitIndex
        cmp #2
        beq drawLevelDone

        lda spriteX
        sec
        sbc #8
        sta spriteX

        bra drawLevelLoop

drawLevelDone anop

        lda #0
        sta levelDirty

        rts
        
        
initLevelDisplay entry

        lda #0
        ldx #0
        sta levelDigits,x
        lda #-1
        ldx #2
        sta levelDigits,x
        lda #-1
        ldx #4
        sta levelDigits,x

        lda #1
        sta levelDirty
        

        rts


LEVELINDEX_1       gequ    2*0
LEVELINDEX_10       gequ    2*1
LEVELINDEX_100       gequ    2*2


levelDigits anop
        dc i2'0'
        dc i2'-1'
        dc i2'-1'

digitIndex dc i2'0'

displayLevelNum dc i2'0'


        end

levelDisplayData data
    
levelDirty dc i2'1'

        end
