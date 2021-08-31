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
        
        lda #0
        sta ghostInTunnel,x
        
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
        
        jsr pickNextDirection
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

        
pickNextDirection entry

; TEMP: just pick a random direction
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
        

drawGhosts entry


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

    jmp startSortedDraw

    rts


	ldx	#6
backup	lda	ghostPixelY,x
	sta	sortedY,x
	dex
	dex
	bpl	backup

	lda	#4
	sta	remainingGhosts
findNextGhost anop
	ldx	#0
	ldy	sortedY
	cpy	sortedY+2
	bcc	c1
	ldx	#2
	ldy	sortedY+2
c1	cpy	sortedY+4
	bcc	c2
	ldx	#4
	ldy	sortedY+4
c2	cpy	sortedY+6
	bcc	c3
	ldx	#6
	ldy	sortedY+6
c3	lda	#$FFFF
	sta	sortedY,x
	lda	ghostPixelX,x
    jsr	drawGhost	; x = ghost to draw, a = ghost x pos, y = ghost y pos

	dec	remainingGhosts
	bne	findNextGhost
    
    
    rts









; sort the ghosts in vertical order, drawing the topmost ghosts first

	lda	ghostPixelY
	sta	sortedY
	lda	ghostPixelY+2
	sta	sortedY+2
	lda	ghostPixelY+4
	sta	sortedY+4
	lda	ghostPixelY+6
	sta	sortedY+6
sortStart anop
	stz	swapped
	ldx	#2
sortNext anop
	lda	sortedY,x
	cmp	sortedY-2,x
	bcs	keepSorting
	ldy	sortedY,x
	lda	sortedY-2,x
	sta	sortedY,x
	tya
	sta	sortedY-2,x
	ldy	ghostDrawOrder,x
	lda	ghostDrawOrder-2,x
	sta	ghostDrawOrder,x
	tya
	sta	ghostDrawOrder-2,x
	inc	swapped
keepSorting anop
	inx
	inx
	cpx	#8
	beq	sortStart

	lda	swapped
	bne	sortNext

sortDone anop


startSortedDraw anop

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
        
sortedY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostCounter dc i2'0'
remainingGhosts dc i2'0'

swapped dc i2'0'

temp dc i2'0'

y1 dc i2'0'
y2 dc i2'0'

sortIndex dc i2'0'

sort1 dc i2'0'
sort2 dc i2'0'

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
        dc i2'64'
        dc i2'64'
        dc i2'64'
        dc i2'64'

ghostPixelY anop
        dc i2'64'
        dc i2'64'
        dc i2'64'
        dc i2'64'

ghostPixelOldX anop
        dc i2'64'
        dc i2'64'
        dc i2'64'
        dc i2'64'

ghostPixelOldY anop
        dc i2'64'
        dc i2'64'
        dc i2'64'
        dc i2'64'
        
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
        dc i2'DIRECTION_RIGHT'
        dc i2'DIRECTION_RIGHT'
        dc i2'DIRECTION_RIGHT'
        dc i2'DIRECTION_RIGHT'

ghostIntendedDirection anop
        dc i2'DIRECTION_RIGHT'
        dc i2'DIRECTION_RIGHT'
        dc i2'DIRECTION_RIGHT'
        dc i2'DIRECTION_RIGHT'

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
        
        
; random directions

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
