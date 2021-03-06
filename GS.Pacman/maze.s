;
;  maze.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/19/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


maze start
        using globalData
        using spritesData
        using mazeData
        using mazeExchangeData
        
    
getTileFromTileXY entry

        lda tileX
        asl a
        sta tileX

        lda tileY
        asl a
        tax
        lda mazeTileRowOffsets,x
        clc
        adc tileX
        tax
        lda >mazeTileList,x

        rts

saveTileX dc i2'0'
saveTileY dc i2'0'
        
setTileFromTileXY entry

        sta newTile
        
        lda tileX
        sta saveTileX
        lda tileY
        sta saveTileY

        jsr updateMazeTile ; this erases the tile from the screen and maze buffer

; this set the tile value to the new tile value

        lda saveTileX
        sta tileX
        lda saveTileY
        sta tileY

        lda tileX
        asl a
        sta temp

        lda tileY
        asl a
        tax
        lda mazeTileRowOffsets,x
        clc
        adc temp
        tax
        lda newTile
        lda #0 ; TEMP - always set tile to 0
        sta >mazeTileList,x

        rts
        
        
getTileXFromPixelX entry

        lsr a
        lsr a
        lsr a

        rts
    
getTileYFromPixelY entry

        lsr a
        lsr a
        lsr a

        rts
    
getPixelXFromTileX entry

        asl a
        asl a
        asl a
; PDHTODO is this 4 pixel offset correct?
        clc
        adc #4

        rts
    
getPixelYFromTileY entry

        asl a
        asl a
        asl a
; PDHTODO is this 4 pixel offset correct?
        clc
        adc #4

        rts
        
isSpriteCenteredInMazeTile entry

        lda spriteX
        and #7
        sta tileX

        lda spriteY
        and #7
        sta tileY

        lda tileX
        cmp #0
        beq checkY
        lda #0
        rts
        
checkY anop

        lda tileY
        cmp #0
        beq isCentered
        lda #0
        rts

isCentered anop

        lda #1

        rts
        
isPacCenteredInMazeTile entry
        
        lda spriteX
        and #7
        sta tileX
        
        lda spriteY
        and #7
        sta tileY
        
        lda tileX
        cmp #0
        beq checkPacY
        cmp #1
        beq checkPacY
        cmp #2
        beq checkPacY
        cmp #7
        beq checkPacY
        cmp #6
        beq checkPacY
        lda #0
        rts
        
checkPacY anop
        
        lda tileY
        cmp #0
        beq isPacCentered
        cmp #1
        beq isPacCentered
        cmp #2
        beq isPacCentered
        cmp #7
        beq isPacCentered
        cmp #6
        beq isPacCentered
        lda #0
        rts
        
isPacCentered anop
        
        lda #1
        
        rts
        
getNextTileXYAlongDirection entry

        cmp #DIRECTION_UP
        beq getTileUp
        cmp #DIRECTION_RIGHT
        beq getTileRight
        cmp #DIRECTION_DOWN
        beq getTileDown
        cmp #DIRECTION_LEFT
        beq getTileLeft

        rts
        
getTileUp anop
        dec tileY
        rts

getTileDown anop
        inc tileY
        rts
        
getTileRight anop
        inc tileX
        rts
        
getTileLeft anop
        dec tileX
        rts
        
        
; precalcualate all available paths for each tile of the maze, get dot counts, etc
; 28 tiles wide
; 23 tiles high
initMaze entry

        lda #0
        sta initTileX
        sta initTileY
        sta totalDotCount

initVLoop anop

        lda #0
        sta initTileX

initHLoop anop

        lda initTileX
        asl a
        sta temp

        lda initTileY
        asl a
        tax
        lda mazeTileRowOffsets,x
        clc
        adc temp
        tax
        lda >mazeInitialTileList,x
        sta >mazeTileList,x
        cmp #1
        bne notADot
        inc totalDotCount

