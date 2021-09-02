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

        jsr soundInit
        
        jsr setColorTable
        
        jsr initMaze

        jsr drawMaze
        
;        jsr borderInit

        rtl



runGameTick entry

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


        end
