;
;  collision.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/6/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;


        case on
        mcopy global.macros
        keep global


collision start
        using ghostData
        using pacData
        using gameData


collisionCheckActors entry

        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta pacTileX
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta pacTileY

        lda #0
        sta currentGhost

ghostLoop anop

        ldx currentGhost

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta ghostTileX

        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta ghostTileY

        lda pacTileX
        cmp ghostTileX
        bne nextGhost

        lda pacTileY
        cmp ghostTileY
        bne nextGhost

; collision

        lda ghostState,x
        cmp #GHOSTSTATE_FRIGHTENED
        bne nextGhost

; eat the ghost

        lda #GHOSTSTATE_POINTS
        sta ghostState,x

        jsr playEatGhostSound

        lda #60
        sta eatGhostTimer

        lda ghostPointValue
        cmp #200
        beq points200
        cmp #400
        beq points400
        cmp #800
        beq points800
        cmp #1600
        beq points1600
        bra nextGhost

points200 anop
        lda #400
        sta ghostPointValue
        bra nextGhost
points400 anop
        lda #800
        sta ghostPointValue
        bra nextGhost
points800 anop
        lda #1600
        sta ghostPointValue
        bra nextGhost
points1600 anop
        lda #1600
        sta ghostPointValue

nextGhost anop

        inc currentGhost
        inc currentGhost
        lda currentGhost
        cmp #8
        bcs collisionDone
        brl ghostLoop

collisionDone anop
        rts


currentGhost dc i2'0'

pacTileX dc i2'0'
pacTileY dc i2'0'

ghostTileX dc i2'0'
ghostTileY dc i2'0'

        end
