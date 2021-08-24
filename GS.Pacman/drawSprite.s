;
;  drawSprite.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/23/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


drawSprite start drawSpritesSeg
        using globalData
        using spritesData

    
drawSprite0 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite1 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite2 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite3 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite4 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite5 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite6 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite7 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite8 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite9 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #320
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$aa
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite10 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$a0
        sta 1
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite11 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$a0
        sta 1
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite12 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$a0
        sta 1
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite13 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$a0
        sta 1
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite14 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$a0
        sta 1
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$0a
        sta 5
        lda #$aa
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        lda #$a0
        sta 2
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$a0
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0a
        sta 2
        lda #$aa
        sta 3
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite15 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 0
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite16 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 0
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite17 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 0
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite18 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 0
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite19 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$aa
        sta 3
        lda #$a0
        sta 4
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a0
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$aa
        sta 0
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$a0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0a
        sta 0
        lda #$aa
        sta 1
        sta 2
        lda #$a0
        sta 3
        lda #$aa
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0a
        sta 1
        lda #$aa
        sta 2
        lda #$0a
        sta 4
        lda #$aa
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite20 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$30
        sta 1
        lda #$33
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$33
        sta 5
        lda #$03
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$03
        sta 0
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$30
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite21 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$30
        sta 1
        lda #$33
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$33
        sta 5
        lda #$03
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$03
        sta 0
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$30
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite22 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$30
        sta 1
        lda #$33
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$33
        sta 5
        lda #$03
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$03
        sta 0
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$30
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite23 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$30
        sta 1
        lda #$33
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$33
        sta 5
        lda #$03
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$03
        sta 0
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$30
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite24 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$33
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$3f
        sta 2
        lda #$f3
        sta 3
        lda #$33
        sta 4
        lda #$3f
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$30
        sta 1
        lda #$33
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$33
        sta 5
        lda #$03
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$03
        sta 0
        sta 2
        lda #$30
        sta 3
        lda #$03
        sta 4
        lda #$30
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite25 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$33
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$ff
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$ff
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$11
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$11
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$11
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$30
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$03
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$33
        sta 1
        lda #$03
        sta 3
        lda #$30
        sta 4
        lda #$33
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite26 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$33
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$ff
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$ff
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$11
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$11
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$11
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$30
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$03
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$33
        sta 1
        lda #$03
        sta 3
        lda #$30
        sta 4
        lda #$33
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite27 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$33
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$ff
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$ff
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$11
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$11
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$11
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$30
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$03
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$33
        sta 1
        lda #$03
        sta 3
        lda #$30
        sta 4
        lda #$33
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite28 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$33
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$ff
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$ff
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$11
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$11
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$11
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$30
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$03
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$33
        sta 1
        lda #$03
        sta 3
        lda #$30
        sta 4
        lda #$33
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite29 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$33
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$ff
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$33
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$ff
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$ff
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$03
        sta 0
        lda #$3f
        sta 1
        lda #$11
        sta 2
        lda #$f3
        sta 3
        lda #$3f
        sta 4
        lda #$11
        sta 5
        lda #$f3
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$11
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$03
        sta 0
        lda #$33
        sta 1
        lda #$30
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$03
        sta 5
        lda #$33
        sta 6
        lda #$30
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$33
        sta 1
        lda #$03
        sta 3
        lda #$30
        sta 4
        lda #$33
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite30 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$b0
        sta 1
        lda #$bb
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$bb
        sta 5
        lda #$0b
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$0b
        sta 0
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$b0
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite31 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$b0
        sta 1
        lda #$bb
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$bb
        sta 5
        lda #$0b
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$0b
        sta 0
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$b0
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite32 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$b0
        sta 1
        lda #$bb
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$bb
        sta 5
        lda #$0b
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$0b
        sta 0
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$b0
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite33 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$b0
        sta 1
        lda #$bb
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$bb
        sta 5
        lda #$0b
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$0b
        sta 0
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$b0
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite34 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$bb
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$bf
        sta 2
        lda #$fb
        sta 3
        lda #$bb
        sta 4
        lda #$bf
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$b0
        sta 1
        lda #$bb
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$bb
        sta 5
        lda #$0b
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$0b
        sta 0
        sta 2
        lda #$b0
        sta 3
        lda #$0b
        sta 4
        lda #$b0
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite35 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$bb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$ff
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$ff
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$11
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$11
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$11
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$b0
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$0b
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$bb
        sta 1
        lda #$0b
        sta 3
        lda #$b0
        sta 4
        lda #$bb
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite36 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$bb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$ff
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$ff
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$11
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$11
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$11
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$b0
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$0b
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$bb
        sta 1
        lda #$0b
        sta 3
        lda #$b0
        sta 4
        lda #$bb
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite37 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$bb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$ff
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$ff
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$11
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$11
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$11
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$b0
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$0b
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$bb
        sta 1
        lda #$0b
        sta 3
        lda #$b0
        sta 4
        lda #$bb
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite38 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$bb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$ff
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$ff
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$11
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$11
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$11
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$b0
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$0b
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$bb
        sta 1
        lda #$0b
        sta 3
        lda #$b0
        sta 4
        lda #$bb
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite39 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$bb
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$0b
        sta 1
        lda #$bb
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$b0
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$bb
        sta 1
        lda #$ff
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$bb
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$ff
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$ff
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bf
        sta 1
        lda #$11
        sta 2
        lda #$fb
        sta 3
        lda #$bf
        sta 4
        lda #$11
        sta 5
        lda #$fb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$11
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$0b
        sta 0
        lda #$bb
        sta 1
        lda #$b0
        sta 2
        lda #$bb
        sta 3
        sta 4
        lda #$0b
        sta 5
        lda #$bb
        sta 6
        lda #$b0
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$bb
        sta 1
        lda #$0b
        sta 3
        lda #$b0
        sta 4
        lda #$bb
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite40 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$80
        sta 1
        lda #$88
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$88
        sta 5
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$80
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite41 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$80
        sta 1
        lda #$88
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$88
        sta 5
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$80
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite42 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$80
        sta 1
        lda #$88
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$88
        sta 5
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$80
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite43 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$80
        sta 1
        lda #$88
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$88
        sta 5
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$80
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite44 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$88
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$8f
        sta 2
        lda #$f8
        sta 3
        lda #$88
        sta 4
        lda #$8f
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$80
        sta 1
        lda #$88
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$88
        sta 5
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        lda #$80
        sta 3
        lda #$08
        sta 4
        lda #$80
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite45 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$88
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$ff
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$ff
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$11
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$11
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$11
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$08
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$88
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 4
        lda #$88
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite46 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$88
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$ff
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$ff
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$11
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$11
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$11
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$08
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$88
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 4
        lda #$88
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite47 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$88
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$ff
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$ff
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$11
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$11
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$11
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$08
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$88
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 4
        lda #$88
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite48 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$88
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$ff
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$ff
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$11
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$11
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$11
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$08
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$88
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 4
        lda #$88
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite49 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$88
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$08
        sta 1
        lda #$88
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$80
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$88
        sta 1
        lda #$ff
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$88
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$ff
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$ff
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$08
        sta 0
        lda #$8f
        sta 1
        lda #$11
        sta 2
        lda #$f8
        sta 3
        lda #$8f
        sta 4
        lda #$11
        sta 5
        lda #$f8
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$11
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 3
        sta 4
        lda #$08
        sta 5
        lda #$88
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$88
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 4
        lda #$88
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite50 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$90
        sta 1
        lda #$99
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$99
        sta 5
        lda #$09
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$09
        sta 0
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$90
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite51 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$90
        sta 1
        lda #$99
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$99
        sta 5
        lda #$09
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$09
        sta 0
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$90
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite52 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$90
        sta 1
        lda #$99
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$99
        sta 5
        lda #$09
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$09
        sta 0
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$90
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite53 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$90
        sta 1
        lda #$99
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$99
        sta 5
        lda #$09
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$09
        sta 0
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$90
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite54 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$11
        sta 3
        lda #$99
        sta 4
        lda #$ff
        sta 5
        lda #$11
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$9f
        sta 2
        lda #$f9
        sta 3
        lda #$99
        sta 4
        lda #$9f
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$90
        sta 1
        lda #$99
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$99
        sta 5
        lda #$09
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$09
        sta 0
        sta 2
        lda #$90
        sta 3
        lda #$09
        sta 4
        lda #$90
        sta 5
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite55 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$ff
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$ff
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$11
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$11
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$11
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$90
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$09
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$99
        sta 1
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$99
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite56 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$ff
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$ff
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$11
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$11
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$11
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$90
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$09
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$99
        sta 1
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$99
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite57 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$ff
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$ff
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$11
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$11
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$11
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$90
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$09
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$99
        sta 1
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$99
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite58 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$ff
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$ff
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$11
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$11
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$11
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$90
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$09
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$99
        sta 1
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$99
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite59 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 3
        sta 4
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 1
        lda #$99
        sta 2
        sta 3
        sta 4
        sta 5
        lda #$90
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$99
        sta 1
        lda #$ff
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$ff
        sta 5
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$ff
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$ff
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$09
        sta 0
        lda #$9f
        sta 1
        lda #$11
        sta 2
        lda #$f9
        sta 3
        lda #$9f
        sta 4
        lda #$11
        sta 5
        lda #$f9
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$11
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$11
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        sta 2
        sta 3
        sta 4
        sta 5
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$09
        sta 0
        lda #$99
        sta 1
        lda #$90
        sta 2
        lda #$99
        sta 3
        sta 4
        lda #$09
        sta 5
        lda #$99
        sta 6
        lda #$90
        sta 7
        long m

        lda drawAddress
        clc
        adc #2080
        tcd

        short m
        lda #$99
        sta 1
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$99
        sta 6
        long m

        long m

        _spriteFooter
        rtl

