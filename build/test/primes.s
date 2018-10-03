;
; File generated by cc65 v 2.17 - Git 118bc996
;
	.fopt		compiler,"cc65 v 2.17 - Git 118bc996"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_printf
	.import		_scanf
	.export		_is_prime
	.export		_main

.segment	"RODATA"

L0018:
	.byte	$45,$6E,$74,$65,$72,$20,$61,$20,$6E,$75,$6D,$62,$65,$72,$2C,$20
	.byte	$61,$6E,$64,$20,$49,$27,$6C,$6C,$20,$74,$65,$6C,$6C,$20,$79,$6F
	.byte	$75,$20,$69,$66,$20,$69,$74,$27,$73,$20,$70,$72,$69,$6D,$65,$3A
	.byte	$20,$00
L0028:
	.byte	$25,$75,$20,$69,$73,$6E,$27,$74,$20,$70,$72,$69,$6D,$65,$21,$0A
	.byte	$0A,$00
L0023:
	.byte	$25,$75,$20,$69,$73,$20,$70,$72,$69,$6D,$65,$21,$0A,$0A,$00
L001B:
	.byte	$25,$75,$00

; ---------------------------------------------------------------
; int __near__ is_prime (unsigned int)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_is_prime: near

.segment	"CODE"

	jsr     pushax
	jsr     decsp2
	ldy     #$03
	jsr     ldaxysp
	jsr     bnegax
	jeq     L0002
	ldx     #$00
	lda     #$00
	jmp     L0001
L0002:	ldx     #$00
	lda     #$02
	ldy     #$00
	jsr     staxysp
L0005:	ldy     #$01
	jsr     ldaxysp
	jsr     pushax
	ldy     #$03
	jsr     ldaxysp
	jsr     tosumulax
	jsr     pushax
	ldy     #$05
	jsr     ldaxysp
	jsr     tosuleax
	jne     L0008
	jmp     L0006
L0008:	ldy     #$03
	jsr     ldaxysp
	jsr     pushax
	ldy     #$03
	jsr     ldaxysp
	jsr     tosumodax
	cpx     #$00
	bne     L000F
	cmp     #$00
L000F:	jsr     booleq
	jeq     L0007
	ldx     #$00
	lda     #$00
	jmp     L0001
L0007:	ldy     #$01
	jsr     ldaxysp
	sta     regsave
	stx     regsave+1
	jsr     incax1
	ldy     #$00
	jsr     staxysp
	lda     regsave
	ldx     regsave+1
	jmp     L0005
L0006:	ldx     #$00
	lda     #$01
	jmp     L0001
L0001:	jsr     incsp4
	rts

.endproc

; ---------------------------------------------------------------
; int __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

	ldx     #$00
	lda     #$00
	jsr     pushax
	jmp     L0026
L0014:	ldy     #$01
	jsr     ldaxysp
	jsr     _is_prime
	stx     tmp1
	ora     tmp1
	jeq     L001F
	lda     #<(L0023)
	ldx     #>(L0023)
	jsr     pushax
	ldy     #$03
	jsr     ldaxysp
	jsr     pushax
	ldy     #$04
	jsr     _printf
	jmp     L0026
L001F:	lda     #<(L0028)
	ldx     #>(L0028)
	jsr     pushax
	ldy     #$03
	jsr     ldaxysp
	jsr     pushax
	ldy     #$04
	jsr     _printf
L0026:	lda     #<(L0018)
	ldx     #>(L0018)
	jsr     pushax
	ldy     #$02
	jsr     _printf
	lda     #<(L001B)
	ldx     #>(L001B)
	jsr     pushax
	lda     #$02
	jsr     leaa0sp
	jsr     pushax
	ldy     #$04
	jsr     _scanf
	cpx     #$FF
	bne     L001E
	cmp     #$FF
L001E:	jsr     boolne
	jne     L0014
	ldx     #$00
	lda     #$00
	jmp     L0012
L0012:	jsr     incsp2
	rts

.endproc
