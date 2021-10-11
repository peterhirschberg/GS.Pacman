;
;  ghosts.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/26/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


ghosts start
        using globalData
        using spritesData
        using mazeExchangeData
        using pacData
        using gameData
        using ghostData
        

initGhosts entry

; init the global release timer
        lda #400
        sta ghostReleaseTimer

; init the global ghost mode

        lda #0
        sta ghostMode

; decrement the mode timer every frame

        lda #60
        sta levelModeSecondsDivisor

; set the initial mode timer

        ldx #0
        lda level1GhostModeTimes,x
        sta ghostModeTimer


; init the timer table for this level

ghostModeTimesLoop anop

        lda levelNum
        cmp #5
        bcs level5AndAbove
        cmp #2
        bcs level2To4

; level 1

        lda level1GhostModeTimes,x
        sta ghostModeTimes,x
        bra nextTime

level2To4 anop
        
        lda level2to4GhostModeTimes,x
        sta ghostModeTimes,x
        bra nextTime

level5AndAbove anop

        lda level5plusGhostModeTimes,x
        sta ghostModeTimes,x
        bra nextTime
        
nextTime anop

        inx
        inx
        txa
        cmp #18
        beq ghostModeTimesDone
        bra ghostModeTimesLoop
        
ghostModeTimesDone anop

        rts


resetGhostSpeedStepIndexes entry
        lda #0
        ldy #0
        sta ghostSpeedStepIndex,y
        ldy #2
        sta ghostSpeedStepIndex,y
        ldy #4
        sta ghostSpeedStepIndex,y
        ldy #6
        sta ghostSpeedStepIndex,y
        rts

        
getGhostSpeedSteps entry

        ldx currentGhost
        lda ghostSpeedStepIndex,x
        inc a
        sta ghostSpeedStepIndex,x
        cmp #8
        bne dontResetSpeedStepIndex
        
        lda #0
        sta ghostSpeedStepIndex,x
        
dontResetSpeedStepIndex anop

        lda ghostSpeed,x
        cmp #40
        beq getSteps40
        cmp #45
        beq getSteps45
        cmp #50
        beq getSteps50
        cmp #55
        beq getSteps55
        cmp #60
        beq getSteps60
        cmp #75
        beq getSteps75
        cmp #80
        beq getSteps80
        cmp #85
        beq getSteps85
        cmp #90
        beq getSteps90
        cmp #95
        beq getSteps95
        cmp #100
        beq getSteps100
        cmp #105
        beq getSteps105
        cmp #200
        beq getSteps200

        rts

getSteps40 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps40,y
        rts

getSteps45 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps45,y
        rts

getSteps50 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps50,y
        rts

getSteps55 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps55,y
        rts
        
getSteps60 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps60,y
        rts
        
getSteps75 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps75,y
        rts

getSteps80 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps80,y
        rts
  
getSteps85 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps85,y
        rts

getSteps90 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps90,y
        rts
        
getSteps95 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps95,y
        rts
        
getSteps100 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps100,y
        rts

getSteps105 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps105,y
        rts

getSteps200 anop
        lda ghostSpeedStepIndex,x
        asl a
        tay
        lda speedSteps200,y
        rts
        


runGhosts entry

        jsr runSirenSounds

        jsr runReleaseTimer
        
        jsr runModeTimer

        jsr animateGhosts
        jsr runGhostStateTimers
        jsr checkEatenGhosts

        ldx #GHOSTINDEX_RED
        lda ghostPixelX,x
        sta ghostPixelOldX,x
        lda ghostPixelY,x
        sta ghostPixelOldY,x
        lda #GHOSTINDEX_RED
        sta currentGhost
        jsr setGhostSpeed

        jsr getGhostSpeedSteps
        cmp #0
        beq doPinkRun
        sta runCounter
redRunLoop anop
        jsr runGhost
        dec runCounter
        lda runCounter
        cmp #0
        bne redRunLoop

doPinkRun anop

        ldx #GHOSTINDEX_PINK
        lda ghostPixelX,x
        sta ghostPixelOldX,x
        lda ghostPixelY,x
        sta ghostPixelOldY,x
        lda #GHOSTINDEX_PINK
        sta currentGhost
        jsr setGhostSpeed

        jsr getGhostSpeedSteps
        cmp #0
        beq doBlueRun
        sta runCounter
pinkRunLoop anop
        jsr runGhost
        dec runCounter
        lda runCounter
        cmp #0
        bne pinkRunLoop

doBlueRun anop

        ldx #GHOSTINDEX_BLUE
        lda ghostPixelX,x
        sta ghostPixelOldX,x
        lda ghostPixelY,x
        sta ghostPixelOldY,x
        lda #GHOSTINDEX_BLUE
        sta currentGhost
        jsr setGhostSpeed

        jsr getGhostSpeedSteps
        cmp #0
        beq doOrangeRun
        sta runCounter
blueRunLoop anop
        jsr runGhost
        dec runCounter
        lda runCounter
        cmp #0
        bne blueRunLoop
        
doOrangeRun anop

        ldx #GHOSTINDEX_ORANGE
        lda ghostPixelX,x
        sta ghostPixelOldX,x
        lda ghostPixelY,x
        sta ghostPixelOldY,x
        lda #GHOSTINDEX_ORANGE
        sta currentGhost
        jsr setGhostSpeed

        jsr getGhostSpeedSteps
        sta runCounter
orangeRunLoop anop
        jsr runGhost
        dec runCounter
        lda runCounter
        cmp #0
        bne orangeRunLoop

        rts

        
runReleaseTimer entry

        dec ghostReleaseTimer
        lda ghostReleaseTimer
        bmi releaseGhost
        rts
        
releaseGhost anop

; pick a ghost to release

; first release the blue ghost
        ldy #GHOSTINDEX_BLUE
        lda ghostState,y
        cmp #GHOSTSTATE_PENNED
        beq releaseGhostY

; next release the orange ghost

        ldy #GHOSTINDEX_ORANGE
        lda ghostState,y
        cmp #GHOSTSTATE_PENNED
        beq releaseGhostY

        rts
        
releaseGhostY anop

        lda #GHOSTSTATE_LEAVINGPEN
        sta ghostState,y
        
; reset the release timer
        lda #400
        sta ghostReleaseTimer
        
        rts
        

runModeTimer entry

        dec levelModeSecondsDivisor
        lda levelModeSecondsDivisor
        bmi doRunModeTimer
        cmp #0
        beq doRunModeTimer
        rts
        
doRunModeTimer anop

        lda #60
        sta levelModeSecondsDivisor

        lda ghostModeTimer
        bmi switchMode
        cmp #0
        beq switchMode
        dec ghostModeTimer
        rts

switchMode anop

        inc ghostMode

        lda ghostMode
        cmp #8
        bcs switchModeMaxed

        lda ghostMode
        asl a
        tax
        lda levelGhostModes,x
        sta globalGhostState
        lda ghostModeTimes,x
        sta ghostModeTimer

; if the timer value is 0, make it 1/60 of a second (1 frame)
        cmp #0
        bne timerNotZero
        lda #1
        sta ghostModeTimer
        sta levelModeSecondsDivisor
        
timerNotZero anop

        ldx #0

switchModeLoop anop

        lda ghostState,x
        cmp #GHOSTSTATE_CHASE
        beq switchModeContinue
        cmp #GHOSTSTATE_SCATTER
        beq switchModeContinue
        bra switchModeNext

switchModeContinue anop

; set the new mode

        lda globalGhostState
        sta ghostState,x
        
        lda #0
        sta ghostSpeedStepIndex,x

; reverse directions

        lda ghostDirection,x
        asl a
        tay
        lda reverseDirections,y
        sta ghostDirection,x

        lda ghostPixelX,x
        sta ghostDirChangeX,x
        lda ghostPixelY,x
        sta ghostDirChangeY,x

switchModeNext anop

        inx
        inx
        txa
        cmp #8
        bcs switchModeDone
        bra switchModeLoop

switchModeMaxed anop

        lda #8
        sta ghostMode

switchModeDone anop

        rts

        
runGhost entry

        ldx currentGhost

        jsr runGhostDotCounter
        
        lda ghostState,x
        cmp #GHOSTSTATE_EATEN
        beq ghostNotPenned
        cmp #GHOSTSTATE_REVIVING
        beq ghostReviving
        cmp #GHOSTSTATE_PENNED
        beq ghostPenned
        cmp #GHOSTSTATE_LEAVINGPEN
        beq ghostPenned
        bra ghostNotPenned

ghostReviving anop
        lda ghostPixelY,x
        adc #16
        sta ghostPixelY,x
        cmp #$2c0
        bcs ghostRevived
        rts

