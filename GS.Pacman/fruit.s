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
        lda #$68
        sta spriteY

        lda #SPRITE_CHERRY
        jsr drawSpriteByIndex

        rts


drawFruitRack entry

        rts



fruitTimer dc i2'0'


fruitSprites anop
        dc i2'SPRITE_CHERRY'

fruitPoints anop
        dc i2'100'




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
