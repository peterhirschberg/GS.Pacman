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
        sbc #4
        sta spriteY

        rts
        

drawSprites entry

; TODO

        rts


        
; Thanks to Ian Brumby and John Brooks for this lookup routine
drawSpriteByIndex entry
        tax
        jsr translateSpritePosToMazePos
        lda drawSpriteTable,x
        sta callDrawSprite+1
        lda drawSpriteTable+1,x
        sta callDrawSprite+2
callDrawSprite anop
        jsl $FFFFFF
        rts
        

; DELETE
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
        lda #8
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
        
        
; DELETE
eraseSprites entry

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

testX dc i2'8'
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
SPRITE_PAC_DOWN_1       gequ 3*4
SPRITE_PAC_DOWN_2       gequ 4*4
SPRITE_PAC_LEFT_1       gequ 5*4
SPRITE_PAC_LEFT_2       gequ 6*4
SPRITE_PAC_FULL_2       gequ 7*4
SPRITE_PAC_UP_1         gequ 8*4
SPRITE_PAC_UP_2         gequ 9*4
SPRITE_PAC_DIE_1        gequ 10*4
SPRITE_PAC_DIE_2        gequ 11*4
SPRITE_PAC_DIE_3        gequ 12*4
SPRITE_PAC_DIE_4        gequ 13*4
SPRITE_PAC_DIE_5        gequ 14*4
SPRITE_PAC_DIE_6        gequ 15*4
SPRITE_PAC_DIE_7        gequ 16*4
SPRITE_PAC_DIE_8        gequ 17*4
SPRITE_PAC_DIE_9        gequ 18*4
SPRITE_PAC_DIE_10       gequ 19*4
SPRITE_REDGHOST_RIGHT_1 gequ 20*4
SPRITE_REDGHOST_RIGHT_2 gequ 21*4
SPRITE_REDGHOST_LEFT_1  gequ 22*4
SPRITE_REDGHOST_LEFT_2  gequ 23*4
SPRITE_REDGHOST_DOWN_1  gequ 24*4
SPRITE_REDGHOST_DOWN_2  gequ 25*4
SPRITE_REDGHOST_UP_1    gequ 26*4
SPRITE_REDGHOST_UP_2    gequ 27*4
SPRITE_BLUEGHOST_1      gequ 28*4
SPRITE_BLUEGHOST_2      gequ 29*4
SPRITE_PINKGHOST_RIGHT_1 gequ 30*4
SPRITE_PINKGHOST_RIGHT_2 gequ 31*4
SPRITE_PINKGHOST_LEFT_1 gequ 32*4
SPRITE_PINKGHOST_LEFT_2 gequ 33*4
SPRITE_PINKGHOST_DOWN_1 gequ 34*4
SPRITE_PINKGHOST_DOWN_2 gequ 35*4
SPRITE_PINKGHOST_UP_1   gequ 36*4
SPRITE_PINKGHOST_UP_2   gequ 37*4
SPRITE_WHITEGHOST_1      gequ 38*4
SPRITE_WHITEGHOST_2      gequ 39*4
SPRITE_CYANGHOST_RIGHT_1 gequ 40*4
SPRITE_CYANGHOST_RIGHT_2 gequ 41*4
SPRITE_CYANGHOST_LEFT_1 gequ 42*4
SPRITE_CYANGHOST_LEFT_2 gequ 43*4
SPRITE_CYANGHOST_DOWN_1 gequ 44*4
SPRITE_CYANGHOST_DOWN_2 gequ 45*4
SPRITE_CYANGHOST_UP_1   gequ 46*4
SPRITE_CYANGHOST_UP_2   gequ 47*4
SPRITE_EYES_RIGHT       gequ 48*4
SPRITE_EYES_LEFT        gequ 49*4
SPRITE_ORANGEGHOST_RIGHT_1  gequ 50*4
SPRITE_ORANGEGHOST_RIGHT_2  gequ 51*4
SPRITE_ORANGEGHOST_LEFT_1   gequ 52*4
SPRITE_ORANGEGHOST_LEFT_2   gequ 53*4
SPRITE_ORANGEGHOST_DOWN_1   gequ 54*4
SPRITE_ORANGEGHOST_DOWN_2   gequ 55*4
SPRITE_ORANGEGHOST_UP_1     gequ 56*4
SPRITE_ORANGEGHOST_UP_2     gequ 57*4
SPRITE_EYES_DOWN            gequ 58*4
SPRITE_EYES_UP          gequ 59*4
SPRITE_CHERRY           gequ 60*4
SPRITE_STRAWBERRY       gequ 61*4
SPRITE_PEACH            gequ 62*4
SPRITE_APPLE            gequ 63*4
SPRITE_PINAPPLE         gequ 64*4
SPRITE_GALAX            gequ 65*4
SPRITE_BELL             gequ 66*4
SPRITE_KEY              gequ 67*4
SPRITE_MAZEDOOR         gequ 68*4
SPRITE_PAC_DIE_11       gequ 69*4
SPRITE_200              gequ 70*4
SPRITE_400              gequ 71*4
SPRITE_800              gequ 72*4
SPRITE_1600L            gequ 73*4
SPRITE_1600R            gequ 74*4
SPRITE_PAC_FULL_3       gequ 75*4