ghostRevived anop
        lda #0
        sta ghostDotCounter,x
        lda #GHOSTSTATE_LEAVINGPEN
        sta ghostState,x
        rts

ghostPenned anop

        jsr pickDirection
        ldx currentGhost
        sta ghostDirection,x
        
        lda ghostState,x
        cmp globalGhostState
        bne stillPenned
        
        rts
        
stillPenned anop

        brl dontPickDirection

ghostNotPenned anop

        lda ghostPixelX,x
        shiftedToPixel
        sta spriteX
        lda ghostPixelY,x
        shiftedToPixel
        sta spriteY

        jsr isSpriteCenteredInMazeTile

        cmp #0
        beq dontPickDirection

        jsr isGhostInTunnel
        cmp #0
        bne dontPickDirection

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        jsr getAvailableDirectionsFromTileXY
        sta availableDirections
        jsr excludeForbiddenUpTurns

        jsr countNumAvailableDirections
        cmp #1
        bcs doPickDirection
        bra dontPickDirection

doPickDirection anop

; keep track of where the ghost changes direction and only allow changing direction again after travelling at least 8 units

        lda ghostDirChangeX,x
        sec
        sbc ghostPixelX,x
        absoluteValue
        cmp #$8
        bcs okayToChangeDirections

        lda ghostDirChangeY,x
        sec
        sbc ghostPixelY,x
        absoluteValue
        cmp #$8
        bcs okayToChangeDirections

        bra dontPickDirection

okayToChangeDirections anop

        jsr pickDirection
        ldx currentGhost
        sta ghostDirection,x

; changing direction here so save the XY position where we changed

        lda ghostPixelX,x
        sta ghostDirChangeX,x
        lda ghostPixelY,x
        sta ghostDirChangeY,x

dontPickDirection anop

        ldx currentGhost
        jsr moveGhost

        jsr isGhostInTunnel
        cmp #0
        bne checkTunnel
        rts
        
checkTunnel anop

; wrap if going through tunnel
; these hardcoded values work for the standard maze but may need some thought if maze customization is added
        lda #64
        cmp ghostPixelX,x
        bcs resetToRight
        lda ghostPixelX,x
        cmp #1700
        bcs resetToLeft
        rts
        
resetToLeft anop
        lda #64
        sta ghostPixelX,x
        rts
        
resetToRight anop
        lda #1700
        sta ghostPixelX,x
        rts


pickDirection entry

        ldx currentGhost
        lda ghostState,x
        cmp #GHOSTSTATE_PENNED
        beq doPickPennedDirection
        cmp #GHOSTSTATE_LEAVINGPEN
        beq doPickLeavingPenDirection
        cmp #GHOSTSTATE_CHASE
        beq doChaseState
        cmp #GHOSTSTATE_SCATTER
        beq doScatterState
        cmp #GHOSTSTATE_FRIGHTENED
        beq doFrightenedState
        cmp #GHOSTSTATE_EATEN
        beq doEatenState
        rts
doChaseState anop
        jsr ghostPathfindToTarget
        rts
doScatterState anop
        jsr ghostPathfindToTarget
        rts
doFrightenedState anop
        jsr pickRandomDirection
        rts
doEatenState anop
        jsr ghostPathfindToTarget
        rts
doPickPennedDirection anop
        jsr pickPennedDirection
        rts
doPickLeavingPenDirection anop
        jsr pickLeavingPenDirection
        rts



pickPennedDirection entry

        lda ghostDirection,x
        cmp #DIRECTION_UP
        beq checkPennedUpDirection
        cmp #DIRECTION_DOWN
        beq checkPennedDownDirection
        rts

checkPennedUpDirection anop
        lda ghostPixelY,x
        cmp #$280
        bcs ghostPennedContinueUp
        lda #DIRECTION_DOWN
        rts
ghostPennedContinueUp anop
        lda ghostDirection,x
        rts

checkPennedDownDirection anop
        lda #$2c0
        cmp ghostPixelY,x
        bcs ghostPennedContinueDown
        lda #DIRECTION_UP
        rts
ghostPennedContinueDown anop
        lda ghostDirection,x
        rts

pickLeavingPenDirection entry
        lda ghostPixelX,x
        cmp #$360
        bne pennedGoLeftOrRight
        lda #$200
        cmp ghostPixelY,x
        bcs pennedStartPickMode
        lda #DIRECTION_UP
        rts
pennedGoLeftOrRight anop
        bcs pennedGoLeft
; else go right
        lda #DIRECTION_RIGHT
        rts
pennedGoLeft anop
        lda #DIRECTION_LEFT
        rts
pennedStartPickMode anop

        lda ghostPixelX,x
        and #$fff0
        sta ghostPixelX,x

        lda ghostPixelY,x
        and #$fff0
        sta ghostPixelY,x
        
        lda #$200
        sta ghostPixelY,x
        
        lda ghostPixelX,x
        sta ghostDirChangeX,x
        lda ghostPixelY,x
        sta ghostDirChangeY,x

        lda globalGhostState
        sta ghostState,x

        lda #DIRECTION_LEFT
        rts

pickRandomDirection entry

; Pick a random direction
; Note: ghosts cannot reverse direction (except when changing modes)

        ldx currentGhost

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        jsr getAvailableDirectionsFromTileXY
        sta availableDirections
        jsr excludeForbiddenUpTurns

        lda #0
        sta counter

directionLoop anop

; If more than 4 iterations, allow ghosts to reverse direction. This keeps the game from hanging.

        lda counter
        cmp #4
        bcs allowReverse
        bra dontAllowReverse

allowReverse anop

        jsr getRandomDirAll
        bra checkDirection

dontAllowReverse anop

        jsr getRandomDir

checkDirection anop

        ldx currentGhost

        cmp #DIRECTION_UP
        beq checkUpAvailable
        cmp #DIRECTION_RIGHT
        beq checkRightAvailable
        cmp #DIRECTION_DOWN
        beq checkDownAvailable
        cmp #DIRECTION_LEFT
        beq checkLeftAvailable

        rts

checkUpAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_UP
        cmp #0
        beq directionLoop
        lda #DIRECTION_UP
        rts

checkRightAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq directionLoop
        lda #DIRECTION_RIGHT
        rts

checkDownAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq directionLoop
        lda #DIRECTION_DOWN
        rts

checkLeftAvailable anop
        lda availableDirections
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq directionLoop
        lda #DIRECTION_LEFT
        rts


runGhostDotCounter entry

        lda ghostDotCounter,x
        cmp #0
        beq runDotCounterContinue
        rts

runDotCounterContinue anop

        lda ghostState,x
        cmp #GHOSTSTATE_PENNED
        beq runDotCounterLeavePen
        rts

runDotCounterLeavePen anop

; don't leave pen while any ghost is frightened
        lda ghostsFrightened
        cmp #0
        beq leavePen
        rts
        
leavePen anop

        lda #GHOSTSTATE_LEAVINGPEN
        sta ghostState,x
        rts


moveGhost entry

        ldx currentGhost

        lda ghostDirection,x
        cmp #DIRECTION_UP
        beq moveGhostUp
        cmp #DIRECTION_DOWN
        beq moveGhostDown
        cmp #DIRECTION_LEFT
        beq moveGhostLeft
        cmp #DIRECTION_RIGHT
        beq moveGhostRight

        rts
        
moveGhostUp anop
        lda ghostPixelY,x
        sec
        sbc #4
        sta ghostPixelY,x
        rts

moveGhostDown anop
        lda ghostPixelY,x
        clc
        adc #4
        sta ghostPixelY,x
        rts

moveGhostLeft anop
        lda ghostPixelX,x
        sec
        sbc #4
        sta ghostPixelX,x
        rts

moveGhostRight anop
        lda ghostPixelX,x
        clc
        adc #4
        sta ghostPixelX,x
        rts

        
        
animateGhosts entry

        dec ghostAnimationTimer
        lda ghostAnimationTimer
        bmi incrementAnimationIndex
        rts

incrementAnimationIndex anop
        lda #10 ; animation timer duration
        sta ghostAnimationTimer

        inc ghostAnimationIndex
        lda ghostAnimationIndex
        cmp #2 ; num animation frames
        beq resetAnimationIndex
        rts

resetAnimationIndex anop

        lda #0
        sta ghostAnimationIndex

        rts


runGhostStateTimers entry

        ldx #0

timerGhostLoop anop

        lda ghostStateTimer,x
        cmp #0
        beq nextGhost
        sec
        sbc #1
        sta ghostStateTimer,x

        lda ghostStateTimer,x
        cmp #0
        bne nextGhost

        lda ghostState,x
        cmp #GHOSTSTATE_EATEN
        beq nextGhost

