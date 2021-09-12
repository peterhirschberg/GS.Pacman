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


        lda #0
        sta currentScore
        sta currentScore+2


        jsr drawAlphaScoreTitles
        jsr drawScore
        jsr drawHighScore


        lda #232
        sta spriteX
        lda #174
        sta spriteY
        lda #SPRITE_CHERRY
        jsr drawSpriteByIndex


        jsr drawLives


        jsr playIntroSound

        lda #235
        sta gameIntroTimer

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

        lda postLifeTimer
        cmp #0
        beq notPostLife

        bra mainLoop

notPostLife anop

        lda eatPacTimer
        cmp #0
        beq pacEatenTimerZero

        dec eatPacTimer

        lda eatPacTimer
        cmp #1
        beq startPacEatenSound
        bra dontStartPacEatenSound

startPacEatenSound anop

        jsr soundInitDeathSound
        jsr playDeathSound

        lda #0
        sta pacAnimationIndex

dontStartPacEatenSound anop

        bra mainLoop


pacEatenTimerZero anop

        
;        jsr borderStart


        jsr eraseGhosts
        
        jsr erasePac
        
        

;        jsr borderStart

        lda eatGhostTimer
        cmp #0
        bne notEatingGhost2

        lda pacEaten
        cmp #0
        bne doPacEaten




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


        bra eatingGhostSkipToHere


doPacEaten anop

        jsr runPac
        jsr drawPac

eatingGhostSkipToHere anop

        jsr drawScore
        jsr drawHighScore


        lda #0
        sta joystickUp
        sta joystickDown
        sta joystickLeft
        sta joystickRight
        

;        jsr borderDone
        
        brl mainLoop
        
        rtl


drawLives entry

        ldy numLives
        cmp #1
        bcs doDrawLives
        rts

doDrawLives anop

        dey

        lda #-14
        sta spriteX
        lda #174
        sta spriteY

livesLoop anop

        dey
        tya
        bmi livesDone

        lda #SPRITE_LIFE
        jsr drawSpriteByIndex

        lda #-14
        sta spriteX
        lda spriteY
        sec
        sbc #28
        sta spriteY


        bra livesLoop

livesDone anop

        rts



        end


gameData data

gameIntroTimer dc i2'0'

eatGhostTimer dc i2'0'

eatPacTimer dc i2'0'

postLifeTimer dc i2'0'

numLives dc i2'3'

        end
