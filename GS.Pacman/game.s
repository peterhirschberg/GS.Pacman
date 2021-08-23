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

        jsr drawMaze
        
        jsr borderInit

        rtl



runGameTick entry

mainLoop anop

        jsr waitForVbl
        
        jsr borderStart

        jsr runMaze
        
;        jsr cleanMaze

        jsr eraseSprites
        
        jsr borderStart

;        jsr drawSprites
        
        
        jsr drawSpriteGhost
        
        jsr drawSpritePacman
        
        jsr borderDone
        
        brl mainLoop
        
        rtl


        end
