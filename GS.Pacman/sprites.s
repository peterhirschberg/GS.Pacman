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

        rts



drawSpritePacman entry

        lda #45
        sta spriteX
        lda #45
        sta spriteY

        jsr translateSpritePosToMazePos
        jsl drawSprite0
        
        
        lda spriteY
        clc
        adc #20
        sta spriteY
        
        jsr translateSpritePosToMazePos
        jsl drawSprite30

        lda spriteY
        clc
        adc #30
        sta spriteY
        
        jsr translateSpritePosToMazePos
        jsl drawSprite40

        lda spriteY
        clc
        adc #40
        sta spriteY
        
        jsr translateSpritePosToMazePos
        jsl drawSprite40
        
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
        rts
        
wrapX anop
        lda #0
        sta testX

        rts
        
        
eraseSprites entry

        lda #0
        sta tileSrcX
        lda #64
        sta tileSrcY

        lda oldX
        sta tileDstX
        lda #12
        sta tileDstY

        lda tileDstX
        sta spriteX
        lda tileDstY
        sta spriteY

        jsr translateSpritePosToMazePos

        jsr eraseSpriteRect
        
        rts



eraseSpriteRect entry

        lda spriteX
        lsr a
        sta spriteX

        lda #0
        sta rowCounter

eraseVLoop anop

        lda rowCounter
        clc
        adc spriteY
        asl a
        tax
        lda screenRowOffsets,x
        clc
        adc spriteX
        sta screenCounter

; ----------------------------------------

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x
        
        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

; ----------------------------------------

        inc rowCounter
        lda rowCounter
        cmp #16
        beq eraseDone
        brl eraseVLoop

eraseDone anop

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