; no longer frightened

        lda #0
        sta ghostSpeedStepIndex,x

        lda globalGhostState
        sta ghostState,x

nextGhost anop

        inx
        inx
        txa
        cmp #8
        bcs timersDone
        bra timerGhostLoop

timersDone anop
        rts


checkEatenGhosts entry

        ldx #0

eatenGhostLoop anop

        lda ghostState,x
        cmp #GHOSTSTATE_POINTS
        bne eatenNextGhost

        lda #0
        sta ghostStateTimer,x

        lda #GHOSTSTATE_EATEN
        sta ghostState,x

        lda ghostPointValue
        cmp #1600
        bne not1600

; Handle the special case of the 1600pts sprite - which is actually comprised of 2 sprites.
; Here we need to erase more than just the single tile that the ghost sprite normally occupies.

        lda ghostPixelX,x
        shiftedToPixel
        sec
        sbc #8
        sta spriteX

        lda ghostPixelY,x
        shiftedToPixel
        sta spriteY

        stx savex
        jsr eraseSpriteRect
        ldx savex

        lda ghostPixelX,x
        shiftedToPixel
        clc
        adc #8
        sta spriteX

        lda ghostPixelY,x
        shiftedToPixel
        sta spriteY

        stx savex
        jsr eraseSpriteRect
        ldx savex


not1600 anop

; Since the "eyes" move very fast, unless they start centered on tile boundries the centering
; check at each intersection will fail unless we reposition them here to tile boundries

        lda ghostPixelX,x
        and #$fff0
        sta ghostPixelX,x

        lda ghostPixelY,x
        and #$fff0
        sta ghostPixelY,x

eatenNextGhost anop

        inx
        inx
        txa
        cmp #8
        bcs eatenDone
        bra eatenGhostLoop

eatenDone anop

        rts



drawGhosts entry

; Sort the ghosts in vertical order, drawing the topmost ghosts first to minimize flicker
; Thanks to Lucas Scharenbroich, Ian Brumby, and John Brooks for contributing to the sorting algorithm

        lda ghostDrawOrder+0
        sta sort1
        lda ghostDrawOrder+4
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+0
        lda sort2
        sta ghostDrawOrder+4

        lda ghostDrawOrder+2
        sta sort1
        lda ghostDrawOrder+6
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+2
        lda sort2
        sta ghostDrawOrder+6
        
        lda ghostDrawOrder+0
        sta sort1
        lda ghostDrawOrder+2
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+0
        lda sort2
        sta ghostDrawOrder+2

        lda ghostDrawOrder+4
        sta sort1
        lda ghostDrawOrder+6
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+4
        lda sort2
        sta ghostDrawOrder+6
        
        lda ghostDrawOrder+2
        sta sort1
        lda ghostDrawOrder+4
        sta sort2
        CmpAndSwap
        lda sort1
        sta ghostDrawOrder+2
        lda sort2
        sta ghostDrawOrder+4

        
        lda #0
        sta ghostCounter

drawGhostLoop anop

        lda ghostCounter
        asl a
        tax

        lda ghostDrawOrder,x

        sta currentGhost
        jsr drawGhost

        inc ghostCounter
        lda ghostCounter
        cmp #4
        beq drawGhostDone
        bra drawGhostLoop
        
drawGhostDone anop

        rts
        

        
drawGhost entry

        ldx currentGhost

        lda ghostPixelX,x
        shiftedToPixel
        sta spriteX
        lda ghostPixelY,x
        shiftedToPixel
        sta spriteY
        
; if ghost is penned and any other ghosts are frightened display them as frightened as well
        lda ghostState,x
        cmp #GHOSTSTATE_PENNED
        bne notPenned
        lda ghostsFrightened
        cmp #0
        bne drawFrightened

notPenned anop
        
        lda ghostState,x
        cmp #GHOSTSTATE_FRIGHTENED
        beq drawFrightened
        cmp #GHOSTSTATE_POINTS
        beq drawPointsShort
        cmp #GHOSTSTATE_EATEN
        beq drawEaten
        cmp #GHOSTSTATE_REVIVING
        beq drawEaten

        lda ghostDirection,x
        cmp #DIRECTION_RIGHT
        beq drawDirectionRight
        cmp #DIRECTION_DOWN
        beq drawDirectionDown
        cmp #DIRECTION_LEFT
        beq drawDirectionLeft
        cmp #DIRECTION_UP
        beq drawDirectionUp
        
        rts


drawPointsShort anop
        brl drawPoints
        rts


drawDirectionRight anop
        jsr doDrawDirectionRight
        rts

drawDirectionDown anop
        jsr doDrawDirectionDown
        rts

drawDirectionLeft anop
        jsr doDrawDirectionLeft
        rts

drawDirectionUp anop
        jsr doDrawDirectionUp
        rts


drawFrightened anop

        lda ghostStateTimer,x
        lsr a
        lsr a
        lsr a
        lsr a
        and #1
        cmp #0
        beq drawFrightenedNonBlink

        lda #100
        cmp ghostStateTimer,x
        bcs drawBlinkState

drawFrightenedNonBlink anop

        lda spriteX
        and #1
        cmp #0
        beq drawFrightenedNonBlinkOdd

        lda ghostAnimationIndex
        asl a
        tax
        lda ghostFrightenedAnimationSprites,x
        jsr drawSpriteByIndex
        rts

drawFrightenedNonBlinkOdd anop
        lda ghostAnimationIndex
        asl a
        tax
        lda ghostFrightenedAnimationOddSprites,x
        jsr drawSpriteByIndex
        rts

drawBlinkState anop
        lda ghostAnimationIndex
        asl a
        tax
        lda ghostFrightenedBlinkAnimationSprites,x
        jsr drawSpriteByIndex
        rts

drawEaten anop
        jsr doDrawEaten
        rts

drawPoints anop
        lda ghostPointValue
        cmp #200
        beq draw200
        cmp #400
        beq draw400
        cmp #800
        beq draw800
        cmp #1600
        beq draw1600
        rts
draw200 anop
        lda #SPRITE_200
        jsr drawSpriteByIndex
        rts
draw400 anop
        lda #SPRITE_400
        jsr drawSpriteByIndex
        rts
draw800 anop
        lda #SPRITE_800
        jsr drawSpriteByIndex
        rts
; see below for the 1600pt draw routine



draw1600 anop

        lda ghostPixelX,x
        shiftedToPixel
        sec
        sbc #8
        sta spriteX

        lda ghostPixelY,x
        shiftedToPixel
        sta spriteY

        stx savex
        lda #SPRITE_1600L
        jsr drawSpriteByIndex
        ldx savex

        lda ghostPixelX,x
        shiftedToPixel
        clc
        adc #8
        sta spriteX

        lda ghostPixelY,x
        shiftedToPixel
        sta spriteY

        stx savex
        lda #SPRITE_1600R
        jsr drawSpriteByIndex
        ldx savex

        rts

        
doDrawDirectionRight entry
        lda ghostAnimationIndex
        asl a
        tax
        jsr getGhostDirectionRightSprite
        jsr drawSpriteByIndex
        rts
        
getGhostDirectionRightSprite entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        bne getGhostDirectionRightSprite1
        lda redGhostRightAnimationSprites,x
        rts
getGhostDirectionRightSprite1 anop
        cmp #GHOSTINDEX_BLUE
        bne getGhostDirectionRightSprite2
        lda blueGhostRightAnimationSprites,x
        rts
getGhostDirectionRightSprite2 anop
        cmp #GHOSTINDEX_PINK
        bne getGhostDirectionRightSprite3
        lda pinkGhostRightAnimationSprites,x
        rts
getGhostDirectionRightSprite3 anop
        cmp #GHOSTINDEX_ORANGE
        bne getGhostDirectionRightSprite4
        lda orangeGhostRightAnimationSprites,x
        rts
getGhostDirectionRightSprite4 anop
        rts


doDrawDirectionDown entry
        lda ghostAnimationIndex
        asl a
        tax
        jsr getGhostDirectionDownSprite
        jsr drawSpriteByIndex
        rts
        
getGhostDirectionDownSprite entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        bne getGhostDirectionDownSprite1
        lda redGhostDownAnimationSprites,x
        rts
getGhostDirectionDownSprite1 anop
        cmp #GHOSTINDEX_BLUE
        bne getGhostDirectionDownSprite2
        lda blueGhostDownAnimationSprites,x
        rts
getGhostDirectionDownSprite2 anop
        cmp #GHOSTINDEX_PINK
        bne getGhostDirectionDownSprite3
        lda pinkGhostDownAnimationSprites,x
        rts
getGhostDirectionDownSprite3 anop
        cmp #GHOSTINDEX_ORANGE
        bne getGhostDirectionDownSprite4
        lda orangeGhostDownAnimationSprites,x
        rts
