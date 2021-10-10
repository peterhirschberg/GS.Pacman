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

drawAlphaSprites start drawAlphaSpritesSeg
        using globalData
        using spritesData


drawAlphaSprite0 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite1 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite2 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite3 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite4 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite5 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite6 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite7 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite8 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda #$00
        sta 1
        lda >spriteBothColor
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda #$00
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite9 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite10 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite11 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite12 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite13 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite14 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite15 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite16 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite17 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite18 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite19 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite20 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite21 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite22 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite23 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteBothColor
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite24 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite25 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite26 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteBothColor
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite27 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite28 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite29 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite30 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite31 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite32 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite33 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite34 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite35 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite36 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteBothColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
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

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite37 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda #$00
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteHighColor
        sta 0
        sta 1
        lda #$00
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteHighColor
        sta 0
        sta 1
        lda #$00
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteHighColor
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda #$00
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        sta 2
        lda #$00
        sta 3
        long m

        long m

        _spriteFooter
        rtl

drawAlphaSprite38 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteBothColor
        sta 0
        sta 1
        lda #$00
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteBothColor
        sta 0
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite39 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteBothColor
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteBothColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        lda >spriteBothColor
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite40 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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

        lda >drawAddress
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
        rtl

drawAlphaSprite41 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteLowColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        lda >spriteHighColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteHighColor
        sta 1
        lda #$00
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteLowColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
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
        rtl

drawAlphaSprite42 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda >spriteBothColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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
        rtl

drawAlphaSprite43 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteBothColor
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        long m

        _spriteFooter
        rtl

drawAlphaSprite44 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$00
        sta 0
        sta 1
        sta 2
        lda >spriteLowColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #1120
        tcd

        short m
        lda >spriteBothColor
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rtl

drawAlphaSprite45 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteBothColor
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #1120
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rtl

drawAlphaSprite46 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #640
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #800
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #960
        tcd

        short m
        lda >spriteHighColor
        sta 0
        lda #$00
        sta 1
        sta 2
        sta 3
        long m

        lda >drawAddress
        clc
        adc #1120
        tcd

        short m
        lda >spriteBothColor
        sta 0
        sta 1
        sta 2
        sta 3
        long m

        long m

        _spriteFooter
        rtl

drawAlphaSprite47 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
        clc
        adc #0
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #160
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteBothColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteLowColor
        sta 1
        lda #$00
        sta 2
        lda >spriteHighColor
        sta 3
        long m

        lda >drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$00
        sta 0
        lda >spriteHighColor
        sta 1
        lda >spriteLowColor
        sta 2
        lda #$00
        sta 3
        long m

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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
        rtl

drawAlphaSprite48 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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
        rtl

drawAlphaSprite49 entry

        spriteGetDrawAddress
        _spriteHeader


        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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

        lda >drawAddress
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
        rtl


drawAddress dc i4'0'


        end