drawSprite60 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$09
        sta 4
        lda #$99
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$09
        sta 5
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$90
        sta 3
        sta 5
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$39
        sta 2
        lda #$33
        sta 3
        lda #$09
        sta 4
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$3f
        sta 1
        lda #$33
        sta 2
        lda #$31
        sta 3
        lda #$39
        sta 4
        lda #$33
        sta 5
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$33
        sta 1
        lda #$f3
        sta 2
        lda #$13
        sta 3
        lda #$33
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$13
        sta 3
        lda #$f3
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 3
        lda #$3f
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$33
        sta 4
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite61 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$09
        sta 4
        lda #$99
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$09
        sta 5
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$90
        sta 3
        sta 5
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$39
        sta 2
        lda #$33
        sta 3
        lda #$09
        sta 4
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$3f
        sta 1
        lda #$33
        sta 2
        lda #$31
        sta 3
        lda #$39
        sta 4
        lda #$33
        sta 5
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$33
        sta 1
        lda #$f3
        sta 2
        lda #$13
        sta 3
        lda #$33
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$13
        sta 3
        lda #$f3
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 3
        lda #$3f
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$33
        sta 4
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite62 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$09
        sta 4
        lda #$99
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$09
        sta 5
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$90
        sta 3
        sta 5
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$39
        sta 2
        lda #$33
        sta 3
        lda #$09
        sta 4
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$3f
        sta 1
        lda #$33
        sta 2
        lda #$31
        sta 3
        lda #$39
        sta 4
        lda #$33
        sta 5
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$33
        sta 1
        lda #$f3
        sta 2
        lda #$13
        sta 3
        lda #$33
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$13
        sta 3
        lda #$f3
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 3
        lda #$3f
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$33
        sta 4
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite63 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$09
        sta 4
        lda #$99
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$09
        sta 5
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$90
        sta 3
        sta 5
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$39
        sta 2
        lda #$33
        sta 3
        lda #$09
        sta 4
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$3f
        sta 1
        lda #$33
        sta 2
        lda #$31
        sta 3
        lda #$39
        sta 4
        lda #$33
        sta 5
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$33
        sta 1
        lda #$f3
        sta 2
        lda #$13
        sta 3
        lda #$33
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$13
        sta 3
        lda #$f3
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 3
        lda #$3f
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$33
        sta 4
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite64 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$99
        sta 6
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$09
        sta 4
        lda #$99
        sta 5
        sta 6
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$09
        sta 3
        lda #$90
        sta 4
        lda #$09
        sta 5
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$90
        sta 3
        sta 5
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$33
        sta 1
        lda #$39
        sta 2
        lda #$33
        sta 3
        lda #$09
        sta 4
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$3f
        sta 1
        lda #$33
        sta 2
        lda #$31
        sta 3
        lda #$39
        sta 4
        lda #$33
        sta 5
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$33
        sta 1
        lda #$f3
        sta 2
        lda #$13
        sta 3
        lda #$33
        sta 4
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$03
        sta 1
        lda #$33
        sta 2
        lda #$13
        sta 3
        lda #$f3
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$03
        sta 3
        lda #$3f
        sta 4
        lda #$33
        sta 5
        lda #$30
        sta 6
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$33
        sta 4
        sta 5
        long m

        long m

        _spriteFooter
        rtl