notADot anop

        lda initTileX
        sta tileX
        lda initTileY
        sta tileY
        jsr getAvailableDirectionsFromTileXY
        
        inc initTileX
        lda initTileX
        cmp #28
        bcs initNextRow
        bra initHLoop
        
initDone anop
        ldx totalDotCount
        rts
        
initNextRow anop

        inc initTileY
        lda initTileY
        cmp #23
        bcs initDone
        bra initVLoop
        
        
getAvailableDirectionsFromTileXY entry

        lda tileX
        asl a
        sta temp

        lda tileY
        asl a
        tax
        lda mazeTileRowOffsets,x
        clc
        adc temp
        sta mazeDataAddress
        tax
        lda >mazeAvailableDirections,x
        cmp #AVAILABLEDIR_UNCOMPUTED
        beq computeAvailable
        rts
        
computeAvailable anop

        lda #AVAILABLEDIR_NONE
        sta temp
        

        lda tileX
        sta tileUpX
        lda tileY
        sec
        sbc #1
        sta tileUpY

        lda tileX
        sta tileDownX
        lda tileY
        clc
        adc #1
        sta tileDownY

        lda tileX
        clc
        adc #1
        sta tileRightX
        lda tileY
        sta tileRightY

        lda tileX
        sec
        sbc #1
        sta tileLeftX
        lda tileY
        sta tileLeftY

        
        lda tileUpX
        sta tileX
        lda tileUpY
        sta tileY
        jsr getTileFromTileXY
        sta tileUp

        lda tileRightX
        sta tileX
        lda tileRightY
        sta tileY
        jsr getTileFromTileXY
        sta tileRight

        lda tileDownX
        sta tileX
        lda tileDownY
        sta tileY
        jsr getTileFromTileXY
        sta tileDown

        lda tileLeftX
        sta tileX
        lda tileLeftY
        sta tileY
        jsr getTileFromTileXY
        sta tileLeft

        
        lda tileUp
        cmp #0
        beq canGoUp
        cmp #1
        beq canGoUp
        cmp #2
        beq canGoUp
        cmp #8
        beq canGoUp
        bra cantGoUp
        
canGoUp anop
        lda temp
        ora #AVAILABLEDIR_UP
        sta temp

cantGoUp anop
        
        lda tileDown
        cmp #0
        beq canGoDown
        cmp #1
        beq canGoDown
        cmp #2
        beq canGoDown
        cmp #8
        beq canGoDown
        bra cantGoDown
        
canGoDown anop
        lda temp
        ora #AVAILABLEDIR_DOWN
        sta temp
        
cantGoDown anop

        lda tileRight
        cmp #0
        beq canGoRight
        cmp #1
        beq canGoRight
        cmp #2
        beq canGoRight
        cmp #8
        beq canGoRight
        bra cantGoRight
        
canGoRight anop
        lda temp
        ora #AVAILABLEDIR_RIGHT
        sta temp
        
cantGoRight anop

        lda tileLeft
        cmp #0
        beq canGoLeft
        cmp #1
        beq canGoLeft
        cmp #2
        beq canGoLeft
        cmp #8
        beq canGoLeft
        bra cantGoLeft
        
canGoLeft anop
        lda temp
        ora #AVAILABLEDIR_LEFT
        sta temp
        
cantGoLeft anop

        lda temp
        
; cache for next time
        ldx mazeDataAddress
        sta >mazeAvailableDirections,x

        rts
                


runMaze entry

; blink power pellets

        dec powerPelletFlashTimer
        lda powerPelletFlashTimer
        bmi resetPowerPelletFlashTimer
        bra donePowerPellets

resetPowerPelletFlashTimer anop

        lda #14
        sta powerPelletFlashTimer

        lda powerPelletFlashState
        cmp #0
        beq setFlashState

        lda #0
        sta powerPelletFlashState

        ldx #28
        lda #$0000
        sta >COLOR_TABLE,x

        bra donePowerPellets

setFlashState anop

        lda #1
        sta powerPelletFlashState

        ldx #28
        lda #$0fca
        sta >COLOR_TABLE,x

