	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
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
	orr	x8, x9, #0x1
	stp	x8, xzr, [x0, #80]
	ldr	x8, [x9, #32]
	str	x8, [x0, #16]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	lsr	w0, w8, #16
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
	cmp	w1, #11
	b.hi	LBB1_37
; %bb.1:
	mov	x19, x0
	mov	w8, w1
Lloh2:
	adrp	x9, lJTI1_0@PAGE
Lloh3:
	add	x9, x9, lJTI1_0@PAGEOFF
	adr	x10, LBB1_2
	ldrb	w11, [x9, x8]
	add	x10, x10, x11, lsl #2
	br	x10
LBB1_2:
	lsr	w27, w19, #8
	cmp	w27, w19, uxtb
	b.ls	LBB1_33
; %bb.3:
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
LBB1_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x28]
	ldr	x8, [x21, x19, lsl #3]
	stp	x19, x8, [sp]
	mov	x1, x26
	bl	_fprintf
	add	x19, x19, #1
	cmp	x27, x19
	b.ne	LBB1_4
	b	LBB1_33
LBB1_5:
	ldr	x8, [x23]
	ldr	x0, [x8]
	bl	_heap_stat_print
	b	LBB1_33
LBB1_6:
                                        ; kill: def $w19 killed $w19 killed $x19 def $x19
Lloh10:
	adrp	x26, ___stderrp@GOTPAGE
Lloh11:
	ldr	x26, [x26, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x26]
	and	x19, x19, #0xff
	str	x19, [sp]
Lloh12:
	adrp	x1, l_.str.5@PAGE
Lloh13:
	add	x1, x1, l_.str.5@PAGEOFF
	bl	_fprintf
	ldr	x0, [x26]
	ldr	x1, [x21, x19, lsl #3]
	bl	_obj_print
	ldr	x1, [x26]
	mov	w0, #10                         ; =0xa
	bl	_fputc
	b	LBB1_33
LBB1_7:
	adrp	x26, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x26, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, LBB1_35
; %bb.8:
	and	w8, w19, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	bics	xzr, x22, x8
	b.ne	LBB1_41
; %bb.9:
	lsr	w9, w19, #8
	ldr	x19, [x21, w9, uxtw #3]
	bics	xzr, x22, x19
	b.ne	LBB1_42
; %bb.10:
	tbnz	w8, #31, LBB1_44
; %bb.11:
	cmp	w19, #256
	b.hs	LBB1_46
; %bb.12:
	and	x1, x8, #0x7fffffff
	mov	w2, #0                          ; =0x0
	bl	_fseek
	cbnz	w0, LBB1_48
; %bb.13:
	ldr	x1, [x26, _vm_op_Trap.edit_file@PAGEOFF]
	mov	x0, x19
	bl	_fputc
	cmn	w0, #1
	b.eq	LBB1_49
; %bb.14:
	ldr	x0, [x26, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fflush
	cbz	w0, LBB1_33
; %bb.15:
Lloh14:
	adrp	x25, l_.str.20@PAGE
Lloh15:
	add	x25, x25, l_.str.20@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_16:
	and	x8, x19, #0xff
	ldr	x8, [x21, x8, lsl #3]
	add	x9, x22, #7
	and	x9, x8, x9
	cmp	x8, #5
	ccmp	x9, #5, #0, ne
	b.ne	LBB1_34
; %bb.17:
	adrp	x8, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, LBB1_35
; %bb.18:
	str	xzr, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fclose
	cbz	w0, LBB1_33
	b	LBB1_36
LBB1_19:
	adrp	x8, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, LBB1_21
; %bb.20:
	str	xzr, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fclose
	cbnz	w0, LBB1_36
LBB1_21:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
LBB1_22:
	and	w8, w19, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	add	x9, x22, #7
	and	x9, x8, x9
	cmp	x9, #5
	b.ne	LBB1_34
; %bb.23:
	subs	x28, x8, #5
	b.eq	LBB1_34
; %bb.24:
	adrp	x27, _vm_op_Trap.edit_file@PAGE
	ldr	x8, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	cbnz	x8, LBB1_43
; %bb.25:
	bl	___error
	str	wzr, [x0]
Lloh16:
	adrp	x1, l_.str.9@PAGE
Lloh17:
	add	x1, x1, l_.str.9@PAGEOFF
	add	x0, x28, #8
	bl	_fopen
	cbnz	x0, LBB1_28
; %bb.26:
	bl	___error
	ldr	w8, [x0]
	cmp	w8, #2
	b.ne	LBB1_50
; %bb.27:
Lloh18:
	adrp	x1, l_.str.10@PAGE
Lloh19:
	add	x1, x1, l_.str.10@PAGEOFF
	add	x0, x28, #8
	bl	_fopen
	cbz	x0, LBB1_50
LBB1_28:
	mov	x26, x0
	mov	x1, #0                          ; =0x0
	mov	w2, #2                          ; =0x2
	bl	_fseek
	cbnz	w0, LBB1_45
; %bb.29:
	mov	x0, x26
	bl	_ftell
	lsr	x8, x0, #31
	cbnz	x8, LBB1_47
; %bb.30:
	lsr	w8, w19, #8
	str	x26, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	orr	x9, x0, #0xfffe000000000000
	str	x9, [x21, w8, uxtw #3]
	b	LBB1_33
LBB1_31:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_diverge
LBB1_32:
	and	w8, w19, #0xff
	lsr	w9, w19, #8
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x8, x9
	b.ne	LBB1_40
LBB1_33:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB1_34:
Lloh20:
	adrp	x25, l_.str.7@PAGE
Lloh21:
	add	x25, x25, l_.str.7@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_35:
Lloh22:
	adrp	x25, l_.str.14@PAGE
Lloh23:
	add	x25, x25, l_.str.14@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_36:
Lloh24:
	adrp	x25, l_.str@PAGE
Lloh25:
	add	x25, x25, l_.str@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_37:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_invalidtrap
LBB1_38:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_unusedexta
LBB1_39:
	mov	x0, x19
	mov	w1, #0                          ; =0x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_undefined
LBB1_40:
Lloh26:
	adrp	x10, ___stderrp@GOTPAGE
Lloh27:
	ldr	x10, [x10, ___stderrp@GOTPAGEOFF]
Lloh28:
	ldr	x0, [x10]
	stp	x8, x9, [sp]
Lloh29:
	adrp	x1, l_.str.4@PAGE
Lloh30:
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_assertionfailed
LBB1_41:
Lloh31:
	adrp	x25, l_.str.15@PAGE
Lloh32:
	add	x25, x25, l_.str.15@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_42:
Lloh33:
	adrp	x25, l_.str.16@PAGE
Lloh34:
	add	x25, x25, l_.str.16@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_43:
Lloh35:
	adrp	x25, l_.str.8@PAGE
Lloh36:
	add	x25, x25, l_.str.8@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_44:
Lloh37:
	adrp	x25, l_.str.17@PAGE
Lloh38:
	add	x25, x25, l_.str.17@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_45:
	mov	x0, x26
	bl	_fclose
Lloh39:
	adrp	x25, l_.str.12@PAGE
Lloh40:
	add	x25, x25, l_.str.12@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_46:
Lloh41:
	adrp	x25, l_.str.18@PAGE
Lloh42:
	add	x25, x25, l_.str.18@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_47:
	mov	x0, x26
	bl	_fclose
Lloh43:
	adrp	x25, l_.str.13@PAGE
Lloh44:
	add	x25, x25, l_.str.13@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_48:
Lloh45:
	adrp	x25, l_.str.12@PAGE
Lloh46:
	add	x25, x25, l_.str.12@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_49:
Lloh47:
	adrp	x25, l_.str.19@PAGE
Lloh48:
	add	x25, x25, l_.str.19@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
LBB1_50:
Lloh49:
	adrp	x25, l_.str.11@PAGE
Lloh50:
	add	x25, x25, l_.str.11@PAGEOFF
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpLdrGot	Lloh10, Lloh11
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh29, Lloh30
	.loh AdrpLdrGotLdr	Lloh26, Lloh27, Lloh28
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
	.cfi_endproc
	.section	__TEXT,__const
lJTI1_0:
	.byte	(LBB1_39-LBB1_2)>>2
	.byte	(LBB1_31-LBB1_2)>>2
	.byte	(LBB1_19-LBB1_2)>>2
	.byte	(LBB1_38-LBB1_2)>>2
	.byte	(LBB1_2-LBB1_2)>>2
	.byte	(LBB1_2-LBB1_2)>>2
	.byte	(LBB1_32-LBB1_2)>>2
	.byte	(LBB1_6-LBB1_2)>>2
	.byte	(LBB1_5-LBB1_2)>>2
	.byte	(LBB1_22-LBB1_2)>>2
	.byte	(LBB1_16-LBB1_2)>>2
	.byte	(LBB1_7-LBB1_2)>>2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	5                               ; -- Begin function vm_op_Nop
_vm_op_Nop:                             ; @vm_op_Nop
	.cfi_startproc
; %bb.0:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	orr	x8, x22, x8
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	orr	x8, x22, x8
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadR
_vm_op_LoadR:                           ; @vm_op_LoadR
	.cfi_startproc
; %bb.0:
	cmp	w0, #7
	b.hi	LBB6_3
; %bb.1:
	mov	w8, #1                          ; =0x1
	lsl	w8, w8, w0
	mov	w9, #197                        ; =0xc5
	tst	w8, w9
	b.eq	LBB6_3
; %bb.2:
	mov	w8, w0
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB6_3:
	b	_badop
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
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadType
_vm_op_LoadType:                        ; @vm_op_LoadType
	.cfi_startproc
; %bb.0:
	ldr	x9, [x23]
	mov	w8, w0
	ldr	x10, [x9, #40]
	cmp	x10, x8
	b.ls	LBB8_2
; %bb.1:
	ldr	x9, [x9, #24]
	ldr	x8, [x9, x8, lsl #3]
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB8_2:
	b	_badop
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadFree
_vm_op_LoadFree:                        ; @vm_op_LoadFree
	.cfi_startproc
; %bb.0:
	ldur	x8, [x21, #-16]
	cbz	w0, LBB9_3
; %bb.1:
	sub	x8, x8, #1
	ldr	w9, [x8, #48]
	cmp	w9, w0
	b.lo	LBB9_4
; %bb.2:
	mov	w9, w0
	add	x8, x8, x9, lsl #3
	ldr	x8, [x8, #48]
LBB9_3:
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB9_4:
	b	_badop
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadField
_vm_op_LoadField:                       ; @vm_op_LoadField
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, x1
	and	w8, w0, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x10, [x23, #16]
	lsr	w11, w0, #8
	ldr	x1, [x10, w11, uxtw #3]
	mov	x0, x8
	bl	_member_slot
	cbz	x0, LBB10_2
; %bb.1:
	ldr	x8, [x0]
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB10_2:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_nomember
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetField
_vm_op_SetField:                        ; @vm_op_SetField
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x10, x1
	and	w8, w0, #0xff
	ldr	x9, [x21, w8, uxtw #3]
	ldr	x8, [x23, #16]
	lsr	w11, w0, #8
	ldr	x1, [x8, w11, uxtw #3]
	mov	x0, x9
	bl	_member_slot
	cbz	x0, LBB11_4
; %bb.1:
	mov	x8, x0
	ldr	x11, [x23]
	ldr	x0, [x11]
	ldr	x1, [x21, w10, uxtw #3]
	str	x1, [x8]
	ldr	w8, [x0, #40]
	cmp	w8, #1
	b.ne	LBB11_3
; %bb.2:
	and	x8, x9, #0xfffffffffffffff8
	ldr	x8, [x8]
	and	x8, x8, #0x300
	cmp	x8, #512
	b.eq	LBB11_5
LBB11_3:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB11_4:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_nomember
LBB11_5:
	bl	_gc_store_field_slow
	b	LBB11_3
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
	lsr	w0, w8, #16
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
	ldr	x10, [x21, w1, uxtw #3]
	add	x8, x22, #7
	and	x8, x10, x8
	cmp	x8, #1
	b.ne	LBB13_4
; %bb.1:
	mov	x9, x20
	mov	w11, w1
	ldur	x20, [x10, #15]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, LBB13_5
; %bb.2:
	add	x8, x21, x11, lsl #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.hs	LBB13_6
LBB13_3:
	stp	x10, x9, [x21, #-16]
	ldur	x8, [x10, #31]
	str	x8, [x23, #16]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB13_4:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notafunction
LBB13_5:
	mov	x0, x23
	mov	x1, x21
	mov	w2, #256                        ; =0x100
	bl	_gc_poll_slow
	add	x8, x21, x11, lsl #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.lo	LBB13_3
LBB13_6:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_stackoverflow
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Invoke
_vm_op_Invoke:                          ; @vm_op_Invoke
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x9, x1
	mov	x10, x0
	and	w8, w0, #0xff
	ldr	x0, [x21, w8, uxtw #3]
	ldr	x8, [x23, #16]
	lsr	w11, w10, #8
	ldr	x1, [x8, w11, uxtw #3]
	bl	_member_slot
	cbz	x0, LBB14_2
; %bb.1:
	ldr	x8, [x0]
	str	x8, [x21, w9, uxtw #3]
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_vm_op_Apply
LBB14_2:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_nomember
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
	tbz	w8, #0, LBB15_3
; %bb.1:
	add	x8, x21, w1, uxtw #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.hs	LBB15_4
LBB15_2:
	orr	x8, x10, #0x1
	stp	x8, x9, [x21, #-16]
	ldr	x8, [x10, #32]
	str	x8, [x23, #16]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB15_3:
	mov	x0, x23
	mov	x11, x1
	mov	x1, x21
	mov	w2, #256                        ; =0x100
	bl	_gc_poll_slow
	mov	x1, x11
	add	x8, x21, w1, uxtw #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.lo	LBB15_2
LBB15_4:
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
	ldur	x9, [x9, #31]
	str	x9, [x23, #16]
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	lsr	w0, w9, #16
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
	ldur	x9, [x9, #31]
	str	x9, [x23, #16]
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	lsr	w0, w9, #16
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
	cbz	w0, LBB18_8
; %bb.1:
	mov	w10, w0
	cmp	w0, #8
	b.hs	LBB18_3
; %bb.2:
	mov	x11, #0                         ; =0x0
	b	LBB18_6
LBB18_3:
	add	x12, x21, w1, uxtw #3
	and	x11, x10, #0xfff8
	add	x13, x21, #16
	mov	x14, x11
LBB18_4:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x12]
	ldp	q2, q3, [x12, #32]
	stp	q0, q1, [x13, #-32]
	stp	q2, q3, [x13], #64
	add	x12, x12, #64
	subs	x14, x14, #8
	b.ne	LBB18_4
; %bb.5:
	cmp	x11, x10
	b.eq	LBB18_8
LBB18_6:
	add	x12, x21, x11, lsl #3
	sub	x10, x10, x11
LBB18_7:                                ; =>This Inner Loop Header: Depth=1
	ldr	x11, [x12, w1, uxtw #3]
	stur	x11, [x12, #-16]
	add	x12, x12, #8
	subs	x10, x10, #1
	b.ne	LBB18_7
LBB18_8:
	ldurb	w10, [x8, #-3]
	sub	x21, x9, x10, lsl #3
	ldur	x9, [x21, #-16]
	ldur	x9, [x9, #31]
	str	x9, [x23, #16]
	ldr	w9, [x8]
	and	x10, x9, #0xff
	ldr	x2, [x24, x10, lsl #3]
	lsr	w0, w9, #16
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
	ldr	x12, [x23]
	ldr	x11, [x25, w0, uxtw #3]
	mov	x0, x23
	mov	x1, x11
	mov	x2, x21
	bl	_thunk_alloc_instance
	mov	x10, x0
	ldr	w13, [x11, #48]
	cbz	w13, LBB19_4
; %bb.1:
	add	x11, x11, #56
	add	x14, x10, #56
LBB19_2:                                ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x11], #8
	add	x2, sp, #8
	mov	x1, x21
	bl	_capture_loc_resolve
	tbz	w0, #0, LBB19_6
; %bb.3:                                ;   in Loop: Header=BB19_2 Depth=1
	ldr	x8, [sp, #8]
	str	x8, [x14], #8
	subs	x13, x13, #1
	b.ne	LBB19_2
LBB19_4:
	ldr	x0, [x12]
	mov	x1, x10
	bl	_gc_publish_new_object
	orr	x8, x10, #0x1
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, LBB19_7
LBB19_5:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB19_6:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_badop
LBB19_7:
	ldr	w2, [x10, #4]
	mov	x0, x23
	mov	x1, x21
	bl	_gc_poll_slow
	b	LBB19_5
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_WObj
_vm_op_WObj:                            ; @vm_op_WObj
	.cfi_startproc
; %bb.0:
	and	w10, w0, #0xff
	cmp	w10, #5
	b.hs	LBB20_26
; %bb.1:
	mov	x9, x1
	mov	x12, x0
	ldr	x14, [x23]
	lsr	w15, w0, #8
	cmp	w10, #3
	b.ne	LBB20_3
; %bb.2:
	ldr	x8, [x21, w9, uxtw #3]
	and	x8, x8, #0xfffffffffffffff8
	ldp	w8, w11, [x8]
	sub	w8, w11, w8
	add	w8, w8, #1
	mov	x26, x15
	cmp	w15, w8
	b.eq	LBB20_7
	b	LBB20_26
LBB20_3:
	mov	x26, x15
	cmp	w10, #4
	b.ne	LBB20_7
; %bb.4:
	ldr	x8, [x21, w9, uxtw #3]
	add	x11, x22, #7
	and	x11, x8, x11
	cmp	x11, #4
	b.ne	LBB20_26
; %bb.5:
	ldur	x8, [x8, #12]
	and	x8, x8, #0xfffffffffffffff8
	ldr	w11, [x8]
	add	w11, w11, #1
	cmp	w15, w11
	b.ne	LBB20_26
; %bb.6:
	ldr	w8, [x8, #4]
	add	w26, w8, #1
LBB20_7:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w13, w26
	lsl	w8, w26, #3
	add	w19, w8, #23
	and	x0, x19, #0xfffffff8
	mov	x1, x23
	mov	x2, x21
	bl	_alloc_object
	mov	x11, x0
	mov	x1, x10
	mov	x2, x13
	bl	_object_init
	cmp	w12, #256
	b.lo	LBB20_13
; %bb.8:
	mov	w8, w9
	cmp	w12, #2560
	b.lo	LBB20_10
; %bb.9:
	lsl	x12, x8, #3
	add	x13, x12, x21
	sub	x12, x11, x13
	add	x12, x12, #16
	cmp	x12, #64
	b.hs	LBB20_23
LBB20_10:
	mov	x12, #0                         ; =0x0
LBB20_11:
	lsl	x13, x12, #3
	add	x8, x13, x8, lsl #3
	add	x8, x21, x8
	add	x13, x13, x11
	add	x13, x13, #16
	sub	x12, x15, x12
LBB20_12:                               ; =>This Inner Loop Header: Depth=1
	ldr	x16, [x8], #8
	str	x16, [x13], #8
	subs	x12, x12, #1
	b.ne	LBB20_12
LBB20_13:
	cmp	w26, w15
	b.ls	LBB20_21
; %bb.14:
	ldr	x8, [x21, w9, uxtw #3]
	sub	x8, x8, #4
	mvn	w12, w15
	add	w13, w26, w12
	mov	x12, x15
	cmp	w13, #7
	b.lo	LBB20_19
; %bb.15:
	lsl	x12, x15, #3
	add	x17, x12, x11
	sub	x12, x17, x8
	sub	x16, x12, #8
	mov	x12, x15
	cmp	x16, #64
	b.lo	LBB20_19
; %bb.16:
	add	x13, x13, #1
	and	x16, x13, #0x1fffffff8
	add	x12, x16, x15
	add	x17, x17, #64
	add	x27, x8, #40
	mov	x28, x16
LBB20_17:                               ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x27, #-16]
	ldp	q2, q3, [x27, #16]
	stp	q0, q1, [x17, #-48]
	stp	q2, q3, [x17, #-16]
	add	x17, x17, #64
	add	x27, x27, #64
	subs	x28, x28, #8
	b.ne	LBB20_17
; %bb.18:
	cmp	x13, x16
	b.eq	LBB20_21
LBB20_19:
	lsl	x16, x12, #3
	add	x13, x16, x11
	add	x13, x13, #16
	sub	w12, w26, w12
	sub	x15, x16, x15, lsl #3
	add	x8, x15, x8
	add	x8, x8, #24
LBB20_20:                               ; =>This Inner Loop Header: Depth=1
	ldr	x15, [x8], #8
	str	x15, [x13], #8
	subs	w12, w12, #1
	b.ne	LBB20_20
LBB20_21:
	ldr	x0, [x14]
	mov	x1, x11
	bl	_gc_publish_new_object
	orr	x8, x11, #0x4
	cmp	w10, #3
	csel	x8, x8, x11, eq
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, LBB20_27
LBB20_22:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
LBB20_23:
	and	x12, x15, #0xf8
	add	x13, x13, #32
	add	x16, x11, #32
	mov	x17, x12
LBB20_24:                               ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x13, #-32]
	ldp	q2, q3, [x13], #64
	stp	q0, q1, [x16, #-16]
	stp	q2, q3, [x16, #16]
	add	x16, x16, #64
	subs	x17, x17, #8
	b.ne	LBB20_24
; %bb.25:
	cmp	x12, x15
	b.eq	LBB20_13
	b	LBB20_11
LBB20_26:
	b	_invalidlayout
LBB20_27:
	and	x2, x19, #0xfffffff8
	mov	x0, x23
	mov	x1, x21
	bl	_gc_poll_slow
	b	LBB20_22
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
	lsr	w0, w8, #16
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
	b.ne	LBB22_2
; %bb.1:
	lsl	x8, x8, #32
	add	x20, x20, x8, asr #30
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB22_2:
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
	b.ne	LBB23_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB23_3
; %bb.2:
	adds	w8, w8, w9
	b.vc	LBB23_8
LBB23_3:
	b	_vm_op_arith_dc_fallback
LBB23_4:
	cbz	x10, LBB23_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB23_7
LBB23_6:
	b	_vm_op_arith_dc_fallback
LBB23_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fadd	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB23_9
LBB23_8:
	orr	x8, x22, x8
LBB23_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB24_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB24_3
; %bb.2:
	subs	w8, w8, w9
	b.vc	LBB24_8
LBB24_3:
	b	_vm_op_arith_dc_fallback
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
	fsub	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB24_9
LBB24_8:
	orr	x8, x22, x8
LBB24_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB25_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB25_3
; %bb.2:
	smull	x8, w8, w9
	cmp	x8, w8, sxtw
	b.eq	LBB25_8
LBB25_3:
	b	_vm_op_arith_dc_fallback
LBB25_4:
	cbz	x10, LBB25_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB25_7
LBB25_6:
	b	_vm_op_arith_dc_fallback
LBB25_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fmul	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB25_9
LBB25_8:
	mov	w8, w8
	orr	x8, x22, x8
LBB25_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB26_5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB26_7
; %bb.2:
	cbz	w9, LBB26_7
; %bb.3:
	mov	w10, #-2147483648               ; =0x80000000
	cmp	w8, w10
	ccmn	w9, #1, #0, eq
	b.eq	LBB26_7
; %bb.4:
	sdiv	w10, w8, w9
	msub	w11, w10, w9, w8
	eor	w8, w9, w8
	cmp	w8, #0
	ccmp	w11, #0, #4, lt
	cset	w8, ne
	sub	w8, w10, w8
	orr	x8, x22, x8
	b	LBB26_9
LBB26_5:
	cbz	x10, LBB26_7
; %bb.6:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB26_8
LBB26_7:
	b	_vm_op_arith_dc_fallback
LBB26_8:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fdiv	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
LBB26_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB27_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB27_6
; %bb.2:
	cbz	w9, LBB27_6
; %bb.3:
	sdiv	w10, w8, w9
	msub	w10, w10, w9, w8
	eor	w8, w9, w8
	and	w8, w9, w8, asr #31
	add	w8, w10, w8
	cmp	w10, #0
	csel	w8, wzr, w8, eq
	orr	x8, x22, x8
	b	LBB27_8
LBB27_4:
	cbz	x10, LBB27_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB27_7
LBB27_6:
	b	_vm_op_arith_dc_fallback
LBB27_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	fmov	x8, d0
	sub	x8, x8, x22
LBB27_8:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB28_4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB28_3
; %bb.2:
	adds	w8, w9, w8
	b.vc	LBB28_8
LBB28_3:
	b	_vm_op_arith_dd_fallback
LBB28_4:
	cbz	x10, LBB28_6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB28_7
LBB28_6:
	b	_vm_op_arith_dd_fallback
LBB28_7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fadd	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB28_9
LBB28_8:
	orr	x8, x22, x8
LBB28_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB29_4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB29_3
; %bb.2:
	subs	w8, w9, w8
	b.vc	LBB29_8
LBB29_3:
	b	_vm_op_arith_dd_fallback
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
	fsub	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB29_9
LBB29_8:
	orr	x8, x22, x8
LBB29_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB30_4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB30_3
; %bb.2:
	smull	x8, w9, w8
	cmp	x8, w8, sxtw
	b.eq	LBB30_8
LBB30_3:
	b	_vm_op_arith_dd_fallback
LBB30_4:
	cbz	x10, LBB30_6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB30_7
LBB30_6:
	b	_vm_op_arith_dd_fallback
LBB30_7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fmul	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	LBB30_9
LBB30_8:
	mov	w8, w8
	orr	x8, x22, x8
LBB30_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB31_5
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB31_7
; %bb.2:
	cbz	w8, LBB31_7
; %bb.3:
	mov	w10, #-2147483648               ; =0x80000000
	cmp	w9, w10
	ccmn	w8, #1, #0, eq
	b.eq	LBB31_7
; %bb.4:
	sdiv	w10, w9, w8
	msub	w11, w10, w8, w9
	eor	w8, w8, w9
	cmp	w8, #0
	ccmp	w11, #0, #4, lt
	cset	w8, ne
	sub	w8, w10, w8
	orr	x8, x22, x8
	b	LBB31_9
LBB31_5:
	cbz	x10, LBB31_7
; %bb.6:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB31_8
LBB31_7:
	b	_vm_op_arith_dd_fallback
LBB31_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fdiv	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
LBB31_9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB32_4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	LBB32_6
; %bb.2:
	cbz	w8, LBB32_6
; %bb.3:
	sdiv	w10, w9, w8
	msub	w10, w10, w8, w9
	eor	w9, w8, w9
	and	w8, w8, w9, asr #31
	add	w8, w10, w8
	cmp	w10, #0
	csel	w8, wzr, w8, eq
	orr	x8, x22, x8
	b	LBB32_8
LBB32_4:
	cbz	x10, LBB32_6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB32_7
LBB32_6:
	b	_vm_op_arith_dd_fallback
LBB32_7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	fmov	x8, d0
	sub	x8, x8, x22
LBB32_8:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB33_2
; %bb.1:
	mov	w9, #-2147483648                ; =0x80000000
	mov	x10, #4746794007248502784       ; =0x41e0000000000000
	sub	x10, x10, x22
	neg	w11, w8
	orr	x11, x11, x22
	cmp	w8, w9
	csel	x8, x10, x11, eq
	b	LBB33_4
LBB33_2:
	cbz	x9, LBB33_5
; %bb.3:
	add	x8, x8, x22
	eor	x8, x8, #0x8000000000000000
	sub	x8, x8, x22
LBB33_4:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB33_5:
	b	_vm_op_arith_dd_fallback
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCond
_vm_op_SetCond:                         ; @vm_op_SetCond
	.cfi_startproc
; %bb.0:
	strb	wzr, [x23, #56]
	ldrb	w8, [x20], #4
	sub	w8, w8, #35
	cmp	w8, #15
	b.hs	LBB34_2
; %bb.1:
Lloh51:
	adrp	x9, _dispatch_setc@PAGE
Lloh52:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
LBB34_2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh51, Lloh52
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCondJ
_vm_op_SetCondJ:                        ; @vm_op_SetCondJ
	.cfi_startproc
; %bb.0:
	mov	w8, #1                          ; =0x1
	strb	w8, [x23, #56]
	ldrb	w8, [x20], #4
	sub	w8, w8, #35
	cmp	w8, #15
	b.hs	LBB35_2
; %bb.1:
Lloh53:
	adrp	x9, _dispatch_setc@PAGE
Lloh54:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
LBB35_2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh53, Lloh54
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
	lsr	w0, w9, #16
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
	b.ne	LBB37_2
; %bb.1:
	cmp	w9, w0, sxth
	b	LBB37_4
LBB37_2:
	cbz	x10, LBB37_5
; %bb.3:
	add	x9, x9, x22
	fmov	d0, x9
	sxth	w9, w0
	scvtf	d1, w9
	fcmp	d0, d1
LBB37_4:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, eq
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB37_5:
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
	b.ne	LBB38_2
; %bb.1:
	cmp	w9, w0, sxth
	b	LBB38_4
LBB38_2:
	cbz	x10, LBB38_5
; %bb.3:
	add	x9, x9, x22
	fmov	d0, x9
	sxth	w9, w0
	scvtf	d1, w9
	fcmp	d0, d1
LBB38_4:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, ne
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB38_5:
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
	b.ne	LBB39_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB39_7
; %bb.2:
	cmp	w9, w10
	b.eq	LBB39_4
LBB39_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB39_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.eq	LBB39_4
	b	LBB39_3
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
	b.ne	LBB40_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB40_7
; %bb.2:
	cmp	w9, w10
	b.ne	LBB40_4
LBB40_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB40_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB40_4
	b	LBB40_3
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
	b.ne	LBB41_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB41_7
; %bb.2:
	cmp	w9, w10
	b.lt	LBB41_4
LBB41_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB41_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.pl	LBB41_3
	b	LBB41_4
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
	b.ne	LBB42_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB42_7
; %bb.2:
	cmp	w9, w10
	b.le	LBB42_4
LBB42_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB42_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB42_5:
	cbz	x11, LBB42_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB42_8
LBB42_7:
	b	_vm_op_compare_dc_fallback
LBB42_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.hi	LBB42_3
	b	LBB42_4
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
	b.ne	LBB43_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB43_7
; %bb.2:
	cmp	w9, w10
	b.gt	LBB43_4
LBB43_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB43_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB43_5:
	cbz	x11, LBB43_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB43_8
LBB43_7:
	b	_vm_op_compare_dc_fallback
LBB43_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.le	LBB43_3
	b	LBB43_4
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
	b.ne	LBB44_5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	LBB44_7
; %bb.2:
	cmp	w9, w10
	b.ge	LBB44_4
LBB44_3:
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
LBB44_4:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB44_5:
	cbz	x11, LBB44_7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB44_8
LBB44_7:
	b	_vm_op_compare_dc_fallback
LBB44_8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.lt	LBB44_3
	b	LBB44_4
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
	b.ne	LBB45_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB45_5
; %bb.2:
	cmp	w10, w9
	b	LBB45_7
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
LBB45_7:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, eq
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	csel	x20, x20, x8, ne
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB47_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB47_5
; %bb.2:
	cmp	w10, w9
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, lt
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
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
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, mi
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB48_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB48_5
; %bb.2:
	cmp	w10, w9
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, le
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB48_3:
	cbz	x11, LBB48_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB48_6
LBB48_5:
	b	_vm_op_compare_dd_fallback
LBB48_6:
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
	lsr	w0, w8, #16
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
	b.ne	LBB49_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB49_5
; %bb.2:
	cmp	w10, w9
	b	LBB49_7
LBB49_3:
	cbz	x11, LBB49_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB49_6
LBB49_5:
	b	_vm_op_compare_dd_fallback
LBB49_6:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
LBB49_7:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, gt
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB50_3
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB50_5
; %bb.2:
	cmp	w10, w9
	b	LBB50_7
LBB50_3:
	cbz	x11, LBB50_5
; %bb.4:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	LBB50_6
LBB50_5:
	b	_vm_op_compare_dd_fallback
LBB50_6:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
LBB50_7:
	asr	w8, w8, #8
	add	x8, x20, w8, sxtw #2
	csel	x20, x20, x8, ge
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function undefined
_undefined:                             ; @undefined
	.cfi_startproc
; %bb.0:
Lloh55:
	adrp	x25, l_.str.21@PAGE
Lloh56:
	add	x25, x25, l_.str.21@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh55, Lloh56
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function diverge
_diverge:                               ; @diverge
	.cfi_startproc
; %bb.0:
LBB52_1:                                ; =>This Inner Loop Header: Depth=1
	b	LBB52_1
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
Lloh57:
	adrp	x8, ___stderrp@GOTPAGE
Lloh58:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh59:
	ldr	x0, [x8]
	str	x25, [sp]
Lloh60:
	adrp	x1, l_.str.22@PAGE
Lloh61:
	add	x1, x1, l_.str.22@PAGEOFF
	bl	_fprintf
	mov	w0, #255                        ; =0xff
	bl	_exit
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpLdrGotLdr	Lloh57, Lloh58, Lloh59
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
	.cfi_startproc
; %bb.0:
Lloh62:
	adrp	x25, l_.str.23@PAGE
Lloh63:
	add	x25, x25, l_.str.23@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh62, Lloh63
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
	.cfi_startproc
; %bb.0:
Lloh64:
	adrp	x25, l_.str.24@PAGE
Lloh65:
	add	x25, x25, l_.str.24@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh64, Lloh65
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
	.cfi_startproc
; %bb.0:
Lloh66:
	adrp	x25, l_.str.25@PAGE
Lloh67:
	add	x25, x25, l_.str.25@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh66, Lloh67
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function badop
_badop:                                 ; @badop
	.cfi_startproc
; %bb.0:
Lloh68:
	adrp	x25, l_.str.26@PAGE
Lloh69:
	add	x25, x25, l_.str.26@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh68, Lloh69
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function member_slot
_member_slot:                           ; @member_slot
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	mov	x0, #0                          ; =0x0
	cbz	x8, LBB58_11
; %bb.1:
	and	x16, x8, #0xfffffffffffffffe
	and	x16, x16, #0xfffe000000000003
	cbnz	x16, LBB58_11
; %bb.2:
	str	x15, [sp, #-128]!               ; 8-byte Folded Spill
	stp	x14, x13, [sp, #16]             ; 16-byte Folded Spill
	stp	x12, x11, [sp, #32]             ; 16-byte Folded Spill
	stp	x10, x9, [sp, #48]              ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w9, -72
	.cfi_offset w10, -80
	.cfi_offset w11, -88
	.cfi_offset w12, -96
	.cfi_offset w13, -104
	.cfi_offset w14, -112
	.cfi_offset w15, -128
	and	x20, x8, #0x1fffffffffff8
	ldrb	w8, [x20]
	cmp	x8, #4
	b.ne	LBB58_9
; %bb.3:
	ldr	x8, [x20, #16]!
	ldur	x8, [x8, #12]
	and	x8, x8, #0xfffffffffffffff8
	ldr	w21, [x8, #8]
	cbz	w21, LBB58_9
; %bb.4:
	sub	x22, x1, #5
	ldur	w16, [x1, #-1]
	sub	x19, x16, #9
	add	x23, x8, #28
	b	LBB58_6
LBB58_5:                                ;   in Loop: Header=BB58_6 Depth=1
	add	x23, x23, #16
	subs	x21, x21, #1
	b.eq	LBB58_9
LBB58_6:                                ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x23, #-4]
	cmp	x19, x8
	b.ne	LBB58_5
; %bb.7:                                ;   in Loop: Header=BB58_6 Depth=1
	ldur	x0, [x23, #-12]
	add	x1, x22, #8
	mov	x2, x19
	bl	_memcmp
	cbnz	w0, LBB58_5
; %bb.8:
	ldr	w8, [x23]
	add	w8, w8, #1
	add	x0, x20, w8, uxtw #3
	b	LBB58_10
LBB58_9:
	mov	x0, #0                          ; =0x0
LBB58_10:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #48]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #32]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #16]             ; 16-byte Folded Reload
	ldr	x15, [sp], #128                 ; 8-byte Folded Reload
LBB58_11:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function nomember
_nomember:                              ; @nomember
	.cfi_startproc
; %bb.0:
Lloh70:
	adrp	x25, l_.str.27@PAGE
Lloh71:
	add	x25, x25, l_.str.27@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh70, Lloh71
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function notafunction
_notafunction:                          ; @notafunction
	.cfi_startproc
; %bb.0:
Lloh72:
	adrp	x25, l_.str.28@PAGE
Lloh73:
	add	x25, x25, l_.str.28@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh72, Lloh73
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
	.cfi_startproc
; %bb.0:
Lloh74:
	adrp	x25, l_.str.29@PAGE
Lloh75:
	add	x25, x25, l_.str.29@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh74, Lloh75
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
	sub	x16, x8, #1
	and	w17, w0, #0xffff
	lsr	w3, w0, #16
	cmp	w3, #1
	b.eq	LBB63_4
; %bb.1:
	cbnz	w3, LBB63_8
; %bb.2:
	ldrb	w8, [x16, #52]
	cmp	w17, w8
	b.hs	LBB63_8
; %bb.3:
	and	x8, x0, #0xffff
	ldr	x8, [x1, x8, lsl #3]
	b	LBB63_7
LBB63_4:
	cbz	w17, LBB63_7
; %bb.5:
	and	w8, w0, #0xffff
	ldr	w17, [x16, #48]
	cmp	w17, w8
	b.lo	LBB63_8
; %bb.6:
	sub	w8, w8, #1
	add	x8, x16, w8, uxtw #3
	ldr	x8, [x8, #56]
	str	x8, [x2]
	mov	w0, #1                          ; =0x1
	ret
LBB63_7:
	str	x8, [x2]
	mov	w0, #1                          ; =0x1
	ret
LBB63_8:
	mov	w0, #0                          ; =0x0
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
	.cfi_startproc
; %bb.0:
Lloh76:
	adrp	x25, l_.str.30@PAGE
Lloh77:
	add	x25, x25, l_.str.30@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh76, Lloh77
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function notaoffset
_notaoffset:                            ; @notaoffset
	.cfi_startproc
; %bb.0:
Lloh78:
	adrp	x25, l_.str.31@PAGE
Lloh79:
	add	x25, x25, l_.str.31@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh78, Lloh79
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_arith_dc_fallback
_vm_op_arith_dc_fallback:               ; @vm_op_arith_dc_fallback
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB66_7
; %bb.1:
	scvtf	d0, w8
	ldr	x8, [x23, #16]
	and	w9, w0, #0xff
	ldr	x8, [x8, w9, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB66_9
LBB66_2:
	scvtf	d1, w8
	ldurb	w8, [x20, #-4]
	cmp	w8, #23
	b.le	LBB66_11
LBB66_3:
	cmp	w8, #24
	b.eq	LBB66_14
; %bb.4:
	cmp	w8, #25
	b.eq	LBB66_16
; %bb.5:
	cmp	w8, #26
	b.ne	LBB66_18
; %bb.6:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	LBB66_17
LBB66_7:
	cbz	x9, LBB66_18
; %bb.8:
	add	x8, x8, x22
	fmov	d0, x8
	ldr	x8, [x23, #16]
	and	w9, w0, #0xff
	ldr	x8, [x8, w9, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.eq	LBB66_2
LBB66_9:
	cbz	x9, LBB66_18
; %bb.10:
	add	x8, x8, x22
	fmov	d1, x8
	ldurb	w8, [x20, #-4]
	cmp	w8, #23
	b.gt	LBB66_3
LBB66_11:
	cmp	w8, #22
	b.eq	LBB66_15
; %bb.12:
	cmp	w8, #23
	b.ne	LBB66_18
; %bb.13:
	fsub	d0, d0, d1
	b	LBB66_17
LBB66_14:
	fmul	d0, d0, d1
	b	LBB66_17
LBB66_15:
	fadd	d0, d0, d1
	b	LBB66_17
LBB66_16:
	fdiv	d0, d0, d1
LBB66_17:
	fmov	x8, d0
	sub	x8, x8, x22
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB66_18:
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function notanumber
_notanumber:                            ; @notanumber
	.cfi_startproc
; %bb.0:
Lloh80:
	adrp	x25, l_.str.32@PAGE
Lloh81:
	add	x25, x25, l_.str.32@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh80, Lloh81
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_arith_dd_fallback
_vm_op_arith_dd_fallback:               ; @vm_op_arith_dd_fallback
	.cfi_startproc
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	LBB68_3
; %bb.1:
	scvtf	d0, w8
	ldurb	w8, [x20, #-4]
	cmp	w8, #32
	b.ne	LBB68_5
LBB68_2:
	fmov	x8, d0
	eor	x8, x8, #0x8000000000000000
	b	LBB68_20
LBB68_3:
	cbz	x9, LBB68_21
; %bb.4:
	add	x8, x8, x22
	fmov	d0, x8
	ldurb	w8, [x20, #-4]
	cmp	w8, #32
	b.eq	LBB68_2
LBB68_5:
	and	w9, w0, #0xff
	ldr	x9, [x21, w9, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	LBB68_11
; %bb.6:
	scvtf	d1, w9
	cmp	w8, #28
	b.le	LBB68_13
LBB68_7:
	cmp	w8, #29
	b.eq	LBB68_16
; %bb.8:
	cmp	w8, #30
	b.eq	LBB68_18
; %bb.9:
	cmp	w8, #31
	b.ne	LBB68_21
; %bb.10:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	LBB68_19
LBB68_11:
	cbz	x10, LBB68_21
; %bb.12:
	add	x9, x9, x22
	fmov	d1, x9
	cmp	w8, #28
	b.gt	LBB68_7
LBB68_13:
	cmp	w8, #27
	b.eq	LBB68_17
; %bb.14:
	cmp	w8, #28
	b.ne	LBB68_21
; %bb.15:
	fsub	d0, d0, d1
	b	LBB68_19
LBB68_16:
	fmul	d0, d0, d1
	b	LBB68_19
LBB68_17:
	fadd	d0, d0, d1
	b	LBB68_19
LBB68_18:
	fdiv	d0, d0, d1
LBB68_19:
	fmov	x8, d0
LBB68_20:
	sub	x8, x8, x22
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB68_21:
	b	_notanumber
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setcond_bad_op
_vm_op_setcond_bad_op:                  ; @vm_op_setcond_bad_op
	.cfi_startproc
; %bb.0:
	b	_unimplemented
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
	.cfi_startproc
; %bb.0:
Lloh82:
	adrp	x25, l_.str.33@PAGE
Lloh83:
	add	x25, x25, l_.str.33@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh82, Lloh83
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNotF
_vm_op_setc_CmpNotF:                    ; @vm_op_setc_CmpNotF
	.cfi_startproc
; %bb.0:
	ldur	w8, [x20, #-4]
	ubfx	x9, x8, #8, #8
	ldr	x9, [x21, x9, lsl #3]
	cmn	w8, #16, lsl #12                ; =65536
	cset	w8, hs
	and	x9, x9, #0xfffffffffffffffb
	cmp	x9, #2
	cset	w9, eq
	cmp	w0, #0
	eor	w8, w8, w9
	tbz	w8, #0, LBB71_2
; %bb.1:
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB71_2:
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	b.ne	LBB72_3
; %bb.1:
	cmp	w8, w9
	b.eq	LBB72_5
LBB72_2:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB72_3:
	cbz	x10, LBB72_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fcmp	d0, d1
	b.ne	LBB72_2
LBB72_5:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB72_6:
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
	b.ne	LBB73_3
; %bb.1:
	cmp	w8, w9
	b.ne	LBB73_5
LBB73_2:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB73_3:
	cbz	x10, LBB73_6
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fcmp	d0, d1
	b.eq	LBB73_2
LBB73_5:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB73_6:
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
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
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
	lsr	w0, w8, #16
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
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
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
	lsr	w0, w8, #16
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
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
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
	lsr	w0, w8, #16
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
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
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
	lsr	w0, w8, #16
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
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
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
	lsr	w0, w8, #16
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
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
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
	lsr	w0, w8, #16
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
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB80_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB80_6
; %bb.2:
	cmp	w8, w9
	b.eq	LBB80_8
LBB80_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB80_4:
	cbz	x10, LBB80_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB80_7
LBB80_6:
	b	_vm_op_compare_setc_fallback
LBB80_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.ne	LBB80_3
LBB80_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB81_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB81_6
; %bb.2:
	cmp	w8, w9
	b.ne	LBB81_8
LBB81_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB81_4:
	cbz	x10, LBB81_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB81_7
LBB81_6:
	b	_vm_op_compare_setc_fallback
LBB81_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.eq	LBB81_3
LBB81_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB82_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB82_6
; %bb.2:
	cmp	w8, w9
	b.ge	LBB82_8
LBB82_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB82_4:
	cbz	x10, LBB82_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB82_7
LBB82_6:
	b	_vm_op_compare_setc_fallback
LBB82_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.mi	LBB82_3
LBB82_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB83_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB83_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB83_8
LBB83_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB83_4:
	cbz	x10, LBB83_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB83_7
LBB83_6:
	b	_vm_op_compare_setc_fallback
LBB83_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.hi	LBB83_3
LBB83_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB84_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB84_6
; %bb.2:
	cmp	w8, w9
	b.le	LBB84_8
LBB84_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB84_4:
	cbz	x10, LBB84_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB84_7
LBB84_6:
	b	_vm_op_compare_setc_fallback
LBB84_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.gt	LBB84_3
LBB84_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	LBB85_4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	LBB85_6
; %bb.2:
	cmp	w8, w9
	b.ge	LBB85_8
LBB85_3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	br	x2
LBB85_4:
	cbz	x10, LBB85_6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	LBB85_7
LBB85_6:
	b	_vm_op_compare_setc_fallback
LBB85_7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.lt	LBB85_3
LBB85_8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
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
	cmp	w10, #43
	b.hi	LBB87_2
; %bb.1:
	ldr	x12, [x23, #16]
LBB87_2:
	lsr	x13, x11, #16
	ldr	x1, [x12, x13, lsl #3]
	and	w11, w11, #0xff
	cmp	w11, #43
	b.gt	LBB87_5
; %bb.3:
	cmp	w11, #38
	b.eq	LBB87_7
; %bb.4:
	cmp	w11, #39
	b.eq	LBB87_8
	b	LBB87_11
LBB87_5:
	cmp	w11, #45
	b.eq	LBB87_8
; %bb.6:
	cmp	w11, #44
	b.ne	LBB87_11
LBB87_7:
	cmp	w8, #0
	cset	w10, ne
	mov	x2, x22
	bl	_val_eq
	eor	w8, w10, w0
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w9, uxtw #3]
	tbnz	w0, #0, LBB87_9
	b	LBB87_10
LBB87_8:
	cmp	w8, #0
	cset	w10, ne
	mov	x2, x22
	bl	_val_eq
	eor	w8, w10, w0
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w9, uxtw #3]
	tbnz	w0, #0, LBB87_10
LBB87_9:
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
LBB87_10:
	ldr	w8, [x20], #4
	and	x9, x8, #0xff
	ldr	x2, [x24, x9, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB87_11:
	mov	x11, x8
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, LBB87_13
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
	cbnz	w0, LBB87_9
	b	LBB87_10
LBB87_13:
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
	b.ne	LBB88_2
; %bb.1:
	mov	w0, #1                          ; =0x1
	ret
LBB88_2:
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
	mov	x10, x2
	mov	x9, x0
	add	x3, sp, #24
	add	x4, sp, #8
	mov	x11, x1
	bl	_val_to_f64_pair
	cbz	w0, LBB88_6
; %bb.3:
	ldr	d0, [sp, #24]
	ldr	d1, [sp, #8]
	fcmp	d0, d1
LBB88_4:
	cset	w0, eq
LBB88_5:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #64]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #48]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #32]             ; 16-byte Folded Reload
	ldr	x15, [sp, #16]                  ; 8-byte Folded Reload
	add	sp, sp, #96
	ret
LBB88_6:
	add	x8, x10, #7
	and	x16, x8, x9
	cmp	x16, #5
	b.ne	LBB88_5
; %bb.7:
	and	x8, x8, x11
	cmp	x8, #5
	b.ne	LBB88_5
; %bb.8:
	ldr	x8, [x9, #-5]!
	lsr	x8, x8, #32
	ldur	w16, [x11, #-1]
	cmp	x8, x16
	b.ne	LBB88_10
; %bb.9:
	sub	x16, x11, #5
	sub	x2, x8, #9
	add	x0, x9, #8
	add	x1, x16, #8
	bl	_memcmp
	cmp	w0, #0
	b	LBB88_4
LBB88_10:
	mov	w0, #0                          ; =0x0
	b	LBB88_5
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function val_to_f64_pair
_val_to_f64_pair:                       ; @val_to_f64_pair
	.cfi_startproc
; %bb.0:
	and	x8, x2, x0
	cmp	x8, x2
	b.ne	LBB89_3
; %bb.1:
	scvtf	d0, w0
	str	d0, [x3]
	and	x8, x2, x1
	cmp	x8, x2
	b.ne	LBB89_5
LBB89_2:
	scvtf	d0, w1
	str	d0, [x4]
	mov	w0, #1                          ; =0x1
	ret
LBB89_3:
	cbz	x8, LBB89_7
; %bb.4:
	add	x8, x2, x0
	fmov	d0, x8
	str	d0, [x3]
	and	x8, x2, x1
	cmp	x8, x2
	b.eq	LBB89_2
LBB89_5:
	cbz	x8, LBB89_7
; %bb.6:
	add	x8, x2, x1
	fmov	d0, x8
	str	d0, [x4]
	mov	w0, #1                          ; =0x1
	ret
LBB89_7:
	mov	w0, #0                          ; =0x0
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function cmp_f64
_cmp_f64:                               ; @cmp_f64
	.cfi_startproc
; %bb.0:
	sub	w8, w0, #38
Lloh84:
	adrp	x16, lJTI90_0@PAGE
Lloh85:
	add	x16, x16, lJTI90_0@PAGEOFF
	adr	x17, LBB90_1
	ldrb	w0, [x16, x8]
	add	x17, x17, x0, lsl #2
	br	x17
LBB90_1:
	fcmp	d0, d1
	cset	w0, eq
	ret
LBB90_2:
	fcmp	d0, d1
	cset	w0, gt
	ret
LBB90_3:
	fcmp	d0, d1
	cset	w0, mi
	ret
LBB90_4:
	fcmp	d0, d1
	cset	w0, ls
	ret
LBB90_5:
	fcmp	d0, d1
	cset	w0, ne
	ret
LBB90_6:
	fcmp	d0, d1
	cset	w0, ge
	ret
	.loh AdrpAdd	Lloh84, Lloh85
	.cfi_endproc
	.section	__TEXT,__const
lJTI90_0:
	.byte	(LBB90_1-LBB90_1)>>2
	.byte	(LBB90_5-LBB90_1)>>2
	.byte	(LBB90_3-LBB90_1)>>2
	.byte	(LBB90_4-LBB90_1)>>2
	.byte	(LBB90_2-LBB90_1)>>2
	.byte	(LBB90_6-LBB90_1)>>2
	.byte	(LBB90_1-LBB90_1)>>2
	.byte	(LBB90_5-LBB90_1)>>2
	.byte	(LBB90_3-LBB90_1)>>2
	.byte	(LBB90_4-LBB90_1)>>2
	.byte	(LBB90_2-LBB90_1)>>2
	.byte	(LBB90_6-LBB90_1)>>2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
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
	mov	x8, x0
	ldr	x0, [x21, w1, uxtw #3]
	sub	x10, x20, #4
	ldr	x9, [x23, #16]
	ldr	x1, [x9, w8, uxtw #3]
	ldurb	w9, [x20, #-8]
	cmp	w9, #43
	b.gt	LBB91_3
; %bb.1:
	cmp	w9, #38
	b.eq	LBB91_5
; %bb.2:
	cmp	w9, #39
	b.eq	LBB91_6
	b	LBB91_7
LBB91_3:
	cmp	w9, #45
	b.eq	LBB91_6
; %bb.4:
	cmp	w9, #44
	b.ne	LBB91_7
LBB91_5:
	mov	x2, x22
	bl	_val_eq
	b	LBB91_9
LBB91_6:
	mov	x2, x22
	bl	_val_eq
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, x8, xzr, ne
	csel	x9, x10, x20, ne
	b	LBB91_10
LBB91_7:
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, LBB91_11
; %bb.8:
	ldp	d1, d0, [sp]
	mov	x0, x9
	bl	_cmp_f64
LBB91_9:
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, xzr, x8, ne
	csel	x9, x20, x10, ne
LBB91_10:
	ldr	w8, [x20, x8]
	and	x10, x8, #0xff
	ldr	x2, [x24, x10, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
	add	x20, x9, #4
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB91_11:
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
	mov	x8, x0
	sub	x10, x20, #4
	ldr	x0, [x21, w1, uxtw #3]
	ldr	x1, [x21, w8, uxtw #3]
	ldurb	w9, [x20, #-8]
	cmp	w9, #43
	b.gt	LBB92_3
; %bb.1:
	cmp	w9, #38
	b.eq	LBB92_5
; %bb.2:
	cmp	w9, #39
	b.eq	LBB92_6
	b	LBB92_7
LBB92_3:
	cmp	w9, #45
	b.eq	LBB92_6
; %bb.4:
	cmp	w9, #44
	b.ne	LBB92_7
LBB92_5:
	mov	x2, x22
	bl	_val_eq
	b	LBB92_9
LBB92_6:
	mov	x2, x22
	bl	_val_eq
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, x8, xzr, ne
	csel	x9, x10, x20, ne
	b	LBB92_10
LBB92_7:
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, LBB92_11
; %bb.8:
	ldp	d1, d0, [sp]
	mov	x0, x9
	bl	_cmp_f64
LBB92_9:
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, xzr, x8, ne
	csel	x9, x20, x10, ne
LBB92_10:
	ldr	w8, [x20, x8]
	and	x10, x8, #0xff
	ldr	x2, [x24, x10, lsl #3]
	lsr	w0, w8, #16
	ubfx	w1, w8, #8, #8
	add	x20, x9, #4
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
LBB92_11:
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
	.quad	_vm_op_LoadR
	.quad	_vm_op_LoadC
	.quad	_vm_op_LoadType
	.quad	_vm_op_LoadFree
	.quad	_vm_op_LoadField
	.quad	_vm_op_SetField
	.quad	_vm_op_Move
	.quad	_vm_op_Apply
	.quad	_vm_op_Invoke
	.quad	_vm_op_Call
	.quad	_vm_op_Retu
	.quad	_vm_op_Ret
	.quad	_vm_op_Retn
	.quad	_vm_op_Clos
	.quad	_vm_op_WObj
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
	.asciz	"no such member"

l_.str.28:                              ; @.str.28
	.asciz	"not a function"

l_.str.29:                              ; @.str.29
	.asciz	"stack overflow"

l_.str.30:                              ; @.str.30
	.asciz	"invalid layout"

l_.str.31:                              ; @.str.31
	.asciz	"not a offset"

l_.str.32:                              ; @.str.32
	.asciz	"not a number"

l_.str.33:                              ; @.str.33
	.asciz	"unimplemented"

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
