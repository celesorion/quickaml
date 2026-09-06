; zig 0.15.1, clang version 20.1.2 (https://github.com/ziglang/zig-bootstrap c6bc9398c72c7a63fe9420a9055dcfd1845bc266): zig cc -O3 -std=c2x -Wall -Wextra -DNDEBUG -DJUMP_MODE=0 -DDECODE_MODE=1 -g0 -Wno-unused-command-line-argument -target aarch64-macos -S src/vm.c
	.build_version macos, 13, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_vm_entry                       ; -- Begin function vm_entry
	.p2align	2
_vm_entry:                              ; @vm_entry
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
	mov	x23, x0
	ldr	x8, [x0]
	ldp	x9, x25, [x8, #8]
	ldr	x8, [x9, #16]
	orr	x10, x9, #0x1
	stp	x10, xzr, [x0, #80]
	ldr	x9, [x9, #32]
	str	x9, [x0, #16]
	ldrb	w9, [x8]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
Lloh0:
	adrp	x24, _dispatch@PAGE
Lloh1:
	add	x24, x24, _dispatch@PAGEOFF
	ldr	x9, [x24, x9, lsl #3]
	add	x20, x8, #4
	add	x21, x23, #96
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
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Trap
_vm_op_Trap:                            ; @vm_op_Trap
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x19, x0
	cmp	w1, #6
	b.gt	.L6
; %bb.1:
	cmp	w1, #2
	b.le	.L19
; %bb.2:
	sub	w8, w1, #4
	cmp	w8, #2
	b.hs	.L27
; %bb.3:
	lsr	w27, w19, #8
	cmp	w27, w19, uxtb
	b.ls	.L45
; %bb.4:
Lloh2:
	adrp	x8, l_.str.3@PAGE
Lloh3:
	add	x8, x8, l_.str.3@PAGEOFF
Lloh4:
	adrp	x9, l_.str.2@PAGE
Lloh5:
	add	x9, x9, l_.str.2@PAGEOFF
	cmp	w1, #5
	csel	x26, x9, x8, eq
	and	x19, x19, #0xff
Lloh6:
	adrp	x28, ___stderrp@GOTPAGE
Lloh7:
	ldr	x28, [x28, ___stderrp@GOTPAGEOFF]
.L5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x28]
	ldr	x8, [x21, x19, lsl #3]
	stp	x19, x8, [sp]
	mov	x1, x26
	bl	_fprintf
	add	x19, x19, #1
	cmp	x27, x19
	b.ne	.L5
	b	.L45
.L6:
	cmp	w1, #8
	b.le	.L24
; %bb.7:
	cmp	w1, #9
	b.eq	.L36
; %bb.8:
	cmp	w1, #10
	b.eq	.L32
; %bb.9:
	cmp	w1, #11
	b.ne	.L51
; %bb.10:
	adrp	x27, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, .L52
; %bb.11:
	and	w8, w19, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	bics	xzr, x22, x8
	b.ne	.L56
; %bb.12:
	lsr	w9, w19, #8
	ldr	x26, [x21, w9, uxtw #3]
	bics	xzr, x22, x26
	b.ne	.L57
; %bb.13:
	tbnz	w8, #31, .L59
; %bb.14:
	cmp	w26, #256
	b.hs	.L61
; %bb.15:
	and	x1, x8, #0x7fffffff
	mov	w2, #0                          ; =0x0
	bl	_fseek
	cbnz	w0, .L63
; %bb.16:
	ldr	x1, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	mov	x0, x26
	bl	_fputc
	cmn	w0, #1
	b.eq	.L64
; %bb.17:
	ldr	x0, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fflush
	cbz	w0, .L45
; %bb.18:
Lloh8:
	adrp	x25, l_.str.20@PAGE
Lloh9:
	add	x25, x25, l_.str.20@PAGEOFF
	b	.L65
.L19:
	cmp	w1, #1
	b.eq	.L30
; %bb.20:
	cmp	w1, #2
	b.ne	.L47
; %bb.21:
	adrp	x8, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, .L23
; %bb.22:
	str	xzr, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fclose
	cbnz	w0, .L66
.L23:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
.L24:
	cmp	w1, #7
	b.eq	.L31
; %bb.25:
	cmp	w1, #8
	b.ne	.L51
; %bb.26:
	ldr	x8, [x23]
	ldr	x0, [x8]
	bl	_heap_stat_print
	b	.L45
.L27:
	cmp	w1, #6
	b.ne	.L49
; %bb.28:
	and	w8, w19, #0xff
	lsr	w9, w19, #8
	ldr	x8, [x21, w8, uxtw #3]
	ldr	x9, [x21, w9, uxtw #3]
	cmp	x8, x9
	b.eq	.L45
; %bb.29:
Lloh10:
	adrp	x10, ___stderrp@GOTPAGE
Lloh11:
	ldr	x10, [x10, ___stderrp@GOTPAGEOFF]
Lloh12:
	ldr	x0, [x10]
	stp	x8, x9, [sp]
Lloh13:
	adrp	x1, l_.str.4@PAGE
Lloh14:
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
	mov	x0, x19
	mov	w1, #6                          ; =0x6
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_assertionfailed
.L30:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_diverge
.L31:
Lloh15:
	adrp	x26, ___stderrp@GOTPAGE
Lloh16:
	ldr	x26, [x26, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x26]
	and	x19, x19, #0xff
	str	x19, [sp]
Lloh17:
	adrp	x1, l_.str.5@PAGE
Lloh18:
	add	x1, x1, l_.str.5@PAGEOFF
	bl	_fprintf
	ldr	x0, [x26]
	ldr	x1, [x21, x19, lsl #3]
	bl	_obj_print
	ldr	x1, [x26]
	mov	w0, #10                         ; =0xa
	bl	_fputc
	b	.L45
.L32:
	and	x8, x19, #0xff
	ldr	x8, [x21, x8, lsl #3]
	add	x9, x22, #7
	and	x9, x8, x9
	cmp	x8, #5
	ccmp	x9, #5, #0, ne
	b.ne	.L53
; %bb.33:
	adrp	x8, _vm_op_Trap.edit_file@PAGE
	ldr	x0, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	cbz	x0, .L54
; %bb.34:
	str	xzr, [x8, _vm_op_Trap.edit_file@PAGEOFF]
	bl	_fclose
	cbz	w0, .L45
; %bb.35:
Lloh19:
	adrp	x25, l_.str@PAGE
Lloh20:
	add	x25, x25, l_.str@PAGEOFF
	b	.L55
.L36:
	and	w8, w19, #0xff
	ldr	x8, [x21, w8, uxtw #3]
	add	x9, x22, #7
	and	x9, x8, x9
	cmp	x9, #5
	b.ne	.L46
; %bb.37:
	subs	x28, x8, #5
	b.eq	.L46
; %bb.38:
	adrp	x27, _vm_op_Trap.edit_file@PAGE
	ldr	x8, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	cbnz	x8, .L58
; %bb.39:
	bl	___error
	str	wzr, [x0]
Lloh21:
	adrp	x1, l_.str.9@PAGE
Lloh22:
	add	x1, x1, l_.str.9@PAGEOFF
	add	x0, x28, #8
	bl	_fopen
	cbnz	x0, .L42
; %bb.40:
	bl	___error
	ldr	w8, [x0]
	cmp	w8, #2
	b.ne	.L67
; %bb.41:
Lloh23:
	adrp	x1, l_.str.10@PAGE
Lloh24:
	add	x1, x1, l_.str.10@PAGEOFF
	add	x0, x28, #8
	bl	_fopen
	cbz	x0, .L67
.L42:
	mov	x26, x0
	mov	x1, #0                          ; =0x0
	mov	w2, #2                          ; =0x2
	bl	_fseek
	cbnz	w0, .L60
; %bb.43:
	mov	x0, x26
	bl	_ftell
	lsr	x8, x0, #31
	cbnz	x8, .L62
; %bb.44:
	lsr	w8, w19, #8
	str	x26, [x27, _vm_op_Trap.edit_file@PAGEOFF]
	orr	x9, x0, #0xfffe000000000000
	str	x9, [x21, w8, uxtw #3]
.L45:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L46:
Lloh25:
	adrp	x25, l_.str.7@PAGE
Lloh26:
	add	x25, x25, l_.str.7@PAGEOFF
	b	.L68
.L47:
	cbnz	w1, .L51
; %bb.48:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_undefined
.L49:
	cmp	w1, #3
	b.ne	.L51
; %bb.50:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_unusedexta
.L51:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_invalidtrap
.L52:
Lloh27:
	adrp	x25, l_.str.14@PAGE
Lloh28:
	add	x25, x25, l_.str.14@PAGEOFF
	b	.L65
.L53:
Lloh29:
	adrp	x25, l_.str.7@PAGE
Lloh30:
	add	x25, x25, l_.str.7@PAGEOFF
	b	.L55
.L54:
Lloh31:
	adrp	x25, l_.str.14@PAGE
Lloh32:
	add	x25, x25, l_.str.14@PAGEOFF
.L55:
	mov	x0, x19
	mov	w1, #10                         ; =0xa
	b	.L69
.L56:
Lloh33:
	adrp	x25, l_.str.15@PAGE
Lloh34:
	add	x25, x25, l_.str.15@PAGEOFF
	b	.L65
.L57:
Lloh35:
	adrp	x25, l_.str.16@PAGE
Lloh36:
	add	x25, x25, l_.str.16@PAGEOFF
	b	.L65
.L58:
Lloh37:
	adrp	x25, l_.str.8@PAGE
Lloh38:
	add	x25, x25, l_.str.8@PAGEOFF
	b	.L68
.L59:
Lloh39:
	adrp	x25, l_.str.17@PAGE
Lloh40:
	add	x25, x25, l_.str.17@PAGEOFF
	b	.L65
.L60:
	mov	x0, x26
	bl	_fclose
Lloh41:
	adrp	x25, l_.str.12@PAGE
Lloh42:
	add	x25, x25, l_.str.12@PAGEOFF
	b	.L68
.L61:
Lloh43:
	adrp	x25, l_.str.18@PAGE
Lloh44:
	add	x25, x25, l_.str.18@PAGEOFF
	b	.L65
.L62:
	mov	x0, x26
	bl	_fclose
Lloh45:
	adrp	x25, l_.str.13@PAGE
Lloh46:
	add	x25, x25, l_.str.13@PAGEOFF
	b	.L68
.L63:
Lloh47:
	adrp	x25, l_.str.12@PAGE
Lloh48:
	add	x25, x25, l_.str.12@PAGEOFF
	b	.L65
.L64:
Lloh49:
	adrp	x25, l_.str.19@PAGE
Lloh50:
	add	x25, x25, l_.str.19@PAGEOFF
.L65:
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	b	.L69
.L66:
Lloh51:
	adrp	x25, l_.str@PAGE
Lloh52:
	add	x25, x25, l_.str@PAGEOFF
	mov	x0, x19
	mov	w1, #2                          ; =0x2
	b	.L69
.L67:
Lloh53:
	adrp	x25, l_.str.11@PAGE
Lloh54:
	add	x25, x25, l_.str.11@PAGEOFF
.L68:
	mov	x0, x19
	mov	w1, #9                          ; =0x9
.L69:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
	.loh AdrpLdrGot	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh13, Lloh14
	.loh AdrpLdrGotLdr	Lloh10, Lloh11, Lloh12
	.loh AdrpAdd	Lloh17, Lloh18
	.loh AdrpLdrGot	Lloh15, Lloh16
	.loh AdrpAdd	Lloh19, Lloh20
	.loh AdrpAdd	Lloh21, Lloh22
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
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Nop
_vm_op_Nop:                             ; @vm_op_Nop
; %bb.0:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Exta
_vm_op_Exta:                            ; @vm_op_Exta
; %bb.0:
	b	_unusedexta
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadI
_vm_op_LoadI:                           ; @vm_op_LoadI
; %bb.0:
	sxth	x8, w0
	mov	w8, w8
	orr	x8, x22, x8
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoaduI
_vm_op_LoaduI:                          ; @vm_op_LoaduI
; %bb.0:
	mov	w8, w0
	orr	x8, x22, x8
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadR
_vm_op_LoadR:                           ; @vm_op_LoadR
; %bb.0:
	cmp	w0, #7
	b.hi	.L3
; %bb.1:
	mov	w8, #1                          ; =0x1
	lsl	w8, w8, w0
	mov	w9, #197                        ; =0xc5
	tst	w8, w9
	b.eq	.L3
; %bb.2:
	mov	w8, w0
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L3:
	b	_badop
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadC
_vm_op_LoadC:                           ; @vm_op_LoadC
; %bb.0:
	ldr	x8, [x23, #16]
	ldr	x8, [x8, w0, uxtw #3]
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadType
_vm_op_LoadType:                        ; @vm_op_LoadType
; %bb.0:
	ldr	x9, [x23]
	mov	w8, w0
	ldr	x10, [x9, #40]
	cmp	x10, x8
	b.ls	.L2
; %bb.1:
	ldr	x9, [x9, #24]
	ldr	x8, [x9, x8, lsl #3]
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L2:
	b	_badop
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadFree
_vm_op_LoadFree:                        ; @vm_op_LoadFree
; %bb.0:
	ldur	x8, [x21, #-16]
	cbz	w0, .L3
; %bb.1:
	sub	x8, x8, #1
	ldr	w9, [x8, #48]
	cmp	w9, w0
	b.lo	.L4
; %bb.2:
	mov	w9, w0
	add	x8, x8, x9, lsl #3
	ldr	x8, [x8, #48]
.L3:
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L4:
	b	_badop
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadField
_vm_op_LoadField:                       ; @vm_op_LoadField
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	mov	x9, x1
	mov	x10, x0
	and	w8, w0, #0xff
	ldr	x0, [x21, w8, uxtw #3]
	ldr	x8, [x23, #16]
	lsr	w11, w10, #8
	ldr	x1, [x8, w11, uxtw #3]
	bl	_member_slot
	cbz	x0, .L2
; %bb.1:
	ldr	x8, [x0]
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
.L2:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_nomember
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetField
_vm_op_SetField:                        ; @vm_op_SetField
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	mov	x9, x1
	mov	x10, x0
	and	w8, w0, #0xff
	ldr	x11, [x21, w8, uxtw #3]
	ldr	x8, [x23, #16]
	lsr	w12, w0, #8
	ldr	x12, [x8, w12, uxtw #3]
	mov	x0, x11
	mov	x1, x12
	bl	_field_slot
	cbz	x0, .L4
; %bb.1:
	mov	x8, x0
	ldr	x10, [x23]
	ldr	x0, [x10]
	ldr	x1, [x21, w9, uxtw #3]
	str	x1, [x8]
	ldr	w8, [x0, #40]
	cmp	w8, #1
	b.ne	.L3
; %bb.2:
	and	x8, x11, #0xfffffffffffffff8
	ldr	x8, [x8]
	and	x8, x8, #0x300
	cmp	x8, #512
	b.eq	.L7
.L3:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
.L4:
	mov	x0, x11
	mov	x1, x12
	bl	_member_slot
	cbnz	x0, .L6
; %bb.5:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_nomember
.L6:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notafield
.L7:
	bl	_gc_store_field_slow
	b	.L3
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Move
_vm_op_Move:                            ; @vm_op_Move
; %bb.0:
	ldr	x8, [x21, w0, uxtw #3]
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Apply
_vm_op_Apply:                           ; @vm_op_Apply
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	ldr	x10, [x21, w1, uxtw #3]
	add	x8, x22, #7
	and	x8, x10, x8
	cmp	x8, #1
	b.ne	.L4
; %bb.1:
	mov	w11, w1
	ldur	x9, [x10, #15]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, .L5
.L2:
	add	x8, x21, x11, lsl #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.hs	.L6
; %bb.3:
	stp	x10, x20, [x21, #-16]
	ldur	x8, [x10, #31]
	str	x8, [x23, #16]
	ldrb	w8, [x9]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x9, #1]
	ldrh	w0, [x9, #2]
	add	x20, x9, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
.L4:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notafunction
.L5:
	mov	x12, x0
	mov	x0, x23
	mov	x13, x1
	mov	x1, x21
	mov	w2, #256                        ; =0x100
	bl	_gc_poll_slow
	mov	x0, x12
	mov	x1, x13
	b	.L2
.L6:
	mov	x20, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_stackoverflow
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Invoke
_vm_op_Invoke:                          ; @vm_op_Invoke
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	mov	x9, x1
	mov	x10, x0
	and	w8, w0, #0xff
	ldr	x0, [x21, w8, uxtw #3]
	ldr	x8, [x23, #16]
	lsr	w11, w10, #8
	ldr	x1, [x8, w11, uxtw #3]
	bl	_member_slot
	cbz	x0, .L2
; %bb.1:
	ldr	x8, [x0]
	str	x8, [x21, w9, uxtw #3]
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_vm_op_Apply
.L2:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_nomember
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Call
_vm_op_Call:                            ; @vm_op_Call
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	mov	x9, x20
	ldr	x10, [x25, w0, uxtw #3]
	ldr	x20, [x10, #16]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, .L3
.L1:
	add	x8, x21, w1, uxtw #3
	add	x21, x8, #16
	ldr	x8, [x23, #48]
	cmp	x21, x8
	b.hs	.L4
; %bb.2:
	orr	x8, x10, #0x1
	stp	x8, x9, [x21, #-16]
	ldr	x8, [x10, #32]
	str	x8, [x23, #16]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
.L3:
	mov	x11, x0
	mov	x0, x23
	mov	x12, x1
	mov	x1, x21
	mov	w2, #256                        ; =0x100
	bl	_gc_poll_slow
	mov	x0, x11
	mov	x1, x12
	b	.L1
.L4:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_stackoverflow
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Retu
_vm_op_Retu:                            ; @vm_op_Retu
; %bb.0:
	str	xzr, [x21, #-16]!
	ldr	x8, [x21, #8]
	ldurb	w9, [x8, #-3]
	sub	x21, x21, x9, lsl #3
	ldur	x9, [x21, #-16]
	ldur	x9, [x9, #31]
	str	x9, [x23, #16]
	ldrb	w9, [x8]
	ldr	x2, [x24, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Ret
_vm_op_Ret:                             ; @vm_op_Ret
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	str	x8, [x21, #-16]!
	ldr	x8, [x21, #8]
	ldurb	w9, [x8, #-3]
	sub	x21, x21, x9, lsl #3
	ldur	x9, [x21, #-16]
	ldur	x9, [x9, #31]
	str	x9, [x23, #16]
	ldrb	w9, [x8]
	ldr	x2, [x24, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Retn
_vm_op_Retn:                            ; @vm_op_Retn
; %bb.0:
	ldur	x8, [x21, #-8]
	sub	x9, x21, #16
	cbz	w0, .L8
; %bb.1:
	mov	w10, w1
	mov	w11, w0
	cmp	w0, #8
	b.hs	.L3
; %bb.2:
	mov	x12, #0                         ; =0x0
	b	.L6
.L3:
	and	x12, x11, #0xfff8
	add	x13, x21, #48
	add	x14, x21, x10, lsl #3
	add	x14, x14, #32
	mov	x15, x12
.L4:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x14, #-32]
	ldp	q2, q3, [x14], #64
	stp	q0, q1, [x13, #-64]
	stp	q2, q3, [x13, #-32]
	add	x13, x13, #64
	subs	x15, x15, #8
	b.ne	.L4
; %bb.5:
	cmp	x12, x11
	b.eq	.L8
.L6:
	add	x13, x21, x12, lsl #3
	sub	x11, x11, x12
.L7:                                ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x13, x10, lsl #3]
	stur	x12, [x13, #-16]
	add	x13, x13, #8
	subs	x11, x11, #1
	b.ne	.L7
.L8:
	ldurb	w10, [x8, #-3]
	sub	x21, x9, x10, lsl #3
	ldur	x9, [x21, #-16]
	ldur	x9, [x9, #31]
	str	x9, [x23, #16]
	ldrb	w9, [x8]
	ldr	x2, [x24, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Clos
_vm_op_Clos:                            ; @vm_op_Clos
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
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
	cbz	w14, .L4
; %bb.1:
	add	x12, x12, #56
	add	x15, x10, #56
.L2:                                ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x12], #8
	add	x2, sp, #8
	mov	x1, x21
	bl	_capture_loc_resolve
	tbz	w0, #0, .L6
; %bb.3:                                ;   in Loop: Header=BB19_2 Depth=1
	ldr	x8, [sp, #8]
	str	x8, [x15], #8
	subs	x14, x14, #1
	b.ne	.L2
.L4:
	ldr	x0, [x13]
	mov	x1, x10
	bl	_gc_publish_new_object
	orr	x8, x10, #0x1
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, .L7
.L5:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L6:
	mov	x0, x11
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_badop
.L7:
	ldr	w2, [x10, #4]
	mov	x0, x23
	mov	x1, x21
	bl	_gc_poll_slow
	b	.L5
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_WObj
_vm_op_WObj:                            ; @vm_op_WObj
; %bb.0:
	mov	x9, x1
	mov	x13, x0
	and	w10, w0, #0xff
	cmp	w10, #5
	b.hs	.L18
; %bb.1:
	ldr	x14, [x23]
	lsr	w11, w13, #8
	cmp	w10, #3
	b.ne	.L3
; %bb.2:
	ldr	x8, [x21, w9, uxtw #3]
	and	x8, x8, #0xfffffffffffffff8
	ldp	w8, w12, [x8]
	sub	w8, w12, w8
	b	.L6
.L3:
	cmp	w10, #4
	b.ne	.L7
; %bb.4:
	ldr	x8, [x21, w9, uxtw #3]
	add	x12, x22, #7
	and	x12, x8, x12
	cmp	x12, #4
	b.ne	.L18
; %bb.5:
	ldur	x8, [x8, #12]
	and	x8, x8, #0xfffffffffffffff8
	ldr	w8, [x8]
.L6:
	add	w8, w8, #1
	cmp	w11, w8
	b.ne	.L18
.L7:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	lsl	w8, w11, #3
	add	w15, w8, #23
	and	x0, x15, #0xff8
	mov	x1, x23
	mov	x2, x21
	bl	_alloc_object
	mov	x12, x0
	mov	x1, x10
	mov	x2, x11
	bl	_object_init
	cmp	w13, #256
	b.lo	.L13
; %bb.8:
	mov	w8, w9
	cmp	w13, #2560
	b.lo	.L10
; %bb.9:
	lsl	x13, x8, #3
	add	x17, x13, x21
	sub	x13, x12, x17
	add	x13, x13, #16
	cmp	x13, #64
	b.hs	.L15
.L10:
	mov	x13, #0                         ; =0x0
.L11:
	lsl	x16, x13, #3
	add	x8, x16, x8, lsl #3
	add	x8, x21, x8
	add	x16, x16, x12
	add	x16, x16, #16
	sub	x11, x11, x13
.L12:                               ; =>This Inner Loop Header: Depth=1
	ldr	x13, [x8], #8
	str	x13, [x16], #8
	subs	x11, x11, #1
	b.ne	.L12
.L13:
	ldr	x0, [x14]
	mov	x1, x12
	bl	_gc_publish_new_object
	orr	x8, x12, #0x4
	cmp	w10, #3
	csel	x8, x8, x12, eq
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #57]
	tbz	w8, #0, .L19
.L14:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
.L15:
	and	x13, x11, #0xf8
	add	x16, x12, #64
	add	x17, x17, #32
	mov	x19, x13
.L16:                               ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x17, #-32]
	ldp	q2, q3, [x17], #64
	stp	q0, q1, [x16, #-48]
	stp	q2, q3, [x16, #-16]
	add	x16, x16, #64
	subs	x19, x19, #8
	b.ne	.L16
; %bb.17:
	cmp	x13, x11
	b.eq	.L13
	b	.L11
.L18:
	mov	x0, x13
	mov	x1, x9
	b	_invalidlayout
.L19:
	and	x2, x15, #0xff8
	mov	x0, x23
	mov	x1, x21
	bl	_gc_poll_slow
	b	.L14
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Jmp
_vm_op_Jmp:                             ; @vm_op_Jmp
; %bb.0:
	sxth	w8, w0
	orr	w8, w1, w8, lsl #8
	add	x8, x20, w8, sxtw #2
	ldrb	w9, [x8]
	ldr	x2, [x24, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Goto
_vm_op_Goto:                            ; @vm_op_Goto
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	bics	xzr, x22, x8
	b.ne	.L2
; %bb.1:
	lsl	x8, x8, #32
	add	x8, x20, x8, asr #30
	ldrb	w9, [x8]
	ldr	x2, [x24, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
.L2:
	b	_notaoffset
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_AddDC
_vm_op_AddDC:                           ; @vm_op_AddDC
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L3
; %bb.2:
	adds	w8, w8, w9
	b.vc	.L8
.L3:
	b	_vm_op_arith_dc_fallback
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_arith_dc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fadd	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	.L9
.L8:
	orr	x8, x22, x8
.L9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SubDC
_vm_op_SubDC:                           ; @vm_op_SubDC
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L3
; %bb.2:
	subs	w8, w8, w9
	b.vc	.L8
.L3:
	b	_vm_op_arith_dc_fallback
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_arith_dc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fsub	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	.L9
.L8:
	orr	x8, x22, x8
.L9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MulDC
_vm_op_MulDC:                           ; @vm_op_MulDC
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L3
; %bb.2:
	smull	x8, w8, w9
	cmp	x8, w8, sxtw
	b.eq	.L8
.L3:
	b	_vm_op_arith_dc_fallback
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_arith_dc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fmul	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	.L9
.L8:
	mov	w8, w8
	orr	x8, x22, x8
.L9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DivDC
_vm_op_DivDC:                           ; @vm_op_DivDC
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L7
; %bb.2:
	cbz	w9, .L7
; %bb.3:
	mov	w10, #-2147483648               ; =0x80000000
	cmp	w8, w10
	ccmn	w9, #1, #0, eq
	b.eq	.L7
; %bb.4:
	sdiv	w10, w8, w9
	msub	w11, w10, w9, w8
	eor	w8, w9, w8
	cmp	w8, #0
	ccmp	w11, #0, #4, lt
	cset	w8, ne
	sub	w8, w10, w8
	orr	x8, x22, x8
	b	.L9
.L5:
	cbz	x10, .L7
; %bb.6:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_arith_dc_fallback
.L8:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fdiv	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
.L9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RemDC
_vm_op_RemDC:                           ; @vm_op_RemDC
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	ldr	x9, [x23, #16]
	and	w10, w0, #0xff
	ldr	x9, [x9, w10, uxtw #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cbz	w9, .L6
; %bb.3:
	sdiv	w10, w8, w9
	msub	w10, w10, w9, w8
	eor	w8, w9, w8
	and	w8, w9, w8, asr #31
	add	w8, w10, w8
	cmp	w10, #0
	csel	w8, wzr, w8, eq
	orr	x8, x22, x8
	b	.L8
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_arith_dc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	fmov	x8, d0
	sub	x8, x8, x22
.L8:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_AddDD
_vm_op_AddDD:                           ; @vm_op_AddDD
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	.L3
; %bb.2:
	adds	w8, w9, w8
	b.vc	.L8
.L3:
	b	_vm_op_arith_dd_fallback
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_arith_dd_fallback
.L7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fadd	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	.L9
.L8:
	orr	x8, x22, x8
.L9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SubDD
_vm_op_SubDD:                           ; @vm_op_SubDD
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	.L3
; %bb.2:
	subs	w8, w9, w8
	b.vc	.L8
.L3:
	b	_vm_op_arith_dd_fallback
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_arith_dd_fallback
.L7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fsub	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	.L9
.L8:
	orr	x8, x22, x8
.L9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MulDD
_vm_op_MulDD:                           ; @vm_op_MulDD
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	.L3
; %bb.2:
	smull	x8, w9, w8
	cmp	x8, w8, sxtw
	b.eq	.L8
.L3:
	b	_vm_op_arith_dd_fallback
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_arith_dd_fallback
.L7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fmul	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
	b	.L9
.L8:
	mov	w8, w8
	orr	x8, x22, x8
.L9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DivDD
_vm_op_DivDD:                           ; @vm_op_DivDD
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x8
	b.ne	.L7
; %bb.2:
	cbz	w8, .L7
; %bb.3:
	mov	w10, #-2147483648               ; =0x80000000
	cmp	w9, w10
	ccmn	w8, #1, #0, eq
	b.eq	.L7
; %bb.4:
	sdiv	w10, w9, w8
	msub	w11, w10, w8, w9
	eor	w8, w8, w9
	cmp	w8, #0
	ccmp	w11, #0, #4, lt
	cset	w8, ne
	sub	w8, w10, w8
	orr	x8, x22, x8
	b	.L9
.L5:
	cbz	x10, .L7
; %bb.6:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_arith_dd_fallback
.L8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fdiv	d0, d0, d1
	fmov	x8, d0
	sub	x8, x8, x22
.L9:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RemDD
_vm_op_RemDD:                           ; @vm_op_RemDD
; %bb.0:
	and	w8, w0, #0xff
	ldr	x9, [x21, w1, uxtw #3]
	ldr	x8, [x21, w8, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x8
	b.ne	.L6
; %bb.2:
	cbz	w8, .L6
; %bb.3:
	sdiv	w10, w9, w8
	msub	w10, w10, w8, w9
	eor	w9, w8, w9
	and	w8, w8, w9, asr #31
	add	w8, w10, w8
	cmp	w10, #0
	csel	w8, wzr, w8, eq
	orr	x8, x22, x8
	b	.L8
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x8, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_arith_dd_fallback
.L7:
	add	x9, x9, x22
	fmov	d0, x9
	add	x8, x8, x22
	fmov	d1, x8
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	fmov	x8, d0
	sub	x8, x8, x22
.L8:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_NegD
_vm_op_NegD:                            ; @vm_op_NegD
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	.L2
; %bb.1:
	mov	w9, #-2147483648                ; =0x80000000
	mov	x10, #4746794007248502784       ; =0x41e0000000000000
	sub	x10, x10, x22
	neg	w11, w8
	orr	x11, x11, x22
	cmp	w8, w9
	csel	x8, x10, x11, eq
	b	.L4
.L2:
	cbz	x9, .L5
; %bb.3:
	add	x8, x8, x22
	eor	x8, x8, #0x8000000000000000
	sub	x8, x8, x22
.L4:
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	b	_vm_op_arith_dd_fallback
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCond
_vm_op_SetCond:                         ; @vm_op_SetCond
; %bb.0:
	strb	wzr, [x23, #56]
	ldrb	w8, [x20], #4
	sub	w8, w8, #35
	cmp	w8, #15
	b.hs	.L2
; %bb.1:
Lloh55:
	adrp	x9, _dispatch_setc@PAGE
Lloh56:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
.L2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh55, Lloh56
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCondJ
_vm_op_SetCondJ:                        ; @vm_op_SetCondJ
; %bb.0:
	mov	w8, #1                          ; =0x1
	strb	w8, [x23, #56]
	ldrb	w8, [x20], #4
	sub	w8, w8, #35
	cmp	w8, #15
	b.hs	.L2
; %bb.1:
Lloh57:
	adrp	x9, _dispatch_setc@PAGE
Lloh58:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
.L2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh57, Lloh58
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNotF
_vm_op_CmpNotF:                         ; @vm_op_CmpNotF
; %bb.0:
	add	x8, x20, #4
	ldr	x9, [x21, w1, uxtw #3]
	and	x9, x9, #0xfffffffffffffffb
	mov	w10, #65535                     ; =0xffff
	cmp	w0, w10
	b.eq	.L4
; %bb.1:
	cmp	x9, #2
	b.ne	.L3
.L2:
	ldr	w9, [x20]
	asr	w9, w9, #8
	add	x8, x8, w9, sxtw #2
.L3:
	ldrb	w9, [x8]
	ldr	x2, [x24, x9, lsl #3]
	ldrb	w1, [x8, #1]
	ldrh	w0, [x8, #2]
	add	x20, x8, #4
	br	x2
.L4:
	cmp	x9, #2
	b.ne	.L2
	b	.L3
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDI
_vm_op_CmpEqDI:                         ; @vm_op_CmpEqDI
; %bb.0:
	mov	x8, x20
	add	x20, x20, #4
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	cmp	w9, w0, sxth
	b.eq	.L3
.L2:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L3:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L4:
	cbz	x10, .L6
; %bb.5:
	add	x9, x9, x22
	fmov	d0, x9
	sxth	w9, w0
	scvtf	d1, w9
	fcmp	d0, d1
	b.eq	.L3
	b	.L2
.L6:
	b	_vm_op_compare_di_fallback
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDI
_vm_op_CmpNeDI:                         ; @vm_op_CmpNeDI
; %bb.0:
	mov	x8, x20
	add	x20, x20, #4
	ldr	x9, [x21, w1, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	cmp	w9, w0, sxth
	b.ne	.L3
.L2:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L3:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L4:
	cbz	x10, .L6
; %bb.5:
	add	x9, x9, x22
	fmov	d0, x9
	sxth	w9, w0
	scvtf	d1, w9
	fcmp	d0, d1
	b.ne	.L3
	b	.L2
.L6:
	b	_vm_op_compare_di_fallback
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDC
_vm_op_CmpEqDC:                         ; @vm_op_CmpEqDC
; %bb.0:
	mov	x8, x20
	ldr	x9, [x21, w1, uxtw #3]
	add	x20, x20, #4
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	.L7
; %bb.2:
	cmp	w9, w10
	b.eq	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dc_fallback
.L8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.eq	.L4
	b	.L3
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDC
_vm_op_CmpNeDC:                         ; @vm_op_CmpNeDC
; %bb.0:
	mov	x8, x20
	ldr	x9, [x21, w1, uxtw #3]
	add	x20, x20, #4
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	.L7
; %bb.2:
	cmp	w9, w10
	b.ne	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dc_fallback
.L8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.ne	.L4
	b	.L3
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLtDC
_vm_op_CmpLtDC:                         ; @vm_op_CmpLtDC
; %bb.0:
	mov	x8, x20
	ldr	x9, [x21, w1, uxtw #3]
	add	x20, x20, #4
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	.L7
; %bb.2:
	cmp	w9, w10
	b.lt	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dc_fallback
.L8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.pl	.L3
	b	.L4
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLeDC
_vm_op_CmpLeDC:                         ; @vm_op_CmpLeDC
; %bb.0:
	mov	x8, x20
	ldr	x9, [x21, w1, uxtw #3]
	add	x20, x20, #4
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	.L7
; %bb.2:
	cmp	w9, w10
	b.le	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dc_fallback
.L8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.hi	.L3
	b	.L4
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGtDC
_vm_op_CmpGtDC:                         ; @vm_op_CmpGtDC
; %bb.0:
	mov	x8, x20
	ldr	x9, [x21, w1, uxtw #3]
	add	x20, x20, #4
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	.L7
; %bb.2:
	cmp	w9, w10
	b.gt	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dc_fallback
.L8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.le	.L3
	b	.L4
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGeDC
_vm_op_CmpGeDC:                         ; @vm_op_CmpGeDC
; %bb.0:
	mov	x8, x20
	ldr	x9, [x21, w1, uxtw #3]
	add	x20, x20, #4
	ldr	x10, [x23, #16]
	ldr	x10, [x10, w0, uxtw #3]
	and	x11, x9, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x10
	b.ne	.L7
; %bb.2:
	cmp	w9, w10
	b.ge	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x10, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dc_fallback
.L8:
	add	x9, x9, x22
	fmov	d0, x9
	add	x9, x10, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.lt	.L3
	b	.L4
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpEqDD
_vm_op_CmpEqDD:                         ; @vm_op_CmpEqDD
; %bb.0:
	mov	x8, x20
	add	x20, x20, #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L7
; %bb.2:
	cmp	w10, w9
	b.eq	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dd_fallback
.L8:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.eq	.L4
	b	.L3
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpNeDD
_vm_op_CmpNeDD:                         ; @vm_op_CmpNeDD
; %bb.0:
	mov	x8, x20
	add	x20, x20, #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L7
; %bb.2:
	cmp	w10, w9
	b.ne	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dd_fallback
.L8:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.ne	.L4
	b	.L3
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLtDD
_vm_op_CmpLtDD:                         ; @vm_op_CmpLtDD
; %bb.0:
	mov	x8, x20
	add	x20, x20, #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L7
; %bb.2:
	cmp	w10, w9
	b.lt	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dd_fallback
.L8:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.pl	.L3
	b	.L4
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpLeDD
_vm_op_CmpLeDD:                         ; @vm_op_CmpLeDD
; %bb.0:
	mov	x8, x20
	add	x20, x20, #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L7
; %bb.2:
	cmp	w10, w9
	b.le	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dd_fallback
.L8:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.hi	.L3
	b	.L4
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGtDD
_vm_op_CmpGtDD:                         ; @vm_op_CmpGtDD
; %bb.0:
	mov	x8, x20
	add	x20, x20, #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L7
; %bb.2:
	cmp	w10, w9
	b.gt	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dd_fallback
.L8:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.le	.L3
	b	.L4
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CmpGeDD
_vm_op_CmpGeDD:                         ; @vm_op_CmpGeDD
; %bb.0:
	mov	x8, x20
	add	x20, x20, #4
	ldr	x10, [x21, w1, uxtw #3]
	ldr	x9, [x21, w0, uxtw #3]
	and	x11, x10, x22
	cmp	x11, x22
	b.ne	.L5
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L7
; %bb.2:
	cmp	w10, w9
	b.ge	.L4
.L3:
	ldr	w8, [x8]
	asr	w8, w8, #8
	add	x20, x20, w8, sxtw #2
.L4:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L5:
	cbz	x11, .L7
; %bb.6:
	and	x11, x9, x22
	cmp	x11, #0
	ccmp	x11, x22, #4, ne
	b.ne	.L8
.L7:
	b	_vm_op_compare_dd_fallback
.L8:
	add	x10, x10, x22
	fmov	d0, x10
	add	x9, x9, x22
	fmov	d1, x9
	fcmp	d0, d1
	b.lt	.L3
	b	.L4
                                        ; -- End function
	.p2align	5                               ; -- Begin function undefined
_undefined:                             ; @undefined
; %bb.0:
Lloh59:
	adrp	x25, l_.str.21@PAGE
Lloh60:
	add	x25, x25, l_.str.21@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh59, Lloh60
                                        ; -- End function
	.p2align	5                               ; -- Begin function diverge
_diverge:                               ; @diverge
; %bb.0:
.L1:                                ; =>This Inner Loop Header: Depth=1
	b	.L1
                                        ; -- End function
	.p2align	5                               ; -- Begin function panic
_panic:                                 ; @panic
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
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
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
; %bb.0:
Lloh66:
	adrp	x25, l_.str.23@PAGE
Lloh67:
	add	x25, x25, l_.str.23@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh66, Lloh67
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
; %bb.0:
Lloh68:
	adrp	x25, l_.str.24@PAGE
Lloh69:
	add	x25, x25, l_.str.24@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh68, Lloh69
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
; %bb.0:
Lloh70:
	adrp	x25, l_.str.25@PAGE
Lloh71:
	add	x25, x25, l_.str.25@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh70, Lloh71
                                        ; -- End function
	.p2align	5                               ; -- Begin function badop
_badop:                                 ; @badop
; %bb.0:
Lloh72:
	adrp	x25, l_.str.26@PAGE
Lloh73:
	add	x25, x25, l_.str.26@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh72, Lloh73
                                        ; -- End function
	.p2align	2                               ; -- Begin function member_slot
_member_slot:                           ; @member_slot
; %bb.0:
	mov	x8, x0
	mov	x0, #0                          ; =0x0
	cbz	x8, .L16
; %bb.1:
	and	x16, x8, #0xfffffffffffffffe
	and	x16, x16, #0xfffe000000000003
	cbnz	x16, .L16
; %bb.2:
	str	x15, [sp, #-144]!               ; 8-byte Folded Spill
	stp	x14, x13, [sp, #16]             ; 16-byte Folded Spill
	stp	x12, x11, [sp, #32]             ; 16-byte Folded Spill
	stp	x10, x9, [sp, #48]              ; 16-byte Folded Spill
	stp	x26, x25, [sp, #64]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
	and	x20, x8, #0x1fffffffffff8
	ldr	x8, [x20]
	mov	x16, #-562949953421312          ; =0xfffe000000000000
	cmp	x1, x16
	b.lo	.L6
; %bb.3:
	and	w16, w8, #0xff
	cmp	w16, #4
	b.eq	.L14
; %bb.4:
	sxtb	w16, w8
	cbnz	w16, .L13
; %bb.5:
	mov	w16, w1
	lsr	x8, x8, #32
	sub	x8, x8, #16
	add	x17, x20, w1, uxtw #3
	add	x17, x17, #16
	cmp	x16, x8, lsr #3
	csel	x0, x17, xzr, lo
	b	.L15
.L6:
	and	x8, x8, #0xff
	cmp	x8, #4
	b.ne	.L13
; %bb.7:
	ldr	x21, [x20, #16]!
	ldr	x8, [x21, #12]!
	and	x22, x8, #0xfffffffffffffff8
	ldr	w23, [x22, #8]
	cbz	w23, .L13
; %bb.8:
	sub	x24, x1, #5
	ldur	w8, [x1, #-1]
	sub	x19, x8, #9
	add	x25, x22, #36
	b	.L10
.L9:                                ;   in Loop: Header=BB58_10 Depth=1
	add	x25, x25, #16
	subs	x23, x23, #1
	b.eq	.L13
.L10:                               ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x25, #-4]
	cmp	x19, x8
	b.ne	.L9
; %bb.11:                               ;   in Loop: Header=BB58_10 Depth=1
	ldur	x0, [x25, #-12]
	add	x1, x24, #8
	mov	x2, x19
	bl	_memcmp
	cbnz	w0, .L9
; %bb.12:
	ldr	w8, [x25]
	ldr	w16, [x22]
	add	w17, w8, #1
	add	x0, x20, w17, uxtw #3
	sub	w17, w17, w16
	add	x17, x21, w17, uxtw #3
	cmp	w8, w16
	csel	x0, x0, x17, lo
	b	.L15
.L13:
	mov	x0, #0                          ; =0x0
	b	.L15
.L14:
	ldr	x8, [x20, #16]!
	ldur	x8, [x8, #12]
	and	x8, x8, #0xfffffffffffffff8
	ldr	w8, [x8]
	add	w16, w1, #1
	add	x16, x20, w16, uxtw #3
	cmp	w8, w1
	csel	x0, x16, xzr, hi
.L15:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #48]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #32]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #16]             ; 16-byte Folded Reload
	ldr	x15, [sp], #144                 ; 8-byte Folded Reload
.L16:
	ret
                                        ; -- End function
	.p2align	5                               ; -- Begin function nomember
_nomember:                              ; @nomember
; %bb.0:
Lloh74:
	adrp	x25, l_.str.27@PAGE
Lloh75:
	add	x25, x25, l_.str.27@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh74, Lloh75
                                        ; -- End function
	.p2align	2                               ; -- Begin function field_slot
_field_slot:                            ; @field_slot
; %bb.0:
	mov	x8, x0
	mov	x0, #0                          ; =0x0
	cbz	x8, .L13
; %bb.1:
	and	x16, x8, #0xfffffffffffffffe
	and	x16, x16, #0xfffe000000000003
	cbnz	x16, .L13
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
	and	x20, x8, #0x1fffffffffff8
	ldrb	w8, [x20]
	cmp	x8, #4
	b.ne	.L11
; %bb.3:
	ldr	x8, [x20, #16]!
	ldur	x8, [x8, #12]
	and	x21, x8, #0xfffffffffffffff8
	mov	x8, #-562949953421312           ; =0xfffe000000000000
	cmp	x1, x8
	b.lo	.L5
.L4:
	ldr	w8, [x21]
	add	w16, w1, #1
	add	x16, x20, w16, uxtw #3
	cmp	w1, w8
	csel	x0, x16, xzr, lo
	b	.L12
.L5:
	ldr	w22, [x21, #8]
	cbz	w22, .L11
; %bb.6:
	sub	x23, x1, #5
	ldur	w8, [x1, #-1]
	sub	x19, x8, #9
	add	x24, x21, #36
	b	.L8
.L7:                                ;   in Loop: Header=BB60_8 Depth=1
	add	x24, x24, #16
	subs	x22, x22, #1
	b.eq	.L11
.L8:                                ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x24, #-4]
	cmp	x19, x8
	b.ne	.L7
; %bb.9:                                ;   in Loop: Header=BB60_8 Depth=1
	ldur	x0, [x24, #-12]
	add	x1, x23, #8
	mov	x2, x19
	bl	_memcmp
	cbnz	w0, .L7
; %bb.10:
	ldr	w1, [x24]
	b	.L4
.L11:
	mov	x0, #0                          ; =0x0
.L12:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #48]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #32]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #16]             ; 16-byte Folded Reload
	ldr	x15, [sp], #128                 ; 8-byte Folded Reload
.L13:
	ret
                                        ; -- End function
	.p2align	5                               ; -- Begin function notafield
_notafield:                             ; @notafield
; %bb.0:
Lloh76:
	adrp	x25, l_.str.28@PAGE
Lloh77:
	add	x25, x25, l_.str.28@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh76, Lloh77
                                        ; -- End function
	.p2align	5                               ; -- Begin function notafunction
_notafunction:                          ; @notafunction
; %bb.0:
Lloh78:
	adrp	x25, l_.str.29@PAGE
Lloh79:
	add	x25, x25, l_.str.29@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh78, Lloh79
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
; %bb.0:
Lloh80:
	adrp	x25, l_.str.30@PAGE
Lloh81:
	add	x25, x25, l_.str.30@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh80, Lloh81
                                        ; -- End function
	.p2align	2                               ; -- Begin function thunk_alloc_instance
_thunk_alloc_instance:                  ; @thunk_alloc_instance
; %bb.0:
	stp	x10, x9, [sp, #-32]!            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
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
                                        ; -- End function
	.p2align	2                               ; -- Begin function capture_loc_resolve
_capture_loc_resolve:                   ; @capture_loc_resolve
; %bb.0:
	ldur	x8, [x1, #-16]
	sub	x16, x8, #1
	and	w17, w0, #0xffff
	lsr	w3, w0, #16
	cmp	w3, #1
	b.eq	.L4
; %bb.1:
	cbnz	w3, .L8
; %bb.2:
	ldrb	w8, [x16, #52]
	cmp	w17, w8
	b.hs	.L8
; %bb.3:
	and	x8, x0, #0xffff
	ldr	x8, [x1, x8, lsl #3]
	b	.L7
.L4:
	cbz	w17, .L7
; %bb.5:
	and	w8, w0, #0xffff
	ldr	w17, [x16, #48]
	cmp	w17, w8
	b.lo	.L8
; %bb.6:
	sub	w8, w8, #1
	add	x8, x16, w8, uxtw #3
	ldr	x8, [x8, #56]
.L7:
	str	x8, [x2]
	mov	w0, #1                          ; =0x1
	ret
.L8:
	mov	w0, #0                          ; =0x0
	ret
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
; %bb.0:
Lloh82:
	adrp	x25, l_.str.31@PAGE
Lloh83:
	add	x25, x25, l_.str.31@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh82, Lloh83
                                        ; -- End function
	.p2align	5                               ; -- Begin function notaoffset
_notaoffset:                            ; @notaoffset
; %bb.0:
Lloh84:
	adrp	x25, l_.str.32@PAGE
Lloh85:
	add	x25, x25, l_.str.32@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh84, Lloh85
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_arith_dc_fallback
_vm_op_arith_dc_fallback:               ; @vm_op_arith_dc_fallback
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	.L2
; %bb.1:
	scvtf	d0, w8
	b	.L4
.L2:
	cbz	x9, .L20
; %bb.3:
	add	x8, x8, x22
	fmov	d0, x8
.L4:
	ldr	x8, [x23, #16]
	and	w9, w0, #0xff
	ldr	x8, [x8, w9, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	.L6
; %bb.5:
	scvtf	d1, w8
	b	.L8
.L6:
	cbz	x9, .L20
; %bb.7:
	add	x8, x8, x22
	fmov	d1, x8
.L8:
	ldurb	w8, [x20, #-4]
	cmp	w8, #23
	b.le	.L13
; %bb.9:
	cmp	w8, #24
	b.eq	.L16
; %bb.10:
	cmp	w8, #25
	b.eq	.L18
; %bb.11:
	cmp	w8, #26
	b.ne	.L20
; %bb.12:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	.L19
.L13:
	cmp	w8, #22
	b.eq	.L17
; %bb.14:
	cmp	w8, #23
	b.ne	.L20
; %bb.15:
	fsub	d0, d0, d1
	b	.L19
.L16:
	fmul	d0, d0, d1
	b	.L19
.L17:
	fadd	d0, d0, d1
	b	.L19
.L18:
	fdiv	d0, d0, d1
.L19:
	fmov	x8, d0
	sub	x8, x8, x22
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L20:
	b	_notanumber
                                        ; -- End function
	.p2align	5                               ; -- Begin function notanumber
_notanumber:                            ; @notanumber
; %bb.0:
Lloh86:
	adrp	x25, l_.str.33@PAGE
Lloh87:
	add	x25, x25, l_.str.33@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh86, Lloh87
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_arith_dd_fallback
_vm_op_arith_dd_fallback:               ; @vm_op_arith_dd_fallback
; %bb.0:
	ldr	x8, [x21, w1, uxtw #3]
	and	x9, x8, x22
	cmp	x9, x22
	b.ne	.L2
; %bb.1:
	scvtf	d0, w8
	b	.L4
.L2:
	cbz	x9, .L22
; %bb.3:
	add	x8, x8, x22
	fmov	d0, x8
.L4:
	ldurb	w8, [x20, #-4]
	cmp	w8, #32
	b.ne	.L6
; %bb.5:
	fmov	x8, d0
	eor	x8, x8, #0x8000000000000000
	b	.L21
.L6:
	and	w9, w0, #0xff
	ldr	x9, [x21, w9, uxtw #3]
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L12
; %bb.7:
	scvtf	d1, w9
	cmp	w8, #28
	b.le	.L14
.L8:
	cmp	w8, #29
	b.eq	.L17
; %bb.9:
	cmp	w8, #30
	b.eq	.L19
; %bb.10:
	cmp	w8, #31
	b.ne	.L22
; %bb.11:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	.L20
.L12:
	cbz	x10, .L22
; %bb.13:
	add	x9, x9, x22
	fmov	d1, x9
	cmp	w8, #28
	b.gt	.L8
.L14:
	cmp	w8, #27
	b.eq	.L18
; %bb.15:
	cmp	w8, #28
	b.ne	.L22
; %bb.16:
	fsub	d0, d0, d1
	b	.L20
.L17:
	fmul	d0, d0, d1
	b	.L20
.L18:
	fadd	d0, d0, d1
	b	.L20
.L19:
	fdiv	d0, d0, d1
.L20:
	fmov	x8, d0
.L21:
	sub	x8, x8, x22
	lsr	w9, w0, #8
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L22:
	b	_notanumber
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setcond_bad_op
_vm_op_setcond_bad_op:                  ; @vm_op_setcond_bad_op
; %bb.0:
	b	_unimplemented
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
; %bb.0:
Lloh88:
	adrp	x25, l_.str.34@PAGE
Lloh89:
	add	x25, x25, l_.str.34@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh88, Lloh89
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNotF
_vm_op_setc_CmpNotF:                    ; @vm_op_setc_CmpNotF
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
	tbz	w8, #0, .L2
; %bb.1:
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L3
.L2:
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L3:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpEqDI
_vm_op_setc_CmpEqDI:                    ; @vm_op_setc_CmpEqDI
; %bb.0:
	ldur	w8, [x20, #-4]
	ubfx	x9, x8, #8, #8
	ldr	x9, [x21, x9, lsl #3]
	asr	w8, w8, #16
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L3
; %bb.1:
	cmp	w8, w9
	b.eq	.L5
.L2:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L6
.L3:
	cbz	x10, .L7
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fcmp	d0, d1
	b.ne	.L2
.L5:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L6:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L7:
	b	_vm_op_compare_di_fallback
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNeDI
_vm_op_setc_CmpNeDI:                    ; @vm_op_setc_CmpNeDI
; %bb.0:
	ldur	w8, [x20, #-4]
	ubfx	x9, x8, #8, #8
	ldr	x9, [x21, x9, lsl #3]
	asr	w8, w8, #16
	and	x10, x9, x22
	cmp	x10, x22
	b.ne	.L3
; %bb.1:
	cmp	w8, w9
	b.ne	.L5
.L2:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L6
.L3:
	cbz	x10, .L7
; %bb.4:
	add	x9, x9, x22
	fmov	d0, x9
	scvtf	d1, w8
	fcmp	d0, d1
	b.eq	.L2
.L5:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L6:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
.L7:
	b	_vm_op_compare_di_fallback
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpEqDC
_vm_op_setc_CmpEqDC:                    ; @vm_op_setc_CmpEqDC
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #16]
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.eq	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.ne	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNeDC
_vm_op_setc_CmpNeDC:                    ; @vm_op_setc_CmpNeDC
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #16]
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.ne	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.eq	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpLtDC
_vm_op_setc_CmpLtDC:                    ; @vm_op_setc_CmpLtDC
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #16]
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.ge	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.mi	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpLeDC
_vm_op_setc_CmpLeDC:                    ; @vm_op_setc_CmpLeDC
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #16]
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.le	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.hi	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpGtDC
_vm_op_setc_CmpGtDC:                    ; @vm_op_setc_CmpGtDC
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #16]
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.le	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.gt	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpGeDC
_vm_op_setc_CmpGeDC:                    ; @vm_op_setc_CmpGeDC
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	ldr	x10, [x23, #16]
	lsr	x9, x9, #16
	ldr	x9, [x10, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.ge	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.lt	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpEqDD
_vm_op_setc_CmpEqDD:                    ; @vm_op_setc_CmpEqDD
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.eq	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.ne	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpNeDD
_vm_op_setc_CmpNeDD:                    ; @vm_op_setc_CmpNeDD
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.ne	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.eq	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpLtDD
_vm_op_setc_CmpLtDD:                    ; @vm_op_setc_CmpLtDD
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.ge	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.mi	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpLeDD
_vm_op_setc_CmpLeDD:                    ; @vm_op_setc_CmpLeDD
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.le	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.hi	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpGtDD
_vm_op_setc_CmpGtDD:                    ; @vm_op_setc_CmpGtDD
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.le	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.gt	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_setc_CmpGeDD
_vm_op_setc_CmpGeDD:                    ; @vm_op_setc_CmpGeDD
; %bb.0:
	ldur	w9, [x20, #-4]
	ubfx	x8, x9, #8, #8
	ldr	x8, [x21, x8, lsl #3]
	lsr	x9, x9, #16
	ldr	x9, [x21, x9, lsl #3]
	and	x10, x8, x22
	cmp	x10, x22
	b.ne	.L4
; %bb.1:
	bics	xzr, x22, x9
	b.ne	.L6
; %bb.2:
	cmp	w8, w9
	b.ge	.L8
.L3:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w1, uxtw #3]
	b	.L9
.L4:
	cbz	x10, .L6
; %bb.5:
	and	x10, x9, x22
	cmp	x10, #0
	ccmp	x10, x22, #4, ne
	b.ne	.L7
.L6:
	b	_vm_op_compare_setc_fallback
.L7:
	add	x8, x8, x22
	fmov	d0, x8
	add	x8, x9, x22
	fmov	d1, x8
	fcmp	d0, d1
	b.lt	.L3
.L8:
	cmp	w0, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w1, uxtw #3]
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L9:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	br	x2
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_di_fallback
_vm_op_compare_di_fallback:             ; @vm_op_compare_di_fallback
; %bb.0:
	b	_notanumber
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_setc_fallback
_vm_op_compare_setc_fallback:           ; @vm_op_compare_setc_fallback
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x9, x1
	mov	x8, x0
	ldur	w11, [x20, #-4]
	and	w10, w11, #0xff
	ubfx	x12, x11, #8, #8
	ldr	x0, [x21, x12, lsl #3]
	mov	x12, x21
	cmp	w10, #43
	b.hi	.L2
; %bb.1:
	ldr	x12, [x23, #16]
.L2:
	lsr	x13, x11, #16
	ldr	x1, [x12, x13, lsl #3]
	and	w11, w11, #0xff
	cmp	w11, #43
	b.gt	.L5
; %bb.3:
	cmp	w11, #38
	b.eq	.L7
; %bb.4:
	cmp	w11, #39
	b.eq	.L8
	b	.L11
.L5:
	cmp	w11, #45
	b.eq	.L8
; %bb.6:
	cmp	w11, #44
	b.ne	.L11
.L7:
	cmp	w8, #0
	cset	w10, ne
	mov	x2, x22
	bl	_val_eq
	eor	w8, w10, w0
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, ne
	str	x8, [x21, w9, uxtw #3]
	tbnz	w0, #0, .L9
	b	.L10
.L8:
	cmp	w8, #0
	cset	w10, ne
	mov	x2, x22
	bl	_val_eq
	eor	w8, w10, w0
	cmp	w8, #0
	mov	w8, #6                          ; =0x6
	cinc	x8, x8, eq
	str	x8, [x21, w9, uxtw #3]
	tbnz	w0, #0, .L10
.L9:
	ldrb	w8, [x23, #56]
	add	x20, x20, x8, lsl #2
.L10:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L11:
	mov	x11, x8
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, .L13
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
	cbnz	w0, .L9
	b	.L10
.L13:
	mov	x0, x11
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notanumber
                                        ; -- End function
	.p2align	2                               ; -- Begin function val_eq
_val_eq:                                ; @val_eq
; %bb.0:
	cmp	x0, x1
	b.ne	.L2
; %bb.1:
	mov	w0, #1                          ; =0x1
	ret
.L2:
	sub	sp, sp, #96
	str	x15, [sp, #16]                  ; 8-byte Folded Spill
	stp	x14, x13, [sp, #32]             ; 16-byte Folded Spill
	stp	x12, x11, [sp, #48]             ; 16-byte Folded Spill
	stp	x10, x9, [sp, #64]              ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	mov	x10, x2
	mov	x9, x0
	add	x3, sp, #24
	add	x4, sp, #8
	mov	x11, x1
	bl	_val_to_f64_pair
	cbz	w0, .L6
; %bb.3:
	ldr	d0, [sp, #24]
	ldr	d1, [sp, #8]
	fcmp	d0, d1
.L4:
	cset	w0, eq
.L5:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #64]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #48]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #32]             ; 16-byte Folded Reload
	ldr	x15, [sp, #16]                  ; 8-byte Folded Reload
	add	sp, sp, #96
	ret
.L6:
	add	x8, x10, #7
	and	x16, x8, x9
	cmp	x16, #5
	b.ne	.L5
; %bb.7:
	and	x8, x8, x11
	cmp	x8, #5
	b.ne	.L5
; %bb.8:
	ldr	x8, [x9, #-5]!
	lsr	x8, x8, #32
	ldur	w16, [x11, #-1]
	cmp	x8, x16
	b.ne	.L10
; %bb.9:
	sub	x16, x11, #5
	sub	x2, x8, #9
	add	x0, x9, #8
	add	x1, x16, #8
	bl	_memcmp
	cmp	w0, #0
	b	.L4
.L10:
	mov	w0, #0                          ; =0x0
	b	.L5
                                        ; -- End function
	.p2align	2                               ; -- Begin function val_to_f64_pair
_val_to_f64_pair:                       ; @val_to_f64_pair
; %bb.0:
	and	x8, x2, x0
	cmp	x8, x2
	b.ne	.L2
; %bb.1:
	scvtf	d0, w0
	b	.L4
.L2:
	cbz	x8, .L9
; %bb.3:
	add	x8, x2, x0
	fmov	d0, x8
.L4:
	str	d0, [x3]
	and	x8, x2, x1
	cmp	x8, x2
	b.ne	.L6
; %bb.5:
	scvtf	d0, w1
	b	.L8
.L6:
	cbz	x8, .L9
; %bb.7:
	add	x8, x2, x1
	fmov	d0, x8
.L8:
	str	d0, [x4]
	mov	w0, #1                          ; =0x1
	ret
.L9:
	mov	w0, #0                          ; =0x0
	ret
                                        ; -- End function
	.p2align	2                               ; -- Begin function cmp_f64
_cmp_f64:                               ; @cmp_f64
; %bb.0:
	cmp	w0, #43
	b.gt	.L5
; %bb.1:
	cmp	w0, #40
	b.gt	.L9
; %bb.2:
	cmp	w0, #38
	b.eq	.L15
; %bb.3:
	cmp	w0, #39
	b.eq	.L8
.L4:
	fcmp	d0, d1
	cset	w0, mi
	ret
.L5:
	cmp	w0, #46
	b.gt	.L12
; %bb.6:
	cmp	w0, #44
	b.eq	.L15
; %bb.7:
	cmp	w0, #45
	b.ne	.L4
.L8:
	fcmp	d0, d1
	cset	w0, ne
	ret
.L9:
	cmp	w0, #41
	b.eq	.L16
; %bb.10:
	cmp	w0, #42
	b.eq	.L14
.L11:
	fcmp	d0, d1
	cset	w0, ge
	ret
.L12:
	cmp	w0, #47
	b.eq	.L16
; %bb.13:
	cmp	w0, #48
	b.ne	.L11
.L14:
	fcmp	d0, d1
	cset	w0, gt
	ret
.L15:
	fcmp	d0, d1
	cset	w0, eq
	ret
.L16:
	fcmp	d0, d1
	cset	w0, ls
	ret
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_dc_fallback
_vm_op_compare_dc_fallback:             ; @vm_op_compare_dc_fallback
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x8, x1
	mov	x12, x0
	ldr	x0, [x21, w1, uxtw #3]
	sub	x9, x20, #4
	ldr	x10, [x23, #16]
	ldr	x1, [x10, w12, uxtw #3]
	ldurb	w10, [x20, #-8]
	cmp	w10, #43
	b.gt	.L3
; %bb.1:
	cmp	w10, #38
	b.eq	.L5
; %bb.2:
	cmp	w10, #39
	b.eq	.L6
	b	.L7
.L3:
	cmp	w10, #45
	b.eq	.L6
; %bb.4:
	cmp	w10, #44
	b.ne	.L7
.L5:
	mov	x2, x22
	bl	_val_eq
	b	.L9
.L6:
	mov	x2, x22
	bl	_val_eq
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, x8, xzr, ne
	csel	x9, x9, x20, ne
	b	.L10
.L7:
	mov	x11, x8
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, .L11
; %bb.8:
	ldp	d1, d0, [sp]
	mov	x0, x10
	bl	_cmp_f64
.L9:
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, xzr, x8, ne
	csel	x9, x20, x9, ne
.L10:
	ldrb	w8, [x20, x8]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x9, #1]
	ldrh	w0, [x9, #2]
	add	x20, x9, #4
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L11:
	mov	x20, x9
	mov	x0, x12
	mov	x1, x11
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notanumber
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_compare_dd_fallback
_vm_op_compare_dd_fallback:             ; @vm_op_compare_dd_fallback
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x8, x1
	mov	x12, x0
	mov	x9, x20
	sub	x20, x20, #4
	ldr	x0, [x21, w1, uxtw #3]
	ldr	x1, [x21, w12, uxtw #3]
	ldurb	w10, [x9, #-8]
	cmp	w10, #43
	b.gt	.L3
; %bb.1:
	cmp	w10, #38
	b.eq	.L5
; %bb.2:
	cmp	w10, #39
	b.eq	.L6
	b	.L7
.L3:
	cmp	w10, #45
	b.eq	.L6
; %bb.4:
	cmp	w10, #44
	b.ne	.L7
.L5:
	mov	x2, x22
	bl	_val_eq
	b	.L9
.L6:
	mov	x2, x22
	bl	_val_eq
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, x8, xzr, ne
	csel	x10, x20, x9, ne
	b	.L10
.L7:
	mov	x11, x8
	add	x3, sp, #8
	mov	x4, sp
	mov	x2, x22
	bl	_val_to_f64_pair
	tbz	w0, #0, .L11
; %bb.8:
	ldp	d1, d0, [sp]
	mov	x0, x10
	bl	_cmp_f64
.L9:
	cmp	w0, #0
	mov	x8, #-4                         ; =0xfffffffffffffffc
	csel	x8, xzr, x8, ne
	csel	x10, x9, x20, ne
.L10:
	ldrb	w8, [x9, x8]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x10, #1]
	ldrh	w0, [x10, #2]
	add	x20, x10, #4
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L11:
	mov	x0, x12
	mov	x1, x11
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notanumber
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
	.asciz	"not a field"

l_.str.29:                              ; @.str.29
	.asciz	"not a function"

l_.str.30:                              ; @.str.30
	.asciz	"stack overflow"

l_.str.31:                              ; @.str.31
	.asciz	"invalid layout"

l_.str.32:                              ; @.str.32
	.asciz	"not a offset"

l_.str.33:                              ; @.str.33
	.asciz	"not a number"

l_.str.34:                              ; @.str.34
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
