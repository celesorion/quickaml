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
	ldr	x8, [x0]
	ldp	x9, x25, [x8, #8]
	ldr	x20, [x9, #16]
	stp	x9, xzr, [x0, #80]
	ldr	x8, [x9, #32]
	str	x8, [x0, #16]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ubfx	x0, x8, #16, #16
Lloh0:
	adrp	x24, _dispatch@PAGE
Lloh1:
	add	x24, x24, _dispatch@PAGEOFF
	ldr	x9, [x24, x9, lsl #3]
	ubfx	w1, w8, #8, #8
	add	x21, x23, #96
                                        ; kill: def $w0 killed $w0 killed $x0
	mov	x22, #-562949953421312          ; =0xfffe000000000000
	blr	x9
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
	cmp	w1, #5
	b.gt	LBB1_8
; %bb.1:
	cmp	w1, #2
	b.gt	LBB1_13
; %bb.2:
	cbz	w1, LBB1_28
; %bb.3:
	cmp	w1, #1
	b.eq	LBB1_35
; %bb.4:
	cmp	w1, #2
	b.ne	LBB1_43
; %bb.5:
	adrp	x8, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, LBB1_46
; %bb.6:
	str	xzr, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fclose
	cbz	w0, LBB1_46
; %bb.7:
Lloh2:
	adrp	x25, l_.str@PAGE
Lloh3:
	add	x25, x25, l_.str@PAGEOFF
	mov	x0, x19
	mov	w1, #2                          ; =0x2
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_8:
	cmp	w1, #8
	b.gt	LBB1_17
; %bb.9:
	cmp	w1, #6
	b.eq	LBB1_29
; %bb.10:
	cmp	w1, #7
	b.eq	LBB1_36
; %bb.11:
	cmp	w1, #8
	b.ne	LBB1_43
; %bb.12:
	ldr	x8, [x23]
	ldr	x0, [x8]
	bl	_heap_stat_print
	b	LBB1_37
LBB1_13:
	sub	w8, w1, #4
	cmp	w8, #2
	b.hs	LBB1_26
; %bb.14:
	lsr	w27, w19, #8
	cmp	w27, w19, uxtb
	b.ls	LBB1_37
; %bb.15:
Lloh4:
	adrp	x8, l_.str.3@PAGE
Lloh5:
	add	x8, x8, l_.str.3@PAGEOFF
Lloh6:
	adrp	x9, l_.str.2@PAGE
Lloh7:
	add	x9, x9, l_.str.2@PAGEOFF
	cmp	w1, #5
	csel	x26, x9, x8, eq
                                        ; kill: def $w19 killed $w19 killed $x19 def $x19
	and	x19, x19, #0xff
Lloh8:
	adrp	x28, ___stderrp@GOTPAGE
Lloh9:
	ldr	x28, [x28, ___stderrp@GOTPAGEOFF]
LBB1_16:                                ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x28]
	ldr	x8, [x21, x19, lsl #3]
	stp	x19, x8, [sp]
	mov	x1, x26
	bl	_fprintf
	add	x19, x19, #1
	cmp	x27, x19
	b.ne	LBB1_16
	b	LBB1_37
LBB1_17:
	cmp	w1, #9
	b.eq	LBB1_31
; %bb.18:
	cmp	w1, #10
	b.eq	LBB1_38
; %bb.19:
	cmp	w1, #11
	b.ne	LBB1_43
; %bb.20:
	adrp	x27, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, LBB1_47
; %bb.21:
	and	w8, w19, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	bics	xzr, x22, x8
	b.ne	LBB1_48
; %bb.22:
	lsr	w9, w19, #8
	ldr	x26, [x21, w9, uxtw #3]
	bics	xzr, x22, x26
	b.ne	LBB1_49
; %bb.23:
	tbnz	w8, #31, LBB1_54
; %bb.24:
	cmp	w26, #256
	b.lo	LBB1_55
; %bb.25:
Lloh10:
	adrp	x25, l_.str.18@PAGE
Lloh11:
	add	x25, x25, l_.str.18@PAGEOFF
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_26:
	cmp	w1, #3
	b.ne	LBB1_43
; %bb.27:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_unusedexta
LBB1_28:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_undefined
LBB1_29:
	and	w8, w19, #0xff
	lsr	w9, w19, #8
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x8, x9
	b.eq	LBB1_37
; %bb.30:
Lloh12:
	adrp	x10, ___stderrp@GOTPAGE
Lloh13:
	ldr	x10, [x10, ___stderrp@GOTPAGEOFF]
Lloh14:
	ldr	x0, [x10]
	stp	x8, x9, [sp]
Lloh15:
	adrp	x1, l_.str.4@PAGE
Lloh16:
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
	mov	x0, x19
	mov	w1, #6                          ; =0x6
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_assertionfailed
LBB1_31:
	and	w8, w19, #0xff
	ldr	x28, [x21, w8, uxtw #3]
	and	x8, x28, #0xfffffffffffffffe
	and	x8, x8, #0xfffe000000000003
	cmp	x28, #0
	ccmp	x8, #0, #0, ne
	b.ne	LBB1_44
; %bb.32:
	ldrb	w8, [x28, #6]
	mov	x9, #281474976710656            ; =0x1000000000000
	cmp	x9, x8, lsl #48
	b.ne	LBB1_44
; %bb.33:
	adrp	x27, _vm_op_Trap.edit_file@PAGE
	ldr	x8, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x8, LBB1_50
; %bb.34:
Lloh17:
	adrp	x25, l_.str.8@PAGE
Lloh18:
	add	x25, x25, l_.str.8@PAGEOFF
	mov	x0, x19
	mov	w1, #9                          ; =0x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_35:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_diverge
LBB1_36:
                                        ; kill: def $w19 killed $w19 killed $x19 def $x19
Lloh19:
	adrp	x26, ___stderrp@GOTPAGE
Lloh20:
	ldr	x26, [x26, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x26]
	and	x19, x19, #0xff
	str	x19, [sp]
Lloh21:
	adrp	x1, l_.str.5@PAGE
Lloh22:
	add	x1, x1, l_.str.5@PAGEOFF
	bl	_fprintf
	ldr	x0, [x26]
	ldr	x1, [x21, x19, lsl #3]
	bl	_obj_print
	ldr	x1, [x26]
	mov	w0, #10                         ; =0xa
	bl	_fputc
LBB1_37:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB1_38:
	and	x8, x19, #0xff
	ldr	x8, [x21, x8, lsl #3]
	and	x9, x8, #0xfffffffffffffffe
	and	x9, x9, #0xfffe000000000003
	cmp	x8, #0
	ccmp	x9, #0, #0, ne
	b.ne	LBB1_45
; %bb.39:
	ldrb	w8, [x8, #6]
	mov	x9, #281474976710656            ; =0x1000000000000
	cmp	x9, x8, lsl #48
	b.ne	LBB1_45
; %bb.40:
	adrp	x8, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, LBB1_53
; %bb.41:
	str	xzr, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fclose
	cbz	w0, LBB1_37
; %bb.42:
Lloh23:
	adrp	x25, l_.str@PAGE
Lloh24:
	add	x25, x25, l_.str@PAGEOFF
	mov	x0, x19
	mov	w1, #10                         ; =0xa
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_43:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_invalidtrap
LBB1_44:
Lloh25:
	adrp	x25, l_.str.7@PAGE
Lloh26:
	add	x25, x25, l_.str.7@PAGEOFF
	mov	x0, x19
	mov	w1, #9                          ; =0x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_45:
Lloh27:
	adrp	x25, l_.str.7@PAGE
Lloh28:
	add	x25, x25, l_.str.7@PAGEOFF
	mov	x0, x19
	mov	w1, #10                         ; =0xa
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_46:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
LBB1_47:
Lloh29:
	adrp	x25, l_.str.14@PAGE
Lloh30:
	add	x25, x25, l_.str.14@PAGEOFF
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_48:
Lloh31:
	adrp	x25, l_.str.15@PAGE
Lloh32:
	add	x25, x25, l_.str.15@PAGEOFF
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_49:
Lloh33:
	adrp	x25, l_.str.16@PAGE
Lloh34:
	add	x25, x25, l_.str.16@PAGEOFF
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_50:
	bl	___error
	str	wzr, [x0]
Lloh35:
	adrp	x1, l_.str.9@PAGE
Lloh36:
	add	x1, x1, l_.str.9@PAGEOFF
	add	x0, x28, #8
	bl	_fopen
	cbz	x0, LBB1_57
LBB1_51:
	mov	x26, x0
	mov	x1, #0                          ; =0x0
	mov	w2, #2                          ; =0x2
	bl	_fseek
	cbz	w0, LBB1_60
; %bb.52:
	mov	x0, x26
	bl	_fclose
Lloh37:
	adrp	x25, l_.str.12@PAGE
Lloh38:
	add	x25, x25, l_.str.12@PAGEOFF
	mov	x0, x19
	mov	w1, #9                          ; =0x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_53:
Lloh39:
	adrp	x25, l_.str.14@PAGE
Lloh40:
	add	x25, x25, l_.str.14@PAGEOFF
	mov	x0, x19
	mov	w1, #10                         ; =0xa
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_54:
Lloh41:
	adrp	x25, l_.str.17@PAGE
Lloh42:
	add	x25, x25, l_.str.17@PAGEOFF
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_55:
	and	x1, x8, #0x7fffffff
	mov	w2, #0                          ; =0x0
	bl	_fseek
	cbz	w0, LBB1_62
; %bb.56:
Lloh43:
	adrp	x25, l_.str.12@PAGE
Lloh44:
	add	x25, x25, l_.str.12@PAGEOFF
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_57:
	bl	___error
	ldr	w8, [x0]
	cmp	w8, #2
	b.ne	LBB1_59
; %bb.58:
Lloh45:
	adrp	x1, l_.str.10@PAGE
Lloh46:
	add	x1, x1, l_.str.10@PAGEOFF
	add	x0, x28, #8
	bl	_fopen
	cbnz	x0, LBB1_51
LBB1_59:
Lloh47:
	adrp	x25, l_.str.11@PAGE
Lloh48:
	add	x25, x25, l_.str.11@PAGEOFF
	mov	x0, x19
	mov	w1, #9                          ; =0x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_60:
	mov	x0, x26
	bl	_ftell
	lsr	x8, x0, #31
	cbz	x8, LBB1_65
; %bb.61:
	mov	x0, x26
	bl	_fclose
Lloh49:
	adrp	x25, l_.str.13@PAGE
Lloh50:
	add	x25, x25, l_.str.13@PAGEOFF
	mov	x0, x19
	mov	w1, #9                          ; =0x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_62:
	ldr	x1, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	mov	x0, x26
	bl	_fputc
	cmn	w0, #1
	b.eq	LBB1_66
; %bb.63:
	ldr	x0, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fflush
	cbz	w0, LBB1_37
; %bb.64:
Lloh51:
	adrp	x25, l_.str.20@PAGE
Lloh52:
	add	x25, x25, l_.str.20@PAGEOFF
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_65:
	lsr	w8, w19, #8
	str	x26, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	orr	x9, x0, #0xfffe000000000000
	str	x9, [x21, w8, uxtw #3]
	b	LBB1_37
LBB1_66:
Lloh53:
	adrp	x25, l_.str.19@PAGE
Lloh54:
	add	x25, x25, l_.str.19@PAGEOFF
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh15, Lloh16
	.loh AdrpLdrGotLdr	Lloh12, Lloh13, Lloh14
	.loh AdrpAdd	Lloh17, Lloh18
	.loh AdrpAdd	Lloh21, Lloh22
	.loh AdrpLdrGot	Lloh19, Lloh20
	.loh AdrpAdd	Lloh23, Lloh24
	.loh AdrpAdd	Lloh25, Lloh26
	.loh AdrpAdd	Lloh27, Lloh28
	.loh AdrpAdd	Lloh29, Lloh30
	.loh AdrpAdd	Lloh31, Lloh32
	.loh AdrpAdd	Lloh33, Lloh34
	.loh AdrpAdd	Lloh35, Lloh36
	.loh AdrpAdd	Lloh37, Lloh38
	.loh AdrpAdd	Lloh39, Lloh40
	.loh AdrpAdd	Lloh41, Lloh42
	.loh AdrpAdd	Lloh43, Lloh44
	.loh AdrpAdd	Lloh45, Lloh46
	.loh AdrpAdd	Lloh47, Lloh48
	.loh AdrpAdd	Lloh49, Lloh50
	.loh AdrpAdd	Lloh51, Lloh52
	.loh AdrpAdd	Lloh53, Lloh54
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
	ldr	x8, [x23, #16]
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
	ldur	x8, [x21, #-16]
	cbz	w0, LBB7_3
; %bb.1:
	ldr	w9, [x8, #48]
	cmp	w9, w0
	b.lo	LBB7_4
; %bb.2:
	mov	w9, w0
	add	x8, x8, x9, lsl #3
	ldr	x8, [x8, #48]
LBB7_3:
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB7_4:
	b	_badop
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
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, x20
	mov	w11, w1
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x20, [x10, #16]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, LBB10_3
; %bb.1:
	add	x8, x21, x11, lsl #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.hs	LBB10_4
LBB10_2:
	stp	x10, x9, [x21, #-16]
	ldr	x8, [x10, #32]
	str	x8, [x23, #16]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB10_3:
	mov	x12, x0
	mov	x0, x23
	mov	x13, x1
	mov	x1, x21
	mov	w2, #256                        ; =0x100
	bl	_gc_poll_slow
	mov	x0, x12
	mov	x1, x13
	add	x8, x21, x11, lsl #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.lo	LBB10_2
LBB10_4:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Call
_vm_op_Call:                            ; @vm_op_Call
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, x20
	ldr	x10, [x25, w0, uxtw #3]
	ldr	x20, [x10, #16]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, LBB11_3
; %bb.1:
	add	x8, x21, w1, uxtw #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.hs	LBB11_4
LBB11_2:
	stp	x10, x9, [x21, #-16]
	ldr	x8, [x10, #32]
	str	x8, [x23, #16]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB11_3:
	mov	x11, x0
	mov	x0, x23
	mov	x12, x1
	mov	x1, x21
	mov	w2, #256                        ; =0x100
	bl	_gc_poll_slow
	mov	x0, x11
	mov	x1, x12
	add	x8, x21, w1, uxtw #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.lo	LBB11_2
LBB11_4:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
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
	ldr	x9, [x9, #32]
	str	x9, [x23, #16]
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
	ldr	x9, [x9, #32]
	str	x9, [x23, #16]
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
	ldr	x9, [x9, #32]
	str	x9, [x23, #16]
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
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, x1
	mov	x11, x0
	ldr	x13, [x23]
	ldr	x12, [x25, w0, uxtw #3]
	mov	x0, x23
	mov	x1, x12
	mov	x2, x21
	bl	_thunk_alloc_instance
	mov	x10, x0
	ldr	w14, [x12, #48]
	cbz	w14, LBB15_4
; %bb.1:
	add	x12, x12, #56
	add	x15, x10, #56
LBB15_2:                                ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x12], #8
	add	x2, sp, #8
	mov	x1, x21
	bl	_capture_loc_resolve
	tbz	w0, #0, LBB15_6
; %bb.3:                                ;   in Loop: Header=BB15_2 Depth=1
	ldr	x8, [sp, #8]
	str	x8, [x15], #8
	subs	x14, x14, #1
	b.ne	LBB15_2
LBB15_4:
	ldr	x0, [x13]
	mov	x1, x10
	mov	w2, #2                          ; =0x2
	bl	_gc_publish_new_object
	str	x10, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, LBB15_7
LBB15_5:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB15_6:
	mov	x0, x11
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_badop
LBB15_7:
	ldr	w2, [x10]
	mov	x0, x23
	mov	x1, x21
	bl	_gc_poll_slow
	b	LBB15_5
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_WObj
_vm_op_WObj:                            ; @vm_op_WObj
	.cfi_startproc
; %bb.0:
	mov	x9, x1
	mov	x12, x0
	ldr	x15, [x23]
	and	w13, w0, #0xff
	ldr	x8, [x15, #32]
	cmp	x8, x13
	b.lo	LBB16_12
; %bb.1:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	lsr	w11, w12, #8
	lsl	w8, w11, #3
	add	w14, w8, #23
	and	x0, x14, #0xff8
	mov	x1, x23
	mov	x2, x21
	bl	_alloc_object
	mov	x10, x0
	mov	x1, x13
	mov	x2, x11
	bl	_object_init
	cmp	w12, #256
	b.lo	LBB16_7
; %bb.2:
	mov	w8, w9
	cmp	w12, #2559
	b.ls	LBB16_4
; %bb.3:
	lsl	x12, x8, #3
	add	x16, x12, x21
	sub	x12, x10, x16
	add	x12, x12, #16
	cmp	x12, #64
	b.hs	LBB16_9
LBB16_4:
	mov	x12, #0                         ; =0x0
LBB16_5:
	lsl	x13, x12, #3
	add	x8, x13, x8, lsl #3
	add	x8, x21, x8
	add	x13, x13, x10
	add	x13, x13, #16
	sub	x11, x11, x12
LBB16_6:                                ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x8], #8
	str	x12, [x13], #8
	subs	x11, x11, #1
	b.ne	LBB16_6
LBB16_7:
	ldr	x0, [x15]
	mov	x1, x10
	mov	w2, #0                          ; =0x0
	bl	_gc_publish_new_object
	str	x10, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, LBB16_13
LBB16_8:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB16_9:
	and	x12, x11, #0xf8
	add	x13, x10, #64
	add	x16, x16, #32
	mov	x17, x12
LBB16_10:                               ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x16, #-32]
	ldp	q2, q3, [x16], #64
	stp	q0, q1, [x13, #-48]
	stp	q2, q3, [x13, #-16]
	add	x13, x13, #64
	subs	x17, x17, #8
	b.ne	LBB16_10
; %bb.11:
	cmp	x12, x11
	b.ne	LBB16_5
	b	LBB16_7
LBB16_12:
	mov	x0, x12
	mov	x1, x9
	b	_invalidlayout
LBB16_13:
	and	x2, x14, #0xff8
	mov	x0, x23
	mov	x1, x21
	bl	_gc_poll_slow
	b	LBB16_8
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MObj
_vm_op_MObj:                            ; @vm_op_MObj
	.cfi_startproc
; %bb.0:
	mov	x9, x1
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
	str	x0, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB17_2:
	ldr	x10, [x23]
	ldr	x10, [x10, #32]
	cmp	x10, w8, uxtw
	b.lo	LBB17_4
; %bb.3:
	lsr	w8, w0, #8
	ldr	x8, [x21, w8, uxtw #3]
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB17_4:
	mov	x1, x9
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
	.p2align	5                               ; -- Begin function vm_op_AddDC
_vm_op_AddDC:                           ; @vm_op_AddDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB20_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB20_3
; %bb.2:
	adds	w8, w8, w9
	b.vc	LBB20_8
LBB20_3:
	b	_vm_op_arith_dc_fallback
LBB20_4:
	cbz	x10, LBB20_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB20_7
LBB20_6:
	b	_vm_op_arith_dc_fallback
LBB20_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fadd	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB20_9
LBB20_8:
	orr	x8, x8, x22
LBB20_9:
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
	.p2align	5                               ; -- Begin function vm_op_SubDC
_vm_op_SubDC:                           ; @vm_op_SubDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB21_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB21_3
; %bb.2:
	subs	w8, w8, w9
	b.vc	LBB21_8
LBB21_3:
	b	_vm_op_arith_dc_fallback
LBB21_4:
	cbz	x10, LBB21_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB21_7
LBB21_6:
	b	_vm_op_arith_dc_fallback
LBB21_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fsub	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB21_9
LBB21_8:
	orr	x8, x8, x22
LBB21_9:
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
	.p2align	5                               ; -- Begin function vm_op_MulDC
_vm_op_MulDC:                           ; @vm_op_MulDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB22_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB22_3
; %bb.2:
	smull	x8, w8, w9
	cmp	x8, w8, sxtw
	b.eq	LBB22_8
LBB22_3:
	b	_vm_op_arith_dc_fallback
LBB22_4:
	cbz	x10, LBB22_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB22_7
LBB22_6:
	b	_vm_op_arith_dc_fallback
LBB22_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fmul	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB22_9
LBB22_8:
	mov	w8, w8
	orr	x8, x8, x22
LBB22_9:
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
	.p2align	5                               ; -- Begin function vm_op_DivDC
_vm_op_DivDC:                           ; @vm_op_DivDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB23_5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB23_7
; %bb.2:
	cbz	w9, LBB23_7
; %bb.3:
	mov	w10, #-2147483648               ; =0x80000000
	cmp	w8, w10
	ccmn	w9, #1, #0, eq
	b.eq	LBB23_7
; %bb.4:
	sdiv	w10, w8, w9
	msub	w11, w10, w9, w8
	eor	w8, w9, w8
	cmp	w8, #0
	ccmp	w11, #0, #4, lt
	cset	w8, ne
	sub	w8, w10, w8
	orr	x8, x8, x22
	b	LBB23_9
LBB23_5:
	cbz	x10, LBB23_7
; %bb.6:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB23_8
LBB23_7:
	b	_vm_op_arith_dc_fallback
LBB23_8:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fdiv	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
LBB23_9:
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
	.p2align	5                               ; -- Begin function vm_op_RemDC
_vm_op_RemDC:                           ; @vm_op_RemDC
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB24_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB24_6
; %bb.2:
	cbz	w9, LBB24_6
; %bb.3:
	sdiv	w10, w8, w9
	msub	w10, w10, w9, w8
	eor	w8, w9, w8
	and	w8, w9, w8, asr #31
	add	w8, w10, w8
	cmp	w10, #0
	csel	w8, wzr, w8, eq
	orr	x8, x8, x22
	b	LBB24_8
LBB24_4:
	cbz	x10, LBB24_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB24_7
LBB24_6:
	b	_vm_op_arith_dc_fallback
LBB24_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	fmov	x8, d0
	sub	x8, x8, x22
LBB24_8:
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
	strb	wzr, [x23, #56]
	ldrb	w8, [x20], #4
	sub	w8, w8, #32
	cmp	w8, #15
	b.hs	LBB31_2
; %bb.1:
Lloh55:
	adrp	x9, _dispatch_setc@PAGE
Lloh56:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
LBB31_2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh55, Lloh56
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCondJ
_vm_op_SetCondJ:                        ; @vm_op_SetCondJ
	.cfi_startproc
; %bb.0:
	mov	w8, #1                          ; =0x1
	strb	w8, [x23, #56]
	ldrb	w8, [x20], #4
	sub	w8, w8, #32
	cmp	w8, #15
	b.hs	LBB32_2
; %bb.1:
Lloh57:
	adrp	x9, _dispatch_setc@PAGE
Lloh58:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
LBB32_2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh57, Lloh58
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNotF
_vm_op_CmpNotF:                         ; @vm_op_CmpNotF
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20]
	ldr	x9, [x21, w1, uxtw #3]
	mov	w10, #65535                     ; =0xffff
	cmp	w0, w10
	cset	w10, eq
	and	x9, x9, #0xfffffffffffffffb
	cmp	x9, #2
	cset	w9, ne
	eor	w9, w10, w9
	asr	w8, w8, #8
	sbfiz	x8, x8, #2, #32
	cmp	w9, #0
	csel	x8, xzr, x8, ne
	add	x8, x20, x8
	ldr	w9, [x8, #4]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	ubfx	x0, x9, #16, #16
	ubfx	w1, w9, #8, #8
	add	x20, x8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDI
_vm_op_CmpEqDI:                         ; @vm_op_CmpEqDI
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB34_2
; %bb.1:
	cmp	w9, w0, sxth
	b	LBB34_4
LBB34_2:
	cbz	x10, LBB34_5
; %bb.3:
	add	x9, x9, x22
	fmov	d0, x9
	sxth	w9, w0
	scvtf	d1, w9
	fcmp	d0, d1
LBB34_4:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, eq
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB34_5:
	b	_vm_op_compare_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDI
_vm_op_CmpNeDI:                         ; @vm_op_CmpNeDI
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB35_2
; %bb.1:
	cmp	w9, w0, sxth
	b	LBB35_4
LBB35_2:
	cbz	x10, LBB35_5
; %bb.3:
	add	x9, x9, x22
	fmov	d0, x9
	sxth	w9, w0
	scvtf	d1, w9
	fcmp	d0, d1
LBB35_4:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, ne
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB35_5:
	b	_vm_op_compare_di_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDC
_vm_op_CmpEqDC:                         ; @vm_op_CmpEqDC
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB36_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB36_7
; %bb.2:
	cmp	w9, w10
	b.eq	LBB36_4
LBB36_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB36_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB36_5:
	cbz	x11, LBB36_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB36_8
LBB36_7:
	b	_vm_op_compare_dc_fallback
LBB36_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.eq	LBB36_4
	b	LBB36_3
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDC
_vm_op_CmpNeDC:                         ; @vm_op_CmpNeDC
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB37_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB37_7
; %bb.2:
	cmp	w9, w10
	b.ne	LBB37_4
LBB37_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB37_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB37_5:
	cbz	x11, LBB37_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB37_8
LBB37_7:
	b	_vm_op_compare_dc_fallback
LBB37_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.ne	LBB37_4
	b	LBB37_3
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLtDC
_vm_op_CmpLtDC:                         ; @vm_op_CmpLtDC
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB38_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB38_7
; %bb.2:
	cmp	w9, w10
	b.lt	LBB38_4
LBB38_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB38_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB38_5:
	cbz	x11, LBB38_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB38_8
LBB38_7:
	b	_vm_op_compare_dc_fallback
LBB38_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.pl	LBB38_3
	b	LBB38_4
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLeDC
_vm_op_CmpLeDC:                         ; @vm_op_CmpLeDC
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB39_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB39_7
; %bb.2:
	cmp	w9, w10
	b.le	LBB39_4
LBB39_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB39_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB39_5:
	cbz	x11, LBB39_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB39_8
LBB39_7:
	b	_vm_op_compare_dc_fallback
LBB39_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.hi	LBB39_3
	b	LBB39_4
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGtDC
_vm_op_CmpGtDC:                         ; @vm_op_CmpGtDC
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB40_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB40_7
; %bb.2:
	cmp	w9, w10
	b.gt	LBB40_4
LBB40_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB40_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB40_5:
	cbz	x11, LBB40_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB40_8
LBB40_7:
	b	_vm_op_compare_dc_fallback
LBB40_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.le	LBB40_3
	b	LBB40_4
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGeDC
_vm_op_CmpGeDC:                         ; @vm_op_CmpGeDC
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	LBB41_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB41_7
; %bb.2:
	cmp	w9, w10
	b.ge	LBB41_4
LBB41_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB41_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB41_5:
	cbz	x11, LBB41_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB41_8
LBB41_7:
	b	_vm_op_compare_dc_fallback
LBB41_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.lt	LBB41_3
	b	LBB41_4
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDD
_vm_op_CmpEqDD:                         ; @vm_op_CmpEqDD
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	LBB42_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB42_5
; %bb.2:
	cmp	w10, w9
	b	LBB42_7
LBB42_3:
	cbz	x11, LBB42_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB42_6
LBB42_5:
	b	_vm_op_compare_dd_fallback
LBB42_6:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
LBB42_7:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
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
	.p2align	5                               ; -- Begin function vm_op_CmpNeDD
_vm_op_CmpNeDD:                         ; @vm_op_CmpNeDD
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	LBB43_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB43_5
; %bb.2:
	cmp	w10, w9
	b	LBB43_7
LBB43_3:
	cbz	x11, LBB43_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB43_6
LBB43_5:
	b	_vm_op_compare_dd_fallback
LBB43_6:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
LBB43_7:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
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
	.p2align	5                               ; -- Begin function vm_op_CmpLtDD
_vm_op_CmpLtDD:                         ; @vm_op_CmpLtDD
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	LBB44_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB44_5
; %bb.2:
	cmp	w10, w9
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, lt
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB44_3:
	cbz	x11, LBB44_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB44_6
LBB44_5:
	b	_vm_op_compare_dd_fallback
LBB44_6:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, mi
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
	ldr	w8, [x20], #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	LBB45_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB45_5
; %bb.2:
	cmp	w10, w9
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, le
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB45_3:
	cbz	x11, LBB45_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB45_6
LBB45_5:
	b	_vm_op_compare_dd_fallback
LBB45_6:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, ls
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
	ldr	w8, [x20], #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	LBB46_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB46_5
; %bb.2:
	cmp	w10, w9
	b	LBB46_7
LBB46_3:
	cbz	x11, LBB46_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB46_6
LBB46_5:
	b	_vm_op_compare_dd_fallback
LBB46_6:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
LBB46_7:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, gt
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
	ldr	w8, [x20], #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	LBB47_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB47_5
; %bb.2:
	cmp	w10, w9
	b	LBB47_7
LBB47_3:
	cbz	x11, LBB47_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB47_6
LBB47_5:
	b	_vm_op_compare_dd_fallback
LBB47_6:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
LBB47_7:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, ge
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
Lloh59:
	adrp	x25, l_.str.21@PAGE
Lloh60:
	add	x25, x25, l_.str.21@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh59, Lloh60
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
Lloh61:
	adrp	x8, ___stderrp@GOTPAGE
Lloh62:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh63:
	ldr	x0, [x8]
	str	x25, [sp]
Lloh64:
	adrp	x1, l_.str.22@PAGE
Lloh65:
	add	x1, x1, l_.str.22@PAGEOFF
	bl	_fprintf
	mov	w0, #255                        ; =0xff
	bl	_exit
	.loh AdrpAdd	Lloh64, Lloh65
	.loh AdrpLdrGotLdr	Lloh61, Lloh62, Lloh63
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
	.cfi_startproc
; %bb.0:
Lloh66:
	adrp	x25, l_.str.23@PAGE
Lloh67:
	add	x25, x25, l_.str.23@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh66, Lloh67
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
	.cfi_startproc
; %bb.0:
Lloh68:
	adrp	x25, l_.str.24@PAGE
Lloh69:
	add	x25, x25, l_.str.24@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh68, Lloh69
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
	.cfi_startproc
; %bb.0:
Lloh70:
	adrp	x25, l_.str.25@PAGE
Lloh71:
	add	x25, x25, l_.str.25@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh70, Lloh71
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function badop
_badop:                                 ; @badop
	.cfi_startproc
; %bb.0:
Lloh72:
	adrp	x25, l_.str.26@PAGE
Lloh73:
	add	x25, x25, l_.str.26@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh72, Lloh73
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
	.cfi_startproc
; %bb.0:
Lloh74:
	adrp	x25, l_.str.27@PAGE
Lloh75:
	add	x25, x25, l_.str.27@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh74, Lloh75
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
	.cfi_startproc
; %bb.0:
Lloh76:
	adrp	x25, l_.str.28@PAGE
Lloh77:
	add	x25, x25, l_.str.28@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh76, Lloh77
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function thunk_alloc_instance
_thunk_alloc_instance:                  ; @thunk_alloc_instance
	.cfi_startproc
; %bb.0:
	stp	x10, x9, [sp, #-32]!            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w9, -24
	.cfi_offset w10, -32
	mov	x9, x1
	mov	x1, x0
	ldr	w8, [x9, #48]
	lsl	w8, w8, #3
	add	w8, w8, #63
	and	x0, x8, #0xfffffff8
	bl	_alloc_object
	mov	x10, x0
	mov	x1, x9
	bl	_thunk_instance_init
	mov	x0, x10
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp], #32              ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function capture_loc_resolve
_capture_loc_resolve:                   ; @capture_loc_resolve
	.cfi_startproc
; %bb.0:
	ldur	x8, [x1, #-16]
	and	w16, w0, #0xffff
	ubfx	x17, x0, #16, #16
	cmp	w17, #1
	b.eq	LBB58_4
; %bb.1:
	cbnz	w17, LBB58_9
; %bb.2:
	ldrb	w8, [x8, #52]
	cmp	w16, w8
	b.hs	LBB58_9
; %bb.3:
	add	x8, x1, w0, uxth #3
	b	LBB58_7
LBB58_4:
	cbz	w16, LBB58_8
; %bb.5:
	and	w16, w0, #0xffff
	ldr	w17, [x8, #48]
	cmp	w17, w16
	b.lo	LBB58_9
; %bb.6:
	sub	w16, w16, #1
	add	x8, x8, w16, uxtw #3
	add	x8, x8, #56
LBB58_7:
	ldr	x8, [x8]
LBB58_8:
	str	x8, [x2]
	mov	w0, #1                          ; =0x1
	ret
LBB58_9:
	mov	w0, #0                          ; =0x0
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
	.cfi_startproc
; %bb.0:
Lloh78:
	adrp	x25, l_.str.29@PAGE
Lloh79:
	add	x25, x25, l_.str.29@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh78, Lloh79
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function notaoffset
_notaoffset:                            ; @notaoffset
	.cfi_startproc
; %bb.0:
Lloh80:
	adrp	x25, l_.str.30@PAGE
Lloh81:
	add	x25, x25, l_.str.30@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh80, Lloh81
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_arith_dc_fallback
_vm_op_arith_dc_fallback:               ; @vm_op_arith_dc_fallback
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB61_7
; %bb.1:
	scvtf	d0, w8
	ldr	x8, [x23, #16]
	and	w9, w0, #0xff
	ldr	x8, [x8, w9, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB61_9
LBB61_2:
	scvtf	d1, w8
	ldurb	w8, [x20, #-4]
	cmp	w8, #20
	b.le	LBB61_11
LBB61_3:
	cmp	w8, #21
	b.eq	LBB61_15
; %bb.4:
	cmp	w8, #22
	b.eq	LBB61_16
; %bb.5:
	cmp	w8, #23
	b.ne	LBB61_14
; %bb.6:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	LBB61_18
LBB61_7:
	cbz	x9, LBB61_14
; %bb.8:
	add	x8, x8, x22
	fmov	d0, x8
	ldr	x8, [x23, #16]
	and	w9, w0, #0xff
	ldr	x8, [x8, w9, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.eq	LBB61_2
LBB61_9:
	cbz	x9, LBB61_14
; %bb.10:
	add	x8, x8, x22
	fmov	d1, x8
	ldurb	w8, [x20, #-4]
	cmp	w8, #20
	b.gt	LBB61_3
LBB61_11:
	cmp	w8, #19
	b.eq	LBB61_17
; %bb.12:
	cmp	w8, #20
	b.ne	LBB61_14
; %bb.13:
	fsub	d0, d0, d1
	b	LBB61_18
LBB61_14:
	b	_notanumber
LBB61_15:
	fmul	d0, d0, d1
	b	LBB61_18
LBB61_16:
	fdiv	d0, d0, d1
	b	LBB61_18
LBB61_17:
	fadd	d0, d0, d1
LBB61_18:
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
Lloh82:
	adrp	x25, l_.str.31@PAGE
Lloh83:
	add	x25, x25, l_.str.31@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh82, Lloh83
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_arith_dd_fallback
_vm_op_arith_dd_fallback:               ; @vm_op_arith_dd_fallback
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB63_3
; %bb.1:
	scvtf	d0, w8
	ldurb	w8, [x20, #-4]
	cmp	w8, #29
	b.ne	LBB63_5
LBB63_2:
	fmov	x8, d0
	eor	x8, x8, #0x8000000000000000
	b	LBB63_21
LBB63_3:
	cbz	x9, LBB63_16
; %bb.4:
	add	x8, x8, x22
	fmov	d0, x8
	ldurb	w8, [x20, #-4]
	cmp	w8, #29
	b.eq	LBB63_2
LBB63_5:
	and	w9, w0, #0xff
	ldr	x9, [x21, w9, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB63_11
; %bb.6:
	scvtf	d1, w9
	cmp	w8, #25
	b.le	LBB63_13
LBB63_7:
	cmp	w8, #26
	b.eq	LBB63_17
; %bb.8:
	cmp	w8, #27
	b.eq	LBB63_18
; %bb.9:
	cmp	w8, #28
	b.ne	LBB63_16
; %bb.10:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	LBB63_20
LBB63_11:
	cbz	x10, LBB63_16
; %bb.12:
	add	x9, x9, x22
	fmov	d1, x9
	cmp	w8, #25
	b.gt	LBB63_7
LBB63_13:
	cmp	w8, #24
	b.eq	LBB63_19
; %bb.14:
	cmp	w8, #25
	b.ne	LBB63_16
; %bb.15:
	fsub	d0, d0, d1
	b	LBB63_20
LBB63_16:
	b	_notanumber
LBB63_17:
	fmul	d0, d0, d1
	b	LBB63_20
LBB63_18:
	fdiv	d0, d0, d1
	b	LBB63_20
LBB63_19:
	fadd	d0, d0, d1
LBB63_20:
	fmov	x8, d0
LBB63_21:
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
	tbz	w8, #0, LBB65_2
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
LBB65_2:
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	asr	w8, w8, #16
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB66_3
; %bb.1:
	cmp	w8, w9
	b.eq	LBB66_5
LBB66_2:
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
LBB66_3:
	cbz	x10, LBB66_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fcmp	d0, d1
	b.ne	LBB66_2
LBB66_5:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB66_6:
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
	asr	w8, w8, #16
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB67_3
; %bb.1:
	cmp	w8, w9
	b.ne	LBB67_5
LBB67_2:
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
LBB67_3:
	cbz	x10, LBB67_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fcmp	d0, d1
	b.eq	LBB67_2
LBB67_5:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB67_6:
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
	ldr	x10, [x23, #16]
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
	b.eq	LBB68_8
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
	b.ne	LBB68_3
LBB68_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	ldr	x10, [x23, #16]
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
	b.ne	LBB69_8
LBB69_3:
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
	b.eq	LBB69_3
LBB69_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	ldr	x10, [x23, #16]
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
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
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
	b.mi	LBB70_3
LBB70_8:
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
	ldr	x10, [x23, #16]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB71_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB71_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB71_8
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
	b.hi	LBB71_3
LBB71_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	ldr	x10, [x23, #16]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB72_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB72_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB72_8
LBB72_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
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
	b.gt	LBB72_3
LBB72_8:
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
	ldr	x10, [x23, #16]
	lsr	x9, x9, #13
	and	x9, x9, #0x7fff8
	ldr	x9, [x10, x9]
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
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
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
	b.lt	LBB73_3
LBB73_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	b.ne	LBB74_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB74_6
; %bb.2:
	cmp	w8, w9
	b.eq	LBB74_8
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
	b.ne	LBB74_3
LBB74_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	b.ne	LBB75_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB75_6
; %bb.2:
	cmp	w8, w9
	b.ne	LBB75_8
LBB75_3:
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
	b.eq	LBB75_3
LBB75_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
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
	b.mi	LBB76_3
LBB76_8:
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
	b.ne	LBB77_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB77_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB77_8
LBB77_3:
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
LBB77_4:
	cbz	x10, LBB77_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB77_7
LBB77_6:
	b	_vm_op_compare_setc_fallback
LBB77_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.hi	LBB77_3
LBB77_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	b.ne	LBB78_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB78_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB78_8
LBB78_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB78_4:
	cbz	x10, LBB78_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB78_7
LBB78_6:
	b	_vm_op_compare_setc_fallback
LBB78_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.gt	LBB78_3
LBB78_8:
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
	b.ne	LBB79_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB79_6
; %bb.2:
	cmp	w8, w9
	b.ge	LBB79_8
LBB79_3:
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
LBB79_4:
	cbz	x10, LBB79_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB79_7
LBB79_6:
	b	_vm_op_compare_setc_fallback
LBB79_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.lt	LBB79_3
LBB79_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
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
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, x1
	mov	x8, x0
	ldur	w11, [x20, #-4]
	and	w10, w11, #0xff
	ubfx	x12, x11, #8, #8
	ldr	x0, [x21, x12, lsl #3]
	mov	x12, x21
	cmp	w10, #40
	b.hi	LBB81_2
; %bb.1:
	ldr	x12, [x23, #16]
LBB81_2:
	lsr	x13, x11, #13
	and	x13, x13, #0x7fff8
	ldr	x1, [x12, x13]
	and	w11, w11, #0xff
	cmp	w11, #40
	b.gt	LBB81_5
; %bb.3:
	cmp	w11, #35
	b.eq	LBB81_7
; %bb.4:
	cmp	w11, #36
	b.eq	LBB81_8
	b	LBB81_11
LBB81_5:
	cmp	w11, #42
	b.eq	LBB81_8
; %bb.6:
	cmp	w11, #41
	b.ne	LBB81_11
LBB81_7:
	cmp	w8, #0
	cset	w10, ne
	mov	x2, x22
	bl	_val_eq
	eor	w8, w10, w0
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w9, uxtw #3]
	tbnz	w0, #0, LBB81_9
	b	LBB81_10
LBB81_8:
	cmp	w8, #0
	cset	w10, ne
	mov	x2, x22
	bl	_val_eq
	eor	w8, w10, w0
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w9, uxtw #3]
	tbnz	w0, #0, LBB81_10
LBB81_9:
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
LBB81_10:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB81_11:
	mov	x11, x8
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, LBB81_13
; %bb.12:
	cmp	w11, #0
	cset	w11, ne
	ldp	d1, d0, [sp]
	mov	x0, x10
	bl	_cmp_f64
	eor	w8, w11, w0
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w9, uxtw #3]
	cbnz	w0, LBB81_9
	b	LBB81_10
LBB81_13:
	mov	x0, x11
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function val_eq
_val_eq:                                ; @val_eq
	.cfi_startproc
; %bb.0:
	cmp	x0, x1
	b.ne	LBB82_2
; %bb.1:
	mov	w0, #1                          ; =0x1
	ret
LBB82_2:
	sub	sp, sp, #96
	str	x15, [sp, #16]                  ; 8-byte Folded Spill
	stp	x14, x13, [sp, #32]             ; 16-byte Folded Spill
	stp	x12, x11, [sp, #48]             ; 16-byte Folded Spill
	stp	x10, x9, [sp, #64]              ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w9, -24
	.cfi_offset w10, -32
	.cfi_offset w11, -40
	.cfi_offset w12, -48
	.cfi_offset w13, -56
	.cfi_offset w14, -64
	.cfi_offset w15, -80
	mov	x9, x1
	mov	x10, x0
	add	x3, sp, #24
	add	x4, sp, #8
	bl	_val_to_f64_pair
	cbz	w0, LBB82_5
; %bb.3:
	ldr	d0, [sp, #24]
	ldr	d1, [sp, #8]
	fcmp	d0, d1
LBB82_4:
	cset	w0, eq
	b	LBB82_11
LBB82_5:
	orr	x8, x9, x10
	mov	x16, #2                         ; =0x2
	movk	x16, #65534, lsl #48
	tst	x8, x16
	b.ne	LBB82_10
; %bb.6:
	ldr	x8, [x10]
	and	x16, x8, #0xff000000000000
	mov	x17, #281474976710656           ; =0x1000000000000
	cmp	x16, x17
	b.ne	LBB82_10
; %bb.7:
	ldr	x16, [x9]
	and	x0, x16, #0xff000000000000
	cmp	x0, x17
	b.ne	LBB82_10
; %bb.8:
	mov	w8, w8
	cmp	x8, w16, uxtw
	b.ne	LBB82_10
; %bb.9:
	sub	x2, x8, #9
	add	x0, x10, #8
	add	x1, x9, #8
	bl	_memcmp
	cmp	w0, #0
	b	LBB82_4
LBB82_10:
	mov	w0, #0                          ; =0x0
LBB82_11:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #64]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #48]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #32]             ; 16-byte Folded Reload
	ldr	x15, [sp, #16]                  ; 8-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function val_to_f64_pair
_val_to_f64_pair:                       ; @val_to_f64_pair
	.cfi_startproc
; %bb.0:
	and	x8, x2, x0
	cmp	x8, x2
	b.ne	LBB83_3
; %bb.1:
	scvtf	d0, w0
	str	d0, [x3]
	and	x8, x2, x1
	cmp	x8, x2
	b.ne	LBB83_5
LBB83_2:
	scvtf	d0, w1
	str	d0, [x4]
	mov	w0, #1                          ; =0x1
	ret
LBB83_3:
	cbz	x8, LBB83_7
; %bb.4:
	add	x8, x2, x0
	fmov	d0, x8
	str	d0, [x3]
	and	x8, x2, x1
	cmp	x8, x2
	b.eq	LBB83_2
LBB83_5:
	cbz	x8, LBB83_7
; %bb.6:
	add	x8, x2, x1
	fmov	d0, x8
	str	d0, [x4]
	mov	w0, #1                          ; =0x1
	ret
LBB83_7:
	mov	w0, #0                          ; =0x0
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function cmp_f64
_cmp_f64:                               ; @cmp_f64
	.cfi_startproc
; %bb.0:
	cmp	w0, #40
	b.gt	LBB84_5
; %bb.1:
	cmp	w0, #37
	b.gt	LBB84_9
; %bb.2:
	cmp	w0, #35
	b.eq	LBB84_15
; %bb.3:
	cmp	w0, #36
	b.eq	LBB84_8
LBB84_4:
	fcmp	d0, d1
	cset	w0, mi
	ret
LBB84_5:
	cmp	w0, #43
	b.gt	LBB84_12
; %bb.6:
	cmp	w0, #41
	b.eq	LBB84_15
; %bb.7:
	cmp	w0, #42
	b.ne	LBB84_4
LBB84_8:
	fcmp	d0, d1
	cset	w0, ne
	ret
LBB84_9:
	cmp	w0, #38
	b.eq	LBB84_16
; %bb.10:
	cmp	w0, #39
	b.eq	LBB84_14
LBB84_11:
	fcmp	d0, d1
	cset	w0, ge
	ret
LBB84_12:
	cmp	w0, #44
	b.eq	LBB84_16
; %bb.13:
	cmp	w0, #45
	b.ne	LBB84_11
LBB84_14:
	fcmp	d0, d1
	cset	w0, gt
	ret
LBB84_15:
	fcmp	d0, d1
	cset	w0, eq
	ret
LBB84_16:
	fcmp	d0, d1
	cset	w0, ls
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_dc_fallback
_vm_op_compare_dc_fallback:             ; @vm_op_compare_dc_fallback
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x1
	mov	x12, x0
	ldr	x0, [x21, w1, uxtw #3]
	sub	x9, x20, #4
	ldr	x10, [x23, #16]
	ldr	x1, [x10, w12, uxtw #3]
	ldurb	w10, [x20, #-8]
	cmp	w10, #40
	b.gt	LBB85_3
; %bb.1:
	cmp	w10, #35
	b.eq	LBB85_5
; %bb.2:
	cmp	w10, #36
	b.eq	LBB85_7
	b	LBB85_9
LBB85_3:
	cmp	w10, #42
	b.eq	LBB85_7
; %bb.4:
	cmp	w10, #41
	b.ne	LBB85_9
LBB85_5:
	mov	x2, x22
	bl	_val_eq
LBB85_6:
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, xzr, x8, ne
	csel	x9, x20, x9, ne
	b	LBB85_8
LBB85_7:
	mov	x2, x22
	bl	_val_eq
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, x8, xzr, ne
	csel	x9, x9, x20, ne
LBB85_8:
	ldr	w8, [x20, x8]
	and	x10, x8, #0xff
	ldr	x2, [x24, x10, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
	add	x20, x9, #4
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB85_9:
	mov	x11, x8
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, LBB85_11
; %bb.10:
	ldp	d1, d0, [sp]
	mov	x0, x10
	bl	_cmp_f64
	b	LBB85_6
LBB85_11:
	mov	x20, x9
	mov	x0, x12
	mov	x1, x11
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_dd_fallback
_vm_op_compare_dd_fallback:             ; @vm_op_compare_dd_fallback
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x1
	mov	x12, x0
	mov	x9, x20
	sub	x20, x20, #4
	ldr	x0, [x21, w1, uxtw #3]
	ldr	x1, [x21, w12, uxtw #3]
	ldurb	w10, [x9, #-8]
	cmp	w10, #40
	b.gt	LBB86_3
; %bb.1:
	cmp	w10, #35
	b.eq	LBB86_5
; %bb.2:
	cmp	w10, #36
	b.eq	LBB86_7
	b	LBB86_9
LBB86_3:
	cmp	w10, #42
	b.eq	LBB86_7
; %bb.4:
	cmp	w10, #41
	b.ne	LBB86_9
LBB86_5:
	mov	x2, x22
	bl	_val_eq
LBB86_6:
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, xzr, x8, ne
	csel	x10, x9, x20, ne
	b	LBB86_8
LBB86_7:
	mov	x2, x22
	bl	_val_eq
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, x8, xzr, ne
	csel	x10, x20, x9, ne
LBB86_8:
	ldr	w8, [x9, x8]
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	ubfx	x0, x8, #16, #16
	ubfx	w1, w8, #8, #8
	add	x20, x10, #4
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB86_9:
	mov	x11, x8
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, LBB86_11
; %bb.10:
	ldp	d1, d0, [sp]
	mov	x0, x10
	bl	_cmp_f64
	b	LBB86_6
LBB86_11:
	mov	x0, x12
	mov	x1, x11
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notanumber
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
	.quad	_vm_op_AddDC
	.quad	_vm_op_SubDC
	.quad	_vm_op_MulDC
	.quad	_vm_op_DivDC
	.quad	_vm_op_RemDC
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

.zerofill __DATA,__bss,_vm_op_Trap.edit_file,8,3 ; @vm_op_Trap.edit_file
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"file close failed"

l_.str.2:                               ; @.str.2
	.asciz	"[%u] 0x%llx\n"

l_.str.3:                               ; @.str.3
	.asciz	"[%u] %llu\n"

l_.str.4:                               ; @.str.4
	.asciz	"0x%llx != 0x%llx\n"

l_.str.5:                               ; @.str.5
	.asciz	"r%u = "

l_.str.7:                               ; @.str.7
	.asciz	"file path is not a string"

l_.str.8:                               ; @.str.8
	.asciz	"file already open"

l_.str.9:                               ; @.str.9
	.asciz	"r+b"

l_.str.10:                              ; @.str.10
	.asciz	"w+b"

l_.str.11:                              ; @.str.11
	.asciz	"file open failed"

l_.str.12:                              ; @.str.12
	.asciz	"file seek failed"

l_.str.13:                              ; @.str.13
	.asciz	"file offset out of range"

l_.str.14:                              ; @.str.14
	.asciz	"no open file"

l_.str.15:                              ; @.str.15
	.asciz	"file offset is not an int"

l_.str.16:                              ; @.str.16
	.asciz	"file byte is not an int"

l_.str.17:                              ; @.str.17
	.asciz	"file offset is negative"

l_.str.18:                              ; @.str.18
	.asciz	"file byte out of range"

l_.str.19:                              ; @.str.19
	.asciz	"file write failed"

l_.str.20:                              ; @.str.20
	.asciz	"file flush failed"

l_.str.21:                              ; @.str.21
	.asciz	"invalid bytecode"

l_.str.22:                              ; @.str.22
	.asciz	"panic: %s\n"

l_.str.23:                              ; @.str.23
	.asciz	"unused extra arguments"

l_.str.24:                              ; @.str.24
	.asciz	"assertion failed"

l_.str.25:                              ; @.str.25
	.asciz	"invalid trap id"

l_.str.26:                              ; @.str.26
	.asciz	"bad opcode"

l_.str.27:                              ; @.str.27
	.asciz	"unimplemented"

l_.str.28:                              ; @.str.28
	.asciz	"stack overflow"

l_.str.29:                              ; @.str.29
	.asciz	"invalid layout"

l_.str.30:                              ; @.str.30
	.asciz	"not a offset"

l_.str.31:                              ; @.str.31
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
