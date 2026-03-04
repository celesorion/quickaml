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
	b.ls	LBB1_18
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
	b	LBB1_18
LBB1_6:
	cmp	w1, #1
	b.gt	LBB1_10
; %bb.7:
	cbz	w1, LBB1_19
; %bb.8:
	cmp	w1, #1
	b.ne	LBB1_21
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
	b.ne	LBB1_21
; %bb.12:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_unusedexta
LBB1_13:
	cmp	w1, #7
	b.eq	LBB1_18
; %bb.14:
	cmp	w1, #8
	b.ne	LBB1_21
; %bb.15:
	; InlineAsm Start
	mov	x19, x30
	; InlineAsm End
	ldr	x0, [x22]
	bl	_heap_stat_print
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
	b	LBB1_18
LBB1_16:
	cmp	w1, #6
	b.ne	LBB1_21
; %bb.17:
	and	w8, w19, #0xff
	lsr	w9, w19, #8
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x8, x9
	b.ne	LBB1_22
LBB1_18:
	ldrb	w8, [x20]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
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
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_invalidtrap
LBB1_22:
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
	.loh AdrpLdrGot	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh11, Lloh12
	.loh AdrpLdrGotLdr	Lloh8, Lloh9, Lloh10
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
	str	x8, [x21, w1, uxtw #3]
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
	.p2align	5                               ; -- Begin function vm_op_Apply
_vm_op_Apply:                           ; @vm_op_Apply
	.cfi_startproc
; %bb.0:
	add	x21, x21, w1, uxtw #3
	ldr	x9, [x21], #16
	ldr	x8, [x9, #8]
	ldr	x10, [x22, #56]
	cmp	x21, x10
	b.hs	LBB8_2
; %bb.1:
	stp	x8, x20, [x21, #-16]
	str	x9, [x21]
	ldrb	w9, [x8, #8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #9]
	ldrh	w0, [x8, #10]
	add	x20, x8, #12
	br	x2
LBB8_2:
	add	x20, x8, #8
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Call
_vm_op_Call:                            ; @vm_op_Call
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	and	x8, x0, #0xff
	ldr	x8, [x24, x8, lsl #3]
	add	x9, x21, w1, uxtw #3
	add	x21, x9, #16
	ldr	x9, [x22, #56]
	cmp	x21, x9
	b.hs	LBB9_2
; %bb.1:
	stp	x8, x20, [x21, #-16]
	ldrb	w9, [x8, #8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #9]
	ldrh	w0, [x8, #10]
	add	x20, x8, #12
	br	x2
LBB9_2:
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Jmp
_vm_op_Jmp:                             ; @vm_op_Jmp
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	add	x8, x20, w0, sxth #2
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Jr
_vm_op_Jr:                              ; @vm_op_Jr
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	add	x8, x20, x8, lsl #2
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Disp
_vm_op_Disp:                            ; @vm_op_Disp
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	add	w8, w8, w0, sxth
	ubfiz	x8, x8, #2, #32
	add	x8, x20, x8
	ldrb	w9, [x8]
	ldr	x2, [x23, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
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
	cbz	w0, LBB15_8
; %bb.1:
	mov	w10, w1
	mov	w11, w0
	cmp	w0, #7
	b.hi	LBB15_3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	LBB15_6
LBB15_3:
	and	x12, x11, #0xfff8
	add	x13, x21, #48
	add	x14, x21, x10, lsl #3
	add	x14, x14, #32
	mov	x15, x12
LBB15_4:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x14, #-32]
	ldp	q2, q3, [x14], #64
	stp	q0, q1, [x13, #-64]
	stp	q2, q3, [x13, #-32]
	add	x13, x13, #64
	subs	x15, x15, #8
	b.ne	LBB15_4
; %bb.5:
	cmp	x12, x11
	b.eq	LBB15_8
LBB15_6:
	add	x13, x21, x12, lsl #3
	sub	x11, x11, x12
LBB15_7:                                ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x13, x10, lsl #3]
	stur	x12, [x13, #-16]
	add	x13, x13, #8
	subs	x11, x11, #1
	b.ne	LBB15_7
LBB15_8:
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
	.p2align	5                               ; -- Begin function vm_op_MkObj
_vm_op_MkObj:                           ; @vm_op_MkObj
	.cfi_startproc
; %bb.0:
	mov	x19, x1
	ldr	x8, [x22, #32]
	cmp	x8, w0, uxtw
	b.lo	LBB16_2
; %bb.1:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
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
	str	x0, [x21, w19, uxtw #3]
	ldrb	w8, [x20, #4]
	ldr	x2, [x23, x8, lsl #3]
	ldrb	w1, [x20, #5]
	ldrh	w0, [x20, #6]
	add	x20, x20, #8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB16_2:
	mov	x1, x19
	b	_invalidlayout
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Clos
_vm_op_Clos:                            ; @vm_op_Clos
	.cfi_startproc
; %bb.0:
	b	_unimplemented
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function undefined
_undefined:                             ; @undefined
	.cfi_startproc
; %bb.0:
Lloh13:
	adrp	x8, l_.str.4@PAGE
Lloh14:
	add	x8, x8, l_.str.4@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh13, Lloh14
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function diverge
_diverge:                               ; @diverge
	.cfi_startproc
; %bb.0:
LBB19_1:                                ; =>This Inner Loop Header: Depth=1
	b	LBB19_1
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
	.cfi_startproc
; %bb.0:
Lloh15:
	adrp	x8, l_.str.6@PAGE
Lloh16:
	add	x8, x8, l_.str.6@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh15, Lloh16
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
	.cfi_startproc
; %bb.0:
Lloh17:
	adrp	x8, l_.str.7@PAGE
Lloh18:
	add	x8, x8, l_.str.7@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh17, Lloh18
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
	.cfi_startproc
; %bb.0:
Lloh19:
	adrp	x8, l_.str.8@PAGE
Lloh20:
	add	x8, x8, l_.str.8@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh19, Lloh20
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
Lloh21:
	adrp	x8, ___stderrp@GOTPAGE
Lloh22:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh23:
	ldr	x0, [x8]
	ldr	x8, [x22, #64]
	str	x8, [sp]
Lloh24:
	adrp	x1, l_.str.5@PAGE
Lloh25:
	add	x1, x1, l_.str.5@PAGEOFF
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
	mov	w0, #255                        ; =0xff
	bl	_exit
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpLdrGotLdr	Lloh21, Lloh22, Lloh23
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
	.cfi_startproc
; %bb.0:
Lloh26:
	adrp	x8, l_.str.9@PAGE
Lloh27:
	add	x8, x8, l_.str.9@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh26, Lloh27
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
	.cfi_startproc
; %bb.0:
Lloh28:
	adrp	x8, l_.str.10@PAGE
Lloh29:
	add	x8, x8, l_.str.10@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh28, Lloh29
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
	.cfi_startproc
; %bb.0:
Lloh30:
	adrp	x8, l_.str.11@PAGE
Lloh31:
	add	x8, x8, l_.str.11@PAGEOFF
	str	x8, [x22, #64]
	b	_panic
	.loh AdrpAdd	Lloh30, Lloh31
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__const
	.p2align	3, 0x0                          ; @dispatch
_dispatch:
	.quad	_vm_op_Trap
	.quad	_vm_op_Nop
	.quad	_vm_op_Move
	.quad	_vm_op_Exta
	.quad	_vm_op_LoadI
	.quad	_vm_op_LoaduI
	.quad	_vm_op_LoadC
	.quad	_vm_op_Apply
	.quad	_vm_op_Call
	.quad	_vm_op_Jmp
	.quad	_vm_op_Jr
	.quad	_vm_op_Disp
	.quad	_vm_op_Retu
	.quad	_vm_op_Ret
	.quad	_vm_op_Retn
	.quad	_vm_op_MkObj
	.quad	_vm_op_Clos

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
	.asciz	"invalid trap id"

l_.str.9:                               ; @.str.9
	.asciz	"stack overflow"

l_.str.10:                              ; @.str.10
	.asciz	"invalid layout"

l_.str.11:                              ; @.str.11
	.asciz	"unimplemented"

.subsections_via_symbols