getGhostDirectionDownSprite4 anop
        rts
        
        
doDrawDirectionLeft entry
        lda ghostAnimationIndex
        asl a
        tax
        jsr getGhostDirectionLeftSprite
        jsr drawSpriteByIndex
        rts
        
getGhostDirectionLeftSprite entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        bne getGhostDirectionLeftSprite1
        lda redGhostLeftAnimationSprites,x
        rts
getGhostDirectionLeftSprite1 anop
        cmp #GHOSTINDEX_BLUE
        bne getGhostDirectionLeftSprite2
        lda blueGhostLeftAnimationSprites,x
        rts
getGhostDirectionLeftSprite2 anop
        cmp #GHOSTINDEX_PINK
        bne getGhostDirectionLeftSprite3
        lda pinkGhostLeftAnimationSprites,x
        rts
getGhostDirectionLeftSprite3 anop
        cmp #GHOSTINDEX_ORANGE
        bne getGhostDirectionLeftSprite4
        lda orangeGhostLeftAnimationSprites,x
        rts
getGhostDirectionLeftSprite4 anop
        rts
        
        
doDrawDirectionUp entry
        lda ghostAnimationIndex
        asl a
        tax
        jsr getGhostDirectionUpSprite
        jsr drawSpriteByIndex
        rts
        
getGhostDirectionUpSprite entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        bne getGhostDirectionUpSprite1
        lda redGhostUpAnimationSprites,x
        rts
getGhostDirectionUpSprite1 anop
        cmp #GHOSTINDEX_BLUE
        bne getGhostDirectionUpSprite2
        lda blueGhostUpAnimationSprites,x
        rts
getGhostDirectionUpSprite2 anop
        cmp #GHOSTINDEX_PINK
        bne getGhostDirectionUpSprite3
        lda pinkGhostUpAnimationSprites,x
        rts
getGhostDirectionUpSprite3 anop
        cmp #GHOSTINDEX_ORANGE
        bne getGhostDirectionUpSprite4
        lda orangeGhostUpAnimationSprites,x
        rts
getGhostDirectionUpSprite4 anop
        rts



doDrawEaten entry

        lda ghostDirection,x
        cmp #DIRECTION_UP
        beq drawEatenUp
        cmp #DIRECTION_DOWN
        beq drawEatenDown
        cmp #DIRECTION_LEFT
        beq drawEatenLeft
        cmp #DIRECTION_RIGHT
        beq drawEatenRight

        rts

drawEatenUp anop
        lda #SPRITE_EYES_UP
        jsr drawSpriteByIndex
        rts
drawEatenDown anop
        lda #SPRITE_EYES_DOWN
        jsr drawSpriteByIndex
        rts
drawEatenLeft anop
        lda #SPRITE_EYES_LEFT
        jsr drawSpriteByIndex
        rts
drawEatenRight anop
        lda #SPRITE_EYES_RIGHT
        jsr drawSpriteByIndex
        rts


        
eraseGhosts entry

        lda #GHOSTINDEX_RED
        sta currentGhost
        jsr eraseGhost

        lda #GHOSTINDEX_PINK
        sta currentGhost
        jsr eraseGhost

        lda #GHOSTINDEX_BLUE
        sta currentGhost
        jsr eraseGhost

        lda #GHOSTINDEX_ORANGE
        sta currentGhost
        jsr eraseGhost

        rts
        
        
eraseGhost entry

        lda currentGhost
        tax

        lda ghostPixelOldX,x
        shiftedToPixel
        sta spriteX
        lda ghostPixelOldY,x
        shiftedToPixel
        sta spriteY

        jsr eraseSpriteRect
        
        rts
        

getRandomDir entry
        inc randomDirIndex
        lda randomDirIndex
        cmp #255
        bne dontResetRandomDirIndex
        lda #0
        sta randomDirIndex
dontResetRandomDirIndex anop
        ldx currentGhost
        lda ghostDirection,x
        cmp #DIRECTION_RIGHT
        beq getNotLeft
        cmp #DIRECTION_DOWN
        beq getNotUp
        cmp #DIRECTION_LEFT
        beq getNotRight
        cmp #DIRECTION_UP
        beq getNotDown
        rts

getNotRight anop
        lda randomDirIndex
        asl a
        tax
        lda randomDirectionNotRight,x
        rts

getNotDown anop
        lda randomDirIndex
        asl a
        tax
        lda randomDirectionNotDown,x
        rts

getNotLeft anop
        lda randomDirIndex
        asl a
        tax
        lda randomDirectionNotLeft,x
        rts

getNotUp anop
        lda randomDirIndex
        asl a
        tax
        lda randomDirectionNotUp,x
        rts

getRandomDirAll entry
        inc randomDirIndex
        lda randomDirIndex
        cmp #255
        bne dontResetRandomDirIndex2
        lda #0
        sta randomDirIndex
dontResetRandomDirIndex2 anop
        asl a
        tax
        lda randomDirectionAll,x
        rts


pacAteDot entry

        cmp #2
        bne ateSmallDot

; ate large dot / power pellet

; reset ghost point value
        lda #0
        sta ghostPointValue

        ldx #0
atePowerPelletLoop anop

; do not frighten ghosts still in the pen (or those already in frightened mode)

        lda ghostState,x
        cmp #GHOSTSTATE_PENNED
        beq skipGhost
        cmp #GHOSTSTATE_LEAVINGPEN
        beq skipGhost
        cmp #GHOSTSTATE_FRIGHTENED
        beq setStateTimer

; set the state
        lda #GHOSTSTATE_FRIGHTENED
        sta ghostState,x
; reverse direction
        lda ghostDirection,x
        asl a
        tay
        lda reverseDirections,y
        sta ghostDirection,x

        lda ghostPixelX,x
        sta ghostDirChangeX,x
        lda ghostPixelY,x
        sta ghostDirChangeY,x

setStateTimer anop

        stx savex
        jsr ghostLevelIndex
        tax
        lda ghostFrightenedTime,x
        ldx savex
        sta ghostStateTimer,x

skipGhost anop

        inx
        inx
        txa
        cmp #8
        beq ateSmallDot
        bra atePowerPelletLoop

ateSmallDot anop

        ldy #GHOSTINDEX_BLUE
        lda ghostState,y
        cmp #GHOSTSTATE_PENNED
        beq decDotCounter

        ldy #GHOSTINDEX_ORANGE
        lda ghostState,y
        cmp #GHOSTSTATE_PENNED
        beq decDotCounter

        lda #400
        sta ghostReleaseTimer
        
        rts

decDotCounter anop

        lda ghostDotCounter,y
        cmp #0
        beq decDotCounterDone
        lda ghostDotCounter,y
        sec
        sbc #1
        sta ghostDotCounter,y
        rts

decDotCounterDone anop
        rts



ghostPathfindToTarget entry

        jsr ghostPickTarget

        ldx currentGhost

; ensure ghosts do not reverse directions

        lda ghostDirection,x
        asl a
        tax
        lda reverseDirections,x
        sta reverseDirection

        ldx currentGhost

; store the target XY

        lda ghostTargetX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta targetX
        lda ghostTargetY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta targetY

; get available directions

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        sta currentTileX
        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY
        sta currentTileY

        jsr getAvailableDirectionsFromTileXY
        sta availableDirections
        jsr excludeForbiddenUpTurns

; init available directions table

        ldy #0
        lda #DIRECTION_NONE
        sta testTargetDirection,y
        ldy #2
        lda #DIRECTION_NONE
        sta testTargetDirection,y
        ldy #4
        lda #DIRECTION_NONE
        sta testTargetDirection,y
        ldy #6
        lda #DIRECTION_NONE
        sta testTargetDirection,y

; set the tileXY in each direction

; up
        ldy #0
        lda currentTileX
        sta testTargetTileX,y
        lda currentTileY
        dec a
        sta testTargetTileY,y

; left
        ldy #2
        lda currentTileX
        dec a
        sta testTargetTileX,y
        lda currentTileY
        sta testTargetTileY,y

; down
        ldy #4
        lda currentTileX
        sta testTargetTileX,y
        lda currentTileY
        inc a
        sta testTargetTileY,y

; right
        ldy #6
        lda currentTileX
        inc a
        sta testTargetTileX,y
        lda currentTileY
        sta testTargetTileY,y

; set availability table for each direction

; up
        lda availableDirections
        and #AVAILABLEDIR_UP
        cmp #0
        beq upNotAvailable
        lda reverseDirection
        cmp #DIRECTION_UP
        beq upNotAvailable
        lda #DIRECTION_UP
        ldy #0
        sta testTargetDirection,y

