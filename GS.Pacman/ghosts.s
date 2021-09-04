;
;  ghosts.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/26/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


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

        ldx currentGhost

        lda ghostPixelX,x
        sta ghostPixelOldX,x
        lda ghostPixelY,x
        sta ghostPixelOldY,x

        jsr setGhostTarget

        jsr runGhostDotCounter
        
        lda #0
        sta ghostInTunnel,x

        lda ghostState,x
        cmp #GHOSTSTATE_PENNED
        beq ghostPenned
        cmp #GHOSTSTATE_LEAVINGPEN
        beq ghostPenned
        bra ghostNotPenned

ghostPenned anop

        jsr pickDirection
        ldx currentGhost
        sta ghostDirection,x
        brl dontPickDirection

ghostNotPenned anop

        lda ghostPixelX,x
        shiftedToPixel
        sta spriteX
        lda ghostPixelY,x
        shiftedToPixel
        sta spriteY
        jsr isSpriteCenteredInMazeTile
        cmp #0
        beq dontPickDirection
        
        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY
        
        jsr getTileFromTileXY
        ldx currentGhost
        cmp #8
        bne notInTunnel

        lda #4 ; ghosts travel half speed when in tunnel
        sta ghostSpeed,x
        
        lda #1
        sta ghostInTunnel,x
        bra dontPickDirection
        
notInTunnel anop

        lda #8
        sta ghostSpeed,x

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        jsr getAvailableDirectionsFromTileXY ; modifies tileX/Y
        sta availableDirections
        
        jsr pickDirection
        ldx currentGhost
        sta ghostDirection,x
        
dontPickDirection anop

        ldx currentGhost
        jsr moveGhost
        
        lda ghostInTunnel,x
        cmp #0
        bne checkTunnel
        rts
        
checkTunnel anop

; wrap if going through tunnel
        lda #64
        cmp ghostPixelX,x
        bcs resetToRight
        lda ghostPixelX,x
        cmp #1728
        bcs resetToLeft
        rts
        
resetToLeft anop
        lda #64
        sta ghostPixelX,x
        rts
        
resetToRight anop
        lda #1728
        sta ghostPixelX,x
        rts


        rts


pickDirection entry

        ldx currentGhost
        lda ghostState,x
        cmp #GHOSTSTATE_PENNED
        beq doPickPennedDirection
        cmp #GHOSTSTATE_LEAVINGPEN
        beq doPickLeavingPenDirection
; chase mode
        jsr ghostPathfindToTarget
; scatter mode
;        jsr pickRandomDirection
        rts
doPickPennedDirection anop
        jsr pickPennedDirection
        rts
doPickLeavingPenDirection anop
        jsr pickLeavingPenDirection
        rts

pickPennedDirection entry
        lda #4
        sta ghostSpeed,x

        lda ghostDirection,x
        cmp #DIRECTION_UP
        beq checkPennedUpDirection
        cmp #DIRECTION_DOWN
        beq checkPennedDownDirection
        rts

checkPennedUpDirection anop
        lda ghostPixelY,x
        cmp #$280
        bcs ghostPennedContinueUp
        lda #DIRECTION_DOWN
        rts
ghostPennedContinueUp anop
        lda ghostDirection,x
        rts

checkPennedDownDirection anop
        lda #$2c0
        cmp ghostPixelY,x
        bcs ghostPennedContinueDown
        lda #DIRECTION_UP
        rts
ghostPennedContinueDown anop
        lda ghostDirection,x
        rts

pickLeavingPenDirection entry
        lda #4
        sta ghostSpeed,x

        lda ghostPixelX,x
        cmp #$360
        bne pennedGoLeftOrRight
        lda #$200
        cmp ghostPixelY,x
        bcs pennedStartChase
        lda #DIRECTION_UP
        rts
pennedGoLeftOrRight anop
        bcs pennedGoLeft
