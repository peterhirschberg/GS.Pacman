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
        using spritesData
        
        
runGhosts entry

        jsr animateGhosts

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
        dc i2'20'
        dc i2'40'
        dc i2'60'

ghostPixelY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostPixelOldX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostPixelOldY anop
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
        dc i2'DIRECTION_RIGHT' ; TODO
        dc i2'DIRECTION_RIGHT' ; TODO
        dc i2'DIRECTION_RIGHT' ; TODO
        dc i2'DIRECTION_RIGHT' ; TODO
        

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
        dc i2'SPRITE_CYANGHOST_LEFT_1'
        dc i2'SPRITE_CYANGHOST_LEFT_2'
        
blueGhostRightAnimationSprites anop
        dc i2'SPRITE_CYANGHOST_RIGHT_1'
        dc i2'SPRITE_CYANGHOST_RIGHT_2'
        
blueGhostUpAnimationSprites anop
        dc i2'SPRITE_CYANGHOST_UP_1'
        dc i2'SPRITE_CYANGHOST_UP_2'
        
blueGhostDownAnimationSprites anop
        dc i2'SPRITE_CYANGHOST_DOWN_1'
        dc i2'SPRITE_CYANGHOST_DOWN_2'
        

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
