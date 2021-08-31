;
;  game..s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/19/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;


        case on


game start


gameInit entry
        jsr setupScreen

        jsr setColorTable
        
        jsr initMaze

        jsr drawMaze
        
        jsr borderInit

        rtl



runGameTick entry

mainLoop anop

        jsr waitForVbl
        
        jsr borderStart
        
        

        jsr runMaze
        
        jsr runPac
        
        jsr runGhosts

        
        jsr borderStart


        jsr eraseGhosts
        
        jsr erasePac
        
        

        jsr borderStart

        
        
        jsr drawGhosts

        jsr drawPac
        jsr drawPac

        

        jsr borderDone
        
        brl mainLoop
        
        rtl


        end
