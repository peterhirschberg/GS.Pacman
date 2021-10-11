;
;  alphaSprites.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/9/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy alphaSprites.macros
        keep alphaSprites

alphaSprites start
        using spritesData


parseColor entry

        lda spriteColor
        sta spriteBothColor

        lda spriteColor
        and #$000f
        sta spriteLowColor

        lda spriteColor
        and #$00f0
        sta spriteHighColor

        rts


drawAlphaPressStart entry

        lda #$99
        sta spriteColor

        jsr parseColor

        lda #88
        sta spriteX
        lda #166
        sta spriteY

        ldy #0

startLoop anop

        lda alphaStringPressStart,y

        cmp #-1
        beq startDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra startLoop

startDone anop

        rts

        
drawAlphaCopyright entry

        lda #$ff
        sta spriteColor

        jsr parseColor

        lda #68
        sta spriteX
        lda #184
        sta spriteY

        ldy #0

copyLoop anop

        lda alphaStringCopyright,y

        cmp #-1
        beq copyDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra copyLoop

copyDone anop

        rts
        
        
drawAlphaReady entry

        lda #$aa
        sta spriteColor

        jsr parseColor

        lda #92
        sta spriteX
        lda #110
        sta spriteY
        jsr translateSpritePosToMazePos

        ldy #0

readyLoop anop

        lda alphaStringReady,y

        cmp #-1
        beq readyDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra readyLoop

readyDone anop

        rts


eraseAlphaReady entry

        lda #$aa
        sta spriteColor

        jsr parseColor

        lda #92
        sta spriteX
        lda #110
        sta spriteY
        jsr translateSpritePosToMazePos

        ldy #0

readyEraseLoop anop

        lda alphaEraseStringReady,y

        cmp #-1
        beq readyEraseDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra readyEraseLoop

readyEraseDone anop

        rts


drawAlphaGameOver entry

        lda #$33
        sta spriteColor

        jsr parseColor

        lda #80
        sta spriteX
        lda #110
        sta spriteY
        jsr translateSpritePosToMazePos

        ldy #0

gameoverLoop anop

        lda alphaStringGameOver,y

        cmp #-1
        beq gameoverDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra gameoverLoop

gameoverDone anop

        rts



drawAlphaScoreTitles entry

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #66
        sta spriteX
        lda #0
        sta spriteY

        ldy #0

scoreTitleLoop anop

        lda alphaStringScoreTitle,y

        cmp #-1
        beq scoreTitleDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra scoreTitleLoop

scoreTitleDone anop

        rts
        
        
drawCharacterNicknames entry

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #100
        sta spriteX
        lda #32
        sta spriteY

        ldy #0

nicknamesTitleLoop anop

        lda alphaStringCharacterNicknameTitle,y

        cmp #-1
        beq nicknamesTitleDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra nicknamesTitleLoop

nicknamesTitleDone anop


        lda #$33
        sta spriteColor

        jsr parseColor

        lda #100
        sta spriteX
        lda #32+16
        sta spriteY

        ldy #0

blinkyLoop anop

        lda alphaStringBlinky,y

        cmp #-1
        beq blinkyDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra blinkyLoop

blinkyDone anop


        lda #$bb
        sta spriteColor

        jsr parseColor

        lda #100
        sta spriteX
        lda #32+32
        sta spriteY

        ldy #0

pinkyLoop anop

        lda alphaStringPinky,y

        cmp #-1
        beq pinkyDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra pinkyLoop

pinkyDone anop

        lda #$88
        sta spriteColor

        jsr parseColor

        lda #100
        sta spriteX
        lda #32+48
        sta spriteY

        ldy #0

inkyLoop anop

        lda alphaStringInky,y

        cmp #-1
        beq inkyDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra inkyLoop

inkyDone anop


        lda #$99
        sta spriteColor

        jsr parseColor

        lda #100
        sta spriteX
        lda #32+64
        sta spriteY

        ldy #0

