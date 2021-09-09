;
;  alphaSprites.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/9/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy alphaSprites.macros
        keep alphaSprites

alphaSprites start
        using spritesData


drawAlphaReady entry

        lda #10
        sta spriteX
        lda #10
        sta spriteY
        lda #$0a
        sta spriteLowColor
        lda #$a0
        sta spriteHighColor
        lda #$aa
        sta spriteBothColor

        jsr drawAlphaSprite0

        rts


        end