; else go right
        lda #DIRECTION_RIGHT
        rts
pennedGoLeft anop
        lda #DIRECTION_LEFT
        rts
pennedStartChase anop
        lda #GHOSTSTATE_CHASE
        sta ghostState,x
        lda #DIRECTION_LEFT
        rts

pickRandomDirection entry

; Pick a random direction
; Note: ghosts cannot reverse direction (except when changing modes)

        ldx currentGhost

directionLoop anop

        jsr getRandomDir
        
        ldx currentGhost
        
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


runGhostDotCounter entry

        lda ghostDotCounter,x
        cmp #0
        beq runDotCounterContinue
        rts

runDotCounterContinue anop

        lda ghostState,x
        cmp #GHOSTSTATE_PENNED
        beq runDotCounterLeavePen
        rts

runDotCounterLeavePen anop
        lda #GHOSTSTATE_LEAVINGPEN
        sta ghostState,x
        rts


moveGhost entry

        ldx currentGhost

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
        sbc ghostSpeed,x
        sta ghostPixelY,x
        rts

moveGhostDown anop
        lda ghostPixelY,x
        clc
        adc ghostSpeed,x
        sta ghostPixelY,x
        rts

moveGhostLeft anop
        lda ghostPixelX,x
        sec
        sbc ghostSpeed,x
        sta ghostPixelX,x
        rts

moveGhostRight anop
        lda ghostPixelX,x
        clc
        adc ghostSpeed,x
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



setGhostTarget entry

        rts



drawGhosts entry

; Sort the ghosts in vertical order, drawing the topmost ghosts first to minimize flicker
; Thanks to Lucas Scharenbroich, Ian Brumby, and John Brooks for contributing to the sorting algorithm

        lda ghostDrawOrder+0
        sta sort1
        lda ghostDrawOrder+4
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+0
        lda sort2
        sta ghostDrawOrder+4

        lda ghostDrawOrder+2
        sta sort1
        lda ghostDrawOrder+6
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+2
        lda sort2
        sta ghostDrawOrder+6
        
        lda ghostDrawOrder+0
        sta sort1
        lda ghostDrawOrder+2
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+0
        lda sort2
        sta ghostDrawOrder+2

        lda ghostDrawOrder+4
        sta sort1
        lda ghostDrawOrder+6
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+4
        lda sort2
        sta ghostDrawOrder+6
        
        lda ghostDrawOrder+2
        sta sort1
        lda ghostDrawOrder+4
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+2
        lda sort2
        sta ghostDrawOrder+4

        
        lda #0
        sta ghostCounter

drawGhostLoop anop

        lda ghostCounter
        asl a
        tax

        lda ghostDrawOrder,x

        sta currentGhost
        jsr drawGhost

        inc ghostCounter
        lda ghostCounter
        cmp #4
        beq drawGhostDone
        bra drawGhostLoop
        
drawGhostDone anop

        rts
        

        
drawGhost entry

        lda currentGhost
        tax

        lda ghostPixelX,x
        shiftedToPixel
        sta spriteX
        lda ghostPixelY,x
        shiftedToPixel
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
        shiftedToPixel
        sta spriteX
        lda ghostPixelOldY,x
        shiftedToPixel
        sta spriteY

        jsr eraseSpriteRect
        
        rts
        

getRandomDir entry
        inc randomDirIndex
        lda randomDirIndex
        cmp #255
        bne dontResetRandomDirIndex
        lda #0
        sta randomDirIndex
dontResetRandomDirIndex anop
        ldx currentGhost
        lda ghostDirection,x
        cmp #DIRECTION_RIGHT
        beq getNotLeft
        cmp #DIRECTION_DOWN
        beq getNotUp
        cmp #DIRECTION_LEFT
        beq getNotRight
        cmp #DIRECTION_UP
        beq getNotDown
        
        tax
        brk
        rts

getNotRight anop
        lda randomDirIndex
        asl a
        tax
        lda randomDirectionNotRight,x
        rts