spriteX dc i2'0'
spriteY dc i2'0'


drawSpriteTable anop
        dc i4'drawSprite0'
        dc i4'drawSprite1'
        dc i4'drawSprite2'
        dc i4'drawSprite3'
        dc i4'drawSprite4'
        dc i4'drawSprite5'
        dc i4'drawSprite6'
        dc i4'drawSprite7'
        dc i4'drawSprite8'
        dc i4'drawSprite9'
        dc i4'drawSprite10'
        dc i4'drawSprite11'
        dc i4'drawSprite12'
        dc i4'drawSprite13'
        dc i4'drawSprite14'
        dc i4'drawSprite15'
        dc i4'drawSprite16'
        dc i4'drawSprite17'
        dc i4'drawSprite18'
        dc i4'drawSprite19'
        dc i4'drawSprite20'
        dc i4'drawSprite21'
        dc i4'drawSprite22'
        dc i4'drawSprite23'
        dc i4'drawSprite24'
        dc i4'drawSprite25'
        dc i4'drawSprite26'
        dc i4'drawSprite27'
        dc i4'drawSprite28'
        dc i4'drawSprite29'
        dc i4'drawSprite30'
        dc i4'drawSprite31'
        dc i4'drawSprite32'
        dc i4'drawSprite33'
        dc i4'drawSprite34'
        dc i4'drawSprite35'
        dc i4'drawSprite36'
        dc i4'drawSprite37'
        dc i4'drawSprite38'
        dc i4'drawSprite39'
        dc i4'drawSprite40'
        dc i4'drawSprite41'
        dc i4'drawSprite42'
        dc i4'drawSprite43'
        dc i4'drawSprite44'
        dc i4'drawSprite45'
        dc i4'drawSprite46'
        dc i4'drawSprite47'
        dc i4'drawSprite48'
        dc i4'drawSprite49'
        dc i4'drawSprite50'
        dc i4'drawSprite51'
        dc i4'drawSprite52'
        dc i4'drawSprite53'
        dc i4'drawSprite54'
        dc i4'drawSprite55'
        dc i4'drawSprite56'
        dc i4'drawSprite57'
        dc i4'drawSprite58'
        dc i4'drawSprite59'
        dc i4'drawSprite60'
        dc i4'drawSprite61'
        dc i4'drawSprite62'
        dc i4'drawSprite63'
        dc i4'drawSprite64'
        dc i4'drawSprite65'
        dc i4'drawSprite66'
        dc i4'drawSprite67'
        dc i4'drawSprite68'
        dc i4'drawSprite69'
        dc i4'drawSprite70'
        dc i4'drawSprite71'
        dc i4'drawSprite72'
        dc i4'drawSprite73'
        dc i4'drawSprite74'
        dc i4'drawSprite75'

        
        end
