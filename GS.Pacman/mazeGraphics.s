;
;  mazeGraphics.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/19/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on
        mcopy global.macros
        keep global


mazeGraphics start
        using globalData
        using mazeGraphicsData


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

;        lda #$9

        sta currentTileIndex ; ???


        asl a
        tax

        lda >mazeGraphicsOffsetXList,x
        sta tileSrcX

        lda >mazeGraphicsOffsetYList,x
        sta tileSrcY


        lda mazeCol
        asl a
        asl a
        sta tileDstX

        lda mazeRow
        asl a
        asl a
        asl a
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
        cmp #5 ; fix this
        beq drawMazeDone

        brl drawMazeVLoop

drawMazeDone anop



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

        lda #7
        sta colCounter

fillHLoop anop

        short m
        ldx dataCounter
        lda >mazeGraphicsDataList,x
        ldx screenCounter
        sta >SCREEN_ADDR,x
        long m

        inc dataCounter
        inc dataCounter
        inc screenCounter

        dec colCounter
        dec colCounter

        lda colCounter
        bmi nextRow
        bra fillHLoop

nextRow anop
        inc rowCounter
        lda rowCounter
        cmp #8
        beq fillDone
        bra fillVLoop

fillDone anop

        rts


currentTileIndex dc i2'0'

mazeRow dc i2'0'
mazeCol dc i2'0'

rowCounter dc i2'0'
colCounter dc i2'0'

rowAddress dc i4'0'

screenCounter dc i4'0'
dataCounter dc i4'0'

tileSrcX dc i2'0'
tileSrcY dc i2'0'

tileDstX dc i2'0'
tileDstY dc i2'0'

temp dc i2'0'

savex dc i4'0'


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


mazeGraphicsData data mazeGraphicsDataSeg


; Width: $24 bytes  Height: $30 lines

mazeGraphicsDataList anop
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$33,$33,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$03,$33,$33,$30,$11,$11,$11,$11,$11,$11,$11,$11,$00,$00,$00,$00,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$03,$30,$00,$03,$33,$33,$30,$00,$00,$00,$01,$10,$00,$00,$00,$44,$44,$44,$44,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$03,$30,$00,$03,$33,$33,$30,$00,$00,$00,$01,$10,$00,$00,$00,$44,$44,$44,$44,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$03,$33,$33,$30,$11,$11,$11,$11,$11,$11,$11,$11,$00,$00,$00,$00,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$33,$33,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00'
        dc i2'$00,$00,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$00,$00,$11,$00,$00,$00,$00,$00,$00,$11,$00,$00,$10,$00,$00,$01,$00,$00'
        dc i2'$00,$11,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$11,$00,$00,$10,$00,$00,$00,$00,$01,$00,$00,$00,$10,$00,$00,$01,$00,$00'
        dc i2'$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$01,$00,$00,$00,$00,$10,$00,$00,$00,$01,$00,$00,$10,$00,$00'
        dc i2'$01,$00,$01,$11,$11,$11,$11,$11,$11,$10,$00,$00,$00,$00,$01,$11,$11,$10,$00,$10,$00,$01,$00,$00,$00,$00,$10,$00,$00,$00,$00,$11,$11,$00,$00,$00'
        dc i2'$10,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$10,$00,$00,$01,$00,$01,$10,$01,$00,$00,$00,$00,$10,$01,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$10,$01,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00,$00,$00,$10,$01,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$10,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00,$00,$00,$10,$01'
        dc i2'$10,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00,$00,$00,$10,$01,$10,$00,$10,$00,$00,$01,$00,$01'
        dc i2'$10,$01,$00,$00,$00,$00,$00,$11,$11,$11,$11,$11,$11,$00,$00,$00,$00,$00,$10,$01,$00,$01,$00,$00,$00,$00,$10,$00,$10,$00,$01,$11,$11,$10,$00,$01'
        dc i2'$10,$01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$10,$01,$00,$01,$00,$00,$00,$00,$10,$00,$10,$00,$00,$00,$00,$00,$00,$01'
        dc i2'$10,$01,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$10,$01,$00,$10,$00,$00,$00,$00,$01,$00,$10,$00,$00,$00,$00,$00,$00,$01'
        dc i2'$10,$01,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$10,$01,$11,$00,$00,$00,$00,$00,$00,$11,$10,$00,$01,$11,$11,$10,$00,$01'
        dc i2'$10,$01,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$10,$01,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$10,$00,$00,$01,$00,$01'
        dc i2'$10,$01,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$10,$01,$00,$00,$00,$00,$00,$00,$00,$00,$10,$01,$00,$00,$00,$00,$10,$01'
        dc i2'$10,$01,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$10,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$10,$00,$10,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$01,$00,$01,$11,$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$11,$10,$00,$10,$00,$00,$00,$11,$11,$00,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$01,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$10,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$00,$11,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$11,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$00,$00,$11,$11,$00,$00,$00,$11,$11,$11,$11,$11,$11,$00,$00,$00,$11,$11,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$00,$00,$01,$11,$11,$11,$11,$11,$11,$10,$00,$00,$00,$00,$01,$11,$11,$11,$11,$11,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$01,$10,$01,$00,$00'
        dc i2'$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00'
        dc i2'$00,$00,$10,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$10,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00'
        dc i2'$00,$00,$01,$11,$11,$11,$11,$11,$11,$10,$00,$00,$00,$00,$01,$11,$00,$00,$01,$11,$00,$00,$00,$11,$11,$00,$00,$00,$00,$00,$11,$11,$11,$11,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$22,$22,$22,$22'
        dc i2'$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$22,$22,$22,$22'
        dc i2'$00,$00,$11,$11,$11,$11,$00,$00,$11,$11,$11,$11,$11,$00,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$11,$11,$11,$11,$11,$11,$11,$11,$22,$22,$22,$22'
        dc i2'$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$22,$22,$22,$22'
        dc i2'$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$22,$22,$22,$22'
        dc i2'$00,$00,$10,$01,$10,$01,$00,$00,$11,$10,$00,$00,$00,$01,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$11,$10,$00,$00,$00,$00,$01,$11,$22,$22,$22,$22'
        dc i2'$00,$00,$10,$01,$10,$01,$00,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$00,$10,$00,$22,$22,$22,$22'
        dc i2'$00,$00,$10,$01,$10,$01,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$00,$00,$10,$00,$00,$01,$00,$00,$22,$22,$22,$22'


; 28 tiles wide
; 23 tiles high
mazeTileList anop
        dc i2'$09,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0B,$0C,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0D'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$31,$32,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'
        dc i2'$12,$02,$13,$14,$14,$15,$01,$13,$14,$14,$14,$15,$01,$31,$32,$01,$13,$14,$14,$14,$15,$01,$13,$14,$14,$15,$02,$16'
        dc i2'$12,$01,$1c,$1d,$1d,$1e,$01,$1c,$1d,$1d,$1d,$1e,$01,$1c,$1e,$01,$1c,$1d,$1d,$1d,$1e,$01,$1c,$1d,$1d,$1e,$01,$16'
        dc i2'$12,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$16'

; 1c 1d 1e

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
