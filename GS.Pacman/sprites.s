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
; PDHTODO is this 4 pixel offset correct?
        sec
        sbc #4
        sta spriteX
        
        lda spriteY
        clc
        adc #MAZE_OFFSET_Y
; PDHTODO is this 4 pixel offset correct?
        sec
        sbc #4
        sta spriteY

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
        

eraseSpriteRect entry

        jsr translateSpritePosToMazePos

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
SPRITE_FLEEGHOST_1      gequ 28*4
SPRITE_FLEEGHOST_2      gequ 29*4
SPRITE_PINKGHOST_RIGHT_1 gequ 30*4
SPRITE_PINKGHOST_RIGHT_2 gequ 31*4
SPRITE_PINKGHOST_LEFT_1 gequ 32*4
SPRITE_PINKGHOST_LEFT_2 gequ 33*4
SPRITE_PINKGHOST_DOWN_1 gequ 34*4
SPRITE_PINKGHOST_DOWN_2 gequ 35*4
SPRITE_PINKGHOST_UP_1   gequ 36*4
SPRITE_PINKGHOST_UP_2   gequ 37*4
SPRITE_FLEEBLINKGHOST_1 gequ 38*4
SPRITE_FLEEBLINKGHOST_2 gequ 39*4
SPRITE_BLUEGHOST_RIGHT_1 gequ 40*4
SPRITE_BLUEGHOST_RIGHT_2 gequ 41*4
SPRITE_BLUEGHOST_LEFT_1 gequ 42*4
SPRITE_BLUEGHOST_LEFT_2 gequ 43*4
SPRITE_BLUEGHOST_DOWN_1 gequ 44*4
SPRITE_BLUEGHOST_DOWN_2 gequ 45*4
SPRITE_BLUEGHOST_UP_1   gequ 46*4
SPRITE_BLUEGHOST_UP_2   gequ 47*4
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
SPRITE_MELON            gequ 64*4
SPRITE_GALAX            gequ 65*4
SPRITE_BELL             gequ 66*4
SPRITE_KEY              gequ 67*4
SPRITE_LIFE             gequ 68*4
SPRITE_PAC_DIE_11       gequ 69*4
SPRITE_200              gequ 70*4
SPRITE_400              gequ 71*4
SPRITE_800              gequ 72*4
SPRITE_1600L            gequ 73*4
SPRITE_1600R            gequ 74*4
SPRITE_PAC_FULL_3       gequ 75*4
SPRITE_FLEEGHOST_ODD_1  gequ 76*4
SPRITE_FLEEGHOST_ODD_2  gequ 77*4

SPRITE_1                gequ 78*4
SPRITE_THOUSANDS        gequ 79*4
SPRITE_100            gequ 80*4
SPRITE_300            gequ 81*4
SPRITE_500            gequ 82*4
SPRITE_700            gequ 83*4

SPRITE_BLANK            gequ 84*4

SPRITE_2            gequ 85*4
SPRITE_3            gequ 86*4
SPRITE_5            gequ 87*4

SPRITE_NOP             gequ 88*4


spriteX dc i2'0'
spriteY dc i2'0'

spriteColor dc i2'0'
spriteLowColor dc i2'0'
spriteHighColor dc i2'0'
spriteBothColor dc i2'0'


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
        dc i4'drawSprite76'
        dc i4'drawSprite77'
        dc i4'drawSprite78'
        dc i4'drawSprite79'
        dc i4'drawSprite80'
        dc i4'drawSprite81'
        dc i4'drawSprite82'
        dc i4'drawSprite83'
        dc i4'drawSpriteBlank'

        dc i4'drawSprite85'
        dc i4'drawSprite86'
        dc i4'drawSprite87'
        
        dc i4'drawSpriteNop'


        end