donePowerPellets anop

        rts

        
drawMaze entry

        lda #0
        sta mazeRow

drawMazeVLoop anop

        lda #0
        sta mazeCol

        lda mazeRow
        asl a
        tax
        lda mazeTileRowOffsets,x
        sta rowAddress

drawMazeHLoop anop

        lda rowAddress
        tax
        lda >mazeTileList,x

        asl a
        tax

        lda >mazeGraphicsOffsetXList,x
        sta tileSrcX

        lda >mazeGraphicsOffsetYList,x
        sta tileSrcY


        lda mazeCol
        asl a
        asl a
        clc
        adc #MAZE_OFFSET_X
        sta tileDstX

        lda mazeRow
        asl a
        asl a
        asl a
        clc
        adc #MAZE_OFFSET_Y
        sta tileDstY


        jsr drawMazeTile

        inc rowAddress
        inc rowAddress

        inc mazeCol
        lda mazeCol
        cmp #28
        beq drawMazeRowDone
        brl drawMazeHLoop

drawMazeRowDone anop

        inc mazeRow
        lda mazeRow
        cmp #23
        beq drawMazeDone

        brl drawMazeVLoop

drawMazeDone anop

        rts

        
updateMazeTile entry


        lda tileY
        sta mazeRow

        lda tileX
        sta mazeCol

        
        jsr getTileFromTileXY
        cmp #0
        beq eraseMazeTileDone
        asl a
        tax
        

        lda >mazeGraphicsOffsetXList,x
        sta tileSrcX

        lda >mazeGraphicsOffsetYList,x
        sta tileSrcY

        lda mazeCol
        asl a
        asl a
        clc
        adc #MAZE_OFFSET_X
        sta tileDstX

        lda mazeRow
        asl a
        asl a
        asl a
        clc
        adc #MAZE_OFFSET_Y
        sta tileDstY

        jsr eraseMazeTileFast

eraseMazeTileDone anop
        rts



zeroMazeBuffer entry

        ldx #0

zeroMazeBufferLoop anop

        lda #0
        sta >MAZE_BUFFER,x
        inx
        txa
        cmp #$8000
        beq zeroMazeBufferDone
        bra zeroMazeBufferLoop

zeroMazeBufferDone anop

        rts



drawMazeTile entry

        lda #0
        sta rowCounter

fillVLoop anop

; src
        lda rowCounter
        clc
        adc tileSrcY
        asl a
        tax
        lda mazeGraphicsRowOffsets,x
        clc
        adc tileSrcX
        sta dataCounter

; dst
        lda rowCounter
        clc
        adc tileDstY
        asl a
        tax
        lda screenRowOffsets,x
        clc
        adc tileDstX
        sta screenCounter

; ----------------------------------------

        short m
        
        ldx dataCounter
        lda >mazeGraphicsDataList,x
        ldx screenCounter
        sta >SCREEN_ADDR,x
        sta >MAZE_BUFFER,x

        inc dataCounter
        inc dataCounter
        inc screenCounter


        ldx dataCounter
        lda >mazeGraphicsDataList,x
        ldx screenCounter
        sta >SCREEN_ADDR,x
        sta >MAZE_BUFFER,x

        inc dataCounter
        inc dataCounter
        inc screenCounter


        ldx dataCounter
        lda >mazeGraphicsDataList,x
        ldx screenCounter
        sta >SCREEN_ADDR,x
        sta >MAZE_BUFFER,x

        inc dataCounter
        inc dataCounter
        inc screenCounter


        ldx dataCounter
        lda >mazeGraphicsDataList,x
        ldx screenCounter
        sta >SCREEN_ADDR,x
        sta >MAZE_BUFFER,x

        long m

; ----------------------------------------

        inc rowCounter
        lda rowCounter
        cmp #8
        beq fillDone
        brl fillVLoop

fillDone anop

        rts

        
