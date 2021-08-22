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

; 0 - black
        ldx #0
        lda #$0000
        sta >COLOR_TABLE,x

; 1 - blue
        ldx #2
        lda #$000f
        sta >COLOR_TABLE,x

; 2 - white
        ldx #4
        lda #$0fff
        sta >COLOR_TABLE,x

; 3 - red
        ldx #6
        lda #$0f00
        sta >COLOR_TABLE,x

; 4
        ldx #8
        lda #$0fa2
        sta >COLOR_TABLE,x

; 5
        ldx #10
        lda #$0f56
        sta >COLOR_TABLE,x

; 6
        ldx #12
        lda #$0a5e
        sta >COLOR_TABLE,x

; 7
        ldx #14
        lda #$076f
        sta >COLOR_TABLE,x

; 8
        ldx #16
        lda #$05bf
        sta >COLOR_TABLE,x

; 9
        ldx #18
        lda #$06d7
        sta >COLOR_TABLE,x

; A
        ldx #20
        lda #$0ff0
        sta >COLOR_TABLE,x

; B
        ldx #22
        lda #$09e2
        sta >COLOR_TABLE,x

; C
        ldx #24
        lda #$0ab3
        sta >COLOR_TABLE,x

; D
        ldx #26
        lda #$0db4
        sta >COLOR_TABLE,x

; E - black non-transparent
        ldx #28
        lda #$0000
        sta >COLOR_TABLE,x

; F - power pellet "flash" color
        ldx #30
        lda #$0fff
        sta >COLOR_TABLE,x

        rts

        end