upNotAvailable anop

; left
        lda availableDirections
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq leftNotAvailable
        lda reverseDirection
        cmp #DIRECTION_LEFT
        beq leftNotAvailable
        lda #DIRECTION_LEFT
        ldy #2
        sta testTargetDirection,y

leftNotAvailable anop

; down
        lda availableDirections
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq downNotAvailable
        lda reverseDirection
        cmp #DIRECTION_DOWN
        beq downNotAvailable
        lda #DIRECTION_DOWN
        ldy #4
        sta testTargetDirection,y

downNotAvailable anop

; right
        lda availableDirections
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq rightNotAvailable
        lda reverseDirection
        cmp #DIRECTION_RIGHT
        beq rightNotAvailable
        lda #DIRECTION_RIGHT
        ldy #6
        sta testTargetDirection,y

rightNotAvailable anop

; measure distances in each direction

        lda #$8000
        sta smallestDistance

        ldy #0

distanceLoop anop

        lda testTargetDirection,y
        cmp #DIRECTION_NONE
        bne getDistance
        brl skipDirection

getDistance anop

; Calculate the distance to target from this XY
; Thanks to Bobbi Webber-Manners, Jason Andersen, and John Brooks for the distance algorithm
;
; if (dx>dy)
;   len = dx + dy*.5;
; else
;   len = dy + dx*.5;

        lda testTargetTileX,y
        sec
        sbc targetX
        absoluteValue
        sta dx

        lda testTargetTileY,y
        sec
        sbc targetY
        absoluteValue
        sta dy

        lda dx
        cmp dy
        bcc dxGreater

; dy greater

        lda dy
        lsr a
        clc
        adc dx
        sta distanceXY
        bra skip

dxGreater anop

        lda dx
        lsr a
        clc
        adc dy
        sta distanceXY

skip anop

        lda smallestDistance
        cmp distanceXY
        bcs distanceIsSmaller
        bra distanceNotSmaller

distanceIsSmaller anop

; set new smallest value and index

        lda distanceXY
        sta smallestDistance
        tya
        sta smallestDistanceIndex

skipDirection anop
distanceNotSmaller anop

        iny
        iny
        tya
        cmp #8
        bcs distanceDone
        brl distanceLoop

distanceDone anop

; get the direction with the smallest distance

        ldy smallestDistanceIndex
        lda testTargetDirection,y

        rts


ghostPickTarget entry

        ldx currentGhost

        lda ghostState,x
        cmp #GHOSTSTATE_EATEN
        beq pickTargetEaten

        cmp #GHOSTSTATE_SCATTER
        bne chaseTarget

        jsr pickScatterTarget

        rts

chaseTarget anop

        jsr pickChaseTarget

        rts


pickTargetEaten anop

        lda #$360
        sta ghostTargetX,x
        lda #$200
        sta ghostTargetY,x

; see if the ghost has reached the top of the monster pit. If so, enter the pit

        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        cmp #8
        bne notReachedPit

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        cmp #13
        beq reachedPit

notReachedPit anop

        rts

reachedPit anop

; reached the pit entrance

        lda #$360
        sta ghostPixelX,x

        lda #GHOSTSTATE_REVIVING
        sta ghostState,x
        rts


pickScatterTarget entry

        lda currentGhost
        cmp #GHOSTINDEX_RED
        beq pickScatterTargetRed
        cmp #GHOSTINDEX_BLUE
        beq pickScatterTargetBlue
        cmp #GHOSTINDEX_PINK
        beq pickScatterTargetPink
        cmp #GHOSTINDEX_ORANGE
        beq pickScatterTargetOrange

        rts

pickScatterTargetRed anop

        lda fakeTargetTimer
        cmp #0
        beq useNormalTarget

useFakeTarget anop

        dec fakeTargetTimer

        lda #8*8
        pixelToShifted
        sta ghostTargetX,x
        lda #2*8
        pixelToShifted
        sta ghostTargetY,x
        rts

useNormalTarget anop

        lda #24*8
        pixelToShifted
        sta ghostTargetX,x
        lda #2*8
        pixelToShifted
        sta ghostTargetY,x
        rts

pickScatterTargetBlue anop
        lda #27*8
        pixelToShifted
        sta ghostTargetX,x
        lda #23*8
        pixelToShifted
        sta ghostTargetY,x
        rts

pickScatterTargetPink anop
        lda #3*8
        pixelToShifted
        sta ghostTargetX,x
        lda #2*8
        pixelToShifted
        sta ghostTargetY,x
        rts

pickScatterTargetOrange anop
        lda #0*8
        pixelToShifted
        sta ghostTargetX,x
        lda #23*8
        pixelToShifted
        sta ghostTargetY,x
        rts


pickChaseTarget entry

        lda currentGhost
        cmp #GHOSTINDEX_RED
        beq pickChaseTargetRed
        cmp #GHOSTINDEX_BLUE
        beq pickChaseTargetBlue
        cmp #GHOSTINDEX_PINK
        beq pickChaseTargetPink
        cmp #GHOSTINDEX_ORANGE
        beq pickChaseTargetOrange

        rts

pickChaseTargetRed anop
        jsr redGhostPickTarget
        rts
pickChaseTargetBlue anop
        jsr blueGhostPickTarget
        rts
pickChaseTargetPink anop
        jsr pinkGhostPickTarget
        rts
pickChaseTargetOrange anop
        jsr orangeGhostPickTarget
        rts



redGhostPickTarget entry

; target pac directly

        lda pacX
        sta ghostTargetX,x
        lda pacY
        sta ghostTargetY,x

        rts



blueGhostPickTarget entry

; first get 2 tiles ahead of pac

        ldx currentGhost
        lda pacDirection
        cmp #DIRECTION_DOWN
        beq bluePickTargetDown
        cmp #DIRECTION_LEFT
        beq bluePickTargetLeft
        cmp #DIRECTION_RIGHT
        beq bluePickTargetRight
        cmp #DIRECTION_UP
        beq bluePickTargetUp

bluePickTargetDown anop
        jsr getBluePacTargetDown
        bra bluePickTarget
bluePickTargetLeft anop
        jsr getBluePacTargetLeft
        bra bluePickTarget
bluePickTargetRight anop
        jsr getBluePacTargetRight
        bra bluePickTarget
bluePickTargetUp anop
        jsr getBluePacTargetUp
        bra bluePickTarget

bluePickTarget anop

; get the XY distance between the red ghost and 2 tiles ahead of pac

        ldy #GHOSTINDEX_RED

        lda #0
        sta dxIsNeg
        lda ghostPixelX,y
        sec
        sbc bluePacTargetX
        sta dx
        bmi dxNeg
        bra getYDiff

dxNeg anop

        lda #1
        sta dxIsNeg

        lda dx
        absoluteValue
        sta dx

getYDiff anop

        lda #0
        sta dyIsNeg
        lda ghostPixelY,y
        sec
        sbc bluePacTargetY
        sta dy
        bmi dyNeg
        bra getBlueTarget

dyNeg anop

        lda #1
        sta dyIsNeg

        lda dy
        absoluteValue
        sta dy

getBlueTarget anop

; target is twice the XY distance from red ghost to 2 tiles ahead of pac

        lda dxIsNeg
        cmp #0
        bne doBlueXNeg

        lda ghostPixelX,y
        clc
        adc dx
        clc
        adc dx
        sta ghostTargetX,x
        bra doBlueYTarget

doBlueXNeg anop

        lda ghostPixelX,y
        sec
        sbc dx
        sec
        sbc dx
        sta ghostTargetX,x

doBlueYTarget anop

        lda dyIsNeg
        cmp #0
        bne doBlueYNeg

        lda ghostPixelY,y
        clc
        adc dy
        clc
        adc dy
        sta ghostTargetY,x
        bra blueTargetDone

doBlueYNeg anop

        lda ghostPixelY,y
        sec
        sbc dy
        sec
        sbc dy
        sta ghostTargetY,x

blueTargetDone anop

        rts

getBluePacTargetDown entry
        lda pacX
        sta bluePacTargetX
        lda pacY
        clc
        adc #$80 ; CONVERT TO TILES <<<<<
        sta bluePacTargetY
        rts

getBluePacTargetLeft entry
        lda pacX
        sec
        sbc #$80 ; CONVERT TO TILES <<<<<
        sta bluePacTargetX
        lda pacY
        sta bluePacTargetY
        rts

getBluePacTargetRight entry
        lda pacX
        clc
        adc #$80 ; CONVERT TO TILES <<<<<
        sta bluePacTargetX
        lda pacY
        sta bluePacTargetY
        rts

