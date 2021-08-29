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
        using spritesData
        using mazeExchangeData
        using ghostData
        
        
runGhosts entry

        jsr animateGhosts
 
        lda #GHOSTINDEX_RED
        sta currentGhost
        jsr runGhost
        
  rts

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

        lda currentGhost
        tax

        lda ghostPixelX,x
        sta ghostPixelOldX,x
        lda ghostPixelY,x
        sta ghostPixelOldY,x
        
        lda ghostIntendedDirection,x
        cmp #DIRECTION_NONE
        bne dontPickDirection
        
; get next tile in the direction the ghost is moving

        lda ghostPixelX,x
        jsr getTileXFromPixelX
        sta tileX
        lda ghostPixelY,x
        jsr getTileYFromPixelY
        sta tileY
        lda ghostDirection,x
        jsr getNextTileXYAlongDirection

; see what directions are available

        jsr getAvailableDirectionsFromTileXY
        sta availableDirections
        
        jsr pickNextDirection
        sta ghostIntendedDirection,x

dontPickDirection anop
        
        jsr moveGhost

        rts

        
pickNextDirection entry

    lda #DIRECTION_RIGHT
    rts

; TEMP: just pick a random direction

directionLoop anop

        lda #4
        pha
        jsl getRandom
        clc
        adc #1
       
        cmp #DIRECTION_UP
        beq checkUpAvailable
        cmp #DIRECTION_RIGHT
        beq checkRightAvailable
        cmp #DIRECTION_DOWN
        beq checkDownAvailable
        cmp #DIRECTION_LEFT
        beq checkLeftAvailable
        rts
        
checkUpAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_UP
        cmp #0
        beq directionLoop
        lda #DIRECTION_UP
        rts
        
checkRightAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq directionLoop
        lda #DIRECTION_RIGHT
        rts
        
checkDownAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq directionLoop
        lda #DIRECTION_DOWN
        rts
        
checkLeftAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq directionLoop
        lda #DIRECTION_LEFT
        rts

        
        
moveGhost entry

        lda currentGhost
        tax
        
        lda ghostPixelX
        sta spriteX
        lda ghostPixelY
        sta spriteY
        jsr isSpriteCenteredInMazeTile
        lda #0
        bne keepMoving
        
        lda ghostIntendedDirection,x
        sta ghostDirection,x
        lda #DIRECTION_NONE
        sta ghostIntendedDirection,x
        
;endlessLoop anop
;        bra endlessLoop
        
keepMoving anop
        
        lda ghostDirection,x
        cmp #DIRECTION_UP
        beq moveGhostUp
        cmp #DIRECTION_DOWN
        beq moveGhostDown
        cmp #DIRECTION_LEFT
        beq moveGhostLeft
        cmp #DIRECTION_RIGHT
        beq moveGhostRight

        rts
        
moveGhostUp anop
        lda ghostPixelY,x
        sec
        sbc #1
        sta ghostPixelY,x
        rts

moveGhostDown anop
        lda ghostPixelY,x
        clc
        adc #1
        sta ghostPixelY,x
        rts

moveGhostLeft anop
        lda ghostPixelX,x
        sec
        sbc #1
        sta ghostPixelX,x
        rts

moveGhostRight anop
        lda ghostPixelX,x
        clc
        adc #1
        sta ghostPixelX,x
        rts

        
        
animateGhosts entry

        dec ghostAnimationTimer
        lda ghostAnimationTimer
        bmi incrementAnimationIndex
        rts

incrementAnimationIndex anop
        lda #10 ; animation timer duration
        sta ghostAnimationTimer

        inc ghostAnimationIndex
        lda ghostAnimationIndex
        cmp #2 ; num animation frames
        beq resetAnimationIndex
        rts

resetAnimationIndex anop

        lda #0
        sta ghostAnimationIndex

        rts
        

drawGhosts entry

        lda #GHOSTINDEX_RED
        sta currentGhost
        jsr drawGhost

  rts
        
        lda #GHOSTINDEX_PINK
        sta currentGhost
        jsr drawGhost

        lda #GHOSTINDEX_BLUE
        sta currentGhost
        jsr drawGhost

        lda #GHOSTINDEX_ORANGE
        sta currentGhost
        jsr drawGhost

        rts
        
        
drawGhost entry

        lda currentGhost
        tax

        lda ghostPixelX,x
        sta spriteX
        lda ghostPixelY,x
        sta spriteY
        
        lda ghostDirection,x
        cmp #DIRECTION_RIGHT
        beq drawDirectionRight
        cmp #DIRECTION_DOWN
        beq drawDirectionDown
        cmp #DIRECTION_LEFT
        beq drawDirectionLeft
        cmp #DIRECTION_UP
        beq drawDirectionUp
        
        rts
        
