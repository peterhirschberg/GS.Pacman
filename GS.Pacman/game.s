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
        using levelDisplayData
        using mazeExchangeData
        using fruitData
        using gameData


        
baseInit entry

        jsr setupScreen
        
        rtl
        
        
        
gameStartWait entry

        jsr blackColorTable

        jsr clearScreen

        lda #1
        sta scoreDirty
        sta highScoreDirty
        sta levelDirty
        
        jsr drawAlphaScoreTitles
        jsr drawScore
        jsr drawHighScore
        jsr drawLevel

        jsr normalColorTable

waitLoop anop
        
        jsr waitForVbl
        
        jsr drawAlphaPressStart

        lda numLives
        bmi waitLoop
        
        jsr blackColorTable

        jsr clearScreen

        jsr gameInit
        jsr startNewLife
        
        lda #240
        sta gameIntroTimer
        
        rts
        
        

gameInit entry

        jsr blackColorTable

        jsr soundInitMusic1

        jsr zeroMazeBuffer

        jsr initMaze

        jsr drawMaze

        jsr initGhosts

        lda #0
        sta levelNum
        jsr initLevelDisplay
        jsr incrementLevel
        jsr drawLevel

;        jsr borderInit

        jsr initScore
        
        jsr drawAlphaScoreTitles
        jsr drawScore
        jsr drawHighScore
        jsr drawLives
        jsr drawFruitRack

        jsr normalColorTable

        jsr playIntroSound

        lda #240
        sta gameIntroTimer

        rts



runGameTick entry

waitForStart anop

        jsr gameStartWait

        lda numLives
        cmp #2
        beq gameIntro
        
gameOverLoop anop

        jsr waitForVbl
        
        dec gameOverWaitTimer
        lda gameOverWaitTimer
        bmi waitForStart
        
        lda numLives
        bmi gameOverLoop

gameIntro anop

        jsr waitForVbl

        lda #125
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
        
        lda #200
        sta gameOverWaitTimer

        lda numLives
        bmi gameOverLoop

        bra gameIntro

notPostLife anop

        lda eatPacTimer
        cmp #0
        beq pacEatenTimerZero
        
        jsr erasePac
        jsr eraseGhosts
        
        jsr drawPac
        jsr drawGhosts

        dec eatPacTimer

        lda eatPacTimer
        cmp #0
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

        jsr collisionCheckActors

        
;        jsr borderStart


        bra eatingGhostSkipToHere


doPacEaten anop

        jsr runPac
        jsr drawPac

eatingGhostSkipToHere anop

        jsr runSound

        jsr drawScore
        jsr drawHighScore


        lda #0
        sta joystickUp
        sta joystickDown
        sta joystickLeft
        sta joystickRight
        

;        jsr borderDone

        lda shouldQuit
        cmp #0
        bne mainLoopExit

        brl mainLoop
        
mainLoopExit anop

        jsr stopScaredSound
        jsr stopSiren2Sound
        jsr stopSiren1Sound

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
        sta globalGhostState

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
        lda totalDotCount
        sta remainingDots

        jsr initPac
        
        inc numLives
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
        
        lda #0
        sta ghostMode

        rts


        end


gameData data

gameIntroTimer dc i2'0'

eatGhostTimer dc i2'0'

eatPacTimer dc i2'0'

postLifeTimer dc i2'0'

levelCompleteTimer dc i2'0'

numLives dc i2'-1'

levelNum dc i2'0'

shouldQuit dc i2'0'

gameOverWaitTimer dc i2'-1'

        end
