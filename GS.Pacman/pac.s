;
;  pac.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/26/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


pac start
        using globalData
        using gameData
        using spritesData
        using controlsData
        using mazeExchangeData
        using pacData
    
    
    
runPac entry

        lda pacEaten
        cmp #0
        beq notEaten

        jsr animatePacEaten

        rts

notEaten anop

        lda pacX
        sta pacOldX
        lda pacY
        sta pacOldY
        
        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        brl noDebug

; ------------ DEBUG -------------

        lda #0
        sta spriteX
        lda #150
        sta spriteY
        lda pacX
        shiftedToPixel
        and #7
        asl a
        asl a
        jsr drawAlphaSpriteByIndex
        lda #0
        sta spriteX
        lda #158
        sta spriteY
        lda pacY
        shiftedToPixel
        and #7
        asl a
        asl a
        jsr drawAlphaSpriteByIndex

; ------------ DEBUG -------------


; ------------ DEBUG -------------

        lda #0
        sta spriteX
        lda #20
        sta spriteY
        lda availableDirections
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq noLeft
        lda #ALPHAINDEX_L
        jsr drawAlphaSpriteByIndex
        bra checkRight
noLeft anop
        lda #ALPHAINDEX_SPACE
        jsr drawAlphaSpriteByIndex
checkRight anop
        lda #0
        sta spriteX
        lda #28
        sta spriteY
        lda availableDirections
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq noRight
        lda #ALPHAINDEX_R
        jsr drawAlphaSpriteByIndex
        bra checkUp
noRight anop
        lda #ALPHAINDEX_SPACE
        jsr drawAlphaSpriteByIndex
checkUp anop
        lda #0
        sta spriteX
        lda #36
        sta spriteY
        lda availableDirections
        and #AVAILABLEDIR_UP
        cmp #0
        beq noUp
        lda #ALPHAINDEX_U
        jsr drawAlphaSpriteByIndex
        bra checkDown
noUp anop
        lda #ALPHAINDEX_SPACE
        jsr drawAlphaSpriteByIndex
checkDown anop
        lda #0
        sta spriteX
        lda #44
        sta spriteY
        lda availableDirections
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq noDown
        lda #ALPHAINDEX_D
        jsr drawAlphaSpriteByIndex
        bra checkNothing
noDown anop
        lda #ALPHAINDEX_SPACE
        jsr drawAlphaSpriteByIndex
checkNothing anop

; ------------ DEBUG -------------

noDebug anop


        jsr getPacAvailableDirections

        jsr controlPac
        jsr movePac

        jsr checkTunnel
        jsr checkDots

animate anop

        lda pacMoving
        cmp #0
        beq dontAnimate
        jsr animatePac

dontAnimate anop

        rts


alignPacWithTiles entry

        lda pacDirection
        cmp #DIRECTION_UP
        beq alignX
        cmp #DIRECTION_DOWN
        beq alignX
        cmp #DIRECTION_LEFT
        beq alignY
        cmp #DIRECTION_RIGHT
        beq alignY

        rts

alignX anop
        alignXToTile
        rts

alignY anop
        alignYToTile
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

        jsr alignPacWithTiles

        lda pacAteDotDelay
        cmp #0
        beq noDelay
        dec pacAteDotDelay
        rts
        
noDelay anop

        lda pacX
        shiftedToPixel
        sta spriteX
        lda pacY
        shiftedToPixel
        sta spriteY


; test to see if we can go the intended direction

        lda pacIntendedDirection
        jsr checkDirectionAvailable
        cmp #0
        beq keepMoving1

        jsr pacTurnToIntendedDirection

keepMoving1 anop

; test to see if we can continue moving in the current direction

        lda pacDirection
        jsr checkDirectionAvailable
        cmp #0
        bne keepMoving2

; continue moving along current direction until we are at a maze tile boundry

        jsr isSpriteCenteredInMazeTile
        cmp #0
        beq keepMoving2
        
        lda #0
        sta pacMoving
        
        rts
        
keepMoving2 anop

        lda #1
        sta pacMoving

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
        sbc #8
        sta pacY

        rts

moveDown entry

        lda pacY
        clc
        adc #8
        sta pacY

        rts

moveLeft entry

        lda pacX
        sec
        sbc #8
        sta pacX

        rts

moveRight entry

        lda pacX
        clc
        adc #8
        sta pacX

        rts

        

