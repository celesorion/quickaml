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
	ldr	x8, [x0, #48]
	ldp	x9, x24, [x0, #8]
	stp	x9, xzr, [x8, #16]
	ldrb	w10, [x9, #8]
	ldrb	w1, [x9, #9]
	ldrh	w0, [x9, #10]
Lloh0:
	adrp	x23, _dispatch@PAGE
Lloh1:
	add	x23, x23, _dispatch@PAGEOFF
	ldr	x10, [x23, x10, lsl #3]
	add	x20, x9, #12
	add	x21, x8, #32
	blr	x10
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
	.p2align	5                               ; -- Begin function vm_op_Trap
_vm_op_Trap:                            ; @vm_op_Trap
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
	ldr	x0, [x22]
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
	; InlineAsm Start
	mov	x25, x30
	; InlineAsm End
Lloh13:
	adrp	x26, ___stderrp@GOTPAGE
Lloh14:
	ldr	x26, [x26, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x26]
	and	x19, x19, #0xff
	str	x19, [sp]
Lloh15:
	adrp	x1, l_.str.4@PAGE
Lloh16:
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x25
	; InlineAsm End
	ldr	x0, [x26]
	ldr	x1, [x21, x19, lsl #3]
	bl	_obj_print
	; InlineAsm Start
	mov	x30, x25
	; InlineAsm End
	ldr	x1, [x26]
	mov	w0, #10                         ; =0xa
	bl	_fputc
	; InlineAsm Start
	mov	x30, x25
	; InlineAsm End
LBB1_22:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
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
	.loh AdrpAdd	Lloh15, Lloh16
	.loh AdrpLdrGot	Lloh13, Lloh14
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Nop
_vm_op_Nop:                             ; @vm_op_Nop
	.cfi_startproc
; %bb.0:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Exta
_vm_op_Exta:                            ; @vm_op_Exta
	.cfi_startproc
; %bb.0:
	b	_unusedexta
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadI
_vm_op_LoadI:                           ; @vm_op_LoadI
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	sxth	x8, w0
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	bfxil	x9, x8, #0, #32
	str	x9, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoaduI
_vm_op_LoaduI:                          ; @vm_op_LoaduI
	.cfi_startproc
; %bb.0:
	mov	w8, w0
	orr	x8, x8, #0xfffe000000000000
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadC
_vm_op_LoadC:                           ; @vm_op_LoadC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x22, #40]
	ldr	x8, [x8, w0, uxtw #3]
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadF
_vm_op_LoadF:                           ; @vm_op_LoadF
	.cfi_startproc
; %bb.0:
	b	_unimplemented
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetF
_vm_op_SetF:                            ; @vm_op_SetF
	.cfi_startproc
; %bb.0:
	b	_unimplemented
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Move
_vm_op_Move:                            ; @vm_op_Move
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w0, uxtw #3]
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Apply
_vm_op_Apply:                           ; @vm_op_Apply
	.cfi_startproc
; %bb.0:
	ldr	x9, [x21, w1, uxtw #3]
	mov	x8, #2                          ; =0x2
	movk	x8, #65534, lsl #48
	tst	x9, x8
	b.ne	LBB10_3
; %bb.1:
	mov	w10, w1
	ldr	x8, [x9, #8]
	add	x10, x21, x10, lsl #3
	add	x21, x10, #16
	ldr	x10, [x22, #56]
	cmp	x21, x10
	b.hs	LBB10_4
; %bb.2:
	stp	x8, x20, [x21, #-16]
	str	x9, [x21]
	ldrb	w9, [x8, #8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #9]
	ldrh	w0, [x8, #10]
	add	x20, x8, #12
	br	x2
LBB10_3:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh17:
	adrp	x0, l___func__.val_as_ptr@PAGE
Lloh18:
	add	x0, x0, l___func__.val_as_ptr@PAGEOFF
Lloh19:
	adrp	x1, l_.str.12@PAGE
Lloh20:
	add	x1, x1, l_.str.12@PAGEOFF
Lloh21:
	adrp	x3, l_.str.13@PAGE
Lloh22:
	add	x3, x3, l_.str.13@PAGEOFF
	mov	w2, #108                        ; =0x6c
	bl	___assert_rtn
LBB10_4:
	add	x20, x8, #8
	b	_stackoverflow
	.loh AdrpAdd	Lloh21, Lloh22
	.loh AdrpAdd	Lloh19, Lloh20
	.loh AdrpAdd	Lloh17, Lloh18
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Call
_vm_op_Call:                            ; @vm_op_Call
	.cfi_startproc
; %bb.0:
	ldr	x8, [x24, w0, uxtw #3]
	add	x9, x21, w1, uxtw #3
	add	x21, x9, #16
	ldr	x9, [x22, #56]
	cmp	x21, x9
	b.hs	LBB11_2
; %bb.1:
	stp	x8, x20, [x21, #-16]
	ldrb	w9, [x8, #8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #9]
	ldrh	w0, [x8, #10]
	add	x20, x8, #12
	br	x2
LBB11_2:
	add	x20, x8, #8
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Retu
_vm_op_Retu:                            ; @vm_op_Retu
	.cfi_startproc
; %bb.0:
	str	xzr, [x21, #-16]!
	ldr	x8, [x21, #8]
	ldurb	w9, [x8, #-3]
	sub	x21, x21, x9, lsl #3
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Ret
_vm_op_Ret:                             ; @vm_op_Ret
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	str	x8, [x21, #-16]!
	ldr	x8, [x21, #8]
	ldurb	w9, [x8, #-3]
	sub	x21, x21, x9, lsl #3
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Retn
_vm_op_Retn:                            ; @vm_op_Retn
	.cfi_startproc
; %bb.0:
	ldur	x8, [x21, #-8]
	sub	x9, x21, #16
	cbz	w0, LBB14_8
; %bb.1:
	mov	w10, w1
	mov	w11, w0
	cmp	w0, #7
	b.hi	LBB14_3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	LBB14_6
LBB14_3:
	and	x12, x11, #0xfff8
	add	x13, x21, #48
	add	x14, x21, x10, lsl #3
	add	x14, x14, #32
	mov	x15, x12
LBB14_4:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x14, #-32]
	ldp	q2, q3, [x14], #64
	stp	q0, q1, [x13, #-64]
	stp	q2, q3, [x13, #-32]
	add	x13, x13, #64
	subs	x15, x15, #8
	b.ne	LBB14_4
; %bb.5:
	cmp	x12, x11
	b.eq	LBB14_8
LBB14_6:
	add	x13, x21, x12, lsl #3
	sub	x11, x11, x12
LBB14_7:                                ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x13, x10, lsl #3]
	stur	x12, [x13, #-16]
	add	x13, x13, #8
	subs	x11, x11, #1
	b.ne	LBB14_7
LBB14_8:
	ldurb	w10, [x8, #-3]
	sub	x21, x9, x10, lsl #3
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Clos
_vm_op_Clos:                            ; @vm_op_Clos
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x1
	mov	x26, x0
	; InlineAsm Start
	mov	x27, x30
	; InlineAsm End
	mov	w0, #24                         ; =0x18
	mov	x1, x22
	mov	x2, x21
	bl	_alloc_object
	mov	x25, x0
	; InlineAsm Start
	mov	x30, x27
	; InlineAsm End
	ldr	x1, [x24, w26, uxtw #3]
	mov	x2, #0                          ; =0x0
	bl	_closure_init
	cbz	x25, LBB15_3
; %bb.1:
	mov	x8, #2                          ; =0x2
	movk	x8, #65534, lsl #48
	tst	x25, x8
	b.ne	LBB15_4
; %bb.2:
	str	x25, [x21, w19, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB15_3:
Lloh23:
	adrp	x0, l___func__.val_from_ptr@PAGE
Lloh24:
	add	x0, x0, l___func__.val_from_ptr@PAGEOFF
Lloh25:
	adrp	x1, l_.str.12@PAGE
Lloh26:
	add	x1, x1, l_.str.12@PAGEOFF
Lloh27:
	adrp	x3, l_.str.15@PAGE
Lloh28:
	add	x3, x3, l_.str.15@PAGEOFF
	mov	w2, #102                        ; =0x66
	bl	___assert_rtn
LBB15_4:
Lloh29:
	adrp	x0, l___func__.val_from_ptr@PAGE
Lloh30:
	add	x0, x0, l___func__.val_from_ptr@PAGEOFF
Lloh31:
	adrp	x1, l_.str.12@PAGE
Lloh32:
	add	x1, x1, l_.str.12@PAGEOFF
Lloh33:
	adrp	x3, l_.str.16@PAGE
Lloh34:
	add	x3, x3, l_.str.16@PAGEOFF
	mov	w2, #103                        ; =0x67
	bl	___assert_rtn
	.loh AdrpAdd	Lloh27, Lloh28
	.loh AdrpAdd	Lloh25, Lloh26
	.loh AdrpAdd	Lloh23, Lloh24
	.loh AdrpAdd	Lloh33, Lloh34
	.loh AdrpAdd	Lloh31, Lloh32
	.loh AdrpAdd	Lloh29, Lloh30
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_WObj
_vm_op_WObj:                            ; @vm_op_WObj
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x27, x0
	and	w28, w0, #0xff
	ldr	x8, [x22, #32]
	cmp	x8, x28
	b.lo	LBB16_14
; %bb.1:
	mov	x26, x1
	str	x24, [sp, #8]                   ; 8-byte Folded Spill
	lsr	w24, w27, #8
	; InlineAsm Start
	mov	x19, x30
	; InlineAsm End
	lsl	w8, w24, #3
	add	w8, w8, #15
	and	x0, x8, #0xff8
	mov	x1, x22
	mov	x2, x21
	bl	_alloc_object
	mov	x25, x0
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
	mov	x1, x28
	mov	x2, x24
	bl	_object_init
	cmp	w27, #256
	b.hs	LBB16_4
; %bb.2:
	cbnz	x25, LBB16_9
; %bb.3:
Lloh35:
	adrp	x0, l___func__.val_from_ptr@PAGE
Lloh36:
	add	x0, x0, l___func__.val_from_ptr@PAGEOFF
Lloh37:
	adrp	x1, l_.str.12@PAGE
Lloh38:
	add	x1, x1, l_.str.12@PAGEOFF
Lloh39:
	adrp	x3, l_.str.15@PAGE
Lloh40:
	add	x3, x3, l_.str.15@PAGEOFF
	mov	w2, #102                        ; =0x66
	bl	___assert_rtn
LBB16_4:
	mov	w8, w26
	cmp	w27, #2559
	b.ls	LBB16_6
; %bb.5:
	lsl	x9, x8, #3
	add	x11, x9, x21
	sub	x9, x25, x11
	add	x9, x9, #8
	cmp	x9, #64
	b.hs	LBB16_11
LBB16_6:
	mov	x9, #0                          ; =0x0
LBB16_7:
	lsl	x10, x9, #3
	add	x8, x10, x8, lsl #3
	add	x8, x21, x8
	add	x10, x10, x25
	add	x10, x10, #8
	sub	x9, x24, x9
LBB16_8:                                ; =>This Inner Loop Header: Depth=1
	ldr	x11, [x8], #8
	str	x11, [x10], #8
	subs	x9, x9, #1
	b.ne	LBB16_8
LBB16_9:
	mov	x8, #2                          ; =0x2
	movk	x8, #65534, lsl #48
	tst	x25, x8
	b.ne	LBB16_15
; %bb.10:
	str	x25, [x21, w26, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldr	x24, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB16_11:
	and	x9, x24, #0xf8
	add	x10, x25, #40
	add	x11, x11, #32
	mov	x12, x9
LBB16_12:                               ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x11, #-32]
	ldp	q2, q3, [x11], #64
	stp	q0, q1, [x10, #-32]
	stp	q2, q3, [x10], #64
	subs	x12, x12, #8
	b.ne	LBB16_12
; %bb.13:
	cmp	x9, x24
	b.ne	LBB16_7
	b	LBB16_9
LBB16_14:
	mov	x0, x27
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_invalidlayout
LBB16_15:
Lloh41:
	adrp	x0, l___func__.val_from_ptr@PAGE
Lloh42:
	add	x0, x0, l___func__.val_from_ptr@PAGEOFF
Lloh43:
	adrp	x1, l_.str.12@PAGE
Lloh44:
	add	x1, x1, l_.str.12@PAGEOFF
Lloh45:
	adrp	x3, l_.str.16@PAGE
Lloh46:
	add	x3, x3, l_.str.16@PAGEOFF
	mov	w2, #103                        ; =0x67
	bl	___assert_rtn
	.loh AdrpAdd	Lloh39, Lloh40
	.loh AdrpAdd	Lloh37, Lloh38
	.loh AdrpAdd	Lloh35, Lloh36
	.loh AdrpAdd	Lloh45, Lloh46
	.loh AdrpAdd	Lloh43, Lloh44
	.loh AdrpAdd	Lloh41, Lloh42
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MObj
_vm_op_MObj:                            ; @vm_op_MObj
	.cfi_startproc
; %bb.0:
	mov	x19, x1
	and	w8, w0, #0xff
	cmp	w8, #3
	b.hi	LBB17_2
; %bb.1:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x0, x8
	bl	_val_from_tag
	str	x0, [x21, w19, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB17_2:
	ldr	x9, [x22, #32]
	cmp	x9, w8, uxtw
	b.lo	LBB17_4
; %bb.3:
	lsr	w8, w0, #8
	ldr	x8, [x21, w8, uxtw #3]
	str	x8, [x21, w19, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
LBB17_4:
	mov	x1, x19
	b	_invalidlayout
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Jmp
_vm_op_Jmp:                             ; @vm_op_Jmp
	.cfi_startproc
; %bb.0:
	sxth	w8, w0
	orr	w8, w1, w8, lsl #8
	add	x8, x20, w8, sxtw #2
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Goto
_vm_op_Goto:                            ; @vm_op_Goto
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	sxtw	x9, w8
	mov	x10, #-562949953421313          ; =0xfffdffffffffffff
	cmp	x8, x10
	csel	x8, x9, x8, hi
	add	x8, x20, x8, lsl #2
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_AddDI
_vm_op_AddDI:                           ; @vm_op_AddDI
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x0
	sxtb	w25, w0
	ldr	x0, [x21, w1, uxtw #3]
	mov	x8, #-562949953421312           ; =0xfffe000000000000
	cmp	x0, x8
	b.lo	LBB20_3
; %bb.1:
	adds	w8, w0, w25
	b.vc	LBB20_6
; %bb.2:
	scvtf	d0, w0
	scvtf	d1, w25
	fadd	d0, d1, d0
	b	LBB20_5
LBB20_3:
	lsr	x8, x0, #49
	cbz	x8, LBB20_8
; %bb.4:
	bl	_val_as_f64
	scvtf	d1, w25
	fadd	d0, d0, d1
LBB20_5:
	bl	_val_from_f64
	b	LBB20_7
LBB20_6:
	orr	x0, x8, #0xfffe000000000000
LBB20_7:
	lsr	w8, w19, #8
	str	x0, [x21, w8, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB20_8:
	mov	x0, x19
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SubDI
_vm_op_SubDI:                           ; @vm_op_SubDI
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x0
	sxtb	w25, w0
	ldr	x0, [x21, w1, uxtw #3]
	mov	x8, #-562949953421312           ; =0xfffe000000000000
	cmp	x0, x8
	b.lo	LBB21_3
; %bb.1:
	subs	w8, w0, w25
	b.vc	LBB21_6
; %bb.2:
	scvtf	d0, w0
	b	LBB21_5
LBB21_3:
	lsr	x8, x0, #49
	cbz	x8, LBB21_8
; %bb.4:
	bl	_val_as_f64
LBB21_5:
	scvtf	d1, w25
	fsub	d0, d0, d1
	bl	_val_from_f64
	b	LBB21_7
LBB21_6:
	orr	x0, x8, #0xfffe000000000000
LBB21_7:
	lsr	w8, w19, #8
	str	x0, [x21, w8, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB21_8:
	mov	x0, x19
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MulDI
_vm_op_MulDI:                           ; @vm_op_MulDI
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x0
	sxtb	w25, w0
	ldr	x0, [x21, w1, uxtw #3]
	mov	x8, #-562949953421312           ; =0xfffe000000000000
	cmp	x0, x8
	b.lo	LBB22_3
; %bb.1:
	smull	x8, w0, w25
	cmp	x8, w8, sxtw
	b.eq	LBB22_6
; %bb.2:
	scvtf	d0, w0
	scvtf	d1, w25
	fmul	d0, d1, d0
	b	LBB22_5
LBB22_3:
	lsr	x8, x0, #49
	cbz	x8, LBB22_8
; %bb.4:
	bl	_val_as_f64
	scvtf	d1, w25
	fmul	d0, d0, d1
LBB22_5:
	bl	_val_from_f64
	b	LBB22_7
LBB22_6:
	mov	w8, w8
	orr	x0, x8, #0xfffe000000000000
LBB22_7:
	lsr	w8, w19, #8
	str	x0, [x21, w8, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB22_8:
	mov	x0, x19
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DivDI
_vm_op_DivDI:                           ; @vm_op_DivDI
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x0
	sxtb	w25, w0
	ldr	x0, [x21, w1, uxtw #3]
	mov	x8, #-562949953421312           ; =0xfffe000000000000
	cmp	x0, x8
	b.lo	LBB23_6
; %bb.1:
	lsl	w8, w19, #24
	cbz	w8, LBB23_5
; %bb.2:
	mov	w9, #-16777216                  ; =0xff000000
	cmp	w8, w9
	b.ne	LBB23_4
; %bb.3:
	mov	w8, #-2147483648                ; =0x80000000
	cmp	w0, w8
	b.eq	LBB23_5
LBB23_4:
	sdiv	w8, w0, w25
	msub	w9, w8, w25, w0
	cbz	w9, LBB23_11
LBB23_5:
	scvtf	d0, w0
	b	LBB23_8
LBB23_6:
	lsr	x8, x0, #49
	cbz	x8, LBB23_10
; %bb.7:
	bl	_val_as_f64
LBB23_8:
	scvtf	d1, w25
	fdiv	d0, d0, d1
	bl	_val_from_f64
LBB23_9:
	lsr	w8, w19, #8
	str	x0, [x21, w8, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB23_10:
	mov	x0, x19
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
LBB23_11:
	orr	x0, x8, #0xfffe000000000000
	b	LBB23_9
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ModDI
_vm_op_ModDI:                           ; @vm_op_ModDI
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x0
	lsr	w19, w0, #8
	sxtb	w25, w0
	ldr	x0, [x21, w1, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x0, x9
	b.lo	LBB24_3
; %bb.1:
	lsl	w8, w8, #24
	cbz	w8, LBB24_6
; %bb.2:
	sdiv	w8, w0, w25
	msub	w8, w8, w25, w0
	orr	x8, x8, #0xfffe000000000000
	str	x8, [x21, w19, uxtw #3]
	b	LBB24_8
LBB24_3:
	lsr	x9, x0, #49
	cbz	x9, LBB24_5
; %bb.4:
	bl	_val_as_f64
	scvtf	d1, w25
	b	LBB24_7
LBB24_5:
	mov	x0, x8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
LBB24_6:
	scvtf	d0, w0
	movi	d1, #0000000000000000
LBB24_7:
	bl	_fmod
	bl	_val_from_f64
	str	x0, [x21, w19, uxtw #3]
LBB24_8:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_AddDD
_vm_op_AddDD:                           ; @vm_op_AddDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	and	w9, w0, #0xff
	ldr	x8, [x21, w1, uxtw #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x8, x10
	b.lo	LBB25_4
; %bb.1:
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x9, x10
	b.lo	LBB25_7
; %bb.2:
	adds	w10, w8, w9
	b.vc	LBB25_10
; %bb.3:
	scvtf	d0, w8
	scvtf	d1, w9
	fadd	d0, d0, d1
	mov	x19, x0
	b	LBB25_9
LBB25_4:
	lsr	x10, x8, #49
	cbz	x10, LBB25_15
; %bb.5:
	ldr	x19, [x21, w9, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB25_11
; %bb.6:
	mov	x25, x0
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fadd	d0, d0, d1
	b	LBB25_13
LBB25_7:
	lsr	x10, x9, #49
	cbz	x10, LBB25_15
; %bb.8:
	scvtf	d8, w8
	mov	x19, x0
	mov	x0, x9
	bl	_val_as_f64
	fadd	d0, d0, d8
LBB25_9:
	bl	_val_from_f64
	mov	x8, x0
	mov	x0, x19
	b	LBB25_14
LBB25_10:
	orr	x8, x10, #0xfffe000000000000
	b	LBB25_14
LBB25_11:
	lsr	x9, x19, #49
	cbz	x9, LBB25_15
; %bb.12:
	mov	x25, x0
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fadd	d0, d8, d0
LBB25_13:
	bl	_val_from_f64
	mov	x8, x0
	mov	x0, x25
LBB25_14:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB25_15:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SubDD
_vm_op_SubDD:                           ; @vm_op_SubDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	and	w9, w0, #0xff
	ldr	x8, [x21, w1, uxtw #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x8, x10
	b.lo	LBB26_4
; %bb.1:
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x9, x10
	b.lo	LBB26_7
; %bb.2:
	subs	w10, w8, w9
	b.vc	LBB26_10
; %bb.3:
	scvtf	d0, w8
	scvtf	d1, w9
	fsub	d0, d0, d1
	mov	x19, x0
	b	LBB26_9
LBB26_4:
	lsr	x10, x8, #49
	cbz	x10, LBB26_15
; %bb.5:
	ldr	x19, [x21, w9, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB26_11
; %bb.6:
	mov	x25, x0
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fsub	d0, d0, d1
	b	LBB26_13
LBB26_7:
	lsr	x10, x9, #49
	cbz	x10, LBB26_15
; %bb.8:
	scvtf	d8, w8
	mov	x19, x0
	mov	x0, x9
	bl	_val_as_f64
	fsub	d0, d8, d0
LBB26_9:
	bl	_val_from_f64
	mov	x8, x0
	mov	x0, x19
	b	LBB26_14
LBB26_10:
	orr	x8, x10, #0xfffe000000000000
	b	LBB26_14
LBB26_11:
	lsr	x9, x19, #49
	cbz	x9, LBB26_15
; %bb.12:
	mov	x25, x0
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fsub	d0, d8, d0
LBB26_13:
	bl	_val_from_f64
	mov	x8, x0
	mov	x0, x25
LBB26_14:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB26_15:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MulDD
_vm_op_MulDD:                           ; @vm_op_MulDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	and	w9, w0, #0xff
	ldr	x8, [x21, w1, uxtw #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x8, x10
	b.lo	LBB27_4
; %bb.1:
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x9, x10
	b.lo	LBB27_7
; %bb.2:
	smull	x10, w8, w9
	cmp	x10, w10, sxtw
	b.eq	LBB27_10
; %bb.3:
	scvtf	d0, w8
	scvtf	d1, w9
	fmul	d0, d0, d1
	mov	x19, x0
	b	LBB27_9
LBB27_4:
	lsr	x10, x8, #49
	cbz	x10, LBB27_15
; %bb.5:
	ldr	x19, [x21, w9, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB27_11
; %bb.6:
	mov	x25, x0
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fmul	d0, d0, d1
	b	LBB27_13
LBB27_7:
	lsr	x10, x9, #49
	cbz	x10, LBB27_15
; %bb.8:
	scvtf	d8, w8
	mov	x19, x0
	mov	x0, x9
	bl	_val_as_f64
	fmul	d0, d0, d8
LBB27_9:
	bl	_val_from_f64
	mov	x8, x0
	mov	x0, x19
	b	LBB27_14
LBB27_10:
	mov	w8, w10
	orr	x8, x8, #0xfffe000000000000
	b	LBB27_14
LBB27_11:
	lsr	x9, x19, #49
	cbz	x9, LBB27_15
; %bb.12:
	mov	x25, x0
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fmul	d0, d8, d0
LBB27_13:
	bl	_val_from_f64
	mov	x8, x0
	mov	x0, x25
LBB27_14:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB27_15:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DivDD
_vm_op_DivDD:                           ; @vm_op_DivDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	and	w9, w0, #0xff
	ldr	x8, [x21, w1, uxtw #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x8, x10
	b.lo	LBB28_6
; %bb.1:
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x9, x10
	b.lo	LBB28_9
; %bb.2:
	cbz	w9, LBB28_5
; %bb.3:
	mov	w10, #-2147483648               ; =0x80000000
	cmp	w8, w10
	ccmn	w9, #1, #0, eq
	b.eq	LBB28_5
; %bb.4:
	sdiv	w10, w8, w9
	msub	w11, w10, w9, w8
	cbz	w11, LBB28_17
LBB28_5:
	scvtf	d0, w8
	scvtf	d1, w9
	fdiv	d0, d0, d1
	mov	x19, x0
	b	LBB28_11
LBB28_6:
	lsr	x10, x8, #49
	cbz	x10, LBB28_16
; %bb.7:
	ldr	x19, [x21, w9, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB28_12
; %bb.8:
	mov	x25, x0
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fdiv	d0, d0, d1
	b	LBB28_14
LBB28_9:
	lsr	x10, x9, #49
	cbz	x10, LBB28_16
; %bb.10:
	scvtf	d8, w8
	mov	x19, x0
	mov	x0, x9
	bl	_val_as_f64
	fdiv	d0, d8, d0
LBB28_11:
	bl	_val_from_f64
	mov	x8, x0
	mov	x0, x19
	b	LBB28_15
LBB28_12:
	lsr	x9, x19, #49
	cbz	x9, LBB28_16
; %bb.13:
	mov	x25, x0
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fdiv	d0, d8, d0
LBB28_14:
	bl	_val_from_f64
	mov	x8, x0
	mov	x0, x25
LBB28_15:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB28_16:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
LBB28_17:
	orr	x8, x10, #0xfffe000000000000
	b	LBB28_15
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_ModDD
_vm_op_ModDD:                           ; @vm_op_ModDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x0
	lsr	w25, w0, #8
	and	w9, w0, #0xff
	ldr	x0, [x21, w1, uxtw #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x0, x10
	b.lo	LBB29_4
; %bb.1:
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x9, x10
	b.lo	LBB29_7
; %bb.2:
	cbz	w9, LBB29_13
; %bb.3:
	sdiv	w8, w0, w9
	msub	w8, w8, w9, w0
	orr	x8, x8, #0xfffe000000000000
	str	x8, [x21, w25, uxtw #3]
	b	LBB29_15
LBB29_4:
	lsr	x10, x0, #49
	cbz	x10, LBB29_12
; %bb.5:
	ldr	x19, [x21, w9, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB29_9
; %bb.6:
	bl	_val_as_f64
	scvtf	d1, w19
	b	LBB29_14
LBB29_7:
	lsr	x10, x9, #49
	cbz	x10, LBB29_12
; %bb.8:
	scvtf	d8, w0
	mov	x0, x9
	b	LBB29_11
LBB29_9:
	lsr	x9, x19, #49
	cbz	x9, LBB29_12
; %bb.10:
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
LBB29_11:
	bl	_val_as_f64
	fmov	d1, d0
	fmov	d0, d8
	b	LBB29_14
LBB29_12:
	mov	x0, x8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
LBB29_13:
	scvtf	d0, w0
	movi	d1, #0000000000000000
LBB29_14:
	bl	_fmod
	bl	_val_from_f64
	str	x0, [x21, w25, uxtw #3]
LBB29_15:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_NegD
_vm_op_NegD:                            ; @vm_op_NegD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x0
	ldr	x0, [x21, w1, uxtw #3]
	mov	x8, #-562949953421312           ; =0xfffe000000000000
	cmp	x0, x8
	b.lo	LBB30_3
; %bb.1:
	mov	w8, #-2147483648                ; =0x80000000
	cmp	w0, w8
	b.ne	LBB30_6
; %bb.2:
	mov	x8, #4746794007248502784        ; =0x41e0000000000000
	fmov	d0, x8
	b	LBB30_5
LBB30_3:
	lsr	x8, x0, #49
	cbz	x8, LBB30_8
; %bb.4:
	bl	_val_as_f64
	fneg	d0, d0
LBB30_5:
	bl	_val_from_f64
	b	LBB30_7
LBB30_6:
	neg	w8, w0
	orr	x0, x8, #0xfffe000000000000
LBB30_7:
	lsr	w8, w19, #8
	str	x0, [x21, w8, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB30_8:
	mov	x0, x19
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCond
_vm_op_SetCond:                         ; @vm_op_SetCond
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x20
	ldrb	w9, [x20]
	ldrb	w8, [x20, #1]
	ldrh	w25, [x20, #2]
	add	x20, x20, #4
	sub	w9, w9, #31
	cmp	w9, #14
	b.hi	LBB31_25
; %bb.1:
Lloh47:
	adrp	x10, lJTI31_0@PAGE
Lloh48:
	add	x10, x10, lJTI31_0@PAGEOFF
	adr	x11, LBB31_2
	ldrb	w12, [x10, x9]
	add	x11, x11, x12, lsl #2
	br	x11
LBB31_2:
	ldr	x8, [x21, x8, lsl #3]
	mov	w9, #65535                      ; =0xffff
	cmp	w25, w9
	b.eq	LBB31_112
; %bb.3:
	cmp	x8, #7
	b.ne	LBB31_9
LBB31_4:
	tbnz	w0, #15, LBB31_10
LBB31_5:
	mov	w8, #7                          ; =0x7
	str	x8, [x21, w1, uxtw #3]
	b	LBB31_75
LBB31_6:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x26, [x21, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_58
; %bb.7:
	cmp	x26, x10
	b.lo	LBB31_53
LBB31_8:
	cmp	w9, w26
	b.ge	LBB31_4
LBB31_9:
	sxth	w8, w0
	cmp	w8, #1
	b.lt	LBB31_5
LBB31_10:
	mov	w8, #6                          ; =0x6
	str	x8, [x21, w1, uxtw #3]
	b	LBB31_57
LBB31_11:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x26, [x21, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_61
; %bb.12:
	cmp	x26, x10
	b.lo	LBB31_37
LBB31_13:
	cmp	w9, w26
	b.ge	LBB31_9
	b	LBB31_4
LBB31_14:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x10, [x22, #40]
	ldr	x26, [x10, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_64
; %bb.15:
	cmp	x26, x10
	b.lo	LBB31_49
LBB31_16:
	cmp	w9, w26
	b.eq	LBB31_9
	b	LBB31_4
LBB31_17:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x26, [x21, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_67
; %bb.18:
	cmp	x26, x10
	b.lo	LBB31_45
LBB31_19:
	cmp	w9, w26
	b.gt	LBB31_9
	b	LBB31_4
LBB31_20:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x26, [x21, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_70
; %bb.21:
	cmp	x26, x10
	b.lo	LBB31_28
LBB31_22:
	cmp	w9, w26
	b.ne	LBB31_9
	b	LBB31_4
LBB31_23:
	ldr	x9, [x21, x8, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_76
; %bb.24:
	cmp	w9, w25
	b.eq	LBB31_9
	b	LBB31_4
LBB31_25:
	mov	x0, x25
	mov	x1, x8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_unimplemented
LBB31_26:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x10, [x22, #40]
	ldr	x26, [x10, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_80
; %bb.27:
	cmp	x26, x10
	b.hs	LBB31_22
LBB31_28:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.29:
	mov	x27, x0
	mov	x25, x1
	scvtf	d8, w9
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d0, d8
	b.eq	LBB31_73
	b	LBB31_55
LBB31_30:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x10, [x22, #40]
	ldr	x26, [x10, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_84
; %bb.31:
	cmp	x26, x10
	b.lo	LBB31_41
LBB31_32:
	cmp	w9, w26
	b.le	LBB31_9
	b	LBB31_4
LBB31_33:
	ldr	x9, [x21, x8, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_87
; %bb.34:
	cmp	w9, w25
	b.ne	LBB31_9
	b	LBB31_4
LBB31_35:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x10, [x22, #40]
	ldr	x26, [x10, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_91
; %bb.36:
	cmp	x26, x10
	b.hs	LBB31_13
LBB31_37:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.38:
	mov	x27, x0
	mov	x25, x1
	scvtf	d8, w9
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d0, d8
	b.gt	LBB31_73
	b	LBB31_55
LBB31_39:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x26, [x21, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_95
; %bb.40:
	cmp	x26, x10
	b.hs	LBB31_32
LBB31_41:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.42:
	mov	x27, x0
	mov	x25, x1
	scvtf	d8, w9
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d0, d8
	b.mi	LBB31_73
	b	LBB31_55
LBB31_43:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x10, [x22, #40]
	ldr	x26, [x10, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_99
; %bb.44:
	cmp	x26, x10
	b.hs	LBB31_19
LBB31_45:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.46:
	mov	x27, x0
	mov	x25, x1
	scvtf	d8, w9
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d0, d8
	b.ge	LBB31_73
	b	LBB31_55
LBB31_47:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x26, [x21, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_103
; %bb.48:
	cmp	x26, x10
	b.hs	LBB31_16
LBB31_49:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.50:
	mov	x27, x0
	mov	x25, x1
	scvtf	d8, w9
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d0, d8
	b.ne	LBB31_73
	b	LBB31_55
LBB31_51:
	ldr	x9, [x21, x8, lsl #3]
	ldr	x10, [x22, #40]
	ldr	x26, [x10, x25, lsl #3]
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x9, x10
	b.lo	LBB31_107
; %bb.52:
	cmp	x26, x10
	b.hs	LBB31_8
LBB31_53:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.54:
	mov	x27, x0
	mov	x25, x1
	scvtf	d8, w9
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d0, d8
	b.ls	LBB31_73
LBB31_55:
	sxth	w8, w27
	cmp	w8, #1
	b.lt	LBB31_74
LBB31_56:
	mov	w8, #6                          ; =0x6
	str	x8, [x21, w25, uxtw #3]
LBB31_57:
	add	x20, x19, #8
	b	LBB31_75
LBB31_58:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.59:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.lo	LBB31_109
LBB31_60:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	scvtf	d1, w26
	fcmp	d0, d1
	b.ge	LBB31_73
	b	LBB31_55
LBB31_61:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.62:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.lo	LBB31_93
LBB31_63:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	scvtf	d1, w26
	fcmp	d0, d1
	b.mi	LBB31_73
	b	LBB31_55
LBB31_64:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.65:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.lo	LBB31_105
LBB31_66:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	scvtf	d1, w26
	fcmp	d0, d1
	b.ne	LBB31_73
	b	LBB31_55
LBB31_67:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.68:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.lo	LBB31_101
LBB31_69:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	scvtf	d1, w26
	fcmp	d0, d1
	b.ls	LBB31_73
	b	LBB31_55
LBB31_70:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.71:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.lo	LBB31_82
LBB31_72:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	scvtf	d1, w26
	fcmp	d0, d1
	b.ne	LBB31_55
LBB31_73:
	tbnz	w27, #15, LBB31_56
LBB31_74:
	mov	w8, #7                          ; =0x7
	str	x8, [x21, w25, uxtw #3]
LBB31_75:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB31_76:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.77:
	mov	x27, x0
	mov	x26, x1
	mov	x0, x9
	bl	_val_as_f64
	ucvtf	d1, w25
	fcmp	d0, d1
	b.eq	LBB31_89
LBB31_78:
	tbnz	w27, #15, LBB31_90
LBB31_79:
	mov	w8, #7                          ; =0x7
	str	x8, [x21, w26, uxtw #3]
	b	LBB31_75
LBB31_80:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.81:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.hs	LBB31_72
LBB31_82:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.83:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d8, d0
	b.eq	LBB31_73
	b	LBB31_55
LBB31_84:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.85:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.lo	LBB31_97
LBB31_86:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	scvtf	d1, w26
	fcmp	d0, d1
	b.gt	LBB31_73
	b	LBB31_55
LBB31_87:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.88:
	mov	x27, x0
	mov	x26, x1
	mov	x0, x9
	bl	_val_as_f64
	ucvtf	d1, w25
	fcmp	d0, d1
	b.eq	LBB31_78
LBB31_89:
	sxth	w8, w27
	cmp	w8, #1
	b.lt	LBB31_79
LBB31_90:
	mov	w8, #6                          ; =0x6
	str	x8, [x21, w26, uxtw #3]
	b	LBB31_57
LBB31_91:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.92:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.hs	LBB31_63
LBB31_93:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.94:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d8, d0
	b.mi	LBB31_73
	b	LBB31_55
LBB31_95:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.96:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.hs	LBB31_86
LBB31_97:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.98:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d8, d0
	b.gt	LBB31_73
	b	LBB31_55
LBB31_99:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.100:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.hs	LBB31_69
LBB31_101:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.102:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d8, d0
	b.ls	LBB31_73
	b	LBB31_55
LBB31_103:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.104:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.hs	LBB31_66
LBB31_105:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.106:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d8, d0
	b.ne	LBB31_73
	b	LBB31_55
LBB31_107:
	lsr	x10, x9, #49
	cbz	x10, LBB31_111
; %bb.108:
	mov	x10, #-562949953421312          ; =0xfffe000000000000
	cmp	x26, x10
	b.hs	LBB31_60
LBB31_109:
	lsr	x10, x26, #49
	cbz	x10, LBB31_111
; %bb.110:
	mov	x27, x0
	mov	x25, x1
	mov	x0, x9
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x26
	bl	_val_as_f64
	fcmp	d8, d0
	b.ge	LBB31_73
	b	LBB31_55
LBB31_111:
	mov	x0, x25
	mov	x1, x8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
LBB31_112:
	cmp	x8, #6
	b.ne	LBB31_9
	b	LBB31_4
	.loh AdrpAdd	Lloh47, Lloh48
	.cfi_endproc
	.section	__TEXT,__const
lJTI31_0:
	.byte	(LBB31_2-LBB31_2)>>2
	.byte	(LBB31_33-LBB31_2)>>2
	.byte	(LBB31_23-LBB31_2)>>2
	.byte	(LBB31_26-LBB31_2)>>2
	.byte	(LBB31_14-LBB31_2)>>2
	.byte	(LBB31_35-LBB31_2)>>2
	.byte	(LBB31_43-LBB31_2)>>2
	.byte	(LBB31_30-LBB31_2)>>2
	.byte	(LBB31_51-LBB31_2)>>2
	.byte	(LBB31_20-LBB31_2)>>2
	.byte	(LBB31_47-LBB31_2)>>2
	.byte	(LBB31_11-LBB31_2)>>2
	.byte	(LBB31_17-LBB31_2)>>2
	.byte	(LBB31_39-LBB31_2)>>2
	.byte	(LBB31_6-LBB31_2)>>2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	5                               ; -- Begin function vm_op_CmpNotF
_vm_op_CmpNotF:                         ; @vm_op_CmpNotF
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	mov	w9, #65535                      ; =0xffff
	cmp	w0, w9
	mov	w9, #6                          ; =0x6
	cinc	x9, x9, ne
	cmp	x8, x9
	cset	w8, ne
	add	x8, x20, w8, uxtw #2
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDI
_vm_op_CmpEqDI:                         ; @vm_op_CmpEqDI
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB33_2
; %bb.1:
	cmp	w8, w0
	cset	w8, ne
	add	x8, x20, w8, uxtw #2
	b	LBB33_4
LBB33_2:
	lsr	x9, x8, #49
	cbz	x9, LBB33_5
; %bb.3:
	mov	x19, x0
	mov	x0, x8
	bl	_val_as_f64
	ucvtf	d1, w19
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x8, x20, x8, eq
LBB33_4:
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB33_5:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDI
_vm_op_CmpNeDI:                         ; @vm_op_CmpNeDI
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB34_2
; %bb.1:
	cmp	w8, w0
	cset	w8, eq
	add	x8, x20, w8, uxtw #2
	b	LBB34_4
LBB34_2:
	lsr	x9, x8, #49
	cbz	x9, LBB34_5
; %bb.3:
	mov	x19, x0
	mov	x0, x8
	bl	_val_as_f64
	ucvtf	d1, w19
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x8, x20, x8, ne
LBB34_4:
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB34_5:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDC
_vm_op_CmpEqDC:                         ; @vm_op_CmpEqDC
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x22, #40]
	ldr	x19, [x9, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB35_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB35_7
; %bb.2:
	cmp	w8, w19
	cset	w8, ne
	add	x20, x20, w8, uxtw #2
	b	LBB35_12
LBB35_3:
	lsr	x9, x8, #49
	cbz	x9, LBB35_13
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB35_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.eq	LBB35_12
; %bb.6:
	add	x20, x20, #4
	b	LBB35_12
LBB35_7:
	lsr	x9, x19, #49
	cbz	x9, LBB35_13
; %bb.8:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	b	LBB35_11
LBB35_9:
	lsr	x9, x19, #49
	cbz	x9, LBB35_13
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
LBB35_11:
	add	x8, x20, #4
	csel	x20, x20, x8, eq
LBB35_12:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB35_13:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDC
_vm_op_CmpNeDC:                         ; @vm_op_CmpNeDC
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x22, #40]
	ldr	x19, [x9, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB36_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB36_7
; %bb.2:
	cmp	w8, w19
	cset	w8, eq
	add	x20, x20, w8, uxtw #2
	b	LBB36_12
LBB36_3:
	lsr	x9, x8, #49
	cbz	x9, LBB36_13
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB36_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.ne	LBB36_12
; %bb.6:
	add	x20, x20, #4
	b	LBB36_12
LBB36_7:
	lsr	x9, x19, #49
	cbz	x9, LBB36_13
; %bb.8:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	b	LBB36_11
LBB36_9:
	lsr	x9, x19, #49
	cbz	x9, LBB36_13
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
LBB36_11:
	add	x8, x20, #4
	csel	x20, x20, x8, ne
LBB36_12:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB36_13:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLtDC
_vm_op_CmpLtDC:                         ; @vm_op_CmpLtDC
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x22, #40]
	ldr	x19, [x9, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB37_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB37_7
; %bb.2:
	cmp	w8, w19
	cset	w8, ge
	add	x20, x20, w8, uxtw #2
	b	LBB37_11
LBB37_3:
	lsr	x9, x8, #49
	cbz	x9, LBB37_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB37_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.mi	LBB37_11
; %bb.6:
	add	x20, x20, #4
	b	LBB37_11
LBB37_7:
	lsr	x9, x19, #49
	cbz	x9, LBB37_12
; %bb.8:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	add	x8, x20, #4
	csel	x20, x20, x8, gt
	b	LBB37_11
LBB37_9:
	lsr	x9, x19, #49
	cbz	x9, LBB37_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, mi
LBB37_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB37_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLeDC
_vm_op_CmpLeDC:                         ; @vm_op_CmpLeDC
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x22, #40]
	ldr	x19, [x9, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB38_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB38_7
; %bb.2:
	cmp	w8, w19
	cset	w8, gt
	add	x20, x20, w8, uxtw #2
	b	LBB38_11
LBB38_3:
	lsr	x9, x8, #49
	cbz	x9, LBB38_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB38_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.ls	LBB38_11
; %bb.6:
	add	x20, x20, #4
	b	LBB38_11
LBB38_7:
	lsr	x9, x19, #49
	cbz	x9, LBB38_12
; %bb.8:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	add	x8, x20, #4
	csel	x20, x20, x8, ge
	b	LBB38_11
LBB38_9:
	lsr	x9, x19, #49
	cbz	x9, LBB38_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, ls
LBB38_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB38_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGtDC
_vm_op_CmpGtDC:                         ; @vm_op_CmpGtDC
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x22, #40]
	ldr	x19, [x9, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB39_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB39_7
; %bb.2:
	cmp	w8, w19
	cset	w8, le
	add	x20, x20, w8, uxtw #2
	b	LBB39_11
LBB39_3:
	lsr	x9, x8, #49
	cbz	x9, LBB39_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB39_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.gt	LBB39_11
; %bb.6:
	add	x20, x20, #4
	b	LBB39_11
LBB39_7:
	lsr	x9, x19, #49
	cbz	x9, LBB39_12
; %bb.8:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	add	x8, x20, #4
	csel	x20, x20, x8, mi
	b	LBB39_11
LBB39_9:
	lsr	x9, x19, #49
	cbz	x9, LBB39_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, gt
LBB39_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB39_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGeDC
_vm_op_CmpGeDC:                         ; @vm_op_CmpGeDC
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x22, #40]
	ldr	x19, [x9, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB40_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB40_7
; %bb.2:
	cmp	w8, w19
	cset	w8, lt
	add	x20, x20, w8, uxtw #2
	b	LBB40_11
LBB40_3:
	lsr	x9, x8, #49
	cbz	x9, LBB40_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB40_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.ge	LBB40_11
; %bb.6:
	add	x20, x20, #4
	b	LBB40_11
LBB40_7:
	lsr	x9, x19, #49
	cbz	x9, LBB40_12
; %bb.8:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	add	x8, x20, #4
	csel	x20, x20, x8, ls
	b	LBB40_11
LBB40_9:
	lsr	x9, x19, #49
	cbz	x9, LBB40_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, ge
LBB40_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB40_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDD
_vm_op_CmpEqDD:                         ; @vm_op_CmpEqDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x19, [x21, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB41_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB41_6
; %bb.2:
	cmp	w8, w19
	cset	w8, ne
	add	x20, x20, w8, uxtw #2
	b	LBB41_11
LBB41_3:
	lsr	x9, x8, #49
	cbz	x9, LBB41_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB41_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.eq	LBB41_11
	b	LBB41_8
LBB41_6:
	lsr	x9, x19, #49
	cbz	x9, LBB41_12
; %bb.7:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	b.eq	LBB41_11
LBB41_8:
	add	x20, x20, #4
	b	LBB41_11
LBB41_9:
	lsr	x9, x19, #49
	cbz	x9, LBB41_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, eq
LBB41_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB41_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDD
_vm_op_CmpNeDD:                         ; @vm_op_CmpNeDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x19, [x21, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB42_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB42_6
; %bb.2:
	cmp	w8, w19
	cset	w8, eq
	add	x20, x20, w8, uxtw #2
	b	LBB42_11
LBB42_3:
	lsr	x9, x8, #49
	cbz	x9, LBB42_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB42_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.ne	LBB42_11
	b	LBB42_8
LBB42_6:
	lsr	x9, x19, #49
	cbz	x9, LBB42_12
; %bb.7:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	b.ne	LBB42_11
LBB42_8:
	add	x20, x20, #4
	b	LBB42_11
LBB42_9:
	lsr	x9, x19, #49
	cbz	x9, LBB42_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, ne
LBB42_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB42_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLtDD
_vm_op_CmpLtDD:                         ; @vm_op_CmpLtDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x19, [x21, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB43_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB43_6
; %bb.2:
	cmp	w8, w19
	cset	w8, ge
	add	x20, x20, w8, uxtw #2
	b	LBB43_11
LBB43_3:
	lsr	x9, x8, #49
	cbz	x9, LBB43_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB43_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.mi	LBB43_11
	b	LBB43_8
LBB43_6:
	lsr	x9, x19, #49
	cbz	x9, LBB43_12
; %bb.7:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	b.gt	LBB43_11
LBB43_8:
	add	x20, x20, #4
	b	LBB43_11
LBB43_9:
	lsr	x9, x19, #49
	cbz	x9, LBB43_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, mi
LBB43_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB43_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLeDD
_vm_op_CmpLeDD:                         ; @vm_op_CmpLeDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x19, [x21, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB44_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB44_6
; %bb.2:
	cmp	w8, w19
	cset	w8, gt
	add	x20, x20, w8, uxtw #2
	b	LBB44_11
LBB44_3:
	lsr	x9, x8, #49
	cbz	x9, LBB44_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB44_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.ls	LBB44_11
	b	LBB44_8
LBB44_6:
	lsr	x9, x19, #49
	cbz	x9, LBB44_12
; %bb.7:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	b.ge	LBB44_11
LBB44_8:
	add	x20, x20, #4
	b	LBB44_11
LBB44_9:
	lsr	x9, x19, #49
	cbz	x9, LBB44_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, ls
LBB44_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB44_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGtDD
_vm_op_CmpGtDD:                         ; @vm_op_CmpGtDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x19, [x21, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB45_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB45_6
; %bb.2:
	cmp	w8, w19
	cset	w8, le
	add	x20, x20, w8, uxtw #2
	b	LBB45_11
LBB45_3:
	lsr	x9, x8, #49
	cbz	x9, LBB45_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB45_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.gt	LBB45_11
	b	LBB45_8
LBB45_6:
	lsr	x9, x19, #49
	cbz	x9, LBB45_12
; %bb.7:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	b.mi	LBB45_11
LBB45_8:
	add	x20, x20, #4
	b	LBB45_11
LBB45_9:
	lsr	x9, x19, #49
	cbz	x9, LBB45_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, gt
LBB45_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB45_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGeDD
_vm_op_CmpGeDD:                         ; @vm_op_CmpGeDD
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x19, [x21, w0, uxtw #3]
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x8, x9
	b.lo	LBB46_3
; %bb.1:
	cmp	x19, x9
	b.lo	LBB46_6
; %bb.2:
	cmp	w8, w19
	cset	w8, lt
	add	x20, x20, w8, uxtw #2
	b	LBB46_11
LBB46_3:
	lsr	x9, x8, #49
	cbz	x9, LBB46_12
; %bb.4:
	mov	x9, #-562949953421312           ; =0xfffe000000000000
	cmp	x19, x9
	b.lo	LBB46_9
; %bb.5:
	mov	x0, x8
	bl	_val_as_f64
	scvtf	d1, w19
	fcmp	d0, d1
	b.ge	LBB46_11
	b	LBB46_8
LBB46_6:
	lsr	x9, x19, #49
	cbz	x9, LBB46_12
; %bb.7:
	scvtf	d8, w8
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d0, d8
	b.ls	LBB46_11
LBB46_8:
	add	x20, x20, #4
	b	LBB46_11
LBB46_9:
	lsr	x9, x19, #49
	cbz	x9, LBB46_12
; %bb.10:
	mov	x0, x8
	bl	_val_as_f64
	fmov	d8, d0
	mov	x0, x19
	bl	_val_as_f64
	fcmp	d8, d0
	add	x8, x20, #4
	csel	x20, x20, x8, ge
LBB46_11:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB46_12:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function undefined
_undefined:                             ; @undefined
	.cfi_startproc
; %bb.0:
Lloh49:
	adrp	x8, l_.str.6@PAGE
Lloh50:
	add	x8, x8, l_.str.6@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh49, Lloh50
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function diverge
_diverge:                               ; @diverge
	.cfi_startproc
; %bb.0:
LBB48_1:                                ; =>This Inner Loop Header: Depth=1
	b	LBB48_1
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
	.cfi_startproc
; %bb.0:
Lloh51:
	adrp	x8, l_.str.8@PAGE
Lloh52:
	add	x8, x8, l_.str.8@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh51, Lloh52
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
	.cfi_startproc
; %bb.0:
Lloh53:
	adrp	x8, l_.str.9@PAGE
Lloh54:
	add	x8, x8, l_.str.9@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh53, Lloh54
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
	.cfi_startproc
; %bb.0:
Lloh55:
	adrp	x8, l_.str.10@PAGE
Lloh56:
	add	x8, x8, l_.str.10@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh55, Lloh56
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
Lloh57:
	adrp	x8, ___stderrp@GOTPAGE
Lloh58:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh59:
	ldr	x0, [x8]
	ldr	x8, [x22, #64]
	str	x8, [sp]
Lloh60:
	adrp	x1, l_.str.7@PAGE
Lloh61:
	add	x1, x1, l_.str.7@PAGEOFF
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
	mov	w0, #255                        ; =0xff
	bl	_exit
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpLdrGotLdr	Lloh57, Lloh58, Lloh59
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
	.cfi_startproc
; %bb.0:
Lloh62:
	adrp	x8, l_.str.11@PAGE
Lloh63:
	add	x8, x8, l_.str.11@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh62, Lloh63
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
	.cfi_startproc
; %bb.0:
Lloh64:
	adrp	x8, l_.str.14@PAGE
Lloh65:
	add	x8, x8, l_.str.14@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh64, Lloh65
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
	.cfi_startproc
; %bb.0:
Lloh66:
	adrp	x8, l_.str.17@PAGE
Lloh67:
	add	x8, x8, l_.str.17@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh66, Lloh67
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function notanumber
_notanumber:                            ; @notanumber
	.cfi_startproc
; %bb.0:
Lloh68:
	adrp	x8, l_.str.19@PAGE
Lloh69:
	add	x8, x8, l_.str.19@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh68, Lloh69
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__const
	.p2align	3, 0x0                          ; @dispatch
_dispatch:
	.quad	_vm_op_Trap
	.quad	_vm_op_Nop
	.quad	_vm_op_Exta
	.quad	_vm_op_LoadI
	.quad	_vm_op_LoaduI
	.quad	_vm_op_LoadC
	.quad	_vm_op_LoadF
	.quad	_vm_op_SetF
	.quad	_vm_op_Move
	.quad	_vm_op_Apply
	.quad	_vm_op_Call
	.quad	_vm_op_Retu
	.quad	_vm_op_Ret
	.quad	_vm_op_Retn
	.quad	_vm_op_Clos
	.quad	_vm_op_WObj
	.quad	_vm_op_MObj
	.quad	_vm_op_Jmp
	.quad	_vm_op_Goto
	.quad	_vm_op_AddDI
	.quad	_vm_op_SubDI
	.quad	_vm_op_MulDI
	.quad	_vm_op_DivDI
	.quad	_vm_op_ModDI
	.quad	_vm_op_AddDD
	.quad	_vm_op_SubDD
	.quad	_vm_op_MulDD
	.quad	_vm_op_DivDD
	.quad	_vm_op_ModDD
	.quad	_vm_op_NegD
	.quad	_vm_op_SetCond
	.quad	_vm_op_CmpNotF
	.quad	_vm_op_CmpEqDI
	.quad	_vm_op_CmpNeDI
	.quad	_vm_op_CmpEqDC
	.quad	_vm_op_CmpNeDC
	.quad	_vm_op_CmpLtDC
	.quad	_vm_op_CmpLeDC
	.quad	_vm_op_CmpGtDC
	.quad	_vm_op_CmpGeDC
	.quad	_vm_op_CmpEqDD
	.quad	_vm_op_CmpNeDD
	.quad	_vm_op_CmpLtDD
	.quad	_vm_op_CmpLeDD
	.quad	_vm_op_CmpGtDD
	.quad	_vm_op_CmpGeDD

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"[%u] 0x%llx\n"

l_.str.2:                               ; @.str.2
	.asciz	"[%u] %llu\n"

l_.str.3:                               ; @.str.3
	.asciz	"0x%llx != 0x%llx\n"

l_.str.4:                               ; @.str.4
	.asciz	"r%u = "

l_.str.6:                               ; @.str.6
	.asciz	"invalid bytecode"

l_.str.7:                               ; @.str.7
	.asciz	"panic: %s\n"

l_.str.8:                               ; @.str.8
	.asciz	"unused extra arguments"

l_.str.9:                               ; @.str.9
	.asciz	"assertion failed"

l_.str.10:                              ; @.str.10
	.asciz	"invalid trap id"

l_.str.11:                              ; @.str.11
	.asciz	"unimplemented"

l___func__.val_as_ptr:                  ; @__func__.val_as_ptr
	.asciz	"val_as_ptr"

l_.str.12:                              ; @.str.12
	.asciz	"object.h"

l_.str.13:                              ; @.str.13
	.asciz	"val_is_ptr(value)"

l_.str.14:                              ; @.str.14
	.asciz	"stack overflow"

l___func__.val_from_ptr:                ; @__func__.val_from_ptr
	.asciz	"val_from_ptr"

l_.str.15:                              ; @.str.15
	.asciz	"raw != VAL_EMPTY"

l_.str.16:                              ; @.str.16
	.asciz	"(raw & VAL_NOT_CELL_MASK) == 0"

l_.str.17:                              ; @.str.17
	.asciz	"invalid layout"

l_.str.19:                              ; @.str.19
	.asciz	"not a number"

.subsections_via_symbols
