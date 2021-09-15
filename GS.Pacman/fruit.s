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
        dc i2'SPRITE_CHERRY'        ; 0
        dc i2'SPRITE_STRAWBERRY'    ; 1
        dc i2'SPRITE_PEACH'         ; 2
        dc i2'SPRITE_PEACH'         ; 3
        dc i2'SPRITE_APPLE'         ; 4
        dc i2'SPRITE_APPLE'         ; 5
        dc i2'SPRITE_MELON'         ; 6
        dc i2'SPRITE_MELON'         ; 7
        dc i2'SPRITE_GALAX'         ; 8
        dc i2'SPRITE_GALAX'         ; 9
        dc i2'SPRITE_BELL'         ; 10
        dc i2'SPRITE_BELL'         ; 11
        dc i2'SPRITE_KEY'         ; 12
        dc i2'SPRITE_KEY'         ; 13


fruitPoints anop
        dc i2'100'      ; 0
        dc i2'300'      ; 1
        dc i2'500'      ; 2
        dc i2'500'      ; 3
        dc i2'700'      ; 4
        dc i2'700'      ; 5
        dc i2'1000'      ; 6
        dc i2'1000'      ; 7
        dc i2'2000'      ; 8
        dc i2'2000'      ; 9
        dc i2'3000'      ; 10
        dc i2'3000'      ; 11
        dc i2'5000'      ; 12
        dc i2'5000'      ; 13



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