getBluePacTargetUp entry
        lda pacX
        sec
        sbc #$80 ; CONVERT TO TILES <<<<<
        sta bluePacTargetX
        lda pacY
        sec
        sbc #$80 ; CONVERT TO TILES <<<<<
        sta bluePacTargetY
        rts




pinkGhostPickTarget entry

; target 4 tiles ahead of pac (with the exception of up, which targets 4 up and 4 left of pac)

        ldx currentGhost
        lda pacDirection
        cmp #DIRECTION_DOWN
        beq pinkPickTargetDown
        cmp #DIRECTION_LEFT
        beq pinkPickTargetLeft
        cmp #DIRECTION_RIGHT
        beq pinkPickTargetRight
        cmp #DIRECTION_UP
        beq pinkPickTargetUp
        rts

pinkPickTargetDown anop
        lda pacX
        sta ghostTargetX,x
        lda pacY
        clc
        adc #$100 ; CONVERT TO TILES <<<<<
        sta ghostTargetY,x
        rts

pinkPickTargetLeft anop
        lda pacX
        sec
        sbc #$100 ; CONVERT TO TILES <<<<<
        sta ghostTargetX,x
        lda pacY
        sta ghostTargetY,x
        rts

pinkPickTargetRight anop
        lda pacX
        clc
        adc #$100 ; CONVERT TO TILES <<<<<
        sta ghostTargetX,x
        lda pacY
        sta ghostTargetY,x
        rts

pinkPickTargetUp anop
        lda pacX
        sec
        sbc #$100 ; CONVERT TO TILES <<<<<
        sta ghostTargetX,x
        lda pacY
        sec
        sbc #$100 ; CONVERT TO TILES <<<<<
        sta ghostTargetY,x
        rts


orangeGhostPickTarget entry

; if pac is less than 8 tiles away from the orange ghost then target preferred corner (lower left), otherwise target pac

        ldx currentGhost

; CONVERT TO TILES <<<<<
        lda ghostPixelX,x
        shiftedToPixel
        sec
        sbc pacX
        absoluteValue
        sta dx

; CONVERT TO TILES <<<<<
        lda ghostPixelY,x
        shiftedToPixel
        sec
        sbc pacY
        absoluteValue
        sta dy

        lda dx
        cmp dy
        bcc dxGreaterOrange

; dy greater

        lda dy
        lsr a
        clc
        adc dx
        sta distanceXY
        bra orangeCheckDistance

dxGreaterOrange anop

        lda dx
        lsr a
        clc
        adc dy
        sta distanceXY

orangeCheckDistance anop

        lda distanceXY
        cmp #$620 ; approx 8 tiles
        bcs orangeTargetPac
        bra orangeDontTargetPac

orangeDontTargetPac anop

; go to preferred corner

        lda #0
        jsr getPixelXFromTileX
        pixelToShifted
        sta ghostTargetX,x

        lda #20
        sta tileY
        jsr getPixelYFromTileY
        pixelToShifted
        sta ghostTargetY,x

        rts

orangeTargetPac anop

; target pac

        lda pacX
        sta ghostTargetX,x
        lda pacY
        sta ghostTargetY,x

        rts


isGhostInTunnel entry

        ldx currentGhost

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX
        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        jsr getTileFromTileXY
        ldx currentGhost
        cmp #8
        bne notInTunnel

        lda #1
        rts

notInTunnel anop

        lda #0
        rts


setGhostSpeed entry

		ldx currentGhost

        lda ghostState,x
        cmp #GHOSTSTATE_EATEN
        beq speedEaten

        jsr isGhostInTunnel
        cmp #0
        beq speedNotInTunnel
        jsr getGhostLevelSpeedTunnel
        sta ghostSpeed,x
        rts

speedEaten anop
        lda #200
        sta ghostSpeed,x
        rts

speedNotInTunnel anop

		lda ghostState,x
		cmp #GHOSTSTATE_FRIGHTENED
		bne speedNotFrightened
		jsr getGhostLevelSpeedFrightened
        sta ghostSpeed,x
		rts

speedNotFrightened anop

        lda ghostState,x
        cmp #GHOSTSTATE_PENNED
        beq speedGhostPenned
        cmp #GHOSTSTATE_LEAVINGPEN
        beq speedGhostPenned
        bra speedGhostNotPenned

speedGhostPenned anop

        lda #50
        sta ghostSpeed,x
        rts

speedGhostNotPenned anop
        jsr getGhostLevelSpeed
        sta ghostSpeed,x
		rts
        

; TODO - Elroy1 and 2
getGhostLevelSpeed entry
        lda currentGhost
        cmp #GHOSTINDEX_RED
        beq getRedGhostLevelSpeed
        jsr ghostLevelIndex
        tay
        lda ghostNormalSpeed,y
        rts

getRedGhostLevelSpeed anop

        lda totalDotCount
        clc
        sbc eatenDotCount
        sta remainingDots
        
        jsr ghostLevelIndex
        tay
        lda elroy1LevelDotCount,y
        cmp remainingDots
        bcs getElroy2Speed
        lda elroy2LevelDotCount,y
        cmp remainingDots
        bcs getElroy1Speed

        jsr ghostLevelIndex
        tay
        lda ghostNormalSpeed,y

        rts
        
getElroy1Speed anop
        jsr ghostLevelIndex
        tay
        lda ghostElroy1Speed,y
        rts

getElroy2Speed anop
        jsr ghostLevelIndex
        tay
        lda ghostElroy2Speed,y
        rts

getGhostLevelSpeedFrightened entry
        jsr ghostLevelIndex
        tay
        lda ghostFrightenedSpeed,y
        rts

getGhostLevelSpeedTunnel entry
        jsr ghostLevelIndex
        tay
        lda ghostTunnelSpeed,y
        rts



excludeForbiddenUpTurns entry

; ghosts are forbidden from turning "up" at certain locations in the maze

        ldx currentGhost

        lda ghostPixelX,x
        shiftedToPixel
        jsr getTileXFromPixelX
        sta tileX

        lda ghostPixelY,x
        shiftedToPixel
        jsr getTileYFromPixelY
        sta tileY

        lda tileX
        cmp #$C
        beq keepChecking1
        bra nextCheck2
keepChecking1 anop
        lda tileY
        cmp #$8
        beq removeUpDirection

nextCheck2 anop

        lda tileX
        cmp #$F
        beq keepChecking2
        bra nextCheck3
keepChecking2 anop
        lda tileY
        cmp #$8
        beq removeUpDirection

nextCheck3 anop

        lda tileX
        cmp #$9
        beq keepChecking3
        bra nextCheck4
keepChecking3 anop
        lda tileY
        cmp #$F
        beq removeUpDirection

nextCheck4 anop

        lda tileX
        cmp #$12
        beq keepChecking4
        bra checkingDone
keepChecking4 anop
        lda tileY
        cmp #$F
        beq removeUpDirection

checkingDone anop

        rts

removeUpDirection anop

        lda availableDirections
        and #$FFFE
        sta availableDirections

        rts




countNumAvailableDirections entry

        ldx currentGhost
        lda ghostDirection,x
        asl a
        tay
        lda reverseDirections,y
        sta reverseDirection

        ldy #0

        lda availableDirections
        and #AVAILABLEDIR_UP
        cmp #0
        beq dontCountUp
        cmp reverseDirection
        beq dontCountUp
        iny
dontCountUp anop
        lda availableDirections
        and #AVAILABLEDIR_DOWN
        cmp #0
        beq dontCountDown
        cmp reverseDirection
        beq dontCountDown
        iny
dontCountDown anop
        lda availableDirections
        and #AVAILABLEDIR_LEFT
        cmp #0
        beq dontCountLeft
        cmp reverseDirection
        beq dontCountLeft
        iny
dontCountLeft anop
        lda availableDirections
        and #AVAILABLEDIR_RIGHT
        cmp #0
        beq dontCountRight
        cmp reverseDirection
        beq dontCountRight
        iny
dontCountRight anop
        tya

        rts



runSirenSounds entry

        lda levelCompleteTimer
        cmp #0
        beq sirenContinue
        rts

sirenContinue anop

        lda #0
        sta ghostsFrightened
        sta ghostsEaten

        ldx #0

sirenLoop anop

        lda ghostState,x
        cmp #GHOSTSTATE_FRIGHTENED
        bne sirenCheckEaten

        lda #1
        sta ghostsFrightened

sirenCheckEaten anop

        lda ghostState,x
        cmp #GHOSTSTATE_EATEN
        bne sirenNext

        lda #1
        sta ghostsEaten

sirenNext anop

        inx
        inx
        txa
        cmp #8
        bcs sirenDone
        bra sirenLoop

sirenDone anop

        lda ghostsEaten
        cmp #0
        bne sirenGhostsEaten

        lda ghostsFrightened
        cmp #0
        bne sirenGhostsFrightened

