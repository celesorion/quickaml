	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 0
	.globl	_vm_entry                       ; -- Begin function vm_entry
	.p2align	2
_vm_entry:                              ; @vm_entry
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	d15, d14, [sp, #-160]!          ; 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
	mov	x4, x0
	ldr	x3, [x0, #40]
	ldp	x8, x6, [x0]
	add	x0, x8, #12
	ldrb	w9, [x8, #8]
	ldrb	w2, [x8, #9]
	ldrsh	w1, [x8, #10]
Lloh0:
	adrp	x5, _dispatch@PAGE
Lloh1:
	add	x5, x5, _dispatch@PAGEOFF
	ldr	x8, [x5, x9, lsl #3]
	blr	x8
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #160            ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_NOP
_vm_op_NOP:                             ; @vm_op_NOP
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_STOPii
_vm_op_STOPii:                          ; @vm_op_STOPii
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w21, w1, #0xffff
	cmp	w21, w2
	b.ls	LBB2_3
; %bb.1:                                ; %for.body.lr.ph
	mov	x19, x3
	; InlineAsm Start
	mov	x22, x30
	; InlineAsm End
	mov	w23, w2
Lloh2:
	adrp	x20, l_.str@PAGE
Lloh3:
	add	x20, x20, l_.str@PAGEOFF
LBB2_2:                                 ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, x23, lsl #3]
	stp	x23, x8, [sp]
	mov	x0, x20
	bl	_printf
	; InlineAsm Start
	mov	x30, x22
	; InlineAsm End
	add	x23, x23, #1
	cmp	x21, x23
	b.ne	LBB2_2
LBB2_3:                                 ; %for.cond.cleanup
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPLTll
_vm_op_CMPLTll:                         ; @vm_op_CMPLTll
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w9, w1, #0xff
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x3, w9, uxtw #3]
	cmp	x10, x9
	b.lt	LBB3_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB3_2:                                 ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPLEll
_vm_op_CMPLEll:                         ; @vm_op_CMPLEll
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w9, w1, #0xff
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x3, w9, uxtw #3]
	cmp	x10, x9
	b.le	LBB4_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB4_2:                                 ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPEQll
_vm_op_CMPEQll:                         ; @vm_op_CMPEQll
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w9, w1, #0xff
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x3, w9, uxtw #3]
	cmp	x10, x9
	b.eq	LBB5_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB5_2:                                 ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPNEll
_vm_op_CMPNEll:                         ; @vm_op_CMPNEll
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w9, w1, #0xff
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x3, w9, uxtw #3]
	cmp	x10, x9
	b.ne	LBB6_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB6_2:                                 ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPLTli
_vm_op_CMPLTli:                         ; @vm_op_CMPLTli
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, #4
	ldr	x9, [x3, w2, uxtw #3]
	cmp	x9, w1, sxtw
	b.lt	LBB7_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB7_2:                                 ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPLEli
_vm_op_CMPLEli:                         ; @vm_op_CMPLEli
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, #4
	ldr	x9, [x3, w2, uxtw #3]
	cmp	x9, w1, sxtw
	b.le	LBB8_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB8_2:                                 ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPGTli
_vm_op_CMPGTli:                         ; @vm_op_CMPGTli
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, #4
	ldr	x9, [x3, w2, uxtw #3]
	cmp	x9, w1, sxtw
	b.gt	LBB9_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB9_2:                                 ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPGEli
_vm_op_CMPGEli:                         ; @vm_op_CMPGEli
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, #4
	ldr	x9, [x3, w2, uxtw #3]
	cmp	x9, w1, sxtw
	b.ge	LBB10_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB10_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPEQli
_vm_op_CMPEQli:                         ; @vm_op_CMPEQli
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, #4
	ldr	x9, [x3, w2, uxtw #3]
	cmp	x9, w1, sxtw
	b.eq	LBB11_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB11_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPNEli
_vm_op_CMPNEli:                         ; @vm_op_CMPNEli
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, #4
	ldr	x9, [x3, w2, uxtw #3]
	cmp	x9, w1, sxtw
	b.ne	LBB12_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB12_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPLTlc
_vm_op_CMPLTlc:                         ; @vm_op_CMPLTlc
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x9, [x4, #32]
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.lt	LBB13_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB13_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPLElc
_vm_op_CMPLElc:                         ; @vm_op_CMPLElc
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x9, [x4, #32]
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.le	LBB14_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB14_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPGTlc
_vm_op_CMPGTlc:                         ; @vm_op_CMPGTlc
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x9, [x4, #32]
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.gt	LBB15_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB15_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPGElc
_vm_op_CMPGElc:                         ; @vm_op_CMPGElc
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x9, [x4, #32]
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.ge	LBB16_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB16_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPEQlc
_vm_op_CMPEQlc:                         ; @vm_op_CMPEQlc
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x9, [x4, #32]
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.eq	LBB17_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB17_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CMPNElc
_vm_op_CMPNElc:                         ; @vm_op_CMPNElc
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x9, [x4, #32]
	add	x8, x0, #4
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.ne	LBB18_2
; %bb.1:                                ; %if.then
	ldrsh	x9, [x0, #2]
	add	x8, x8, x9, lsl #2
LBB18_2:                                ; %do.end
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_ADDlli
_vm_op_ADDlli:                          ; @vm_op_ADDlli
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ubfx	w9, w1, #8, #8
	ldr	x10, [x3, w2, uxtw #3]
	add	x9, x10, x9
	str	x9, [x3, w8, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_SUBlli
_vm_op_SUBlli:                          ; @vm_op_SUBlli
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ubfx	w9, w1, #8, #8
	ldr	x10, [x3, w2, uxtw #3]
	sub	x9, x10, x9
	str	x9, [x3, w8, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_MULlli
_vm_op_MULlli:                          ; @vm_op_MULlli
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ubfx	w9, w1, #8, #8
	ldr	x10, [x3, w2, uxtw #3]
	mul	x9, x10, x9
	str	x9, [x3, w8, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_DIVlli
_vm_op_DIVlli:                          ; @vm_op_DIVlli
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x8, [x3, w2, uxtw #3]
	ubfx	w9, w1, #8, #8
	udiv	x8, x8, x9
	and	w9, w1, #0xff
	str	x8, [x3, w9, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_REMlli
_vm_op_REMlli:                          ; @vm_op_REMlli
	.cfi_startproc
; %bb.0:                                ; %entry
	ubfx	w8, w1, #8, #8
	ldr	x9, [x3, w2, uxtw #3]
	udiv	x10, x9, x8
	msub	x9, x10, x8, x9
	cmp	x9, #0
	ccmp	w8, #0, #0, eq
	csel	x8, x8, xzr, eq
	add	x8, x8, x9
	and	w9, w1, #0xff
	str	x8, [x3, w9, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_DIRlli
_vm_op_DIRlli:                          ; @vm_op_DIRlli
	.cfi_startproc
; %bb.0:                                ; %entry
	ubfx	w8, w1, #8, #8
	ldr	x9, [x3, w2, uxtw #3]
	udiv	x10, x9, x8
	msub	x8, x10, x8, x9
	and	w9, w1, #0xff
	str	x10, [x3, w9, uxtw #3]
	add	w9, w9, #1
	str	x8, [x3, w9, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_ADDlll
_vm_op_ADDlll:                          ; @vm_op_ADDlll
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ubfx	w9, w1, #8, #8
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x3, w9, uxtw #3]
	add	x9, x9, x10
	str	x9, [x3, w8, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_SUBlll
_vm_op_SUBlll:                          ; @vm_op_SUBlll
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ubfx	w9, w1, #8, #8
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x3, w9, uxtw #3]
	sub	x9, x10, x9
	str	x9, [x3, w8, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_MULlll
_vm_op_MULlll:                          ; @vm_op_MULlll
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ubfx	w9, w1, #8, #8
	ldr	x10, [x3, w2, uxtw #3]
	ldr	x9, [x3, w9, uxtw #3]
	mul	x9, x9, x10
	str	x9, [x3, w8, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_DIVlll
_vm_op_DIVlll:                          ; @vm_op_DIVlll
	.cfi_startproc
; %bb.0:                                ; %entry
	ubfx	w8, w1, #8, #8
	ldr	x9, [x3, w2, uxtw #3]
	ldr	x8, [x3, w8, uxtw #3]
	udiv	x8, x9, x8
	and	w9, w1, #0xff
	str	x8, [x3, w9, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_REMlll
_vm_op_REMlll:                          ; @vm_op_REMlll
	.cfi_startproc
; %bb.0:                                ; %entry
	ubfx	w8, w1, #8, #8
	ldr	x9, [x3, w2, uxtw #3]
	ldr	x8, [x3, w8, uxtw #3]
	udiv	x10, x9, x8
	msub	x8, x10, x8, x9
	and	w9, w1, #0xff
	str	x8, [x3, w9, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_DIRlll
_vm_op_DIRlll:                          ; @vm_op_DIRlll
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x8, [x3, w2, uxtw #3]
	ubfx	w9, w1, #8, #8
	ldr	x9, [x3, w9, uxtw #3]
	udiv	x10, x8, x9
	msub	x8, x10, x9, x8
	and	w9, w1, #0xff
	str	x10, [x3, w9, uxtw #3]
	add	w9, w9, #1
	str	x8, [x3, w9, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CONSTli
_vm_op_CONSTli:                         ; @vm_op_CONSTli
	.cfi_startproc
; %bb.0:                                ; %entry
                                        ; kill: def $w1 killed $w1 def $x1
	sxtw	x8, w1
	str	x8, [x3, w2, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CLOSkxi
_vm_op_CLOSkxi:                         ; @vm_op_CLOSkxi
	.cfi_startproc
; %bb.0:                                ; %entry
	mov	x19, x6
	mov	x20, x5
	mov	x21, x4
	mov	x22, x3
	mov	x23, x2
	mov	x24, x0
	and	w25, w1, #0xff
	lsr	w8, w1, #5
	and	w8, w8, #0x7f8
	add	w0, w8, #24
	; InlineAsm Start
	mov	x26, x30
	; InlineAsm End
	bl	_immix_malloc
	; InlineAsm Start
	mov	x30, x26
	; InlineAsm End
	ldr	x8, [x19, w25, uxtw #3]
	stp	x8, xzr, [x0, #8]
	str	x0, [x22, w23, uxtw #3]
	add	x0, x24, #4
	ldrb	w8, [x24]
	ldrb	w2, [x24, #1]
	ldrsh	w1, [x24, #2]
	ldr	x7, [x20, x8, lsl #3]
	mov	x3, x22
	mov	x4, x21
	mov	x5, x20
	mov	x6, x19
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_APPLYpi
_vm_op_APPLYpi:                         ; @vm_op_APPLYpi
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x3, x3, w2, uxtw #3
	ldr	x9, [x3], #16
	ldr	x8, [x9, #8]
	ldr	x10, [x4, #48]
	cmp	x3, x10
	b.hs	LBB33_2
; %bb.1:                                ; %if.end
	stp	x0, x9, [x3, #-8]
	add	x0, x8, #12
	ldrb	w9, [x8, #8]
	ldrb	w2, [x8, #9]
	ldrsh	w1, [x8, #10]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
LBB33_2:                                ; %if.then
	add	x0, x8, #8
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CALLpxi
_vm_op_CALLpxi:                         ; @vm_op_CALLpxi
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ldr	x8, [x6, w8, uxtw #3]
	add	x9, x3, w2, uxtw #3
	add	x3, x9, #16
	ldr	x9, [x4, #48]
	cmp	x3, x9
	b.hs	LBB34_2
; %bb.1:                                ; %if.end
	stur	x0, [x3, #-8]
	add	x0, x8, #12
	ldrb	w9, [x8, #8]
	ldrb	w2, [x8, #9]
	ldrsh	w1, [x8, #10]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
LBB34_2:                                ; %if.then
	add	x0, x8, #8
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_OSETpip
_vm_op_OSETpip:                         ; @vm_op_OSETpip
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ldr	x9, [x3, w2, uxtw #3]
	ubfx	w10, w1, #8, #8
	ldr	x10, [x3, w10, uxtw #3]
	add	x8, x9, w8, uxtw #3
	str	x10, [x8, #8]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_OGETppi
_vm_op_OGETppi:                         ; @vm_op_OGETppi
	.cfi_startproc
; %bb.0:                                ; %entry
	and	w8, w1, #0xff
	ldr	x8, [x3, w8, uxtw #3]
	ubfx	w9, w1, #8, #8
	add	x8, x8, w9, uxtw #3
	ldr	x8, [x8, #8]
	str	x8, [x3, w2, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_CLOSGETpi
_vm_op_CLOSGETpi:                       ; @vm_op_CLOSGETpi
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x8, [x3]
	add	x8, x8, w1, uxtw #3
	ldr	x8, [x8, #8]
	str	x8, [x3, w2, uxtw #3]
	add	x8, x0, #4
	ldrb	w9, [x0]
	ldrb	w2, [x0, #1]
	ldrsh	w1, [x0, #2]
	ldr	x7, [x5, x9, lsl #3]
	mov	x0, x8
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_JUMPj
_vm_op_JUMPj:                           ; @vm_op_JUMPj
	.cfi_startproc
; %bb.0:                                ; %entry
	add	x8, x0, w1, sxtw
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function vm_op_RETp
_vm_op_RETp:                            ; @vm_op_RETp
	.cfi_startproc
; %bb.0:                                ; %entry
	ldr	x8, [x3, w2, uxtw #3]
	str	x8, [x3, #-16]!
	ldr	x8, [x3, #8]
	ldurb	w9, [x8, #-3]
	sub	x3, x3, x9, lsl #3
	add	x0, x8, #4
	ldrb	w9, [x8]
	ldrb	w2, [x8, #1]
	ldrsh	w1, [x8, #2]
	ldr	x7, [x5, x9, lsl #3]
	br	x7
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
	.cfi_startproc
; %bb.0:                                ; %entry
Lloh4:
	adrp	x8, l_.str.2@PAGE
Lloh5:
	add	x8, x8, l_.str.2@PAGEOFF
	str	x8, [x4, #24]
	b	_panic
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.p2align	6                               ; -- Begin function panic
_panic:                                 ; @panic
	.cfi_startproc
; %bb.0:                                ; %entry
	; InlineAsm Start
	mov	x19, x30
	; InlineAsm End
Lloh6:
	adrp	x8, ___stderrp@GOTPAGE
Lloh7:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh8:
	ldr	x0, [x8]
	ldr	x8, [x4, #24]
	str	x8, [sp]
Lloh9:
	adrp	x1, l_.str.3@PAGE
Lloh10:
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
	mov	w0, #255                        ; =0xff
	bl	_exit
	.loh AdrpAdd	Lloh9, Lloh10
	.loh AdrpLdrGotLdr	Lloh6, Lloh7, Lloh8
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__const
	.p2align	3, 0x0                          ; @dispatch
_dispatch:
	.quad	_vm_op_NOP
	.quad	_vm_op_STOPii
	.quad	_vm_op_CMPLTll
	.quad	_vm_op_CMPLEll
	.quad	_vm_op_CMPEQll
	.quad	_vm_op_CMPNEll
	.quad	_vm_op_CMPLTli
	.quad	_vm_op_CMPLEli
	.quad	_vm_op_CMPGTli
	.quad	_vm_op_CMPGEli
	.quad	_vm_op_CMPEQli
	.quad	_vm_op_CMPNEli
	.quad	_vm_op_CMPLTlc
	.quad	_vm_op_CMPLElc
	.quad	_vm_op_CMPGTlc
	.quad	_vm_op_CMPGElc
	.quad	_vm_op_CMPEQlc
	.quad	_vm_op_CMPNElc
	.quad	_vm_op_ADDlli
	.quad	_vm_op_SUBlli
	.quad	_vm_op_MULlli
	.quad	_vm_op_DIVlli
	.quad	_vm_op_REMlli
	.quad	_vm_op_DIRlli
	.quad	_vm_op_ADDlll
	.quad	_vm_op_SUBlll
	.quad	_vm_op_MULlll
	.quad	_vm_op_DIVlll
	.quad	_vm_op_REMlll
	.quad	_vm_op_DIRlll
	.quad	_vm_op_CONSTli
	.quad	_vm_op_CLOSkxi
	.quad	_vm_op_APPLYpi
	.quad	_vm_op_CALLpxi
	.quad	_vm_op_OSETpip
	.quad	_vm_op_OGETppi
	.quad	_vm_op_CLOSGETpi
	.quad	_vm_op_JUMPj
	.quad	_vm_op_RETp

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"slot[%u] 0x%llx\n"

l_.str.2:                               ; @.str.2
	.asciz	"stack overflow"

l_.str.3:                               ; @.str.3
	.asciz	"panic: %s\n"

.subsections_via_symbols
