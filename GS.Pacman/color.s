;
;  color.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 8/20/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on


color start
        using globalData


setColorTable entry

; black
        ldx #0
        lda #$0000
        sta >COLOR_TABLE,x

; blue
        ldx #2
        lda #$000f
        sta >COLOR_TABLE,x

;
        ldx #4
        lda #$0fff
        sta >COLOR_TABLE,x

; off white
        ldx #6
        lda #$0bbb
        sta >COLOR_TABLE,x

; orange
        ldx #8
        lda #$0fa2
        sta >COLOR_TABLE,x

; red
        ldx #10
        lda #$0f56
        sta >COLOR_TABLE,x

; purple
        ldx #12
        lda #$0a5e
        sta >COLOR_TABLE,x

; blue
        ldx #14
        lda #$076f
        sta >COLOR_TABLE,x

; light cyan
        ldx #16
        lda #$05bf
        sta >COLOR_TABLE,x

; cyan
        ldx #18
        lda #$06d7
        sta >COLOR_TABLE,x

; dark green
        ldx #20
        lda #$02e2
        sta >COLOR_TABLE,x

; lime green
        ldx #22
        lda #$09e2
        sta >COLOR_TABLE,x

; olive green
        ldx #24
        lda #$0ab3
        sta >COLOR_TABLE,x

; tan
        ldx #26
        lda #$0db4
        sta >COLOR_TABLE,x

; "fog" color (same color as background)
        ldx #28
        lda #$0ccc
        sta >COLOR_TABLE,x

; "flash" color
        ldx #30
        lda #$0bf4
        sta >COLOR_TABLE,x

        rts

        end