clydeLoop anop

        lda alphaStringCloyd,y

        cmp #-1
        beq clydeDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra clydeLoop

clydeDone anop

        lda #30
        sta spriteX
        lda #30
        sta spriteY
        lda #SPRITE_REDGHOST_RIGHT_1
        jsr drawSpriteByIndex

        lda #30
        sta spriteX
        lda #30+16
        sta spriteY
        lda #SPRITE_PINKGHOST_RIGHT_1
        jsr drawSpriteByIndex

        lda #30
        sta spriteX
        lda #30+32
        sta spriteY
        lda #SPRITE_BLUEGHOST_RIGHT_1
        jsr drawSpriteByIndex

        lda #30
        sta spriteX
        lda #30+48
        sta spriteY
        lda #SPRITE_ORANGEGHOST_RIGHT_1
        jsr drawSpriteByIndex

        rts
        
drawDotPoints entry

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #135
        sta spriteX
        lda #120
        sta spriteY

        ldy #0

a10PTSLoop anop

        lda alphaString10pts,y

        cmp #-1
        beq a10PTSDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra a10PTSLoop
        
a10PTSDone anop

        lda #$dd
        sta spriteColor

        jsr parseColor

        lda #135
        sta spriteX
        lda #120+16
        sta spriteY

        ldy #0

a50PTSLoop anop

        lda alphaString50pts,y

        cmp #-1
        beq a50PTSDone

        jsr drawAlphaSpriteByIndex

        lda spriteX
        clc
        adc #8
        sta spriteX

        iny
        iny
        iny
        iny
        bra a50PTSLoop
        
a50PTSDone anop


        rts
        


; Thanks to Ian Brumby and John Brooks for this lookup routine
drawAlphaSpriteByIndex entry
        tax
        lda drawAlphaSpriteTable,x
        sta callDrawAlphaSprite+1
        lda drawAlphaSpriteTable+1,x
        sta callDrawAlphaSprite+2
callDrawAlphaSprite anop
        jsl $FFFF
        rts



ALPHAINDEX_0            gequ 4*0
ALPHAINDEX_1            gequ 4*1
ALPHAINDEX_2            gequ 4*2
ALPHAINDEX_3            gequ 4*3
ALPHAINDEX_4            gequ 4*4
ALPHAINDEX_5            gequ 4*5
ALPHAINDEX_6            gequ 4*6
ALPHAINDEX_7            gequ 4*7
ALPHAINDEX_8            gequ 4*8
ALPHAINDEX_9            gequ 4*9
ALPHAINDEX_A            gequ 4*10
ALPHAINDEX_B            gequ 4*11
ALPHAINDEX_C            gequ 4*12
ALPHAINDEX_D            gequ 4*13
ALPHAINDEX_E            gequ 4*14
ALPHAINDEX_F            gequ 4*15
ALPHAINDEX_G            gequ 4*16
ALPHAINDEX_H            gequ 4*17
ALPHAINDEX_I            gequ 4*18
ALPHAINDEX_J            gequ 4*19
ALPHAINDEX_K            gequ 4*20
ALPHAINDEX_L            gequ 4*21
ALPHAINDEX_M            gequ 4*22
ALPHAINDEX_N            gequ 4*23
ALPHAINDEX_O            gequ 4*24
ALPHAINDEX_P            gequ 4*25
ALPHAINDEX_Q            gequ 4*26
ALPHAINDEX_R            gequ 4*27
ALPHAINDEX_S            gequ 4*28
ALPHAINDEX_T            gequ 4*29
ALPHAINDEX_U            gequ 4*30
ALPHAINDEX_V            gequ 4*31
ALPHAINDEX_W            gequ 4*32
ALPHAINDEX_X            gequ 4*33
ALPHAINDEX_Y            gequ 4*34
ALPHAINDEX_Z            gequ 4*35
ALPHAINDEX_EXCLAMATION  gequ 4*36
ALPHAINDEX_COPY         gequ 4*37
ALPHAINDEX_PTS1         gequ 4*38
ALPHAINDEX_PTS2         gequ 4*39
ALPHAINDEX_PTS3         gequ 4*40
ALPHAINDEX_SLASH        gequ 4*41
ALPHAINDEX_DASH         gequ 4*42
ALPHAINDEX_BOX1         gequ 4*43
ALPHAINDEX_BOX2         gequ 4*44
ALPHAINDEX_BOX3         gequ 4*45
ALPHAINDEX_BOX4         gequ 4*46
ALPHAINDEX_QUOTE        gequ 4*47
ALPHAINDEX_SPACE        gequ 4*48


