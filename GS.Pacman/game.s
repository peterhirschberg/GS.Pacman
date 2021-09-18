;
;  game..s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/19/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;


        case on
        mcopy global.macros
        keep global


game start
        using controlsData
        using pacData
        using ghostData
        using spritesData
        using scoreData
        using mazeExchangeData
        using fruitData
        using gameData



gameInit entry

        jsl derefMemHandle

        jsr setupScreen

        jsr soundInitMusic1
        
        jsr blackColorTable

        jsr initMaze

        jsr drawMaze

        jsr initGhosts

        jsr incrementLevel
        jsr drawLevel

        jsr normalColorTable

;        jsr borderInit


        lda #0
        sta currentScore
        sta currentScore+2


        jsr drawAlphaScoreTitles
        jsr drawScore
        jsr drawHighScore
        jsr drawLives
        jsr drawFruitRack

        jsr playIntroSound

        lda #235
        sta gameIntroTimer

        rtl



runGameTick entry

gameOverLoop anop

        lda numLives
        bmi gameOverLoop

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

        dec postLifeTimer
        lda postLifeTimer
        cmp #0
        beq postLifeTimerExpired
        jsr erasePac
        jsr drawPac
        bra mainLoop

postLifeTimerExpired anop
        jsr startNewLife

        lda numLives
        bmi gameOverLoop

        bra gameIntro

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

        lda levelCompleteTimer
        cmp #0
        beq levelNotComplete

        dec levelCompleteTimer
        lda levelCompleteTimer
        cmp #0
        beq startNextLevel
        jsr erasePac
        jsr drawPac

        lda levelCompleteTimer
        cmp #240-100
        bcs normalMazeColor
        lsr a
        lsr a
        lsr a
        lsr a
        and #1
        cmp #0
        bne flashMazeColor
        bra normalMazeColor

flashMazeColor anop
        ldx #8
        lda #$0fff
        sta >COLOR_TABLE,x
        brl mainLoop

normalMazeColor anop
        ldx #8
        lda #$022e
        sta >COLOR_TABLE,x
        brl mainLoop


startNextLevel anop

        jsr startNewLevel
        brl gameIntro

levelNotComplete anop

        
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


        jsr drawFruit

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

        jsr runFruit

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
        iny
        tya
        cmp #1
        bcs doDrawLives
;        rts

doDrawLives anop

        dey

        lda #-14
        sta spriteX
        lda #172
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

; erase where the last sprite was

        lda #SPRITE_BLANK
        jsr drawSpriteByIndex

        rts


startNewLife entry

        dec numLives
        jsr drawLives
        lda numLives
        bmi gameOver
        bra resetNewLife

gameOver anop
        jsr drawAlphaGameOver
        rts

resetNewLife anop

; reset game
        lda #0
        sta pacEaten

        lda #100
        sta gameIntroTimer

; reset the ghosts

        lda #GHOSTSTATE_SCATTER
        sta newMode

        lda #20
        sta fakeTargetTimer

        jsr initGhosts

        ldx #0

initGhostLoop anop

        lda ghostInitialPixelX,x
        sta ghostPixelX,x
        lda ghostInitialPixelY,x
        sta ghostPixelY,x
        lda ghostInitialState,x
        sta ghostState,x
        stz ghostStateTimer,x
        lda ghostInitialDotCounter,x
        sta ghostDotCounter,x
        lda ghostInitialDirection,x
        sta ghostDirection,x

        inx
        inx
        txa
        cmp #8
        bcs resetPac
        bra initGhostLoop

resetPac anop

; reset pac

        lda #0
        sta pacAnimationIndex
        sta pacAnimationTimer

        lda #DIRECTION_LEFT
        sta pacDirection
        sta pacIntendedDirection

; Initial position in maze is $6c,$88 x 8
        lda #$360
        sta pacX
        lda #$440
        sta pacY

        lda #0
        sta joystickUp
        sta joystickDown
        sta joystickLeft
        sta joystickRight

        rts


startNewLevel entry

        jsr blackColorTable

        stz eatenDotCount

        jsr initMaze

        jsr startNewLife

        jsr drawMaze

        jsr advanceFruitRack

        inc levelNum

        lda #1
        sta fruitRackDirty
        jsr drawFruitRack

        jsr incrementLevel
        jsr drawLevel

        jsr normalColorTable

        lda #100
        sta gameIntroTimer

        rts


        end


gameData data

gameIntroTimer dc i2'0'

eatGhostTimer dc i2'0'

eatPacTimer dc i2'0'

postLifeTimer dc i2'0'

levelCompleteTimer dc i2'0'

numLives dc i2'2'

levelNum dc i2'0'

        end
