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

; --------------------------

; off white
; 0edf

; cherry stem
; 0ea5 (current index 99)

; peach body
; 0fc5
; stem
; 0ea5
; leaf
; 00f0

; MELON body
; 00f0
; stem
; 05cb
; dots are white

; GALAX
; blue 022f
; yellow 0ff0


; BELL 0ff0
; main 0ff0
; bottom 05cf
; highlight 0eef

; KEY
; top 05cf
; bottom 0eef


normalColorTable entry

; 0 - black
        ldx #0
        lda #$0000
        sta >COLOR_TABLE,x

; 1 - blue eye color
        ldx #2
        lda #$022e
        sta >COLOR_TABLE,x

; 2 - dot color
        ldx #4
        lda #$0fca
        sta >COLOR_TABLE,x

; 3 - red ghost
        ldx #6
        lda #$0f00
        sta >COLOR_TABLE,x

; 4 - blue (maze) (CHANGE TO $11 AND REUSE THIS COLOR IF POSSIBLE)
        ldx #8
        lda #$022e
        sta >COLOR_TABLE,x

; 5 - melon stem
        ldx #10
        lda #$05cb
        sta >COLOR_TABLE,x

; 6 - melon
        ldx #12
        lda #$00f0
        sta >COLOR_TABLE,x

; 7 - cherry stem
        ldx #14
        lda #$0ea5
        sta >COLOR_TABLE,x

; 8 - blue ghost
        ldx #16
        lda #$00fe
        sta >COLOR_TABLE,x

; 9 - orange ghost
        ldx #18
        lda #$0fa4
        sta >COLOR_TABLE,x

; A - bell
        ldx #20
        lda #$0ff0
        sta >COLOR_TABLE,x

; B - pink ghost
        ldx #22
        lda #$0fcf
        sta >COLOR_TABLE,x

; C - bottom of bell / top of key
        ldx #24
        lda #$05cf
        sta >COLOR_TABLE,x

; D - pure white
        ldx #26
        lda #$0fff
        sta >COLOR_TABLE,x

; E - power pellet "flash" color
        ldx #28
        lda #$0fca
        sta >COLOR_TABLE,x

; F - white
        ldx #30
        lda #$0edf
        sta >COLOR_TABLE,x

        rts


blackColorTable entry

        ldx #0
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #2
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #4
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #6
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #8
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #10
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #12
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #14
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #16
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #18
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #20
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #22
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #24
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #26
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #28
        lda #$0000
        sta >COLOR_TABLE,x

        ldx #30
        lda #$0000
        sta >COLOR_TABLE,x

        rts



        end