eraseMazeTileFast entry

        lda #0
        sta rowCounter

fillVLoop1 anop

; src
        lda rowCounter
        clc
        adc tileSrcY
        asl a
        tax
        lda mazeGraphicsRowOffsets,x
        clc
        adc tileSrcX
        sta dataCounter

; dst
        lda rowCounter
        clc
        adc tileDstY
        asl a
        tax
        lda screenRowOffsets,x
        clc
        adc tileDstX
        sta screenCounter

; ----------------------------------------

        short m
        
        ldx dataCounter
        lda >mazeGraphicsDataList,x
        cmp #$00
        beq skipPixel1
        ldx screenCounter
        lda #$00
        sta >SCREEN_ADDR,x
        sta >MAZE_BUFFER,x
        
skipPixel1 anop

        inc dataCounter
        inc dataCounter
        inc screenCounter


        ldx dataCounter
        lda >mazeGraphicsDataList,x
        cmp #$00
        beq skipPixel2
        ldx screenCounter
        lda #$00
        sta >SCREEN_ADDR,x
        sta >MAZE_BUFFER,x

skipPixel2 anop

        inc dataCounter
        inc dataCounter
        inc screenCounter


        ldx dataCounter
        lda >mazeGraphicsDataList,x
        cmp #$00
        beq skipPixel3
        ldx screenCounter
        lda #$00
        sta >SCREEN_ADDR,x
        sta >MAZE_BUFFER,x

skipPixel3 anop
        
        inc dataCounter
        inc dataCounter
        inc screenCounter


        ldx dataCounter
        lda >mazeGraphicsDataList,x
        cmp #$00
        beq skipPixel4
        ldx screenCounter
        lda #$00
        sta >SCREEN_ADDR,x
        sta >MAZE_BUFFER,x

skipPixel4 anop
        
        long m

; ----------------------------------------

        inc rowCounter
        lda rowCounter
        cmp #8
        beq fillDone1
        brl fillVLoop1

fillDone1 anop

        rts
        
blitBufferMazeTile entry

        lda #0
        sta rowCounter

fillVLoop2 anop

        lda rowCounter
        clc
        adc tileDstY
        asl a
        tax
        lda screenRowOffsets,x
        clc
        adc tileDstX
        sta screenCounter

; ----------------------------------------


        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inc screenCounter
        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inc screenCounter
        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x

        inc screenCounter
        inc screenCounter

        ldx screenCounter
        lda >MAZE_BUFFER,x
        sta >SCREEN_ADDR,x


; ----------------------------------------

        inc rowCounter
        lda rowCounter
        cmp #8
        beq fillDone2
        brl fillVLoop2

fillDone2 anop

        rts
        
        

clearScreen entry

        ldx #0

clearScreenLoop anop

        lda #0
        sta >SCREEN_ADDR,x
        inx
        txa
        cmp #$8000
        beq clearScreenDone
        bra clearScreenLoop

clearScreenDone anop

        rts
        
; ---------------------------------------

drawAttractDots entry

        lda #$01

        asl a
        tax

        lda >mazeGraphicsOffsetXList,x
        sta tileSrcX

        lda >mazeGraphicsOffsetYList,x
        sta tileSrcY

        lda #60
        sta tileDstX

        lda #120
        sta tileDstY

        jsr drawMazeTile

        
        lda #$02
        
        asl a
        tax
        
        lda >mazeGraphicsOffsetXList,x
        sta tileSrcX
        
        lda >mazeGraphicsOffsetYList,x
        sta tileSrcY
        
        lda #60
        sta tileDstX
        
        lda #120+16
        sta tileDstY
        
        jsr drawMazeTile
        
        rts
        
        
        

initTileX dc i2'0'
initTileY dc i2'0'

mazeRow dc i2'0'
mazeCol dc i2'0'

rowCounter dc i2'0'
colCounter dc i2'0'

rowAddress dc i4'0'

screenCounter dc i4'0'
dataCounter dc i4'0'

mazeDataAddress dc i4'0'