checkDirectionAvailable entry

        stz turningOnTime
        stz turningEarly
        stz turningLate

        cmp #DIRECTION_UP
        beq checkUpAvailableShort
        cmp #DIRECTION_RIGHT
        beq checkRightAvailableShort
        cmp #DIRECTION_DOWN
        beq checkDownAvailableShort
        cmp #DIRECTION_LEFT
        beq checkLeftAvailableShort
        
        lda #1 ; should never be reached
        
        rts

checkUpAvailableShort anop
        brl checkUpAvailable
checkRightAvailableShort anop
        brl checkRightAvailable
checkDownAvailableShort anop
        brl checkDownAvailable
checkLeftAvailableShort anop
        brl checkLeftAvailable

checkUpAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_UP
        cmp #0
        beq upNotAvailable1
        lda #1
        sta turningOnTime
        lda #1
        rts
upNotAvailable1 anop
        lda availableDirectionsAhead
        and #AVAILABLEDIR_UP
        cmp #0
        beq upNotAvailable2
        lda #1
        sta turningEarly
        lda #1
        rts
upNotAvailable2 anop
        lda availableDirectionsBehind
        and #AVAILABLEDIR_UP
        cmp #0
        beq upNotAvailable3
        lda #1
        sta turningLate
        lda #1
        rts
upNotAvailable3 anop
        lda #0
        rts
        
checkRightAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq rightNotAvailable1
        lda #1
        rts
rightNotAvailable1 anop
        lda availableDirectionsAhead
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq rightNotAvailable2
        lda #1
        sta turningEarly
        lda #1
        rts
rightNotAvailable2 anop
        lda availableDirectionsBehind
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq rightNotAvailable3
        lda #1
        sta turningLate
        lda #1
        rts
rightNotAvailable3 anop
        lda #0
        rts
        
checkDownAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq downNotAvailable1
        lda #1
        rts
downNotAvailable1 anop
        lda availableDirectionsAhead
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq downNotAvailable2
        lda #1
        sta turningEarly
        lda #1
        rts
downNotAvailable2 anop
        lda availableDirectionsBehind
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq downNotAvailable3
        lda #1
        sta turningLate
        lda #1
        rts
downNotAvailable3 anop
        lda #0
        rts
        
checkLeftAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq leftNotAvailable1
        lda #1
        rts
leftNotAvailable1 anop
; PDHTODO - fix getting stuck on a wall (specific tile number is 26)
        lda availableDirectionsAhead
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq leftNotAvailable2
        lda #1
        sta turningEarly
        lda #1
        rts
leftNotAvailable2 anop
        lda availableDirectionsBehind
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq leftNotAvailable3
        lda #1
        sta turningLate
        lda #1
        rts
leftNotAvailable3 anop
        lda #0
        rts
        


animatePacEaten entry

        dec pacAnimationTimer
        lda pacAnimationTimer
        bmi incrementEatenAnimationIndex
        rts

incrementEatenAnimationIndex anop
        lda #6 ; animation timer duration
        sta pacAnimationTimer

        inc pacAnimationIndex
        lda pacAnimationIndex
        cmp #15 ; num animation frames
        bcs eatenAnimationFinished
        rts

eatenAnimationFinished anop

        lda #100
        sta postLifeTimer

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
        shiftedToPixel
        sta spriteX
        lda pacY
        shiftedToPixel
        clc
        adc #1
        sta spriteY

        lda pacAnimationIndex
        asl a
        tax

        lda pacEaten
        cmp #0
        bne drawPacEaten
        
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

drawPacEaten anop
        lda pacDieAnimationSprites,x
        jsr drawSpriteByIndex
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

        lda pacOldX
        shiftedToPixel
        sta spriteX
        lda pacOldY
        shiftedToPixel
        clc
        adc #1
        sta spriteY

        jsr eraseSpriteRect

        rts
        

checkDots entry

        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY


        jsr getTileFromTileXY
        cmp #1
        beq eatSmallDot
        cmp #2
        beq eatLargeDot

        rts
        
eatLargeDot anop
        lda #2
        sta temp
        lda #3
        sta pacAteDotDelay
        jsr add50ToScore
        bra eatDot

eatSmallDot anop

