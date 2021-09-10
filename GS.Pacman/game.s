;
;  game..s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/19/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;


        case on


game start
        using controlsData
        using pacData
        using spritesData
        using scoreData
        using gameData



gameInit entry
        jsr setupScreen

        jsr soundInitMusic1
        
        jsr blackColorTable

        jsr initMaze

        jsr drawMaze

        jsr initGhosts

        jsr normalColorTable

;        jsr borderInit


        jsr drawAlphaScoreTitles
        jsr drawAlphaScore1
        jsr drawAlphaHighScore


        lda #232
        sta spriteX
        lda #174
        sta spriteY
        lda #SPRITE_CHERRY
        jsr drawSpriteByIndex


        jsr playIntroSound

        lda #235
        sta gameIntroTimer



;        jsr U32TOBCD

         jsr u32tobcd


;        jsr updateScore
;        jsr updateScore
;        jsr updateScore

;        ldx #2
;        lda dloc,x



        lda bcdout+2
        tax
        brk


        rtl

        lda #0
        sta spriteX
        sta spriteY

        ldx #0
;        lda dloc,x
        jsr drawAlphaSpriteByIndex
        lda spriteX
        clc
        adc #8
        sta spriteX

        ldx #2
;        lda dloc,x
        jsr drawAlphaSpriteByIndex
        lda spriteX
        clc
        adc #8
        sta spriteX

        ldx #4
;        lda dloc,x
        jsr drawAlphaSpriteByIndex
        lda spriteX
        clc
        adc #8
        sta spriteX

        ldx #6
;        lda dloc,x
        jsr drawAlphaSpriteByIndex
        lda spriteX
        clc
        adc #8
        sta spriteX

        ldx #8
;        lda dloc,x
        jsr drawAlphaSpriteByIndex





        rtl



runGameTick entry

gameIntro anop

        jsr waitForVbl

        lda #120
        cmp gameIntroTimer
        bcs drawInitialSprites
        bra dontDrawInitialSprites

drawInitialSprites anop

        jsr drawPac
        jsr drawGhosts

        jsr drawAlphaReady

dontDrawInitialSprites anop

        dec gameIntroTimer
        lda gameIntroTimer
        bmi startGame
        bra gameIntro

startGame anop

        jsr soundInitGameSounds

        jsr eraseAlphaReady

mainLoop anop

        jsr waitForVbl
        
;        jsr borderStart




        jsr eraseGhosts
        
        jsr erasePac
        
        

;        jsr borderStart

        lda eatGhostTimer
        cmp #0
        bne notEatingGhost2

        jsr drawPac

notEatingGhost2 anop

        jsr drawGhosts


        lda eatGhostTimer
        cmp #0
        beq notEatingGhost1
        dec eatGhostTimer
        bra eatingGhostSkipToHere

notEatingGhost1 anop


;        jsr borderStart


        jsr checkControls

        jsr runMaze

        jsr runPac

        jsr runGhosts

        jsr runSound

        jsr collisionCheckActors


;        jsr borderStart


eatingGhostSkipToHere anop
        
        lda #0
        sta joystickUp
        sta joystickDown
        sta joystickLeft
        sta joystickRight
        

;        jsr borderDone
        
        brl mainLoop
        
        rtl


        end


gameData data

gameIntroTimer dc i2'0'

eatGhostTimer dc i2'0'

        end