tileSrcX dc i2'0'
tileSrcY dc i2'0'

tileDstX dc i2'0'
tileDstY dc i2'0'

tileUpX dc i2'0'
tileUpY dc i2'0'

tileRightX dc i2'0'
tileRightY dc i2'0'

tileDownX dc i2'0'
tileDownY dc i2'0'

tileLeftX dc i2'0'
tileLeftY dc i2'0'

tileUp dc i2'0'
tileRight dc i2'0'
tileDown dc i2'0'
tileLeft dc i2'0'

powerPelletFlashTimer dc i2'0'
powerPelletFlashState dc i2'0'

newTile dc i2'0'

temp dc i2'0'


mazeGraphicsRowOffsets anop
        dc i2'$0'
        dc i2'$48'
        dc i2'$90'
        dc i2'$d8'
        dc i2'$120'
        dc i2'$168'
        dc i2'$1b0'
        dc i2'$1f8'
        dc i2'$240'
        dc i2'$288'
        dc i2'$2d0'
        dc i2'$318'
        dc i2'$360'
        dc i2'$3a8'
        dc i2'$3f0'
        dc i2'$438'
        dc i2'$480'
        dc i2'$4c8'
        dc i2'$510'
        dc i2'$558'
        dc i2'$5a0'
        dc i2'$5e8'
        dc i2'$630'
        dc i2'$678'
        dc i2'$6c0'
        dc i2'$708'
        dc i2'$750'
        dc i2'$798'
        dc i2'$7e0'
        dc i2'$828'
        dc i2'$870'
        dc i2'$8b8'
        dc i2'$900'
        dc i2'$948'
        dc i2'$990'
        dc i2'$9d8'
        dc i2'$a20'
        dc i2'$a68'
        dc i2'$ab0'
        dc i2'$af8'
        dc i2'$b40'
        dc i2'$b88'
        dc i2'$bd0'
        dc i2'$c18'
        dc i2'$c60'
        dc i2'$ca8'
        dc i2'$cf0'
        dc i2'$d38'
        dc i2'$d80'


mazeTileRowOffsets anop
        dc i2'$0'
        dc i2'$38'
        dc i2'$70'
        dc i2'$a8'
        dc i2'$e0'
        dc i2'$118'
        dc i2'$150'
        dc i2'$188'
        dc i2'$1c0'
        dc i2'$1f8'
        dc i2'$230'
        dc i2'$268'
        dc i2'$2a0'
        dc i2'$2d8'
        dc i2'$310'
        dc i2'$348'
        dc i2'$380'
        dc i2'$3b8'
        dc i2'$3f0'
        dc i2'$428'
        dc i2'$460'
        dc i2'$498'
        dc i2'$4d0'


        end


mazeExchangeData data

tileX dc i2'0'
tileY dc i2'0'

totalDotCount dc i2'0' ; for a standard maze this will be 206 dots
eatenDotCount dc i2'0'

        end


mazeData data mazeDataSeg

    
AVAILABLEDIR_UNCOMPUTED gequ -1
AVAILABLEDIR_NONE   gequ 0
AVAILABLEDIR_UP     gequ 1
AVAILABLEDIR_DOWN   gequ 2
AVAILABLEDIR_LEFT   gequ 4
AVAILABLEDIR_RIGHT  gequ 8



; Width: $24 bytes  Height: $30 lines

