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

        lda pacX
        sta pacOldX
        lda pacY
        sta pacOldY

; animation
        jsr animatePac

        rts
        
        
animatePac entry

        dec pacAnimationTimer
        lda pacAnimationTimer
        bmi incrementAnimationIndex
        rts

incrementAnimationIndex anop
        lda #2 ; animation timer duration
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

;   rts
   
   
        lda pacX
        sta spriteX
        lda pacY
        sta spriteY

        lda pacAnimationIndex
        asl a
        tax
        
        lda pacDirection
        cmp #DIRECTION_RIGHT
        beq drawDirectionRight
        cmp #DIRECTION_DOWN
        beq drawDirectionDown
        cmp #DIRECTION_LEFT
        beq drawDirectionLeft
        cmp #DIRECTION_UP
        beq drawDirectionUp
        
        rts
        
drawDirectionRight anop
        lda pacRightAnimationSprites,x
        jsr drawSpriteByIndex
        rts

drawDirectionDown anop
        lda pacDownAnimationSprites,x
        jsr drawSpriteByIndex
        rts

drawDirectionLeft anop
        lda pacLeftAnimationSprites,x
        jsr drawSpriteByIndex
        rts

drawDirectionUp anop
        lda pacUpAnimationSprites,x
        jsr drawSpriteByIndex
        rts

        
        
        
erasePac entry

;    rts

        lda pacOldX
        sta spriteX
        lda pacOldY
        sta spriteY

        jsr eraseSpriteRect

        rts
        
        
    
        end



pacData data

    
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
        dc i2'SPRITE_PAC_FULL_3'
        dc i2'SPRITE_PAC_UP_2'

pacDownAnimationSprites anop
        dc i2'SPRITE_PAC_DOWN_1'
        dc i2'SPRITE_PAC_DOWN_2'
        dc i2'SPRITE_PAC_FULL_1'
        dc i2'SPRITE_PAC_DOWN_2'

; 11 frames for "die" animation
pacDieAnimationSprites anop
        dc i2'SPRITE_PAC_DIE_1'
        dc i2'SPRITE_PAC_DIE_2'
        dc i2'SPRITE_PAC_DIE_3'
        dc i2'SPRITE_PAC_DIE_4'
        dc i2'SPRITE_PAC_DIE_5'
        dc i2'SPRITE_PAC_DIE_6'
        dc i2'SPRITE_PAC_DIE_7'
        dc i2'SPRITE_PAC_DIE_8'
        dc i2'SPRITE_PAC_DIE_9'
        dc i2'SPRITE_PAC_DIE_10'
        dc i2'SPRITE_PAC_DIE_11'

        
pacX dc i2'48'
pacY dc i2'48'

pacOldX dc i2'48'
pacOldY dc i2'48'

pacAnimationIndex dc i2'0'
pacAnimationTimer dc i2'0'

pacDirection dc i2'DIRECTION_RIGHT'


        end