getNotDown anop
        lda randomDirIndex
        asl a
        tax
        lda randomDirectionNotDown,x
        rts

getNotLeft anop
        lda randomDirIndex
        asl a
        tax
        lda randomDirectionNotLeft,x
        rts

getNotUp anop
        lda randomDirIndex
        asl a
        tax
        lda randomDirectionNotUp,x
        rts


decrementGhostDotCounters entry

        ldy #GHOSTINDEX_BLUE
        lda ghostState,y
        cmp #GHOSTSTATE_PENNED
        beq decDotCounter

        ldy #GHOSTINDEX_ORANGE
        lda ghostState,y
        cmp #GHOSTSTATE_PENNED
        beq decDotCounter

        rts

decDotCounter anop

        lda ghostDotCounter,y
        cmp #0
        beq decDotCounterDone
        lda ghostDotCounter,y
        sec
        sbc #1
        sta ghostDotCounter,y
        rts

decDotCounterDone anop
        rts



ghostPathfindToTarget entry

        ldx currentGhost

; store the target XY

        lda ghostTargetX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta targetX
        lda ghostTargetY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta targetY

; get available directions

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        sta currentTileX
        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY
        sta currentTileY

        jsr getAvailableDirectionsFromTileXY
        sta availableDirections

; init available directions table

        ldy #0
        lda #DIRECTION_NONE
        sta testTargetDirection,y
        ldy #2
        lda #DIRECTION_NONE
        sta testTargetDirection,y
        ldy #4
        lda #DIRECTION_NONE
        sta testTargetDirection,y
        ldy #6
        lda #DIRECTION_NONE
        sta testTargetDirection,y

; set the tileXY in each direction

; up
        ldy #0
        lda currentTileX
        sta testTargetTileX,y
        lda currentTileY
        dec a
        sta testTargetTileY,y

; down
        ldy #2
        lda currentTileX
        sta testTargetTileX,y
        lda currentTileY
        inc a
        sta testTargetTileY,y


; left
        ldy #4
        lda currentTileX
        dec a
        sta testTargetTileX,y
        lda currentTileY
        sta testTargetTileY,y

; right
        ldy #6
        lda currentTileX
        inc a
        sta testTargetTileX,y
        lda currentTileY
        sta testTargetTileY,y

; set availability table for each direction

; up
        ldy #0
        lda availableDirections
        and #AVAILABLEDIR_UP
        cmp #0
        beq upNotAvailable
        lda #DIRECTION_UP
        sta testTargetDirection,y

upNotAvailable anop

; down
        ldy #0
        lda availableDirections
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq downNotAvailable
        lda #DIRECTION_DOWN
        sta testTargetDirection,y

downNotAvailable anop

; left
        ldy #0
        lda availableDirections
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq leftNotAvailable
        lda #DIRECTION_LEFT
        sta testTargetDirection,y

leftNotAvailable anop

; right
        ldy #0
        lda availableDirections
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq rightNotAvailable
        lda #DIRECTION_RIGHT
        sta testTargetDirection,y

rightNotAvailable anop

; measure distances in each direction

        lda #$fff0
        sta smallestDistance

        ldy #0

distanceLoop anop

        lda testTargetTileX,y
        sta tileX
        lda testTargetTileY,y
        sta tileY

; calculate the distance to target from this XY

        lda targetX

        lda targetX
        sec
        sbc testTargetTileX,y
        sta dx

        lda targetY
        sec
        sbc testTargetTileY,y
        sta dy


; CALL INTO C FUNCTION TO DO A FIXED POINT DIVISION TO GET THE DISTANCE
        lda dx
        pha
        lda dy
        pha
        jsl fpDivide
        sta distanceXY

        lda smallestDistance
        cmp distanceXY
        bcs distanceIsSmaller
        bra distancIsLarger

distanceIsSmaller anop