; keep track of how many dots have been eaten
; when all the dots are gone, the level is complete

        inc eatenDotCount
        lda #1
        sta temp
        lda #1
        sta pacAteDotDelay
        lda #10
        jsr add10ToScore

eatDot anop

        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        lda #0
        jsr setTileFromTileXY

        lda temp
        stx savex
        jsr pacAteDot
        ldx savex

        jsr playEatDotSound

; check for level complete
        lda eatenDotCount
        cmp totalDotCount
        beq levelDone

        rts

levelDone anop

; level is complete

        jsr stopScaredSound
        jsr stopSiren2Sound
        jsr stopSiren1Sound

        lda #240
        sta levelCompleteTimer

        rts
        
        
checkTunnel anop

        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        jsr getTileFromTileXY
        cmp #8
        beq inTunnel
        rts
       
inTunnel anop

; wrap if going through tunnel
        lda #64
        cmp pacX
        bcs resetToRight
        lda pacX
        cmp #1728
        bcs resetToLeft
        rts

resetToLeft anop
        lda #64
        sta pacX
        rts

resetToRight anop
        lda #1728
        sta pacX
        rts






pacTurnToIntendedDirection entry

        lda pacIntendedDirection
        sta pacDirection

        lda pacDirection

        cmp #DIRECTION_DOWN
        beq pacAlignX
        cmp #DIRECTION_UP
        beq pacAlignX

        cmp #DIRECTION_RIGHT
        beq pacAlignY
        cmp #DIRECTION_LEFT
        beq pacAlignY

        rts

pacAlignX anop

        lda turningOnTime
        cmp #0
        bne alignXOnTime
        lda turningEarly
        cmp #0
        bne alignXEarly
        lda turningLate
        cmp #0
        bne alignXLate
        rts

alignXOnTime anop
        lda turnOnTimeX
        asl a
        asl a
        asl a
        sta pacX
        rts
alignXEarly anop
        lda turnEarlyX
        asl a
        asl a
        asl a
        sta pacX
        rts
alignXLate anop
        lda turnLateX
        asl a
        asl a
        asl a
        sta pacX
        rts


pacAlignY anop

        lda turningOnTime
        cmp #0
        bne alignYOnTime
        lda turningEarly
        cmp #0
        bne alignYEarly
        lda turningLate
        cmp #0
        bne alignYLate
        rts

alignYOnTime anop
        lda turnOnTimeY
        asl a
        asl a
        asl a
        sta pacY
        rts
alignYEarly anop
        lda turnEarlyY
        asl a
        asl a
        asl a
        sta pacY
        rts
alignYLate anop
        lda turnLateY
        asl a
        asl a
        asl a
        sta pacY
        rts





getPacAvailableDirections entry

; get available directions for current tile

        lda pacX
        shiftedToPixel
        and #$fff8
        sta turnOnTimeX
        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
        and #$fff8
        sta turnOnTimeY
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        jsr getAvailableDirectionsFromTileXY
        sta availableDirections

; get available directions for one tile ahead

        jsr getTileXYAhead
        jsr getAvailableDirectionsFromTileXY
        sta availableDirectionsAhead

; get available directions for one tile behind

        jsr getTileXYBehind
        jsr getAvailableDirectionsFromTileXY
        sta availableDirectionsBehind

        rts


getTileXYAhead entry

        lda pacDirection
        cmp #DIRECTION_LEFT
        beq getTileXYAheadLeftShort
        cmp #DIRECTION_RIGHT
        beq getTileXYAheadRightShort
        cmp #DIRECTION_UP
        beq getTileXYAheadUpShort
        cmp #DIRECTION_DOWN
        beq getTileXYAheadDownShort

        rts

getTileXYAheadLeftShort anop
        brl getTileXYAheadLeft
getTileXYAheadRightShort anop
        brl getTileXYAheadRight
getTileXYAheadUpShort anop
        brl getTileXYAheadUp
getTileXYAheadDownShort anop
        brl getTileXYAheadDown

getTileXYAheadLeft anop

        lda pacX
        shiftedToPixel
;        sec
;        sbc #2
        and #$fff8
        sta turnEarlyX
        lda pacX
        shiftedToPixel
;        sec
;        sbc #2
        sta turnEarlyX
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
        and #$fff8
        sta turnEarlyY
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        rts

