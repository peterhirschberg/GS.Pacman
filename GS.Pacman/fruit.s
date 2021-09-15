;
;  fruit.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/14/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on


fruit start
        using mazeExchangeData
        using spritesData
        using gameData
        using fruitData


runFruit entry


        rts


drawFruit entry

        lda #$6c
        sta spriteX
        lda #$69
        sta spriteY

        ldx levelNum
        asl a
        lda fruitSprites,x
        jsr drawSpriteByIndex

        rts


drawFruitRack entry

        rts



fruitTimer dc i2'0'


fruitSprites anop
        dc i2'SPRITE_CHERRY'
        dc i2'SPRITE_STRAWBERRY'
        dc i2'SPRITE_PEACH'
        dc i2'SPRITE_PEACH'
        dc i2'SPRITE_APPLE'
        dc i2'SPRITE_APPLE'
        dc i2'SPRITE_MELON'
        dc i2'SPRITE_MELON'
        dc i2'SPRITE_GALAX'
        dc i2'SPRITE_GALAX'
        dc i2'SPRITE_BELL'


fruitPoints anop
        dc i2'100'
        dc i2'300'
        dc i2'500'
        dc i2'500'
        dc i2'700'
        dc i2'700'
        dc i2'1000'
        dc i2'1000'
        dc i2'2000'
        dc i2'2000'
        dc i2'3000'



        end


fruitData data

        end


; 13.5, 13

; 70 -> 36 dots
; 170 -> 136 dots
;
; 10 seconds
;
; Current level + 6 previous levels

;
; Cherry
; Strawberry
; Peach
; Peach
; Apple
; Apple
; Grapes
; Grapes
; Galaxian
; Galaxian
; Bell
; Bell
; Key...
;

