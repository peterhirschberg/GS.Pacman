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

        jsr drawMaze


        rtl



runGameTick entry



        rtl


        end