; Play normal siren sound

        jsr stopScaredSound
        jsr stopSiren2Sound
        jsr startSiren1Sound

; Man, this is a stupid place to put this but I've already done all the necessary tests here. <_<
; This resets the ghost point values after all ghosts have returned to normal state.

        lda #0
        sta ghostPointValue

        rts

sirenGhostsEaten anop

        jsr stopScaredSound
        jsr startSiren2Sound
        jsr stopSiren1Sound

        rts

sirenGhostsFrightened anop

        jsr startScaredSound
        jsr stopSiren2Sound
        jsr stopSiren1Sound

        rts
        
      
ghostLevelIndex entry

        lda levelNum
        cmp #20
        bcs limitLevelIndex
        asl a
        rts

limitLevelIndex anop

        lda #20
        asl a

        rts


        
currentGhost dc i2'0'

reverseDirection dc i2'0'

ghostAnimationIndex dc i2'0'
ghostAnimationTimer dc i2'0'

availableDirections dc i2'0'

ghostDrawOrder anop
        dc i2'GHOSTINDEX_RED'
        dc i2'GHOSTINDEX_PINK'
        dc i2'GHOSTINDEX_BLUE'
        dc i2'GHOSTINDEX_ORANGE'
        
ghostCounter dc i2'0'

sort1 dc i2'0'
sort2 dc i2'0'

currentPixelX dc i2'0'
currentPixelY dc i2'0'

targetX dc i2'0'
targetY dc i2'0'

currentTileX dc i2'0'
currentTileY dc i2'0'

testTargetTileX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

testTargetTileY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

testTargetPixelX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

testTargetPixelY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

testTargetDirection anop
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'
        dc i2'DIRECTION_NONE'

testTargetDistance anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

smallestDistance dc i2'0'
smallestDistanceIndex dc i2'0'

dx dc i2'0'
dy dc i2'0'
dxIsNeg dc i2'0'
dyIsNeg dc i2'0'
distanceXY dc i2'0'

bluePacTargetX dc i2'0'
bluePacTargetY dc i2'0'
blueRedTargetX dc i2'0'
blueRedTargetY dc i2'0'

savex dc i2'0'
savey dc i2'0'

counter dc i2'0'

runCounter dc i2'0'

        end



ghostData data
    
ghostReleaseTimer dc i2'0'
    
remainingDots dc i2'0'

ghostsFrightened dc i2'0'
ghostsEaten dc i2'0'

ghostPointValue dc i2'0'


GHOSTINDEX_RED          gequ 0*2
GHOSTINDEX_PINK         gequ 1*2
GHOSTINDEX_BLUE         gequ 2*2
GHOSTINDEX_ORANGE       gequ 3*2

GHOSTSTATE_CHASE        gequ 0
GHOSTSTATE_SCATTER      gequ 1
GHOSTSTATE_FRIGHTENED   gequ 2
GHOSTSTATE_POINTS       gequ 3
GHOSTSTATE_EATEN        gequ 4
GHOSTSTATE_REVIVING     gequ 5
GHOSTSTATE_PENNED       gequ 6
GHOSTSTATE_LEAVINGPEN   gequ 7


ghostPixelX anop
        dc i2'$360'
        dc i2'$360'
        dc i2'$2e0'
        dc i2'$3e0'

ghostPixelY anop
        dc i2'$200'
        dc i2'$2a0'
        dc i2'$2a0'
        dc i2'$2a0'

ghostPixelOldX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostPixelOldY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostInitialPixelX anop
        dc i2'$360'
        dc i2'$360'
        dc i2'$2e0'
        dc i2'$3e0'

ghostInitialPixelY anop
        dc i2'$200'
        dc i2'$2a0'
        dc i2'$2a0'
        dc i2'$2a0'

ghostDirChangeX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostDirChangeY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostTileX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        
ghostTileY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        
ghostTargetX anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostTargetY anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostState anop
        dc i2'GHOSTSTATE_SCATTER'
        dc i2'GHOSTSTATE_LEAVINGPEN'
        dc i2'GHOSTSTATE_PENNED'
        dc i2'GHOSTSTATE_PENNED'

ghostInitialState anop
        dc i2'GHOSTSTATE_SCATTER'
        dc i2'GHOSTSTATE_LEAVINGPEN'
        dc i2'GHOSTSTATE_PENNED'
        dc i2'GHOSTSTATE_PENNED'

ghostStateTimer anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

ghostDirection anop
        dc i2'DIRECTION_LEFT'
        dc i2'DIRECTION_UP'
        dc i2'DIRECTION_UP'
        dc i2'DIRECTION_UP'

ghostInitialDirection anop
        dc i2'DIRECTION_LEFT'
        dc i2'DIRECTION_UP'
        dc i2'DIRECTION_UP'
        dc i2'DIRECTION_UP'

ghostSpeed anop
        dc i2'8'
        dc i2'8'
        dc i2'8'
        dc i2'8'

ghostDotCounter anop
        dc i2'0'
        dc i2'0'
        dc i2'20'
        dc i2'40'

ghostInitialDotCounter anop
        dc i2'0'
        dc i2'0'
        dc i2'20'
        dc i2'40'

ghostSpeedStepIndex anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        
        
redGhostLeftAnimationSprites anop
        dc i2'SPRITE_REDGHOST_LEFT_1'
        dc i2'SPRITE_REDGHOST_LEFT_2'
        
redGhostRightAnimationSprites anop
        dc i2'SPRITE_REDGHOST_RIGHT_1'
        dc i2'SPRITE_REDGHOST_RIGHT_2'
        
redGhostUpAnimationSprites anop
        dc i2'SPRITE_REDGHOST_UP_1'
        dc i2'SPRITE_REDGHOST_UP_2'
        
redGhostDownAnimationSprites anop
        dc i2'SPRITE_REDGHOST_DOWN_1'
        dc i2'SPRITE_REDGHOST_DOWN_2'
        
        
blueGhostLeftAnimationSprites anop
        dc i2'SPRITE_BLUEGHOST_LEFT_1'
        dc i2'SPRITE_BLUEGHOST_LEFT_2'
        
blueGhostRightAnimationSprites anop
        dc i2'SPRITE_BLUEGHOST_RIGHT_1'
        dc i2'SPRITE_BLUEGHOST_RIGHT_2'
        
blueGhostUpAnimationSprites anop
        dc i2'SPRITE_BLUEGHOST_UP_1'
        dc i2'SPRITE_BLUEGHOST_UP_2'
        
blueGhostDownAnimationSprites anop
        dc i2'SPRITE_BLUEGHOST_DOWN_1'
        dc i2'SPRITE_BLUEGHOST_DOWN_2'
        

pinkGhostLeftAnimationSprites anop
        dc i2'SPRITE_PINKGHOST_LEFT_1'
        dc i2'SPRITE_PINKGHOST_LEFT_2'
        
pinkGhostRightAnimationSprites anop
        dc i2'SPRITE_PINKGHOST_RIGHT_1'
        dc i2'SPRITE_PINKGHOST_RIGHT_2'
        
pinkGhostUpAnimationSprites anop
        dc i2'SPRITE_PINKGHOST_UP_1'
        dc i2'SPRITE_PINKGHOST_UP_2'
        
pinkGhostDownAnimationSprites anop
        dc i2'SPRITE_PINKGHOST_DOWN_1'
        dc i2'SPRITE_PINKGHOST_DOWN_2'


orangeGhostLeftAnimationSprites anop
        dc i2'SPRITE_ORANGEGHOST_LEFT_1'
        dc i2'SPRITE_ORANGEGHOST_LEFT_2'
        
orangeGhostRightAnimationSprites anop
        dc i2'SPRITE_ORANGEGHOST_RIGHT_1'
        dc i2'SPRITE_ORANGEGHOST_RIGHT_2'
        
orangeGhostUpAnimationSprites anop
        dc i2'SPRITE_ORANGEGHOST_UP_1'
        dc i2'SPRITE_ORANGEGHOST_UP_2'
        
orangeGhostDownAnimationSprites anop
        dc i2'SPRITE_ORANGEGHOST_DOWN_1'
        dc i2'SPRITE_ORANGEGHOST_DOWN_2'


ghostFrightenedAnimationSprites anop
        dc i2'SPRITE_FLEEGHOST_1'
        dc i2'SPRITE_FLEEGHOST_2'

ghostFrightenedAnimationOddSprites anop
        dc i2'SPRITE_FLEEGHOST_ODD_1'
        dc i2'SPRITE_FLEEGHOST_ODD_2'

ghostFrightenedBlinkAnimationSprites anop
        dc i2'SPRITE_FLEEBLINKGHOST_1'
        dc i2'SPRITE_FLEEBLINKGHOST_2'


