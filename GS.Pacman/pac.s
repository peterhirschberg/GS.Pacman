;
;  pac.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/26/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on


pac start
        using globalData
        using spritesData
        using pacData
    
    
    
runPac entry

; animation
        jsr animatePac

        rts
        
        
animatePac entry

        dec pacAnimationTimer
        lda pacAnimationTimer
        bmi incrementAnimationIndex
        rts

incrementAnimationIndex anop
        lda #10 ; animation timer duration
        sta pacAnimationTimer

        inc pacAnimationIndex
        lda pacAnimationIndex
        cmp #4 ; num animation frames
        beq resetAnimationIndex
        rts

resetAnimationIndex anop

        lda #0
        sta pacAnimationIndex

        rts

        
drawPac entry

; pac right

        lda pacX
        sta spriteX
        lda pacY
        sta spriteY

        lda pacAnimationIndex
        asl a
        tax
        lda pacUpAnimationSprites,x
        jsr drawSpriteByIndex
        
        rts
        
        
        
erasePac entry

        lda pacX
        sta spriteX
        lda pacY
        sta spriteY

        jsr translateSpritePosToMazePos
        jsr eraseSpriteRect

        rts
        
        
    
        end



pacData data
    
;SPRITE_PAC_RIGHT_1      gequ 0*4
;SPRITE_PAC_RIGHT_2      gequ 1*4
;SPRITE_PAC_FULL_1       gequ 2*4
;SPRITE_PAC_DOWN_1       gequ 3*4
;SPRITE_PAC_DOWN_2       gequ 4*4
;SPRITE_PAC_LEFT_1       gequ 5*4
;SPRITE_PAC_LEFT_2       gequ 6*4
;SPRITE_PAC_FULL_2       gequ 7*4
;SPRITE_PAC_UP_1         gequ 8*4
;SPRITE_PAC_UP_2         gequ 9*4
;SPRITE_PAC_DIE_1        gequ 10*4
;SPRITE_PAC_DIE_2        gequ 11*4
;SPRITE_PAC_DIE_3        gequ 12*4
;SPRITE_PAC_DIE_4        gequ 13*4
;SPRITE_PAC_DIE_5        gequ 14*4
;SPRITE_PAC_DIE_6        gequ 15*4
;SPRITE_PAC_DIE_7        gequ 16*4
;SPRITE_PAC_DIE_8        gequ 17*4
;SPRITE_PAC_DIE_9        gequ 18*4
;SPRITE_PAC_DIE_10       gequ 19*4
;SPRITE_PAC_DIE_11       gequ 19*4

; up animation full frame is 1px too high :-(

pacRightAnimationSprites anop
        dc i2'SPRITE_PAC_RIGHT_1'
        dc i2'SPRITE_PAC_RIGHT_2'
        dc i2'SPRITE_PAC_FULL_1'
        dc i2'SPRITE_PAC_RIGHT_2'

pacLeftAnimationSprites anop
        dc i2'SPRITE_PAC_LEFT_1'
        dc i2'SPRITE_PAC_LEFT_2'
        dc i2'SPRITE_PAC_FULL_2'
        dc i2'SPRITE_PAC_LEFT_2'

pacUpAnimationSprites anop
        dc i2'SPRITE_PAC_UP_1'
        dc i2'SPRITE_PAC_UP_2'
        dc i2'SPRITE_PAC_FULL_1'
        dc i2'SPRITE_PAC_UP_2'

pacDownAnimationSprites anop
        dc i2'SPRITE_PAC_DOWN_1'
        dc i2'SPRITE_PAC_DOWN_2'
        dc i2'SPRITE_PAC_FULL_1'
        dc i2'SPRITE_PAC_DOWN_2'
        
pacX dc i2'48'
pacY dc i2'48'

pacAnimationIndex dc i2'0'
pacAnimationTimer dc i2'0'


        end
