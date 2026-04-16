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
	mov	x23, x0
	ldr	x8, [x0, #48]
	ldp	x9, x25, [x0, #8]
	stp	x9, xzr, [x8, #16]
	ldr	x10, [x9, #8]
	str	x10, [x0, #40]
	ldr	w10, [x9, #24]
	and	x11, x10, #0xff
	ubfx	x0, x10, #16, #16
Lloh0:
	adrp	x24, _dispatch@PAGE
Lloh1:
	add	x24, x24, _dispatch@PAGEOFF
	ldr	x11, [x24, x11, lsl #3]
	ubfx	w1, w10, #8, #8
	add	x20, x9, #28
	add	x21, x8, #32
                                        ; kill: def $w0 killed $w0 killed $x0
	mov	x22, #-562949953421312          ; =0xfffe000000000000
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
	.p2align	5                               ; -- Begin function vm_op_Trap
_vm_op_Trap:                            ; @vm_op_Trap
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x19, x0
	cmp	w1, #3
	b.le	LBB1_6
; %bb.1:
	cmp	w1, #6
	stur	x25, [x29, #-8]                 ; 8-byte Folded Spill
	b.gt	LBB1_13
; %bb.2:
	sub	w8, w1, #4
	cmp	w8, #2
	b.hs	LBB1_16
; %bb.3:
	lsr	w27, w19, #8
	cmp	w27, w19, uxtb
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
	mov	x28, x30
	; InlineAsm End
	cmp	w1, #5
	csel	x26, x9, x8, eq
	and	x19, x19, #0xff
Lloh6:
	adrp	x25, ___stderrp@GOTPAGE
Lloh7:
	ldr	x25, [x25, ___stderrp@GOTPAGEOFF]
LBB1_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x25]
	ldr	x8, [x21, x19, lsl #3]
	stp	x19, x8, [sp]
	mov	x1, x26
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x28
	; InlineAsm End
	add	x19, x19, #1
	cmp	x27, x19
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
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	b	_diverge
LBB1_10:
	cmp	w1, #2
	b.eq	LBB1_20
; %bb.11:
	cmp	w1, #3
	b.ne	LBB1_23
; %bb.12:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	ldr	x0, [x23]
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
	ldur	x25, [x29, #-8]                 ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	b	_assertionfailed
LBB1_19:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	b	_undefined
LBB1_20:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldur	x25, [x29, #-8]                 ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	br	x2
LBB1_23:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
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
	mov	w8, w8
	orr	x8, x8, x22
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoaduI
_vm_op_LoaduI:                          ; @vm_op_LoaduI
	.cfi_startproc
; %bb.0:
	mov	w8, w0
	orr	x8, x8, x22
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadC
_vm_op_LoadC:                           ; @vm_op_LoadC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x23, #40]
	ldr	x8, [x8, w0, uxtw #3]
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
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
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
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
	ldr	x10, [x23, #56]
	cmp	x21, x10
	b.hs	LBB10_2
; %bb.1:
	stp	x8, x20, [x21, #-16]
	ldr	x10, [x8, #8]
	str	x10, [x23, #40]
	str	x9, [x21]
	ldr	w9, [x8, #24]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #28
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB10_2:
	add	x20, x8, #24
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Call
_vm_op_Call:                            ; @vm_op_Call
	.cfi_startproc
; %bb.0:
	ldr	x8, [x25, w0, uxtw #3]
	add	x9, x21, w1, uxtw #3
	add	x21, x9, #16
	ldr	x9, [x23, #56]
	cmp	x21, x9
	b.hs	LBB11_2
; %bb.1:
	stp	x8, x20, [x21, #-16]
	ldr	x9, [x8, #8]
	str	x9, [x23, #40]
	ldr	w9, [x8, #24]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #28
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB11_2:
	add	x20, x8, #24
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
	ldur	x9, [x21, #-16]
	ldr	x9, [x9, #8]
	str	x9, [x23, #40]
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #4
                                        ; kill: def $w0 killed $w0 killed $x0
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
	ldur	x9, [x21, #-16]
	ldr	x9, [x9, #8]
	str	x9, [x23, #40]
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #4
                                        ; kill: def $w0 killed $w0 killed $x0
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
	ldur	x9, [x21, #-16]
	ldr	x9, [x9, #8]
	str	x9, [x23, #40]
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #4
                                        ; kill: def $w0 killed $w0 killed $x0
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
	mov	x28, x30
	; InlineAsm End
	mov	w0, #24                         ; =0x18
	mov	x1, x23
	mov	x2, x21
	bl	_alloc_object
	mov	x27, x0
	; InlineAsm Start
	mov	x30, x28
	; InlineAsm End
	ldr	x1, [x25, w26, uxtw #3]
	mov	x2, #0                          ; =0x0
	bl	_closure_init
	str	x27, [x21, w19, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_WObj
_vm_op_WObj:                            ; @vm_op_WObj
	.cfi_startproc
; %bb.0:
	mov	x28, x0
	and	w19, w0, #0xff
	ldr	x8, [x23, #32]
	cmp	x8, x19
	b.lo	LBB16_11
; %bb.1:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stp	x23, x24, [sp]                  ; 16-byte Folded Spill
	lsr	w27, w28, #8
	mov	x26, x22
	mov	x22, x25
	; InlineAsm Start
	mov	x25, x30
	; InlineAsm End
	lsl	w8, w27, #3
	add	w8, w8, #15
	and	x0, x8, #0xff8
	mov	x24, x1
	mov	x1, x23
	mov	x2, x21
	bl	_alloc_object
	mov	x23, x0
	; InlineAsm Start
	mov	x30, x25
	; InlineAsm End
	mov	x25, x22
	mov	x1, x19
	mov	x2, x27
	bl	_object_init
	cmp	w28, #256
	b.lo	LBB16_7
; %bb.2:
	mov	w8, w24
	cmp	w28, #2559
	b.ls	LBB16_4
; %bb.3:
	lsl	x9, x8, #3
	add	x11, x9, x21
	sub	x9, x23, x11
	add	x9, x9, #8
	cmp	x9, #64
	b.hs	LBB16_8
LBB16_4:
	mov	x9, #0                          ; =0x0
LBB16_5:
	lsl	x10, x9, #3
	add	x8, x10, x8, lsl #3
	add	x8, x21, x8
	add	x10, x10, x23
	add	x10, x10, #8
	sub	x9, x27, x9
LBB16_6:                                ; =>This Inner Loop Header: Depth=1
	ldr	x11, [x8], #8
	str	x11, [x10], #8
	subs	x9, x9, #1
	b.ne	LBB16_6
LBB16_7:
	str	x23, [x21, w24, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldp	x23, x24, [sp]                  ; 16-byte Folded Reload
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	mov	x22, x26
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB16_8:
	and	x9, x27, #0xf8
	add	x10, x23, #40
	add	x11, x11, #32
	mov	x12, x9
LBB16_9:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x11, #-32]
	ldp	q2, q3, [x11], #64
	stp	q0, q1, [x10, #-32]
	stp	q2, q3, [x10], #64
	subs	x12, x12, #8
	b.ne	LBB16_9
; %bb.10:
	cmp	x9, x27
	b.ne	LBB16_5
	b	LBB16_7
LBB16_11:
	mov	x0, x28
	b	_invalidlayout
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
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB17_2:
	ldr	x9, [x23, #32]
	cmp	x9, w8, uxtw
	b.lo	LBB17_4
; %bb.3:
	lsr	w8, w0, #8
	ldr	x8, [x21, w8, uxtw #3]
	str	x8, [x21, w19, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
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
	add	x20, x20, w8, sxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Goto
_vm_op_Goto:                            ; @vm_op_Goto
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	bics	xzr, x22, x8
	b.ne	LBB19_2
; %bb.1:
	lsl	x8, x8, #32
	add	x20, x20, x8, asr #30
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB19_2:
	b	_notaoffset
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_AddDI
_vm_op_AddDI:                           ; @vm_op_AddDI
	.cfi_startproc
; %bb.0:
	sxtb	w8, w0
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB20_3
; %bb.1:
	adds	w8, w9, w8
	b.vs	LBB20_6
; %bb.2:
	orr	x8, x8, x22
	b	LBB20_5
LBB20_3:
	cbz	x10, LBB20_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fadd	d0, d1, d0
	fmov	x8, d0
	sub	x8, x8, x22
LBB20_5:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB20_6:
	b	_vm_op_arith_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SubDI
_vm_op_SubDI:                           ; @vm_op_SubDI
	.cfi_startproc
; %bb.0:
	sxtb	w8, w0
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB21_3
; %bb.1:
	subs	w8, w9, w8
	b.vs	LBB21_6
; %bb.2:
	orr	x8, x8, x22
	b	LBB21_5
LBB21_3:
	cbz	x10, LBB21_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fsub	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
LBB21_5:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB21_6:
	b	_vm_op_arith_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MulDI
_vm_op_MulDI:                           ; @vm_op_MulDI
	.cfi_startproc
; %bb.0:
	sxtb	w8, w0
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB22_3
; %bb.1:
	smull	x8, w9, w8
	cmp	x8, w8, sxtw
	b.ne	LBB22_6
; %bb.2:
	mov	w8, w8
	orr	x8, x8, x22
	b	LBB22_5
LBB22_3:
	cbz	x10, LBB22_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fmul	d0, d1, d0
	fmov	x8, d0
	sub	x8, x8, x22
LBB22_5:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB22_6:
	b	_vm_op_arith_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DivDI
_vm_op_DivDI:                           ; @vm_op_DivDI
	.cfi_startproc
; %bb.0:
	sxtb	w8, w0
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB23_5
; %bb.1:
	lsl	w10, w0, #24
	cbz	w10, LBB23_8
; %bb.2:
	mov	w11, #-16777216                 ; =0xff000000
	cmp	w10, w11
	b.ne	LBB23_4
; %bb.3:
	mov	w10, #-2147483648               ; =0x80000000
	cmp	w9, w10
	b.eq	LBB23_8
LBB23_4:
	sdiv	w10, w9, w8
	msub	w11, w10, w8, w9
	eor	w8, w8, w9
	cmp	w8, #0
	ccmp	w11, #0, #4, lt
	cset	w8, ne
	sub	w8, w10, w8
	orr	x8, x8, x22
	b	LBB23_7
LBB23_5:
	cbz	x10, LBB23_8
; %bb.6:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fdiv	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
LBB23_7:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB23_8:
	b	_vm_op_arith_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RemDI
_vm_op_RemDI:                           ; @vm_op_RemDI
	.cfi_startproc
; %bb.0:
	sxtb	w8, w0
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB24_3
; %bb.1:
	lsl	w10, w0, #24
	cbz	w10, LBB24_6
; %bb.2:
	sdiv	w10, w9, w8
	msub	w10, w10, w8, w9
	eor	w9, w8, w9
	and	w8, w8, w9, asr #31
	add	w8, w10, w8
	cmp	w10, #0
	csel	w8, wzr, w8, eq
	orr	x8, x8, x22
	b	LBB24_5
LBB24_3:
	cbz	x10, LBB24_6
; %bb.4:
	add	x9, x9, x22
	scvtf	d0, w8
	fmov	d1, x9
	fdiv	d2, d1, d0
	frintm	d2, d2
	fmsub	d0, d2, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
LBB24_5:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB24_6:
	b	_vm_op_arith_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_AddDD
_vm_op_AddDD:                           ; @vm_op_AddDD
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB25_4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB25_3
; %bb.2:
	adds	w8, w9, w8
	b.vc	LBB25_8
LBB25_3:
	b	_vm_op_arith_dd_fallback
LBB25_4:
	cbz	x10, LBB25_6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB25_7
LBB25_6:
	b	_vm_op_arith_dd_fallback
LBB25_7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fadd	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB25_9
LBB25_8:
	orr	x8, x8, x22
LBB25_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SubDD
_vm_op_SubDD:                           ; @vm_op_SubDD
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB26_4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB26_3
; %bb.2:
	subs	w8, w9, w8
	b.vc	LBB26_8
LBB26_3:
	b	_vm_op_arith_dd_fallback
LBB26_4:
	cbz	x10, LBB26_6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB26_7
LBB26_6:
	b	_vm_op_arith_dd_fallback
LBB26_7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fsub	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB26_9
LBB26_8:
	orr	x8, x8, x22
LBB26_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MulDD
_vm_op_MulDD:                           ; @vm_op_MulDD
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB27_4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB27_3
; %bb.2:
	smull	x8, w9, w8
	cmp	x8, w8, sxtw
	b.eq	LBB27_8
LBB27_3:
	b	_vm_op_arith_dd_fallback
LBB27_4:
	cbz	x10, LBB27_6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB27_7
LBB27_6:
	b	_vm_op_arith_dd_fallback
LBB27_7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fmul	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB27_9
LBB27_8:
	mov	w8, w8
	orr	x8, x8, x22
LBB27_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DivDD
_vm_op_DivDD:                           ; @vm_op_DivDD
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB28_5
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB28_7
; %bb.2:
	cbz	w8, LBB28_7
; %bb.3:
	mov	w10, #-2147483648               ; =0x80000000
	cmp	w9, w10
	ccmn	w8, #1, #0, eq
	b.eq	LBB28_7
; %bb.4:
	sdiv	w10, w9, w8
	msub	w11, w10, w8, w9
	eor	w8, w8, w9
	cmp	w8, #0
	ccmp	w11, #0, #4, lt
	cset	w8, ne
	sub	w8, w10, w8
	orr	x8, x8, x22
	b	LBB28_9
LBB28_5:
	cbz	x10, LBB28_7
; %bb.6:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB28_8
LBB28_7:
	b	_vm_op_arith_dd_fallback
LBB28_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fdiv	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
LBB28_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RemDD
_vm_op_RemDD:                           ; @vm_op_RemDD
	.cfi_startproc
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB29_4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB29_6
; %bb.2:
	cbz	w8, LBB29_6
; %bb.3:
	sdiv	w10, w9, w8
	msub	w10, w10, w8, w9
	eor	w9, w8, w9
	and	w8, w8, w9, asr #31
	add	w8, w10, w8
	cmp	w10, #0
	csel	w8, wzr, w8, eq
	orr	x8, x8, x22
	b	LBB29_8
LBB29_4:
	cbz	x10, LBB29_6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB29_7
LBB29_6:
	b	_vm_op_arith_dd_fallback
LBB29_7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	fmov	x8, d0
	sub	x8, x8, x22
LBB29_8:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_NegD
_vm_op_NegD:                            ; @vm_op_NegD
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB30_2
; %bb.1:
	mov	w9, #-2147483648                ; =0x80000000
	mov	x10, #4746794007248502784       ; =0x41e0000000000000
	sub	x10, x10, x22
	neg	w11, w8
	orr	x11, x11, x22
	cmp	w8, w9
	csel	x8, x10, x11, eq
	b	LBB30_4
LBB30_2:
	cbz	x9, LBB30_5
; %bb.3:
	add	x8, x8, x22
	eor	x8, x8, #0x8000000000000000
	sub	x8, x8, x22
LBB30_4:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB30_5:
	b	_vm_op_arith_dd_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCond
_vm_op_SetCond:                         ; @vm_op_SetCond
	.cfi_startproc
; %bb.0:
	strb	wzr, [x23, #80]
	ldrb	w8, [x20], #4
	sub	w8, w8, #32
	cmp	w8, #15
	b.hs	LBB31_2
; %bb.1:
Lloh17:
	adrp	x9, _dispatch_setc@PAGE
Lloh18:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
LBB31_2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh17, Lloh18
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCondJ
_vm_op_SetCondJ:                        ; @vm_op_SetCondJ
	.cfi_startproc
; %bb.0:
	mov	w8, #1                          ; =0x1
	strb	w8, [x23, #80]
	ldrb	w8, [x20], #4
	sub	w8, w8, #32
	cmp	w8, #15
	b.hs	LBB32_2
; %bb.1:
Lloh19:
	adrp	x9, _dispatch_setc@PAGE
Lloh20:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
LBB32_2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh19, Lloh20
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNotF
_vm_op_CmpNotF:                         ; @vm_op_CmpNotF
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	mov	w9, #65535                      ; =0xffff
	cmp	w0, w9
	cset	w9, eq
	and	x8, x8, #0xfffffffffffffffb
	cmp	x8, #2
	cset	w8, ne
	eor	w8, w9, w8
	cmp	w8, #0
	mov	w8, #4                          ; =0x4
	csel	x8, x8, xzr, ne
	add	x20, x20, x8
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDI
_vm_op_CmpEqDI:                         ; @vm_op_CmpEqDI
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB34_2
; %bb.1:
	cmp	w8, w0
	cset	w8, eq
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB34_2:
	cbz	x9, LBB34_4
; %bb.3:
	add	x8, x8, x22
	fmov	d0, x8
	ucvtf	d1, w0
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, ne
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB34_4:
	b	_vm_op_compare_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDI
_vm_op_CmpNeDI:                         ; @vm_op_CmpNeDI
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB35_2
; %bb.1:
	cmp	w8, w0
	cset	w8, ne
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB35_2:
	cbz	x9, LBB35_4
; %bb.3:
	add	x8, x8, x22
	fmov	d0, x8
	ucvtf	d1, w0
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, eq
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB35_4:
	b	_vm_op_compare_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDC
_vm_op_CmpEqDC:                         ; @vm_op_CmpEqDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #40]
	ldr	x9, [x9, w0, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB36_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB36_5
; %bb.2:
	cmp	w8, w9
	cset	w8, eq
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB36_3:
	cbz	x10, LBB36_5
; %bb.4:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB36_6
LBB36_5:
	b	_vm_op_compare_dc_fallback
LBB36_6:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, ne
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDC
_vm_op_CmpNeDC:                         ; @vm_op_CmpNeDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #40]
	ldr	x9, [x9, w0, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB37_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB37_5
; %bb.2:
	cmp	w8, w9
	cset	w8, ne
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB37_3:
	cbz	x10, LBB37_5
; %bb.4:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB37_6
LBB37_5:
	b	_vm_op_compare_dc_fallback
LBB37_6:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, eq
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLtDC
_vm_op_CmpLtDC:                         ; @vm_op_CmpLtDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #40]
	ldr	x9, [x9, w0, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB38_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB38_5
; %bb.2:
	cmp	w8, w9
	cset	w8, lt
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB38_3:
	cbz	x10, LBB38_5
; %bb.4:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB38_6
LBB38_5:
	b	_vm_op_compare_dc_fallback
LBB38_6:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, pl
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLeDC
_vm_op_CmpLeDC:                         ; @vm_op_CmpLeDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #40]
	ldr	x9, [x9, w0, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB39_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB39_5
; %bb.2:
	cmp	w8, w9
	cset	w8, le
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB39_3:
	cbz	x10, LBB39_5
; %bb.4:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB39_6
LBB39_5:
	b	_vm_op_compare_dc_fallback
LBB39_6:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, hi
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGtDC
_vm_op_CmpGtDC:                         ; @vm_op_CmpGtDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #40]
	ldr	x9, [x9, w0, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB40_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB40_5
; %bb.2:
	cmp	w8, w9
	cset	w8, gt
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB40_3:
	cbz	x10, LBB40_5
; %bb.4:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB40_6
LBB40_5:
	b	_vm_op_compare_dc_fallback
LBB40_6:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, le
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGeDC
_vm_op_CmpGeDC:                         ; @vm_op_CmpGeDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #40]
	ldr	x9, [x9, w0, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB41_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB41_5
; %bb.2:
	cmp	w8, w9
	cset	w8, ge
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB41_3:
	cbz	x10, LBB41_5
; %bb.4:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB41_6
LBB41_5:
	b	_vm_op_compare_dc_fallback
LBB41_6:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, lt
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDD
_vm_op_CmpEqDD:                         ; @vm_op_CmpEqDD
	.cfi_startproc
; %bb.0:
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w0, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB42_3
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB42_5
; %bb.2:
	cmp	w9, w8
	cset	w8, eq
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB42_3:
	cbz	x10, LBB42_5
; %bb.4:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB42_6
LBB42_5:
	b	_vm_op_compare_dd_fallback
LBB42_6:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, ne
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDD
_vm_op_CmpNeDD:                         ; @vm_op_CmpNeDD
	.cfi_startproc
; %bb.0:
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w0, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB43_3
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB43_5
; %bb.2:
	cmp	w9, w8
	cset	w8, ne
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB43_3:
	cbz	x10, LBB43_5
; %bb.4:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB43_6
LBB43_5:
	b	_vm_op_compare_dd_fallback
LBB43_6:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, eq
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLtDD
_vm_op_CmpLtDD:                         ; @vm_op_CmpLtDD
	.cfi_startproc
; %bb.0:
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w0, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB44_3
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB44_5
; %bb.2:
	cmp	w9, w8
	cset	w8, lt
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB44_3:
	cbz	x10, LBB44_5
; %bb.4:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB44_6
LBB44_5:
	b	_vm_op_compare_dd_fallback
LBB44_6:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, pl
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLeDD
_vm_op_CmpLeDD:                         ; @vm_op_CmpLeDD
	.cfi_startproc
; %bb.0:
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w0, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB45_3
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB45_5
; %bb.2:
	cmp	w9, w8
	cset	w8, le
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB45_3:
	cbz	x10, LBB45_5
; %bb.4:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB45_6
LBB45_5:
	b	_vm_op_compare_dd_fallback
LBB45_6:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, hi
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGtDD
_vm_op_CmpGtDD:                         ; @vm_op_CmpGtDD
	.cfi_startproc
; %bb.0:
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w0, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB46_3
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB46_5
; %bb.2:
	cmp	w9, w8
	cset	w8, gt
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB46_3:
	cbz	x10, LBB46_5
; %bb.4:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB46_6
LBB46_5:
	b	_vm_op_compare_dd_fallback
LBB46_6:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, le
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGeDD
_vm_op_CmpGeDD:                         ; @vm_op_CmpGeDD
	.cfi_startproc
; %bb.0:
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w0, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB47_3
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB47_5
; %bb.2:
	cmp	w9, w8
	cset	w8, ge
	add	x20, x20, w8, uxtw #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB47_3:
	cbz	x10, LBB47_5
; %bb.4:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB47_6
LBB47_5:
	b	_vm_op_compare_dd_fallback
LBB47_6:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	add	x8, x20, #4
	csel	x20, x20, x8, lt
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
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
Lloh21:
	adrp	x8, l_.str.6@PAGE
Lloh22:
	add	x8, x8, l_.str.6@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh21, Lloh22
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function diverge
_diverge:                               ; @diverge
	.cfi_startproc
; %bb.0:
LBB49_1:                                ; =>This Inner Loop Header: Depth=1
	b	LBB49_1
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
	.cfi_startproc
; %bb.0:
Lloh23:
	adrp	x8, l_.str.8@PAGE
Lloh24:
	add	x8, x8, l_.str.8@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh23, Lloh24
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
	.cfi_startproc
; %bb.0:
Lloh25:
	adrp	x8, l_.str.9@PAGE
Lloh26:
	add	x8, x8, l_.str.9@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh25, Lloh26
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
	.cfi_startproc
; %bb.0:
Lloh27:
	adrp	x8, l_.str.10@PAGE
Lloh28:
	add	x8, x8, l_.str.10@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh27, Lloh28
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
Lloh29:
	adrp	x8, ___stderrp@GOTPAGE
Lloh30:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh31:
	ldr	x0, [x8]
	ldr	x8, [x23, #64]
	str	x8, [sp]
Lloh32:
	adrp	x1, l_.str.7@PAGE
Lloh33:
	add	x1, x1, l_.str.7@PAGEOFF
	bl	_fprintf
	; InlineAsm Start
	mov	x30, x19
	; InlineAsm End
	mov	w0, #255                        ; =0xff
	bl	_exit
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpLdrGotLdr	Lloh29, Lloh30, Lloh31
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
	.cfi_startproc
; %bb.0:
Lloh34:
	adrp	x8, l_.str.11@PAGE
Lloh35:
	add	x8, x8, l_.str.11@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh34, Lloh35
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
	.cfi_startproc
; %bb.0:
Lloh36:
	adrp	x8, l_.str.12@PAGE
Lloh37:
	add	x8, x8, l_.str.12@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh36, Lloh37
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
	.cfi_startproc
; %bb.0:
Lloh38:
	adrp	x8, l_.str.13@PAGE
Lloh39:
	add	x8, x8, l_.str.13@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh38, Lloh39
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function notaoffset
_notaoffset:                            ; @notaoffset
	.cfi_startproc
; %bb.0:
Lloh40:
	adrp	x8, l_.str.14@PAGE
Lloh41:
	add	x8, x8, l_.str.14@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh40, Lloh41
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_arith_di_fallback
_vm_op_arith_di_fallback:               ; @vm_op_arith_di_fallback
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	bics	xzr, x22, x8
	b.ne	LBB58_9
; %bb.1:
	scvtf	d0, w8
	sxtb	w8, w0
	scvtf	d1, w8
	ldurb	w8, [x20, #-4]
	cmp	w8, #20
	b.le	LBB58_6
; %bb.2:
	cmp	w8, #21
	b.eq	LBB58_10
; %bb.3:
	cmp	w8, #22
	b.eq	LBB58_11
; %bb.4:
	cmp	w8, #23
	b.ne	LBB58_9
; %bb.5:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	LBB58_13
LBB58_6:
	cmp	w8, #19
	b.eq	LBB58_12
; %bb.7:
	cmp	w8, #20
	b.ne	LBB58_9
; %bb.8:
	fsub	d0, d0, d1
	b	LBB58_13
LBB58_9:
	b	_notanumber
LBB58_10:
	fmul	d0, d1, d0
	b	LBB58_13
LBB58_11:
	fdiv	d0, d0, d1
	b	LBB58_13
LBB58_12:
	fadd	d0, d1, d0
LBB58_13:
	fmov	x8, d0
	sub	x8, x8, x22
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function notanumber
_notanumber:                            ; @notanumber
	.cfi_startproc
; %bb.0:
Lloh42:
	adrp	x8, l_.str.15@PAGE
Lloh43:
	add	x8, x8, l_.str.15@PAGEOFF
	str	x8, [x23, #64]
	b	_panic
	.loh AdrpAdd	Lloh42, Lloh43
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_arith_dd_fallback
_vm_op_arith_dd_fallback:               ; @vm_op_arith_dd_fallback
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB60_3
; %bb.1:
	scvtf	d0, w8
	ldurb	w8, [x20, #-4]
	cmp	w8, #29
	b.ne	LBB60_5
LBB60_2:
	fmov	x8, d0
	eor	x8, x8, #0x8000000000000000
	b	LBB60_21
LBB60_3:
	cbz	x9, LBB60_16
; %bb.4:
	add	x8, x8, x22
	fmov	d0, x8
	ldurb	w8, [x20, #-4]
	cmp	w8, #29
	b.eq	LBB60_2
LBB60_5:
	and	w9, w0, #0xff
	ldr	x9, [x21, w9, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB60_11
; %bb.6:
	scvtf	d1, w9
	cmp	w8, #25
	b.le	LBB60_13
LBB60_7:
	cmp	w8, #26
	b.eq	LBB60_17
; %bb.8:
	cmp	w8, #27
	b.eq	LBB60_18
; %bb.9:
	cmp	w8, #28
	b.ne	LBB60_16
; %bb.10:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	LBB60_20
LBB60_11:
	cbz	x10, LBB60_16
; %bb.12:
	add	x9, x9, x22
	fmov	d1, x9
	cmp	w8, #25
	b.gt	LBB60_7
LBB60_13:
	cmp	w8, #24
	b.eq	LBB60_19
; %bb.14:
	cmp	w8, #25
	b.ne	LBB60_16
; %bb.15:
	fsub	d0, d0, d1
	b	LBB60_20
LBB60_16:
	b	_notanumber
LBB60_17:
	fmul	d0, d0, d1
	b	LBB60_20
LBB60_18:
	fdiv	d0, d0, d1
	b	LBB60_20
LBB60_19:
	fadd	d0, d0, d1
LBB60_20:
	fmov	x8, d0
LBB60_21:
	sub	x8, x8, x22
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setcond_bad_op
_vm_op_setcond_bad_op:                  ; @vm_op_setcond_bad_op
	.cfi_startproc
; %bb.0:
	b	_unimplemented
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNotF
_vm_op_setc_CmpNotF:                    ; @vm_op_setc_CmpNotF
	.cfi_startproc
; %bb.0:
	ldur	w8, [x20, #-4]
	ubfx	x9, x8, #8, #8
	ldr	x9, [x21, x9, lsl #3]
	mov	w10, #-65537                    ; =0xfffeffff
	cmp	w8, w10
	cset	w8, hi
	and	x9, x9, #0xfffffffffffffffb
	cmp	x9, #2
	cset	w9, eq
	cmp	w0, #0
	eor	w8, w8, w9
	tbz	w8, #0, LBB62_2
; %bb.1:
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB62_2:
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpEqDI
_vm_op_setc_CmpEqDI:                    ; @vm_op_setc_CmpEqDI
	.cfi_startproc
; %bb.0:
	ldur	w8, [x20, #-4]
	ubfx	x9, x8, #8, #8
	ldr	x9, [x21, x9, lsl #3]
	ubfx	x8, x8, #16, #16
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB63_3
; %bb.1:
	cmp	w8, w9
	b.eq	LBB63_5
LBB63_2:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB63_3:
	cbz	x10, LBB63_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	ucvtf	d1, w8
	fcmp	d0, d1
	b.ne	LBB63_2
LBB63_5:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB63_6:
	b	_vm_op_compare_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNeDI
_vm_op_setc_CmpNeDI:                    ; @vm_op_setc_CmpNeDI
	.cfi_startproc
; %bb.0:
	ldur	w8, [x20, #-4]
	ubfx	x9, x8, #8, #8
	ldr	x9, [x21, x9, lsl #3]
	ubfx	x8, x8, #16, #16
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB64_3
; %bb.1:
	cmp	w8, w9
	b.ne	LBB64_5
LBB64_2:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB64_3:
	cbz	x10, LBB64_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	ucvtf	d1, w8
	fcmp	d0, d1
	b.eq	LBB64_2
LBB64_5:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB64_6:
	b	_vm_op_compare_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpEqDC
_vm_op_setc_CmpEqDC:                    ; @vm_op_setc_CmpEqDC
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #40]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB65_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB65_6
; %bb.2:
	cmp	w8, w9
	b.eq	LBB65_8
LBB65_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB65_4:
	cbz	x10, LBB65_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB65_7
LBB65_6:
	b	_vm_op_compare_setc_fallback
LBB65_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.ne	LBB65_3
LBB65_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNeDC
_vm_op_setc_CmpNeDC:                    ; @vm_op_setc_CmpNeDC
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #40]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB66_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB66_6
; %bb.2:
	cmp	w8, w9
	b.ne	LBB66_8
LBB66_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB66_4:
	cbz	x10, LBB66_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB66_7
LBB66_6:
	b	_vm_op_compare_setc_fallback
LBB66_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.eq	LBB66_3
LBB66_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpLtDC
_vm_op_setc_CmpLtDC:                    ; @vm_op_setc_CmpLtDC
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #40]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB67_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB67_6
; %bb.2:
	cmp	w8, w9
	b.ge	LBB67_8
LBB67_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB67_4:
	cbz	x10, LBB67_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB67_7
LBB67_6:
	b	_vm_op_compare_setc_fallback
LBB67_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.mi	LBB67_3
LBB67_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpLeDC
_vm_op_setc_CmpLeDC:                    ; @vm_op_setc_CmpLeDC
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #40]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB68_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB68_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB68_8
LBB68_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB68_4:
	cbz	x10, LBB68_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB68_7
LBB68_6:
	b	_vm_op_compare_setc_fallback
LBB68_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.hi	LBB68_3
LBB68_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpGtDC
_vm_op_setc_CmpGtDC:                    ; @vm_op_setc_CmpGtDC
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #40]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB69_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB69_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB69_8
LBB69_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB69_4:
	cbz	x10, LBB69_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB69_7
LBB69_6:
	b	_vm_op_compare_setc_fallback
LBB69_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.gt	LBB69_3
LBB69_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpGeDC
_vm_op_setc_CmpGeDC:                    ; @vm_op_setc_CmpGeDC
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #40]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB70_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB70_6
; %bb.2:
	cmp	w8, w9
	b.ge	LBB70_8
LBB70_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB70_4:
	cbz	x10, LBB70_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB70_7
LBB70_6:
	b	_vm_op_compare_setc_fallback
LBB70_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.lt	LBB70_3
LBB70_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpEqDD
_vm_op_setc_CmpEqDD:                    ; @vm_op_setc_CmpEqDD
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x21, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB71_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB71_6
; %bb.2:
	cmp	w8, w9
	b.eq	LBB71_8
LBB71_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB71_4:
	cbz	x10, LBB71_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB71_7
LBB71_6:
	b	_vm_op_compare_setc_fallback
LBB71_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.ne	LBB71_3
LBB71_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNeDD
_vm_op_setc_CmpNeDD:                    ; @vm_op_setc_CmpNeDD
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x21, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB72_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB72_6
; %bb.2:
	cmp	w8, w9
	b.ne	LBB72_8
LBB72_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB72_4:
	cbz	x10, LBB72_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB72_7
LBB72_6:
	b	_vm_op_compare_setc_fallback
LBB72_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.eq	LBB72_3
LBB72_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpLtDD
_vm_op_setc_CmpLtDD:                    ; @vm_op_setc_CmpLtDD
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x21, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB73_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB73_6
; %bb.2:
	cmp	w8, w9
	b.ge	LBB73_8
LBB73_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB73_4:
	cbz	x10, LBB73_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB73_7
LBB73_6:
	b	_vm_op_compare_setc_fallback
LBB73_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.mi	LBB73_3
LBB73_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpLeDD
_vm_op_setc_CmpLeDD:                    ; @vm_op_setc_CmpLeDD
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x21, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB74_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB74_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB74_8
LBB74_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB74_4:
	cbz	x10, LBB74_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB74_7
LBB74_6:
	b	_vm_op_compare_setc_fallback
LBB74_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.hi	LBB74_3
LBB74_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpGtDD
_vm_op_setc_CmpGtDD:                    ; @vm_op_setc_CmpGtDD
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x21, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB75_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB75_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB75_8
LBB75_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB75_4:
	cbz	x10, LBB75_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB75_7
LBB75_6:
	b	_vm_op_compare_setc_fallback
LBB75_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.gt	LBB75_3
LBB75_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpGeDD
_vm_op_setc_CmpGeDD:                    ; @vm_op_setc_CmpGeDD
	.cfi_startproc
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x21, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB76_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB76_6
; %bb.2:
	cmp	w8, w9
	b.ge	LBB76_8
LBB76_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB76_4:
	cbz	x10, LBB76_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB76_7
LBB76_6:
	b	_vm_op_compare_setc_fallback
LBB76_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.lt	LBB76_3
LBB76_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_di_fallback
_vm_op_compare_di_fallback:             ; @vm_op_compare_di_fallback
	.cfi_startproc
; %bb.0:
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_setc_fallback
_vm_op_compare_setc_fallback:           ; @vm_op_compare_setc_fallback
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldur	w10, [x20, #-4]
	and	w11, w10, #0xff
	ubfx	x8, x10, #8, #8
	ldr	x9, [x21, x8, lsl #3]
	mov	x8, x21
	cmp	w11, #40
	b.hi	LBB78_2
; %bb.1:
	ldr	x8, [x23, #40]
LBB78_2:
	lsr	x11, x10, #13
	and	x11, x11, #0x7fff8
	ldr	x8, [x8, x11]
	and	w11, w10, #0xff
	cmp	w11, #40
	b.gt	LBB78_5
; %bb.3:
	cmp	w11, #35
	b.eq	LBB78_7
; %bb.4:
	cmp	w11, #36
	b.eq	LBB78_9
	b	LBB78_11
LBB78_5:
	cmp	w11, #42
	b.eq	LBB78_9
; %bb.6:
	cmp	w11, #41
	b.ne	LBB78_11
LBB78_7:
	cmp	x9, x8
	b.ne	LBB78_18
LBB78_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	b	LBB78_37
LBB78_9:
	cmp	x9, x8
	b.ne	LBB78_21
LBB78_10:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	LBB78_38
LBB78_11:
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB78_24
; %bb.12:
	scvtf	d0, w9
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB78_26
LBB78_13:
	scvtf	d1, w8
	and	w8, w10, #0xff
	cmp	w8, #40
	b.le	LBB78_28
LBB78_14:
	cmp	w8, #43
	b.gt	LBB78_56
; %bb.15:
	cmp	w8, #41
	b.eq	LBB78_36
; %bb.16:
	cmp	w8, #42
	b.ne	LBB78_61
; %bb.17:
	cmp	w0, #0
	cset	w8, ne
	fcmp	d0, d1
	cset	w9, ne
	eor	w8, w8, w9
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	b	LBB78_44
LBB78_18:
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB78_32
; %bb.19:
	scvtf	d0, w9
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB78_34
LBB78_20:
	scvtf	d1, w8
	b	LBB78_36
LBB78_21:
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB78_39
; %bb.22:
	scvtf	d0, w9
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB78_41
LBB78_23:
	scvtf	d1, w8
	b	LBB78_43
LBB78_24:
	cbz	x11, LBB78_45
; %bb.25:
	add	x9, x9, x22
	fmov	d0, x9
	and	x9, x8, x22
	cmp	x9, x22
	b.eq	LBB78_13
LBB78_26:
	cbz	x9, LBB78_45
; %bb.27:
	add	x8, x8, x22
	fmov	d1, x8
	and	w8, w10, #0xff
	cmp	w8, #40
	b.gt	LBB78_14
LBB78_28:
	cmp	w8, #37
	b.le	LBB78_60
; %bb.29:
	cmp	w8, #38
	b.eq	LBB78_59
; %bb.30:
	cmp	w8, #39
	b.ne	LBB78_58
LBB78_31:
	cmp	w0, #0
	cset	w8, ne
	fcmp	d0, d1
	cset	w9, gt
	eor	w8, w8, w9
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	fcmp	d0, d1
	str	x8, [x21, w1, uxtw #3]
	b.gt	LBB78_37
	b	LBB78_38
LBB78_32:
	cbz	x10, LBB78_46
; %bb.33:
	add	x10, x9, x22
	fmov	d0, x10
	and	x10, x8, x22
	cmp	x10, x22
	b.eq	LBB78_20
LBB78_34:
	cbz	x10, LBB78_46
; %bb.35:
	add	x8, x8, x22
	fmov	d1, x8
LBB78_36:
	cmp	w0, #0
	cset	w8, ne
	fcmp	d0, d1
	cset	w9, eq
	eor	w8, w8, w9
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	fcmp	d0, d1
	str	x8, [x21, w1, uxtw #3]
	b.ne	LBB78_38
LBB78_37:
	ldrb	w8, [x23, #80]
	add	x20, x20, x8, lsl #2
LBB78_38:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB78_39:
	cbz	x10, LBB78_51
; %bb.40:
	add	x10, x9, x22
	fmov	d0, x10
	and	x10, x8, x22
	cmp	x10, x22
	b.eq	LBB78_23
LBB78_41:
	cbz	x10, LBB78_51
; %bb.42:
	add	x8, x8, x22
	fmov	d1, x8
LBB78_43:
	cmp	w0, #0
	cset	w8, ne
	fcmp	d0, d1
	cset	w9, eq
	eor	w8, w8, w9
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
LBB78_44:
	fcmp	d0, d1
	str	x8, [x21, w1, uxtw #3]
	b.eq	LBB78_38
	b	LBB78_37
LBB78_45:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
LBB78_46:
	orr	x10, x9, x8
	mov	x11, #2                         ; =0x2
	movk	x11, #65534, lsl #48
	tst	x10, x11
	b.ne	LBB78_10
; %bb.47:
	ldr	x10, [x9]
	and	x11, x10, #0xff000000000000
	mov	x12, #281474976710656           ; =0x1000000000000
	cmp	x11, x12
	b.ne	LBB78_10
; %bb.48:
	ldr	x11, [x8]
	and	x13, x11, #0xff000000000000
	cmp	x13, x12
	b.ne	LBB78_10
; %bb.49:
	mov	w10, w10
	cmp	x10, w11, uxtw
	b.ne	LBB78_10
; %bb.50:
	cmp	w0, #0
	cset	w19, ne
	sub	x2, x10, #9
	add	x0, x9, #8
	mov	x26, x1
	add	x1, x8, #8
	bl	_memcmp
	cmp	w0, #0
	cset	w8, eq
	eor	w8, w19, w8
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w26, uxtw #3]
	cbnz	w0, LBB78_38
	b	LBB78_37
LBB78_51:
	orr	x10, x9, x8
	mov	x11, #2                         ; =0x2
	movk	x11, #65534, lsl #48
	tst	x10, x11
	b.ne	LBB78_8
; %bb.52:
	ldr	x10, [x9]
	and	x11, x10, #0xff000000000000
	mov	x12, #281474976710656           ; =0x1000000000000
	cmp	x11, x12
	b.ne	LBB78_8
; %bb.53:
	ldr	x11, [x8]
	and	x13, x11, #0xff000000000000
	cmp	x13, x12
	b.ne	LBB78_8
; %bb.54:
	mov	w10, w10
	cmp	x10, w11, uxtw
	b.ne	LBB78_8
; %bb.55:
	cmp	w0, #0
	cset	w19, ne
	sub	x2, x10, #9
	add	x0, x9, #8
	mov	x26, x1
	add	x1, x8, #8
	bl	_memcmp
	cmp	w0, #0
	cset	w8, eq
	eor	w8, w19, w8
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w26, uxtw #3]
	cbnz	w0, LBB78_37
	b	LBB78_38
LBB78_56:
	cmp	w8, #44
	b.eq	LBB78_59
; %bb.57:
	cmp	w8, #45
	b.eq	LBB78_31
LBB78_58:
	cmp	w0, #0
	cset	w8, ne
	fcmp	d0, d1
	cset	w9, ge
	eor	w8, w8, w9
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	fcmp	d0, d1
	str	x8, [x21, w1, uxtw #3]
	b.ge	LBB78_37
	b	LBB78_38
LBB78_59:
	cmp	w0, #0
	cset	w8, ne
	fcmp	d0, d1
	cset	w9, ls
	eor	w8, w8, w9
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	fcmp	d0, d1
	str	x8, [x21, w1, uxtw #3]
	b.ls	LBB78_37
	b	LBB78_38
LBB78_60:
	cmp	w8, #35
	b.eq	LBB78_36
LBB78_61:
	cmp	w0, #0
	cset	w8, ne
	fcmp	d0, d1
	cset	w9, mi
	eor	w8, w8, w9
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	fcmp	d0, d1
	str	x8, [x21, w1, uxtw #3]
	b.mi	LBB78_37
	b	LBB78_38
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_dc_fallback
_vm_op_compare_dc_fallback:             ; @vm_op_compare_dc_fallback
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x23, #40]
	ldr	x8, [x8, w0, uxtw #3]
	ldur	w10, [x20, #-4]
	and	w11, w10, #0xff
	cmp	w11, #40
	b.gt	LBB79_3
; %bb.1:
	cmp	w11, #35
	b.eq	LBB79_5
; %bb.2:
	cmp	w11, #36
	b.eq	LBB79_9
	b	LBB79_13
LBB79_3:
	cmp	w11, #42
	b.eq	LBB79_9
; %bb.4:
	cmp	w11, #41
	b.ne	LBB79_13
LBB79_5:
	cmp	x9, x8
	b.eq	LBB79_47
; %bb.6:
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB79_28
; %bb.7:
	scvtf	d0, w9
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB79_30
LBB79_8:
	scvtf	d1, w8
	fcmp	d0, d1
	b.eq	LBB79_47
	b	LBB79_56
LBB79_9:
	cmp	x9, x8
	b.eq	LBB79_56
; %bb.10:
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB79_32
; %bb.11:
	scvtf	d0, w9
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB79_34
LBB79_12:
	scvtf	d1, w8
	fcmp	d0, d1
	b.ne	LBB79_47
	b	LBB79_56
LBB79_13:
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB79_20
; %bb.14:
	scvtf	d0, w9
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB79_22
LBB79_15:
	scvtf	d1, w8
	and	w8, w10, #0xff
	cmp	w8, #40
	b.le	LBB79_24
LBB79_16:
	cmp	w8, #43
	b.gt	LBB79_48
; %bb.17:
	cmp	w8, #41
	b.eq	LBB79_53
; %bb.18:
	cmp	w8, #42
	b.ne	LBB79_54
; %bb.19:
	fcmp	d0, d1
	cset	w8, ne
	b	LBB79_55
LBB79_20:
	cbz	x11, LBB79_36
; %bb.21:
	add	x9, x9, x22
	fmov	d0, x9
	and	x9, x8, x22
	cmp	x9, x22
	b.eq	LBB79_15
LBB79_22:
	cbz	x9, LBB79_36
; %bb.23:
	add	x8, x8, x22
	fmov	d1, x8
	and	w8, w10, #0xff
	cmp	w8, #40
	b.gt	LBB79_16
LBB79_24:
	cmp	w8, #37
	b.le	LBB79_52
; %bb.25:
	cmp	w8, #38
	b.eq	LBB79_51
; %bb.26:
	cmp	w8, #39
	b.ne	LBB79_50
LBB79_27:
	fcmp	d0, d1
	cset	w8, gt
	b	LBB79_55
LBB79_28:
	cbz	x10, LBB79_37
; %bb.29:
	add	x10, x9, x22
	fmov	d0, x10
	and	x10, x8, x22
	cmp	x10, x22
	b.eq	LBB79_8
LBB79_30:
	cbz	x10, LBB79_37
; %bb.31:
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.eq	LBB79_47
	b	LBB79_56
LBB79_32:
	cbz	x10, LBB79_42
; %bb.33:
	add	x10, x9, x22
	fmov	d0, x10
	and	x10, x8, x22
	cmp	x10, x22
	b.eq	LBB79_12
LBB79_34:
	cbz	x10, LBB79_42
; %bb.35:
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.ne	LBB79_47
	b	LBB79_56
LBB79_36:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
LBB79_37:
	orr	x10, x9, x8
	mov	x11, #2                         ; =0x2
	movk	x11, #65534, lsl #48
	tst	x10, x11
	b.ne	LBB79_56
; %bb.38:
	ldr	x10, [x9]
	and	x11, x10, #0xff000000000000
	mov	x12, #281474976710656           ; =0x1000000000000
	cmp	x11, x12
	b.ne	LBB79_56
; %bb.39:
	ldr	x11, [x8]
	and	x13, x11, #0xff000000000000
	cmp	x13, x12
	b.ne	LBB79_56
; %bb.40:
	mov	w10, w10
	cmp	x10, w11, uxtw
	b.ne	LBB79_56
; %bb.41:
	sub	x2, x10, #9
	add	x0, x9, #8
	add	x1, x8, #8
	bl	_memcmp
	cbnz	w0, LBB79_56
	b	LBB79_47
LBB79_42:
	orr	x10, x9, x8
	mov	x11, #2                         ; =0x2
	movk	x11, #65534, lsl #48
	tst	x10, x11
	b.ne	LBB79_47
; %bb.43:
	ldr	x10, [x9]
	and	x11, x10, #0xff000000000000
	mov	x12, #281474976710656           ; =0x1000000000000
	cmp	x11, x12
	b.ne	LBB79_47
; %bb.44:
	ldr	x11, [x8]
	and	x13, x11, #0xff000000000000
	cmp	x13, x12
	b.ne	LBB79_47
; %bb.45:
	mov	w10, w10
	cmp	x10, w11, uxtw
	b.ne	LBB79_47
; %bb.46:
	sub	x2, x10, #9
	add	x0, x9, #8
	add	x1, x8, #8
	bl	_memcmp
	cbz	w0, LBB79_56
LBB79_47:
	add	x20, x20, #4
	b	LBB79_56
LBB79_48:
	cmp	w8, #44
	b.eq	LBB79_51
; %bb.49:
	cmp	w8, #45
	b.eq	LBB79_27
LBB79_50:
	fcmp	d0, d1
	cset	w8, ge
	b	LBB79_55
LBB79_51:
	fcmp	d0, d1
	cset	w8, ls
	b	LBB79_55
LBB79_52:
	cmp	w8, #35
	b.ne	LBB79_54
LBB79_53:
	fcmp	d0, d1
	cset	w8, eq
	b	LBB79_55
LBB79_54:
	fcmp	d0, d1
	cset	w8, mi
LBB79_55:
	cmp	w8, #0
	mov	w8, #4                          ; =0x4
	csel	x8, x8, xzr, ne
	add	x20, x20, x8
LBB79_56:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_dd_fallback
_vm_op_compare_dd_fallback:             ; @vm_op_compare_dd_fallback
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w0, uxtw #3]
	ldur	w10, [x20, #-4]
	and	w11, w10, #0xff
	cmp	w11, #40
	b.gt	LBB80_3
; %bb.1:
	cmp	w11, #35
	b.eq	LBB80_5
; %bb.2:
	cmp	w11, #36
	b.eq	LBB80_9
	b	LBB80_13
LBB80_3:
	cmp	w11, #42
	b.eq	LBB80_9
; %bb.4:
	cmp	w11, #41
	b.ne	LBB80_13
LBB80_5:
	cmp	x9, x8
	b.eq	LBB80_47
; %bb.6:
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB80_28
; %bb.7:
	scvtf	d0, w9
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB80_30
LBB80_8:
	scvtf	d1, w8
	fcmp	d0, d1
	b.eq	LBB80_47
	b	LBB80_56
LBB80_9:
	cmp	x9, x8
	b.eq	LBB80_56
; %bb.10:
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB80_32
; %bb.11:
	scvtf	d0, w9
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB80_34
LBB80_12:
	scvtf	d1, w8
	fcmp	d0, d1
	b.ne	LBB80_47
	b	LBB80_56
LBB80_13:
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB80_20
; %bb.14:
	scvtf	d0, w9
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB80_22
LBB80_15:
	scvtf	d1, w8
	and	w8, w10, #0xff
	cmp	w8, #40
	b.le	LBB80_24
LBB80_16:
	cmp	w8, #43
	b.gt	LBB80_48
; %bb.17:
	cmp	w8, #41
	b.eq	LBB80_53
; %bb.18:
	cmp	w8, #42
	b.ne	LBB80_54
; %bb.19:
	fcmp	d0, d1
	cset	w8, ne
	b	LBB80_55
LBB80_20:
	cbz	x11, LBB80_36
; %bb.21:
	add	x9, x9, x22
	fmov	d0, x9
	and	x9, x8, x22
	cmp	x9, x22
	b.eq	LBB80_15
LBB80_22:
	cbz	x9, LBB80_36
; %bb.23:
	add	x8, x8, x22
	fmov	d1, x8
	and	w8, w10, #0xff
	cmp	w8, #40
	b.gt	LBB80_16
LBB80_24:
	cmp	w8, #37
	b.le	LBB80_52
; %bb.25:
	cmp	w8, #38
	b.eq	LBB80_51
; %bb.26:
	cmp	w8, #39
	b.ne	LBB80_50
LBB80_27:
	fcmp	d0, d1
	cset	w8, gt
	b	LBB80_55
LBB80_28:
	cbz	x10, LBB80_37
; %bb.29:
	add	x10, x9, x22
	fmov	d0, x10
	and	x10, x8, x22
	cmp	x10, x22
	b.eq	LBB80_8
LBB80_30:
	cbz	x10, LBB80_37
; %bb.31:
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.eq	LBB80_47
	b	LBB80_56
LBB80_32:
	cbz	x10, LBB80_42
; %bb.33:
	add	x10, x9, x22
	fmov	d0, x10
	and	x10, x8, x22
	cmp	x10, x22
	b.eq	LBB80_12
LBB80_34:
	cbz	x10, LBB80_42
; %bb.35:
	add	x8, x8, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.ne	LBB80_47
	b	LBB80_56
LBB80_36:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notanumber
LBB80_37:
	orr	x10, x9, x8
	mov	x11, #2                         ; =0x2
	movk	x11, #65534, lsl #48
	tst	x10, x11
	b.ne	LBB80_56
; %bb.38:
	ldr	x10, [x9]
	and	x11, x10, #0xff000000000000
	mov	x12, #281474976710656           ; =0x1000000000000
	cmp	x11, x12
	b.ne	LBB80_56
; %bb.39:
	ldr	x11, [x8]
	and	x13, x11, #0xff000000000000
	cmp	x13, x12
	b.ne	LBB80_56
; %bb.40:
	mov	w10, w10
	cmp	x10, w11, uxtw
	b.ne	LBB80_56
; %bb.41:
	sub	x2, x10, #9
	add	x0, x9, #8
	add	x1, x8, #8
	bl	_memcmp
	cbnz	w0, LBB80_56
	b	LBB80_47
LBB80_42:
	orr	x10, x9, x8
	mov	x11, #2                         ; =0x2
	movk	x11, #65534, lsl #48
	tst	x10, x11
	b.ne	LBB80_47
; %bb.43:
	ldr	x10, [x9]
	and	x11, x10, #0xff000000000000
	mov	x12, #281474976710656           ; =0x1000000000000
	cmp	x11, x12
	b.ne	LBB80_47
; %bb.44:
	ldr	x11, [x8]
	and	x13, x11, #0xff000000000000
	cmp	x13, x12
	b.ne	LBB80_47
; %bb.45:
	mov	w10, w10
	cmp	x10, w11, uxtw
	b.ne	LBB80_47
; %bb.46:
	sub	x2, x10, #9
	add	x0, x9, #8
	add	x1, x8, #8
	bl	_memcmp
	cbz	w0, LBB80_56
LBB80_47:
	add	x20, x20, #4
	b	LBB80_56
LBB80_48:
	cmp	w8, #44
	b.eq	LBB80_51
; %bb.49:
	cmp	w8, #45
	b.eq	LBB80_27
LBB80_50:
	fcmp	d0, d1
	cset	w8, ge
	b	LBB80_55
LBB80_51:
	fcmp	d0, d1
	cset	w8, ls
	b	LBB80_55
LBB80_52:
	cmp	w8, #35
	b.ne	LBB80_54
LBB80_53:
	fcmp	d0, d1
	cset	w8, eq
	b	LBB80_55
LBB80_54:
	fcmp	d0, d1
	cset	w8, mi
LBB80_55:
	cmp	w8, #0
	mov	w8, #4                          ; =0x4
	csel	x8, x8, xzr, ne
	add	x20, x20, x8
LBB80_56:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
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
	.quad	_vm_op_RemDI
	.quad	_vm_op_AddDD
	.quad	_vm_op_SubDD
	.quad	_vm_op_MulDD
	.quad	_vm_op_DivDD
	.quad	_vm_op_RemDD
	.quad	_vm_op_NegD
	.quad	_vm_op_SetCond
	.quad	_vm_op_SetCondJ
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

l_.str.12:                              ; @.str.12
	.asciz	"stack overflow"

l_.str.13:                              ; @.str.13
	.asciz	"invalid layout"

l_.str.14:                              ; @.str.14
	.asciz	"not a offset"

l_.str.15:                              ; @.str.15
	.asciz	"not a number"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @dispatch_setc
_dispatch_setc:
	.quad	_vm_op_setc_CmpNotF
	.quad	_vm_op_setc_CmpEqDI
	.quad	_vm_op_setc_CmpNeDI
	.quad	_vm_op_setc_CmpEqDC
	.quad	_vm_op_setc_CmpNeDC
	.quad	_vm_op_setc_CmpLtDC
	.quad	_vm_op_setc_CmpLeDC
	.quad	_vm_op_setc_CmpGtDC
	.quad	_vm_op_setc_CmpGeDC
	.quad	_vm_op_setc_CmpEqDD
	.quad	_vm_op_setc_CmpNeDD
	.quad	_vm_op_setc_CmpLtDD
	.quad	_vm_op_setc_CmpLeDD
	.quad	_vm_op_setc_CmpGtDD
	.quad	_vm_op_setc_CmpGeDD

.subsections_via_symbols
