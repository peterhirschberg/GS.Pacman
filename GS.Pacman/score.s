;
;  score.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/10/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

score start
        using spritesData
        using scoreData


addToScore entry

        clc
        adc currentScore
        sta currentScore

        lda #1
        sta scoreDirty

        rts


drawScore entry

        lda scoreDirty
        cmp #0
        bne doDrawScore
        rts

doDrawScore anop

        lda currentScore
        cmp #0
        bne scoreNotZero

        lda #$ff
        sta spriteColor

        jsr parseColor

        lda #90
        sta spriteX
        lda #9
        sta spriteY

        lda #ALPHAINDEX_0
        jsr drawAlphaSpriteByIndex

        stz scoreDirty

        rts

scoreNotZero anop

        lda #$ff
        sta spriteColor

        jsr parseColor

        lda #90
        sta spriteX
        lda #9
        sta spriteY


;        lda currentScore
;    lda #$1234
;    sta inval

;        jsr long2dec
;        sta bcdout



;        sta hexin
;        lda #0
;        jsr hexdec

;    lda str
;    tax
;    brk


        lda currentScore
        sta numin
        lda currentScore+2
        sta numin+2

        jsr u32tobcd
;    lda bcdout
;    brk

        stz scoreDirty
    rts


;        lda #ALPHAINDEX_1
;        jsr drawAlphaSpriteByIndex


        lda #10
        sta drawScoreIndex

drawScoreLoop anop

        lda bcdout
        cmp #0
        beq drawScoreDone

        and #$000f

;        sta scoreDigit

        asl a
        asl a

        lda #ALPHAINDEX_1
        jsr drawAlphaSpriteByIndex


        lda bcdout
        lsr a
        lsr a
        lsr a
        lsr a
        sta bcdout


        lda spriteX
        sec
        sbc #8
        sta spriteX

        bra drawScoreLoop

drawScoreDone anop

        stz scoreDirty

        rts




str anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'

inval dc i4'0'
scratch dc i4'0'


long2dec entry
	clc
	xce
	rep	#$20
	sep	#$10
	ldx	#4
clrstr anop
	stz	str,x
	dex
	dex
	bpl	clrstr

	sed
	ldy	#32		; 32 bits
	sed			; decimal mode!
onebit anop
	asl	inval
	rol	inval+2
; carry is now the msb of inval.  do str+str+carry
	ldx	#4
sh1add anop
	lda	str,x
	adc	str,x
	sta	str,x
	dex
	dex
	bpl	sh1add

	dey
	bne	onebit

	cld
	sec
	xce
	rts


; To do 32-bits, remove "rol inval+4", "rol inval+6", change ldy #64 to ldy #32, and change both ldx #8 to ldx #4.
; The result is in "big-endian" format, so the MSB of the BCD result is at str, and the LSB is at the highest address.



; * On Entry:
; * u32 integer to convert at NUMIN
; * e=0, m=0, x=0
; * On Exit:
; * Y,DB,DPage preserved
; * e=0, m=0, x=0, Decimal flag cleared
; * BCDOUT=10 BCD digits in 5 bytes
; * A,X altered
; * NUMIN & BCDOUT altered
;
; Thanks to John Brooks for this routine
; Additional thanks to Bobbi Webber-Manners, Andrew Roughan, Kent Dickey, Jeremy Rand
;

hexdec entry
    sep    #9
    tdc
    rol    hexin
loop anop
    sta    decwork
    adc    decwork
    rol    decout
    asl    hexin
    bne    loop
    cld
    rts

hexin dc i2'0'
decwork dc i2'0'
decout dc i2'0'


u32tobcd entry
        sep  #9     ;bcd=1, c=1
        stz  bcdout   ;clear result
        stz  bcdout+2
        stz  bcdout+4
        bra  nextbit
nextbith anop
        rol  numin+2  ;c=msb of u32
bitloop anop
        ldx  #0
bcdloop anop
        lda  bcdout,x ;bcdout <<= 1
        adc  bcdout,x
        sta  bcdout,x
        inx
        inx
        bne  bcdloop
nextbit anop
        rol  numin   ;u32 <<= 1
        bne  nextbith
        rol  numin+2
        bne  bitloop
        cld
        rts


numin dc i4'0'
bcdout dc i6'0'

scoreDigit dc i2'0'
drawScoreIndex dc i2'0'

scoreDirty dc i2'1'


        end



scoreData data

currentScore dc i4'$1234'

        end