drawDirectionRight anop
        jsr doDrawDirectionRight
        rts

drawDirectionDown anop
        jsr doDrawDirectionDown
        rts

drawDirectionLeft anop
        jsr doDrawDirectionLeft
        rts

drawDirectionUp anop
        jsr doDrawDirectionUp
        rts

        
doDrawDirectionRight entry
        lda ghostAnimationIndex
        asl a
        tax
        jsr getGhostDirectionRightSprite
        jsr drawSpriteByIndex
        rts
        
getGhostDirectionRightSprite entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        bne getGhostDirectionRightSprite1
        lda redGhostRightAnimationSprites,x
        rts
getGhostDirectionRightSprite1 anop
        cmp #GHOSTINDEX_BLUE
        bne getGhostDirectionRightSprite2
        lda blueGhostRightAnimationSprites,x
        rts
getGhostDirectionRightSprite2 anop
        cmp #GHOSTINDEX_PINK
        bne getGhostDirectionRightSprite3
        lda pinkGhostRightAnimationSprites,x
        rts
getGhostDirectionRightSprite3 anop
        cmp #GHOSTINDEX_ORANGE
        bne getGhostDirectionRightSprite4
        lda orangeGhostRightAnimationSprites,x
        rts
getGhostDirectionRightSprite4 anop
        rts


doDrawDirectionDown entry
        lda ghostAnimationIndex
        asl a
        tax
        jsr getGhostDirectionDownSprite
        jsr drawSpriteByIndex
        rts
        
getGhostDirectionDownSprite entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        bne getGhostDirectionDownSprite1
        lda redGhostDownAnimationSprites,x
        rts
getGhostDirectionDownSprite1 anop
        cmp #GHOSTINDEX_BLUE
        bne getGhostDirectionDownSprite2
        lda blueGhostDownAnimationSprites,x
        rts
getGhostDirectionDownSprite2 anop
        cmp #GHOSTINDEX_PINK
        bne getGhostDirectionDownSprite3
        lda pinkGhostDownAnimationSprites,x
        rts
getGhostDirectionDownSprite3 anop
        cmp #GHOSTINDEX_ORANGE
        bne getGhostDirectionDownSprite4
        lda orangeGhostDownAnimationSprites,x
        rts
getGhostDirectionDownSprite4 anop
        rts
        
        
doDrawDirectionLeft entry
        lda ghostAnimationIndex
        asl a
        tax
        jsr getGhostDirectionLeftSprite
        jsr drawSpriteByIndex
        rts
        
getGhostDirectionLeftSprite entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        bne getGhostDirectionLeftSprite1
        lda redGhostLeftAnimationSprites,x
        rts
getGhostDirectionLeftSprite1 anop
        cmp #GHOSTINDEX_BLUE
        bne getGhostDirectionLeftSprite2
        lda blueGhostLeftAnimationSprites,x
        rts
getGhostDirectionLeftSprite2 anop
        cmp #GHOSTINDEX_PINK
        bne getGhostDirectionLeftSprite3
        lda pinkGhostLeftAnimationSprites,x
        rts
getGhostDirectionLeftSprite3 anop
        cmp #GHOSTINDEX_ORANGE
        bne getGhostDirectionLeftSprite4
        lda orangeGhostLeftAnimationSprites,x
        rts
getGhostDirectionLeftSprite4 anop
        rts
        
        
doDrawDirectionUp entry
        lda ghostAnimationIndex
        asl a
        tax
        jsr getGhostDirectionUpSprite
        jsr drawSpriteByIndex
        rts
        
getGhostDirectionUpSprite entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        bne getGhostDirectionUpSprite1
        lda redGhostUpAnimationSprites,x
        rts
getGhostDirectionUpSprite1 anop
        cmp #GHOSTINDEX_BLUE
        bne getGhostDirectionUpSprite2
        lda blueGhostUpAnimationSprites,x
        rts
getGhostDirectionUpSprite2 anop
        cmp #GHOSTINDEX_PINK
        bne getGhostDirectionUpSprite3
        lda pinkGhostUpAnimationSprites,x
        rts
getGhostDirectionUpSprite3 anop
        cmp #GHOSTINDEX_ORANGE
        bne getGhostDirectionUpSprite4
        lda orangeGhostUpAnimationSprites,x
        rts
getGhostDirectionUpSprite4 anop
        rts
        
        