mazeGraphicsDataList anop
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$ee,$ee,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$0e,$ee,$ee,$e0,$44,$44,$44,$44,$44,$44,$44,$44,$00,$00,$00,$00,$44,$40,$00,$00,$00,$00,$04,$44,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$02,$20,$00,$0e,$ee,$ee,$e0,$00,$00,$00,$04,$40,$00,$00,$00,$bb,$bb,$bb,$bb,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$02,$20,$00,$0e,$ee,$ee,$e0,$00,$00,$00,$04,$40,$00,$00,$00,$bb,$bb,$bb,$bb,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$0e,$ee,$ee,$e0,$44,$44,$44,$44,$44,$44,$44,$44,$00,$00,$00,$00,$44,$44,$44,$44,$44,$44,$44,$44,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$ee,$ee,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00'
        dc i2'$00,$00,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$00,$00,$44,$00,$00,$00,$00,$00,$00,$44,$00,$00,$40,$00,$00,$04,$00,$00'
        dc i2'$00,$44,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$44,$00,$00,$40,$00,$00,$00,$00,$04,$00,$00,$00,$40,$00,$00,$04,$00,$00'
        dc i2'$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$04,$00,$00,$00,$00,$40,$00,$00,$00,$04,$00,$00,$40,$00,$00'
        dc i2'$04,$00,$04,$44,$44,$44,$44,$44,$44,$40,$00,$00,$00,$00,$04,$44,$44,$40,$00,$40,$00,$04,$00,$00,$00,$00,$40,$00,$00,$00,$00,$44,$44,$00,$00,$00'
        dc i2'$40,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$04,$40,$04,$00,$00,$00,$00,$40,$04,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$40,$04,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00,$00,$00,$40,$04,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$40,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00,$00,$00,$40,$04'
        dc i2'$40,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00,$00,$00,$40,$04,$40,$00,$40,$00,$00,$04,$00,$04'
        dc i2'$40,$04,$00,$00,$00,$00,$00,$44,$44,$44,$44,$44,$44,$00,$00,$00,$00,$00,$40,$04,$00,$04,$00,$00,$00,$00,$40,$00,$40,$00,$04,$44,$44,$40,$00,$04'
        dc i2'$40,$04,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$40,$04,$00,$04,$00,$00,$00,$00,$40,$00,$40,$00,$00,$00,$00,$00,$00,$04'
        dc i2'$40,$04,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$40,$04,$00,$40,$00,$00,$00,$00,$04,$00,$40,$00,$00,$00,$00,$00,$00,$04'
        dc i2'$40,$04,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$40,$04,$44,$00,$00,$00,$00,$00,$00,$44,$40,$00,$04,$44,$44,$40,$00,$04'
        dc i2'$40,$04,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$40,$04,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$40,$00,$00,$04,$00,$04'
        dc i2'$40,$04,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$40,$04,$00,$00,$00,$00,$00,$00,$00,$00,$40,$04,$00,$00,$00,$00,$40,$04'
        dc i2'$40,$04,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$40,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$40,$00,$40,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$04,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$04,$00,$04,$44,$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$44,$40,$00,$40,$00,$00,$00,$44,$44,$00,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$04,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$40,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$00,$44,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$44,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$00,$00,$44,$44,$00,$00,$00,$44,$44,$44,$44,$44,$44,$00,$00,$00,$44,$44,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$00,$00,$04,$44,$44,$44,$44,$44,$44,$40,$00,$00,$00,$00,$04,$44,$44,$44,$44,$44,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$04,$40,$04,$00,$00'
        dc i2'$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00'
        dc i2'$00,$00,$40,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$40,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00'
        dc i2'$00,$00,$04,$44,$44,$44,$44,$44,$44,$40,$00,$00,$00,$00,$04,$44,$00,$00,$04,$44,$00,$00,$00,$44,$44,$00,$00,$00,$00,$00,$44,$44,$44,$44,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00'
        dc i2'$00,$00,$44,$44,$44,$44,$00,$00,$44,$44,$44,$44,$44,$00,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$44,$44,$44,$44,$44,$44,$44,$44,$44,$40,$00,$00'
        dc i2'$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$40,$04,$40,$04,$00,$00,$44,$40,$00,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$44,$40,$00,$00,$00,$00,$04,$44,$44,$40,$00,$00'
        dc i2'$00,$00,$40,$04,$40,$04,$00,$00,$00,$04,$00,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00'
        dc i2'$00,$00,$40,$04,$40,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$00,$00,$04,$00,$00,$00,$00,$40,$00'


