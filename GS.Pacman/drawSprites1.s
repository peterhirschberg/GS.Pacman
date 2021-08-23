;
;  drawSprites1.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/23/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


drawSprites1 start
        using globalData
        using spritesData

    
drawSprite20 entry

         spriteGetDrawAddress
        _spriteHeader


        lda drawAddress
        clc
        adc #0
        tcd

        short m
        long m

        lda drawAddress
        clc
        adc #160
        tcd

        short m
        long m

        lda drawAddress
        clc
        adc #320
        tcd

        short m
        long m

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

        lda drawAddress
        clc
        adc #2240
        tcd

        short m
        long m

        lda drawAddress
        clc
        adc #2400
        tcd

        short m
        long m

        long m

        _spriteFooter
        rts
    
    
drawAddress dc i4'0'


        end