spriteSheetRowOffsets anop
        dc i2'$0'
        dc i2'$50'
        dc i2'$a0'
        dc i2'$f0'
        dc i2'$140'
        dc i2'$190'
        dc i2'$1e0'
        dc i2'$230'
        dc i2'$280'
        dc i2'$2d0'
        dc i2'$320'
        dc i2'$370'
        dc i2'$3c0'
        dc i2'$410'
        dc i2'$460'
        dc i2'$4b0'
        dc i2'$500'
        dc i2'$550'
        dc i2'$5a0'
        dc i2'$5f0'
        dc i2'$640'
        dc i2'$690'
        dc i2'$6e0'
        dc i2'$730'
        dc i2'$780'
        dc i2'$7d0'
        dc i2'$820'
        dc i2'$870'
        dc i2'$8c0'
        dc i2'$910'
        dc i2'$960'
        dc i2'$9b0'
        dc i2'$a00'
        dc i2'$a50'
        dc i2'$aa0'
        dc i2'$af0'
        dc i2'$b40'
        dc i2'$b90'
        dc i2'$be0'
        dc i2'$c30'
        dc i2'$c80'
        dc i2'$cd0'
        dc i2'$d20'
        dc i2'$d70'
        dc i2'$dc0'
        dc i2'$e10'
        dc i2'$e60'
        dc i2'$eb0'
        dc i2'$f00'
        dc i2'$f50'
        dc i2'$fa0'
        dc i2'$ff0'
        dc i2'$1040'
        dc i2'$1090'
        dc i2'$10e0'
        dc i2'$1130'
        dc i2'$1180'
        dc i2'$11d0'
        dc i2'$1220'
        dc i2'$1270'
        dc i2'$12c0'
        dc i2'$1310'
        dc i2'$1360'
        dc i2'$13b0'
        dc i2'$1400'
        dc i2'$1450'
        dc i2'$14a0'
        dc i2'$14f0'
        dc i2'$1540'
        dc i2'$1590'
        dc i2'$15e0'
        dc i2'$1630'
        dc i2'$1680'
        dc i2'$16d0'
        dc i2'$1720'
        dc i2'$1770'
        dc i2'$17c0'
        dc i2'$1810'
        dc i2'$1860'
        dc i2'$18b0'
        dc i2'$1900'
        dc i2'$1950'
        dc i2'$19a0'
        dc i2'$19f0'
        dc i2'$1a40'
        dc i2'$1a90'
        dc i2'$1ae0'
        dc i2'$1b30'
        dc i2'$1b80'
        dc i2'$1bd0'
        dc i2'$1c20'
        dc i2'$1c70'
        dc i2'$1cc0'
        dc i2'$1d10'
        dc i2'$1d60'
        dc i2'$1db0'
        dc i2'$1e00'
        dc i2'$1e50'
        dc i2'$1ea0'
        dc i2'$1ef0'
        dc i2'$1f40'
        dc i2'$1f90'
        dc i2'$1fe0'
        dc i2'$2030'
        dc i2'$2080'
        dc i2'$20d0'
        dc i2'$2120'
        dc i2'$2170'
        dc i2'$21c0'
        dc i2'$2210'
        dc i2'$2260'
        dc i2'$22b0'
        dc i2'$2300'
        dc i2'$2350'
        dc i2'$23a0'
        dc i2'$23f0'
        dc i2'$2440'
        dc i2'$2490'
        dc i2'$24e0'
        dc i2'$2530'
        dc i2'$2580'
        dc i2'$25d0'
        dc i2'$2620'
        dc i2'$2670'
        dc i2'$26c0'
        dc i2'$2710'
        dc i2'$2760'
        dc i2'$27b0'
        dc i2'$2800'
        dc i2'$2850'
        dc i2'$28a0'
        dc i2'$28f0'
        dc i2'$2940'
        dc i2'$2990'
        dc i2'$29e0'
        dc i2'$2a30'
        dc i2'$2a80'
        dc i2'$2ad0'
        dc i2'$2b20'
        dc i2'$2b70'
        dc i2'$2bc0'
        dc i2'$2c10'
        dc i2'$2c60'
        dc i2'$2cb0'
        dc i2'$2d00'
        dc i2'$2d50'
        dc i2'$2da0'
        dc i2'$2df0'
        dc i2'$2e40'
        dc i2'$2e90'
        dc i2'$2ee0'
        dc i2'$2f30'
        dc i2'$2f80'
        dc i2'$2fd0'
        dc i2'$3020'
        dc i2'$3070'
        dc i2'$30c0'
        dc i2'$3110'
        dc i2'$3160'
        dc i2'$31b0'
        dc i2'$3200'
        dc i2'$3250'
        dc i2'$32a0'
        dc i2'$32f0'
        dc i2'$3340'
        dc i2'$3390'
        dc i2'$33e0'
        dc i2'$3430'
        dc i2'$3480'
        dc i2'$34d0'
        dc i2'$3520'
        dc i2'$3570'
        dc i2'$35c0'
        dc i2'$3610'
        dc i2'$3660'
        dc i2'$36b0'
        dc i2'$3700'
        dc i2'$3750'
        dc i2'$37a0'
        dc i2'$37f0'
        dc i2'$3840'
        dc i2'$3890'
        dc i2'$38e0'
        dc i2'$3930'
        dc i2'$3980'
        dc i2'$39d0'
        dc i2'$3a20'
        dc i2'$3a70'
        dc i2'$3ac0'
        dc i2'$3b10'
        dc i2'$3b60'
        dc i2'$3bb0'
        dc i2'$3c00'
        dc i2'$3c50'
        dc i2'$3ca0'
        dc i2'$3cf0'
        dc i2'$3d40'
        dc i2'$3d90'
        dc i2'$3de0'
        dc i2'$3e30'
        dc i2'$3e80'
        dc i2'$3ed0'
        dc i2'$3f20'
        dc i2'$3f70'
        dc i2'$3fc0'
        dc i2'$4010'
        dc i2'$4060'
        dc i2'$40b0'
        dc i2'$4100'
        dc i2'$4150'
        dc i2'$41a0'
        dc i2'$41f0'
        dc i2'$4240'
        dc i2'$4290'
        dc i2'$42e0'
        dc i2'$4330'
        dc i2'$4380'
        dc i2'$43d0'
        dc i2'$4420'
        dc i2'$4470'
        dc i2'$44c0'
        dc i2'$4510'
        dc i2'$4560'
        dc i2'$45b0'
        dc i2'$4600'
        dc i2'$4650'
        dc i2'$46a0'
        dc i2'$46f0'
        dc i2'$4740'
        dc i2'$4790'
        dc i2'$47e0'
        dc i2'$4830'
        dc i2'$4880'
        dc i2'$48d0'
        dc i2'$4920'
        dc i2'$4970'
        dc i2'$49c0'
        dc i2'$4a10'
        dc i2'$4a60'
        dc i2'$4ab0'



        end

spritesData data
    

spriteX dc i2'0'
spriteY dc i2'0'


        end