; 28 tiles wide
; 23 tiles high
; width in pixels: 224
; width in bytes: 112
mazeTileList anop
        dc i2'$09,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0B,$0C,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0D'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$02,$13,$14,$14,$15,$01,$13,$14,$14,$14,$15,$01,$31,$32,$01,$13,$14,$14,$14,$15,$01,$13,$14,$14,$15,$02,$16'
        dc i2'$12,$01,$1c,$1d,$1d,$1e,$01,$1c,$1d,$1d,$1d,$1e,$01,$1c,$1e,$01,$1c,$1d,$1d,$1d,$1e,$01,$1c,$1d,$1d,$1e,$01,$16'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$01,$24,$25,$25,$26,$01,$13,$15,$01,$24,$25,$25,$2f,$28,$25,$25,$26,$01,$13,$15,$01,$24,$25,$25,$26,$01,$16'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$1b,$0a,$0a,$0a,$0a,$0e,$01,$31,$27,$0a,$0a,$26,$00,$29,$2a,$00,$24,$0a,$0a,$35,$32,$01,$0f,$0a,$0a,$0a,$0a,$1f'
        dc i2'$00,$00,$00,$00,$00,$12,$01,$31,$32,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$31,$32,$01,$22,$00,$00,$00,$00,$00'
        dc i2'$0a,$0a,$0a,$0a,$0a,$17,$01,$29,$2a,$00,$2d,$25,$03,$05,$05,$04,$25,$2e,$00,$29,$2a,$01,$18,$0a,$0a,$0a,$0a,$0a'
        dc i2'$08,$08,$08,$08,$08,$00,$01,$00,$00,$00,$22,$00,$00,$00,$00,$00,$00,$23,$00,$00,$00,$01,$00,$08,$08,$08,$08,$08'
        dc i2'$0a,$0a,$0a,$0a,$0a,$0e,$01,$20,$21,$00,$22,$00,$00,$00,$00,$00,$00,$23,$00,$20,$21,$01,$0f,$0a,$0a,$0a,$0a,$0a'
        dc i2'$00,$00,$00,$00,$00,$12,$01,$31,$32,$00,$2b,$25,$25,$25,$25,$25,$25,$2c,$00,$31,$32,$01,$22,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$12,$01,$31,$32,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$31,$32,$01,$22,$00,$00,$00,$00,$00'
        dc i2'$09,$0a,$0a,$0a,$0a,$17,$01,$29,$2a,$00,$24,$25,$25,$2f,$28,$25,$25,$26,$00,$29,$2a,$01,$18,$0a,$0a,$0a,$0a,$0d'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$01,$24,$25,$33,$15,$01,$24,$25,$25,$25,$26,$01,$29,$2a,$01,$24,$25,$25,$25,$26,$01,$13,$34,$25,$26,$01,$16'
        dc i2'$12,$02,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$02,$16'
        dc i2'$19,$25,$26,$01,$29,$2a,$01,$20,$21,$01,$24,$25,$25,$2f,$0c,$25,$25,$26,$01,$20,$21,$01,$29,$2a,$01,$24,$25,$1a'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$01,$24,$25,$25,$25,$25,$06,$07,$25,$25,$26,$01,$29,$2a,$01,$24,$25,$25,$06,$07,$25,$25,$25,$25,$26,$01,$16'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$1b,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$1f'


