	.text
	.file	"vm.c"
	.globl	vm_entry                        // -- Begin function vm_entry
	.p2align	2
	.type	vm_entry,@function
vm_entry:                               // @vm_entry
	.cfi_startproc
// %bb.0:                               // %entry
	stp	d15, d14, [sp, #-160]!          // 16-byte Folded Spill
	.cfi_def_cfa_offset 160
	stp	d13, d12, [sp, #16]             // 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #80]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 96
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
	ldp	x8, x6, [x0]
	adrp	x5, dispatch
	add	x5, x5, :lo12:dispatch
	ldr	x3, [x0, #40]
	mov	x4, x0
	ldr	w9, [x8, #8]
	add	x0, x8, #12
	and	x10, x9, #0xff
	ubfx	x2, x9, #8, #24
	asr	w1, w9, #16
	ldr	x9, [x5, x10, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	blr	x9
	mov	w0, wzr
	.cfi_def_cfa wsp, 160
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             // 16-byte Folded Reload
	ldp	d15, d14, [sp], #160            // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	.cfi_restore w27
	.cfi_restore w28
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
.Lfunc_end0:
	.size	vm_entry, .Lfunc_end0-vm_entry
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_NOP
	.type	vm_op_NOP,@function
vm_op_NOP:                              // @vm_op_NOP
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end1:
	.size	vm_op_NOP, .Lfunc_end1-vm_op_NOP
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_STOPii
	.type	vm_op_STOPii,@function
vm_op_STOPii:                           // @vm_op_STOPii
	.cfi_startproc
// %bb.0:                               // %entry
	and	w22, w1, #0xffff
                                        // kill: def $w2 killed $w2 def $x2
	cmp	w22, w2, uxtb
	b.ls	.LBB2_3
// %bb.1:                               // %for.body.lr.ph
	mov	x19, x3
	and	x20, x2, #0xff
	adrp	x21, .L.str
	add	x21, x21, :lo12:.L.str
	//APP
	mov	x23, x30
	//NO_APP
.LBB2_2:                                // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x2, [x19, x20, lsl #3]
	mov	x0, x21
	mov	w1, w20
	bl	printf
	add	x20, x20, #1
	//APP
	mov	x30, x23
	//NO_APP
	cmp	x22, x20
	b.ne	.LBB2_2
.LBB2_3:                                // %for.cond.cleanup
	ret
.Lfunc_end2:
	.size	vm_op_STOPii, .Lfunc_end2-vm_op_STOPii
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPLTll
	.type	vm_op_CMPLTll,@function
vm_op_CMPLTll:                          // @vm_op_CMPLTll
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	w9, w1, #0xff
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	ldr	x9, [x3, w9, uxtw #3]
	add	x0, x0, #4
	cmp	x10, x9
	b.lt	.LBB3_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB3_2:                                // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end3:
	.size	vm_op_CMPLTll, .Lfunc_end3-vm_op_CMPLTll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPLEll
	.type	vm_op_CMPLEll,@function
vm_op_CMPLEll:                          // @vm_op_CMPLEll
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	w9, w1, #0xff
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	ldr	x9, [x3, w9, uxtw #3]
	add	x0, x0, #4
	cmp	x10, x9
	b.le	.LBB4_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB4_2:                                // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end4:
	.size	vm_op_CMPLEll, .Lfunc_end4-vm_op_CMPLEll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPEQll
	.type	vm_op_CMPEQll,@function
vm_op_CMPEQll:                          // @vm_op_CMPEQll
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	w9, w1, #0xff
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	ldr	x9, [x3, w9, uxtw #3]
	add	x0, x0, #4
	cmp	x10, x9
	b.eq	.LBB5_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB5_2:                                // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end5:
	.size	vm_op_CMPEQll, .Lfunc_end5-vm_op_CMPEQll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPNEll
	.type	vm_op_CMPNEll,@function
vm_op_CMPNEll:                          // @vm_op_CMPNEll
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	w9, w1, #0xff
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	ldr	x9, [x3, w9, uxtw #3]
	add	x0, x0, #4
	cmp	x10, x9
	b.ne	.LBB6_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB6_2:                                // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end6:
	.size	vm_op_CMPNEll, .Lfunc_end6-vm_op_CMPNEll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPLTli
	.type	vm_op_CMPLTli,@function
vm_op_CMPLTli:                          // @vm_op_CMPLTli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	mov	x8, x0
	add	x0, x0, #4
	ldr	x9, [x3, x9, lsl #3]
	cmp	x9, w1, sxtw
	b.lt	.LBB7_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB7_2:                                // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end7:
	.size	vm_op_CMPLTli, .Lfunc_end7-vm_op_CMPLTli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPLEli
	.type	vm_op_CMPLEli,@function
vm_op_CMPLEli:                          // @vm_op_CMPLEli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	mov	x8, x0
	add	x0, x0, #4
	ldr	x9, [x3, x9, lsl #3]
	cmp	x9, w1, sxtw
	b.le	.LBB8_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB8_2:                                // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end8:
	.size	vm_op_CMPLEli, .Lfunc_end8-vm_op_CMPLEli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPGTli
	.type	vm_op_CMPGTli,@function
vm_op_CMPGTli:                          // @vm_op_CMPGTli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	mov	x8, x0
	add	x0, x0, #4
	ldr	x9, [x3, x9, lsl #3]
	cmp	x9, w1, sxtw
	b.gt	.LBB9_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB9_2:                                // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end9:
	.size	vm_op_CMPGTli, .Lfunc_end9-vm_op_CMPGTli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPGEli
	.type	vm_op_CMPGEli,@function
vm_op_CMPGEli:                          // @vm_op_CMPGEli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	mov	x8, x0
	add	x0, x0, #4
	ldr	x9, [x3, x9, lsl #3]
	cmp	x9, w1, sxtw
	b.ge	.LBB10_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB10_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end10:
	.size	vm_op_CMPGEli, .Lfunc_end10-vm_op_CMPGEli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPEQli
	.type	vm_op_CMPEQli,@function
vm_op_CMPEQli:                          // @vm_op_CMPEQli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	mov	x8, x0
	add	x0, x0, #4
	ldr	x9, [x3, x9, lsl #3]
	cmp	x9, w1, sxtw
	b.eq	.LBB11_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB11_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end11:
	.size	vm_op_CMPEQli, .Lfunc_end11-vm_op_CMPEQli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPNEli
	.type	vm_op_CMPNEli,@function
vm_op_CMPNEli:                          // @vm_op_CMPNEli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	mov	x8, x0
	add	x0, x0, #4
	ldr	x9, [x3, x9, lsl #3]
	cmp	x9, w1, sxtw
	b.ne	.LBB12_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB12_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end12:
	.size	vm_op_CMPNEli, .Lfunc_end12-vm_op_CMPNEli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPLTlc
	.type	vm_op_CMPLTlc,@function
vm_op_CMPLTlc:                          // @vm_op_CMPLTlc
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	x9, [x4, #32]
                                        // kill: def $w2 killed $w2 def $x2
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	add	x0, x0, #4
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.lt	.LBB13_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB13_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end13:
	.size	vm_op_CMPLTlc, .Lfunc_end13-vm_op_CMPLTlc
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPLElc
	.type	vm_op_CMPLElc,@function
vm_op_CMPLElc:                          // @vm_op_CMPLElc
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	x9, [x4, #32]
                                        // kill: def $w2 killed $w2 def $x2
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	add	x0, x0, #4
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.le	.LBB14_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB14_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end14:
	.size	vm_op_CMPLElc, .Lfunc_end14-vm_op_CMPLElc
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPGTlc
	.type	vm_op_CMPGTlc,@function
vm_op_CMPGTlc:                          // @vm_op_CMPGTlc
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	x9, [x4, #32]
                                        // kill: def $w2 killed $w2 def $x2
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	add	x0, x0, #4
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.gt	.LBB15_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB15_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end15:
	.size	vm_op_CMPGTlc, .Lfunc_end15-vm_op_CMPGTlc
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPGElc
	.type	vm_op_CMPGElc,@function
vm_op_CMPGElc:                          // @vm_op_CMPGElc
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	x9, [x4, #32]
                                        // kill: def $w2 killed $w2 def $x2
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	add	x0, x0, #4
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.ge	.LBB16_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB16_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end16:
	.size	vm_op_CMPGElc, .Lfunc_end16-vm_op_CMPGElc
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPEQlc
	.type	vm_op_CMPEQlc,@function
vm_op_CMPEQlc:                          // @vm_op_CMPEQlc
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	x9, [x4, #32]
                                        // kill: def $w2 killed $w2 def $x2
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	add	x0, x0, #4
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.eq	.LBB17_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB17_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end17:
	.size	vm_op_CMPEQlc, .Lfunc_end17-vm_op_CMPEQlc
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CMPNElc
	.type	vm_op_CMPNElc,@function
vm_op_CMPNElc:                          // @vm_op_CMPNElc
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	x9, [x4, #32]
                                        // kill: def $w2 killed $w2 def $x2
	and	x10, x2, #0xff
	mov	x8, x0
	ldr	x10, [x3, x10, lsl #3]
	add	x0, x0, #4
	ldr	x9, [x9, w1, sxtw #3]
	cmp	x10, x9
	b.ne	.LBB18_2
// %bb.1:                               // %if.then
	ldrsh	x8, [x8, #2]
	add	x0, x0, x8, lsl #2
.LBB18_2:                               // %do.end
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end18:
	.size	vm_op_CMPNElc, .Lfunc_end18-vm_op_CMPNElc
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_ADDlli
	.type	vm_op_ADDlli,@function
vm_op_ADDlli:                           // @vm_op_ADDlli
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	w8, [x0], #4
                                        // kill: def $w2 killed $w2 def $x2
	and	x11, x2, #0xff
	and	w9, w1, #0xff
	ubfx	w10, w1, #8, #8
	and	x12, x8, #0xff
	ubfx	x2, x8, #8, #24
	asr	w1, w8, #16
	ldr	x8, [x3, x11, lsl #3]
	ldr	x7, [x5, x12, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	add	x8, x8, x10
	str	x8, [x3, w9, uxtw #3]
	br	x7
.Lfunc_end19:
	.size	vm_op_ADDlli, .Lfunc_end19-vm_op_ADDlli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_SUBlli
	.type	vm_op_SUBlli,@function
vm_op_SUBlli:                           // @vm_op_SUBlli
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	w8, [x0], #4
                                        // kill: def $w2 killed $w2 def $x2
	and	x11, x2, #0xff
	and	w9, w1, #0xff
	ubfx	w10, w1, #8, #8
	and	x12, x8, #0xff
	ubfx	x2, x8, #8, #24
	asr	w1, w8, #16
	ldr	x8, [x3, x11, lsl #3]
	ldr	x7, [x5, x12, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	sub	x8, x8, x10
	str	x8, [x3, w9, uxtw #3]
	br	x7
.Lfunc_end20:
	.size	vm_op_SUBlli, .Lfunc_end20-vm_op_SUBlli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_MULlli
	.type	vm_op_MULlli,@function
vm_op_MULlli:                           // @vm_op_MULlli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x8, x2, #0xff
	ubfx	w9, w1, #8, #8
	ldr	x8, [x3, x8, lsl #3]
	ldr	w10, [x0], #4
	mul	x9, x8, x9
	and	x11, x10, #0xff
	asr	w8, w10, #16
	ldr	x7, [x5, x11, lsl #3]
	ubfx	x2, x10, #8, #24
	and	w10, w1, #0xff
	mov	w1, w8
                                        // kill: def $w2 killed $w2 killed $x2
	str	x9, [x3, w10, uxtw #3]
	br	x7
.Lfunc_end21:
	.size	vm_op_MULlli, .Lfunc_end21-vm_op_MULlli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_DIVlli
	.type	vm_op_DIVlli,@function
vm_op_DIVlli:                           // @vm_op_DIVlli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x8, x2, #0xff
	ubfx	w9, w1, #8, #8
	and	w11, w1, #0xff
	ldr	x8, [x3, x8, lsl #3]
	udiv	x9, x8, x9
	ldr	w8, [x0], #4
	and	x10, x8, #0xff
	ubfx	x2, x8, #8, #24
	asr	w8, w8, #16
	ldr	x7, [x5, x10, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	mov	w1, w8
	str	x9, [x3, w11, uxtw #3]
	br	x7
.Lfunc_end22:
	.size	vm_op_DIVlli, .Lfunc_end22-vm_op_DIVlli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_REMlli
	.type	vm_op_REMlli,@function
vm_op_REMlli:                           // @vm_op_REMlli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x8, x2, #0xff
	ubfx	w9, w1, #8, #8
	and	w11, w1, #0xff
	ldr	x8, [x3, x8, lsl #3]
	udiv	x10, x8, x9
	msub	x8, x10, x9, x8
	ldr	w10, [x0], #4
	and	x12, x10, #0xff
	asr	w1, w10, #16
	ubfx	x2, x10, #8, #24
	ldr	x7, [x5, x12, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	cmp	x8, #0
	ccmp	w9, #0, #0, eq
	csel	x9, x9, xzr, eq
	add	x8, x9, x8
	str	x8, [x3, w11, uxtw #3]
	br	x7
.Lfunc_end23:
	.size	vm_op_REMlli, .Lfunc_end23-vm_op_REMlli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_DIRlli
	.type	vm_op_DIRlli,@function
vm_op_DIRlli:                           // @vm_op_DIRlli
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x8, x2, #0xff
	ubfx	w9, w1, #8, #8
	and	w11, w1, #0xff
	ldr	x8, [x3, x8, lsl #3]
	ldr	w12, [x0], #4
	udiv	x10, x8, x9
	asr	w1, w12, #16
	ubfx	x2, x12, #8, #24
                                        // kill: def $w2 killed $w2 killed $x2
	str	x10, [x3, w11, uxtw #3]
	msub	x8, x10, x9, x8
	and	x9, x12, #0xff
	add	w10, w11, #1
	ldr	x7, [x5, x9, lsl #3]
	str	x8, [x3, w10, uxtw #3]
	br	x7
.Lfunc_end24:
	.size	vm_op_DIRlli, .Lfunc_end24-vm_op_DIRlli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_ADDlll
	.type	vm_op_ADDlll,@function
vm_op_ADDlll:                           // @vm_op_ADDlll
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	w9, [x0], #4
	ubfx	w11, w1, #8, #8
                                        // kill: def $w2 killed $w2 def $x2
	and	x8, x2, #0xff
	and	w10, w1, #0xff
	and	x12, x9, #0xff
	ldr	x8, [x3, x8, lsl #3]
	ubfx	x2, x9, #8, #24
	asr	w1, w9, #16
	ldr	x9, [x3, w11, uxtw #3]
	ldr	x7, [x5, x12, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	add	x8, x9, x8
	str	x8, [x3, w10, uxtw #3]
	br	x7
.Lfunc_end25:
	.size	vm_op_ADDlll, .Lfunc_end25-vm_op_ADDlll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_SUBlll
	.type	vm_op_SUBlll,@function
vm_op_SUBlll:                           // @vm_op_SUBlll
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	w9, [x0], #4
	ubfx	w11, w1, #8, #8
                                        // kill: def $w2 killed $w2 def $x2
	and	x8, x2, #0xff
	and	w10, w1, #0xff
	and	x12, x9, #0xff
	ldr	x8, [x3, x8, lsl #3]
	ubfx	x2, x9, #8, #24
	asr	w1, w9, #16
	ldr	x9, [x3, w11, uxtw #3]
	ldr	x7, [x5, x12, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	sub	x8, x8, x9
	str	x8, [x3, w10, uxtw #3]
	br	x7
.Lfunc_end26:
	.size	vm_op_SUBlll, .Lfunc_end26-vm_op_SUBlll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_MULlll
	.type	vm_op_MULlll,@function
vm_op_MULlll:                           // @vm_op_MULlll
	.cfi_startproc
// %bb.0:                               // %entry
	ubfx	w8, w1, #8, #8
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	ldr	x9, [x3, x9, lsl #3]
	ldr	w10, [x0], #4
	ldr	x8, [x3, w8, uxtw #3]
	and	x11, x10, #0xff
	ubfx	x2, x10, #8, #24
	mul	x9, x8, x9
	asr	w8, w10, #16
	ldr	x7, [x5, x11, lsl #3]
	and	w10, w1, #0xff
                                        // kill: def $w2 killed $w2 killed $x2
	mov	w1, w8
	str	x9, [x3, w10, uxtw #3]
	br	x7
.Lfunc_end27:
	.size	vm_op_MULlll, .Lfunc_end27-vm_op_MULlll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_DIVlll
	.type	vm_op_DIVlll,@function
vm_op_DIVlll:                           // @vm_op_DIVlll
	.cfi_startproc
// %bb.0:                               // %entry
	ubfx	w8, w1, #8, #8
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	and	w11, w1, #0xff
	ldr	x9, [x3, x9, lsl #3]
	ldr	x8, [x3, w8, uxtw #3]
	udiv	x9, x9, x8
	ldr	w8, [x0], #4
	and	x10, x8, #0xff
	ubfx	x2, x8, #8, #24
	asr	w8, w8, #16
	ldr	x7, [x5, x10, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	mov	w1, w8
	str	x9, [x3, w11, uxtw #3]
	br	x7
.Lfunc_end28:
	.size	vm_op_DIVlll, .Lfunc_end28-vm_op_DIVlll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_REMlll
	.type	vm_op_REMlll,@function
vm_op_REMlll:                           // @vm_op_REMlll
	.cfi_startproc
// %bb.0:                               // %entry
	ubfx	w8, w1, #8, #8
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	ldr	x9, [x3, x9, lsl #3]
	ldr	w11, [x0], #4
	ldr	x8, [x3, w8, uxtw #3]
	ubfx	x2, x11, #8, #24
	udiv	x10, x9, x8
                                        // kill: def $w2 killed $w2 killed $x2
	msub	x9, x10, x8, x9
	and	x10, x11, #0xff
	asr	w8, w11, #16
	ldr	x7, [x5, x10, lsl #3]
	and	w11, w1, #0xff
	mov	w1, w8
	str	x9, [x3, w11, uxtw #3]
	br	x7
.Lfunc_end29:
	.size	vm_op_REMlll, .Lfunc_end29-vm_op_REMlll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_DIRlll
	.type	vm_op_DIRlll,@function
vm_op_DIRlll:                           // @vm_op_DIRlll
	.cfi_startproc
// %bb.0:                               // %entry
	ubfx	w8, w1, #8, #8
                                        // kill: def $w2 killed $w2 def $x2
	and	x9, x2, #0xff
	and	w11, w1, #0xff
	ldr	x9, [x3, x9, lsl #3]
	ldr	w12, [x0], #4
	ldr	x8, [x3, w8, uxtw #3]
	asr	w1, w12, #16
	ubfx	x2, x12, #8, #24
	udiv	x10, x9, x8
                                        // kill: def $w2 killed $w2 killed $x2
	str	x10, [x3, w11, uxtw #3]
	msub	x8, x10, x8, x9
	and	x9, x12, #0xff
	add	w10, w11, #1
	ldr	x7, [x5, x9, lsl #3]
	str	x8, [x3, w10, uxtw #3]
	br	x7
.Lfunc_end30:
	.size	vm_op_DIRlll, .Lfunc_end30-vm_op_DIRlll
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CONSTli
	.type	vm_op_CONSTli,@function
vm_op_CONSTli:                          // @vm_op_CONSTli
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	w9, [x0], #4
                                        // kill: def $w1 killed $w1 def $x1
                                        // kill: def $w2 killed $w2 def $x2
	sxtw	x10, w1
	and	x11, x9, #0xff
	ubfx	x8, x9, #8, #24
	asr	w1, w9, #16
	ldr	x7, [x5, x11, lsl #3]
	and	x9, x2, #0xff
	mov	w2, w8
	str	x10, [x3, x9, lsl #3]
	br	x7
.Lfunc_end31:
	.size	vm_op_CONSTli, .Lfunc_end31-vm_op_CONSTli
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CLOSkxi
	.type	vm_op_CLOSkxi,@function
vm_op_CLOSkxi:                          // @vm_op_CLOSkxi
	.cfi_startproc
// %bb.0:                               // %entry
	lsr	w8, w1, #5
	mov	x24, x0
	mov	x19, x6
	mov	x20, x5
	mov	x21, x4
	mov	x22, x3
	and	w8, w8, #0x7f8
	mov	w23, w2
	and	w25, w1, #0xff
	add	w0, w8, #24
	//APP
	mov	x26, x30
	//NO_APP
	bl	immix_malloc
	//APP
	mov	x30, x26
	//NO_APP
	ldr	w9, [x24], #4
	ldr	x10, [x19, w25, uxtw #3]
	mov	x8, x0
	and	x11, x23, #0xff
	and	x12, x9, #0xff
	asr	w1, w9, #16
	ubfx	x2, x9, #8, #24
	ldr	x7, [x20, x12, lsl #3]
	stp	x10, xzr, [x0, #8]
	mov	x0, x24
	mov	x3, x22
	mov	x4, x21
	mov	x5, x20
	mov	x6, x19
                                        // kill: def $w2 killed $w2 killed $x2
	str	x8, [x22, x11, lsl #3]
	br	x7
.Lfunc_end32:
	.size	vm_op_CLOSkxi, .Lfunc_end32-vm_op_CLOSkxi
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_APPLYpi
	.type	vm_op_APPLYpi,@function
vm_op_APPLYpi:                          // @vm_op_APPLYpi
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	add	x3, x3, w2, uxtb #3
	ldr	x10, [x4, #48]
	ldr	x8, [x3], #16
	cmp	x3, x10
	ldr	x9, [x8, #8]
	b.hs	.LBB33_2
// %bb.1:                               // %if.end
	ldr	w10, [x9, #8]
	stp	x0, x8, [x3, #-8]
	add	x0, x9, #12
	and	x11, x10, #0xff
	asr	w1, w10, #16
	ubfx	x2, x10, #8, #24
	ldr	x7, [x5, x11, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.LBB33_2:                               // %if.then
	add	x0, x9, #8
                                        // kill: def $w2 killed $w2 killed $x2
	b	stackoverflow
.Lfunc_end33:
	.size	vm_op_APPLYpi, .Lfunc_end33-vm_op_APPLYpi
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CALLpxi
	.type	vm_op_CALLpxi,@function
vm_op_CALLpxi:                          // @vm_op_CALLpxi
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	add	x8, x3, w2, uxtb #3
	ldr	x10, [x4, #48]
	and	w9, w1, #0xff
	ldr	x9, [x6, w9, uxtw #3]
	add	x3, x8, #16
	cmp	x3, x10
	b.hs	.LBB34_2
// %bb.1:                               // %if.end
	ldr	w10, [x9, #8]
	mov	x8, x0
	add	x0, x9, #12
	stur	x8, [x3, #-8]
	and	x11, x10, #0xff
	asr	w1, w10, #16
	ubfx	x2, x10, #8, #24
	ldr	x7, [x5, x11, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.LBB34_2:                               // %if.then
	add	x0, x9, #8
                                        // kill: def $w2 killed $w2 killed $x2
	b	stackoverflow
.Lfunc_end34:
	.size	vm_op_CALLpxi, .Lfunc_end34-vm_op_CALLpxi
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_OSETpip
	.type	vm_op_OSETpip,@function
vm_op_OSETpip:                          // @vm_op_OSETpip
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x8, x2, #0xff
	ldr	w9, [x0], #4
	ldr	x8, [x3, x8, lsl #3]
	ubfx	w11, w1, #8, #8
	and	w10, w1, #0xff
	and	x12, x9, #0xff
	ubfx	x2, x9, #8, #24
	asr	w1, w9, #16
	add	x8, x8, w10, uxtw #3
	ldr	x9, [x3, w11, uxtw #3]
	ldr	x7, [x5, x12, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	str	x9, [x8, #8]
	br	x7
.Lfunc_end35:
	.size	vm_op_OSETpip, .Lfunc_end35-vm_op_OSETpip
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_OGETppi
	.type	vm_op_OGETppi,@function
vm_op_OGETppi:                          // @vm_op_OGETppi
	.cfi_startproc
// %bb.0:                               // %entry
	and	w8, w1, #0xff
	ubfx	w9, w1, #8, #8
                                        // kill: def $w2 killed $w2 def $x2
	and	x11, x2, #0xff
	ldr	x8, [x3, w8, uxtw #3]
	ldr	w10, [x0], #4
	add	x8, x8, w9, uxtw #3
	and	x9, x10, #0xff
	asr	w1, w10, #16
	ldr	x7, [x5, x9, lsl #3]
	ubfx	x2, x10, #8, #24
	ldr	x8, [x8, #8]
                                        // kill: def $w2 killed $w2 killed $x2
	str	x8, [x3, x11, lsl #3]
	br	x7
.Lfunc_end36:
	.size	vm_op_OGETppi, .Lfunc_end36-vm_op_OGETppi
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_CLOSGETpi
	.type	vm_op_CLOSGETpi,@function
vm_op_CLOSGETpi:                        // @vm_op_CLOSGETpi
	.cfi_startproc
// %bb.0:                               // %entry
	ldr	x8, [x3]
	ldr	w9, [x0], #4
                                        // kill: def $w2 killed $w2 def $x2
	and	x10, x2, #0xff
	add	x8, x8, w1, uxtw #3
	and	x11, x9, #0xff
	asr	w1, w9, #16
	ldr	x7, [x5, x11, lsl #3]
	ubfx	x2, x9, #8, #24
	ldr	x8, [x8, #8]
                                        // kill: def $w2 killed $w2 killed $x2
	str	x8, [x3, x10, lsl #3]
	br	x7
.Lfunc_end37:
	.size	vm_op_CLOSGETpi, .Lfunc_end37-vm_op_CLOSGETpi
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_JUMPj
	.type	vm_op_JUMPj,@function
vm_op_JUMPj:                            // @vm_op_JUMPj
	.cfi_startproc
// %bb.0:                               // %entry
	add	x0, x0, w1, sxtw
	ldr	w8, [x0], #4
	and	x9, x8, #0xff
	asr	w1, w8, #16
	ubfx	x2, x8, #8, #24
	ldr	x7, [x5, x9, lsl #3]
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end38:
	.size	vm_op_JUMPj, .Lfunc_end38-vm_op_JUMPj
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function vm_op_RETp
	.type	vm_op_RETp,@function
vm_op_RETp:                             // @vm_op_RETp
	.cfi_startproc
// %bb.0:                               // %entry
                                        // kill: def $w2 killed $w2 def $x2
	and	x8, x2, #0xff
	ldr	x8, [x3, x8, lsl #3]
	str	x8, [x3, #-16]!
	ldr	x8, [x3, #8]
	ldr	w10, [x8]
	ldurb	w9, [x8, #-3]
	add	x0, x8, #4
	and	x8, x10, #0xff
	sub	x3, x3, x9, lsl #3
	asr	w1, w10, #16
	ldr	x7, [x5, x8, lsl #3]
	ubfx	x2, x10, #8, #24
                                        // kill: def $w2 killed $w2 killed $x2
	br	x7
.Lfunc_end39:
	.size	vm_op_RETp, .Lfunc_end39-vm_op_RETp
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function stackoverflow
	.type	stackoverflow,@function
stackoverflow:                          // @stackoverflow
	.cfi_startproc
// %bb.0:                               // %entry
	adrp	x8, .L.str.2
	add	x8, x8, :lo12:.L.str.2
	str	x8, [x4, #24]
	b	panic
.Lfunc_end40:
	.size	stackoverflow, .Lfunc_end40-stackoverflow
	.cfi_endproc
                                        // -- End function
	.p2align	6                               // -- Begin function panic
	.type	panic,@function
panic:                                  // @panic
	.cfi_startproc
// %bb.0:                               // %entry
	adrp	x8, :got:stderr
	adrp	x1, .L.str.3
	add	x1, x1, :lo12:.L.str.3
	ldr	x8, [x8, :got_lo12:stderr]
	ldr	x2, [x4, #24]
	//APP
	mov	x19, x30
	//NO_APP
	ldr	x0, [x8]
	bl	fprintf
	mov	w0, #255                        // =0xff
	//APP
	mov	x30, x19
	//NO_APP
	bl	exit
.Lfunc_end41:
	.size	panic, .Lfunc_end41-panic
	.cfi_endproc
                                        // -- End function
	.type	dispatch,@object                // @dispatch
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3, 0x0
dispatch:
	.xword	vm_op_NOP
	.xword	vm_op_STOPii
	.xword	vm_op_CMPLTll
	.xword	vm_op_CMPLEll
	.xword	vm_op_CMPEQll
	.xword	vm_op_CMPNEll
	.xword	vm_op_CMPLTli
	.xword	vm_op_CMPLEli
	.xword	vm_op_CMPGTli
	.xword	vm_op_CMPGEli
	.xword	vm_op_CMPEQli
	.xword	vm_op_CMPNEli
	.xword	vm_op_CMPLTlc
	.xword	vm_op_CMPLElc
	.xword	vm_op_CMPGTlc
	.xword	vm_op_CMPGElc
	.xword	vm_op_CMPEQlc
	.xword	vm_op_CMPNElc
	.xword	vm_op_ADDlli
	.xword	vm_op_SUBlli
	.xword	vm_op_MULlli
	.xword	vm_op_DIVlli
	.xword	vm_op_REMlli
	.xword	vm_op_DIRlli
	.xword	vm_op_ADDlll
	.xword	vm_op_SUBlll
	.xword	vm_op_MULlll
	.xword	vm_op_DIVlll
	.xword	vm_op_REMlll
	.xword	vm_op_DIRlll
	.xword	vm_op_CONSTli
	.xword	vm_op_CLOSkxi
	.xword	vm_op_APPLYpi
	.xword	vm_op_CALLpxi
	.xword	vm_op_OSETpip
	.xword	vm_op_OGETppi
	.xword	vm_op_CLOSGETpi
	.xword	vm_op_JUMPj
	.xword	vm_op_RETp
	.size	dispatch, 312

	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"slot[%u] 0x%lx\n"
	.size	.L.str, 16

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"stack overflow"
	.size	.L.str.2, 15

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"panic: %s\n"
	.size	.L.str.3, 11

	.ident	"clang version 18.0.0 (git@github.com:waterlens/llvm-project.git ad634bd8644ce7f82c92b342c52f27d171b41c8d)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym vm_op_NOP
	.addrsig_sym vm_op_STOPii
	.addrsig_sym vm_op_CMPLTll
	.addrsig_sym vm_op_CMPLEll
	.addrsig_sym vm_op_CMPEQll
	.addrsig_sym vm_op_CMPNEll
	.addrsig_sym vm_op_CMPLTli
	.addrsig_sym vm_op_CMPLEli
	.addrsig_sym vm_op_CMPGTli
	.addrsig_sym vm_op_CMPGEli
	.addrsig_sym vm_op_CMPEQli
	.addrsig_sym vm_op_CMPNEli
	.addrsig_sym vm_op_CMPLTlc
	.addrsig_sym vm_op_CMPLElc
	.addrsig_sym vm_op_CMPGTlc
	.addrsig_sym vm_op_CMPGElc
	.addrsig_sym vm_op_CMPEQlc
	.addrsig_sym vm_op_CMPNElc
	.addrsig_sym vm_op_ADDlli
	.addrsig_sym vm_op_SUBlli
	.addrsig_sym vm_op_MULlli
	.addrsig_sym vm_op_DIVlli
	.addrsig_sym vm_op_REMlli
	.addrsig_sym vm_op_DIRlli
	.addrsig_sym vm_op_ADDlll
	.addrsig_sym vm_op_SUBlll
	.addrsig_sym vm_op_MULlll
	.addrsig_sym vm_op_DIVlll
	.addrsig_sym vm_op_REMlll
	.addrsig_sym vm_op_DIRlll
	.addrsig_sym vm_op_CONSTli
	.addrsig_sym vm_op_CLOSkxi
	.addrsig_sym vm_op_APPLYpi
	.addrsig_sym vm_op_CALLpxi
	.addrsig_sym vm_op_OSETpip
	.addrsig_sym vm_op_OGETppi
	.addrsig_sym vm_op_CLOSGETpi
	.addrsig_sym vm_op_JUMPj
	.addrsig_sym vm_op_RETp
	.addrsig_sym dispatch
