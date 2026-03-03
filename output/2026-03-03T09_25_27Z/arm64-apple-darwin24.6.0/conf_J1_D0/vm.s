	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_vm_entry                       ; -- Begin function vm_entry
	.p2align	2
_vm_entry:                              ; @vm_entry
	.cfi_startproc
; %bb.0:
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
	mov	x22, x0
	ldr	x8, [x0, #64]
	ldp	x9, x24, [x0, #16]
	stp	x9, xzr, [x8, #16]
	ldr	w10, [x9, #16]
	and	x11, x10, #0xff
	ubfx	x0, x10, #16, #16
Lloh0:
	adrp	x23, _dispatch@PAGE
Lloh1:
	add	x23, x23, _dispatch@PAGEOFF
	ldr	x11, [x23, x11, lsl #3]
	ubfx	w1, w10, #8, #8
	add	x20, x9, #20
	add	x21, x8, #32
                                        ; kill: def $w0 killed $w0 killed $x0
	blr	x11
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
	.p2align	5                               ; -- Begin function vm_op_TRAP
_vm_op_TRAP:                            ; @vm_op_TRAP
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x0
	cmp	w1, #3
	b.le	LBB1_6
; %bb.1:
	cmp	w1, #6
	b.gt	LBB1_13
; %bb.2:
	sub	w8, w1, #4
	cmp	w8, #2
	b.hs	LBB1_16
; %bb.3:
	lsr	w26, w19, #8
	cmp	w26, w19, uxtb
	b.ls	LBB1_22
; %bb.4:
Lloh2:
	adrp	x8, l_.str.2@PAGE
Lloh3:
	add	x8, x8, l_.str.2@PAGEOFF
Lloh4:
	adrp	x9, l_.str@PAGE
Lloh5:
	add	x9, x9, l_.str@PAGEOFF
	; InlineAsm Start
	mov	x27, x30
	; InlineAsm End
	cmp	w1, #5
	csel	x25, x9, x8, eq
	and	x19, x19, #0xff
Lloh6:
	adrp	x28, ___stderrp@GOTPAGE
Lloh7:
	ldr	x28, [x28, ___stderrp@GOTPAGEOFF]
LBB1_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x28]
	ldr	x8, [x21, x19, lsl #3]
	stp	x19, x8, [sp]
	mov	x1, x25
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x27
	; InlineAsm End
	add	x19, x19, #1
	cmp	x26, x19
	b.ne	LBB1_5
	b	LBB1_22
LBB1_6:
	cmp	w1, #1
	b.gt	LBB1_10
; %bb.7:
	cbz	w1, LBB1_19
; %bb.8:
	cmp	w1, #1
	b.ne	LBB1_23
; %bb.9:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_diverge
LBB1_10:
	cmp	w1, #2
	b.eq	LBB1_20
; %bb.11:
	cmp	w1, #3
	b.ne	LBB1_23
; %bb.12:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_unusedexta
LBB1_13:
	cmp	w1, #7
	b.eq	LBB1_21
; %bb.14:
	cmp	w1, #8
	b.ne	LBB1_23
; %bb.15:
	; InlineAsm Start
	mov	x19, x30
	; InlineAsm End
	ldr	x0, [x22, #8]
	bl	_heap_stat_print
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
	b	LBB1_22
LBB1_16:
	cmp	w1, #6
	b.ne	LBB1_23
; %bb.17:
	and	w8, w19, #0xff
	lsr	w9, w19, #8
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x8, x9
	b.eq	LBB1_22
; %bb.18:
	; InlineAsm Start
	mov	x25, x30
	; InlineAsm End
Lloh8:
	adrp	x10, ___stderrp@GOTPAGE
Lloh9:
	ldr	x10, [x10, ___stderrp@GOTPAGEOFF]
Lloh10:
	ldr	x0, [x10]
	stp	x8, x9, [sp]
Lloh11:
	adrp	x1, l_.str.3@PAGE
Lloh12:
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x25
	; InlineAsm End
	mov	x0, x19
	mov	w1, #6                          ; =0x6
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_assertionfailed
LBB1_19:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_undefined
LBB1_20:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
LBB1_21:
                                        ; kill: def $w19 killed $w19 killed $x19 def $x19
	and	x8, x19, #0xff
	ldr	x25, [x21, x8, lsl #3]
	; InlineAsm Start
	mov	x19, x30
	; InlineAsm End
Lloh13:
	adrp	x26, ___stderrp@GOTPAGE
Lloh14:
	ldr	x26, [x26, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x26]
	str	x25, [sp]
Lloh15:
	adrp	x1, l_.str.8@PAGE
Lloh16:
	add	x1, x1, l_.str.8@PAGEOFF
	bl	_fprintf
	ldr	x0, [x26]
	ldr	x8, [x25]
	lsl	x8, x8, #2
	and	x8, x8, #0x3ffffffc0
	str	x8, [sp]
Lloh17:
	adrp	x1, l_.str.9@PAGE
Lloh18:
	add	x1, x1, l_.str.9@PAGEOFF
	bl	_fprintf
	ldr	x0, [x26]
	ldr	x8, [x25]
	lsl	x8, x8, #2
	and	x8, x8, #0x3ffffffc0
	ldr	x8, [x8]
	str	x8, [sp]
Lloh19:
	adrp	x1, l_.str.10@PAGE
Lloh20:
	add	x1, x1, l_.str.10@PAGEOFF
	bl	_fprintf
	ldr	x0, [x26]
	ldr	x8, [x25]
	lsl	x8, x8, #2
	and	x8, x8, #0x3ffffffc0
	ldr	w8, [x8, #12]
	str	x8, [sp]
Lloh21:
	adrp	x1, l_.str.11@PAGE
Lloh22:
	add	x1, x1, l_.str.11@PAGEOFF
	bl	_fprintf
	ldr	x0, [x26]
	ldr	x8, [x25]
	lsl	x8, x8, #2
	and	x8, x8, #0x3ffffffc0
	ldrb	w8, [x8, #8]
	str	x8, [sp]
Lloh23:
	adrp	x1, l_.str.12@PAGE
Lloh24:
	add	x1, x1, l_.str.12@PAGEOFF
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
LBB1_22:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB1_23:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_invalidtrap
	.loh AdrpLdrGot	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh11, Lloh12
	.loh AdrpLdrGotLdr	Lloh8, Lloh9, Lloh10
	.loh AdrpAdd	Lloh23, Lloh24
	.loh AdrpAdd	Lloh21, Lloh22
	.loh AdrpAdd	Lloh19, Lloh20
	.loh AdrpAdd	Lloh17, Lloh18
	.loh AdrpAdd	Lloh15, Lloh16
	.loh AdrpLdrGot	Lloh13, Lloh14
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_NOP
_vm_op_NOP:                             ; @vm_op_NOP
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MOV
_vm_op_MOV:                             ; @vm_op_MOV
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w0, uxtw #3]
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_EXTA
_vm_op_EXTA:                            ; @vm_op_EXTA
	.cfi_startproc
; %bb.0:
	b	_unusedexta
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LSI16
_vm_op_LSI16:                           ; @vm_op_LSI16
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	sxth	x8, w0
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LZI16
_vm_op_LZI16:                           ; @vm_op_LZI16
	.cfi_startproc
; %bb.0:
	mov	w8, w0
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LSI32
_vm_op_LSI32:                           ; @vm_op_LSI32
	.cfi_startproc
; %bb.0:
	ldp	w8, w9, [x20], #8
	extr	w8, w0, w8, #8
	sxtw	x8, w8
	str	x8, [x21, w1, uxtw #3]
	and	x8, x9, #0xff
	ldr	x2, [x23, x8, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LZI32
_vm_op_LZI32:                           ; @vm_op_LZI32
	.cfi_startproc
; %bb.0:
	ldp	w8, w9, [x20], #8
	extr	w8, w0, w8, #8
	str	x8, [x21, w1, uxtw #3]
	and	x8, x9, #0xff
	ldr	x2, [x23, x8, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LC
_vm_op_LC:                              ; @vm_op_LC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x22, #56]
	ldr	x8, [x8, w0, uxtw #3]
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_APP
_vm_op_APP:                             ; @vm_op_APP
	.cfi_startproc
; %bb.0:
	add	x21, x21, w1, uxtw #3
	ldr	x9, [x21], #16
	ldr	x8, [x9, #8]
	ldr	x10, [x22, #72]
	cmp	x21, x10
	b.hs	LBB10_2
; %bb.1:
	stp	x8, x20, [x21, #-16]
	str	x9, [x21]
	ldr	w9, [x8, #16]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #20
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB10_2:
	add	x20, x8, #16
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CALL
_vm_op_CALL:                            ; @vm_op_CALL
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	and	x8, x0, #0xff
	ldr	x8, [x24, x8, lsl #3]
	add	x9, x21, w1, uxtw #3
	add	x21, x9, #16
	ldr	x9, [x22, #72]
	cmp	x21, x9
	b.hs	LBB11_2
; %bb.1:
	stp	x8, x20, [x21, #-16]
	ldr	w9, [x8, #16]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #20
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB11_2:
	add	x20, x8, #16
                                        ; kill: def $w0 killed $w0 killed $x0
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_JMP
_vm_op_JMP:                             ; @vm_op_JMP
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	add	x20, x20, w0, sxth #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_JR
_vm_op_JR:                              ; @vm_op_JR
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DISP
_vm_op_DISP:                            ; @vm_op_DISP
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	add	w8, w8, w0, sxth
	ubfiz	x8, x8, #2, #32
	add	x20, x20, x8
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RETU
_vm_op_RETU:                            ; @vm_op_RETU
	.cfi_startproc
; %bb.0:
	str	xzr, [x21, #-16]!
	ldr	x8, [x21, #8]
	ldurb	w9, [x8, #-3]
	sub	x21, x21, x9, lsl #3
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #4
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RET
_vm_op_RET:                             ; @vm_op_RET
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	str	x8, [x21, #-16]!
	ldr	x8, [x21, #8]
	ldurb	w9, [x8, #-3]
	sub	x21, x21, x9, lsl #3
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #4
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RETN
_vm_op_RETN:                            ; @vm_op_RETN
	.cfi_startproc
; %bb.0:
	ldur	x8, [x21, #-8]
	sub	x9, x21, #16
	cbz	w0, LBB17_8
; %bb.1:
	mov	w10, w1
	mov	w11, w0
	cmp	w0, #7
	b.hi	LBB17_3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	LBB17_6
LBB17_3:
	and	x12, x11, #0xfff8
	add	x13, x21, #48
	add	x14, x21, x10, lsl #3
	add	x14, x14, #32
	mov	x15, x12
LBB17_4:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x14, #-32]
	ldp	q2, q3, [x14], #64
	stp	q0, q1, [x13, #-64]
	stp	q2, q3, [x13, #-32]
	add	x13, x13, #64
	subs	x15, x15, #8
	b.ne	LBB17_4
; %bb.5:
	cmp	x12, x11
	b.eq	LBB17_8
LBB17_6:
	add	x13, x21, x12, lsl #3
	sub	x11, x11, x12
LBB17_7:                                ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x13, x10, lsl #3]
	stur	x12, [x13, #-16]
	add	x13, x13, #8
	subs	x11, x11, #1
	b.ne	LBB17_7
LBB17_8:
	ldurb	w10, [x8, #-3]
	sub	x21, x9, x10, lsl #3
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #4
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MOBJ
_vm_op_MOBJ:                            ; @vm_op_MOBJ
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x1
	mov	w26, w0
	ldr	x8, [x22, #48]
	cmp	x8, x26
	b.lo	LBB18_3
; %bb.1:
	ldr	w8, [x20]
	lsr	x0, x8, #8
	; InlineAsm Start
	mov	x25, x30
	; InlineAsm End
	mov	x1, x22
	mov	x2, x21
	bl	_alloc_object
	; InlineAsm Start
	mov	x30, x25
	; InlineAsm End
	ldr	x8, [x22, #32]
	ldr	x8, [x8, x26, lsl #3]
	lsr	x9, x8, #32
	cmp	x9, #0
	ccmp	x9, #3, #2, ne
	b.hs	LBB18_4
; %bb.2:
	ubfx	x8, x8, #2, #32
	str	x8, [x0]
	; InlineAsm Start
	mov	x30, x25
	; InlineAsm End
	str	x0, [x21, w19, uxtw #3]
	ldr	w8, [x20, #4]
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
	add	x20, x20, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB18_3:
	mov	x1, x19
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_invalidlayout
LBB18_4:
	bl	_exit_with_status
	mov	w0, #18                         ; =0x12
	bl	_exit
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MCLOS
_vm_op_MCLOS:                           ; @vm_op_MCLOS
	.cfi_startproc
; %bb.0:
	b	_unimplemented
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SF
_vm_op_SF:                              ; @vm_op_SF
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	add	x8, x10, x8, lsl #3
	str	x9, [x8, #8]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_GF
_vm_op_GF:                              ; @vm_op_GF
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	add	x8, x10, x8, lsl #3
	ldr	x8, [x8, #8]
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SFX
_vm_op_SFX:                             ; @vm_op_SFX
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldp	w9, w10, [x20], #8
	lsr	x9, x9, #5
	and	x9, x9, #0x7fffff8
	add	x8, x8, x9
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	str	x9, [x8, #8]
	and	x8, x10, #0xff
	ldr	x2, [x23, x8, lsl #3]
	ubfx	x0, x10, #16, #16
	ubfx	w1, w10, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_GFX
_vm_op_GFX:                             ; @vm_op_GFX
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldp	w9, w10, [x20], #8
	lsr	x9, x9, #5
	and	x9, x9, #0x7fffff8
	add	x8, x8, x9
	ldr	x8, [x8, #8]
	and	x9, x0, #0xff
	str	x8, [x21, x9, lsl #3]
	and	x8, x10, #0xff
	ldr	x2, [x23, x8, lsl #3]
	ubfx	x0, x10, #16, #16
	ubfx	w1, w10, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SFXI8
_vm_op_SFXI8:                           ; @vm_op_SFXI8
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldp	w9, w10, [x20], #8
	lsr	x9, x9, #5
	and	x9, x9, #0x7fffff8
	add	x8, x8, x9
	sxtb	x9, w0
	str	x9, [x8, #8]
	and	x8, x10, #0xff
	ldr	x2, [x23, x8, lsl #3]
	ubfx	x0, x10, #16, #16
	ubfx	w1, w10, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SFXI16
_vm_op_SFXI16:                          ; @vm_op_SFXI16
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldp	w9, w10, [x20], #8
	lsr	x9, x9, #5
	and	x9, x9, #0x7fffff8
	add	x8, x8, x9
	sxth	x9, w0
	str	x9, [x8, #8]
	and	x8, x10, #0xff
	ldr	x2, [x23, x8, lsl #3]
	ubfx	x0, x10, #16, #16
	ubfx	w1, w10, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LP8
_vm_op_LP8:                             ; @vm_op_LP8
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	ldrb	w8, [x10, x8]
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LP16
_vm_op_LP16:                            ; @vm_op_LP16
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	ldrh	w8, [x10, x8]
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LP32
_vm_op_LP32:                            ; @vm_op_LP32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	ldr	w8, [x10, x8]
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LP64
_vm_op_LP64:                            ; @vm_op_LP64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x8, [x10, x8]
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SP8
_vm_op_SP8:                             ; @vm_op_SP8
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	strb	w9, [x10, x8]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SP16
_vm_op_SP16:                            ; @vm_op_SP16
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	strh	w9, [x10, x8]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SP32
_vm_op_SP32:                            ; @vm_op_SP32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	str	w9, [x10, x8]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SP64
_vm_op_SP64:                            ; @vm_op_SP64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	lsr	w9, w0, #8
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	str	x9, [x10, x8]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CSET
_vm_op_CSET:                            ; @vm_op_CSET
	.cfi_startproc
; %bb.0:
	mov	x8, x20
	ldr	w9, [x8], #4
	cmp	w1, #19
	b.hi	LBB34_15
; %bb.1:
	and	w10, w0, #0xff
	lsr	w8, w0, #8
	mov	w11, w1
Lloh25:
	adrp	x12, lJTI34_0@PAGE
Lloh26:
	add	x12, x12, lJTI34_0@PAGEOFF
	adr	x13, LBB34_2
	ldrb	w14, [x12, x11]
	add	x13, x13, x14, lsl #2
	br	x13
LBB34_2:
	ldr	x8, [x21, w10, uxtw #3]
	cmp	x8, #0
	b	LBB34_21
LBB34_3:
	ldr	d0, [x21, w10, uxtw #3]
	ucvtf	d0, d0
	ldr	d1, [x21, w8, uxtw #3]
	ucvtf	d1, d1
	fcmp	d0, d1
	b	LBB34_21
LBB34_4:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w10, w8
	cset	w8, lo
	b	LBB34_22
LBB34_5:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w10, w8
	cset	w8, ne
	b	LBB34_22
LBB34_6:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x10, x8
	b	LBB34_21
LBB34_7:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w10, w8
	cset	w8, lt
	b	LBB34_22
LBB34_8:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x10, x8
	cset	w8, ls
	b	LBB34_22
LBB34_9:
	ldr	x8, [x21, w10, uxtw #3]
	cmp	x8, #0
	cset	w8, ne
	b	LBB34_22
LBB34_10:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w10, w8
	cset	w8, ls
	b	LBB34_22
LBB34_11:
	ldr	x8, [x21, w10, uxtw #3]
	cmp	w8, #0
	cset	w8, ne
	b	LBB34_22
LBB34_12:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x10, x8
	cset	w8, le
	b	LBB34_22
LBB34_13:
	ldr	x8, [x21, w10, uxtw #3]
	cmp	w8, #0
	b	LBB34_21
LBB34_14:
	ldr	d0, [x21, w10, uxtw #3]
	ucvtf	d0, d0
	ldr	d1, [x21, w8, uxtw #3]
	ucvtf	d1, d1
	fcmp	d0, d1
	cset	w8, ne
	b	LBB34_22
LBB34_15:
	mov	x20, x8
	b	_undefined
LBB34_16:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x10, x8
	cset	w8, ne
	b	LBB34_22
LBB34_17:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w10, w8
	cset	w8, le
	b	LBB34_22
LBB34_18:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x10, x8
	cset	w8, lt
	b	LBB34_22
LBB34_19:
	ldr	d0, [x21, w10, uxtw #3]
	ucvtf	d0, d0
	ldr	d1, [x21, w8, uxtw #3]
	ucvtf	d1, d1
	fcmp	d0, d1
	cset	w8, mi
	b	LBB34_22
LBB34_20:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w10, w8
LBB34_21:
	cset	w8, eq
LBB34_22:
	ubfx	x9, x9, #8, #8
	mov	w8, w8
	str	x8, [x21, x9, lsl #3]
	ldr	w8, [x20, #4]
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
	add	x20, x20, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB34_23:
	ldr	x10, [x21, w10, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x10, x8
	cset	w8, lo
	b	LBB34_22
LBB34_24:
	ldr	d0, [x21, w10, uxtw #3]
	ucvtf	d0, d0
	ldr	d1, [x21, w8, uxtw #3]
	ucvtf	d1, d1
	fcmp	d0, d1
	cset	w8, ls
	b	LBB34_22
	.loh AdrpAdd	Lloh25, Lloh26
	.cfi_endproc
	.section	__TEXT,__const
lJTI34_0:
	.byte	(LBB34_2-LBB34_2)>>2
	.byte	(LBB34_13-LBB34_2)>>2
	.byte	(LBB34_9-LBB34_2)>>2
	.byte	(LBB34_11-LBB34_2)>>2
	.byte	(LBB34_6-LBB34_2)>>2
	.byte	(LBB34_16-LBB34_2)>>2
	.byte	(LBB34_18-LBB34_2)>>2
	.byte	(LBB34_12-LBB34_2)>>2
	.byte	(LBB34_23-LBB34_2)>>2
	.byte	(LBB34_8-LBB34_2)>>2
	.byte	(LBB34_20-LBB34_2)>>2
	.byte	(LBB34_5-LBB34_2)>>2
	.byte	(LBB34_7-LBB34_2)>>2
	.byte	(LBB34_17-LBB34_2)>>2
	.byte	(LBB34_4-LBB34_2)>>2
	.byte	(LBB34_10-LBB34_2)>>2
	.byte	(LBB34_3-LBB34_2)>>2
	.byte	(LBB34_14-LBB34_2)>>2
	.byte	(LBB34_19-LBB34_2)>>2
	.byte	(LBB34_24-LBB34_2)>>2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	5                               ; -- Begin function vm_op_CEQZ64
_vm_op_CEQZ64:                          ; @vm_op_CEQZ64
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, #0
	csel	x8, xzr, x9, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CEQZ32
_vm_op_CEQZ32:                          ; @vm_op_CEQZ32
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	w8, #0
	csel	x8, xzr, x9, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CNEZ64
_vm_op_CNEZ64:                          ; @vm_op_CNEZ64
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, #0
	csel	x8, x9, xzr, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CNEZ32
_vm_op_CNEZ32:                          ; @vm_op_CNEZ32
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	w8, #0
	csel	x8, x9, xzr, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CEQSI16
_vm_op_CEQSI16:                         ; @vm_op_CEQSI16
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, sxth
	csel	x8, xzr, x9, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CNESI16
_vm_op_CNESI16:                         ; @vm_op_CNESI16
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, sxth
	csel	x8, x9, xzr, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLTSI16
_vm_op_CLTSI16:                         ; @vm_op_CLTSI16
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, sxth
	csel	x8, xzr, x9, lt
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLESI16
_vm_op_CLESI16:                         ; @vm_op_CLESI16
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, sxth
	csel	x8, x9, xzr, gt
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CGTSI16
_vm_op_CGTSI16:                         ; @vm_op_CGTSI16
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, sxth
	csel	x8, xzr, x9, gt
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CGESI16
_vm_op_CGESI16:                         ; @vm_op_CGESI16
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, sxth
	csel	x8, x9, xzr, lt
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CEQUI16
_vm_op_CEQUI16:                         ; @vm_op_CEQUI16
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, uxtw
	csel	x8, xzr, x9, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CNEUI16
_vm_op_CNEUI16:                         ; @vm_op_CNEUI16
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, uxtw
	csel	x8, x9, xzr, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLTUI16
_vm_op_CLTUI16:                         ; @vm_op_CLTUI16
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, uxtw
	csel	x8, xzr, x9, lo
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLEUI16
_vm_op_CLEUI16:                         ; @vm_op_CLEUI16
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, uxtw
	csel	x8, x9, xzr, hi
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CGTUI16
_vm_op_CGTUI16:                         ; @vm_op_CGTUI16
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, uxtw
	csel	x8, xzr, x9, hi
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CGEUI16
_vm_op_CGEUI16:                         ; @vm_op_CGEUI16
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldrsh	x9, [x20, #2]
	lsl	x9, x9, #2
	cmp	x8, w0, uxtw
	csel	x8, x9, xzr, lo
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CEQ64
_vm_op_CEQ64:                           ; @vm_op_CEQ64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	x8, x9
	csel	x8, xzr, x10, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CNE64
_vm_op_CNE64:                           ; @vm_op_CNE64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	x8, x9
	csel	x8, x10, xzr, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLTU64
_vm_op_CLTU64:                          ; @vm_op_CLTU64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	x8, x9
	csel	x8, xzr, x10, lo
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLEU64
_vm_op_CLEU64:                          ; @vm_op_CLEU64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	x8, x9
	csel	x8, x10, xzr, hi
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLTS64
_vm_op_CLTS64:                          ; @vm_op_CLTS64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	x8, x9
	csel	x8, xzr, x10, lt
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLES64
_vm_op_CLES64:                          ; @vm_op_CLES64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	x8, x9
	csel	x8, x10, xzr, gt
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CEQ32
_vm_op_CEQ32:                           ; @vm_op_CEQ32
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	w8, w9
	csel	x8, xzr, x10, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CNE32
_vm_op_CNE32:                           ; @vm_op_CNE32
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	w8, w9
	csel	x8, x10, xzr, eq
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLTU32
_vm_op_CLTU32:                          ; @vm_op_CLTU32
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	w8, w9
	csel	x8, xzr, x10, lo
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLEU32
_vm_op_CLEU32:                          ; @vm_op_CLEU32
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	w8, w9
	csel	x8, x10, xzr, hi
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLTS32
_vm_op_CLTS32:                          ; @vm_op_CLTS32
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	w8, w9
	csel	x8, xzr, x10, lt
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLES32
_vm_op_CLES32:                          ; @vm_op_CLES32
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x0, #0xff
	ldr	x9, [x21, x9, lsl #3]
	ldrsh	x10, [x20, #2]
	lsl	x10, x10, #2
	cmp	w8, w9
	csel	x8, x10, xzr, gt
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x23, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_EXTEND
_vm_op_EXTEND:                          ; @vm_op_EXTEND
	.cfi_startproc
; %bb.0:
	cmp	w1, #5
	b.hs	LBB63_2
; %bb.1:
Lloh27:
	adrp	x8, l_switch.table.vm_op_EXTEND@PAGE
Lloh28:
	add	x8, x8, l_switch.table.vm_op_EXTEND@PAGEOFF
	ldr	x8, [x8, w1, uxtw #3]
	lsr	w9, w0, #8
	and	w10, w0, #0xff
	ldr	x10, [x21, w10, uxtw #3]
	lsl	x10, x10, x8
	asr	x8, x10, x8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB63_2:
	b	_undefined
	.loh AdrpAdd	Lloh27, Lloh28
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_WRAP
_vm_op_WRAP:                            ; @vm_op_WRAP
	.cfi_startproc
; %bb.0:
	cmp	w1, #3
	b.hs	LBB64_2
; %bb.1:
Lloh29:
	adrp	x8, l_switch.table.vm_op_WRAP@PAGE
Lloh30:
	add	x8, x8, l_switch.table.vm_op_WRAP@PAGEOFF
	ldr	x8, [x8, w1, uxtw #3]
	and	w9, w0, #0xff
	ldr	x9, [x21, w9, uxtw #3]
	lsr	w10, w0, #8
	and	x8, x9, x8
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB64_2:
	b	_undefined
	.loh AdrpAdd	Lloh29, Lloh30
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CTZ
_vm_op_CTZ:                             ; @vm_op_CTZ
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w1, #1
	b.gt	LBB65_4
; %bb.1:
	cbz	w1, LBB65_8
; %bb.2:
	cmp	w1, #1
	b.ne	LBB65_7
; %bb.3:
	and	w9, w8, #0xffff
	rbit	w9, w9
	clz	w9, w9
	mov	w10, #16                        ; =0x10
	b	LBB65_9
LBB65_4:
	cmp	w1, #2
	b.eq	LBB65_10
; %bb.5:
	cmp	w1, #3
	b.ne	LBB65_7
; %bb.6:
	rbit	x8, x8
	clz	x8, x8
	b	LBB65_11
LBB65_7:
	b	_undefined
LBB65_8:
	and	w9, w8, #0xff
	rbit	w9, w9
	clz	w9, w9
	mov	w10, #8                         ; =0x8
LBB65_9:
	cmp	x8, #0
	csel	x8, x10, x9, eq
	b	LBB65_11
LBB65_10:
	rbit	w8, w8
	clz	w8, w8
LBB65_11:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CLZ
_vm_op_CLZ:                             ; @vm_op_CLZ
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w1, #1
	b.gt	LBB66_4
; %bb.1:
	cbz	w1, LBB66_8
; %bb.2:
	cmp	w1, #1
	b.ne	LBB66_7
; %bb.3:
	and	w9, w8, #0xffff
	clz	w9, w9
	mov	w10, #16                        ; =0x10
	b	LBB66_9
LBB66_4:
	cmp	w1, #2
	b.eq	LBB66_10
; %bb.5:
	cmp	w1, #3
	b.ne	LBB66_7
; %bb.6:
	clz	x8, x8
	b	LBB66_11
LBB66_7:
	b	_undefined
LBB66_8:
	and	w9, w8, #0xff
	clz	w9, w9
	mov	w10, #8                         ; =0x8
LBB66_9:
	cmp	x8, #0
	csel	x8, x10, x9, eq
	b	LBB66_11
LBB66_10:
	clz	w8, w8
LBB66_11:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_POPCNT
_vm_op_POPCNT:                          ; @vm_op_POPCNT
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w1, #1
	b.gt	LBB67_4
; %bb.1:
	cbz	w1, LBB67_7
; %bb.2:
	cmp	w1, #1
	b.ne	LBB67_6
; %bb.3:
	and	w8, w8, #0xffff
	fmov	s0, w8
	b	LBB67_10
LBB67_4:
	cmp	w1, #2
	b.eq	LBB67_8
; %bb.5:
	cmp	w1, #3
	b.eq	LBB67_9
LBB67_6:
	b	_undefined
LBB67_7:
	and	w8, w8, #0xff
	fmov	s0, w8
	b	LBB67_10
LBB67_8:
	mov	w8, w8
LBB67_9:
	fmov	d0, x8
LBB67_10:
	cnt.8b	v0, v0
	uaddlv.8b	h0, v0
	fmov	w8, s0
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_AND64
_vm_op_AND64:                           ; @vm_op_AND64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	and	x8, x8, x9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_OR64
_vm_op_OR64:                            ; @vm_op_OR64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	orr	x8, x8, x9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_XOR64
_vm_op_XOR64:                           ; @vm_op_XOR64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	eor	x8, x8, x9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_NOTA64
_vm_op_NOTA64:                          ; @vm_op_NOTA64
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	and	w9, w0, #0xff
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	mvn	x10, x10
	add	x9, x9, x10
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SHL64
_vm_op_SHL64:                           ; @vm_op_SHL64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	lsl	x8, x8, x0
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SHRU64
_vm_op_SHRU64:                          ; @vm_op_SHRU64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	lsr	x8, x8, x0
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SHRS64
_vm_op_SHRS64:                          ; @vm_op_SHRS64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	asr	x8, x8, x0
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ROTL64
_vm_op_ROTL64:                          ; @vm_op_ROTL64
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	ldr	x9, [x21, w1, uxtw #3]
	neg	w10, w0
	ror	x9, x9, x10
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ROTR64
_vm_op_ROTR64:                          ; @vm_op_ROTR64
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	ror	x8, x8, x0
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_AND32
_vm_op_AND32:                           ; @vm_op_AND32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	and	w8, w9, w8
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_OR32
_vm_op_OR32:                            ; @vm_op_OR32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	orr	w8, w8, w9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_XOR32
_vm_op_XOR32:                           ; @vm_op_XOR32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	eor	w8, w8, w9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_NOTA32
_vm_op_NOTA32:                          ; @vm_op_NOTA32
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	and	w9, w0, #0xff
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	mvn	w10, w10
	add	w9, w9, w10
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SHL32
_vm_op_SHL32:                           ; @vm_op_SHL32
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	lsl	w8, w8, w0
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SHRU32
_vm_op_SHRU32:                          ; @vm_op_SHRU32
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	lsr	w8, w8, w0
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SHRS32
_vm_op_SHRS32:                          ; @vm_op_SHRS32
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	ldr	x9, [x21, w1, uxtw #3]
	asr	w9, w9, w0
	sxtw	x9, w9
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ROTL32
_vm_op_ROTL32:                          ; @vm_op_ROTL32
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	ldr	x9, [x21, w1, uxtw #3]
	neg	w10, w0
	ror	w9, w9, w10
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ROTR32
_vm_op_ROTR32:                          ; @vm_op_ROTR32
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	ror	w8, w8, w0
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ADD64
_vm_op_ADD64:                           ; @vm_op_ADD64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	add	x8, x8, x9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SUB64
_vm_op_SUB64:                           ; @vm_op_SUB64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	sub	x8, x9, x8
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MUL64
_vm_op_MUL64:                           ; @vm_op_MUL64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	mul	x8, x8, x9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MUHS64
_vm_op_MUHS64:                          ; @vm_op_MUHS64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	smulh	x8, x8, x9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MUHU64
_vm_op_MUHU64:                          ; @vm_op_MUHU64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	umulh	x8, x8, x9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DIVS64
_vm_op_DIVS64:                          ; @vm_op_DIVS64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	x8, x9, x8
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DIVU64
_vm_op_DIVU64:                          ; @vm_op_DIVU64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	x8, x9, x8
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_REMS64
_vm_op_REMS64:                          ; @vm_op_REMS64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	x10, x9, x8
	msub	x8, x10, x8, x9
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_REMU64
_vm_op_REMU64:                          ; @vm_op_REMU64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	x10, x9, x8
	msub	x8, x10, x8, x9
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DIRU64
_vm_op_DIRU64:                          ; @vm_op_DIRU64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	x10, x9, x8
	msub	x8, x10, x8, x9
	lsr	w9, w0, #8
	add	x9, x21, w9, uxtw #3
	stp	x10, x8, [x9]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DIRS64
_vm_op_DIRS64:                          ; @vm_op_DIRS64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	x10, x9, x8
	msub	x8, x10, x8, x9
	lsr	w9, w0, #8
	add	x9, x21, w9, uxtw #3
	stp	x10, x8, [x9]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ADD32
_vm_op_ADD32:                           ; @vm_op_ADD32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	add	w8, w8, w9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SUB32
_vm_op_SUB32:                           ; @vm_op_SUB32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	sub	w8, w9, w8
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MUL32
_vm_op_MUL32:                           ; @vm_op_MUL32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	lsr	w10, w0, #8
	mul	w8, w8, w9
	str	x8, [x21, w10, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MUHS32
_vm_op_MUHS32:                          ; @vm_op_MUHS32
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w1 killed $w1 def $x1
	lsr	w8, w0, #8
	and	w9, w0, #0xff
	ubfiz	x10, x1, #3, #32
	ldrsw	x10, [x21, x10]
	ubfiz	x9, x9, #3, #32
	ldrsw	x9, [x21, x9]
	smull	x9, w9, w10
	asr	x9, x9, #32
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MUHU32
_vm_op_MUHU32:                          ; @vm_op_MUHU32
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w1 killed $w1 def $x1
	lsr	w8, w0, #8
	and	w9, w0, #0xff
	ubfiz	x10, x1, #3, #32
	ldr	w10, [x21, x10]
	ubfiz	x9, x9, #3, #32
	ldr	w9, [x21, x9]
	umull	x9, w9, w10
	lsr	x9, x9, #32
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DIVS32
_vm_op_DIVS32:                          ; @vm_op_DIVS32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	w10, w9, w8
	msub	w9, w10, w8, w9
	orr	w8, w8, w9
	cmp	w8, #0
	cset	w8, eq
	sub	w8, w10, w8
	lsr	w9, w0, #8
	sxtw	x8, w8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DIVU32
_vm_op_DIVU32:                          ; @vm_op_DIVU32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	w10, w9, w8
	msub	w9, w10, w8, w9
	orr	w8, w8, w9
	cmp	w8, #0
	cset	w8, eq
	sub	w8, w10, w8
	lsr	w9, w0, #8
	sxtw	x8, w8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_REMS32
_vm_op_REMS32:                          ; @vm_op_REMS32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	w10, w9, w8
	msub	w8, w10, w8, w9
	lsr	w9, w0, #8
	sxtw	x8, w8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_REMU32
_vm_op_REMU32:                          ; @vm_op_REMU32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	w10, w9, w8
	msub	w8, w10, w8, w9
	lsr	w9, w0, #8
	sxtw	x8, w8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DIRU32
_vm_op_DIRU32:                          ; @vm_op_DIRU32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	w10, w9, w8
	msub	w9, w10, w8, w9
	orr	w8, w8, w9
	cmp	w8, #0
	cset	w8, eq
	sub	w8, w10, w8
	lsr	w10, w0, #8
	sxtw	x8, w8
	add	x10, x21, w10, uxtw #3
	sxtw	x9, w9
	stp	x8, x9, [x10]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DIRS32
_vm_op_DIRS32:                          ; @vm_op_DIRS32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	sdiv	w10, w9, w8
	msub	w9, w10, w8, w9
	orr	w8, w8, w9
	cmp	w8, #0
	cset	w8, eq
	sub	w8, w10, w8
	lsr	w10, w0, #8
	sxtw	x8, w8
	add	x10, x21, w10, uxtw #3
	sxtw	x9, w9
	stp	x8, x9, [x10]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ADD64I
_vm_op_ADD64I:                          ; @vm_op_ADD64I
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	ldr	x9, [x21, w1, uxtw #3]
	and	w10, w0, #0xff
	add	x9, x9, x10
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SUB64I
_vm_op_SUB64I:                          ; @vm_op_SUB64I
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	ldr	x9, [x21, w1, uxtw #3]
	and	w10, w0, #0xff
	sub	x9, x9, x10
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MUL64I
_vm_op_MUL64I:                          ; @vm_op_MUL64I
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	ldr	x9, [x21, w1, uxtw #3]
	and	w10, w0, #0xff
	mul	x9, x9, x10
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ADD32I
_vm_op_ADD32I:                          ; @vm_op_ADD32I
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	add	w8, w8, w0, uxtb
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SUB32I
_vm_op_SUB32I:                          ; @vm_op_SUB32I
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	lsr	w9, w0, #8
	sub	w8, w8, w0, uxtb
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MUL32I
_vm_op_MUL32I:                          ; @vm_op_MUL32I
	.cfi_startproc
; %bb.0:
	lsr	w8, w0, #8
	ldr	x9, [x21, w1, uxtw #3]
	and	w10, w0, #0xff
	mul	w9, w10, w9
	str	x9, [x21, w8, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MAXS64
_vm_op_MAXS64:                          ; @vm_op_MAXS64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x9, x8
	csel	x8, x9, x8, gt
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MAXU64
_vm_op_MAXU64:                          ; @vm_op_MAXU64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x9, x8
	csel	x8, x9, x8, hi
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MINS64
_vm_op_MINS64:                          ; @vm_op_MINS64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x9, x8
	csel	x8, x9, x8, lt
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MINU64
_vm_op_MINU64:                          ; @vm_op_MINU64
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	x9, x8
	csel	x8, x9, x8, lo
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MAXS32
_vm_op_MAXS32:                          ; @vm_op_MAXS32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w9, w8
	csel	x8, x9, x8, gt
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MAXU32
_vm_op_MAXU32:                          ; @vm_op_MAXU32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w9, w8
	csel	x8, x9, x8, hi
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MINS32
_vm_op_MINS32:                          ; @vm_op_MINS32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w9, w8
	csel	x8, x9, x8, lt
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MINU32
_vm_op_MINU32:                          ; @vm_op_MINU32
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	cmp	w9, w8
	csel	x8, x9, x8, lo
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x23, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function undefined
_undefined:                             ; @undefined
	.cfi_startproc
; %bb.0:
Lloh31:
	adrp	x8, l_.str.4@PAGE
Lloh32:
	add	x8, x8, l_.str.4@PAGEOFF
	str	x8, [x22, #80]
	b	_panic
	.loh AdrpAdd	Lloh31, Lloh32
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function diverge
_diverge:                               ; @diverge
	.cfi_startproc
; %bb.0:
LBB123_1:                               ; =>This Inner Loop Header: Depth=1
	b	LBB123_1
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
	.cfi_startproc
; %bb.0:
Lloh33:
	adrp	x8, l_.str.6@PAGE
Lloh34:
	add	x8, x8, l_.str.6@PAGEOFF
	str	x8, [x22, #80]
	b	_panic
	.loh AdrpAdd	Lloh33, Lloh34
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
	.cfi_startproc
; %bb.0:
Lloh35:
	adrp	x8, l_.str.7@PAGE
Lloh36:
	add	x8, x8, l_.str.7@PAGEOFF
	str	x8, [x22, #80]
	b	_panic
	.loh AdrpAdd	Lloh35, Lloh36
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
	.cfi_startproc
; %bb.0:
Lloh37:
	adrp	x8, l_.str.13@PAGE
Lloh38:
	add	x8, x8, l_.str.13@PAGEOFF
	str	x8, [x22, #80]
	b	_panic
	.loh AdrpAdd	Lloh37, Lloh38
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function panic
_panic:                                 ; @panic
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	; InlineAsm Start
	mov	x19, x30
	; InlineAsm End
Lloh39:
	adrp	x8, ___stderrp@GOTPAGE
Lloh40:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh41:
	ldr	x0, [x8]
	ldr	x8, [x22, #80]
	str	x8, [sp]
Lloh42:
	adrp	x1, l_.str.5@PAGE
Lloh43:
	add	x1, x1, l_.str.5@PAGEOFF
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
	mov	w0, #255                        ; =0xff
	bl	_exit
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpLdrGotLdr	Lloh39, Lloh40, Lloh41
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
	.cfi_startproc
; %bb.0:
Lloh44:
	adrp	x8, l_.str.14@PAGE
Lloh45:
	add	x8, x8, l_.str.14@PAGEOFF
	str	x8, [x22, #80]
	b	_panic
	.loh AdrpAdd	Lloh44, Lloh45
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
	.cfi_startproc
; %bb.0:
Lloh46:
	adrp	x8, l_.str.15@PAGE
Lloh47:
	add	x8, x8, l_.str.15@PAGEOFF
	str	x8, [x22, #80]
	b	_panic
	.loh AdrpAdd	Lloh46, Lloh47
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function exit_with_status
_exit_with_status:                      ; @exit_with_status
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh48:
	adrp	x8, ___stderrp@GOTPAGE
Lloh49:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh50:
	ldr	x0, [x8]
Lloh51:
	adrp	x8, l_.str.35@PAGE
Lloh52:
	add	x8, x8, l_.str.35@PAGEOFF
	str	x8, [sp]
Lloh53:
	adrp	x1, l_.str.16@PAGE
Lloh54:
	add	x1, x1, l_.str.16@PAGEOFF
	bl	_fprintf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.loh AdrpAdd	Lloh53, Lloh54
	.loh AdrpAdd	Lloh51, Lloh52
	.loh AdrpLdrGotLdr	Lloh48, Lloh49, Lloh50
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
	.cfi_startproc
; %bb.0:
Lloh55:
	adrp	x8, l_.str.36@PAGE
Lloh56:
	add	x8, x8, l_.str.36@PAGEOFF
	str	x8, [x22, #80]
	b	_panic
	.loh AdrpAdd	Lloh55, Lloh56
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__const
	.p2align	3, 0x0                          ; @dispatch
_dispatch:
	.quad	_vm_op_TRAP
	.quad	_vm_op_NOP
	.quad	_vm_op_MOV
	.quad	_vm_op_EXTA
	.quad	_vm_op_LSI16
	.quad	_vm_op_LZI16
	.quad	_vm_op_LSI32
	.quad	_vm_op_LZI32
	.quad	_vm_op_LC
	.quad	_vm_op_APP
	.quad	_vm_op_CALL
	.quad	_vm_op_JMP
	.quad	_vm_op_JR
	.quad	_vm_op_DISP
	.quad	_vm_op_RETU
	.quad	_vm_op_RET
	.quad	_vm_op_RETN
	.quad	_vm_op_MOBJ
	.quad	_vm_op_MCLOS
	.quad	_vm_op_SF
	.quad	_vm_op_GF
	.quad	_vm_op_SFX
	.quad	_vm_op_GFX
	.quad	_vm_op_SFXI8
	.quad	_vm_op_SFXI16
	.quad	_vm_op_LP8
	.quad	_vm_op_LP16
	.quad	_vm_op_LP32
	.quad	_vm_op_LP64
	.quad	_vm_op_SP8
	.quad	_vm_op_SP16
	.quad	_vm_op_SP32
	.quad	_vm_op_SP64
	.quad	_vm_op_CSET
	.quad	_vm_op_CEQZ64
	.quad	_vm_op_CEQZ32
	.quad	_vm_op_CNEZ64
	.quad	_vm_op_CNEZ32
	.quad	_vm_op_CEQSI16
	.quad	_vm_op_CNESI16
	.quad	_vm_op_CLTSI16
	.quad	_vm_op_CLESI16
	.quad	_vm_op_CGTSI16
	.quad	_vm_op_CGESI16
	.quad	_vm_op_CEQUI16
	.quad	_vm_op_CNEUI16
	.quad	_vm_op_CLTUI16
	.quad	_vm_op_CLEUI16
	.quad	_vm_op_CGTUI16
	.quad	_vm_op_CGEUI16
	.quad	_vm_op_CEQ64
	.quad	_vm_op_CNE64
	.quad	_vm_op_CLTU64
	.quad	_vm_op_CLEU64
	.quad	_vm_op_CLTS64
	.quad	_vm_op_CLES64
	.quad	_vm_op_CEQ32
	.quad	_vm_op_CNE32
	.quad	_vm_op_CLTU32
	.quad	_vm_op_CLEU32
	.quad	_vm_op_CLTS32
	.quad	_vm_op_CLES32
	.quad	_vm_op_EXTEND
	.quad	_vm_op_WRAP
	.quad	_vm_op_CTZ
	.quad	_vm_op_CLZ
	.quad	_vm_op_POPCNT
	.quad	_vm_op_AND64
	.quad	_vm_op_OR64
	.quad	_vm_op_XOR64
	.quad	_vm_op_NOTA64
	.quad	_vm_op_SHL64
	.quad	_vm_op_SHRU64
	.quad	_vm_op_SHRS64
	.quad	_vm_op_ROTL64
	.quad	_vm_op_ROTR64
	.quad	_vm_op_AND32
	.quad	_vm_op_OR32
	.quad	_vm_op_XOR32
	.quad	_vm_op_NOTA32
	.quad	_vm_op_SHL32
	.quad	_vm_op_SHRU32
	.quad	_vm_op_SHRS32
	.quad	_vm_op_ROTL32
	.quad	_vm_op_ROTR32
	.quad	_vm_op_ADD64
	.quad	_vm_op_SUB64
	.quad	_vm_op_MUL64
	.quad	_vm_op_MUHS64
	.quad	_vm_op_MUHU64
	.quad	_vm_op_DIVS64
	.quad	_vm_op_DIVU64
	.quad	_vm_op_REMS64
	.quad	_vm_op_REMU64
	.quad	_vm_op_DIRU64
	.quad	_vm_op_DIRS64
	.quad	_vm_op_ADD32
	.quad	_vm_op_SUB32
	.quad	_vm_op_MUL32
	.quad	_vm_op_MUHS32
	.quad	_vm_op_MUHU32
	.quad	_vm_op_DIVS32
	.quad	_vm_op_DIVU32
	.quad	_vm_op_REMS32
	.quad	_vm_op_REMU32
	.quad	_vm_op_DIRU32
	.quad	_vm_op_DIRS32
	.quad	_vm_op_ADD64I
	.quad	_vm_op_SUB64I
	.quad	_vm_op_MUL64I
	.quad	_vm_op_ADD32I
	.quad	_vm_op_SUB32I
	.quad	_vm_op_MUL32I
	.quad	_vm_op_MAXS64
	.quad	_vm_op_MAXU64
	.quad	_vm_op_MINS64
	.quad	_vm_op_MINU64
	.quad	_vm_op_MAXS32
	.quad	_vm_op_MAXU32
	.quad	_vm_op_MINS32
	.quad	_vm_op_MINU32

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"[%u] 0x%llx\n"

l_.str.2:                               ; @.str.2
	.asciz	"[%u] %llu\n"

l_.str.3:                               ; @.str.3
	.asciz	"0x%llx != 0x%llx\n"

l_.str.4:                               ; @.str.4
	.asciz	"invalid bytecode"

l_.str.5:                               ; @.str.5
	.asciz	"panic: %s\n"

l_.str.6:                               ; @.str.6
	.asciz	"unused extra arguments"

l_.str.7:                               ; @.str.7
	.asciz	"assertion failed"

l_.str.8:                               ; @.str.8
	.asciz	"object %p\n"

l_.str.9:                               ; @.str.9
	.asciz	"  layout: %p\n"

l_.str.10:                              ; @.str.10
	.asciz	"  size: %zu\n"

l_.str.11:                              ; @.str.11
	.asciz	"  length: %u\n"

l_.str.12:                              ; @.str.12
	.asciz	"  kind: %u\n"

l_.str.13:                              ; @.str.13
	.asciz	"invalid trap id"

l_.str.14:                              ; @.str.14
	.asciz	"stack overflow"

l_.str.15:                              ; @.str.15
	.asciz	"invalid layout"

l_.str.16:                              ; @.str.16
	.asciz	"quickaml stopped: %s\n"

l_.str.35:                              ; @.str.35
	.asciz	"invalid object descriptor"

l_.str.36:                              ; @.str.36
	.asciz	"unimplemented"

	.section	__TEXT,__const
	.p2align	3, 0x0                          ; @switch.table.vm_op_EXTEND
l_switch.table.vm_op_EXTEND:
	.quad	56                              ; 0x38
	.quad	48                              ; 0x30
	.quad	56                              ; 0x38
	.quad	48                              ; 0x30
	.quad	32                              ; 0x20

	.p2align	3, 0x0                          ; @switch.table.vm_op_WRAP
l_switch.table.vm_op_WRAP:
	.quad	255                             ; 0xff
	.quad	65535                           ; 0xffff
	.quad	4294967295                      ; 0xffffffff

.subsections_via_symbols
