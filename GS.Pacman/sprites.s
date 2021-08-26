;
;  sprites.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/21/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global

sprites start
        using globalData
        using mazeData
        using spritesData

        
translateSpritePosToMazePos entry

        lda #MAZE_OFFSET_X
        asl a
        clc
        adc spriteX
        sec
        sbc #4
        sta spriteX
        
        lda spriteY
        clc
        adc #MAZE_OFFSET_Y
        sec
        sbc #8
        sta spriteY

        rts
        

drawSprites entry

;        jsr drawSprite


        lda #10
        sta spriteX
        lda #10
        sta spriteY

        lda #SPRITE_PAC_RIGHT_1
        jsr drawSpriteByIndex

        lda #10
        sta spriteX
        lda #30
        sta spriteY

        lda #SPRITE_PAC_RIGHT_2
        jsr drawSpriteByIndex

        lda #10
        sta spriteX
        lda #50
        sta spriteY

        lda #SPRITE_PAC_FULL_1
        jsr drawSpriteByIndex

        
        rts


        

drawSpriteByIndex entry
        tax
        lda drawSpriteTable,x
        sta callDrawSprite+1
        lda drawSpriteTable+1,x
        sta callDrawSprite+2
callDrawSprite anop
        jsl $FFFFFF
        rts
        
        

drawSpritePacman entry

        lda #48
        sta spriteX
        lda #45
        sta spriteY

        jsr translateSpritePosToMazePos
        
        lda pacstate
        cmp #0
        beq pacstate0
        cmp #1
        beq pacstate1
        cmp #2
        beq pacstate2
        cmp #3
        beq pacstate3
        bra pacdone

pacstate0 anop
        jsl drawSprite0
        bra pacdone
pacstate1 anop
        jsl drawSprite1
        bra pacdone
pacstate2 anop
        jsl drawSprite2
        bra pacdone
pacstate3 anop
        jsl drawSprite1
        bra pacdone

pacdone anop

        dec pactimer
        lda pactimer
        bmi incpac
        rts
        
incpac anop

        lda #2
        sta pactimer

        inc pacstate
        lda pacstate
        cmp #4
        beq resetState
        rts
        
resetState anop
        lda #0
        sta pacstate
        
        rts
        

drawSpriteGhost entry

        lda testX
        sta spriteX
        lda #12
        sta spriteY
        
        jsr translateSpritePosToMazePos
        jsl drawSprite20
        
        lda testX
        sta oldX

        inc testX
        inc testX
        lda testX
        cmp #200
        bcs wrapX
        bra next1
        
wrapX anop
        lda #0
        sta testX
        
next1 anop

        lda #92
        sta spriteX
        lda ghost2Y
        sta spriteY

        jsr translateSpritePosToMazePos
        jsl drawSprite30
        
        lda #108
        sta spriteX
        lda ghost3Y
        sta spriteY

        jsr translateSpritePosToMazePos
        jsl drawSprite40

        lda #124
        sta spriteX
        lda ghost4Y
        sta spriteY

        jsr translateSpritePosToMazePos
        jsl drawSprite50

        
        lda ghost2Y
        sta ghost2OldY

        lda ghost3Y
        sta ghost3OldY

        lda ghost4Y
        sta ghost4OldY

        
        lda ghost2Y
        clc
        adc ghost2Dir
        sta ghost2Y

        lda ghost3Y
        clc
        adc ghost3Dir
        sta ghost3Y

        lda ghost4Y
        clc
        adc ghost4Dir
        sta ghost4Y

        
        
        lda ghost2Y
        cmp #94
        beq ghost2Up
        
        lda ghost2Y
        cmp #82
        beq ghost2Down
        bra ghost3
        
ghost2Up anop
        lda #-1
        sta ghost2Dir
        bra ghost3

ghost2Down anop
        lda #1
        sta ghost2Dir
        
ghost3 anop





        lda ghost3Y
        cmp #94
        beq ghost3Up
        
        lda ghost3Y
        cmp #82
        beq ghost3Down
        bra ghost4
        
ghost3Up anop
        lda #-1
        sta ghost3Dir
        bra ghost4

ghost3Down anop
        lda #1
        sta ghost3Dir
        
ghost4 anop





        lda ghost4Y
        cmp #94
        beq ghost4Up
        
        lda ghost4Y
        cmp #82
        beq ghost4Down
        bra ghost5
        
ghost4Up anop
        lda #-1
        sta ghost4Dir
        bra ghost5

ghost4Down anop
        lda #1
        sta ghost4Dir
        
ghost5 anop



        rts
        
        
eraseSprites entry

; pacman

        lda #48
        sta spriteX
        lda #45
        sta spriteY

        jsr translateSpritePosToMazePos
        jsr eraseSpriteRect

; ghosts

        lda oldX
        sta spriteX
        lda #12
        sta spriteY

        jsr translateSpritePosToMazePos
        jsr eraseSpriteRect
        

        lda #92
        sta spriteX
        lda ghost2OldY
        sta spriteY
        
        jsr translateSpritePosToMazePos
        jsr eraseSpriteRect

        
        lda #108
        sta spriteX
        lda ghost3OldY
        sta spriteY
        
        jsr translateSpritePosToMazePos
        jsr eraseSpriteRect

        
        lda #124
        sta spriteX
        lda ghost4OldY
        sta spriteY
        
        jsr translateSpritePosToMazePos
        jsr eraseSpriteRect

        
        rts



eraseSpriteRect entry

        lda spriteX
        lsr a
        sta spriteX

        lda spriteY
        asl a
        tax
        lda screenRowOffsets,x
        clc
        adc spriteX
        sta screenRowAddress
        tax

