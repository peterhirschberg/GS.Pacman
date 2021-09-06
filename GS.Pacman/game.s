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
        using gameData



gameInit entry
        jsr setupScreen

        jsr soundInitMusic1
        
        jsr setColorTable
        
        jsr initMaze

        jsr drawMaze
        
        jsr borderInit

        jsr playIntroSound

        lda #225
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

dontDrawInitialSprites anop

        dec gameIntroTimer
        lda gameIntroTimer
        bmi startGame
        bra gameIntro

startGame anop

        jsr soundInitGameSounds
        jsr startSiren1Sound


mainLoop anop

        jsr waitForVbl
        
        jsr borderStart

        lda eatGhostTimer
        cmp #0
        beq notEatingGhost
        dec eatGhostTimer
        bra eatingGhostSkipToHere

notEatingGhost anop

        jsr checkControls

        jsr runMaze
        
        jsr runPac
        
        jsr runGhosts

        jsr runSound
        
        jsr collisionCheckActors

        
        jsr borderStart


eatingGhostSkipToHere anop


        jsr eraseGhosts
        
        jsr erasePac
        
        

        jsr borderStart

        
        jsr drawPac

        jsr drawGhosts

        
        lda #0
        sta joystickUp
        sta joystickDown
        sta joystickLeft
        sta joystickRight
        

        jsr borderDone
        
        brl mainLoop
        
        rtl


        end


gameData data

gameIntroTimer dc i2'0'

eatGhostTimer dc i2'0'

        end