getTileXYAheadRight anop

        lda pacX
        shiftedToPixel
        clc
        adc #6
        and #$fff8
        sta turnEarlyX
        lda pacX
        shiftedToPixel
        clc
        adc #6
        sta turnEarlyX
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
        and #$fff8
        sta turnEarlyY
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        rts

getTileXYAheadUp anop

        lda pacX
        shiftedToPixel
        and #$fff8
        sta turnEarlyX
        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
; sec
;        sbc #1
        and #$fff8
        sta turnEarlyY
        lda pacY
        shiftedToPixel
;        sec
;        sbc #1
        sta turnEarlyY
        jsr getTileYFromPixelY
        sta tileY

        rts

getTileXYAheadDown anop

        lda pacX
        shiftedToPixel
        and #$fff8
        sta turnEarlyX
        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
        clc
        adc #6
        and #$fff8
        sta turnEarlyY
        lda pacY
        shiftedToPixel
        clc
        adc #6
        sta turnEarlyY
        jsr getTileYFromPixelY
        sta tileY

        rts


getTileXYBehind entry

        lda pacDirection
        cmp #DIRECTION_LEFT
        beq getTileXYBehindLeftShort
        cmp #DIRECTION_RIGHT
        beq getTileXYBehindRightShort
        cmp #DIRECTION_UP
        beq getTileXYBehindUpShort
        cmp #DIRECTION_DOWN
        beq getTileXYBehindDownShort

        rts

getTileXYBehindLeftShort anop
        brl getTileXYBehindLeft
getTileXYBehindRightShort anop
        brl getTileXYBehindRight
getTileXYBehindUpShort anop
        brl getTileXYBehindUp
getTileXYBehindDownShort anop
        brl getTileXYBehindDown

getTileXYBehindLeft anop

        lda pacX
        shiftedToPixel
        clc
        adc #6
        and #$fff8
        sta turnLateX
        lda pacX
        shiftedToPixel
        clc
        adc #6
        sta turnLateX
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
        and #$fff8
        sta turnLateY
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        rts

getTileXYBehindRight anop

        lda pacX
        shiftedToPixel
;        sec
;        sbc #1
        and #$fff8
        sta turnLateX
        lda pacX
        shiftedToPixel
;        sec
;        sbc #1
        sta turnLateX
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
        and #$fff8
        sta turnLateY
        lda pacY
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        rts

getTileXYBehindUp anop

        lda pacX
        shiftedToPixel
        and #$fff8
        sta turnLateX
        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
        clc
        adc #6
        and #$fff8
        sta turnLateY
        lda pacY
        shiftedToPixel
        clc
        adc #6
        sta turnLateY
        jsr getTileYFromPixelY
        sta tileY

        rts

getTileXYBehindDown anop

        lda pacX
        shiftedToPixel
        and #$fff8
        sta turnLateX
        lda pacX
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX

        lda pacY
        shiftedToPixel
;        sec
;        sbc #1
        and #$fff8
        sta turnLateY
        lda pacY
        shiftedToPixel
;        sec
;        sbc #1
        sta turnLateY
        jsr getTileYFromPixelY
        sta tileY

        rts









        
        
availableDirections dc i2'0'
availableDirectionsAhead dc i2'0'
availableDirectionsBehind dc i2'0'


savex dc i4'0'

turnOnTimeX dc i2'0'
turnOnTimeY dc i2'0'

turnEarlyX dc i2'0'
turnEarlyY dc i2'0'

turnLateX dc i2'0'
turnLateY dc i2'0'

turningOnTime dc i2'0'
turningEarly dc i2'0'
turningLate dc i2'0'

        end



pacData data

pacEaten dc i2'0'

    
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
        dc i2'SPRITE_NOP'
        dc i2'SPRITE_PAC_DIE_11'
        dc i2'SPRITE_PAC_DIE_11'
        dc i2'SPRITE_NOP'
        dc i2'SPRITE_NOP'
        dc i2'SPRITE_NOP'



; Initial position in maze is $6c,$88 x 8
pacX dc i2'$360'
pacY dc i2'$440'

pacOldX dc i2'0'
pacOldY dc i2'0'

pacAnimationIndex dc i2'0'
pacAnimationTimer dc i2'0'

pacDirection dc i2'DIRECTION_LEFT'
pacIntendedDirection dc i2'DIRECTION_LEFT'

pacMoving dc i2'0'

pacAteDotDelay dc i2'0'

temp dc i2'0'

        end