drawAlphaSpriteTable anop
        dc i4'drawAlphaSprite0'
        dc i4'drawAlphaSprite1'
        dc i4'drawAlphaSprite2'
        dc i4'drawAlphaSprite3'
        dc i4'drawAlphaSprite4'
        dc i4'drawAlphaSprite5'
        dc i4'drawAlphaSprite6'
        dc i4'drawAlphaSprite7'
        dc i4'drawAlphaSprite8'
        dc i4'drawAlphaSprite9'
        dc i4'drawAlphaSprite10'
        dc i4'drawAlphaSprite11'
        dc i4'drawAlphaSprite12'
        dc i4'drawAlphaSprite13'
        dc i4'drawAlphaSprite14'
        dc i4'drawAlphaSprite15'
        dc i4'drawAlphaSprite16'
        dc i4'drawAlphaSprite17'
        dc i4'drawAlphaSprite18'
        dc i4'drawAlphaSprite19'
        dc i4'drawAlphaSprite20'
        dc i4'drawAlphaSprite21'
        dc i4'drawAlphaSprite22'
        dc i4'drawAlphaSprite23'
        dc i4'drawAlphaSprite24'
        dc i4'drawAlphaSprite25'
        dc i4'drawAlphaSprite26'
        dc i4'drawAlphaSprite27'
        dc i4'drawAlphaSprite28'
        dc i4'drawAlphaSprite29'
        dc i4'drawAlphaSprite30'
        dc i4'drawAlphaSprite31'
        dc i4'drawAlphaSprite32'
        dc i4'drawAlphaSprite33'
        dc i4'drawAlphaSprite34'
        dc i4'drawAlphaSprite35'
        dc i4'drawAlphaSprite36'
        dc i4'drawAlphaSprite37'
        dc i4'drawAlphaSprite38'
        dc i4'drawAlphaSprite39'
        dc i4'drawAlphaSprite40'
        dc i4'drawAlphaSprite41'
        dc i4'drawAlphaSprite42'
        dc i4'drawAlphaSprite43'
        dc i4'drawAlphaSprite44'
        dc i4'drawAlphaSprite45'
        dc i4'drawAlphaSprite46'
        dc i4'drawAlphaSprite47'
        dc i4'drawAlphaSprite48'

        
alphaStringPressStart anop
        dc i4'ALPHAINDEX_P'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_S'
        dc i4'ALPHAINDEX_S'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'ALPHAINDEX_1'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_T'
        dc i4'ALPHAINDEX_O'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_S'
        dc i4'ALPHAINDEX_T'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_T'
        dc i4'-1'

alphaStringReady anop
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_D'
        dc i4'ALPHAINDEX_Y'
        dc i4'ALPHAINDEX_EXCLAMATION'
        dc i4'-1'

alphaStringGameOver anop
        dc i4'ALPHAINDEX_G'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_M'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_O'
        dc i4'ALPHAINDEX_V'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_R'
        dc i4'-1'

alphaEraseStringReady anop
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'-1'

alphaStringScoreTitle anop
        dc i4'ALPHAINDEX_1'
        dc i4'ALPHAINDEX_U'
        dc i4'ALPHAINDEX_P'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_H'
        dc i4'ALPHAINDEX_I'
        dc i4'ALPHAINDEX_G'
        dc i4'ALPHAINDEX_H'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_S'
        dc i4'ALPHAINDEX_C'
        dc i4'ALPHAINDEX_O'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_C'
        dc i4'ALPHAINDEX_K'
        dc i4'-1'
        
