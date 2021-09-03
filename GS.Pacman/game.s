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
        

gameInit entry
        jsr setupScreen

        jsr soundInitMusic1
        
        jsr setColorTable
        
        jsr initMaze

        jsr drawMaze
        
;        jsr borderInit

        jsr playIntroSound

        lda #260
        sta gameIntroTimer

        rtl



runGameTick entry

        jsr drawPac
        jsr drawGhosts

gameIntro anop

        jsr waitForVbl

        dec gameIntroTimer
        lda gameIntroTimer
        bmi startGame
        bra gameIntro

startGame anop

        jsr soundInitGameSounds
        jsr startSiren1Sound


mainLoop anop

        jsr waitForVbl
        
;        jsr borderStart
        
        
        jsr checkControls

        jsr runMaze
        
        jsr runPac
        
        jsr runGhosts

        jsr runSound
        
        
        
;        jsr borderStart


        jsr eraseGhosts
        
        jsr erasePac
        
        

;        jsr borderStart

        
        jsr drawPac

        jsr drawGhosts

        
        lda #0
        sta joystickUp
        sta joystickDown
        sta joystickLeft
        sta joystickRight
        

;        jsr borderDone
        
        brl mainLoop
        
        rtl


gameIntroTimer dc i2'0'


        end
