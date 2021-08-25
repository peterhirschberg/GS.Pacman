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

;ghosts

;red

;pink B
;fcc4fc
; 0fcf

;blue 8
;00e8d8
; 00fe

;orange 9
;fc9838
; 0fa4

;cherry stem
;fc9838
; 0fa4

;peach
;fc9838
; fa4

;peach leaf / top of strawberry
;4cdc48
; 05e5

;bell
;f0bc3c
; 0fc4

;key top
;5c94fc
; 069f

;ghost house lid B
;fcc4fc
; fcf

;galaxian ship
;outer
;2038ec
; 024f

;inner
;145078
; 0158

;inside
;f0bc3c
; 0fc4

setColorTable entry

; 0 - black
        ldx #0
        lda #$0000
        sta >COLOR_TABLE,x

; 1 - blue eye color
        ldx #2
        lda #$0006
        sta >COLOR_TABLE,x

; 2 - white
        ldx #4
        lda #$0fff
        sta >COLOR_TABLE,x

; 3 - red
        ldx #6
        lda #$0f00
        sta >COLOR_TABLE,x

; 4 - blue (maze)
        ldx #8
        lda #$000f
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

; 8 - light blue
        ldx #16
        lda #$00fe
        sta >COLOR_TABLE,x

; 9 - orange
        ldx #18
        lda #$0fa4
        sta >COLOR_TABLE,x

; A
        ldx #20
        lda #$0ff0
        sta >COLOR_TABLE,x

; B - pink
        ldx #22
        lda #$0fcf
        sta >COLOR_TABLE,x

; C
        ldx #24
        lda #$0ab3
        sta >COLOR_TABLE,x

; D
        ldx #26
        lda #$0db4
        sta >COLOR_TABLE,x

; E - power pellet "flash" color
        ldx #28
        lda #$0fff
        sta >COLOR_TABLE,x

; F - white
        ldx #30
        lda #$0fff
        sta >COLOR_TABLE,x

        rts

        end