; set new smallest value and index
        lda distanceXY
        sta smallestDistance
        tya
        sta smallestDistanceIndex

distancIsLarger anop

        iny
        iny
        tya
        cmp #6
        bcc distanceDone
        bra distanceLoop

distanceDone anop

; get the direction with the smallest distance
        ldy smallestDistanceIndex
        lda testTargetDirection,y

        rts



        
currentGhost dc i2'0'

reverseDirection dc i2'0'

ghostAnimationIndex dc i2'0'
ghostAnimationTimer dc i2'0'

availableDirections dc i2'0'

ghostDrawOrder anop
        dc i2'GHOSTINDEX_RED'
        dc i2'GHOSTINDEX_PINK'
        dc i2'GHOSTINDEX_BLUE'
        dc i2'GHOSTINDEX_ORANGE'
        
ghostCounter dc i2'0'

sort1 dc i2'0'
sort2 dc i2'0'

currentPixelX dc i2'0'
currentPixelY dc i2'0'

targetX dc i2'0'
targetY dc i2'0'

currentTileX dc i2'0'
currentTileY dc i2'0'

testTargetTileX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

testTargetTileY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

testTargetPixelX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

testTargetPixelY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

testTargetDirection anop
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'

testTargetDistance anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

smallestDistance dc i2'0'
smallestDistanceIndex dc i2'0'

dx dc i2'0'
dy dc i2'0'
distanceXY dc i2'0'

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
GHOSTSTATE_LEAVINGPEN   gequ 5


ghostPixelX anop
        dc i2'$340'
        dc i2'$360'
        dc i2'$2e0'
        dc i2'$3e0'

ghostPixelY anop
        dc i2'$200'
        dc i2'$280'
        dc i2'$280'
        dc i2'$280'

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
        
ghostTargetX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostTargetY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostState anop
        dc i2'GHOSTSTATE_CHASE'
        dc i2'GHOSTSTATE_LEAVINGPEN'
        dc i2'GHOSTSTATE_PENNED'
        dc i2'GHOSTSTATE_PENNED'

ghostDirection anop
        dc i2'DIRECTION_LEFT'
        dc i2'DIRECTION_UP'
        dc i2'DIRECTION_UP'
        dc i2'DIRECTION_UP'

ghostSpeed anop
        dc i2'8'
        dc i2'8'
        dc i2'8'
        dc i2'8'
        
ghostInTunnel anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostDotCounter anop
        dc i2'0'
        dc i2'0'
        dc i2'20'
        dc i2'40'

        
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
        
        
        
sortTable anop
        dc i2'6,4,2,0'
        dc i2'6,4,0,2'
        dc i2'6,2,0,4'
        dc i2'4,2,0,6'
        dc i2'6,2,4,0'
        dc i2'2,0,4,6'
        dc i2'4,0,6,2'
        dc i2'2,4,6,0'
        dc i2'4,2,6,0'
        dc i2'4,6,0,2'
        dc i2'0,2,4,6'
        dc i2'0,6,2,4'
        dc i2'4,0,2,6'
        dc i2'6,0,2,4'
        dc i2'2,0,6,4'
        dc i2'0,2,6,4'
        dc i2'2,6,4,0'
        dc i2'0,4,6,2'
        dc i2'0,4,2,6'
        dc i2'4,6,2,0'
        dc i2'6,0,4,2'
        dc i2'2,4,0,6'
        dc i2'2,6,0,4'
        dc i2'0,6,4,2'
        
        
        
; Precalculated pseudo-random directions -
; For performance reasons the values are calculated to be non-repeating and each
; table is random directions excluding the reverse direction since the ghosts
; cannot reverse directions under normal circumstances


randomDirIndex dc i2'0'

randomDirectionNotRight anop
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'


randomDirectionNotLeft anop
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'


randomDirectionNotUp anop
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'


randomDirectionNotDown anop
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'

        
        end
