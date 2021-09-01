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
        using controlsData
        using mazeExchangeData
        using pacData
    
    
    
runPac entry

        lda pacX
        sta pacOldX
        lda pacY
        sta pacOldY
        
        lda pacX
;        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda pacY
;        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY
        
; HERE I NEED TO GET THE NEXT TILE IN THE DIRECTION OF TRAVEL
        lda pacDirection
        jsr getNextTileXYAlongDirection
        
        jsr getAvailableDirectionsFromTileXY ; modifies tileX/Y
        sta availableDirections

        
        jsr controlPac
        jsr movePac

; animation
        lda pacDirection
        cmp #DIRECTION_STOP
        beq dontAnimate
        jsr animatePac

dontAnimate anop

        rts
        
        
controlPac entry

        lda joystickUp
        cmp #0
        bne pacUp

        lda joystickDown
        cmp #0
        bne pacDown

        lda joystickLeft
        cmp #0
        bne pacLeft

        lda joystickRight
        cmp #0
        bne pacRight

        rts

pacUp anop

        lda #DIRECTION_UP
        sta pacIntendedDirection

        rts

pacDown anop

        lda #DIRECTION_DOWN
        sta pacIntendedDirection
        
        rts

pacLeft anop

        lda #DIRECTION_LEFT
        sta pacIntendedDirection
        
        rts

pacRight anop

        lda #DIRECTION_RIGHT
        sta pacIntendedDirection
        
        rts

        
        
movePac entry

        lda pacX
;        shiftedToPixel
        sta spriteX
        lda pacY
;        shiftedToPixel
        sta spriteY
        jsr isSpriteCenteredInMazeTile
        cmp #0
;        beq keepMoving1 ; TODO this is not correct for Pac

; TODO I think checkDirectionAvailable return value should be checked for equality with pacIntendedDirection
        lda pacIntendedDirection
        jsr checkDirectionAvailable
        cmp #0
        beq keepMoving1
        
        lda pacIntendedDirection
        sta pacDirection

keepMoving1 anop

        lda pacDirection
        jsr checkDirectionAvailable
        cmp #0
        bne keepMoving2
        
        lda #DIRECTION_STOP
        sta pacDirection
        
keepMoving2 anop

        lda pacDirection
        cmp #DIRECTION_UP
        beq moveUp
        cmp #DIRECTION_DOWN
        beq moveDown
        cmp #DIRECTION_LEFT
        beq moveLeft
        cmp #DIRECTION_RIGHT
        beq moveRight

        rts
        
moveUp entry

        lda pacY
        sec
        sbc #1
        sta pacY

        rts

moveDown entry

        lda pacY
        clc
        adc #1
        sta pacY

        rts

moveLeft entry

        lda pacX
        sec
        sbc #1
        sta pacX

        rts

moveRight entry

        lda pacX
        clc
        adc #1
        sta pacX

        rts

        

checkDirectionAvailable entry

        cmp #DIRECTION_UP
        beq checkUpAvailable
        cmp #DIRECTION_RIGHT
        beq checkRightAvailable
        cmp #DIRECTION_DOWN
        beq checkDownAvailable
        cmp #DIRECTION_LEFT
        beq checkLeftAvailable
        
        lda #1 ; should never be reached
        
        rts
        
checkUpAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_UP
        cmp #0
        beq upNotAvailable
        lda #1
        rts
upNotAvailable anop
        lda #0
        rts
        
checkRightAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq rightNotAvailable
        lda #1
        rts
rightNotAvailable anop
        lda #0
        rts
        
checkDownAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq downNotAvailable
        lda #1
        rts
downNotAvailable anop
        lda #0
        rts
        
checkLeftAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq leftNotAvailable
        lda #1
        rts
leftNotAvailable anop
        lda #0
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
        cmp #DIRECTION_STOP
        beq drawDirectionStop
        
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

drawDirectionStop anop
; TODO - remember last direction and sprite index
        lda pacLeftAnimationSprites,x
        jsr drawSpriteByIndex
        rts
        
        
        
erasePac entry

        lda pacOldX
        sta spriteX
        lda pacOldY
        sta spriteY

        jsr eraseSpriteRect

        rts
        

        
availableDirections dc i2'0'

    
        end



pacData data

    
pacRightAnimationSprites anop
        dc i2'SPRITE_PAC_FULL_1'
        dc i2'SPRITE_PAC_RIGHT_2'
        dc i2'SPRITE_PAC_RIGHT_1'
        dc i2'SPRITE_PAC_RIGHT_2'

pacLeftAnimationSprites anop
        dc i2'SPRITE_PAC_FULL_2'
        dc i2'SPRITE_PAC_LEFT_2'
        dc i2'SPRITE_PAC_LEFT_1'
        dc i2'SPRITE_PAC_LEFT_2'

pacUpAnimationSprites anop
        dc i2'SPRITE_PAC_FULL_3'
        dc i2'SPRITE_PAC_UP_2'
        dc i2'SPRITE_PAC_UP_1'
        dc i2'SPRITE_PAC_UP_2'

pacDownAnimationSprites anop
        dc i2'SPRITE_PAC_FULL_1'
        dc i2'SPRITE_PAC_DOWN_2'
        dc i2'SPRITE_PAC_DOWN_1'
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


; Initial position in maze is $6c,$89
pacX dc i2'$6c'
pacY dc i2'$89'

pacOldX dc i2'48'
pacOldY dc i2'48'

pacAnimationIndex dc i2'0'
pacAnimationTimer dc i2'0'

pacDirection dc i2'DIRECTION_LEFT'
pacIntendedDirection dc i2'DIRECTION_LEFT'


        end