; ----------------------------------------

        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx

        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inx
        inx

        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inx
        inx

        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

; ----------------------------------------

        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax

        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
; ----------------------------------------
        
        lda screenRowAddress
        clc
        adc #160
        sta screenRowAddress
        tax
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inx
        inx
        
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        rts
        


spritePixels dc i2'0'

rowCounter dc i2'0'
colCounter dc i2'0'

spriteRowAddress dc i4'0'
screenRowAddress dc i4'0'

screenCounter dc i4'0'
dataCounter dc i4'0'

tileSrcX dc i2'0'
tileSrcY dc i2'0'

tileDstX dc i2'0'
tileDstY dc i2'0'

testX dc i2'0'
oldX dc i2'0'

ghost2Y dc i2'80'
ghost3Y dc i2'85'
ghost4Y dc i2'82'

ghost2OldY dc i2'85'
ghost3OldY dc i2'85'
ghost4OldY dc i2'84'

ghost2Dir dc i2'1'
ghost3Dir dc i2'-1'
ghost4Dir dc i2'1'

pacstate dc i2'0'
pactimer dc i2'0'


        end

spritesData data

    
SPRITE_PAC_RIGHT_1      gequ 0*4
SPRITE_PAC_RIGHT_2      gequ 1*4
SPRITE_PAC_FULL_1       gequ 2*4
SPRITE_PAC_DOWN_1       gequ 0
SPRITE_PAC_DOWN_2       gequ 1
SPRITE_PAC_LEFT_1       gequ 0
SPRITE_PAC_LEFT_2       gequ 1
SPRITE_PAC_FULL_2       gequ 2
SPRITE_PAC_UP_1         gequ 0
SPRITE_PAC_UP_2         gequ 1
SPRITE_PAC_DIE_1        gequ 0
SPRITE_PAC_DIE_2        gequ 1
SPRITE_PAC_DIE_3        gequ 1
SPRITE_PAC_DIE_4        gequ 1
SPRITE_PAC_DIE_5        gequ 1
SPRITE_PAC_DIE_6        gequ 1
SPRITE_PAC_DIE_7        gequ 1
SPRITE_PAC_DIE_8        gequ 1
SPRITE_PAC_DIE_9        gequ 1
SPRITE_PAC_DIE_10       gequ 1
SPRITE_REDGHOST_RIGHT_1 gequ 0
SPRITE_REDGHOST_RIGHT_2 gequ 0
SPRITE_REDGHOST_LEFT_1 gequ 0
SPRITE_REDGHOST_LEFT_2 gequ 0
SPRITE_REDGHOST_DOWN_1 gequ 0
SPRITE_REDGHOST_DOWN_2 gequ 0
SPRITE_REDGHOST_UP_1 gequ 0
SPRITE_REDGHOST_UP_2 gequ 0
SPRITE_BLUEGHOST_1      gequ 0
SPRITE_BLUEGHOST_2      gequ 0
SPRITE_PINKGHOST_RIGHT_1 gequ 0
SPRITE_PINKGHOST_RIGHT_2 gequ 0
SPRITE_PINKGHOST_LEFT_1 gequ 0
SPRITE_PINKGHOST_LEFT_2 gequ 0
SPRITE_PINKGHOST_DOWN_1 gequ 0
SPRITE_PINKGHOST_DOWN_2 gequ 0
SPRITE_PINKGHOST_UP_1 gequ 0
SPRITE_PINKGHOST_UP_2 gequ 0
SPRITE_WHITEGHOST_1      gequ 0
SPRITE_WHITEGHOST_2      gequ 0
SPRITE_CYANGHOST_RIGHT_1 gequ 0
SPRITE_CYANGHOST_RIGHT_2 gequ 0
SPRITE_CYANGHOST_LEFT_1 gequ 0
SPRITE_CYANGHOST_LEFT_2 gequ 0
SPRITE_CYANGHOST_DOWN_1 gequ 0
SPRITE_CYANGHOST_DOWN_2 gequ 0
SPRITE_CYANGHOST_UP_1 gequ 0
SPRITE_CYANGHOST_UP_2 gequ 0
SPRITE_EYES_RIGHT      gequ 0
SPRITE_EYES_LEFT      gequ 0
SPRITE_ORANGEGHOST_RIGHT_1 gequ 0
SPRITE_ORANGEGHOST_RIGHT_2 gequ 0
SPRITE_ORANGEGHOST_LEFT_1 gequ 0
SPRITE_ORANGEGHOST_LEFT_2 gequ 0
SPRITE_ORANGEGHOST_DOWN_1 gequ 0
SPRITE_ORANGEGHOST_DOWN_2 gequ 0
SPRITE_ORANGEGHOST_UP_1 gequ 0
SPRITE_ORANGEGHOST_UP_2 gequ 0
SPRITE_EYES_DOWN      gequ 0
SPRITE_EYES_UP      gequ 0
SPRITE_CHERRY      gequ 0
SPRITE_STRAWBERRY      gequ 0
SPRITE_PEACH      gequ 0
SPRITE_APPLE      gequ 0
SPRITE_PINAPPLE      gequ 0
SPRITE_GALAX      gequ 0
SPRITE_BELL      gequ 0
SPRITE_KEY      gequ 0
SPRITE_MAZEDOOR      gequ 0
SPRITE_PAC_DIE_11      gequ 0
SPRITE_200      gequ 0
SPRITE_400      gequ 0
SPRITE_800      gequ 0
SPRITE_1600L      gequ 0
SPRITE_1600R      gequ 0


spriteX dc i2'0'
spriteY dc i2'0'


drawSpriteTable anop
        dc i4'drawSprite0'
        dc i4'drawSprite1'
        dc i4'drawSprite2'

        end