ghostModeTimes anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

level1GhostModeTimes anop
		dc i2'7' ; scatter
		dc i2'20' ; chase
		dc i2'7' ; scatter
		dc i2'20' ; chase
		dc i2'5' ; scatter
		dc i2'20' ; chase
		dc i2'5' ; scatter
		dc i2'-1' ; chase
        
level2to4GhostModeTimes anop
        dc i2'7' ; scatter
        dc i2'20' ; chase
        dc i2'7' ; scatter
        dc i2'20' ; chase
        dc i2'5' ; scatter
        dc i2'1033' ; chase
        dc i2'0' ; scatter
        dc i2'-1' ; chase

level5plusGhostModeTimes anop
        dc i2'7' ; scatter
        dc i2'20' ; chase
        dc i2'7' ; scatter
        dc i2'20' ; chase
        dc i2'5' ; scatter
        dc i2'1037' ; chase
        dc i2'0' ; scatter
        dc i2'-1' ; chase
        
levelGhostModes anop
		dc i2'GHOSTSTATE_SCATTER'
		dc i2'GHOSTSTATE_CHASE'
		dc i2'GHOSTSTATE_SCATTER'
		dc i2'GHOSTSTATE_CHASE'
		dc i2'GHOSTSTATE_SCATTER'
		dc i2'GHOSTSTATE_CHASE'
		dc i2'GHOSTSTATE_SCATTER'
		dc i2'GHOSTSTATE_CHASE'
        
; LEVEL-BASED VALUES

ghostNormalSpeed anop
        dc i2'75' ; level 1
        dc i2'85' ; level 2
        dc i2'85' ; level 3
        dc i2'85' ; level 4
        dc i2'95' ; level 5
        dc i2'95' ; level 6
        dc i2'95' ; level 7
        dc i2'95' ; level 8
        dc i2'95' ; level 9
        dc i2'95' ; level 10
        dc i2'95' ; level 11
        dc i2'95' ; level 12
        dc i2'95' ; level 13
        dc i2'95' ; level 14
        dc i2'95' ; level 15
        dc i2'95' ; level 16
        dc i2'95' ; level 17
        dc i2'95' ; level 18
        dc i2'95' ; level 19
        dc i2'95' ; level 20
        dc i2'95' ; level 21

ghostElroy1Speed anop
        dc i2'80' ; level 1
        dc i2'90' ; level 2
        dc i2'90' ; level 3
        dc i2'90' ; level 4
        dc i2'100' ; level 5
        dc i2'100' ; level 6
        dc i2'100' ; level 7
        dc i2'100' ; level 8
        dc i2'100' ; level 9
        dc i2'100' ; level 10
        dc i2'100' ; level 11
        dc i2'100' ; level 12
        dc i2'100' ; level 13
        dc i2'100' ; level 14
        dc i2'100' ; level 15
        dc i2'100' ; level 16
        dc i2'100' ; level 17
        dc i2'100' ; level 18
        dc i2'100' ; level 19
        dc i2'100' ; level 20
        dc i2'100' ; level 21

ghostElroy2Speed anop
        dc i2'85' ; level 1
        dc i2'95' ; level 2
        dc i2'95' ; level 3
        dc i2'95' ; level 4
        dc i2'105' ; level 5
        dc i2'105' ; level 6
        dc i2'105' ; level 7
        dc i2'105' ; level 8
        dc i2'105' ; level 9
        dc i2'105' ; level 10
        dc i2'105' ; level 11
        dc i2'105' ; level 12
        dc i2'105' ; level 13
        dc i2'105' ; level 14
        dc i2'105' ; level 15
        dc i2'105' ; level 16
        dc i2'105' ; level 17
        dc i2'105' ; level 18
        dc i2'105' ; level 19
        dc i2'105' ; level 20
        dc i2'105' ; level 21

ghostFrightenedSpeed anop
        dc i2'50' ; level 1
        dc i2'55' ; level 2
        dc i2'55' ; level 3
        dc i2'55' ; level 4
        dc i2'60' ; level 5
        dc i2'60' ; level 6
        dc i2'60' ; level 7
        dc i2'60' ; level 8
        dc i2'60' ; level 9
        dc i2'60' ; level 10
        dc i2'60' ; level 11
        dc i2'60' ; level 12
        dc i2'60' ; level 13
        dc i2'60' ; level 14
        dc i2'60' ; level 15
        dc i2'60' ; level 16
        dc i2'60' ; level 17
        dc i2'60' ; level 18
        dc i2'60' ; level 19
        dc i2'60' ; level 20
        dc i2'60' ; level 21
        
ghostTunnelSpeed anop
        dc i2'40' ; level 1
        dc i2'45' ; level 2
        dc i2'45' ; level 3
        dc i2'45' ; level 4
        dc i2'50' ; level 5
        dc i2'50' ; level 6
        dc i2'50' ; level 7
        dc i2'50' ; level 8
        dc i2'50' ; level 9
        dc i2'50' ; level 10
        dc i2'50' ; level 11
        dc i2'50' ; level 12
        dc i2'50' ; level 13
        dc i2'50' ; level 14
        dc i2'50' ; level 15
        dc i2'50' ; level 16
        dc i2'50' ; level 17
        dc i2'50' ; level 18
        dc i2'50' ; level 19
        dc i2'50' ; level 20
        dc i2'50' ; level 21
        
elroy1LevelDotCount anop
        dc i2'20' ; level 1
        dc i2'30' ; level 2
        dc i2'40' ; level 3
        dc i2'40' ; level 4
        dc i2'40' ; level 5
        dc i2'50' ; level 6
        dc i2'50' ; level 7
        dc i2'50' ; level 8
        dc i2'60' ; level 9
        dc i2'60' ; level 10
        dc i2'60' ; level 11
        dc i2'80' ; level 12
        dc i2'80' ; level 13
        dc i2'80' ; level 14
        dc i2'100' ; level 15
        dc i2'100' ; level 16
        dc i2'100' ; level 17
        dc i2'100' ; level 18
        dc i2'120' ; level 19
        dc i2'120' ; level 20
        dc i2'120' ; level 21
        
elroy2LevelDotCount anop
        dc i2'10' ; level 1
        dc i2'15' ; level 2
        dc i2'20' ; level 3
        dc i2'20' ; level 4
        dc i2'20' ; level 5
        dc i2'25' ; level 6
        dc i2'25' ; level 7
        dc i2'25' ; level 8
        dc i2'30' ; level 9
        dc i2'30' ; level 10
        dc i2'30' ; level 11
        dc i2'40' ; level 12
        dc i2'40' ; level 13
        dc i2'40' ; level 14
        dc i2'50' ; level 15
        dc i2'50' ; level 16
        dc i2'50' ; level 17
        dc i2'50' ; level 18
        dc i2'60' ; level 19
        dc i2'60' ; level 20
        dc i2'60' ; level 21

ghostFrightenedTime anop
        dc i2'60*6' ; level 1
        dc i2'60*5' ; level 2
        dc i2'60*4' ; level 3
        dc i2'60*3' ; level 4
        dc i2'60*2' ; level 5
        dc i2'60*5' ; level 6
        dc i2'60*2' ; level 7
        dc i2'60*2' ; level 8
        dc i2'60*1' ; level 9
        dc i2'60*5' ; level 10
        dc i2'60*2' ; level 11
        dc i2'60*1' ; level 12
        dc i2'60*1' ; level 13
        dc i2'60*3' ; level 14
        dc i2'60*1' ; level 15
        dc i2'60*1' ; level 16
        dc i2'1'    ; level 17
        dc i2'60*1' ; level 18
        dc i2'1'    ; level 19
        dc i2'1'    ; level 20
        dc i2'1'    ; level 21



ghostModeTimer dc i2'0'
levelModeSecondsDivisor dc i2'0'

ghostMode dc i2'0'

globalGhostState dc i2'GHOSTSTATE_SCATTER'

fakeTargetTimer dc i2'20'
        
; Precalculated pseudo-random directions -
; For performance reasons the values are calculated to be non-repeating and each
; table is random directions excluding the reverse direction since the ghosts
; cannot reverse directions under normal circumstances


randomDirIndex dc i2'0'

randomDirectionNotRight anop
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'


randomDirectionNotLeft anop
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'


randomDirectionNotUp anop
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'


randomDirectionNotDown anop
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'

randomDirectionAll anop
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'1'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'3'
        dc i2'0'
        dc i2'3'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'3'
        dc i2'2'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'0'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'1'
        dc i2'0'
        dc i2'1'
        dc i2'2'
        dc i2'1'
        dc i2'3'
        dc i2'2'
        dc i2'3'

        end
