;
;  score.s
;  GS.Pacman
;
;  Created by Peter Hirschberg on 9/10/21.
;Copyright © 2021 Peter Hirschberg. All rights reserved.
;

        case on

score start
        using scoreData

updateScore entry


;        SED
;        LDY #8
;loop anop
;        ASL hex_loc
;        LDA dloc
;        ADC dloc
;        STA dloc
;        LDA dloc+1
;        ADC dloc+1
;        STA dloc+1
;do_dey anop
;        DEY
;        BNE loop
;        CLD

        rts




; * On Entry:
; * u32 integer to convert at NUMIN
; * e=0, m=0, x=0
; * On Exit:
; * Y,DB,DPage preserved
; * e=0, m=0, x=0, Decimal flag cleared
; * BCDOUT=10 BCD digits in 5 bytes
; * A,X altered
; * NUMIN & BCDOUT altered

;    mx  %00    ;16-bit mode



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





        end


scoreData data

numin dc i4'12345678'

;bcdout dc i6'1234678'


bcdout anop
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'
        dc i2'0'


        end