eraseGhosts entry

        lda #GHOSTINDEX_RED
        sta currentGhost
        jsr eraseGhost

        lda #GHOSTINDEX_PINK
        sta currentGhost
        jsr eraseGhost

        lda #GHOSTINDEX_BLUE
        sta currentGhost
        jsr eraseGhost

        lda #GHOSTINDEX_ORANGE
        sta currentGhost
        jsr eraseGhost

        rts
        
        
eraseGhost entry

        lda currentGhost
        tax

        lda ghostPixelOldX,x
        sta spriteX
        lda ghostPixelOldY,x
        sta spriteY

        jsr eraseSpriteRect
        
        rts
        
        
        
currentGhost dc i2'0'


ghostAnimationIndex dc i2'0'
ghostAnimationTimer dc i2'0'

availableDirections dc i2'0'

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
        dc i2'8'
        dc i2'28'
        dc i2'48'
        dc i2'68'

ghostPixelY anop
        dc i2'8'
        dc i2'8'
        dc i2'8'
        dc i2'8'

ghostPixelOldX anop
        dc i2'8'
        dc i2'28'
        dc i2'48'
        dc i2'68'

ghostPixelOldY anop
        dc i2'8'
        dc i2'8'
        dc i2'8'
        dc i2'8'
        
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
        dc i2'DIRECTION_RIGHT' ; TODO
        dc i2'DIRECTION_RIGHT' ; TODO
        dc i2'DIRECTION_RIGHT' ; TODO
        dc i2'DIRECTION_RIGHT' ; TODO

ghostIntendedDirection anop
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'

redGhostLeftAnimationSprites anop
        dc i2'SPRITE_REDGHOST_LEFT_1'
        dc i2'SPRITE_REDGHOST_LEFT_2'
        
redGhostRightAnimationSprites anop
        dc i2'SPRITE_REDGHOST_RIGHT_1'
        dc i2'SPRITE_REDGHOST_RIGHT_2'
        
redGhostUpAnimationSprites anop
        dc i2'SPRITE_REDGHOST_UP_1'
        dc i2'SPRITE_REDGHOST_UP_2'
        
redGhostDownAnimationSprites anop
        dc i2'SPRITE_REDGHOST_DOWN_1'
        dc i2'SPRITE_REDGHOST_DOWN_2'
        
        
blueGhostLeftAnimationSprites anop
        dc i2'SPRITE_BLUEGHOST_LEFT_1'
        dc i2'SPRITE_BLUEGHOST_LEFT_2'
        
blueGhostRightAnimationSprites anop
        dc i2'SPRITE_BLUEGHOST_RIGHT_1'
        dc i2'SPRITE_BLUEGHOST_RIGHT_2'
        
blueGhostUpAnimationSprites anop
        dc i2'SPRITE_BLUEGHOST_UP_1'
        dc i2'SPRITE_BLUEGHOST_UP_2'
        
blueGhostDownAnimationSprites anop
        dc i2'SPRITE_BLUEGHOST_DOWN_1'
        dc i2'SPRITE_BLUEGHOST_DOWN_2'
        

pinkGhostLeftAnimationSprites anop
        dc i2'SPRITE_PINKGHOST_LEFT_1'
        dc i2'SPRITE_PINKGHOST_LEFT_2'
        
pinkGhostRightAnimationSprites anop
        dc i2'SPRITE_PINKGHOST_RIGHT_1'
        dc i2'SPRITE_PINKGHOST_RIGHT_2'
        
pinkGhostUpAnimationSprites anop
        dc i2'SPRITE_PINKGHOST_UP_1'
        dc i2'SPRITE_PINKGHOST_UP_2'
        
pinkGhostDownAnimationSprites anop
        dc i2'SPRITE_PINKGHOST_DOWN_1'
        dc i2'SPRITE_PINKGHOST_DOWN_2'


orangeGhostLeftAnimationSprites anop
        dc i2'SPRITE_ORANGEGHOST_LEFT_1'
        dc i2'SPRITE_ORANGEGHOST_LEFT_2'
        
orangeGhostRightAnimationSprites anop
        dc i2'SPRITE_ORANGEGHOST_RIGHT_1'
        dc i2'SPRITE_ORANGEGHOST_RIGHT_2'
        
orangeGhostUpAnimationSprites anop
        dc i2'SPRITE_ORANGEGHOST_UP_1'
        dc i2'SPRITE_ORANGEGHOST_UP_2'
        
orangeGhostDownAnimationSprites anop
        dc i2'SPRITE_ORANGEGHOST_DOWN_1'
        dc i2'SPRITE_ORANGEGHOST_DOWN_2'
        
        
        end