alphaStringCopyright anop
        dc i4'ALPHAINDEX_COPY'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_2'
        dc i4'ALPHAINDEX_0'
        dc i4'ALPHAINDEX_2'
        dc i4'ALPHAINDEX_1'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_P'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_T'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_H'
        dc i4'ALPHAINDEX_I'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_S'
        dc i4'ALPHAINDEX_C'
        dc i4'ALPHAINDEX_H'
        dc i4'ALPHAINDEX_B'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_G'
        dc i4'-1'

alphaStringCharacterNicknameTitle anop
        dc i4'ALPHAINDEX_C'
        dc i4'ALPHAINDEX_H'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_C'
        dc i4'ALPHAINDEX_T'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_R'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SLASH'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_N'
        dc i4'ALPHAINDEX_I'
        dc i4'ALPHAINDEX_C'
        dc i4'ALPHAINDEX_K'
        dc i4'ALPHAINDEX_N'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_M'
        dc i4'ALPHAINDEX_E'
        dc i4'-1'
        
        
alphaStringBlinky anop
        dc i4'ALPHAINDEX_DASH'
        dc i4'ALPHAINDEX_S'
        dc i4'ALPHAINDEX_H'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_D'
        dc i4'ALPHAINDEX_O'
        dc i4'ALPHAINDEX_W'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'ALPHAINDEX_B'
        dc i4'ALPHAINDEX_L'
        dc i4'ALPHAINDEX_I'
        dc i4'ALPHAINDEX_N'
        dc i4'ALPHAINDEX_K'
        dc i4'ALPHAINDEX_Y'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'-1'
        
alphaStringPinky anop
        dc i4'ALPHAINDEX_DASH'
        dc i4'ALPHAINDEX_S'
        dc i4'ALPHAINDEX_P'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_D'
        dc i4'ALPHAINDEX_Y'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'ALPHAINDEX_P'
        dc i4'ALPHAINDEX_I'
        dc i4'ALPHAINDEX_N'
        dc i4'ALPHAINDEX_K'
        dc i4'ALPHAINDEX_Y'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'-1'
        
alphaStringInky anop
        dc i4'ALPHAINDEX_DASH'
        dc i4'ALPHAINDEX_B'
        dc i4'ALPHAINDEX_A'
        dc i4'ALPHAINDEX_S'
        dc i4'ALPHAINDEX_H'
        dc i4'ALPHAINDEX_F'
        dc i4'ALPHAINDEX_U'
        dc i4'ALPHAINDEX_L'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'ALPHAINDEX_I'
        dc i4'ALPHAINDEX_N'
        dc i4'ALPHAINDEX_K'
        dc i4'ALPHAINDEX_Y'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'-1'
        
alphaStringCloyd anop
        dc i4'ALPHAINDEX_DASH'
        dc i4'ALPHAINDEX_P'
        dc i4'ALPHAINDEX_O'
        dc i4'ALPHAINDEX_K'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_Y'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'ALPHAINDEX_C'
        dc i4'ALPHAINDEX_L'
        dc i4'ALPHAINDEX_Y'
        dc i4'ALPHAINDEX_D'
        dc i4'ALPHAINDEX_E'
        dc i4'ALPHAINDEX_QUOTE'
        dc i4'-1'
        
alphaString10pts anop
        dc i4'ALPHAINDEX_1'
        dc i4'ALPHAINDEX_0'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_PTS1'
        dc i4'ALPHAINDEX_PTS2'
        dc i4'ALPHAINDEX_PTS3'
        dc i4'-1'
        
alphaString50pts anop
        dc i4'ALPHAINDEX_5'
        dc i4'ALPHAINDEX_0'
        dc i4'ALPHAINDEX_SPACE'
        dc i4'ALPHAINDEX_PTS1'
        dc i4'ALPHAINDEX_PTS2'
        dc i4'ALPHAINDEX_PTS3'
        dc i4'-1'
        
        end
