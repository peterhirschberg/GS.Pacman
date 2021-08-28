;
;  ghosts.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/26/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on


ghosts start
        using globalData
        using ghostData
        
        
runGhosts entry

        lda #GHOSTINDEX_RED
        sta currentGhost
        jsr runGhost

        lda #GHOSTINDEX_PINK
        sta currentGhost
        jsr runGhost

        lda #GHOSTINDEX_BLUE
        sta currentGhost
        jsr runGhost

        lda #GHOSTINDEX_ORANGE
        sta currentGhost
        jsr runGhost
        
        rts
        
        
runGhost entry


        rts
        
        
        

        
        
; If I need these might move to maze.s
getGhostTileIndex entry
        rts

        
        
currentGhost dc i2'0'


        end



ghostData data
    

GHOSTINDEX_RED          gequ 0*2
GHOSTINDEX_PINK         gequ 1*2
GHOSTINDEX_BLUE         gequ 2*2
GHOSTINDEX_ORANGE       gequ 3*2

GHOSTSTATE_CHASE        gequ 0
GHOSTSTATE_SCATTER      gequ 1
GHOSTSTATE_FRIGHTENED   gequ 2
GHOSTSTATE_EATEN        gequ 3
GHOSTSTATE_PENNED       gequ 4
GHOSTSTATE_LEAVINGPEN   gequ 4


ghostPixelX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostPixelY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostTileX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        
ghostTileY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        
ghostState anop
        dc i2'GHOSTSTATE_CHASE'
        dc i2'GHOSTSTATE_CHASE'
        dc i2'GHOSTSTATE_CHASE'
        dc i2'GHOSTSTATE_CHASE'

ghostDirection anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

        
        end
