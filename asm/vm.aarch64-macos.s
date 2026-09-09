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
	stp	x10, xzr, [x0, #88]
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
	add	x21, x23, #104
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
	.p2align	5                               ; -- Begin function vm_op_Halt
_vm_op_Halt:                            ; @vm_op_Halt
; %bb.0:
	ret
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
	orr	x8, x8, #0x4
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
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x9, x1
	mov	x10, x0
	and	w8, w0, #0xff
	ldr	x11, [x21, w8, uxtw #3]
	ldr	x12, [x23, #16]
	lsr	w13, w0, #8
	ldr	x1, [x12, w13, uxtw #3]
	add	x2, sp, #8
	mov	x0, x11
	bl	_field_slot
	cbz	x0, .L4
; %bb.1:
	mov	x8, x0
	ldr	x10, [x23]
	ldr	x0, [x10]
	ldr	x10, [sp, #8]
	ldr	x1, [x21, w9, uxtw #3]
	str	x1, [x8]
	ldr	w8, [x0, #40]
	cmp	w8, #1
	b.ne	.L3
; %bb.2:
	ldr	x8, [x10]
	and	x8, x8, #0x300
	cmp	x8, #512
	b.eq	.L7
.L3:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L4:
	ldr	x1, [x12, w13, uxtw #3]
	mov	x0, x11
	bl	_member_slot
	cbnz	x0, .L6
; %bb.5:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_nomember
.L6:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notafield
.L7:
	bl	_gc_store_field_slow
	b	.L3
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadInd
_vm_op_LoadInd:                         ; @vm_op_LoadInd
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	mov	x9, x1
	mov	x10, x0
	and	w8, w0, #0xff
	mov	w11, w0
	lsr	x3, x11, #8
	ldr	w11, [x20]
	lsr	x2, x11, #8
	ldr	x1, [x21, w8, uxtw #3]
	orr	x8, x22, #0x2
	and	x8, x1, x8
	cmp	x1, #0
	ccmp	x8, #0, #0, ne
	b.ne	.L5
; %bb.1:
	and	x8, x1, #0xfffffffffffffff8
	ldr	w11, [x8]
	and	w12, w11, #0xfe
	cmp	w12, #4
	b.ne	.L5
; %bb.2:
	ldr	x12, [x23, #24]
	ldr	x12, [x12, x2, lsl #3]
	orr	x13, x12, #0x4
	mov	x12, x8
	ldr	x14, [x12, #16]!
	cmp	x14, x13
	b.ne	.L5
; %bb.3:
	mov	w10, #5                         ; =0x5
	and	w10, w11, w10
	cmp	w10, #4
	b.ne	.L7
; %bb.4:
	add	w8, w3, #1
	add	x0, x12, w8, uxtw #3
	b	.L6
.L5:
	ldr	x0, [x23]
	bl	_typed_member_slow
	cbz	x0, .L8
.L6:
	ldr	x8, [x0]
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x20, #4]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #5]
	ldrh	w0, [x20, #6]
	add	x20, x20, #8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
.L7:
	ldr	x10, [x8, #24]
	and	x10, x10, #0xfffffffffffffff8
	add	x8, x8, x3
	ldrb	w8, [x8, #32]
	add	x8, x10, x8, lsl #3
	add	x0, x8, #24
	b	.L6
.L8:
	add	x20, x20, #4
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_nomember
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetInd
_vm_op_SetInd:                          ; @vm_op_SetInd
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x9, x1
	mov	x10, x0
	and	w8, w0, #0xff
	mov	w11, w0
	lsr	x11, x11, #8
	ldr	w12, [x20]
	lsr	x12, x12, #8
	ldr	x13, [x21, w8, uxtw #3]
	orr	x8, x22, #0x2
	and	x8, x13, x8
	cmp	x13, #0
	ccmp	x8, #0, #0, ne
	b.ne	.L5
; %bb.1:
	and	x14, x13, #0xfffffffffffffff8
	ldr	w8, [x14]
	and	w15, w8, #0xfe
	cmp	w15, #4
	b.ne	.L5
; %bb.2:
	ldr	x15, [x23, #24]
	ldr	x15, [x15, x12, lsl #3]
	orr	x16, x15, #0x4
	mov	x15, x14
	ldr	x17, [x15, #16]!
	cmp	x17, x16
	b.ne	.L5
; %bb.3:
	mov	w10, #5                         ; =0x5
	and	w8, w8, w10
	cmp	w8, #4
	b.ne	.L10
; %bb.4:
	add	w8, w11, #1
	add	x0, x15, w8, uxtw #3
	b	.L7
.L5:
	ldr	x14, [x23]
	add	x4, sp, #8
	mov	x0, x14
	mov	x1, x13
	mov	x2, x12
	mov	x3, x11
	bl	_typed_field_slow
	cbz	x0, .L11
; %bb.6:
	ldr	x14, [sp, #8]
.L7:
	ldr	x8, [x23]
	ldr	x8, [x8]
	ldr	x1, [x21, w9, uxtw #3]
	str	x1, [x0]
	ldr	w9, [x8, #40]
	cmp	w9, #1
	b.ne	.L9
; %bb.8:
	ldr	x9, [x14]
	and	x9, x9, #0x300
	cmp	x9, #512
	b.eq	.L13
.L9:
	ldrb	w8, [x20, #4]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #5]
	ldrh	w0, [x20, #6]
	add	x20, x20, #8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L10:
	ldr	x8, [x14, #24]
	add	x10, x14, x11
	and	x14, x8, #0xfffffffffffffff8
	ldrb	w8, [x10, #32]
	add	x8, x14, x8, lsl #3
	add	x0, x8, #24
	b	.L7
.L11:
	mov	x0, x14
	mov	x1, x13
	mov	x2, x12
	mov	x3, x11
	bl	_typed_member_slow
	add	x20, x20, #4
	cbnz	x0, .L14
; %bb.12:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_nomember
.L13:
	mov	x0, x8
	bl	_gc_store_field_slow
	b	.L9
.L14:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notafield
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_View
_vm_op_View:                            ; @vm_op_View
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x9, x1
	lsr	w8, w0, #8
	ldr	x8, [x21, w8, uxtw #3]
	add	x10, x22, #7
	and	x10, x8, x10
	cmp	x10, #4
	b.ne	.L12
; %bb.1:
	and	w10, w0, #0xff
	ldr	x10, [x21, w10, uxtw #3]
	orr	x11, x22, #0x2
	and	x11, x10, x11
	cmp	x10, #0
	ccmp	x11, #0, #0, ne
	b.ne	.L11
; %bb.2:
	and	x10, x10, #0xfffffffffffffff8
	ldrb	w11, [x10]
	cmp	x11, #5
	b.ne	.L4
; %bb.3:
	ldr	x10, [x10, #24]
	and	x10, x10, #0xfffffffffffffff8
	ldrb	w11, [x10]
.L4:
	cmp	x11, #4
	b.ne	.L11
; %bb.5:
	ldr	x13, [x10, #16]
	cmp	x13, x8
	b.ne	.L7
; %bb.6:
	str	x10, [x21, w9, uxtw #3]
	b	.L10
.L7:
	mov	x11, x0
	ldr	x19, [x23]
	sub	x12, x8, #4
	ldur	x15, [x13, #12]
	ldr	x8, [x12, #16]
	and	x13, x8, #0xfffffffffffffff8
	and	x0, x15, #0xfffffffffffffff8
	add	x2, sp, #8
	mov	x1, x13
	bl	_view_template
	cbz	x0, .L13
; %bb.8:
	mov	x14, x0
	ldr	w8, [x13]
	add	w8, w8, #39
	and	w13, w8, #0xfffffff8
	mov	x0, x13
	mov	x1, x23
	mov	x2, x21
	bl	_alloc_object
	cbz	x0, .L14
; %bb.9:
	mov	x15, x0
	mov	x1, x12
	mov	x2, x10
	mov	x3, x14
	bl	_view_init
	ldr	x0, [x19]
	mov	x1, x15
	bl	_gc_publish_new_object
	str	x15, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #65]
	tbz	w8, #0, .L15
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
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notaninstance
.L12:
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_notatype
.L13:
	ldr	x2, [sp, #8]
	cbnz	x2, .L16
.L14:
	mov	x0, x11
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_outofmemory
.L15:
	mov	x0, x23
	mov	x1, x21
	mov	x2, x13
	bl	_gc_poll_slow
	b	.L10
.L16:
	and	x0, x15, #0xfffffffffffffff8
	mov	x1, x13
	bl	_cannotview_format
	mov	x0, x11
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_cannotview
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
	ldrb	w8, [x23, #65]
	tbz	w8, #0, .L5
.L2:
	add	x8, x21, x11, lsl #3
	add	x21, x8, #16
	ldrb	w8, [x10, #51]
	add	x8, x21, x8, lsl #3
	ldr	x11, [x23, #56]
	cmp	x8, x11
	b.hi	.L6
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
	add	x8, x22, #7
	and	x8, x0, x8
	cmp	x8, #4
	b.eq	.L3
; %bb.1:
	ldr	x8, [x23, #16]
	lsr	w11, w10, #8
	ldr	x1, [x8, w11, uxtw #3]
	bl	_member_slot
	cbz	x0, .L4
; %bb.2:
	ldr	x8, [x0]
	str	x8, [x21, w9, uxtw #3]
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_vm_op_Apply
.L3:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_notaninstance
.L4:
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
	ldrb	w8, [x23, #65]
	tbz	w8, #0, .L3
.L1:
	add	x8, x21, w1, uxtw #3
	add	x21, x8, #16
	ldrb	w8, [x10, #52]
	add	x8, x21, x8, lsl #3
	ldr	x11, [x23, #56]
	cmp	x8, x11
	b.hi	.L4
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
	.p2align	5                               ; -- Begin function vm_op_Native
_vm_op_Native:                          ; @vm_op_Native
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x19, x1
	mov	x26, x0
	mov	w8, w0
Lloh2:
	adrp	x9, _nnatives@GOTPAGE
Lloh3:
	ldr	x9, [x9, _nnatives@GOTPAGEOFF]
Lloh4:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ls	.L3
; %bb.1:
	mov	w9, #24                         ; =0x18
Lloh5:
	adrp	x10, _natives@GOTPAGE
Lloh6:
	ldr	x10, [x10, _natives@GOTPAGEOFF]
	umaddl	x8, w8, w9, x10
	ldr	x8, [x8, #16]
	add	x2, sp, #8
	mov	x0, x23
	mov	x1, x21
	blr	x8
	cbnz	x0, .L4
; %bb.2:
	ldr	x8, [sp, #8]
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
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L3:
	mov	x0, x26
	mov	x1, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_badop
.L4:
	mov	x25, x0
	mov	x0, x26
	mov	x1, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_panic
	.loh AdrpLdrGotLdr	Lloh2, Lloh3, Lloh4
	.loh AdrpLdrGot	Lloh5, Lloh6
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
	mov	x10, x0
	ldr	x13, [x23]
	ldr	x12, [x25, w0, uxtw #3]
	mov	x0, x23
	mov	x1, x12
	mov	x2, x21
	bl	_thunk_alloc_instance
	cbz	x0, .L8
; %bb.1:
	mov	x11, x0
	ldr	w14, [x12, #48]
	cbz	w14, .L5
; %bb.2:
	add	x12, x12, #56
	add	x15, x11, #56
.L3:                                ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x12], #8
	add	x2, sp, #8
	mov	x1, x21
	bl	_capture_loc_resolve
	tbz	w0, #0, .L7
; %bb.4:                                ;   in Loop: Header=BB23_3 Depth=1
	ldr	x8, [sp, #8]
	str	x8, [x15], #8
	subs	x14, x14, #1
	b.ne	.L3
.L5:
	ldr	x0, [x13]
	mov	x1, x11
	bl	_gc_publish_new_object
	orr	x8, x11, #0x1
	str	x8, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #65]
	tbz	w8, #0, .L9
.L6:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	br	x2
.L7:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_badop
.L8:
	mov	x0, x10
	mov	x1, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	b	_outofmemory
.L9:
	ldr	w2, [x11, #4]
	mov	x0, x23
	mov	x1, x21
	bl	_gc_poll_slow
	b	.L6
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_WObj
_vm_op_WObj:                            ; @vm_op_WObj
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	mov	x9, x1
	mov	x12, x0
	and	w13, w0, #0xff
	cmp	w13, #3
	ccmp	w13, #5, #2, ne
	b.hs	.L16
; %bb.1:
	ldr	x14, [x23]
	lsr	w10, w12, #8
	cmp	w13, #4
	b.ne	.L4
; %bb.2:
	ldr	x8, [x21, w9, uxtw #3]
	add	x11, x22, #7
	and	x11, x8, x11
	cmp	x11, #4
	b.ne	.L16
; %bb.3:
	ldur	x8, [x8, #12]
	and	x8, x8, #0xfffffffffffffff8
	ldr	w8, [x8]
	add	w8, w8, #1
	cmp	w10, w8
	b.ne	.L16
.L4:
	lsl	w8, w10, #3
	add	w15, w8, #23
	and	x0, x15, #0xff8
	mov	x1, x23
	mov	x2, x21
	bl	_alloc_object
	cbz	x0, .L17
; %bb.5:
	mov	x11, x0
	mov	x1, x13
	mov	x2, x10
	bl	_object_init
	cmp	w12, #256
	b.lo	.L11
; %bb.6:
	mov	w8, w9
	cmp	w12, #2560
	b.lo	.L8
; %bb.7:
	lsl	x12, x8, #3
	add	x16, x12, x21
	sub	x12, x11, x16
	add	x12, x12, #16
	cmp	x12, #64
	b.hs	.L13
.L8:
	mov	x12, #0                         ; =0x0
.L9:
	lsl	x13, x12, #3
	add	x8, x13, x8, lsl #3
	add	x8, x21, x8
	add	x13, x13, x11
	add	x13, x13, #16
	sub	x10, x10, x12
.L10:                               ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x8], #8
	str	x12, [x13], #8
	subs	x10, x10, #1
	b.ne	.L10
.L11:
	ldr	x0, [x14]
	mov	x1, x11
	bl	_gc_publish_new_object
	str	x11, [x21, w9, uxtw #3]
	ldrb	w8, [x23, #65]
	tbz	w8, #0, .L18
.L12:
	ldrb	w8, [x20]
	ldr	x2, [x24, x8, lsl #3]
	ldrb	w1, [x20, #1]
	ldrh	w0, [x20, #2]
	add	x20, x20, #4
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	br	x2
.L13:
	and	x12, x10, #0xf8
	add	x13, x11, #64
	add	x16, x16, #32
	mov	x17, x12
.L14:                               ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x16, #-32]
	ldp	q2, q3, [x16], #64
	stp	q0, q1, [x13, #-48]
	stp	q2, q3, [x13, #-16]
	add	x13, x13, #64
	subs	x17, x17, #8
	b.ne	.L14
; %bb.15:
	cmp	x12, x10
	b.eq	.L11
	b	.L9
.L16:
	mov	x0, x12
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_invalidlayout
.L17:
	mov	x0, x12
	mov	x1, x9
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_outofmemory
.L18:
	and	x2, x15, #0xff8
	mov	x0, x23
	mov	x1, x21
	bl	_gc_poll_slow
	b	.L12
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
	strb	wzr, [x23, #64]
	ldrb	w8, [x20], #4
	sub	w8, w8, #39
	cmp	w8, #15
	b.hs	.L2
; %bb.1:
Lloh7:
	adrp	x9, _dispatch_setc@PAGE
Lloh8:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
.L2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh7, Lloh8
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_SetCondJ
_vm_op_SetCondJ:                        ; @vm_op_SetCondJ
; %bb.0:
	mov	w8, #1                          ; =0x1
	strb	w8, [x23, #64]
	ldrb	w8, [x20], #4
	sub	w8, w8, #39
	cmp	w8, #15
	b.hs	.L2
; %bb.1:
Lloh9:
	adrp	x9, _dispatch_setc@PAGE
Lloh10:
	add	x9, x9, _dispatch_setc@PAGEOFF
	ldr	x2, [x9, w8, uxtw #3]
	br	x2
.L2:
	b	_vm_op_setcond_bad_op
	.loh AdrpAdd	Lloh9, Lloh10
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
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
; %bb.0:
Lloh11:
	adrp	x25, l_.str@PAGE
Lloh12:
	add	x25, x25, l_.str@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh11, Lloh12
                                        ; -- End function
	.p2align	5                               ; -- Begin function panic
_panic:                                 ; @panic
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
Lloh13:
	adrp	x8, ___stderrp@GOTPAGE
Lloh14:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh15:
	ldr	x0, [x8]
	str	x25, [sp]
Lloh16:
	adrp	x1, l_.str.2@PAGE
Lloh17:
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fprintf
	mov	w0, #255                        ; =0xff
	bl	_exit
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpLdrGotLdr	Lloh13, Lloh14, Lloh15
                                        ; -- End function
	.p2align	5                               ; -- Begin function badop
_badop:                                 ; @badop
; %bb.0:
Lloh18:
	adrp	x25, l_.str.3@PAGE
Lloh19:
	add	x25, x25, l_.str.3@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh18, Lloh19
                                        ; -- End function
	.p2align	2                               ; -- Begin function member_slot
_member_slot:                           ; @member_slot
; %bb.0:
	mov	x8, x0
	mov	x16, #-562949953421313          ; =0xfffdffffffffffff
	cmp	x1, x16
	b.ls	.L7
; %bb.1:
	mov	x0, #0                          ; =0x0
	cbz	x8, .L14
; %bb.2:
	and	x16, x8, #0xfffffffffffffffe
	and	x16, x16, #0xfffe000000000003
	cbnz	x16, .L14
; %bb.3:
	and	x8, x8, #0x1fffffffffff8
	ldr	x16, [x8]
	tst	x16, #0xff
	b.eq	.L8
; %bb.4:
	mov	x0, #0                          ; =0x0
	and	w17, w16, #0xff
	cmp	w17, #4
	b.eq	.L9
; %bb.5:
	sxtb	w16, w16
	cmp	w16, #5
	b.ne	.L14
; %bb.6:
	ldr	x16, [x8, #24]
	and	x16, x16, #0xfffffffffffffff8
	add	x0, x8, #32
	b	.L10
.L7:
	ldur	w16, [x1, #-1]
	sub	x2, x16, #9
	add	x1, x1, #3
	mov	x0, x8
	b	_member_slot_named
.L8:
	mov	w17, w1
	lsr	x16, x16, #32
	sub	x16, x16, #16
	add	x8, x8, w1, uxtw #3
	add	x8, x8, #16
	cmp	x17, x16, lsr #3
	csel	x0, x8, xzr, lo
	ret
.L9:
	mov	x16, x8
.L10:
	ldr	x8, [x8, #16]
	ldur	x8, [x8, #12]
	and	x8, x8, #0xfffffffffffffff8
	ldr	w8, [x8]
	cmp	w8, w1
	b.ls	.L15
; %bb.11:
	cbz	x0, .L13
; %bb.12:
	ldrb	w1, [x0, w1, uxtw]
.L13:
	add	w8, w1, #1
	add	x8, x16, w8, uxtw #3
	add	x0, x8, #16
.L14:
	ret
.L15:
	mov	x0, #0                          ; =0x0
	ret
                                        ; -- End function
	.p2align	5                               ; -- Begin function nomember
_nomember:                              ; @nomember
; %bb.0:
Lloh20:
	adrp	x25, l_.str.4@PAGE
Lloh21:
	add	x25, x25, l_.str.4@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh20, Lloh21
                                        ; -- End function
	.p2align	2                               ; -- Begin function member_slot_named
_member_slot_named:                     ; @member_slot_named
; %bb.0:
	str	x15, [sp, #-160]!               ; 8-byte Folded Spill
	stp	x14, x13, [sp, #16]             ; 16-byte Folded Spill
	stp	x12, x11, [sp, #32]             ; 16-byte Folded Spill
	stp	x10, x9, [sp, #48]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	mov	x21, #0                         ; =0x0
	cbz	x0, .L34
; %bb.1:
	and	x8, x0, #0xfffffffffffffffe
	and	x8, x8, #0xfffe000000000003
	cbnz	x8, .L34
; %bb.2:
	mov	x19, x2
	mov	x20, x1
	and	x22, x0, #0x1fffffffffff8
	ldr	x8, [x22]
	and	x16, x8, #0xff
	cmp	x16, #3
	b.ne	.L8
; %bb.3:
	ldr	x8, [x22, #16]!
	and	x8, x8, #0xfffffffffffffff8
	ldp	w16, w17, [x8, #4]
	adds	w21, w17, w16
	b.eq	.L12
; %bb.4:
	mov	x23, #0                         ; =0x0
	ldr	w16, [x8]
	add	x8, x8, x16, lsl #4
	add	x24, x8, #40
	b	.L6
.L5:                                ;   in Loop: Header=BB60_6 Depth=1
	add	x23, x23, #1
	add	x24, x24, #16
	cmp	x21, x23
	b.eq	.L11
.L6:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x24]
	cmp	x19, x8
	b.ne	.L5
; %bb.7:                                ;   in Loop: Header=BB60_6 Depth=1
	ldur	x0, [x24, #-8]
	mov	x1, x20
	mov	x2, x19
	bl	_memcmp
	cbnz	w0, .L5
	b	.L13
.L8:
	mov	x21, #0                         ; =0x0
	and	w16, w8, #0xff
	cmp	w16, #4
	b.eq	.L14
; %bb.9:
	sxtb	w8, w8
	cmp	w8, #5
	b.ne	.L34
; %bb.10:
	ldr	x8, [x22, #24]
	and	x23, x8, #0xfffffffffffffff8
	add	x21, x22, #32
	b	.L15
.L11:
	mov	x23, x21
	b	.L13
.L12:
	mov	w23, #0                         ; =0x0
.L13:
	cmp	w23, w21
	csel	w8, w23, w21, lo
	add	w8, w8, #1
	add	x8, x22, w8, uxtw #3
	b	.L33
.L14:
	mov	x23, x22
.L15:
	ldr	x22, [x22, #16]
	ldr	x8, [x22, #12]!
	and	x24, x8, #0xfffffffffffffff8
	ldr	w25, [x24]
	cbz	w25, .L20
; %bb.16:
	mov	x26, #0                         ; =0x0
	add	x27, x24, #40
	b	.L18
.L17:                               ;   in Loop: Header=BB60_18 Depth=1
	add	x26, x26, #1
	add	x27, x27, #16
	cmp	x25, x26
	b.eq	.L25
.L18:                               ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x27]
	cmp	x19, x8
	b.ne	.L17
; %bb.19:                               ;   in Loop: Header=BB60_18 Depth=1
	ldur	x0, [x27, #-8]
	mov	x1, x20
	mov	x2, x19
	bl	_memcmp
	cbnz	w0, .L17
	b	.L21
.L20:
	mov	w26, #0                         ; =0x0
.L21:
	cmp	w26, w25
	csel	w8, w26, w25, lo
	cmp	w26, w25
	b.hs	.L25
; %bb.22:
	cbz	x21, .L24
; %bb.23:
	ldrb	w8, [x21, w8, uxtw]
.L24:
	add	w8, w8, #1
	add	x8, x23, w8, uxtw #3
	add	x21, x8, #16
	b	.L34
.L25:
	ldr	w21, [x24, #4]
	cbz	w21, .L31
; %bb.26:
	mov	x23, #0                         ; =0x0
	add	x8, x24, x25, lsl #4
	add	x24, x8, #40
	b	.L28
.L27:                               ;   in Loop: Header=BB60_28 Depth=1
	add	x23, x23, #1
	add	x24, x24, #16
	cmp	x21, x23
	b.eq	.L30
.L28:                               ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x24]
	cmp	x19, x8
	b.ne	.L27
; %bb.29:                               ;   in Loop: Header=BB60_28 Depth=1
	ldur	x0, [x24, #-8]
	mov	x1, x20
	mov	x2, x19
	bl	_memcmp
	cbnz	w0, .L27
	b	.L32
.L30:
	mov	x23, x21
	b	.L32
.L31:
	mov	w23, #0                         ; =0x0
.L32:
	cmp	w23, w21
	csel	w8, w23, w21, lo
	add	w8, w8, #1
	add	x8, x22, w8, uxtw #3
	cmp	w23, w21
.L33:
	csel	x21, x8, xzr, lo
.L34:
	mov	x0, x21
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #48]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #32]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #16]             ; 16-byte Folded Reload
	ldr	x15, [sp], #160                 ; 8-byte Folded Reload
	ret
                                        ; -- End function
	.p2align	2                               ; -- Begin function field_slot
_field_slot:                            ; @field_slot
; %bb.0:
	mov	x3, x2
	mov	x8, x0
	mov	x16, #-562949953421313          ; =0xfffdffffffffffff
	cmp	x1, x16
	b.ls	.L6
; %bb.1:
	mov	x0, #0                          ; =0x0
	cbz	x8, .L12
; %bb.2:
	and	x16, x8, #0xfffffffffffffffe
	and	x16, x16, #0xfffe000000000003
	cbnz	x16, .L12
; %bb.3:
	mov	x0, #0                          ; =0x0
	and	x16, x8, #0x1fffffffffff8
	ldr	w8, [x16]
	and	w17, w8, #0xff
	cmp	w17, #4
	b.eq	.L7
; %bb.4:
	sxtb	w8, w8
	cmp	w8, #5
	b.ne	.L12
; %bb.5:
	ldr	x8, [x16, #24]
	and	x8, x8, #0xfffffffffffffff8
	add	x0, x16, #32
	b	.L8
.L6:
	ldur	w16, [x1, #-1]
	sub	x2, x16, #9
	add	x1, x1, #3
	mov	x0, x8
	b	_field_slot_named
.L7:
	mov	x8, x16
.L8:
	ldr	x16, [x16, #16]
	ldur	x16, [x16, #12]
	and	x16, x16, #0xfffffffffffffff8
	ldr	w16, [x16]
	cmp	w16, w1
	b.ls	.L13
; %bb.9:
	str	x8, [x3]
	cbz	x0, .L11
; %bb.10:
	ldrb	w1, [x0, w1, uxtw]
.L11:
	add	w16, w1, #1
	add	x8, x8, w16, uxtw #3
	add	x0, x8, #16
.L12:
	ret
.L13:
	mov	x0, #0                          ; =0x0
	ret
                                        ; -- End function
	.p2align	5                               ; -- Begin function notafield
_notafield:                             ; @notafield
; %bb.0:
Lloh22:
	adrp	x25, l_.str.5@PAGE
Lloh23:
	add	x25, x25, l_.str.5@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh22, Lloh23
                                        ; -- End function
	.p2align	2                               ; -- Begin function field_slot_named
_field_slot_named:                      ; @field_slot_named
; %bb.0:
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
	mov	x19, #0                         ; =0x0
	cbz	x0, .L17
; %bb.1:
	and	x8, x0, #0xfffffffffffffffe
	and	x8, x8, #0xfffe000000000003
	cbnz	x8, .L17
; %bb.2:
	mov	x20, x3
	mov	x21, x2
	mov	x22, x1
	mov	x19, #0                         ; =0x0
	and	x8, x0, #0x1fffffffffff8
	ldr	w16, [x8]
	and	w17, w16, #0xff
	cmp	w17, #4
	b.eq	.L5
; %bb.3:
	sxtb	w16, w16
	cmp	w16, #5
	b.ne	.L17
; %bb.4:
	ldr	x16, [x8, #24]
	and	x23, x16, #0xfffffffffffffff8
	add	x19, x8, #32
	b	.L6
.L5:
	mov	x23, x8
.L6:
	ldr	x8, [x8, #16]
	ldur	x8, [x8, #12]
	and	x8, x8, #0xfffffffffffffff8
	ldr	w24, [x8]
	cbz	w24, .L11
; %bb.7:
	mov	x25, #0                         ; =0x0
	add	x26, x8, #40
	b	.L9
.L8:                                ;   in Loop: Header=BB63_9 Depth=1
	add	x25, x25, #1
	add	x26, x26, #16
	cmp	x24, x25
	b.eq	.L16
.L9:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x26]
	cmp	x21, x8
	b.ne	.L8
; %bb.10:                               ;   in Loop: Header=BB63_9 Depth=1
	ldur	x0, [x26, #-8]
	mov	x1, x22
	mov	x2, x21
	bl	_memcmp
	cbnz	w0, .L8
	b	.L12
.L11:
	mov	w25, #0                         ; =0x0
.L12:
	cmp	w25, w24
	csel	w8, w25, w24, lo
	b.hs	.L16
; %bb.13:
	str	x23, [x20]
	cbz	x19, .L15
; %bb.14:
	ldrb	w8, [x19, w8, uxtw]
.L15:
	add	w8, w8, #1
	add	x8, x23, w8, uxtw #3
	add	x19, x8, #16
	b	.L17
.L16:
	mov	x19, #0                         ; =0x0
.L17:
	mov	x0, x19
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #48]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #32]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #16]             ; 16-byte Folded Reload
	ldr	x15, [sp], #144                 ; 8-byte Folded Reload
	ret
                                        ; -- End function
	.p2align	2                               ; -- Begin function typed_member_slow
_typed_member_slow:                     ; @typed_member_slow
; %bb.0:
	stp	x10, x9, [sp, #-32]!            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x9, x1
	mov	x1, x2
	mov	x2, x3
	bl	_typed_field_name
	cbz	x0, .L2
; %bb.1:
	ldr	x1, [x0]
	ldr	w2, [x0, #8]
	mov	x0, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp], #32              ; 16-byte Folded Reload
	b	_member_slot_named
.L2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp], #32              ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.p2align	2                               ; -- Begin function typed_field_name
_typed_field_name:                      ; @typed_field_name
; %bb.0:
	mov	w8, w1
	ldr	x16, [x0, #40]
	cmp	x16, x8
	b.ls	.L2
; %bb.1:
	ldr	x16, [x0, #24]
	ldr	x8, [x16, x8, lsl #3]
	ldr	x8, [x8, #16]
	and	x8, x8, #0xfffffffffffffff8
	ldr	w16, [x8]
	add	x8, x8, w2, uxtw #4
	add	x8, x8, #32
	cmp	w2, w16
	csel	x0, x8, xzr, lo
	ret
.L2:
	mov	x0, #0                          ; =0x0
	ret
                                        ; -- End function
	.p2align	2                               ; -- Begin function typed_field_slow
_typed_field_slow:                      ; @typed_field_slow
; %bb.0:
	stp	x10, x9, [sp, #-32]!            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x9, x4
	mov	x10, x1
	mov	x1, x2
	mov	x2, x3
	bl	_typed_field_name
	cbz	x0, .L2
; %bb.1:
	ldr	x1, [x0]
	ldr	w2, [x0, #8]
	mov	x0, x10
	mov	x3, x9
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp], #32              ; 16-byte Folded Reload
	b	_field_slot_named
.L2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x10, x9, [sp], #32              ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.p2align	5                               ; -- Begin function notatype
_notatype:                              ; @notatype
; %bb.0:
Lloh24:
	adrp	x25, l_.str.6@PAGE
Lloh25:
	add	x25, x25, l_.str.6@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh24, Lloh25
                                        ; -- End function
	.p2align	5                               ; -- Begin function notaninstance
_notaninstance:                         ; @notaninstance
; %bb.0:
Lloh26:
	adrp	x25, l_.str.7@PAGE
Lloh27:
	add	x25, x25, l_.str.7@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh26, Lloh27
                                        ; -- End function
	.p2align	2                               ; -- Begin function view_template
_view_template:                         ; @view_template
; %bb.0:
	sub	sp, sp, #208
	str	x15, [sp, #48]                  ; 8-byte Folded Spill
	stp	x14, x13, [sp, #64]             ; 16-byte Folded Spill
	stp	x12, x11, [sp, #80]             ; 16-byte Folded Spill
	stp	x10, x9, [sp, #96]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #112]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #128]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #144]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #160]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #176]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	add	x29, sp, #192
	mov	x19, x2
	mov	x21, x1
	mov	x20, x0
	str	xzr, [x2]
	ldr	x25, [x0, #24]
	cbz	x25, .L4
; %bb.1:
	mov	x8, x25
.L2:                                ; =>This Inner Loop Header: Depth=1
	ldr	x16, [x8]
	cmp	x16, x21
	b.eq	.L15
; %bb.3:                                ;   in Loop: Header=BB69_2 Depth=1
	ldr	x8, [x8, #8]
	cbnz	x8, .L2
.L4:
	ldr	w23, [x21]
	add	x0, x23, #16
	bl	_malloc
	cbz	x0, .L17
; %bb.5:
	mov	x22, x0
	str	x19, [sp, #56]                  ; 8-byte Folded Spill
	cbz	w23, .L14
; %bb.6:
	mov	x8, #0                          ; =0x0
	add	x16, x21, #32
	mov	x17, x20
	ldr	w28, [x17], #40
	str	x17, [sp, #40]                  ; 8-byte Folded Spill
	add	x17, x22, #16
	stp	x17, x16, [sp, #8]              ; 16-byte Folded Spill
	str	x23, [sp, #24]                  ; 8-byte Folded Spill
.L7:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB69_10 Depth 2
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	add	x19, x16, x8, lsl #4
	cbz	w28, .L16
; %bb.8:                                ;   in Loop: Header=BB69_7 Depth=1
	mov	x27, #0                         ; =0x0
	ldr	x23, [x19]
	ldr	w24, [x19, #8]
	ldr	x26, [sp, #40]                  ; 8-byte Folded Reload
	b	.L10
.L9:                                ;   in Loop: Header=BB69_10 Depth=2
	add	x27, x27, #1
	add	x26, x26, #16
	cmp	x28, x27
	b.eq	.L16
.L10:                               ;   Parent Loop BB69_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [x26]
	cmp	w24, w8
	b.ne	.L9
; %bb.11:                               ;   in Loop: Header=BB69_10 Depth=2
	ldur	x0, [x26, #-8]
	mov	x1, x23
	mov	x2, x24
	bl	_memcmp
	cbnz	w0, .L9
; %bb.12:                               ;   in Loop: Header=BB69_7 Depth=1
	cmp	w28, w27
	b.ls	.L16
; %bb.13:                               ;   in Loop: Header=BB69_7 Depth=1
	ldp	x23, x8, [sp, #24]              ; 16-byte Folded Reload
	ldp	x17, x16, [sp, #8]              ; 16-byte Folded Reload
	strb	w27, [x17, x8]
	add	x8, x8, #1
	cmp	x8, x23
	b.ne	.L7
.L14:
	stp	x21, x25, [x22]
	add	x0, x22, #16
	str	x22, [x20, #24]
	b	.L17
.L15:
	add	x0, x8, #16
	b	.L17
.L16:
	mov	x0, x22
	bl	_free
	mov	x0, #0                          ; =0x0
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	str	x19, [x8]
.L17:
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #176]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #160]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #128]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #112]            ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #96]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #80]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #64]             ; 16-byte Folded Reload
	ldr	x15, [sp, #48]                  ; 8-byte Folded Reload
	add	sp, sp, #208
	ret
                                        ; -- End function
	.p2align	5                               ; -- Begin function outofmemory
_outofmemory:                           ; @outofmemory
; %bb.0:
Lloh28:
	adrp	x25, l_.str.8@PAGE
Lloh29:
	add	x25, x25, l_.str.8@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh28, Lloh29
                                        ; -- End function
	.p2align	2                               ; -- Begin function cannotview_format
_cannotview_format:                     ; @cannotview_format
; %bb.0:
	sub	sp, sp, #128
	stp	x14, x13, [sp, #64]             ; 16-byte Folded Spill
	stp	x12, x11, [sp, #80]             ; 16-byte Folded Spill
	stp	x10, x9, [sp, #96]              ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	ldr	x8, [x0, #16]
	ldr	x16, [x1, #16]
	ldr	x17, [x2]
	ldr	w3, [x0, #12]
	ldr	w0, [x1, #12]
	ldr	w1, [x2, #8]
	stp	x17, x15, [sp, #40]             ; 8-byte Folded Spill
	stp	x16, x1, [sp, #24]
	stp	x8, x0, [sp, #8]
Lloh30:
	adrp	x0, _cannotview_msg@PAGE
Lloh31:
	add	x0, x0, _cannotview_msg@PAGEOFF
	str	x3, [sp]
Lloh32:
	adrp	x2, l_.str.9@PAGE
Lloh33:
	add	x2, x2, l_.str.9@PAGEOFF
	mov	w1, #256                        ; =0x100
	bl	_snprintf
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x10, x9, [sp, #96]              ; 16-byte Folded Reload
	ldp	x12, x11, [sp, #80]             ; 16-byte Folded Reload
	ldp	x14, x13, [sp, #64]             ; 16-byte Folded Reload
	ldr	x15, [sp, #48]                  ; 8-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh30, Lloh31
                                        ; -- End function
	.p2align	5                               ; -- Begin function cannotview
_cannotview:                            ; @cannotview
; %bb.0:
Lloh34:
	adrp	x25, _cannotview_msg@PAGE
Lloh35:
	add	x25, x25, _cannotview_msg@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh34, Lloh35
                                        ; -- End function
	.p2align	5                               ; -- Begin function notafunction
_notafunction:                          ; @notafunction
; %bb.0:
Lloh36:
	adrp	x25, l_.str.10@PAGE
Lloh37:
	add	x25, x25, l_.str.10@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh36, Lloh37
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
; %bb.0:
Lloh38:
	adrp	x25, l_.str.11@PAGE
Lloh39:
	add	x25, x25, l_.str.11@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh38, Lloh39
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
	cbz	x0, .L2
; %bb.1:
	mov	x10, x0
	mov	x1, x9
	bl	_thunk_instance_init
	mov	x0, x10
.L2:
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
Lloh40:
	adrp	x25, l_.str.12@PAGE
Lloh41:
	add	x25, x25, l_.str.12@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh40, Lloh41
                                        ; -- End function
	.p2align	5                               ; -- Begin function notaoffset
_notaoffset:                            ; @notaoffset
; %bb.0:
Lloh42:
	adrp	x25, l_.str.13@PAGE
Lloh43:
	add	x25, x25, l_.str.13@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh42, Lloh43
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
	cmp	w8, #27
	b.le	.L13
; %bb.9:
	cmp	w8, #28
	b.eq	.L16
; %bb.10:
	cmp	w8, #29
	b.eq	.L18
; %bb.11:
	cmp	w8, #30
	b.ne	.L20
; %bb.12:
	fdiv	d2, d0, d1
	frintm	d2, d2
	fmsub	d0, d2, d1, d0
	b	.L19
.L13:
	cmp	w8, #26
	b.eq	.L17
; %bb.14:
	cmp	w8, #27
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
Lloh44:
	adrp	x25, l_.str.14@PAGE
Lloh45:
	add	x25, x25, l_.str.14@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh44, Lloh45
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
	cmp	w8, #36
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
	cmp	w8, #32
	b.le	.L14
.L8:
	cmp	w8, #33
	b.eq	.L17
; %bb.9:
	cmp	w8, #34
	b.eq	.L19
; %bb.10:
	cmp	w8, #35
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
	cmp	w8, #32
	b.gt	.L8
.L14:
	cmp	w8, #31
	b.eq	.L18
; %bb.15:
	cmp	w8, #32
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
Lloh46:
	adrp	x25, l_.str.15@PAGE
Lloh47:
	add	x25, x25, l_.str.15@PAGEOFF
	b	_panic
	.loh AdrpAdd	Lloh46, Lloh47
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	ldrb	w8, [x23, #64]
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
	cmp	w10, #47
	b.hi	.L2
; %bb.1:
	ldr	x12, [x23, #16]
.L2:
	lsr	x13, x11, #16
	ldr	x1, [x12, x13, lsl #3]
	and	w11, w11, #0xff
	cmp	w11, #47
	b.gt	.L5
; %bb.3:
	cmp	w11, #42
	b.eq	.L7
; %bb.4:
	cmp	w11, #43
	b.eq	.L8
	b	.L11
.L5:
	cmp	w11, #49
	b.eq	.L8
; %bb.6:
	cmp	w11, #48
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
	ldrb	w8, [x23, #64]
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
	cmp	w0, #47
	b.gt	.L5
; %bb.1:
	cmp	w0, #44
	b.gt	.L9
; %bb.2:
	cmp	w0, #42
	b.eq	.L15
; %bb.3:
	cmp	w0, #43
	b.eq	.L8
.L4:
	fcmp	d0, d1
	cset	w0, mi
	ret
.L5:
	cmp	w0, #50
	b.gt	.L12
; %bb.6:
	cmp	w0, #48
	b.eq	.L15
; %bb.7:
	cmp	w0, #49
	b.ne	.L4
.L8:
	fcmp	d0, d1
	cset	w0, ne
	ret
.L9:
	cmp	w0, #45
	b.eq	.L16
; %bb.10:
	cmp	w0, #46
	b.eq	.L14
.L11:
	fcmp	d0, d1
	cset	w0, ge
	ret
.L12:
	cmp	w0, #51
	b.eq	.L16
; %bb.13:
	cmp	w0, #52
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
	cmp	w10, #47
	b.gt	.L3
; %bb.1:
	cmp	w10, #42
	b.eq	.L5
; %bb.2:
	cmp	w10, #43
	b.eq	.L6
	b	.L7
.L3:
	cmp	w10, #49
	b.eq	.L6
; %bb.4:
	cmp	w10, #48
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
	cmp	w10, #47
	b.gt	.L3
; %bb.1:
	cmp	w10, #42
	b.eq	.L5
; %bb.2:
	cmp	w10, #43
	b.eq	.L6
	b	.L7
.L3:
	cmp	w10, #49
	b.eq	.L6
; %bb.4:
	cmp	w10, #48
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
	.quad	_vm_op_Halt
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
	.quad	_vm_op_LoadInd
	.quad	_vm_op_SetInd
	.quad	_vm_op_View
	.quad	_vm_op_Move
	.quad	_vm_op_Apply
	.quad	_vm_op_Invoke
	.quad	_vm_op_Call
	.quad	_vm_op_Native
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

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"unused extra arguments"

l_.str.2:                               ; @.str.2
	.asciz	"panic: %s\n"

l_.str.3:                               ; @.str.3
	.asciz	"bad opcode"

l_.str.4:                               ; @.str.4
	.asciz	"no such member"

l_.str.5:                               ; @.str.5
	.asciz	"not a field"

l_.str.6:                               ; @.str.6
	.asciz	"not a type"

l_.str.7:                               ; @.str.7
	.asciz	"not an instance"

l_.str.8:                               ; @.str.8
	.asciz	"out of memory"

.zerofill __DATA,__bss,_cannotview_msg,256,0 ; @cannotview_msg
l_.str.9:                               ; @.str.9
	.asciz	"cannot view %.*s as %.*s: no field %.*s"

l_.str.10:                              ; @.str.10
	.asciz	"not a function"

l_.str.11:                              ; @.str.11
	.asciz	"stack overflow"

l_.str.12:                              ; @.str.12
	.asciz	"invalid layout"

l_.str.13:                              ; @.str.13
	.asciz	"not a offset"

l_.str.14:                              ; @.str.14
	.asciz	"not a number"

l_.str.15:                              ; @.str.15
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