drawSprite65 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$03
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 3
        lda #$30
        sta 4
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$20
        sta 1
        lda #$03
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$2a
        sta 1
        lda #$33
        sta 2
        lda #$a3
        sta 3
        sta 4
        lda #$3a
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$2a
        sta 1
        lda #$aa
        sta 2
        lda #$a3
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$22
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a2
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$02
        sta 1
        lda #$2a
        sta 2
        lda #$1a
        sta 3
        sta 4
        lda #$22
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$22
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        lda #$20
        sta 5
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$02
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$1a
        sta 3
        lda #$10
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite66 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$03
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 3
        lda #$30
        sta 4
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$20
        sta 1
        lda #$03
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$2a
        sta 1
        lda #$33
        sta 2
        lda #$a3
        sta 3
        sta 4
        lda #$3a
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$2a
        sta 1
        lda #$aa
        sta 2
        lda #$a3
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$22
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a2
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$02
        sta 1
        lda #$2a
        sta 2
        lda #$1a
        sta 3
        sta 4
        lda #$22
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$22
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        lda #$20
        sta 5
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$02
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$1a
        sta 3
        lda #$10
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite67 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$03
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 3
        lda #$30
        sta 4
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$20
        sta 1
        lda #$03
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$2a
        sta 1
        lda #$33
        sta 2
        lda #$a3
        sta 3
        sta 4
        lda #$3a
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$2a
        sta 1
        lda #$aa
        sta 2
        lda #$a3
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$22
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a2
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$02
        sta 1
        lda #$2a
        sta 2
        lda #$1a
        sta 3
        sta 4
        lda #$22
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$22
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        lda #$20
        sta 5
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$02
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$1a
        sta 3
        lda #$10
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite68 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$03
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 3
        lda #$30
        sta 4
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$20
        sta 1
        lda #$03
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$2a
        sta 1
        lda #$33
        sta 2
        lda #$a3
        sta 3
        sta 4
        lda #$3a
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$2a
        sta 1
        lda #$aa
        sta 2
        lda #$a3
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$22
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a2
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$02
        sta 1
        lda #$2a
        sta 2
        lda #$1a
        sta 3
        sta 4
        lda #$22
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$22
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        lda #$20
        sta 5
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$02
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$1a
        sta 3
        lda #$10
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite69 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #480
        tcd

        short m
        lda #$03
        sta 3
        long m

        lda drawAddress
        clc
        adc #640
        tcd

        short m
        lda #$33
        sta 3
        lda #$30
        sta 4
        long m

        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$20
        sta 1
        lda #$03
        sta 2
        lda #$33
        sta 3
        sta 4
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$2a
        sta 1
        lda #$33
        sta 2
        lda #$a3
        sta 3
        sta 4
        lda #$3a
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$2a
        sta 1
        lda #$aa
        sta 2
        lda #$a3
        sta 3
        lda #$aa
        sta 4
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$22
        sta 1
        lda #$aa
        sta 2
        sta 3
        sta 4
        lda #$a2
        sta 5
        lda #$20
        sta 6
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$02
        sta 1
        lda #$2a
        sta 2
        lda #$1a
        sta 3
        sta 4
        lda #$22
        sta 5
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$22
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        lda #$20
        sta 5
        long m

        lda drawAddress
        clc
        adc #1760
        tcd

        short m
        lda #$02
        sta 2
        lda #$1a
        sta 3
        lda #$12
        sta 4
        long m

        lda drawAddress
        clc
        adc #1920
        tcd

        short m
        lda #$1a
        sta 3
        lda #$10
        sta 4
        long m

        long m

        _spriteFooter
        rtl

drawSprite70 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$80
        sta 2
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 1
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$80
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite71 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$80
        sta 2
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 1
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$80
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite72 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$80
        sta 2
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 1
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$80
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite73 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$80
        sta 2
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 1
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$80
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        long m

        _spriteFooter
        rtl

drawSprite74 entry

        spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #800
        tcd

        short m
        lda #$88
        sta 1
        lda #$80
        sta 2
        lda #$88
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        lda drawAddress
        clc
        adc #960
        tcd

        short m
        lda #$08
        sta 0
        sta 2
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1120
        tcd

        short m
        lda #$80
        sta 2
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1280
        tcd

        short m
        lda #$08
        sta 1
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1440
        tcd

        short m
        lda #$80
        sta 1
        lda #$08
        sta 3
        lda #$80
        sta 5
        sta 6
        lda #$08
        sta 7
        long m

        lda drawAddress
        clc
        adc #1600
        tcd

        short m
        lda #$08
        sta 0
        lda #$88
        sta 1
        sta 2
        sta 4
        lda #$08
        sta 6
        lda #$80
        sta 7
        long m

        long m

        _spriteFooter
        rtl
    
    
drawAddress dc i4'0'


        end