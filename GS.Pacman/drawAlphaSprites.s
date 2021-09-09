;
;  drawAlphaSprites.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/9/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global

drawAlphaSprites start
        using globalData
        using spritesData


drawAlphaSprite0 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite1 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite2 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite3 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite4 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite5 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite6 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite7 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite8 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda #$00
        sta 1
        lda spriteBothColor
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda #$00
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite9 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite10 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite11 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite12 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite13 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite14 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite15 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite16 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite17 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite18 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite19 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite20 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite21 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite22 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite23 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteHighColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteBothColor
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite24 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite25 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite26 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteBothColor
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite27 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite28 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite29 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite30 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite31 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite32 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite33 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite34 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite35 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite36 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteBothColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite37 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda #$00
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteHighColor
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteHighColor
        sta 0
        sta 1
        lda #$00
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteHighColor
        sta 0
        sta 1
        lda #$00
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteHighColor
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda #$00
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite38 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteBothColor
        sta 0
        sta 1
        lda #$00
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteBothColor
        sta 0
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite39 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteBothColor
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteBothColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        lda spriteBothColor
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite40 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite41 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteLowColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteLowColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite42 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite43 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteBothColor
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite44 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda spriteLowColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda spriteBothColor
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite45 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteBothColor
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite46 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda spriteBothColor
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite47 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda spriteBothColor
        sta 1
        lda spriteLowColor
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda spriteLowColor
        sta 1
        lda #$00
        sta 2
        lda spriteHighColor
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda spriteHighColor
        sta 1
        lda spriteLowColor
        sta 2
        lda #$00
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite48 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts

drawAlphaSprite49 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rts


drawAddress dc i4'0'


        end