mazeInitialTileList anop
        dc i2'$09,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0B,$0C,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0D'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$02,$13,$14,$14,$15,$01,$13,$14,$14,$14,$15,$01,$31,$32,$01,$13,$14,$14,$14,$15,$01,$13,$14,$14,$15,$02,$16'
        dc i2'$12,$01,$1c,$1d,$1d,$1e,$01,$1c,$1d,$1d,$1d,$1e,$01,$1c,$1e,$01,$1c,$1d,$1d,$1d,$1e,$01,$1c,$1d,$1d,$1e,$01,$16'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$01,$24,$25,$25,$26,$01,$13,$15,$01,$24,$25,$25,$2f,$28,$25,$25,$26,$01,$13,$15,$01,$24,$25,$25,$26,$01,$16'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$1b,$0a,$0a,$0a,$0a,$0e,$01,$31,$27,$0a,$0a,$26,$00,$29,$2a,$00,$24,$0a,$0a,$35,$32,$01,$0f,$0a,$0a,$0a,$0a,$1f'
        dc i2'$00,$00,$00,$00,$00,$12,$01,$31,$32,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$31,$32,$01,$22,$00,$00,$00,$00,$00'
        dc i2'$0a,$0a,$0a,$0a,$0a,$17,$01,$29,$2a,$00,$2d,$25,$03,$05,$05,$04,$25,$2e,$00,$29,$2a,$01,$18,$0a,$0a,$0a,$0a,$0a'
        dc i2'$08,$08,$08,$08,$08,$00,$01,$00,$00,$00,$22,$00,$00,$00,$00,$00,$00,$23,$00,$00,$00,$01,$00,$08,$08,$08,$08,$08'
        dc i2'$0a,$0a,$0a,$0a,$0a,$0e,$01,$20,$21,$00,$22,$00,$00,$00,$00,$00,$00,$23,$00,$20,$21,$01,$0f,$0a,$0a,$0a,$0a,$0a'
        dc i2'$00,$00,$00,$00,$00,$12,$01,$31,$32,$00,$2b,$25,$25,$25,$25,$25,$25,$2c,$00,$31,$32,$01,$22,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$12,$01,$31,$32,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$31,$32,$01,$22,$00,$00,$00,$00,$00'
        dc i2'$09,$0a,$0a,$0a,$0a,$17,$01,$29,$2a,$00,$24,$25,$25,$2f,$28,$25,$25,$26,$00,$29,$2a,$01,$18,$0a,$0a,$0a,$0a,$0d'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$01,$24,$25,$33,$15,$01,$24,$25,$25,$25,$26,$01,$29,$2a,$01,$24,$25,$25,$25,$26,$01,$13,$34,$25,$26,$01,$16'
        dc i2'$12,$02,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$02,$16'
        dc i2'$19,$25,$26,$01,$29,$2a,$01,$20,$21,$01,$24,$25,$25,$2f,$0c,$25,$25,$26,$01,$20,$21,$01,$29,$2a,$01,$24,$25,$1a'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$01,$24,$25,$25,$25,$25,$06,$07,$25,$25,$26,$01,$29,$2a,$01,$24,$25,$25,$06,$07,$25,$25,$25,$25,$26,$01,$16'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$1b,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$25,$1f'


mazeAvailableDirections anop
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'
        dc i2'-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1'



; 9 tiles wide
; 6 tiles high
mazeGraphicsOffsetXList anop
        dc i2'$00,$08,$10,$18,$20,$28,$30,$38,$40'
        dc i2'$00,$08,$10,$18,$20,$28,$30,$38,$40'
        dc i2'$00,$08,$10,$18,$20,$28,$30,$38,$40'
        dc i2'$00,$08,$10,$18,$20,$28,$30,$38,$40'
        dc i2'$00,$08,$10,$18,$20,$28,$30,$38,$40'
        dc i2'$00,$08,$10,$18,$20,$28,$30,$38,$40'

mazeGraphicsOffsetYList anop
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$08,$08,$08,$08,$08,$08,$08,$08,$08'
        dc i2'$10,$10,$10,$10,$10,$10,$10,$10,$10'
        dc i2'$18,$18,$18,$18,$18,$18,$18,$18,$18'
        dc i2'$20,$20,$20,$20,$20,$20,$20,$20,$20'
        dc i2'$28,$28,$28,$28,$28,$28,$28,$28,$28'

        end


; Huge thanks to Kelvin Sherlock for this trick to allocate memory for the maze buffer
        align $10000
MAZE_BUFFER start MAZE_BUFFER
        ds 65536
        end
