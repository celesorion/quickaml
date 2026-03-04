	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.file	0 "/Users/waterlens/Projects/quickaml" "src/vm.c" md5 0x9f69d89c987a45ddba09db956f7ad512
	.file	1 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint32_t.h" md5 0x0254eb80c6b9719ac45c3c1cf872109b
	.file	2 "src" "def.h" md5 0x0b0615634d9800f70682874b4231e459
	.file	3 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint16_t.h" md5 0xf0aa926da906b10566dd3171bf347ab7
	.file	4 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint8_t.h" md5 0x8b64ccf8c67b8c006b07b8daf1b49be5
	.file	5 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint64_t.h" md5 0x77fc5e91653260959605f129691cf9b1
	.file	6 "src" "alloc.h" md5 0x7771574cf01e11a65598c51f361ee16f
	.file	7 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm" "_types.h" md5 0xb270144f57ae258d0ce80b8f87be068c
	.file	8 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_size_t.h" md5 0xf7981334d28e0c246f35cd24042aa2a4
	.file	9 "src" "state.h" md5 0x5494e31c74cbb7c142cbfb3eb4940a53
	.file	10 "src" "object.h" md5 0x5946ce444f08597a90579ad2b1103f13
	.file	11 "src" "vm.h" md5 0xd57dbab52573e12406165df597132d02
	.file	12 "src" "bc.h" md5 0x3d66d833e6b7854244dfd71dd0791b8b
	.file	13 "src" "trap.h" md5 0xf7408d08ce49dddaa8c67a579190385b
	.file	14 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_int64_t.h" md5 0xe6d85c1a9e23dbf7518ce3b162aac800
	.file	15 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_int16_t.h" md5 0x47ed3c3ac6f65bfec021ca2b7be18e7e
	.file	16 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_int32_t.h" md5 0xd23e8406e80ee79983f28509c741fa17
	.file	17 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/17/include" "__stddef_ptrdiff_t.h" md5 0x21e0c40f3315797d915cc7ea60040a98
	.globl	_vm_entry                       ; -- Begin function vm_entry
	.p2align	2
_vm_entry:                              ; @vm_entry
Lfunc_begin0:
	.loc	0 19 0                          ; src/vm.c:19:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #432
	.cfi_def_cfa_offset 432
	stp	d15, d14, [sp, #272]            ; 16-byte Folded Spill
	stp	d13, d12, [sp, #288]            ; 16-byte Folded Spill
	stp	d11, d10, [sp, #304]            ; 16-byte Folded Spill
	stp	d9, d8, [sp, #320]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #336]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #352]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #368]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #384]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #400]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #416]            ; 16-byte Folded Spill
	add	x29, sp, #416
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
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #184]                  ; 8-byte Folded Spill
	stur	x0, [x29, #-160]
Ltmp0:
	.loc	0 20 14 prologue_end            ; src/vm.c:20:14
	ldur	x9, [x29, #-160]
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	.loc	0 20 21 is_stmt 0               ; src/vm.c:20:21
	add	x9, x9, #8
	str	x9, [sp, #200]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	0 0 21                          ; src/vm.c:0:21
	ldr	x0, [sp, #200]                  ; 8-byte Folded Reload
	.loc	0 20 21                         ; src/vm.c:20:21
	bl	___asan_report_load8
	brk	#0x1
LBB0_2:
	.loc	0 0 21                          ; src/vm.c:0:21
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #192]                  ; 8-byte Folded Reload
	.loc	0 20 21                         ; src/vm.c:20:21
	ldr	x9, [x9, #8]
	.loc	0 20 28                         ; src/vm.c:20:28
	add	x9, x9, #8
	.loc	0 20 9                          ; src/vm.c:20:9
	stur	x9, [x29, #-168]
	.loc	0 21 15 is_stmt 1               ; src/vm.c:21:15
	ldur	x9, [x29, #-160]
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	add	x9, x9, #48
	str	x9, [sp, #176]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_4
	b	LBB0_3
LBB0_3:
	.loc	0 0 15 is_stmt 0                ; src/vm.c:0:15
	ldr	x0, [sp, #176]                  ; 8-byte Folded Reload
	.loc	0 21 15                         ; src/vm.c:21:15
	bl	___asan_report_load8
	brk	#0x1
LBB0_4:
	.loc	0 0 15                          ; src/vm.c:0:15
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #168]                  ; 8-byte Folded Reload
	.loc	0 21 15                         ; src/vm.c:21:15
	ldr	x9, [x9, #48]
	add	x9, x9, #32
	.loc	0 21 10                         ; src/vm.c:21:10
	stur	x9, [x29, #-176]
	.loc	0 22 18 is_stmt 1               ; src/vm.c:22:18
	ldur	x9, [x29, #-160]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	add	x9, x9, #8
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_6
	b	LBB0_5
LBB0_5:
	.loc	0 0 18 is_stmt 0                ; src/vm.c:0:18
	ldr	x0, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 22 18                         ; src/vm.c:22:18
	bl	___asan_report_load8
	brk	#0x1
LBB0_6:
	.loc	0 0 18                          ; src/vm.c:0:18
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	.loc	0 22 18                         ; src/vm.c:22:18
	ldr	x9, [x9, #8]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 22 3                          ; src/vm.c:22:3
	ldur	x9, [x29, #-176]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	subs	x9, x9, #16
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 22 16                         ; src/vm.c:22:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 22 16                         ; src/vm.c:22:16
	bl	___asan_report_store8
	brk	#0x1
LBB0_8:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #136]                 ; 8-byte Folded Reload
	.loc	0 22 16                         ; src/vm.c:22:16
	stur	x9, [x10, #-16]
	.loc	0 23 3 is_stmt 1                ; src/vm.c:23:3
	ldur	x9, [x29, #-176]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 23 16 is_stmt 0               ; src/vm.c:23:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_10
	b	LBB0_9
LBB0_9:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 23 16                         ; src/vm.c:23:16
	bl	___asan_report_store8
	brk	#0x1
LBB0_10:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 23 16                         ; src/vm.c:23:16
	stur	xzr, [x9, #-8]
	.loc	0 24 27 is_stmt 1               ; src/vm.c:24:27
	ldur	x9, [x29, #-160]
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	.loc	0 24 34 is_stmt 0               ; src/vm.c:24:34
	add	x9, x9, #16
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_12
	b	LBB0_11
LBB0_11:
	.loc	0 0 34                          ; src/vm.c:0:34
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 24 34                         ; src/vm.c:24:34
	bl	___asan_report_load8
	brk	#0x1
LBB0_12:
	.loc	0 0 34                          ; src/vm.c:0:34
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 24 34                         ; src/vm.c:24:34
	ldr	x9, [x9, #16]
	.loc	0 24 21                         ; src/vm.c:24:21
	stur	x9, [x29, #-184]
	.loc	0 29 3 is_stmt 1                ; src/vm.c:29:3
	ldur	x9, [x29, #-168]
	stur	x9, [x29, #-200]
	ldur	x9, [x29, #-200]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB0_15
	b	LBB0_13
LBB0_13:
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB0_15
	b	LBB0_14
LBB0_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	bl	___asan_report_load1
	brk	#0x1
LBB0_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-204]
	ldur	x9, [x29, #-200]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #68]                   ; 4-byte Folded Spill
	cbz	w8, LBB0_18
	b	LBB0_16
LBB0_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #68]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB0_18
	b	LBB0_17
LBB0_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #56]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	bl	___asan_report_load1
	brk	#0x1
LBB0_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-185]
	ldur	x9, [x29, #-200]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB0_21
	b	LBB0_19
LBB0_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB0_21
	b	LBB0_20
LBB0_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	bl	___asan_report_load2
	brk	#0x1
LBB0_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	ldrh	w9, [x9, #2]
	sturh	w9, [x29, #-190]
	ldur	x9, [x29, #-168]
	add	x9, x9, #4
	stur	x9, [x29, #-168]
	ldur	w9, [x29, #-204]
	mov	x10, x9
	str	x10, [sp]                       ; 8-byte Folded Spill
	adrp	x9, _dispatch@PAGE
	add	x9, x9, _dispatch@PAGEOFF
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_23
	b	LBB0_22
LBB0_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	bl	___asan_report_load8
	brk	#0x1
LBB0_23:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 29 3                          ; src/vm.c:29:3
	ldr	x8, [x8, x9, lsl #3]
	ldur	x20, [x29, #-168]
	ldurh	w0, [x29, #-190]
	ldurb	w1, [x29, #-185]
	ldur	x21, [x29, #-176]
	ldur	x22, [x29, #-160]
	ldur	x24, [x29, #-184]
	adrp	x23, _dispatch@PAGE
	add	x23, x23, _dispatch@PAGEOFF
	blr	x8
	.loc	0 30 3 is_stmt 1                ; src/vm.c:30:3
	mov	w0, #0                          ; =0x0
	.cfi_def_cfa wsp, 432
	.loc	0 30 3 epilogue_begin is_stmt 0 ; src/vm.c:30:3
	ldp	x29, x30, [sp, #416]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #400]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #384]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #368]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #352]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #336]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #320]              ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #304]            ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #288]            ; 16-byte Folded Reload
	ldp	d15, d14, [sp, #272]            ; 16-byte Folded Reload
	add	sp, sp, #432
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
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
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
Ltmp1:
Lfunc_end0:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_TRAP
_vm_op_TRAP:                            ; @vm_op_TRAP
Lfunc_begin1:
	.loc	0 91 0 is_stmt 1                ; src/vm.c:91:0
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_remember_state
	sub	sp, sp, #512
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	stur	x8, [x29, #-184]                ; 8-byte Folded Spill
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-176]                ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp2:
	.loc	0 92 15 prologue_end            ; src/vm.c:92:15
	ldurb	w8, [x29, #-19]
	.loc	0 92 9 is_stmt 0                ; src/vm.c:92:9
	stur	w8, [x29, #-60]
	.loc	0 93 11 is_stmt 1               ; src/vm.c:93:11
	ldur	w8, [x29, #-60]
	stur	w8, [x29, #-164]                ; 4-byte Folded Spill
	.loc	0 93 3 is_stmt 0                ; src/vm.c:93:3
	cbz	w8, LBB1_8
	b	LBB1_1
LBB1_1:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 93 3                          ; src/vm.c:93:3
	subs	w8, w8, #1
	b.eq	LBB1_9
	b	LBB1_2
LBB1_2:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 93 3                          ; src/vm.c:93:3
	subs	w8, w8, #2
	b.eq	LBB1_10
	b	LBB1_3
LBB1_3:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 93 3                          ; src/vm.c:93:3
	subs	w8, w8, #3
	b.eq	LBB1_11
	b	LBB1_4
LBB1_4:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 93 3                          ; src/vm.c:93:3
	subs	w8, w8, #4
	subs	w8, w8, #1
	b.ls	LBB1_12
	b	LBB1_5
LBB1_5:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 93 3                          ; src/vm.c:93:3
	subs	w8, w8, #6
	b.eq	LBB1_25
	b	LBB1_6
LBB1_6:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 93 3                          ; src/vm.c:93:3
	subs	w8, w8, #7
	b.eq	LBB1_42
	b	LBB1_7
LBB1_7:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 93 3                          ; src/vm.c:93:3
	subs	w8, w8, #8
	b.eq	LBB1_45
	b	LBB1_51
LBB1_8:                                 ; %sw.bb
Ltmp3:
	.loc	0 95 31 is_stmt 1               ; src/vm.c:95:31
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 95 21 epilogue_begin is_stmt 0 ; src/vm.c:95:21
	add	sp, sp, #512
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_undefined
LBB1_9:                                 ; %sw.bb1
	.cfi_restore_state
	.cfi_remember_state
	.loc	0 97 29 is_stmt 1               ; src/vm.c:97:29
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 97 21 epilogue_begin is_stmt 0 ; src/vm.c:97:21
	add	sp, sp, #512
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_diverge
LBB1_10:                                ; %sw.bb2
	.cfi_restore_state
	.cfi_remember_state
	.loc	0 99 26 is_stmt 1               ; src/vm.c:99:26
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 99 21 epilogue_begin is_stmt 0 ; src/vm.c:99:21
	add	sp, sp, #512
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_halt
LBB1_11:                                ; %sw.bb3
	.cfi_restore_state
	.cfi_remember_state
	.loc	0 101 32 is_stmt 1              ; src/vm.c:101:32
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 101 21 epilogue_begin is_stmt 0 ; src/vm.c:101:21
	add	sp, sp, #512
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_unusedexta
LBB1_12:                                ; %sw.bb4
	.cfi_restore_state
	.cfi_remember_state
Ltmp4:
	.loc	0 104 16 is_stmt 1              ; src/vm.c:104:16
	ldurb	w8, [x29, #-18]
	.loc	0 104 11 is_stmt 0              ; src/vm.c:104:11
	stur	w8, [x29, #-68]
	.loc	0 105 16 is_stmt 1              ; src/vm.c:105:16
	ldurh	w8, [x29, #-18]
	lsr	w8, w8, #8
	and	w8, w8, #0xff
	.loc	0 105 11 is_stmt 0              ; src/vm.c:105:11
	stur	w8, [x29, #-72]
Ltmp5:
	.loc	0 107 20 is_stmt 1              ; src/vm.c:107:20
	ldur	w8, [x29, #-68]
	.loc	0 107 16 is_stmt 0              ; src/vm.c:107:16
	stur	w8, [x29, #-76]
	.loc	0 107 10                        ; src/vm.c:107:10
	b	LBB1_13
LBB1_13:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
Ltmp6:
	.loc	0 107 24                        ; src/vm.c:107:24
	ldur	w8, [x29, #-76]
	.loc	0 107 28                        ; src/vm.c:107:28
	ldur	w9, [x29, #-72]
Ltmp7:
	.loc	0 107 5                         ; src/vm.c:107:5
	subs	w8, w8, w9
	b.lo	LBB1_15
	b	LBB1_14
LBB1_14:                                ; %for.cond.cleanup
	.loc	0 0 5                           ; src/vm.c:0:5
	mov	w8, #3                          ; =0x3
	stur	w8, [x29, #-64]
	b	LBB1_24
LBB1_15:                                ; %for.body
                                        ;   in Loop: Header=BB1_13 Depth=1
Ltmp8:
	.loc	0 109 7 is_stmt 1               ; src/vm.c:109:7
	b	LBB1_16
LBB1_16:                                ; %do.body
                                        ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-184]                ; 8-byte Folded Reload
Ltmp9:
	.loc	0 109 7                         ; src/vm.c:109:7
	; InlineAsm Start
	mov	x10, x30
	; InlineAsm End
	stur	x10, [x29, #-88]
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_18
	b	LBB1_17
LBB1_17:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x0, [x29, #-184]                ; 8-byte Folded Reload
	.loc	0 109 7                         ; src/vm.c:109:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_18:                                ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	.loc	0 109 7                         ; src/vm.c:109:7
	adrp	x9, ___stderrp@GOTPAGE
	ldr	x9, [x9, ___stderrp@GOTPAGEOFF]
	ldr	x9, [x9]
	stur	x9, [x29, #-232]                ; 8-byte Folded Spill
	ldur	w11, [x29, #-60]
	adrp	x10, _.str.2@PAGE
	add	x10, x10, _.str.2@PAGEOFF
	adrp	x9, _.str@PAGE
	add	x9, x9, _.str@PAGEOFF
	subs	w11, w11, #5
	csel	x9, x9, x10, eq
	stur	x9, [x29, #-224]                ; 8-byte Folded Spill
	ldur	w9, [x29, #-76]
                                        ; kill: def $x9 killed $w9
	stur	x9, [x29, #-216]                ; 8-byte Folded Spill
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-208]                ; 8-byte Folded Spill
	ldur	w10, [x29, #-76]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-200]               ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-192]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_20
	b	LBB1_19
LBB1_19:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x0, [x29, #-192]                ; 8-byte Folded Reload
	.loc	0 109 7                         ; src/vm.c:109:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_20:                                ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x1, [x29, #-224]                ; 8-byte Folded Reload
	ldur	x0, [x29, #-232]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-216]               ; 8-byte Folded Reload
	ldur	x8, [x29, #-208]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-200]                ; 8-byte Folded Reload
	.loc	0 109 7                         ; src/vm.c:109:7
	ldr	x8, [x8, x9, lsl #3]
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	bl	_fprintf
	stur	w0, [x29, #-80]
	ldur	x8, [x29, #-88]
	; InlineAsm Start
	mov	x30, x8
	; InlineAsm End
	b	LBB1_21
LBB1_21:                                ; %do.cond
                                        ;   in Loop: Header=BB1_13 Depth=1
	b	LBB1_22
Ltmp10:
LBB1_22:                                ; %do.end
                                        ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 113 5 is_stmt 1               ; src/vm.c:113:5
	b	LBB1_23
Ltmp11:
LBB1_23:                                ; %for.inc
                                        ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 107 33                        ; src/vm.c:107:33
	ldur	w8, [x29, #-76]
	add	w8, w8, #1
	stur	w8, [x29, #-76]
	.loc	0 107 5 is_stmt 0               ; src/vm.c:107:5
	b	LBB1_13
Ltmp12:
LBB1_24:                                ; %for.end
	.loc	0 0 5                           ; src/vm.c:0:5
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-64]
	b	LBB1_52
LBB1_25:                                ; %sw.bb11
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
Ltmp13:
	.loc	0 117 16 is_stmt 1              ; src/vm.c:117:16
	ldurb	w9, [x29, #-18]
	.loc	0 117 11 is_stmt 0              ; src/vm.c:117:11
	stur	w9, [x29, #-92]
	.loc	0 118 16 is_stmt 1              ; src/vm.c:118:16
	ldurh	w9, [x29, #-18]
	lsr	w9, w9, #8
	and	w9, w9, #0xff
	.loc	0 118 11 is_stmt 0              ; src/vm.c:118:11
	stur	w9, [x29, #-96]
Ltmp14:
	.loc	0 120 9 is_stmt 1               ; src/vm.c:120:9
	ldur	x9, [x29, #-32]
	str	x9, [sp, #256]                  ; 8-byte Folded Spill
	.loc	0 120 12 is_stmt 0              ; src/vm.c:120:12
	ldur	w10, [x29, #-92]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-248]               ; 8-byte Folded Spill
	.loc	0 120 9                         ; src/vm.c:120:9
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-240]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_27
	b	LBB1_26
LBB1_26:
	.loc	0 0 9                           ; src/vm.c:0:9
	ldur	x0, [x29, #-240]                ; 8-byte Folded Reload
	.loc	0 120 9                         ; src/vm.c:120:9
	bl	___asan_report_load8
	brk	#0x1
LBB1_27:
	.loc	0 0 9                           ; src/vm.c:0:9
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	ldur	x10, [x29, #-248]               ; 8-byte Folded Reload
	.loc	0 120 9                         ; src/vm.c:120:9
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #224]                  ; 8-byte Folded Spill
	.loc	0 120 19                        ; src/vm.c:120:19
	ldur	x9, [x29, #-32]
	str	x9, [sp, #232]                  ; 8-byte Folded Spill
	.loc	0 120 22                        ; src/vm.c:120:22
	ldur	w10, [x29, #-96]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #240]                 ; 8-byte Folded Spill
	.loc	0 120 19                        ; src/vm.c:120:19
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #248]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_29
	b	LBB1_28
LBB1_28:
	.loc	0 0 19                          ; src/vm.c:0:19
	ldr	x0, [sp, #248]                  ; 8-byte Folded Reload
	.loc	0 120 19                        ; src/vm.c:120:19
	bl	___asan_report_load8
	brk	#0x1
LBB1_29:
	.loc	0 0 19                          ; src/vm.c:0:19
	ldr	x8, [sp, #224]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #232]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #240]                 ; 8-byte Folded Reload
	.loc	0 120 19                        ; src/vm.c:120:19
	ldr	x9, [x9, x10, lsl #3]
Ltmp15:
	.loc	0 120 9                         ; src/vm.c:120:9
	subs	x8, x8, x9
	b.eq	LBB1_40
	b	LBB1_30
LBB1_30:                                ; %if.then
Ltmp16:
	.loc	0 122 7 is_stmt 1               ; src/vm.c:122:7
	b	LBB1_31
LBB1_31:                                ; %do.body26
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-184]                ; 8-byte Folded Reload
Ltmp17:
	.loc	0 122 7                         ; src/vm.c:122:7
	; InlineAsm Start
	mov	x10, x30
	; InlineAsm End
	stur	x10, [x29, #-112]
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_33
	b	LBB1_32
LBB1_32:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x0, [x29, #-184]                ; 8-byte Folded Reload
	.loc	0 122 7                         ; src/vm.c:122:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_33:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	.loc	0 122 7                         ; src/vm.c:122:7
	adrp	x9, ___stderrp@GOTPAGE
	ldr	x9, [x9, ___stderrp@GOTPAGEOFF]
	ldr	x9, [x9]
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	ldur	x9, [x29, #-32]
	str	x9, [sp, #200]                  ; 8-byte Folded Spill
	ldur	w10, [x29, #-92]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #208]                 ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #216]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_35
	b	LBB1_34
LBB1_34:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldr	x0, [sp, #216]                  ; 8-byte Folded Reload
	.loc	0 122 7                         ; src/vm.c:122:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_35:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #200]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #208]                 ; 8-byte Folded Reload
	.loc	0 122 7                         ; src/vm.c:122:7
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	ldur	x9, [x29, #-32]
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	ldur	w10, [x29, #-96]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #176]                 ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #184]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_37
	b	LBB1_36
LBB1_36:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldr	x0, [sp, #184]                  ; 8-byte Folded Reload
	.loc	0 122 7                         ; src/vm.c:122:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_37:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldr	x0, [sp, #192]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #160]                 ; 8-byte Folded Reload
	ldr	x8, [sp, #168]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #176]                  ; 8-byte Folded Reload
	.loc	0 122 7                         ; src/vm.c:122:7
	ldr	x8, [x8, x9, lsl #3]
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x1, _.str.3@PAGE
	add	x1, x1, _.str.3@PAGEOFF
	bl	_fprintf
	stur	w0, [x29, #-100]
	ldur	x8, [x29, #-112]
	; InlineAsm Start
	mov	x30, x8
	; InlineAsm End
	b	LBB1_38
LBB1_38:                                ; %do.cond33
	b	LBB1_39
Ltmp18:
LBB1_39:                                ; %do.end34
	.loc	0 124 39 is_stmt 1              ; src/vm.c:124:39
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 124 23 epilogue_begin is_stmt 0 ; src/vm.c:124:23
	add	sp, sp, #512
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_assertionfailed
Ltmp19:
LBB1_40:                                ; %if.end
	.cfi_restore_state
	.cfi_remember_state
	.loc	0 0 23                          ; src/vm.c:0:23
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-64]
	.loc	0 126 5 is_stmt 1               ; src/vm.c:126:5
	b	LBB1_41
Ltmp20:
LBB1_41:                                ; %cleanup
	.loc	0 0 5 is_stmt 0                 ; src/vm.c:0:5
	ldur	w8, [x29, #-64]
	subs	w8, w8, #2
	b.eq	LBB1_52
	b	LBB1_65
LBB1_42:                                ; %sw.bb36
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
Ltmp21:
	.loc	0 129 15 is_stmt 1              ; src/vm.c:129:15
	ldurb	w9, [x29, #-18]
	.loc	0 129 11 is_stmt 0              ; src/vm.c:129:11
	stur	w9, [x29, #-116]
	.loc	0 130 26 is_stmt 1              ; src/vm.c:130:26
	ldur	x9, [x29, #-32]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	ldur	w10, [x29, #-116]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #144]                 ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_44
	b	LBB1_43
LBB1_43:
	.loc	0 0 26 is_stmt 0                ; src/vm.c:0:26
	ldr	x0, [sp, #152]                  ; 8-byte Folded Reload
	.loc	0 130 26                        ; src/vm.c:130:26
	bl	___asan_report_load8
	brk	#0x1
LBB1_44:
	.loc	0 0 26                          ; src/vm.c:0:26
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 130 26                        ; src/vm.c:130:26
	ldr	x8, [x8, x9, lsl #3]
	.loc	0 130 20                        ; src/vm.c:130:20
	stur	x8, [x29, #-128]
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-64]
	b	LBB1_52
Ltmp22:
LBB1_45:                                ; %sw.bb43
	.loc	0 135 5 is_stmt 1               ; src/vm.c:135:5
	b	LBB1_46
LBB1_46:                                ; %do.body44
	.loc	0 0 5 is_stmt 0                 ; src/vm.c:0:5
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
Ltmp23:
	.loc	0 135 5                         ; src/vm.c:135:5
	; InlineAsm Start
	mov	x9, x30
	; InlineAsm End
	stur	x9, [x29, #-136]
	ldur	x9, [x29, #-40]
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_48
	b	LBB1_47
LBB1_47:
	.loc	0 0 5                           ; src/vm.c:0:5
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 135 5                         ; src/vm.c:135:5
	bl	___asan_report_load8
	brk	#0x1
LBB1_48:
	.loc	0 0 5                           ; src/vm.c:0:5
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 135 5                         ; src/vm.c:135:5
	ldr	x0, [x8]
	bl	_heap_stat_print
	ldur	x8, [x29, #-136]
	; InlineAsm Start
	mov	x30, x8
	; InlineAsm End
	b	LBB1_49
LBB1_49:                                ; %do.cond46
	b	LBB1_50
Ltmp24:
LBB1_50:                                ; %do.end47
	.loc	0 136 5 is_stmt 1               ; src/vm.c:136:5
	b	LBB1_52
Ltmp25:
LBB1_51:                                ; %sw.default
	.loc	0 139 33                        ; src/vm.c:139:33
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 139 21 epilogue_begin is_stmt 0 ; src/vm.c:139:21
	add	sp, sp, #512
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_invalidtrap
Ltmp26:
LBB1_52:                                ; %sw.epilog
	.cfi_restore_state
	.cfi_remember_state
	.loc	0 142 3 is_stmt 1               ; src/vm.c:142:3
	b	LBB1_53
LBB1_53:                                ; %do.body48
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
Ltmp27:
	.loc	0 142 3                         ; src/vm.c:142:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-144]
	ldur	x9, [x29, #-144]
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #116]                  ; 4-byte Folded Spill
	cbz	w8, LBB1_56
	b	LBB1_54
LBB1_54:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #116]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB1_56
	b	LBB1_55
LBB1_55:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	bl	___asan_report_load1
	brk	#0x1
LBB1_56:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-148]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-148]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #80]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_58
	b	LBB1_57
LBB1_57:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	bl	___asan_report_load8
	brk	#0x1
LBB1_58:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #80]                  ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-160]
	ldur	x9, [x29, #-144]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #68]                   ; 4-byte Folded Spill
	cbz	w8, LBB1_61
	b	LBB1_59
LBB1_59:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #68]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB1_61
	b	LBB1_60
LBB1_60:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #56]                   ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	bl	___asan_report_load1
	brk	#0x1
LBB1_61:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-144]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB1_64
	b	LBB1_62
LBB1_62:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB1_64
	b	LBB1_63
LBB1_63:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	bl	___asan_report_load2
	brk	#0x1
LBB1_64:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 142 3                         ; src/vm.c:142:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-160]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 142 3 epilogue_begin          ; src/vm.c:142:3
	add	sp, sp, #512
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp28:
LBB1_65:                                ; %cleanup60
	.cfi_restore_state
; %bb.66:                               ; %cleanup.cont
	.loc	0 143 1 epilogue_begin is_stmt 1 ; src/vm.c:143:1
	add	sp, sp, #512
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Ltmp29:
; %bb.67:                               ; %unreachable
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_NOP
_vm_op_NOP:                             ; @vm_op_NOP
Lfunc_begin2:
	.loc	0 145 0                         ; src/vm.c:145:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #192
	.cfi_def_cfa_offset 192
	stp	x29, x30, [sp, #176]            ; 16-byte Folded Spill
	add	x29, sp, #176
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-80]                 ; 8-byte Folded Spill
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	stur	x22, [x29, #-32]
	stur	x23, [x29, #-40]
	stur	x24, [x29, #-48]
Ltmp30:
	.loc	0 145 22 prologue_end           ; src/vm.c:145:22
	b	LBB2_1
LBB2_1:                                 ; %do.body
	.loc	0 0 22 is_stmt 0                ; src/vm.c:0:22
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
Ltmp31:
	.loc	0 145 22                        ; src/vm.c:145:22
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-56]
	ldur	x9, [x29, #-56]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	stur	w8, [x29, #-84]                 ; 4-byte Folded Spill
	cbz	w8, LBB2_4
	b	LBB2_2
LBB2_2:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldur	w8, [x29, #-84]                 ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB2_4
	b	LBB2_3
LBB2_3:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	bl	___asan_report_load1
	brk	#0x1
LBB2_4:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	ldrb	w9, [x9]
	stur	w9, [x29, #-60]
	ldur	x9, [x29, #-40]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB2_6
	b	LBB2_5
LBB2_5:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	bl	___asan_report_load8
	brk	#0x1
LBB2_6:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-72]
	ldur	x9, [x29, #-56]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB2_9
	b	LBB2_7
LBB2_7:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB2_9
	b	LBB2_8
LBB2_8:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	bl	___asan_report_load1
	brk	#0x1
LBB2_9:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-56]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB2_12
	b	LBB2_10
LBB2_10:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB2_12
	b	LBB2_11
LBB2_11:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	bl	___asan_report_load2
	brk	#0x1
LBB2_12:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 145 22                        ; src/vm.c:145:22
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-10]
	ldur	x8, [x29, #-8]
	add	x8, x8, #4
	stur	x8, [x29, #-8]
	ldur	x2, [x29, #-72]
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldur	x22, [x29, #-32]
	ldur	x23, [x29, #-40]
	ldur	x24, [x29, #-48]
	.cfi_def_cfa wsp, 192
	.loc	0 145 22 epilogue_begin         ; src/vm.c:145:22
	ldp	x29, x30, [sp, #176]            ; 16-byte Folded Reload
	add	sp, sp, #192
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp32:
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MOV
_vm_op_MOV:                             ; @vm_op_MOV
Lfunc_begin3:
	.loc	0 147 0 is_stmt 1               ; src/vm.c:147:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #272
	.cfi_def_cfa_offset 272
	stp	x29, x30, [sp, #256]            ; 16-byte Folded Spill
	add	x29, sp, #256
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #128]                  ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp33:
	.loc	0 148 15 prologue_end           ; src/vm.c:148:15
	ldurb	w9, [x29, #-19]
	.loc	0 148 9 is_stmt 0               ; src/vm.c:148:9
	stur	w9, [x29, #-60]
	.loc	0 149 15 is_stmt 1              ; src/vm.c:149:15
	ldurh	w9, [x29, #-18]
	.loc	0 149 9 is_stmt 0               ; src/vm.c:149:9
	stur	w9, [x29, #-64]
	.loc	0 151 13 is_stmt 1              ; src/vm.c:151:13
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	.loc	0 151 16 is_stmt 0              ; src/vm.c:151:16
	ldur	w10, [x29, #-64]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-112]               ; 8-byte Folded Spill
	.loc	0 151 13                        ; src/vm.c:151:13
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-104]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB3_2
	b	LBB3_1
LBB3_1:
	.loc	0 0 13                          ; src/vm.c:0:13
	ldur	x0, [x29, #-104]                ; 8-byte Folded Reload
	.loc	0 151 13                        ; src/vm.c:151:13
	bl	___asan_report_load8
	brk	#0x1
LBB3_2:
	.loc	0 0 13                          ; src/vm.c:0:13
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	ldur	x9, [x29, #-120]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-112]               ; 8-byte Folded Reload
	.loc	0 151 13                        ; src/vm.c:151:13
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	.loc	0 151 3                         ; src/vm.c:151:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 151 6                         ; src/vm.c:151:6
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #112]                 ; 8-byte Folded Spill
	.loc	0 151 3                         ; src/vm.c:151:3
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 151 11                        ; src/vm.c:151:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB3_4
	b	LBB3_3
LBB3_3:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 151 11                        ; src/vm.c:151:11
	bl	___asan_report_store8
	brk	#0x1
LBB3_4:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #112]                 ; 8-byte Folded Reload
	.loc	0 151 11                        ; src/vm.c:151:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 153 3 is_stmt 1               ; src/vm.c:153:3
	b	LBB3_5
LBB3_5:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
Ltmp34:
	.loc	0 153 3                         ; src/vm.c:153:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-72]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB3_8
	b	LBB3_6
LBB3_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB3_8
	b	LBB3_7
LBB3_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	bl	___asan_report_load1
	brk	#0x1
LBB3_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-76]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-76]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB3_10
	b	LBB3_9
LBB3_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	bl	___asan_report_load8
	brk	#0x1
LBB3_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB3_13
	b	LBB3_11
LBB3_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB3_13
	b	LBB3_12
LBB3_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	bl	___asan_report_load1
	brk	#0x1
LBB3_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-72]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB3_16
	b	LBB3_14
LBB3_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB3_16
	b	LBB3_15
LBB3_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	bl	___asan_report_load2
	brk	#0x1
LBB3_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 153 3                         ; src/vm.c:153:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-88]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 272
	.loc	0 153 3 epilogue_begin          ; src/vm.c:153:3
	ldp	x29, x30, [sp, #256]            ; 16-byte Folded Reload
	add	sp, sp, #272
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp35:
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_EXTA
_vm_op_EXTA:                            ; @vm_op_EXTA
Lfunc_begin4:
	.loc	0 156 0 is_stmt 1               ; src/vm.c:156:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x20, [sp, #40]
	strh	w0, [sp, #38]
	strb	w1, [sp, #37]
	str	x21, [sp, #24]
	str	x22, [sp, #16]
	str	x23, [sp, #8]
	str	x24, [sp]
Ltmp37:
	.loc	0 156 50 prologue_end           ; src/vm.c:156:50
	ldr	x20, [sp, #40]
	ldrh	w0, [sp, #38]
	ldrb	w1, [sp, #37]
	ldr	x21, [sp, #24]
	ldr	x22, [sp, #16]
	ldr	x23, [sp, #8]
	ldr	x24, [sp]
	.loc	0 156 39 epilogue_begin is_stmt 0 ; src/vm.c:156:39
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	b	_unusedexta
Ltmp38:
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LSI16
_vm_op_LSI16:                           ; @vm_op_LSI16
Lfunc_begin5:
	.loc	0 158 0 is_stmt 1               ; src/vm.c:158:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #240
	.cfi_def_cfa_offset 240
	stp	x29, x30, [sp, #224]            ; 16-byte Folded Spill
	add	x29, sp, #224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	stur	x22, [x29, #-32]
	stur	x23, [x29, #-40]
	stur	x24, [x29, #-48]
Ltmp39:
	.loc	0 159 15 prologue_end           ; src/vm.c:159:15
	ldurb	w9, [x29, #-11]
	.loc	0 159 9 is_stmt 0               ; src/vm.c:159:9
	stur	w9, [x29, #-52]
	.loc	0 161 13 is_stmt 1              ; src/vm.c:161:13
	ldursh	x9, [x29, #-10]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 161 3 is_stmt 0               ; src/vm.c:161:3
	ldur	x9, [x29, #-24]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 161 6                         ; src/vm.c:161:6
	ldur	w10, [x29, #-52]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-104]               ; 8-byte Folded Spill
	.loc	0 161 3                         ; src/vm.c:161:3
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-96]                 ; 8-byte Folded Spill
	.loc	0 161 11                        ; src/vm.c:161:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB5_2
	b	LBB5_1
LBB5_1:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldur	x0, [x29, #-96]                 ; 8-byte Folded Reload
	.loc	0 161 11                        ; src/vm.c:161:11
	bl	___asan_report_store8
	brk	#0x1
LBB5_2:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldur	x10, [x29, #-104]               ; 8-byte Folded Reload
	.loc	0 161 11                        ; src/vm.c:161:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 163 3 is_stmt 1               ; src/vm.c:163:3
	b	LBB5_3
LBB5_3:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp40:
	.loc	0 163 3                         ; src/vm.c:163:3
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-64]
	ldur	x9, [x29, #-64]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB5_6
	b	LBB5_4
LBB5_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB5_6
	b	LBB5_5
LBB5_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	bl	___asan_report_load1
	brk	#0x1
LBB5_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-68]
	ldur	x9, [x29, #-40]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-68]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB5_8
	b	LBB5_7
LBB5_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	bl	___asan_report_load8
	brk	#0x1
LBB5_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-80]
	ldur	x9, [x29, #-64]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB5_11
	b	LBB5_9
LBB5_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB5_11
	b	LBB5_10
LBB5_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	bl	___asan_report_load1
	brk	#0x1
LBB5_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-64]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB5_14
	b	LBB5_12
LBB5_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB5_14
	b	LBB5_13
LBB5_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	bl	___asan_report_load2
	brk	#0x1
LBB5_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 163 3                         ; src/vm.c:163:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-10]
	ldur	x8, [x29, #-8]
	add	x8, x8, #4
	stur	x8, [x29, #-8]
	ldur	x2, [x29, #-80]
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldur	x22, [x29, #-32]
	ldur	x23, [x29, #-40]
	ldur	x24, [x29, #-48]
	.cfi_def_cfa wsp, 240
	.loc	0 163 3 epilogue_begin          ; src/vm.c:163:3
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #240
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp41:
Lfunc_end5:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LZI16
_vm_op_LZI16:                           ; @vm_op_LZI16
Lfunc_begin6:
	.loc	0 166 0 is_stmt 1               ; src/vm.c:166:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #240
	.cfi_def_cfa_offset 240
	stp	x29, x30, [sp, #224]            ; 16-byte Folded Spill
	add	x29, sp, #224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	stur	x22, [x29, #-32]
	stur	x23, [x29, #-40]
	stur	x24, [x29, #-48]
Ltmp42:
	.loc	0 167 15 prologue_end           ; src/vm.c:167:15
	ldurb	w9, [x29, #-11]
	.loc	0 167 9 is_stmt 0               ; src/vm.c:167:9
	stur	w9, [x29, #-52]
	.loc	0 169 13 is_stmt 1              ; src/vm.c:169:13
	ldurh	w9, [x29, #-10]
                                        ; kill: def $x9 killed $w9
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 169 3 is_stmt 0               ; src/vm.c:169:3
	ldur	x9, [x29, #-24]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 169 6                         ; src/vm.c:169:6
	ldur	w10, [x29, #-52]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-104]               ; 8-byte Folded Spill
	.loc	0 169 3                         ; src/vm.c:169:3
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-96]                 ; 8-byte Folded Spill
	.loc	0 169 11                        ; src/vm.c:169:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB6_2
	b	LBB6_1
LBB6_1:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldur	x0, [x29, #-96]                 ; 8-byte Folded Reload
	.loc	0 169 11                        ; src/vm.c:169:11
	bl	___asan_report_store8
	brk	#0x1
LBB6_2:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldur	x10, [x29, #-104]               ; 8-byte Folded Reload
	.loc	0 169 11                        ; src/vm.c:169:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 171 3 is_stmt 1               ; src/vm.c:171:3
	b	LBB6_3
LBB6_3:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp43:
	.loc	0 171 3                         ; src/vm.c:171:3
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-64]
	ldur	x9, [x29, #-64]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB6_6
	b	LBB6_4
LBB6_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB6_6
	b	LBB6_5
LBB6_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	bl	___asan_report_load1
	brk	#0x1
LBB6_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-68]
	ldur	x9, [x29, #-40]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-68]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB6_8
	b	LBB6_7
LBB6_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	bl	___asan_report_load8
	brk	#0x1
LBB6_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-80]
	ldur	x9, [x29, #-64]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB6_11
	b	LBB6_9
LBB6_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB6_11
	b	LBB6_10
LBB6_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	bl	___asan_report_load1
	brk	#0x1
LBB6_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-64]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB6_14
	b	LBB6_12
LBB6_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB6_14
	b	LBB6_13
LBB6_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	bl	___asan_report_load2
	brk	#0x1
LBB6_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 171 3                         ; src/vm.c:171:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-10]
	ldur	x8, [x29, #-8]
	add	x8, x8, #4
	stur	x8, [x29, #-8]
	ldur	x2, [x29, #-80]
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldur	x22, [x29, #-32]
	ldur	x23, [x29, #-40]
	ldur	x24, [x29, #-48]
	.cfi_def_cfa wsp, 240
	.loc	0 171 3 epilogue_begin          ; src/vm.c:171:3
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #240
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp44:
Lfunc_end6:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LSI32
_vm_op_LSI32:                           ; @vm_op_LSI32
Lfunc_begin7:
	.loc	0 174 0 is_stmt 1               ; src/vm.c:174:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #288
	.cfi_def_cfa_offset 288
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #136]                  ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp45:
	.loc	0 175 15 prologue_end           ; src/vm.c:175:15
	ldurb	w9, [x29, #-19]
	.loc	0 175 9 is_stmt 0               ; src/vm.c:175:9
	stur	w9, [x29, #-60]
	.loc	0 177 3 is_stmt 1               ; src/vm.c:177:3
	ldur	x9, [x29, #-16]
	mov	x10, x9
	add	x10, x10, #4
	stur	x10, [x29, #-16]
	stur	x9, [x29, #-72]
	.loc	0 179 20                        ; src/vm.c:179:20
	ldur	x9, [x29, #-72]
	stur	x9, [x29, #-128]                ; 8-byte Folded Spill
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	stur	w8, [x29, #-112]                ; 4-byte Folded Spill
	cbz	w8, LBB7_3
	b	LBB7_1
LBB7_1:
	.loc	0 0 20 is_stmt 0                ; src/vm.c:0:20
	ldur	w8, [x29, #-112]                ; 4-byte Folded Reload
	ldur	x9, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 179 20                        ; src/vm.c:179:20
	and	x9, x9, #0x7
	add	x9, x9, #3
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB7_3
	b	LBB7_2
LBB7_2:
	.loc	0 0 20                          ; src/vm.c:0:20
	ldur	x0, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 179 20                        ; src/vm.c:179:20
	bl	___asan_report_load4
	brk	#0x1
LBB7_3:
	.loc	0 0 20                          ; src/vm.c:0:20
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldur	x9, [x29, #-128]                ; 8-byte Folded Reload
	.loc	0 179 20                        ; src/vm.c:179:20
	ldr	w9, [x9]
	lsr	w9, w9, #8
	.loc	0 179 12                        ; src/vm.c:179:12
	stur	w9, [x29, #-76]
	.loc	0 180 20 is_stmt 1              ; src/vm.c:180:20
	ldurh	w9, [x29, #-18]
	.loc	0 180 26 is_stmt 0              ; src/vm.c:180:26
	lsl	w9, w9, #24
	.loc	0 180 12                        ; src/vm.c:180:12
	stur	w9, [x29, #-80]
	.loc	0 182 13 is_stmt 1              ; src/vm.c:182:13
	ldur	w9, [x29, #-76]
	ldur	w10, [x29, #-80]
	orr	w10, w9, w10
                                        ; implicit-def: $x9
	mov	x9, x10
	sxtw	x9, w9
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 182 3 is_stmt 0               ; src/vm.c:182:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 182 6                         ; src/vm.c:182:6
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #120]                 ; 8-byte Folded Spill
	.loc	0 182 3                         ; src/vm.c:182:3
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 182 11                        ; src/vm.c:182:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB7_5
	b	LBB7_4
LBB7_4:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 182 11                        ; src/vm.c:182:11
	bl	___asan_report_store8
	brk	#0x1
LBB7_5:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #120]                 ; 8-byte Folded Reload
	.loc	0 182 11                        ; src/vm.c:182:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 184 3 is_stmt 1               ; src/vm.c:184:3
	b	LBB7_6
LBB7_6:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
Ltmp46:
	.loc	0 184 3                         ; src/vm.c:184:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB7_9
	b	LBB7_7
LBB7_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB7_9
	b	LBB7_8
LBB7_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	bl	___asan_report_load1
	brk	#0x1
LBB7_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-92]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-92]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB7_11
	b	LBB7_10
LBB7_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	bl	___asan_report_load8
	brk	#0x1
LBB7_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-104]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB7_14
	b	LBB7_12
LBB7_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB7_14
	b	LBB7_13
LBB7_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	bl	___asan_report_load1
	brk	#0x1
LBB7_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB7_17
	b	LBB7_15
LBB7_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB7_17
	b	LBB7_16
LBB7_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	bl	___asan_report_load2
	brk	#0x1
LBB7_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 184 3                         ; src/vm.c:184:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-104]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 288
	.loc	0 184 3 epilogue_begin          ; src/vm.c:184:3
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	add	sp, sp, #288
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp47:
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LZI32
_vm_op_LZI32:                           ; @vm_op_LZI32
Lfunc_begin8:
	.loc	0 187 0 is_stmt 1               ; src/vm.c:187:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #288
	.cfi_def_cfa_offset 288
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #136]                  ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp48:
	.loc	0 188 15 prologue_end           ; src/vm.c:188:15
	ldurb	w9, [x29, #-19]
	.loc	0 188 9 is_stmt 0               ; src/vm.c:188:9
	stur	w9, [x29, #-60]
	.loc	0 190 3 is_stmt 1               ; src/vm.c:190:3
	ldur	x9, [x29, #-16]
	mov	x10, x9
	add	x10, x10, #4
	stur	x10, [x29, #-16]
	stur	x9, [x29, #-72]
	.loc	0 192 20                        ; src/vm.c:192:20
	ldur	x9, [x29, #-72]
	stur	x9, [x29, #-128]                ; 8-byte Folded Spill
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	stur	w8, [x29, #-112]                ; 4-byte Folded Spill
	cbz	w8, LBB8_3
	b	LBB8_1
LBB8_1:
	.loc	0 0 20 is_stmt 0                ; src/vm.c:0:20
	ldur	w8, [x29, #-112]                ; 4-byte Folded Reload
	ldur	x9, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 192 20                        ; src/vm.c:192:20
	and	x9, x9, #0x7
	add	x9, x9, #3
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB8_3
	b	LBB8_2
LBB8_2:
	.loc	0 0 20                          ; src/vm.c:0:20
	ldur	x0, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 192 20                        ; src/vm.c:192:20
	bl	___asan_report_load4
	brk	#0x1
LBB8_3:
	.loc	0 0 20                          ; src/vm.c:0:20
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldur	x9, [x29, #-128]                ; 8-byte Folded Reload
	.loc	0 192 20                        ; src/vm.c:192:20
	ldr	w9, [x9]
	lsr	w9, w9, #8
	.loc	0 192 12                        ; src/vm.c:192:12
	stur	w9, [x29, #-76]
	.loc	0 193 20 is_stmt 1              ; src/vm.c:193:20
	ldurh	w9, [x29, #-18]
	.loc	0 193 26 is_stmt 0              ; src/vm.c:193:26
	lsl	w9, w9, #24
	.loc	0 193 12                        ; src/vm.c:193:12
	stur	w9, [x29, #-80]
	.loc	0 195 13 is_stmt 1              ; src/vm.c:195:13
	ldur	w9, [x29, #-76]
	ldur	w10, [x29, #-80]
	orr	w9, w9, w10
	mov	w9, w9
                                        ; kill: def $x9 killed $w9
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 195 3 is_stmt 0               ; src/vm.c:195:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 195 6                         ; src/vm.c:195:6
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #120]                 ; 8-byte Folded Spill
	.loc	0 195 3                         ; src/vm.c:195:3
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 195 11                        ; src/vm.c:195:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB8_5
	b	LBB8_4
LBB8_4:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 195 11                        ; src/vm.c:195:11
	bl	___asan_report_store8
	brk	#0x1
LBB8_5:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #120]                 ; 8-byte Folded Reload
	.loc	0 195 11                        ; src/vm.c:195:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 197 3 is_stmt 1               ; src/vm.c:197:3
	b	LBB8_6
LBB8_6:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
Ltmp49:
	.loc	0 197 3                         ; src/vm.c:197:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB8_9
	b	LBB8_7
LBB8_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB8_9
	b	LBB8_8
LBB8_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	bl	___asan_report_load1
	brk	#0x1
LBB8_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-92]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-92]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB8_11
	b	LBB8_10
LBB8_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	bl	___asan_report_load8
	brk	#0x1
LBB8_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-104]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB8_14
	b	LBB8_12
LBB8_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB8_14
	b	LBB8_13
LBB8_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	bl	___asan_report_load1
	brk	#0x1
LBB8_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB8_17
	b	LBB8_15
LBB8_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB8_17
	b	LBB8_16
LBB8_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	bl	___asan_report_load2
	brk	#0x1
LBB8_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 197 3                         ; src/vm.c:197:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-104]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 288
	.loc	0 197 3 epilogue_begin          ; src/vm.c:197:3
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	add	sp, sp, #288
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp50:
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LC
_vm_op_LC:                              ; @vm_op_LC
Lfunc_begin9:
	.loc	0 200 0 is_stmt 1               ; src/vm.c:200:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #304
	.cfi_def_cfa_offset 304
	stp	x29, x30, [sp, #288]            ; 16-byte Folded Spill
	add	x29, sp, #288
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-128]                ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp51:
	.loc	0 201 15 prologue_end           ; src/vm.c:201:15
	ldurb	w9, [x29, #-19]
	.loc	0 201 9 is_stmt 0               ; src/vm.c:201:9
	stur	w9, [x29, #-60]
	.loc	0 202 15 is_stmt 1              ; src/vm.c:202:15
	ldurh	w9, [x29, #-18]
                                        ; kill: def $x9 killed $w9
	.loc	0 202 9 is_stmt 0               ; src/vm.c:202:9
	stur	x9, [x29, #-72]
	.loc	0 204 13 is_stmt 1              ; src/vm.c:204:13
	ldur	x9, [x29, #-40]
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	.loc	0 204 20 is_stmt 0              ; src/vm.c:204:20
	add	x9, x9, #40
	stur	x9, [x29, #-112]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB9_2
	b	LBB9_1
LBB9_1:
	.loc	0 0 20                          ; src/vm.c:0:20
	ldur	x0, [x29, #-112]                ; 8-byte Folded Reload
	.loc	0 204 20                        ; src/vm.c:204:20
	bl	___asan_report_load8
	brk	#0x1
LBB9_2:
	.loc	0 0 20                          ; src/vm.c:0:20
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 204 20                        ; src/vm.c:204:20
	ldr	x9, [x9, #40]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	.loc	0 204 25                        ; src/vm.c:204:25
	ldur	x10, [x29, #-72]
	str	x10, [sp, #144]                 ; 8-byte Folded Spill
	.loc	0 204 13                        ; src/vm.c:204:13
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-136]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB9_4
	b	LBB9_3
LBB9_3:
	.loc	0 0 13                          ; src/vm.c:0:13
	ldur	x0, [x29, #-136]                ; 8-byte Folded Reload
	.loc	0 204 13                        ; src/vm.c:204:13
	bl	___asan_report_load8
	brk	#0x1
LBB9_4:
	.loc	0 0 13                          ; src/vm.c:0:13
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldr	x9, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #144]                 ; 8-byte Folded Reload
	.loc	0 204 13                        ; src/vm.c:204:13
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 204 3                         ; src/vm.c:204:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 204 6                         ; src/vm.c:204:6
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #120]                 ; 8-byte Folded Spill
	.loc	0 204 3                         ; src/vm.c:204:3
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 204 11                        ; src/vm.c:204:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB9_6
	b	LBB9_5
LBB9_5:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 204 11                        ; src/vm.c:204:11
	bl	___asan_report_store8
	brk	#0x1
LBB9_6:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #120]                 ; 8-byte Folded Reload
	.loc	0 204 11                        ; src/vm.c:204:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 206 3 is_stmt 1               ; src/vm.c:206:3
	b	LBB9_7
LBB9_7:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
Ltmp52:
	.loc	0 206 3                         ; src/vm.c:206:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-80]
	ldur	x9, [x29, #-80]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB9_10
	b	LBB9_8
LBB9_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB9_10
	b	LBB9_9
LBB9_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	bl	___asan_report_load1
	brk	#0x1
LBB9_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-84]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-84]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB9_12
	b	LBB9_11
LBB9_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	bl	___asan_report_load8
	brk	#0x1
LBB9_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-96]
	ldur	x9, [x29, #-80]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB9_15
	b	LBB9_13
LBB9_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB9_15
	b	LBB9_14
LBB9_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	bl	___asan_report_load1
	brk	#0x1
LBB9_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-80]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB9_18
	b	LBB9_16
LBB9_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB9_18
	b	LBB9_17
LBB9_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	bl	___asan_report_load2
	brk	#0x1
LBB9_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 206 3                         ; src/vm.c:206:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-96]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 304
	.loc	0 206 3 epilogue_begin          ; src/vm.c:206:3
	ldp	x29, x30, [sp, #288]            ; 16-byte Folded Reload
	add	sp, sp, #304
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp53:
Lfunc_end9:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_APP
_vm_op_APP:                             ; @vm_op_APP
Lfunc_begin10:
	.loc	0 209 0 is_stmt 1               ; src/vm.c:209:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #384
	.cfi_def_cfa_offset 384
	stp	x29, x30, [sp, #368]            ; 16-byte Folded Spill
	add	x29, sp, #368
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_remember_state
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-152]                ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp54:
	.loc	0 210 17 prologue_end           ; src/vm.c:210:17
	ldurb	w9, [x29, #-19]
	.loc	0 210 9 is_stmt 0               ; src/vm.c:210:9
	stur	w9, [x29, #-60]
	.loc	0 212 26 is_stmt 1              ; src/vm.c:212:26
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-144]                ; 8-byte Folded Spill
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-136]               ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-128]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB10_2
	b	LBB10_1
LBB10_1:
	.loc	0 0 26 is_stmt 0                ; src/vm.c:0:26
	ldur	x0, [x29, #-128]                ; 8-byte Folded Reload
	.loc	0 212 26                        ; src/vm.c:212:26
	bl	___asan_report_load8
	brk	#0x1
LBB10_2:
	.loc	0 0 26                          ; src/vm.c:0:26
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-144]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-136]               ; 8-byte Folded Reload
	.loc	0 212 26                        ; src/vm.c:212:26
	ldr	x9, [x9, x10, lsl #3]
	.loc	0 212 19                        ; src/vm.c:212:19
	stur	x9, [x29, #-72]
	.loc	0 213 25 is_stmt 1              ; src/vm.c:213:25
	ldur	x9, [x29, #-72]
	stur	x9, [x29, #-168]                ; 8-byte Folded Spill
	add	x9, x9, #8
	stur	x9, [x29, #-160]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB10_4
	b	LBB10_3
LBB10_3:
	.loc	0 0 25 is_stmt 0                ; src/vm.c:0:25
	ldur	x0, [x29, #-160]                ; 8-byte Folded Reload
	.loc	0 213 25                        ; src/vm.c:213:25
	bl	___asan_report_load8
	brk	#0x1
LBB10_4:
	.loc	0 0 25                          ; src/vm.c:0:25
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-168]                ; 8-byte Folded Reload
	.loc	0 213 25                        ; src/vm.c:213:25
	ldr	x9, [x9, #8]
	.loc	0 213 20                        ; src/vm.c:213:20
	stur	x9, [x29, #-80]
	.loc	0 215 17 is_stmt 1              ; src/vm.c:215:17
	ldur	x9, [x29, #-16]
	.loc	0 215 9 is_stmt 0               ; src/vm.c:215:9
	stur	x9, [x29, #-88]
	.loc	0 216 8 is_stmt 1               ; src/vm.c:216:8
	ldur	x9, [x29, #-80]
	.loc	0 216 12 is_stmt 0              ; src/vm.c:216:12
	add	x9, x9, #8
	.loc	0 216 6                         ; src/vm.c:216:6
	stur	x9, [x29, #-16]
	.loc	0 218 8 is_stmt 1               ; src/vm.c:218:8
	ldur	x9, [x29, #-32]
	add	x9, x9, #16
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	add	x9, x9, x10, lsl #3
	.loc	0 218 6 is_stmt 0               ; src/vm.c:218:6
	stur	x9, [x29, #-32]
Ltmp55:
	.loc	0 219 7 is_stmt 1               ; src/vm.c:219:7
	ldur	x9, [x29, #-32]
	str	x9, [sp, #176]                  ; 8-byte Folded Spill
	ldur	x9, [x29, #-40]
	str	x9, [sp, #184]                  ; 8-byte Folded Spill
	add	x9, x9, #56
	stur	x9, [x29, #-176]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB10_6
	b	LBB10_5
LBB10_5:
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x0, [x29, #-176]                ; 8-byte Folded Reload
	.loc	0 219 7                         ; src/vm.c:219:7
	bl	___asan_report_load8
	brk	#0x1
LBB10_6:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldr	x8, [sp, #176]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #184]                  ; 8-byte Folded Reload
	.loc	0 219 7                         ; src/vm.c:219:7
	ldr	x9, [x9, #56]
	subs	x8, x8, x9
	cset	w8, hs
Ltmp56:
	.loc	0 219 7                         ; src/vm.c:219:7
	tbz	w8, #0, LBB10_8
	b	LBB10_7
LBB10_7:                                ; %if.then
Ltmp57:
	.loc	0 220 35 is_stmt 1              ; src/vm.c:220:35
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 384
	.loc	0 220 21 epilogue_begin is_stmt 0 ; src/vm.c:220:21
	ldp	x29, x30, [sp, #368]            ; 16-byte Folded Reload
	add	sp, sp, #384
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_stackoverflow
Ltmp58:
LBB10_8:                                ; %if.end
	.cfi_restore_state
	.loc	0 0 21                          ; src/vm.c:0:21
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	.loc	0 223 18 is_stmt 1              ; src/vm.c:223:18
	ldur	x9, [x29, #-80]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	.loc	0 223 3 is_stmt 0               ; src/vm.c:223:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	subs	x9, x9, #16
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	.loc	0 223 16                        ; src/vm.c:223:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB10_10
	b	LBB10_9
LBB10_9:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #168]                  ; 8-byte Folded Reload
	.loc	0 223 16                        ; src/vm.c:223:16
	bl	___asan_report_store8
	brk	#0x1
LBB10_10:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #160]                 ; 8-byte Folded Reload
	.loc	0 223 16                        ; src/vm.c:223:16
	stur	x9, [x10, #-16]
	.loc	0 224 18 is_stmt 1              ; src/vm.c:224:18
	ldur	x9, [x29, #-88]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 224 3 is_stmt 0               ; src/vm.c:224:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 224 16                        ; src/vm.c:224:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB10_12
	b	LBB10_11
LBB10_11:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 224 16                        ; src/vm.c:224:16
	bl	___asan_report_store8
	brk	#0x1
LBB10_12:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #136]                 ; 8-byte Folded Reload
	.loc	0 224 16                        ; src/vm.c:224:16
	stur	x9, [x10, #-8]
	.loc	0 227 11 is_stmt 1              ; src/vm.c:227:11
	ldur	x9, [x29, #-72]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 227 3 is_stmt 0               ; src/vm.c:227:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 227 9                         ; src/vm.c:227:9
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB10_14
	b	LBB10_13
LBB10_13:
	.loc	0 0 9                           ; src/vm.c:0:9
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 227 9                         ; src/vm.c:227:9
	bl	___asan_report_store8
	brk	#0x1
LBB10_14:
	.loc	0 0 9                           ; src/vm.c:0:9
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 227 9                         ; src/vm.c:227:9
	str	x8, [x9]
	.loc	0 229 3 is_stmt 1               ; src/vm.c:229:3
	b	LBB10_15
LBB10_15:                               ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
Ltmp59:
	.loc	0 229 3                         ; src/vm.c:229:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-104]
	ldur	x9, [x29, #-104]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB10_18
	b	LBB10_16
LBB10_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB10_18
	b	LBB10_17
LBB10_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	bl	___asan_report_load1
	brk	#0x1
LBB10_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-108]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-108]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB10_20
	b	LBB10_19
LBB10_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	bl	___asan_report_load8
	brk	#0x1
LBB10_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-120]
	ldur	x9, [x29, #-104]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB10_23
	b	LBB10_21
LBB10_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB10_23
	b	LBB10_22
LBB10_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	bl	___asan_report_load1
	brk	#0x1
LBB10_23:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-104]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB10_26
	b	LBB10_24
LBB10_24:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB10_26
	b	LBB10_25
LBB10_25:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	bl	___asan_report_load2
	brk	#0x1
LBB10_26:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 229 3                         ; src/vm.c:229:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-120]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 384
	.loc	0 229 3 epilogue_begin          ; src/vm.c:229:3
	ldp	x29, x30, [sp, #368]            ; 16-byte Folded Reload
	add	sp, sp, #384
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp60:
Lfunc_end10:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_CALL
_vm_op_CALL:                            ; @vm_op_CALL
Lfunc_begin11:
	.loc	0 232 0 is_stmt 1               ; src/vm.c:232:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #336
	.cfi_def_cfa_offset 336
	stp	x29, x30, [sp, #320]            ; 16-byte Folded Spill
	add	x29, sp, #320
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_remember_state
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-144]                ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp61:
	.loc	0 233 15 prologue_end           ; src/vm.c:233:15
	ldurb	w9, [x29, #-19]
	.loc	0 233 9 is_stmt 0               ; src/vm.c:233:9
	stur	w9, [x29, #-60]
	.loc	0 234 14 is_stmt 1              ; src/vm.c:234:14
	ldurb	w9, [x29, #-18]
	.loc	0 234 9 is_stmt 0               ; src/vm.c:234:9
	stur	w9, [x29, #-64]
	.loc	0 236 25 is_stmt 1              ; src/vm.c:236:25
	ldur	x9, [x29, #-56]
	stur	x9, [x29, #-136]                ; 8-byte Folded Spill
	ldur	w10, [x29, #-64]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-128]               ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB11_2
	b	LBB11_1
LBB11_1:
	.loc	0 0 25 is_stmt 0                ; src/vm.c:0:25
	ldur	x0, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 236 25                        ; src/vm.c:236:25
	bl	___asan_report_load8
	brk	#0x1
LBB11_2:
	.loc	0 0 25                          ; src/vm.c:0:25
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-136]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-128]               ; 8-byte Folded Reload
	.loc	0 236 25                        ; src/vm.c:236:25
	ldr	x9, [x9, x10, lsl #3]
	.loc	0 236 20                        ; src/vm.c:236:20
	stur	x9, [x29, #-72]
	.loc	0 238 17 is_stmt 1              ; src/vm.c:238:17
	ldur	x9, [x29, #-16]
	.loc	0 238 9 is_stmt 0               ; src/vm.c:238:9
	stur	x9, [x29, #-80]
	.loc	0 239 8 is_stmt 1               ; src/vm.c:239:8
	ldur	x9, [x29, #-72]
	.loc	0 239 12 is_stmt 0              ; src/vm.c:239:12
	add	x9, x9, #8
	.loc	0 239 6                         ; src/vm.c:239:6
	stur	x9, [x29, #-16]
	.loc	0 241 8 is_stmt 1               ; src/vm.c:241:8
	ldur	x9, [x29, #-32]
	add	x9, x9, #16
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	add	x9, x9, x10, lsl #3
	.loc	0 241 6 is_stmt 0               ; src/vm.c:241:6
	stur	x9, [x29, #-32]
Ltmp62:
	.loc	0 242 7 is_stmt 1               ; src/vm.c:242:7
	ldur	x9, [x29, #-32]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	ldur	x9, [x29, #-40]
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	add	x9, x9, #56
	stur	x9, [x29, #-152]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB11_4
	b	LBB11_3
LBB11_3:
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x0, [x29, #-152]                ; 8-byte Folded Reload
	.loc	0 242 7                         ; src/vm.c:242:7
	bl	___asan_report_load8
	brk	#0x1
LBB11_4:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldr	x8, [sp, #152]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 242 7                         ; src/vm.c:242:7
	ldr	x9, [x9, #56]
	subs	x8, x8, x9
	cset	w8, hs
Ltmp63:
	.loc	0 242 7                         ; src/vm.c:242:7
	tbz	w8, #0, LBB11_6
	b	LBB11_5
LBB11_5:                                ; %if.then
Ltmp64:
	.loc	0 243 35 is_stmt 1              ; src/vm.c:243:35
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 336
	.loc	0 243 21 epilogue_begin is_stmt 0 ; src/vm.c:243:21
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_stackoverflow
Ltmp65:
LBB11_6:                                ; %if.end
	.cfi_restore_state
	.loc	0 0 21                          ; src/vm.c:0:21
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	.loc	0 246 18 is_stmt 1              ; src/vm.c:246:18
	ldur	x9, [x29, #-72]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 246 3 is_stmt 0               ; src/vm.c:246:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	subs	x9, x9, #16
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 246 16                        ; src/vm.c:246:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB11_8
	b	LBB11_7
LBB11_7:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 246 16                        ; src/vm.c:246:16
	bl	___asan_report_store8
	brk	#0x1
LBB11_8:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #136]                 ; 8-byte Folded Reload
	.loc	0 246 16                        ; src/vm.c:246:16
	stur	x9, [x10, #-16]
	.loc	0 247 18 is_stmt 1              ; src/vm.c:247:18
	ldur	x9, [x29, #-80]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 247 3 is_stmt 0               ; src/vm.c:247:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 247 16                        ; src/vm.c:247:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB11_10
	b	LBB11_9
LBB11_9:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 247 16                        ; src/vm.c:247:16
	bl	___asan_report_store8
	brk	#0x1
LBB11_10:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 247 16                        ; src/vm.c:247:16
	stur	x8, [x9, #-8]
	.loc	0 249 3 is_stmt 1               ; src/vm.c:249:3
	b	LBB11_11
LBB11_11:                               ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
Ltmp66:
	.loc	0 249 3                         ; src/vm.c:249:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-96]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB11_14
	b	LBB11_12
LBB11_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB11_14
	b	LBB11_13
LBB11_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	bl	___asan_report_load1
	brk	#0x1
LBB11_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-100]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-100]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB11_16
	b	LBB11_15
LBB11_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	bl	___asan_report_load8
	brk	#0x1
LBB11_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-112]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB11_19
	b	LBB11_17
LBB11_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB11_19
	b	LBB11_18
LBB11_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	bl	___asan_report_load1
	brk	#0x1
LBB11_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB11_22
	b	LBB11_20
LBB11_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB11_22
	b	LBB11_21
LBB11_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	bl	___asan_report_load2
	brk	#0x1
LBB11_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 249 3                         ; src/vm.c:249:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-112]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 336
	.loc	0 249 3 epilogue_begin          ; src/vm.c:249:3
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp67:
Lfunc_end11:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_JMP
_vm_op_JMP:                             ; @vm_op_JMP
Lfunc_begin12:
	.loc	0 252 0 is_stmt 1               ; src/vm.c:252:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #208
	.cfi_def_cfa_offset 208
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	add	x29, sp, #192
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	stur	x22, [x29, #-32]
	stur	x23, [x29, #-40]
	stur	x24, [x29, #-48]
Ltmp68:
	.loc	0 253 19 prologue_end           ; src/vm.c:253:19
	ldursh	x8, [x29, #-10]
	.loc	0 253 10 is_stmt 0              ; src/vm.c:253:10
	stur	x8, [x29, #-56]
	.loc	0 255 8 is_stmt 1               ; src/vm.c:255:8
	ldur	x8, [x29, #-8]
	ldur	x9, [x29, #-56]
	add	x8, x8, x9, lsl #2
	.loc	0 255 6 is_stmt 0               ; src/vm.c:255:6
	stur	x8, [x29, #-8]
	.loc	0 257 3 is_stmt 1               ; src/vm.c:257:3
	b	LBB12_1
LBB12_1:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp69:
	.loc	0 257 3                         ; src/vm.c:257:3
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-64]
	ldur	x9, [x29, #-64]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB12_4
	b	LBB12_2
LBB12_2:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB12_4
	b	LBB12_3
LBB12_3:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	bl	___asan_report_load1
	brk	#0x1
LBB12_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-68]
	ldur	x9, [x29, #-40]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-68]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB12_6
	b	LBB12_5
LBB12_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	bl	___asan_report_load8
	brk	#0x1
LBB12_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-80]
	ldur	x9, [x29, #-64]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB12_9
	b	LBB12_7
LBB12_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB12_9
	b	LBB12_8
LBB12_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	bl	___asan_report_load1
	brk	#0x1
LBB12_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-64]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB12_12
	b	LBB12_10
LBB12_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB12_12
	b	LBB12_11
LBB12_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	bl	___asan_report_load2
	brk	#0x1
LBB12_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 257 3                         ; src/vm.c:257:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-10]
	ldur	x8, [x29, #-8]
	add	x8, x8, #4
	stur	x8, [x29, #-8]
	ldur	x2, [x29, #-80]
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldur	x22, [x29, #-32]
	ldur	x23, [x29, #-40]
	ldur	x24, [x29, #-48]
	.cfi_def_cfa wsp, 208
	.loc	0 257 3 epilogue_begin          ; src/vm.c:257:3
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	add	sp, sp, #208
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp70:
Lfunc_end12:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_JR
_vm_op_JR:                              ; @vm_op_JR
Lfunc_begin13:
	.loc	0 260 0 is_stmt 1               ; src/vm.c:260:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #240
	.cfi_def_cfa_offset 240
	stp	x29, x30, [sp, #224]            ; 16-byte Folded Spill
	add	x29, sp, #224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	stur	x22, [x29, #-32]
	stur	x23, [x29, #-40]
	stur	x24, [x29, #-48]
Ltmp71:
	.loc	0 261 15 prologue_end           ; src/vm.c:261:15
	ldurb	w9, [x29, #-11]
                                        ; kill: def $x9 killed $w9
	.loc	0 261 9 is_stmt 0               ; src/vm.c:261:9
	stur	x9, [x29, #-56]
	.loc	0 262 19 is_stmt 1              ; src/vm.c:262:19
	ldur	x9, [x29, #-24]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	ldur	x10, [x29, #-56]
	str	x10, [sp, #112]                 ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-104]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB13_2
	b	LBB13_1
LBB13_1:
	.loc	0 0 19 is_stmt 0                ; src/vm.c:0:19
	ldur	x0, [x29, #-104]                ; 8-byte Folded Reload
	.loc	0 262 19                        ; src/vm.c:262:19
	bl	___asan_report_load8
	brk	#0x1
LBB13_2:
	.loc	0 0 19                          ; src/vm.c:0:19
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 262 19                        ; src/vm.c:262:19
	ldr	x8, [x8, x9, lsl #3]
	.loc	0 262 10                        ; src/vm.c:262:10
	stur	x8, [x29, #-64]
	.loc	0 264 8 is_stmt 1               ; src/vm.c:264:8
	ldur	x8, [x29, #-8]
	ldur	x9, [x29, #-64]
	add	x8, x8, x9, lsl #2
	.loc	0 264 6 is_stmt 0               ; src/vm.c:264:6
	stur	x8, [x29, #-8]
	.loc	0 266 3 is_stmt 1               ; src/vm.c:266:3
	b	LBB13_3
LBB13_3:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp72:
	.loc	0 266 3                         ; src/vm.c:266:3
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-72]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB13_6
	b	LBB13_4
LBB13_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB13_6
	b	LBB13_5
LBB13_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	bl	___asan_report_load1
	brk	#0x1
LBB13_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-76]
	ldur	x9, [x29, #-40]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-76]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB13_8
	b	LBB13_7
LBB13_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	bl	___asan_report_load8
	brk	#0x1
LBB13_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB13_11
	b	LBB13_9
LBB13_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB13_11
	b	LBB13_10
LBB13_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	bl	___asan_report_load1
	brk	#0x1
LBB13_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-72]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB13_14
	b	LBB13_12
LBB13_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB13_14
	b	LBB13_13
LBB13_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	bl	___asan_report_load2
	brk	#0x1
LBB13_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 266 3                         ; src/vm.c:266:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-10]
	ldur	x8, [x29, #-8]
	add	x8, x8, #4
	stur	x8, [x29, #-8]
	ldur	x2, [x29, #-88]
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldur	x22, [x29, #-32]
	ldur	x23, [x29, #-40]
	ldur	x24, [x29, #-48]
	.cfi_def_cfa wsp, 240
	.loc	0 266 3 epilogue_begin          ; src/vm.c:266:3
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #240
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp73:
Lfunc_end13:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_DISP
_vm_op_DISP:                            ; @vm_op_DISP
Lfunc_begin14:
	.loc	0 269 0 is_stmt 1               ; src/vm.c:269:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #240
	.cfi_def_cfa_offset 240
	stp	x29, x30, [sp, #224]            ; 16-byte Folded Spill
	add	x29, sp, #224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	stur	x22, [x29, #-32]
	stur	x23, [x29, #-40]
	stur	x24, [x29, #-48]
Ltmp74:
	.loc	0 270 22 prologue_end           ; src/vm.c:270:22
	ldurb	w9, [x29, #-11]
	.loc	0 270 9 is_stmt 0               ; src/vm.c:270:9
	stur	w9, [x29, #-52]
	.loc	0 271 18 is_stmt 1              ; src/vm.c:271:18
	ldursh	w9, [x29, #-10]
	.loc	0 271 11 is_stmt 0              ; src/vm.c:271:11
	stur	w9, [x29, #-56]
	.loc	0 273 17 is_stmt 1              ; src/vm.c:273:17
	ldur	x9, [x29, #-24]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 273 20 is_stmt 0              ; src/vm.c:273:20
	ldur	w10, [x29, #-52]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #112]                 ; 8-byte Folded Spill
	.loc	0 273 17                        ; src/vm.c:273:17
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-104]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB14_2
	b	LBB14_1
LBB14_1:
	.loc	0 0 17                          ; src/vm.c:0:17
	ldur	x0, [x29, #-104]                ; 8-byte Folded Reload
	.loc	0 273 17                        ; src/vm.c:273:17
	bl	___asan_report_load8
	brk	#0x1
LBB14_2:
	.loc	0 0 17                          ; src/vm.c:0:17
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 273 17                        ; src/vm.c:273:17
	ldr	x8, [x8, x9, lsl #3]
	.loc	0 273 34                        ; src/vm.c:273:34
	ldursw	x9, [x29, #-56]
	.loc	0 273 32                        ; src/vm.c:273:32
	add	x8, x8, x9
                                        ; kill: def $w8 killed $w8 killed $x8
	.loc	0 273 9                         ; src/vm.c:273:9
	stur	w8, [x29, #-60]
	.loc	0 274 8 is_stmt 1               ; src/vm.c:274:8
	ldur	x8, [x29, #-8]
	ldur	w9, [x29, #-60]
                                        ; kill: def $x9 killed $w9
	add	x8, x8, x9, lsl #2
	.loc	0 274 6 is_stmt 0               ; src/vm.c:274:6
	stur	x8, [x29, #-8]
	.loc	0 276 3 is_stmt 1               ; src/vm.c:276:3
	b	LBB14_3
LBB14_3:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp75:
	.loc	0 276 3                         ; src/vm.c:276:3
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-72]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB14_6
	b	LBB14_4
LBB14_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB14_6
	b	LBB14_5
LBB14_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	bl	___asan_report_load1
	brk	#0x1
LBB14_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-76]
	ldur	x9, [x29, #-40]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-76]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB14_8
	b	LBB14_7
LBB14_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	bl	___asan_report_load8
	brk	#0x1
LBB14_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB14_11
	b	LBB14_9
LBB14_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB14_11
	b	LBB14_10
LBB14_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	bl	___asan_report_load1
	brk	#0x1
LBB14_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-72]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB14_14
	b	LBB14_12
LBB14_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB14_14
	b	LBB14_13
LBB14_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	bl	___asan_report_load2
	brk	#0x1
LBB14_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 276 3                         ; src/vm.c:276:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-10]
	ldur	x8, [x29, #-8]
	add	x8, x8, #4
	stur	x8, [x29, #-8]
	ldur	x2, [x29, #-88]
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldur	x22, [x29, #-32]
	ldur	x23, [x29, #-40]
	ldur	x24, [x29, #-48]
	.cfi_def_cfa wsp, 240
	.loc	0 276 3 epilogue_begin          ; src/vm.c:276:3
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #240
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp76:
Lfunc_end14:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RETU
_vm_op_RETU:                            ; @vm_op_RETU
Lfunc_begin15:
	.loc	0 279 0 is_stmt 1               ; src/vm.c:279:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #288
	.cfi_def_cfa_offset 288
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #136]                  ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp77:
	.loc	0 280 3 prologue_end            ; src/vm.c:280:3
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-128]                ; 8-byte Folded Spill
	subs	x9, x9, #16
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	.loc	0 280 16 is_stmt 0              ; src/vm.c:280:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB15_2
	b	LBB15_1
LBB15_1:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x0, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 280 16                        ; src/vm.c:280:16
	bl	___asan_report_store8
	brk	#0x1
LBB15_2:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldur	x9, [x29, #-128]                ; 8-byte Folded Reload
	.loc	0 280 16                        ; src/vm.c:280:16
	stur	xzr, [x9, #-16]
	.loc	0 282 14 is_stmt 1              ; src/vm.c:282:14
	ldur	x9, [x29, #-32]
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB15_4
	b	LBB15_3
LBB15_3:
	.loc	0 0 14 is_stmt 0                ; src/vm.c:0:14
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 282 14                        ; src/vm.c:282:14
	bl	___asan_report_load8
	brk	#0x1
LBB15_4:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 282 14                        ; src/vm.c:282:14
	ldur	x9, [x9, #-8]
	.loc	0 282 9                         ; src/vm.c:282:9
	stur	x9, [x29, #-64]
	.loc	0 284 3 is_stmt 1               ; src/vm.c:284:3
	ldur	x9, [x29, #-64]
	subs	x9, x9, #4
	stur	x9, [x29, #-72]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #116]                  ; 4-byte Folded Spill
	cbz	w8, LBB15_7
	b	LBB15_5
LBB15_5:
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	w8, [sp, #116]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 284 3                         ; src/vm.c:284:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB15_7
	b	LBB15_6
LBB15_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 284 3                         ; src/vm.c:284:3
	bl	___asan_report_load1
	brk	#0x1
LBB15_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 284 3                         ; src/vm.c:284:3
	ldrb	w8, [x8, #1]
	stur	w8, [x29, #-76]
	.loc	0 286 8 is_stmt 1               ; src/vm.c:286:8
	ldur	x8, [x29, #-32]
	subs	x8, x8, #16
	ldur	w9, [x29, #-76]
	mov	x10, x9
	mov	x9, #0                          ; =0x0
	subs	x9, x9, x10
	add	x8, x8, x9, lsl #3
	.loc	0 286 6 is_stmt 0               ; src/vm.c:286:6
	stur	x8, [x29, #-32]
	.loc	0 287 8 is_stmt 1               ; src/vm.c:287:8
	ldur	x8, [x29, #-64]
	.loc	0 287 6 is_stmt 0               ; src/vm.c:287:6
	stur	x8, [x29, #-16]
	.loc	0 289 3 is_stmt 1               ; src/vm.c:289:3
	b	LBB15_8
LBB15_8:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
Ltmp78:
	.loc	0 289 3                         ; src/vm.c:289:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB15_11
	b	LBB15_9
LBB15_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB15_11
	b	LBB15_10
LBB15_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	bl	___asan_report_load1
	brk	#0x1
LBB15_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-92]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-92]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB15_13
	b	LBB15_12
LBB15_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	bl	___asan_report_load8
	brk	#0x1
LBB15_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-104]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB15_16
	b	LBB15_14
LBB15_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB15_16
	b	LBB15_15
LBB15_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	bl	___asan_report_load1
	brk	#0x1
LBB15_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-88]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB15_19
	b	LBB15_17
LBB15_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB15_19
	b	LBB15_18
LBB15_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	bl	___asan_report_load2
	brk	#0x1
LBB15_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-104]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 288
	.loc	0 289 3 epilogue_begin          ; src/vm.c:289:3
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	add	sp, sp, #288
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp79:
Lfunc_end15:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RET
_vm_op_RET:                             ; @vm_op_RET
Lfunc_begin16:
	.loc	0 292 0 is_stmt 1               ; src/vm.c:292:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #336
	.cfi_def_cfa_offset 336
	stp	x29, x30, [sp, #320]            ; 16-byte Folded Spill
	add	x29, sp, #320
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-152]                ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp80:
	.loc	0 293 14 prologue_end           ; src/vm.c:293:14
	ldurb	w9, [x29, #-19]
	.loc	0 293 9 is_stmt 0               ; src/vm.c:293:9
	stur	w9, [x29, #-60]
	.loc	0 295 18 is_stmt 1              ; src/vm.c:295:18
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-144]                ; 8-byte Folded Spill
	.loc	0 295 21 is_stmt 0              ; src/vm.c:295:21
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-136]               ; 8-byte Folded Spill
	.loc	0 295 18                        ; src/vm.c:295:18
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-128]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB16_2
	b	LBB16_1
LBB16_1:
	.loc	0 0 18                          ; src/vm.c:0:18
	ldur	x0, [x29, #-128]                ; 8-byte Folded Reload
	.loc	0 295 18                        ; src/vm.c:295:18
	bl	___asan_report_load8
	brk	#0x1
LBB16_2:
	.loc	0 0 18                          ; src/vm.c:0:18
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-144]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-136]               ; 8-byte Folded Reload
	.loc	0 295 18                        ; src/vm.c:295:18
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 295 3                         ; src/vm.c:295:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	subs	x9, x9, #16
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	.loc	0 295 16                        ; src/vm.c:295:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB16_4
	b	LBB16_3
LBB16_3:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 295 16                        ; src/vm.c:295:16
	bl	___asan_report_store8
	brk	#0x1
LBB16_4:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #152]                 ; 8-byte Folded Reload
	.loc	0 295 16                        ; src/vm.c:295:16
	stur	x9, [x10, #-16]
	.loc	0 297 14 is_stmt 1              ; src/vm.c:297:14
	ldur	x9, [x29, #-32]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB16_6
	b	LBB16_5
LBB16_5:
	.loc	0 0 14 is_stmt 0                ; src/vm.c:0:14
	ldr	x0, [sp, #136]                  ; 8-byte Folded Reload
	.loc	0 297 14                        ; src/vm.c:297:14
	bl	___asan_report_load8
	brk	#0x1
LBB16_6:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 297 14                        ; src/vm.c:297:14
	ldur	x9, [x9, #-8]
	.loc	0 297 9                         ; src/vm.c:297:9
	stur	x9, [x29, #-72]
	.loc	0 299 3 is_stmt 1               ; src/vm.c:299:3
	ldur	x9, [x29, #-72]
	subs	x9, x9, #4
	stur	x9, [x29, #-80]
	ldur	x9, [x29, #-80]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #124]                  ; 4-byte Folded Spill
	cbz	w8, LBB16_9
	b	LBB16_7
LBB16_7:
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	w8, [sp, #124]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 299 3                         ; src/vm.c:299:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB16_9
	b	LBB16_8
LBB16_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 299 3                         ; src/vm.c:299:3
	bl	___asan_report_load1
	brk	#0x1
LBB16_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 299 3                         ; src/vm.c:299:3
	ldrb	w8, [x8, #1]
	stur	w8, [x29, #-84]
	.loc	0 301 8 is_stmt 1               ; src/vm.c:301:8
	ldur	x8, [x29, #-32]
	subs	x8, x8, #16
	ldur	w9, [x29, #-84]
	mov	x10, x9
	mov	x9, #0                          ; =0x0
	subs	x9, x9, x10
	add	x8, x8, x9, lsl #3
	.loc	0 301 6 is_stmt 0               ; src/vm.c:301:6
	stur	x8, [x29, #-32]
	.loc	0 302 8 is_stmt 1               ; src/vm.c:302:8
	ldur	x8, [x29, #-72]
	.loc	0 302 6 is_stmt 0               ; src/vm.c:302:6
	stur	x8, [x29, #-16]
	.loc	0 304 3 is_stmt 1               ; src/vm.c:304:3
	b	LBB16_10
LBB16_10:                               ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
Ltmp81:
	.loc	0 304 3                         ; src/vm.c:304:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-96]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB16_13
	b	LBB16_11
LBB16_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB16_13
	b	LBB16_12
LBB16_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	bl	___asan_report_load1
	brk	#0x1
LBB16_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-100]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-100]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB16_15
	b	LBB16_14
LBB16_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	bl	___asan_report_load8
	brk	#0x1
LBB16_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-112]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB16_18
	b	LBB16_16
LBB16_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB16_18
	b	LBB16_17
LBB16_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	bl	___asan_report_load1
	brk	#0x1
LBB16_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB16_21
	b	LBB16_19
LBB16_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB16_21
	b	LBB16_20
LBB16_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	bl	___asan_report_load2
	brk	#0x1
LBB16_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 304 3                         ; src/vm.c:304:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-112]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 336
	.loc	0 304 3 epilogue_begin          ; src/vm.c:304:3
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp82:
Lfunc_end16:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_RETN
_vm_op_RETN:                            ; @vm_op_RETN
Lfunc_begin17:
	.loc	0 307 0 is_stmt 1               ; src/vm.c:307:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #352
	.cfi_def_cfa_offset 352
	stp	x29, x30, [sp, #336]            ; 16-byte Folded Spill
	add	x29, sp, #336
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-160]                ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp83:
	.loc	0 308 14 prologue_end           ; src/vm.c:308:14
	ldurb	w9, [x29, #-19]
	.loc	0 308 9 is_stmt 0               ; src/vm.c:308:9
	stur	w9, [x29, #-60]
	.loc	0 309 17 is_stmt 1              ; src/vm.c:309:17
	ldurh	w9, [x29, #-18]
	.loc	0 309 9 is_stmt 0               ; src/vm.c:309:9
	stur	w9, [x29, #-64]
	.loc	0 311 14 is_stmt 1              ; src/vm.c:311:14
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-152]                ; 8-byte Folded Spill
	subs	x9, x9, #8
	stur	x9, [x29, #-144]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB17_2
	b	LBB17_1
LBB17_1:
	.loc	0 0 14 is_stmt 0                ; src/vm.c:0:14
	ldur	x0, [x29, #-144]                ; 8-byte Folded Reload
	.loc	0 311 14                        ; src/vm.c:311:14
	bl	___asan_report_load8
	brk	#0x1
LBB17_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	.loc	0 311 14                        ; src/vm.c:311:14
	ldur	x8, [x8, #-8]
	.loc	0 311 9                         ; src/vm.c:311:9
	stur	x8, [x29, #-72]
	.loc	0 313 17 is_stmt 1              ; src/vm.c:313:17
	ldur	x8, [x29, #-32]
	subs	x8, x8, #16
	.loc	0 313 10 is_stmt 0              ; src/vm.c:313:10
	stur	x8, [x29, #-80]
Ltmp84:
	.loc	0 315 14 is_stmt 1              ; src/vm.c:315:14
	stur	wzr, [x29, #-84]
	.loc	0 315 8 is_stmt 0               ; src/vm.c:315:8
	b	LBB17_3
LBB17_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
Ltmp85:
	.loc	0 315 21                        ; src/vm.c:315:21
	ldur	w8, [x29, #-84]
	.loc	0 315 25                        ; src/vm.c:315:25
	ldur	w9, [x29, #-64]
Ltmp86:
	.loc	0 315 3                         ; src/vm.c:315:3
	subs	w8, w8, w9
	b.lo	LBB17_5
	b	LBB17_4
LBB17_4:                                ; %for.cond.cleanup
	.loc	0 0 3                           ; src/vm.c:0:3
	b	LBB17_11
LBB17_5:                                ; %for.body
                                        ;   in Loop: Header=BB17_3 Depth=1
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
Ltmp87:
	.loc	0 316 14 is_stmt 1              ; src/vm.c:316:14
	ldur	x9, [x29, #-32]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	.loc	0 316 17 is_stmt 0              ; src/vm.c:316:17
	ldur	w10, [x29, #-60]
	.loc	0 316 22                        ; src/vm.c:316:22
	ldur	w11, [x29, #-84]
	.loc	0 316 20                        ; src/vm.c:316:20
	add	w10, w10, w11
	str	w10, [sp, #164]                 ; 4-byte Folded Spill
	.loc	0 316 14                        ; src/vm.c:316:14
	add	x9, x9, w10, uxtw #3
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB17_7
	b	LBB17_6
LBB17_6:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #168]                  ; 8-byte Folded Reload
	.loc	0 316 14                        ; src/vm.c:316:14
	bl	___asan_report_load8
	brk	#0x1
LBB17_7:                                ;   in Loop: Header=BB17_3 Depth=1
	.loc	0 0 14                          ; src/vm.c:0:14
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	ldr	w10, [sp, #164]                 ; 4-byte Folded Reload
	.loc	0 316 14                        ; src/vm.c:316:14
	ldr	x9, [x9, w10, uxtw #3]
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 316 5                         ; src/vm.c:316:5
	ldur	x9, [x29, #-80]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 316 9                         ; src/vm.c:316:9
	ldur	w10, [x29, #-84]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #136]                 ; 8-byte Folded Spill
	.loc	0 316 5                         ; src/vm.c:316:5
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 316 12                        ; src/vm.c:316:12
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB17_9
	b	LBB17_8
LBB17_8:
	.loc	0 0 12                          ; src/vm.c:0:12
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 316 12                        ; src/vm.c:316:12
	bl	___asan_report_store8
	brk	#0x1
LBB17_9:                                ;   in Loop: Header=BB17_3 Depth=1
	.loc	0 0 12                          ; src/vm.c:0:12
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #136]                 ; 8-byte Folded Reload
	.loc	0 316 12                        ; src/vm.c:316:12
	str	x8, [x9, x10, lsl #3]
	.loc	0 316 5                         ; src/vm.c:316:5
	b	LBB17_10
LBB17_10:                               ; %for.inc
                                        ;   in Loop: Header=BB17_3 Depth=1
	.loc	0 315 33 is_stmt 1              ; src/vm.c:315:33
	ldur	w8, [x29, #-84]
	add	w8, w8, #1
	stur	w8, [x29, #-84]
	.loc	0 315 3 is_stmt 0               ; src/vm.c:315:3
	b	LBB17_3
Ltmp88:
LBB17_11:                               ; %for.end
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	.loc	0 318 3 is_stmt 1               ; src/vm.c:318:3
	ldur	x9, [x29, #-72]
	subs	x9, x9, #4
	stur	x9, [x29, #-96]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #116]                  ; 4-byte Folded Spill
	cbz	w8, LBB17_14
	b	LBB17_12
LBB17_12:
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	w8, [sp, #116]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 318 3                         ; src/vm.c:318:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB17_14
	b	LBB17_13
LBB17_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 318 3                         ; src/vm.c:318:3
	bl	___asan_report_load1
	brk	#0x1
LBB17_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 318 3                         ; src/vm.c:318:3
	ldrb	w8, [x8, #1]
	stur	w8, [x29, #-100]
	.loc	0 320 8 is_stmt 1               ; src/vm.c:320:8
	ldur	x8, [x29, #-32]
	subs	x8, x8, #16
	ldur	w9, [x29, #-100]
	mov	x10, x9
	mov	x9, #0                          ; =0x0
	subs	x9, x9, x10
	add	x8, x8, x9, lsl #3
	.loc	0 320 6 is_stmt 0               ; src/vm.c:320:6
	stur	x8, [x29, #-32]
	.loc	0 321 8 is_stmt 1               ; src/vm.c:321:8
	ldur	x8, [x29, #-72]
	.loc	0 321 6 is_stmt 0               ; src/vm.c:321:6
	stur	x8, [x29, #-16]
	.loc	0 323 3 is_stmt 1               ; src/vm.c:323:3
	b	LBB17_15
LBB17_15:                               ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
Ltmp89:
	.loc	0 323 3                         ; src/vm.c:323:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-112]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB17_18
	b	LBB17_16
LBB17_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB17_18
	b	LBB17_17
LBB17_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	bl	___asan_report_load1
	brk	#0x1
LBB17_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-116]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-116]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #56]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB17_20
	b	LBB17_19
LBB17_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	bl	___asan_report_load8
	brk	#0x1
LBB17_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-128]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB17_23
	b	LBB17_21
LBB17_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB17_23
	b	LBB17_22
LBB17_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	bl	___asan_report_load1
	brk	#0x1
LBB17_23:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-112]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB17_26
	b	LBB17_24
LBB17_24:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB17_26
	b	LBB17_25
LBB17_25:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	bl	___asan_report_load2
	brk	#0x1
LBB17_26:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 323 3                         ; src/vm.c:323:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-128]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 352
	.loc	0 323 3 epilogue_begin          ; src/vm.c:323:3
	ldp	x29, x30, [sp, #336]            ; 16-byte Folded Reload
	add	sp, sp, #352
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp90:
Lfunc_end17:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MOBJ
_vm_op_MOBJ:                            ; @vm_op_MOBJ
Lfunc_begin18:
	.loc	0 326 0 is_stmt 1               ; src/vm.c:326:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #336
	.cfi_def_cfa_offset 336
	stp	x29, x30, [sp, #320]            ; 16-byte Folded Spill
	add	x29, sp, #320
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_remember_state
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #160]                  ; 8-byte Folded Spill
	stur	x20, [x29, #-16]
	sturh	w0, [x29, #-18]
	sturb	w1, [x29, #-19]
	stur	x21, [x29, #-32]
	stur	x22, [x29, #-40]
	stur	x23, [x29, #-48]
	stur	x24, [x29, #-56]
Ltmp91:
	.loc	0 327 15 prologue_end           ; src/vm.c:327:15
	ldurb	w9, [x29, #-19]
	.loc	0 327 9 is_stmt 0               ; src/vm.c:327:9
	stur	w9, [x29, #-60]
	.loc	0 328 18 is_stmt 1              ; src/vm.c:328:18
	ldurh	w9, [x29, #-18]
	.loc	0 328 9 is_stmt 0               ; src/vm.c:328:9
	stur	w9, [x29, #-64]
Ltmp92:
	.loc	0 330 7 is_stmt 1               ; src/vm.c:330:7
	ldur	w9, [x29, #-64]
                                        ; kill: def $x9 killed $w9
	stur	x9, [x29, #-152]                ; 8-byte Folded Spill
	ldur	x9, [x29, #-40]
	stur	x9, [x29, #-144]                ; 8-byte Folded Spill
	add	x9, x9, #32
	stur	x9, [x29, #-136]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB18_2
	b	LBB18_1
LBB18_1:
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x0, [x29, #-136]                ; 8-byte Folded Reload
	.loc	0 330 7                         ; src/vm.c:330:7
	bl	___asan_report_load8
	brk	#0x1
LBB18_2:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-144]                ; 8-byte Folded Reload
	.loc	0 330 7                         ; src/vm.c:330:7
	ldr	x9, [x9, #32]
	subs	x8, x8, x9
	cset	w8, hi
Ltmp93:
	.loc	0 330 7                         ; src/vm.c:330:7
	tbz	w8, #0, LBB18_4
	b	LBB18_3
LBB18_3:                                ; %if.then
Ltmp94:
	.loc	0 331 35 is_stmt 1              ; src/vm.c:331:35
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 336
	.loc	0 331 21 epilogue_begin is_stmt 0 ; src/vm.c:331:21
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_invalidlayout
Ltmp95:
LBB18_4:                                ; %if.end
	.cfi_restore_state
	.loc	0 0 21                          ; src/vm.c:0:21
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 334 3 is_stmt 1               ; src/vm.c:334:3
	ldur	x9, [x29, #-16]
	mov	x10, x9
	add	x10, x10, #4
	stur	x10, [x29, #-16]
	stur	x9, [x29, #-80]
	.loc	0 335 16                        ; src/vm.c:335:16
	ldur	x9, [x29, #-80]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #156]                  ; 4-byte Folded Spill
	cbz	w8, LBB18_7
	b	LBB18_5
LBB18_5:
	.loc	0 0 16 is_stmt 0                ; src/vm.c:0:16
	ldr	w8, [sp, #156]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 335 16                        ; src/vm.c:335:16
	and	x9, x9, #0x7
	add	x9, x9, #3
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB18_7
	b	LBB18_6
LBB18_6:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 335 16                        ; src/vm.c:335:16
	bl	___asan_report_load4
	brk	#0x1
LBB18_7:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	.loc	0 335 16                        ; src/vm.c:335:16
	ldr	w8, [x8]
	lsr	w8, w8, #8
	.loc	0 335 9                         ; src/vm.c:335:9
	stur	w8, [x29, #-84]
	.loc	0 338 3 is_stmt 1               ; src/vm.c:338:3
	b	LBB18_8
LBB18_8:                                ; %do.body
Ltmp96:
	.loc	0 338 3 is_stmt 0               ; src/vm.c:338:3
	; InlineAsm Start
	mov	x8, x30
	; InlineAsm End
	stur	x8, [x29, #-104]
	ldur	w8, [x29, #-84]
	mov	x0, x8
	ldur	x1, [x29, #-40]
	ldur	x2, [x29, #-32]
	bl	_alloc_object
	stur	x0, [x29, #-96]
	ldur	x8, [x29, #-104]
	; InlineAsm Start
	mov	x30, x8
	; InlineAsm End
	b	LBB18_9
LBB18_9:                                ; %do.cond
	b	LBB18_10
Ltmp97:
LBB18_10:                               ; %do.end
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 340 13 is_stmt 1              ; src/vm.c:340:13
	ldur	x9, [x29, #-96]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 340 3 is_stmt 0               ; src/vm.c:340:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 340 6                         ; src/vm.c:340:6
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #120]                 ; 8-byte Folded Spill
	.loc	0 340 3                         ; src/vm.c:340:3
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 340 11                        ; src/vm.c:340:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB18_12
	b	LBB18_11
LBB18_11:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 340 11                        ; src/vm.c:340:11
	bl	___asan_report_store8
	brk	#0x1
LBB18_12:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #120]                 ; 8-byte Folded Reload
	.loc	0 340 11                        ; src/vm.c:340:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 342 3 is_stmt 1               ; src/vm.c:342:3
	b	LBB18_13
LBB18_13:                               ; %do.body7
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
Ltmp98:
	.loc	0 342 3                         ; src/vm.c:342:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-112]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB18_16
	b	LBB18_14
LBB18_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB18_16
	b	LBB18_15
LBB18_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	bl	___asan_report_load1
	brk	#0x1
LBB18_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	ldrb	w9, [x9]
	stur	w9, [x29, #-116]
	ldur	x9, [x29, #-48]
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	ldur	w10, [x29, #-116]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #64]                  ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB18_18
	b	LBB18_17
LBB18_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	bl	___asan_report_load8
	brk	#0x1
LBB18_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-128]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB18_21
	b	LBB18_19
LBB18_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB18_21
	b	LBB18_20
LBB18_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	bl	___asan_report_load1
	brk	#0x1
LBB18_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB18_24
	b	LBB18_22
LBB18_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB18_24
	b	LBB18_23
LBB18_23:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	bl	___asan_report_load2
	brk	#0x1
LBB18_24:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 342 3                         ; src/vm.c:342:3
	ldrh	w8, [x8, #2]
	sturh	w8, [x29, #-18]
	ldur	x8, [x29, #-16]
	add	x8, x8, #4
	stur	x8, [x29, #-16]
	ldur	x2, [x29, #-128]
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 336
	.loc	0 342 3 epilogue_begin          ; src/vm.c:342:3
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp99:
Lfunc_end18:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MCLOS
_vm_op_MCLOS:                           ; @vm_op_MCLOS
Lfunc_begin19:
	.loc	0 345 0 is_stmt 1               ; src/vm.c:345:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x20, [sp, #40]
	strh	w0, [sp, #38]
	strb	w1, [sp, #37]
	str	x21, [sp, #24]
	str	x22, [sp, #16]
	str	x23, [sp, #8]
	str	x24, [sp]
Ltmp101:
	.loc	0 345 54 prologue_end           ; src/vm.c:345:54
	ldr	x20, [sp, #40]
	ldrh	w0, [sp, #38]
	ldrb	w1, [sp, #37]
	ldr	x21, [sp, #24]
	ldr	x22, [sp, #16]
	ldr	x23, [sp, #8]
	ldr	x24, [sp]
	.loc	0 345 40 epilogue_begin is_stmt 0 ; src/vm.c:345:40
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	b	_unimplemented
Ltmp102:
Lfunc_end19:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function undefined
_undefined:                             ; @undefined
Lfunc_begin20:
	.loc	0 53 0 is_stmt 1                ; src/vm.c:53:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	str	x22, [sp, #32]
	str	x23, [sp, #24]
	str	x24, [sp, #16]
Ltmp103:
	.loc	0 54 3 prologue_end             ; src/vm.c:54:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 54 10 is_stmt 0               ; src/vm.c:54:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 54 14                         ; src/vm.c:54:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB20_2
	b	LBB20_1
LBB20_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 54 14                         ; src/vm.c:54:14
	bl	___asan_report_store8
	brk	#0x1
LBB20_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 54 14                         ; src/vm.c:54:14
	adrp	x8, _.str.4@PAGE
	add	x8, x8, _.str.4@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 55 25 is_stmt 1               ; src/vm.c:55:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 55 19 epilogue_begin is_stmt 0 ; src/vm.c:55:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp104:
Lfunc_end20:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function diverge
_diverge:                               ; @diverge
Lfunc_begin21:
	.loc	0 83 0 is_stmt 1                ; src/vm.c:83:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x20, [sp, #40]
	strh	w0, [sp, #38]
	strb	w1, [sp, #37]
	str	x21, [sp, #24]
	str	x22, [sp, #16]
	str	x23, [sp, #8]
	str	x24, [sp]
Ltmp106:
	.loc	0 84 3 prologue_end             ; src/vm.c:84:3
	b	LBB21_1
LBB21_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
Ltmp107:
	.loc	0 84 3 is_stmt 0                ; src/vm.c:84:3
	b	LBB21_1
Ltmp108:
Lfunc_end21:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function halt
_halt:                                  ; @halt
Lfunc_begin22:
	.loc	0 89 0 is_stmt 1                ; src/vm.c:89:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x20, [sp, #40]
	strh	w0, [sp, #38]
	strb	w1, [sp, #37]
	str	x21, [sp, #24]
	str	x22, [sp, #16]
	str	x23, [sp, #8]
	str	x24, [sp]
Ltmp110:
	.loc	0 89 21 prologue_end epilogue_begin ; src/vm.c:89:21
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	ret
Ltmp111:
Lfunc_end22:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
Lfunc_begin23:
	.loc	0 77 0                          ; src/vm.c:77:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	str	x22, [sp, #32]
	str	x23, [sp, #24]
	str	x24, [sp, #16]
Ltmp112:
	.loc	0 78 3 prologue_end             ; src/vm.c:78:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 78 10 is_stmt 0               ; src/vm.c:78:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 78 14                         ; src/vm.c:78:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB23_2
	b	LBB23_1
LBB23_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 78 14                         ; src/vm.c:78:14
	bl	___asan_report_store8
	brk	#0x1
LBB23_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 78 14                         ; src/vm.c:78:14
	adrp	x8, _.str.6@PAGE
	add	x8, x8, _.str.6@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 79 25 is_stmt 1               ; src/vm.c:79:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 79 19 epilogue_begin is_stmt 0 ; src/vm.c:79:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp113:
Lfunc_end23:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
Lfunc_begin24:
	.loc	0 65 0 is_stmt 1                ; src/vm.c:65:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	str	x22, [sp, #32]
	str	x23, [sp, #24]
	str	x24, [sp, #16]
Ltmp114:
	.loc	0 66 3 prologue_end             ; src/vm.c:66:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 66 10 is_stmt 0               ; src/vm.c:66:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 66 14                         ; src/vm.c:66:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB24_2
	b	LBB24_1
LBB24_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 66 14                         ; src/vm.c:66:14
	bl	___asan_report_store8
	brk	#0x1
LBB24_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 66 14                         ; src/vm.c:66:14
	adrp	x8, _.str.7@PAGE
	add	x8, x8, _.str.7@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 67 25 is_stmt 1               ; src/vm.c:67:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 67 19 epilogue_begin is_stmt 0 ; src/vm.c:67:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp115:
Lfunc_end24:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
Lfunc_begin25:
	.loc	0 71 0 is_stmt 1                ; src/vm.c:71:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	str	x22, [sp, #32]
	str	x23, [sp, #24]
	str	x24, [sp, #16]
Ltmp116:
	.loc	0 72 3 prologue_end             ; src/vm.c:72:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 72 10 is_stmt 0               ; src/vm.c:72:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 72 14                         ; src/vm.c:72:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB25_2
	b	LBB25_1
LBB25_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 72 14                         ; src/vm.c:72:14
	bl	___asan_report_store8
	brk	#0x1
LBB25_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 72 14                         ; src/vm.c:72:14
	adrp	x8, _.str.8@PAGE
	add	x8, x8, _.str.8@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 73 25 is_stmt 1               ; src/vm.c:73:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 73 19 epilogue_begin is_stmt 0 ; src/vm.c:73:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp117:
Lfunc_end25:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function panic
_panic:                                 ; @panic
Lfunc_begin26:
	.loc	0 34 0 is_stmt 1                ; src/vm.c:34:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #144
	.cfi_def_cfa_offset 144
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	stur	x22, [x29, #-32]
	stur	x23, [x29, #-40]
	stur	x24, [x29, #-48]
Ltmp118:
	.loc	0 36 3 prologue_end             ; src/vm.c:36:3
	b	LBB26_1
LBB26_1:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
Ltmp119:
	.loc	0 36 3                          ; src/vm.c:36:3
	; InlineAsm Start
	mov	x10, x30
	; InlineAsm End
	str	x10, [sp, #64]
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB26_3
	b	LBB26_2
LBB26_2:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 36 3                          ; src/vm.c:36:3
	bl	___asan_report_load8
	brk	#0x1
LBB26_3:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	.loc	0 36 3                          ; src/vm.c:36:3
	adrp	x9, ___stderrp@GOTPAGE
	ldr	x9, [x9, ___stderrp@GOTPAGEOFF]
	ldr	x9, [x9]
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x9, [x29, #-32]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #64
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB26_5
	b	LBB26_4
LBB26_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 36 3                          ; src/vm.c:36:3
	bl	___asan_report_load8
	brk	#0x1
LBB26_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 36 3                          ; src/vm.c:36:3
	ldr	x8, [x8, #64]
	mov	x9, sp
	str	x8, [x9]
	adrp	x1, _.str.5@PAGE
	add	x1, x1, _.str.5@PAGEOFF
	bl	_fprintf
	stur	w0, [x29, #-52]
	ldr	x8, [sp, #64]
	; InlineAsm Start
	mov	x30, x8
	; InlineAsm End
	b	LBB26_6
LBB26_6:                                ; %do.cond
	b	LBB26_7
Ltmp120:
LBB26_7:                                ; %do.end
	.loc	0 37 3 is_stmt 1                ; src/vm.c:37:3
	b	LBB26_8
LBB26_8:                                ; %do.body1
Ltmp121:
	.loc	0 37 3 is_stmt 0                ; src/vm.c:37:3
	; InlineAsm Start
	mov	x8, x30
	; InlineAsm End
	str	x8, [sp, #56]
	bl	___asan_handle_no_return
	mov	w0, #255                        ; =0xff
	bl	_exit
Ltmp122:
Lfunc_end26:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
Lfunc_begin27:
	.loc	0 41 0 is_stmt 1                ; src/vm.c:41:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	str	x22, [sp, #32]
	str	x23, [sp, #24]
	str	x24, [sp, #16]
Ltmp123:
	.loc	0 42 3 prologue_end             ; src/vm.c:42:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 42 10 is_stmt 0               ; src/vm.c:42:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 42 14                         ; src/vm.c:42:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB27_2
	b	LBB27_1
LBB27_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 42 14                         ; src/vm.c:42:14
	bl	___asan_report_store8
	brk	#0x1
LBB27_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 42 14                         ; src/vm.c:42:14
	adrp	x8, _.str.9@PAGE
	add	x8, x8, _.str.9@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 43 25 is_stmt 1               ; src/vm.c:43:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 43 19 epilogue_begin is_stmt 0 ; src/vm.c:43:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp124:
Lfunc_end27:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
Lfunc_begin28:
	.loc	0 59 0 is_stmt 1                ; src/vm.c:59:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	str	x22, [sp, #32]
	str	x23, [sp, #24]
	str	x24, [sp, #16]
Ltmp125:
	.loc	0 60 3 prologue_end             ; src/vm.c:60:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 60 10 is_stmt 0               ; src/vm.c:60:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 60 14                         ; src/vm.c:60:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB28_2
	b	LBB28_1
LBB28_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 60 14                         ; src/vm.c:60:14
	bl	___asan_report_store8
	brk	#0x1
LBB28_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 60 14                         ; src/vm.c:60:14
	adrp	x8, _.str.10@PAGE
	add	x8, x8, _.str.10@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 61 25 is_stmt 1               ; src/vm.c:61:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 61 19 epilogue_begin is_stmt 0 ; src/vm.c:61:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp126:
Lfunc_end28:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
Lfunc_begin29:
	.loc	0 47 0 is_stmt 1                ; src/vm.c:47:0
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___asan_shadow_memory_dynamic_address@GOTPAGE
	ldr	x8, [x8, ___asan_shadow_memory_dynamic_address@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x20, [x29, #-8]
	sturh	w0, [x29, #-10]
	sturb	w1, [x29, #-11]
	stur	x21, [x29, #-24]
	str	x22, [sp, #32]
	str	x23, [sp, #24]
	str	x24, [sp, #16]
Ltmp127:
	.loc	0 48 3 prologue_end             ; src/vm.c:48:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 48 10 is_stmt 0               ; src/vm.c:48:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 48 14                         ; src/vm.c:48:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB29_2
	b	LBB29_1
LBB29_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 48 14                         ; src/vm.c:48:14
	bl	___asan_report_store8
	brk	#0x1
LBB29_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 48 14                         ; src/vm.c:48:14
	adrp	x8, _.str.11@PAGE
	add	x8, x8, _.str.11@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 49 25 is_stmt 1               ; src/vm.c:49:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 49 19 epilogue_begin is_stmt 0 ; src/vm.c:49:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp128:
Lfunc_end29:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function asan.module_ctor
_asan.module_ctor:                      ; @asan.module_ctor
Lfunc_begin30:
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ____asan_globals_registered@PAGE
	add	x8, x8, ____asan_globals_registered@PAGEOFF
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	___asan_init
	bl	___asan_version_mismatch_check_apple_clang_1700
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	___asan_register_image_globals
	.cfi_def_cfa wsp, 32
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Lfunc_end30:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function asan.module_dtor
_asan.module_dtor:                      ; @asan.module_dtor
Lfunc_begin31:
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x0, ____asan_globals_registered@PAGE
	add	x0, x0, ____asan_globals_registered@PAGEOFF
	bl	___asan_unregister_image_globals
	.cfi_def_cfa wsp, 16
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
Lfunc_end31:
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__const
	.p2align	5, 0x0                          ; @dispatch
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
	.space	40

	.section	__TEXT,__asan_cstring
	.p2align	5, 0x0                          ; @.str
_.str:
	.asciz	"[%u] 0x%llx\n"
	.space	19

	.p2align	5, 0x0                          ; @.str.2
_.str.2:
	.asciz	"[%u] %llu\n"
	.space	21

	.p2align	5, 0x0                          ; @.str.3
_.str.3:
	.asciz	"0x%llx != 0x%llx\n"
	.space	46

	.p2align	5, 0x0                          ; @.str.4
_.str.4:
	.asciz	"invalid bytecode"
	.space	47

	.p2align	5, 0x0                          ; @.str.5
_.str.5:
	.asciz	"panic: %s\n"
	.space	21

	.p2align	5, 0x0                          ; @.str.6
_.str.6:
	.asciz	"unused extra arguments"
	.space	41

	.p2align	5, 0x0                          ; @.str.7
_.str.7:
	.asciz	"assertion failed"
	.space	47

	.p2align	5, 0x0                          ; @.str.8
_.str.8:
	.asciz	"invalid trap id"
	.space	16

	.p2align	5, 0x0                          ; @.str.9
_.str.9:
	.asciz	"stack overflow"
	.space	17

	.p2align	5, 0x0                          ; @.str.10
_.str.10:
	.asciz	"invalid layout"
	.space	17

	.p2align	5, 0x0                          ; @.str.11
_.str.11:
	.asciz	"unimplemented"
	.space	18

	.section	__TEXT,__const
l____asan_gen_:                         ; @___asan_gen_
	.asciz	"src/vm.c"

	.section	__TEXT,__cstring,cstring_literals
l____asan_gen_.12:                      ; @___asan_gen_.12
	.asciz	"dispatch"

l____asan_gen_.13:                      ; @___asan_gen_.13
	.asciz	".str"

l____asan_gen_.14:                      ; @___asan_gen_.14
	.asciz	".str.2"

l____asan_gen_.15:                      ; @___asan_gen_.15
	.asciz	".str.3"

l____asan_gen_.16:                      ; @___asan_gen_.16
	.asciz	".str.4"

l____asan_gen_.17:                      ; @___asan_gen_.17
	.asciz	".str.5"

l____asan_gen_.18:                      ; @___asan_gen_.18
	.asciz	".str.6"

l____asan_gen_.19:                      ; @___asan_gen_.19
	.asciz	".str.7"

l____asan_gen_.20:                      ; @___asan_gen_.20
	.asciz	".str.8"

l____asan_gen_.21:                      ; @___asan_gen_.21
	.asciz	".str.9"

l____asan_gen_.22:                      ; @___asan_gen_.22
	.asciz	".str.10"

l____asan_gen_.23:                      ; @___asan_gen_.23
	.asciz	".str.11"

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_dispatch
___asan_global_dispatch:
	.quad	_dispatch
	.quad	152                             ; 0x98
	.quad	192                             ; 0xc0
	.quad	l____asan_gen_.12
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_dispatch
___asan_binder_dispatch:
	.quad	_dispatch
	.quad	___asan_global_dispatch

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str
___asan_global_.str:
	.quad	_.str
	.quad	13                              ; 0xd
	.quad	32                              ; 0x20
	.quad	l____asan_gen_.13
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str
___asan_binder_.str:
	.quad	_.str
	.quad	___asan_global_.str

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.2
___asan_global_.str.2:
	.quad	_.str.2
	.quad	11                              ; 0xb
	.quad	32                              ; 0x20
	.quad	l____asan_gen_.14
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.2
___asan_binder_.str.2:
	.quad	_.str.2
	.quad	___asan_global_.str.2

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.3
___asan_global_.str.3:
	.quad	_.str.3
	.quad	18                              ; 0x12
	.quad	64                              ; 0x40
	.quad	l____asan_gen_.15
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.3
___asan_binder_.str.3:
	.quad	_.str.3
	.quad	___asan_global_.str.3

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.4
___asan_global_.str.4:
	.quad	_.str.4
	.quad	17                              ; 0x11
	.quad	64                              ; 0x40
	.quad	l____asan_gen_.16
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.4
___asan_binder_.str.4:
	.quad	_.str.4
	.quad	___asan_global_.str.4

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.5
___asan_global_.str.5:
	.quad	_.str.5
	.quad	11                              ; 0xb
	.quad	32                              ; 0x20
	.quad	l____asan_gen_.17
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.5
___asan_binder_.str.5:
	.quad	_.str.5
	.quad	___asan_global_.str.5

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.6
___asan_global_.str.6:
	.quad	_.str.6
	.quad	23                              ; 0x17
	.quad	64                              ; 0x40
	.quad	l____asan_gen_.18
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.6
___asan_binder_.str.6:
	.quad	_.str.6
	.quad	___asan_global_.str.6

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.7
___asan_global_.str.7:
	.quad	_.str.7
	.quad	17                              ; 0x11
	.quad	64                              ; 0x40
	.quad	l____asan_gen_.19
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.7
___asan_binder_.str.7:
	.quad	_.str.7
	.quad	___asan_global_.str.7

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.8
___asan_global_.str.8:
	.quad	_.str.8
	.quad	16                              ; 0x10
	.quad	32                              ; 0x20
	.quad	l____asan_gen_.20
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.8
___asan_binder_.str.8:
	.quad	_.str.8
	.quad	___asan_global_.str.8

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.9
___asan_global_.str.9:
	.quad	_.str.9
	.quad	15                              ; 0xf
	.quad	32                              ; 0x20
	.quad	l____asan_gen_.21
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.9
___asan_binder_.str.9:
	.quad	_.str.9
	.quad	___asan_global_.str.9

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.10
___asan_global_.str.10:
	.quad	_.str.10
	.quad	15                              ; 0xf
	.quad	32                              ; 0x20
	.quad	l____asan_gen_.22
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.10
___asan_binder_.str.10:
	.quad	_.str.10
	.quad	___asan_global_.str.10

	.section	__DATA,__asan_globals
	.p2align	4, 0x0                          ; @__asan_global_.str.11
___asan_global_.str.11:
	.quad	_.str.11
	.quad	14                              ; 0xe
	.quad	32                              ; 0x20
	.quad	l____asan_gen_.23
	.quad	l____asan_gen_
	.quad	0                               ; 0x0
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff

	.section	__DATA,__asan_liveness,regular,live_support
	.p2align	3, 0x0                          ; @__asan_binder_.str.11
___asan_binder_.str.11:
	.quad	_.str.11
	.quad	___asan_global_.str.11

	.private_extern	____asan_globals_registered ; @___asan_globals_registered
	.comm	____asan_globals_registered,8,3
	.no_dead_strip	_asan.module_ctor
	.no_dead_strip	_asan.module_dtor
	.section	__DATA,__mod_init_func,mod_init_funcs
	.p2align	3, 0x0
	.quad	_asan.module_ctor
	.section	__DATA,__mod_term_func,mod_term_funcs
	.p2align	3, 0x0
	.quad	_asan.module_dtor
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                               ; Abbreviation Code
	.byte	17                              ; DW_TAG_compile_unit
	.byte	1                               ; DW_CHILDREN_yes
	.byte	37                              ; DW_AT_producer
	.byte	37                              ; DW_FORM_strx1
	.byte	19                              ; DW_AT_language
	.byte	5                               ; DW_FORM_data2
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	114                             ; DW_AT_str_offsets_base
	.byte	23                              ; DW_FORM_sec_offset
	.byte	16                              ; DW_AT_stmt_list
	.byte	23                              ; DW_FORM_sec_offset
	.byte	27                              ; DW_AT_comp_dir
	.byte	37                              ; DW_FORM_strx1
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	115                             ; DW_AT_addr_base
	.byte	23                              ; DW_FORM_sec_offset
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	2                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	3                               ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	4                               ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	5                               ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	7                               ; Abbreviation Code
	.byte	22                              ; DW_TAG_typedef
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	8                               ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	54                              ; DW_AT_calling_convention
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	9                               ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	10                              ; Abbreviation Code
	.byte	55                              ; DW_TAG_restrict_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	12                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	13                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	56                              ; DW_AT_data_member_location
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	14                              ; Abbreviation Code
	.byte	4                               ; DW_TAG_enumeration_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	15                              ; Abbreviation Code
	.byte	40                              ; DW_TAG_enumerator
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	28                              ; DW_AT_const_value
	.byte	15                              ; DW_FORM_udata
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	16                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	17                              ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	18                              ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	20                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	21                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	54                              ; DW_AT_calling_convention
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	25                              ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	26                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	27                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	27                              ; DW_FORM_addrx
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	54                              ; DW_AT_calling_convention
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	28                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	37                              ; DW_FORM_strx1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	0                               ; EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset0, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset0
Ldebug_info_start0:
	.short	5                               ; DWARF version number
	.byte	1                               ; DWARF Unit Type
	.byte	8                               ; Address Size (in bytes)
.set Lset1, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset1
	.byte	1                               ; Abbrev [1] 0xc:0x1590 DW_TAG_compile_unit
	.byte	0                               ; DW_AT_producer
	.short	29                              ; DW_AT_language
	.byte	1                               ; DW_AT_name
.set Lset2, Lstr_offsets_base0-Lsection_str_off ; DW_AT_str_offsets_base
	.long	Lset2
.set Lset3, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset3
	.byte	2                               ; DW_AT_comp_dir
	.byte	12                              ; DW_AT_low_pc
.set Lset4, Lfunc_end29-Lfunc_begin0    ; DW_AT_high_pc
	.long	Lset4
.set Lset5, Laddr_table_base0-Lsection_info0 ; DW_AT_addr_base
	.long	Lset5
	.byte	2                               ; Abbrev [2] 0x23:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_name
	.long	47                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.short	347                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	0
	.byte	3                               ; Abbrev [3] 0x2f:0xc DW_TAG_array_type
	.long	59                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x34:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	19                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	5                               ; Abbrev [5] 0x3b:0x5 DW_TAG_const_type
	.long	64                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x40:0x5 DW_TAG_pointer_type
	.long	69                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x45:0x8 DW_TAG_typedef
	.long	77                              ; DW_AT_type
	.byte	50                              ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	149                             ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x4d:0x26 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	9                               ; Abbrev [9] 0x4f:0x5 DW_TAG_formal_parameter
	.long	115                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x54:0x5 DW_TAG_formal_parameter
	.long	145                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x59:0x5 DW_TAG_formal_parameter
	.long	157                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x5e:0x5 DW_TAG_formal_parameter
	.long	169                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x63:0x5 DW_TAG_formal_parameter
	.long	199                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x68:0x5 DW_TAG_formal_parameter
	.long	543                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x6d:0x5 DW_TAG_formal_parameter
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0x73:0x5 DW_TAG_restrict_type
	.long	120                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x78:0x5 DW_TAG_pointer_type
	.long	125                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x7d:0x8 DW_TAG_typedef
	.long	133                             ; DW_AT_type
	.byte	6                               ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	9                               ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0x85:0x8 DW_TAG_typedef
	.long	141                             ; DW_AT_type
	.byte	5                               ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x8d:0x4 DW_TAG_base_type
	.byte	4                               ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	7                               ; Abbrev [7] 0x91:0x8 DW_TAG_typedef
	.long	153                             ; DW_AT_type
	.byte	8                               ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x99:0x4 DW_TAG_base_type
	.byte	7                               ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	2                               ; DW_AT_byte_size
	.byte	7                               ; Abbrev [7] 0x9d:0x8 DW_TAG_typedef
	.long	165                             ; DW_AT_type
	.byte	10                              ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0xa5:0x4 DW_TAG_base_type
	.byte	9                               ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	10                              ; Abbrev [10] 0xa9:0x5 DW_TAG_restrict_type
	.long	174                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xae:0x5 DW_TAG_pointer_type
	.long	179                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0xb3:0x8 DW_TAG_typedef
	.long	187                             ; DW_AT_type
	.byte	13                              ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	8                               ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0xbb:0x8 DW_TAG_typedef
	.long	195                             ; DW_AT_type
	.byte	12                              ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0xc3:0x4 DW_TAG_base_type
	.byte	11                              ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	10                              ; Abbrev [10] 0xc7:0x5 DW_TAG_restrict_type
	.long	204                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xcc:0x5 DW_TAG_pointer_type
	.long	209                             ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0xd1:0x60 DW_TAG_structure_type
	.byte	49                              ; DW_AT_name
	.byte	80                              ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.byte	7                               ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0xd6:0x9 DW_TAG_member
	.byte	14                              ; DW_AT_name
	.long	305                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	8                               ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0xdf:0x9 DW_TAG_member
	.byte	35                              ; DW_AT_name
	.long	480                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	9                               ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0xe8:0x9 DW_TAG_member
	.byte	40                              ; DW_AT_name
	.long	524                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0xf1:0x9 DW_TAG_member
	.byte	41                              ; DW_AT_name
	.long	460                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0xfa:0x9 DW_TAG_member
	.byte	42                              ; DW_AT_name
	.long	460                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	12                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x103:0x9 DW_TAG_member
	.byte	43                              ; DW_AT_name
	.long	174                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	13                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x10c:0x9 DW_TAG_member
	.byte	44                              ; DW_AT_name
	.long	174                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	14                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x115:0x9 DW_TAG_member
	.byte	45                              ; DW_AT_name
	.long	174                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	15                              ; DW_AT_decl_line
	.byte	56                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x11e:0x9 DW_TAG_member
	.byte	46                              ; DW_AT_name
	.long	529                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x127:0x9 DW_TAG_member
	.byte	48                              ; DW_AT_name
	.long	384                             ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	17                              ; DW_AT_decl_line
	.byte	72                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	6                               ; Abbrev [6] 0x131:0x5 DW_TAG_pointer_type
	.long	310                             ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x136:0x45 DW_TAG_structure_type
	.byte	14                              ; DW_AT_name
	.byte	56                              ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x13b:0x9 DW_TAG_member
	.byte	15                              ; DW_AT_name
	.long	379                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x144:0x9 DW_TAG_member
	.byte	16                              ; DW_AT_name
	.long	379                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	12                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x14d:0x9 DW_TAG_member
	.byte	17                              ; DW_AT_name
	.long	379                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	13                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x156:0x9 DW_TAG_member
	.byte	18                              ; DW_AT_name
	.long	379                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	14                              ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x15f:0x9 DW_TAG_member
	.byte	19                              ; DW_AT_name
	.long	379                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	15                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x168:0x9 DW_TAG_member
	.byte	20                              ; DW_AT_name
	.long	379                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x171:0x9 DW_TAG_member
	.byte	21                              ; DW_AT_name
	.long	384                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	17                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	6                               ; Abbrev [6] 0x17b:0x5 DW_TAG_pointer_type
	.long	157                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x180:0x5 DW_TAG_pointer_type
	.long	389                             ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x185:0x2a DW_TAG_structure_type
	.byte	34                              ; DW_AT_name
	.byte	32                              ; DW_AT_byte_size
	.byte	2                               ; DW_AT_decl_file
	.byte	67                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x18a:0x9 DW_TAG_member
	.byte	22                              ; DW_AT_name
	.long	431                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x193:0x9 DW_TAG_member
	.byte	28                              ; DW_AT_name
	.long	460                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	69                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x19c:0x9 DW_TAG_member
	.byte	32                              ; DW_AT_name
	.long	460                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	70                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x1a5:0x9 DW_TAG_member
	.byte	33                              ; DW_AT_name
	.long	460                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x1af:0x8 DW_TAG_typedef
	.long	439                             ; DW_AT_type
	.byte	27                              ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	14                              ; Abbrev [14] 0x1b7:0x15 DW_TAG_enumeration_type
	.long	141                             ; DW_AT_type
	.byte	4                               ; DW_AT_byte_size
	.byte	2                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x1bf:0x3 DW_TAG_enumerator
	.byte	23                              ; DW_AT_name
	.byte	0                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x1c2:0x3 DW_TAG_enumerator
	.byte	24                              ; DW_AT_name
	.byte	1                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x1c5:0x3 DW_TAG_enumerator
	.byte	25                              ; DW_AT_name
	.byte	2                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x1c8:0x3 DW_TAG_enumerator
	.byte	26                              ; DW_AT_name
	.byte	3                               ; DW_AT_const_value
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x1cc:0x8 DW_TAG_typedef
	.long	468                             ; DW_AT_type
	.byte	31                              ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0x1d4:0x8 DW_TAG_typedef
	.long	476                             ; DW_AT_type
	.byte	30                              ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	87                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x1dc:0x4 DW_TAG_base_type
	.byte	29                              ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	6                               ; Abbrev [6] 0x1e0:0x5 DW_TAG_pointer_type
	.long	485                             ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x1e5:0x18 DW_TAG_structure_type
	.byte	39                              ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	10                              ; DW_AT_decl_file
	.byte	12                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x1ea:0x9 DW_TAG_member
	.byte	36                              ; DW_AT_name
	.long	120                             ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	13                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x1f3:0x9 DW_TAG_member
	.byte	37                              ; DW_AT_name
	.long	509                             ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	14                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x1fd:0xb DW_TAG_array_type
	.long	125                             ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x202:0x5 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x208:0x4 DW_TAG_base_type
	.byte	38                              ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	6                               ; Abbrev [6] 0x20c:0x5 DW_TAG_pointer_type
	.long	480                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x211:0x5 DW_TAG_pointer_type
	.long	534                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x216:0x5 DW_TAG_const_type
	.long	539                             ; DW_AT_type
	.byte	11                              ; Abbrev [11] 0x21b:0x4 DW_TAG_base_type
	.byte	47                              ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	10                              ; Abbrev [10] 0x21f:0x5 DW_TAG_restrict_type
	.long	548                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x224:0x5 DW_TAG_pointer_type
	.long	553                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x229:0x1 DW_TAG_const_type
	.byte	6                               ; Abbrev [6] 0x22a:0x5 DW_TAG_pointer_type
	.long	559                             ; DW_AT_type
	.byte	10                              ; Abbrev [10] 0x22f:0x5 DW_TAG_restrict_type
	.long	480                             ; DW_AT_type
	.byte	19                              ; Abbrev [19] 0x234:0xa DW_TAG_variable
	.long	574                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	1
	.byte	3                               ; Abbrev [3] 0x23e:0xc DW_TAG_array_type
	.long	539                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x243:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	13                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x24a:0xa DW_TAG_variable
	.long	596                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	2
	.byte	3                               ; Abbrev [3] 0x254:0xc DW_TAG_array_type
	.long	539                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x259:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	11                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x260:0xa DW_TAG_variable
	.long	618                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	122                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	3
	.byte	3                               ; Abbrev [3] 0x26a:0xc DW_TAG_array_type
	.long	539                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x26f:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	18                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x276:0xa DW_TAG_variable
	.long	640                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	54                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	4
	.byte	3                               ; Abbrev [3] 0x280:0xc DW_TAG_array_type
	.long	539                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x285:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	17                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x28c:0xa DW_TAG_variable
	.long	596                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	5
	.byte	19                              ; Abbrev [19] 0x296:0xa DW_TAG_variable
	.long	672                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	6
	.byte	3                               ; Abbrev [3] 0x2a0:0xc DW_TAG_array_type
	.long	539                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x2a5:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	23                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x2ac:0xa DW_TAG_variable
	.long	640                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	66                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	7
	.byte	19                              ; Abbrev [19] 0x2b6:0xa DW_TAG_variable
	.long	704                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	72                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	8
	.byte	3                               ; Abbrev [3] 0x2c0:0xc DW_TAG_array_type
	.long	539                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x2c5:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	16                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x2cc:0xa DW_TAG_variable
	.long	726                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	9
	.byte	3                               ; Abbrev [3] 0x2d6:0xc DW_TAG_array_type
	.long	539                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x2db:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	15                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x2e2:0xa DW_TAG_variable
	.long	726                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	10
	.byte	19                              ; Abbrev [19] 0x2ec:0xa DW_TAG_variable
	.long	758                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	48                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	11
	.byte	3                               ; Abbrev [3] 0x2f6:0xc DW_TAG_array_type
	.long	539                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x2fb:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	14                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x302:0x42 DW_TAG_enumeration_type
	.long	141                             ; DW_AT_type
	.byte	4                               ; DW_AT_byte_size
	.byte	2                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x30a:0x3 DW_TAG_enumerator
	.byte	51                              ; DW_AT_name
	.byte	0                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x30d:0x3 DW_TAG_enumerator
	.byte	52                              ; DW_AT_name
	.byte	1                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x310:0x3 DW_TAG_enumerator
	.byte	53                              ; DW_AT_name
	.byte	2                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x313:0x3 DW_TAG_enumerator
	.byte	54                              ; DW_AT_name
	.byte	3                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x316:0x3 DW_TAG_enumerator
	.byte	55                              ; DW_AT_name
	.byte	4                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x319:0x3 DW_TAG_enumerator
	.byte	56                              ; DW_AT_name
	.byte	5                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x31c:0x3 DW_TAG_enumerator
	.byte	57                              ; DW_AT_name
	.byte	6                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x31f:0x3 DW_TAG_enumerator
	.byte	58                              ; DW_AT_name
	.byte	7                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x322:0x3 DW_TAG_enumerator
	.byte	59                              ; DW_AT_name
	.byte	8                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x325:0x3 DW_TAG_enumerator
	.byte	60                              ; DW_AT_name
	.byte	9                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x328:0x3 DW_TAG_enumerator
	.byte	61                              ; DW_AT_name
	.byte	10                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x32b:0x3 DW_TAG_enumerator
	.byte	62                              ; DW_AT_name
	.byte	11                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x32e:0x3 DW_TAG_enumerator
	.byte	63                              ; DW_AT_name
	.byte	12                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x331:0x3 DW_TAG_enumerator
	.byte	64                              ; DW_AT_name
	.byte	13                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x334:0x3 DW_TAG_enumerator
	.byte	65                              ; DW_AT_name
	.byte	14                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x337:0x3 DW_TAG_enumerator
	.byte	66                              ; DW_AT_name
	.byte	15                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x33a:0x3 DW_TAG_enumerator
	.byte	67                              ; DW_AT_name
	.byte	16                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x33d:0x3 DW_TAG_enumerator
	.byte	68                              ; DW_AT_name
	.byte	17                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x340:0x3 DW_TAG_enumerator
	.byte	69                              ; DW_AT_name
	.byte	18                              ; DW_AT_const_value
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x344:0x45 DW_TAG_enumeration_type
	.long	141                             ; DW_AT_type
	.byte	4                               ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x34c:0x3 DW_TAG_enumerator
	.byte	70                              ; DW_AT_name
	.byte	0                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x34f:0x3 DW_TAG_enumerator
	.byte	71                              ; DW_AT_name
	.byte	1                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x352:0x3 DW_TAG_enumerator
	.byte	72                              ; DW_AT_name
	.byte	2                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x355:0x3 DW_TAG_enumerator
	.byte	73                              ; DW_AT_name
	.byte	3                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x358:0x3 DW_TAG_enumerator
	.byte	74                              ; DW_AT_name
	.byte	4                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x35b:0x3 DW_TAG_enumerator
	.byte	75                              ; DW_AT_name
	.byte	5                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x35e:0x3 DW_TAG_enumerator
	.byte	76                              ; DW_AT_name
	.byte	6                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x361:0x3 DW_TAG_enumerator
	.byte	77                              ; DW_AT_name
	.byte	7                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x364:0x3 DW_TAG_enumerator
	.byte	78                              ; DW_AT_name
	.byte	8                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x367:0x3 DW_TAG_enumerator
	.byte	79                              ; DW_AT_name
	.byte	9                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x36a:0x3 DW_TAG_enumerator
	.byte	80                              ; DW_AT_name
	.byte	10                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x36d:0x3 DW_TAG_enumerator
	.byte	81                              ; DW_AT_name
	.byte	11                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x370:0x3 DW_TAG_enumerator
	.byte	82                              ; DW_AT_name
	.byte	12                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x373:0x3 DW_TAG_enumerator
	.byte	83                              ; DW_AT_name
	.byte	13                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x376:0x3 DW_TAG_enumerator
	.byte	84                              ; DW_AT_name
	.byte	14                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x379:0x3 DW_TAG_enumerator
	.byte	85                              ; DW_AT_name
	.byte	15                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x37c:0x3 DW_TAG_enumerator
	.byte	86                              ; DW_AT_name
	.byte	16                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x37f:0x3 DW_TAG_enumerator
	.byte	87                              ; DW_AT_name
	.byte	17                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x382:0x3 DW_TAG_enumerator
	.byte	88                              ; DW_AT_name
	.byte	18                              ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x385:0x3 DW_TAG_enumerator
	.byte	89                              ; DW_AT_name
	.byte	19                              ; DW_AT_const_value
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x389:0x24 DW_TAG_enumeration_type
	.long	141                             ; DW_AT_type
	.byte	4                               ; DW_AT_byte_size
	.byte	13                              ; DW_AT_decl_file
	.byte	15                              ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x391:0x3 DW_TAG_enumerator
	.byte	90                              ; DW_AT_name
	.byte	0                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x394:0x3 DW_TAG_enumerator
	.byte	91                              ; DW_AT_name
	.byte	1                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x397:0x3 DW_TAG_enumerator
	.byte	92                              ; DW_AT_name
	.byte	2                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x39a:0x3 DW_TAG_enumerator
	.byte	93                              ; DW_AT_name
	.byte	3                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x39d:0x3 DW_TAG_enumerator
	.byte	94                              ; DW_AT_name
	.byte	4                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x3a0:0x3 DW_TAG_enumerator
	.byte	95                              ; DW_AT_name
	.byte	5                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x3a3:0x3 DW_TAG_enumerator
	.byte	96                              ; DW_AT_name
	.byte	6                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x3a6:0x3 DW_TAG_enumerator
	.byte	97                              ; DW_AT_name
	.byte	7                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x3a9:0x3 DW_TAG_enumerator
	.byte	98                              ; DW_AT_name
	.byte	8                               ; DW_AT_const_value
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x3ad:0x1 DW_TAG_pointer_type
	.byte	6                               ; Abbrev [6] 0x3ae:0x5 DW_TAG_pointer_type
	.long	145                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3b3:0x5 DW_TAG_pointer_type
	.long	59                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x3b8:0x8 DW_TAG_typedef
	.long	960                             ; DW_AT_type
	.byte	100                             ; DW_AT_name
	.byte	14                              ; DW_AT_decl_file
	.byte	30                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x3c0:0x4 DW_TAG_base_type
	.byte	99                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; Abbrev [7] 0x3c4:0x8 DW_TAG_typedef
	.long	972                             ; DW_AT_type
	.byte	102                             ; DW_AT_name
	.byte	15                              ; DW_AT_decl_file
	.byte	30                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x3cc:0x4 DW_TAG_base_type
	.byte	101                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	2                               ; DW_AT_byte_size
	.byte	7                               ; Abbrev [7] 0x3d0:0x8 DW_TAG_typedef
	.long	984                             ; DW_AT_type
	.byte	104                             ; DW_AT_name
	.byte	16                              ; DW_AT_decl_file
	.byte	30                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x3d8:0x4 DW_TAG_base_type
	.byte	103                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	7                               ; Abbrev [7] 0x3dc:0x8 DW_TAG_typedef
	.long	952                             ; DW_AT_type
	.byte	105                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.byte	6                               ; Abbrev [6] 0x3e4:0x5 DW_TAG_pointer_type
	.long	165                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x3e9:0x8 DW_TAG_typedef
	.long	1009                            ; DW_AT_type
	.byte	107                             ; DW_AT_name
	.byte	17                              ; DW_AT_decl_file
	.byte	18                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x3f1:0x4 DW_TAG_base_type
	.byte	106                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	21                              ; Abbrev [21] 0x3f5:0x88 DW_TAG_subprogram
	.byte	12                              ; DW_AT_low_pc
.set Lset6, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset6
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	108                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	5421                            ; DW_AT_type
                                        ; DW_AT_external
	.byte	22                              ; Abbrev [22] 0x404:0xc DW_TAG_formal_parameter
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\340~"
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
	.long	204                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x410:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\330~"
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x41c:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\320~"
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.long	174                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x428:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\310~"
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.long	524                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x434:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\307~"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x440:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\306~"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x44c:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\305~"
	.byte	143                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x458:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\302~"
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	27                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x464:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270~"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	29                              ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x470:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264~"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	29                              ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x47d:0x15f DW_TAG_subprogram
	.byte	13                              ; DW_AT_low_pc
.set Lset7, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset7
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	110                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x489:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x494:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x49f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x4aa:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x4b5:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x4c0:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x4cb:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x4d6:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	148                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	92                              ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x4e1:0x58 DW_TAG_lexical_block
	.byte	14                              ; DW_AT_low_pc
.set Lset8, Ltmp12-Ltmp4                ; DW_AT_high_pc
	.long	Lset8
	.byte	23                              ; Abbrev [23] 0x4e7:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	104                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x4f3:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	158                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	105                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x4ff:0x39 DW_TAG_lexical_block
	.byte	15                              ; DW_AT_low_pc
.set Lset9, Ltmp12-Ltmp5                ; DW_AT_high_pc
	.long	Lset9
	.byte	23                              ; Abbrev [23] 0x505:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	160                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	107                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x511:0x26 DW_TAG_lexical_block
	.byte	16                              ; DW_AT_low_pc
.set Lset10, Ltmp11-Ltmp8               ; DW_AT_high_pc
	.long	Lset10
	.byte	23                              ; Abbrev [23] 0x517:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	159                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	108                             ; DW_AT_decl_line
	.long	984                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x523:0x13 DW_TAG_lexical_block
	.byte	17                              ; DW_AT_low_pc
.set Lset11, Ltmp10-Ltmp9               ; DW_AT_high_pc
	.long	Lset11
	.byte	23                              ; Abbrev [23] 0x529:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	150                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x539:0x45 DW_TAG_lexical_block
	.byte	18                              ; DW_AT_low_pc
.set Lset12, Ltmp20-Ltmp13              ; DW_AT_high_pc
	.long	Lset12
	.byte	23                              ; Abbrev [23] 0x53f:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	117                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x54b:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	158                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	118                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x557:0x26 DW_TAG_lexical_block
	.byte	19                              ; DW_AT_low_pc
.set Lset13, Ltmp19-Ltmp16              ; DW_AT_high_pc
	.long	Lset13
	.byte	23                              ; Abbrev [23] 0x55d:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.byte	159                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	121                             ; DW_AT_decl_line
	.long	984                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x569:0x13 DW_TAG_lexical_block
	.byte	20                              ; DW_AT_low_pc
.set Lset14, Ltmp18-Ltmp17              ; DW_AT_high_pc
	.long	Lset14
	.byte	23                              ; Abbrev [23] 0x56f:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	150                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	122                             ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x57e:0x1f DW_TAG_lexical_block
	.byte	21                              ; DW_AT_low_pc
.set Lset15, Ltmp22-Ltmp21              ; DW_AT_high_pc
	.long	Lset15
	.byte	23                              ; Abbrev [23] 0x584:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\214\177"
	.byte	151                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	129                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x590:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.byte	152                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	130                             ; DW_AT_decl_line
	.long	5445                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x59d:0x13 DW_TAG_lexical_block
	.byte	22                              ; DW_AT_low_pc
.set Lset16, Ltmp24-Ltmp23              ; DW_AT_high_pc
	.long	Lset16
	.byte	23                              ; Abbrev [23] 0x5a3:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\370~"
	.byte	150                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	135                             ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x5b0:0x2b DW_TAG_lexical_block
	.byte	23                              ; DW_AT_low_pc
.set Lset17, Ltmp28-Ltmp27              ; DW_AT_high_pc
	.long	Lset17
	.byte	23                              ; Abbrev [23] 0x5b6:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\360~"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x5c2:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\354~"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x5ce:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\340~"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x5dc:0x83 DW_TAG_subprogram
	.byte	24                              ; DW_AT_low_pc
.set Lset18, Lfunc_end2-Lfunc_begin2    ; DW_AT_high_pc
	.long	Lset18
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	111                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x5e8:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x5f3:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x5fe:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x609:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x614:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x61f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x62a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x635:0x29 DW_TAG_lexical_block
	.byte	25                              ; DW_AT_low_pc
.set Lset19, Ltmp32-Ltmp31              ; DW_AT_high_pc
	.long	Lset19
	.byte	23                              ; Abbrev [23] 0x63b:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x646:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x651:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x65f:0x9b DW_TAG_subprogram
	.byte	26                              ; DW_AT_low_pc
.set Lset20, Lfunc_end3-Lfunc_begin3    ; DW_AT_high_pc
	.long	Lset20
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	112                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	147                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x66b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	147                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x676:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	147                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x681:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	147                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x68c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	147                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x697:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	147                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x6a2:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	147                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x6ad:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	147                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x6b8:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	148                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x6c3:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	163                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	149                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x6ce:0x2b DW_TAG_lexical_block
	.byte	27                              ; DW_AT_low_pc
.set Lset21, Ltmp35-Ltmp34              ; DW_AT_high_pc
	.long	Lset21
	.byte	23                              ; Abbrev [23] 0x6d4:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x6e0:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x6ec:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x6fa:0x5a DW_TAG_subprogram
	.byte	28                              ; DW_AT_low_pc
.set Lset22, Lfunc_end4-Lfunc_begin4    ; DW_AT_high_pc
	.long	Lset22
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.byte	113                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x706:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	40
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x711:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	38
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x71c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	37
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x727:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x732:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x73d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x748:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x754:0x8f DW_TAG_subprogram
	.byte	29                              ; DW_AT_low_pc
.set Lset23, Lfunc_end5-Lfunc_begin5    ; DW_AT_high_pc
	.long	Lset23
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	114                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x760:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x76b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x776:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x781:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x78c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x797:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x7a2:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x7ad:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	159                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x7b8:0x2a DW_TAG_lexical_block
	.byte	30                              ; DW_AT_low_pc
.set Lset24, Ltmp41-Ltmp40              ; DW_AT_high_pc
	.long	Lset24
	.byte	23                              ; Abbrev [23] 0x7be:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x7c9:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x7d5:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x7e3:0x8f DW_TAG_subprogram
	.byte	31                              ; DW_AT_low_pc
.set Lset25, Lfunc_end6-Lfunc_begin6    ; DW_AT_high_pc
	.long	Lset25
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	115                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x7ef:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x7fa:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x805:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x810:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x81b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x826:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x831:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x83c:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	167                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x847:0x2a DW_TAG_lexical_block
	.byte	32                              ; DW_AT_low_pc
.set Lset26, Ltmp44-Ltmp43              ; DW_AT_high_pc
	.long	Lset26
	.byte	23                              ; Abbrev [23] 0x84d:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x858:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x864:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x872:0xb4 DW_TAG_subprogram
	.byte	33                              ; DW_AT_low_pc
.set Lset27, Lfunc_end7-Lfunc_begin7    ; DW_AT_high_pc
	.long	Lset27
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	116                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	174                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x87e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	174                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x889:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	174                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x894:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	174                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x89f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	174                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x8aa:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	174                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x8b5:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	174                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x8c0:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	174                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x8cb:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	175                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x8d6:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	164                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x8e2:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	165                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	179                             ; DW_AT_decl_line
	.long	133                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x8ee:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	166                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.long	133                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x8fa:0x2b DW_TAG_lexical_block
	.byte	34                              ; DW_AT_low_pc
.set Lset28, Ltmp47-Ltmp46              ; DW_AT_high_pc
	.long	Lset28
	.byte	23                              ; Abbrev [23] 0x900:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x90c:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x918:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x926:0xb4 DW_TAG_subprogram
	.byte	35                              ; DW_AT_low_pc
.set Lset29, Lfunc_end8-Lfunc_begin8    ; DW_AT_high_pc
	.long	Lset29
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	117                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x932:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x93d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x948:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x953:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x95e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x969:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x974:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x97f:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	188                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x98a:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	164                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	190                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x996:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	165                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	192                             ; DW_AT_decl_line
	.long	133                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x9a2:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	166                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	193                             ; DW_AT_decl_line
	.long	133                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x9ae:0x2b DW_TAG_lexical_block
	.byte	36                              ; DW_AT_low_pc
.set Lset30, Ltmp50-Ltmp49              ; DW_AT_high_pc
	.long	Lset30
	.byte	23                              ; Abbrev [23] 0x9b4:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	197                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x9c0:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	197                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x9cc:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	197                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x9da:0x9c DW_TAG_subprogram
	.byte	37                              ; DW_AT_low_pc
.set Lset31, Lfunc_end9-Lfunc_begin9    ; DW_AT_high_pc
	.long	Lset31
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	118                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x9e6:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x9f1:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x9fc:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa07:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa12:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa1d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa28:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa33:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	201                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa3e:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	167                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	202                             ; DW_AT_decl_line
	.long	179                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xa4a:0x2b DW_TAG_lexical_block
	.byte	38                              ; DW_AT_low_pc
.set Lset32, Ltmp53-Ltmp52              ; DW_AT_high_pc
	.long	Lset32
	.byte	23                              ; Abbrev [23] 0xa50:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	206                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa5c:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	206                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa68:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	206                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0xa76:0xb4 DW_TAG_subprogram
	.byte	39                              ; DW_AT_low_pc
.set Lset33, Lfunc_end10-Lfunc_begin10  ; DW_AT_high_pc
	.long	Lset33
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	119                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0xa82:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa8d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa98:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xaa3:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xaae:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xab9:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xac4:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xacf:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	168                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	210                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xada:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	169                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	212                             ; DW_AT_decl_line
	.long	5493                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xae6:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	172                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	213                             ; DW_AT_decl_line
	.long	480                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xaf2:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	173                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	215                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xafe:0x2b DW_TAG_lexical_block
	.byte	40                              ; DW_AT_low_pc
.set Lset34, Ltmp60-Ltmp59              ; DW_AT_high_pc
	.long	Lset34
	.byte	23                              ; Abbrev [23] 0xb04:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	229                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb10:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\224\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	229                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb1c:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\210\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	229                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0xb2a:0xb3 DW_TAG_subprogram
	.byte	41                              ; DW_AT_low_pc
.set Lset35, Lfunc_end11-Lfunc_begin11  ; DW_AT_high_pc
	.long	Lset35
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	120                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0xb36:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb41:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb4c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb57:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb62:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb6d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb78:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb83:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	233                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb8e:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	174                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	234                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb99:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	172                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	236                             ; DW_AT_decl_line
	.long	480                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xba5:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	173                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	238                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xbb1:0x2b DW_TAG_lexical_block
	.byte	42                              ; DW_AT_low_pc
.set Lset36, Ltmp67-Ltmp66              ; DW_AT_high_pc
	.long	Lset36
	.byte	23                              ; Abbrev [23] 0xbb7:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	249                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xbc3:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	249                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xbcf:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	249                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0xbdd:0x92 DW_TAG_subprogram
	.byte	43                              ; DW_AT_low_pc
.set Lset37, Lfunc_end12-Lfunc_begin12  ; DW_AT_high_pc
	.long	Lset37
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	121                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	252                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0xbe9:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	252                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xbf4:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	252                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xbff:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	252                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc0a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	252                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc15:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	252                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc20:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	252                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc2b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	252                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xc36:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	175                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	253                             ; DW_AT_decl_line
	.long	988                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xc41:0x2d DW_TAG_lexical_block
	.byte	44                              ; DW_AT_low_pc
.set Lset38, Ltmp70-Ltmp69              ; DW_AT_high_pc
	.long	Lset38
	.byte	26                              ; Abbrev [26] 0xc47:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	257                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xc53:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	257                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xc60:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	257                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xc6f:0xa8 DW_TAG_subprogram
	.byte	45                              ; DW_AT_low_pc
.set Lset39, Lfunc_end13-Lfunc_begin13  ; DW_AT_high_pc
	.long	Lset39
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	122                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xc7c:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xc88:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xc94:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xca0:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xcac:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xcb8:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xcc4:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xcd0:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	163                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	261                             ; DW_AT_decl_line
	.long	179                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xcdc:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	175                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	262                             ; DW_AT_decl_line
	.long	988                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xce8:0x2e DW_TAG_lexical_block
	.byte	46                              ; DW_AT_low_pc
.set Lset40, Ltmp73-Ltmp72              ; DW_AT_high_pc
	.long	Lset40
	.byte	26                              ; Abbrev [26] 0xcee:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	266                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xcfb:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	266                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd08:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	266                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xd17:0xb4 DW_TAG_subprogram
	.byte	47                              ; DW_AT_low_pc
.set Lset41, Lfunc_end14-Lfunc_begin14  ; DW_AT_high_pc
	.long	Lset41
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	123                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xd24:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd30:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd3c:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd48:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd54:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd60:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd6c:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd78:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.byte	176                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd84:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	177                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	271                             ; DW_AT_decl_line
	.long	976                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd90:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	35                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	273                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xd9c:0x2e DW_TAG_lexical_block
	.byte	48                              ; DW_AT_low_pc
.set Lset42, Ltmp76-Ltmp75              ; DW_AT_high_pc
	.long	Lset42
	.byte	26                              ; Abbrev [26] 0xda2:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	276                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xdaf:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	276                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xdbc:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	276                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xdcb:0xb6 DW_TAG_subprogram
	.byte	49                              ; DW_AT_low_pc
.set Lset43, Lfunc_end15-Lfunc_begin15  ; DW_AT_high_pc
	.long	Lset43
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	124                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xdd8:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xde4:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xdf0:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xdfc:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xe08:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xe14:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xe20:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe2c:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	178                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	282                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe38:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	179                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	284                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe45:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	180                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	284                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xe52:0x2e DW_TAG_lexical_block
	.byte	50                              ; DW_AT_low_pc
.set Lset44, Ltmp79-Ltmp78              ; DW_AT_high_pc
	.long	Lset44
	.byte	26                              ; Abbrev [26] 0xe58:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe65:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe72:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xe81:0xc3 DW_TAG_subprogram
	.byte	51                              ; DW_AT_low_pc
.set Lset45, Lfunc_end16-Lfunc_begin16  ; DW_AT_high_pc
	.long	Lset45
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	125                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xe8e:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xe9a:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xea6:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xeb2:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xebe:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xeca:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xed6:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xee2:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	181                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	293                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xeee:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	178                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xefb:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	179                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	299                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf08:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	180                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	299                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xf15:0x2e DW_TAG_lexical_block
	.byte	52                              ; DW_AT_low_pc
.set Lset46, Ltmp82-Ltmp81              ; DW_AT_high_pc
	.long	Lset46
	.byte	26                              ; Abbrev [26] 0xf1b:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	304                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf28:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	304                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf35:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	304                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xf44:0xf0 DW_TAG_subprogram
	.byte	53                              ; DW_AT_low_pc
.set Lset47, Lfunc_end17-Lfunc_begin17  ; DW_AT_high_pc
	.long	Lset47
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	126                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	307                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xf51:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	307                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xf5d:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	307                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xf69:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	307                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xf75:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	307                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xf81:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	307                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xf8d:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	307                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xf99:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	307                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xfa5:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	181                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	308                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xfb1:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	182                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	309                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xfbd:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	178                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	311                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xfca:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	183                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	313                             ; DW_AT_decl_line
	.long	174                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xfd7:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	179                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	318                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xfe4:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.byte	180                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	318                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xff1:0x14 DW_TAG_lexical_block
	.byte	54                              ; DW_AT_low_pc
.set Lset48, Ltmp88-Ltmp84              ; DW_AT_high_pc
	.long	Lset48
	.byte	26                              ; Abbrev [26] 0xff7:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	160                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	315                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x1005:0x2e DW_TAG_lexical_block
	.byte	55                              ; DW_AT_low_pc
.set Lset49, Ltmp90-Ltmp89              ; DW_AT_high_pc
	.long	Lset49
	.byte	26                              ; Abbrev [26] 0x100b:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	323                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x1018:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\214\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	323                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x1025:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	323                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x1034:0xe3 DW_TAG_subprogram
	.byte	56                              ; DW_AT_low_pc
.set Lset50, Lfunc_end18-Lfunc_begin18  ; DW_AT_high_pc
	.long	Lset50
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	127                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	326                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0x1041:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	326                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x104d:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	326                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x1059:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	326                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x1065:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	326                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x1071:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	326                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x107d:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	326                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x1089:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	326                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x1095:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	327                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x10a1:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	184                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	328                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x10ad:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	164                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	334                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x10ba:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	185                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	335                             ; DW_AT_decl_line
	.long	5437                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x10c7:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	152                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	337                             ; DW_AT_decl_line
	.long	5445                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x10d4:0x14 DW_TAG_lexical_block
	.byte	57                              ; DW_AT_low_pc
.set Lset51, Ltmp97-Ltmp96              ; DW_AT_high_pc
	.long	Lset51
	.byte	26                              ; Abbrev [26] 0x10da:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	150                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	338                             ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x10e8:0x2e DW_TAG_lexical_block
	.byte	58                              ; DW_AT_low_pc
.set Lset52, Ltmp99-Ltmp98              ; DW_AT_high_pc
	.long	Lset52
	.byte	26                              ; Abbrev [26] 0x10ee:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	145                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	342                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x10fb:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\214\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	342                             ; DW_AT_decl_line
	.long	5429                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x1108:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	342                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x1117:0x62 DW_TAG_subprogram
	.byte	59                              ; DW_AT_low_pc
.set Lset53, Lfunc_end19-Lfunc_begin19  ; DW_AT_high_pc
	.long	Lset53
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.byte	128                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	345                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0x1124:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	40
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	345                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x1130:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	38
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	345                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x113c:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	37
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	345                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x1148:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	345                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x1154:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	345                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x1160:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	345                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0x116c:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	345                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x1179:0x5a DW_TAG_subprogram
	.byte	60                              ; DW_AT_low_pc
.set Lset54, Lfunc_end20-Lfunc_begin20  ; DW_AT_high_pc
	.long	Lset54
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	129                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1185:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1190:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x119b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11a6:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11b1:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11bc:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11c7:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x11d3:0x5a DW_TAG_subprogram
	.byte	61                              ; DW_AT_low_pc
.set Lset55, Lfunc_end21-Lfunc_begin21  ; DW_AT_high_pc
	.long	Lset55
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.byte	130                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x11df:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	40
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11ea:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	38
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11f5:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	37
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1200:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x120b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1216:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1221:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x122d:0x5a DW_TAG_subprogram
	.byte	62                              ; DW_AT_low_pc
.set Lset56, Lfunc_end22-Lfunc_begin22  ; DW_AT_high_pc
	.long	Lset56
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.byte	131                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1239:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	40
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1244:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	38
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x124f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	37
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x125a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1265:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1270:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x127b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x1287:0x5a DW_TAG_subprogram
	.byte	63                              ; DW_AT_low_pc
.set Lset57, Lfunc_end23-Lfunc_begin23  ; DW_AT_high_pc
	.long	Lset57
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	132                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1293:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x129e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12a9:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12b4:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12bf:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12ca:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12d5:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x12e1:0x5a DW_TAG_subprogram
	.byte	64                              ; DW_AT_low_pc
.set Lset58, Lfunc_end24-Lfunc_begin24  ; DW_AT_high_pc
	.long	Lset58
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	133                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x12ed:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12f8:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1303:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x130e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1319:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1324:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x132f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x133b:0x5a DW_TAG_subprogram
	.byte	65                              ; DW_AT_low_pc
.set Lset59, Lfunc_end25-Lfunc_begin25  ; DW_AT_high_pc
	.long	Lset59
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	134                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1347:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1352:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x135d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1368:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1373:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x137e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1389:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	71                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x1395:0x8a DW_TAG_subprogram
	.byte	66                              ; DW_AT_low_pc
.set Lset60, Lfunc_end26-Lfunc_begin26  ; DW_AT_high_pc
	.long	Lset60
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x13a1:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x13ac:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x13b7:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x13c2:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x13cd:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x13d8:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x13e3:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x13ee:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.byte	159                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	35                              ; DW_AT_decl_line
	.long	984                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x13f9:0x13 DW_TAG_lexical_block
	.byte	67                              ; DW_AT_low_pc
.set Lset61, Ltmp120-Ltmp119            ; DW_AT_high_pc
	.long	Lset61
	.byte	23                              ; Abbrev [23] 0x13ff:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	143
	.asciz	"\300"
	.byte	150                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x140c:0x12 DW_TAG_lexical_block
	.byte	68                              ; DW_AT_low_pc
.set Lset62, Ltmp122-Ltmp121            ; DW_AT_high_pc
	.long	Lset62
	.byte	23                              ; Abbrev [23] 0x1412:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	56
	.byte	150                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	37                              ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x141f:0x5a DW_TAG_subprogram
	.byte	69                              ; DW_AT_low_pc
.set Lset63, Lfunc_end27-Lfunc_begin27  ; DW_AT_high_pc
	.long	Lset63
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x142b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1436:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1441:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x144c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1457:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1462:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x146d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	41                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x1479:0x5a DW_TAG_subprogram
	.byte	70                              ; DW_AT_low_pc
.set Lset64, Lfunc_end28-Lfunc_begin28  ; DW_AT_high_pc
	.long	Lset64
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1485:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1490:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x149b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x14a6:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x14b1:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x14bc:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x14c7:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x14d3:0x5a DW_TAG_subprogram
	.byte	71                              ; DW_AT_low_pc
.set Lset65, Lfunc_end29-Lfunc_begin29  ; DW_AT_high_pc
	.long	Lset65
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	138                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x14df:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x14ea:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x14f5:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1500:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x150b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1516:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1521:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x152d:0x8 DW_TAG_typedef
	.long	770                             ; DW_AT_type
	.byte	109                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	49                              ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0x1535:0x8 DW_TAG_typedef
	.long	836                             ; DW_AT_type
	.byte	147                             ; DW_AT_name
	.byte	12                              ; DW_AT_decl_file
	.byte	33                              ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0x153d:0x8 DW_TAG_typedef
	.long	133                             ; DW_AT_type
	.byte	149                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.byte	6                               ; Abbrev [6] 0x1545:0x5 DW_TAG_pointer_type
	.long	5450                            ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x154a:0x18 DW_TAG_structure_type
	.byte	156                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	10                              ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x154f:0x9 DW_TAG_member
	.byte	153                             ; DW_AT_name
	.long	5474                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x1558:0x9 DW_TAG_member
	.byte	155                             ; DW_AT_name
	.long	5482                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x1562:0x8 DW_TAG_typedef
	.long	187                             ; DW_AT_type
	.byte	154                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	13                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x156a:0xb DW_TAG_array_type
	.long	179                             ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x156f:0x5 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	6                               ; Abbrev [6] 0x1575:0x5 DW_TAG_pointer_type
	.long	5498                            ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x157a:0x21 DW_TAG_structure_type
	.byte	171                             ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	10                              ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x157f:0x9 DW_TAG_member
	.byte	153                             ; DW_AT_name
	.long	5474                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	25                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x1588:0x9 DW_TAG_member
	.byte	170                             ; DW_AT_name
	.long	179                             ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x1591:0x9 DW_TAG_member
	.byte	21                              ; DW_AT_name
	.long	179                             ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	27                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str_offs,regular,debug
Lsection_str_off:
	.long	748                             ; Length of String Offsets Set
	.short	5
	.short	0
Lstr_offsets_base0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 17.0.0 (clang-1700.6.4.2)" ; string offset=0
	.asciz	"src/vm.c"                      ; string offset=46
	.asciz	"/Users/waterlens/Projects/quickaml" ; string offset=55
	.asciz	"dispatch"                      ; string offset=90
	.asciz	"opthread"                      ; string offset=99
	.asciz	"bc_t"                          ; string offset=108
	.asciz	"uint32_t"                      ; string offset=113
	.asciz	"unsigned int"                  ; string offset=122
	.asciz	"uint16_t"                      ; string offset=135
	.asciz	"unsigned short"                ; string offset=144
	.asciz	"uint8_t"                       ; string offset=159
	.asciz	"unsigned char"                 ; string offset=167
	.asciz	"val_t"                         ; string offset=181
	.asciz	"uint64_t"                      ; string offset=187
	.asciz	"unsigned long long"            ; string offset=196
	.asciz	"state"                         ; string offset=215
	.asciz	"heap"                          ; string offset=221
	.asciz	"bump"                          ; string offset=226
	.asciz	"from_base"                     ; string offset=231
	.asciz	"from_limit"                    ; string offset=241
	.asciz	"to_base"                       ; string offset=252
	.asciz	"to_limit"                      ; string offset=260
	.asciz	"scan"                          ; string offset=269
	.asciz	"args"                          ; string offset=274
	.asciz	"runtime_args"                  ; string offset=279
	.asciz	"trace_level"                   ; string offset=292
	.asciz	"trace_level_t"                 ; string offset=304
	.asciz	"TRACE_0"                       ; string offset=318
	.asciz	"TRACE_1"                       ; string offset=326
	.asciz	"TRACE_2"                       ; string offset=334
	.asciz	"TRACE_ALL"                     ; string offset=342
	.asciz	"base_size"                     ; string offset=352
	.asciz	"size_t"                        ; string offset=362
	.asciz	"__darwin_size_t"               ; string offset=369
	.asciz	"unsigned long"                 ; string offset=385
	.asciz	"align"                         ; string offset=399
	.asciz	"descspace_size"                ; string offset=405
	.asciz	"entry"                         ; string offset=420
	.asciz	"function"                      ; string offset=426
	.asciz	"oplimit"                       ; string offset=435
	.asciz	"ops"                           ; string offset=443
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=447
	.asciz	"fns"                           ; string offset=467
	.asciz	"numfn"                         ; string offset=471
	.asciz	"numobject"                     ; string offset=477
	.asciz	"ctbl"                          ; string offset=487
	.asciz	"stk"                           ; string offset=492
	.asciz	"stklimit"                      ; string offset=496
	.asciz	"msg"                           ; string offset=505
	.asciz	"char"                          ; string offset=509
	.asciz	"rtargs"                        ; string offset=514
	.asciz	"S_OK"                          ; string offset=521
	.asciz	"S_EOF"                         ; string offset=526
	.asciz	"S_LIMIT"                       ; string offset=532
	.asciz	"S_READ_ERR"                    ; string offset=540
	.asciz	"S_UNPAIRED"                    ; string offset=551
	.asciz	"S_INVALID_FNID"                ; string offset=562
	.asciz	"S_INVALID_NUMFN"               ; string offset=577
	.asciz	"S_INVALID_NUMBC"               ; string offset=593
	.asciz	"S_INVALID_NUMOBJECT"           ; string offset=609
	.asciz	"S_INVALID_LAYOUT_KIND"         ; string offset=629
	.asciz	"S_INVALID_LAYOUT_SIZE"         ; string offset=651
	.asciz	"S_NOT_AN_OPERAND"              ; string offset=673
	.asciz	"S_NOT_A_INT"                   ; string offset=690
	.asciz	"S_BAD_OP"                      ; string offset=702
	.asciz	"S_INSUFFICIENT_ARGS"           ; string offset=711
	.asciz	"S_DESCSPACE_INIT_FAILED"       ; string offset=731
	.asciz	"S_HEAP_INIT_FAILED"            ; string offset=755
	.asciz	"S_STATE_INIT_FAILED"           ; string offset=774
	.asciz	"S_INVALID_OBJ_DESC"            ; string offset=794
	.asciz	"TRAP"                          ; string offset=813
	.asciz	"NOP"                           ; string offset=818
	.asciz	"MOV"                           ; string offset=822
	.asciz	"EXTA"                          ; string offset=826
	.asciz	"LSI16"                         ; string offset=831
	.asciz	"LZI16"                         ; string offset=837
	.asciz	"LSI32"                         ; string offset=843
	.asciz	"LZI32"                         ; string offset=849
	.asciz	"LC"                            ; string offset=855
	.asciz	"APP"                           ; string offset=858
	.asciz	"CALL"                          ; string offset=862
	.asciz	"JMP"                           ; string offset=867
	.asciz	"JR"                            ; string offset=871
	.asciz	"DISP"                          ; string offset=874
	.asciz	"RETU"                          ; string offset=879
	.asciz	"RET"                           ; string offset=884
	.asciz	"RETN"                          ; string offset=888
	.asciz	"MOBJ"                          ; string offset=893
	.asciz	"MCLOS"                         ; string offset=898
	.asciz	"LIMIT"                         ; string offset=904
	.asciz	"T_UNDEFINED"                   ; string offset=910
	.asciz	"T_DIVERGE"                     ; string offset=922
	.asciz	"T_HALT"                        ; string offset=932
	.asciz	"T_UNUSEDEXTA"                  ; string offset=939
	.asciz	"T_PRINTREGS"                   ; string offset=952
	.asciz	"T_PRINTREGSX"                  ; string offset=964
	.asciz	"T_ASSERT_EQ"                   ; string offset=977
	.asciz	"T_PRINTOBJ"                    ; string offset=989
	.asciz	"T_HEAPSTAT"                    ; string offset=1000
	.asciz	"int64_t"                       ; string offset=1011
	.asciz	"long long"                     ; string offset=1019
	.asciz	"int16_t"                       ; string offset=1029
	.asciz	"short"                         ; string offset=1037
	.asciz	"int32_t"                       ; string offset=1043
	.asciz	"int"                           ; string offset=1051
	.asciz	"joff_t"                        ; string offset=1055
	.asciz	"ptrdiff_t"                     ; string offset=1062
	.asciz	"long"                          ; string offset=1072
	.asciz	"vm_entry"                      ; string offset=1077
	.asciz	"vm_op_TRAP"                    ; string offset=1086
	.asciz	"vm_op_NOP"                     ; string offset=1097
	.asciz	"vm_op_MOV"                     ; string offset=1107
	.asciz	"vm_op_EXTA"                    ; string offset=1117
	.asciz	"vm_op_LSI16"                   ; string offset=1128
	.asciz	"vm_op_LZI16"                   ; string offset=1140
	.asciz	"vm_op_LSI32"                   ; string offset=1152
	.asciz	"vm_op_LZI32"                   ; string offset=1164
	.asciz	"vm_op_LC"                      ; string offset=1176
	.asciz	"vm_op_APP"                     ; string offset=1185
	.asciz	"vm_op_CALL"                    ; string offset=1195
	.asciz	"vm_op_JMP"                     ; string offset=1206
	.asciz	"vm_op_JR"                      ; string offset=1216
	.asciz	"vm_op_DISP"                    ; string offset=1225
	.asciz	"vm_op_RETU"                    ; string offset=1236
	.asciz	"vm_op_RET"                     ; string offset=1247
	.asciz	"vm_op_RETN"                    ; string offset=1257
	.asciz	"vm_op_MOBJ"                    ; string offset=1268
	.asciz	"vm_op_MCLOS"                   ; string offset=1279
	.asciz	"undefined"                     ; string offset=1291
	.asciz	"diverge"                       ; string offset=1301
	.asciz	"halt"                          ; string offset=1309
	.asciz	"unusedexta"                    ; string offset=1314
	.asciz	"assertionfailed"               ; string offset=1325
	.asciz	"invalidtrap"                   ; string offset=1341
	.asciz	"panic"                         ; string offset=1353
	.asciz	"stackoverflow"                 ; string offset=1359
	.asciz	"invalidlayout"                 ; string offset=1373
	.asciz	"unimplemented"                 ; string offset=1387
	.asciz	"status_t"                      ; string offset=1401
	.asciz	"ip"                            ; string offset=1410
	.asciz	"bp"                            ; string offset=1413
	.asciz	"a3a"                           ; string offset=1416
	.asciz	"a3b"                           ; string offset=1420
	.asciz	"a3c"                           ; string offset=1424
	.asciz	"a2b"                           ; string offset=1428
	.asciz	"insnp"                         ; string offset=1432
	.asciz	"op"                            ; string offset=1438
	.asciz	"op_t"                          ; string offset=1441
	.asciz	"tid"                           ; string offset=1446
	.asciz	"ssz_t"                         ; string offset=1450
	.asciz	"lr"                            ; string offset=1456
	.asciz	"o"                             ; string offset=1459
	.asciz	"obj"                           ; string offset=1461
	.asciz	"object"                        ; string offset=1465
	.asciz	"hd"                            ; string offset=1472
	.asciz	"metainfo"                      ; string offset=1475
	.asciz	"fields"                        ; string offset=1484
	.asciz	"i1"                            ; string offset=1491
	.asciz	"i2"                            ; string offset=1494
	.asciz	"r"                             ; string offset=1497
	.asciz	"i"                             ; string offset=1499
	.asciz	"next"                          ; string offset=1501
	.asciz	"dst"                           ; string offset=1506
	.asciz	"src"                           ; string offset=1510
	.asciz	"exta"                          ; string offset=1514
	.asciz	"low24"                         ; string offset=1519
	.asciz	"high8"                         ; string offset=1525
	.asciz	"imm"                           ; string offset=1531
	.asciz	"iclos"                         ; string offset=1535
	.asciz	"clos"                          ; string offset=1541
	.asciz	"closure"                       ; string offset=1546
	.asciz	"fp"                            ; string offset=1554
	.asciz	"fn"                            ; string offset=1557
	.asciz	"oldip"                         ; string offset=1560
	.asciz	"fx"                            ; string offset=1566
	.asciz	"target"                        ; string offset=1569
	.asciz	"dispatched"                    ; string offset=1576
	.asciz	"base"                          ; string offset=1587
	.asciz	"ra"                            ; string offset=1592
	.asciz	"prev_insnp"                    ; string offset=1595
	.asciz	"fo"                            ; string offset=1606
	.asciz	"rv"                            ; string offset=1609
	.asciz	"nargs"                         ; string offset=1612
	.asciz	"rvs"                           ; string offset=1618
	.asciz	"layout"                        ; string offset=1622
	.asciz	"size"                          ; string offset=1629
	.section	__DWARF,__debug_str_offs,regular,debug
	.long	0
	.long	46
	.long	55
	.long	90
	.long	122
	.long	113
	.long	108
	.long	144
	.long	135
	.long	167
	.long	159
	.long	196
	.long	187
	.long	181
	.long	221
	.long	226
	.long	231
	.long	241
	.long	252
	.long	260
	.long	269
	.long	274
	.long	292
	.long	318
	.long	326
	.long	334
	.long	342
	.long	304
	.long	352
	.long	385
	.long	369
	.long	362
	.long	399
	.long	405
	.long	279
	.long	420
	.long	435
	.long	443
	.long	447
	.long	426
	.long	467
	.long	471
	.long	477
	.long	487
	.long	492
	.long	496
	.long	505
	.long	509
	.long	514
	.long	215
	.long	99
	.long	521
	.long	526
	.long	532
	.long	540
	.long	551
	.long	562
	.long	577
	.long	593
	.long	609
	.long	629
	.long	651
	.long	673
	.long	690
	.long	702
	.long	711
	.long	731
	.long	755
	.long	774
	.long	794
	.long	813
	.long	818
	.long	822
	.long	826
	.long	831
	.long	837
	.long	843
	.long	849
	.long	855
	.long	858
	.long	862
	.long	867
	.long	871
	.long	874
	.long	879
	.long	884
	.long	888
	.long	893
	.long	898
	.long	904
	.long	910
	.long	922
	.long	932
	.long	939
	.long	952
	.long	964
	.long	977
	.long	989
	.long	1000
	.long	1019
	.long	1011
	.long	1037
	.long	1029
	.long	1051
	.long	1043
	.long	1055
	.long	1072
	.long	1062
	.long	1077
	.long	1401
	.long	1086
	.long	1097
	.long	1107
	.long	1117
	.long	1128
	.long	1140
	.long	1152
	.long	1164
	.long	1176
	.long	1185
	.long	1195
	.long	1206
	.long	1216
	.long	1225
	.long	1236
	.long	1247
	.long	1257
	.long	1268
	.long	1279
	.long	1291
	.long	1301
	.long	1309
	.long	1314
	.long	1325
	.long	1341
	.long	1353
	.long	1359
	.long	1373
	.long	1387
	.long	1410
	.long	1413
	.long	1416
	.long	1420
	.long	1424
	.long	1428
	.long	1432
	.long	1438
	.long	1441
	.long	1446
	.long	1450
	.long	1456
	.long	1459
	.long	1461
	.long	1472
	.long	1475
	.long	1484
	.long	1465
	.long	1491
	.long	1494
	.long	1497
	.long	1499
	.long	1501
	.long	1506
	.long	1510
	.long	1514
	.long	1519
	.long	1525
	.long	1531
	.long	1535
	.long	1541
	.long	1554
	.long	1546
	.long	1557
	.long	1560
	.long	1566
	.long	1569
	.long	1576
	.long	1587
	.long	1592
	.long	1595
	.long	1606
	.long	1609
	.long	1612
	.long	1618
	.long	1622
	.long	1629
	.section	__DWARF,__debug_addr,regular,debug
Lsection_info0:
.set Lset66, Ldebug_addr_end0-Ldebug_addr_start0 ; Length of contribution
	.long	Lset66
Ldebug_addr_start0:
	.short	5                               ; DWARF version number
	.byte	8                               ; Address size
	.byte	0                               ; Segment selector size
Laddr_table_base0:
	.quad	_dispatch
	.quad	_.str
	.quad	_.str.2
	.quad	_.str.3
	.quad	_.str.4
	.quad	_.str.5
	.quad	_.str.6
	.quad	_.str.7
	.quad	_.str.8
	.quad	_.str.9
	.quad	_.str.10
	.quad	_.str.11
	.quad	Lfunc_begin0
	.quad	Lfunc_begin1
	.quad	Ltmp4
	.quad	Ltmp5
	.quad	Ltmp8
	.quad	Ltmp9
	.quad	Ltmp13
	.quad	Ltmp16
	.quad	Ltmp17
	.quad	Ltmp21
	.quad	Ltmp23
	.quad	Ltmp27
	.quad	Lfunc_begin2
	.quad	Ltmp31
	.quad	Lfunc_begin3
	.quad	Ltmp34
	.quad	Lfunc_begin4
	.quad	Lfunc_begin5
	.quad	Ltmp40
	.quad	Lfunc_begin6
	.quad	Ltmp43
	.quad	Lfunc_begin7
	.quad	Ltmp46
	.quad	Lfunc_begin8
	.quad	Ltmp49
	.quad	Lfunc_begin9
	.quad	Ltmp52
	.quad	Lfunc_begin10
	.quad	Ltmp59
	.quad	Lfunc_begin11
	.quad	Ltmp66
	.quad	Lfunc_begin12
	.quad	Ltmp69
	.quad	Lfunc_begin13
	.quad	Ltmp72
	.quad	Lfunc_begin14
	.quad	Ltmp75
	.quad	Lfunc_begin15
	.quad	Ltmp78
	.quad	Lfunc_begin16
	.quad	Ltmp81
	.quad	Lfunc_begin17
	.quad	Ltmp84
	.quad	Ltmp89
	.quad	Lfunc_begin18
	.quad	Ltmp96
	.quad	Ltmp98
	.quad	Lfunc_begin19
	.quad	Lfunc_begin20
	.quad	Lfunc_begin21
	.quad	Lfunc_begin22
	.quad	Lfunc_begin23
	.quad	Lfunc_begin24
	.quad	Lfunc_begin25
	.quad	Lfunc_begin26
	.quad	Ltmp119
	.quad	Ltmp121
	.quad	Lfunc_begin27
	.quad	Lfunc_begin28
	.quad	Lfunc_begin29
Ldebug_addr_end0:
	.section	__DWARF,__debug_names,regular,debug
Ldebug_names_begin:
.set Lset67, Lnames_end0-Lnames_start0  ; Header: unit length
	.long	Lset67
Lnames_start0:
	.short	5                               ; Header: version
	.short	0                               ; Header: padding
	.long	1                               ; Header: compilation unit count
	.long	0                               ; Header: local type unit count
	.long	0                               ; Header: foreign type unit count
	.long	33                              ; Header: bucket count
	.long	67                              ; Header: name count
.set Lset68, Lnames_abbrev_end0-Lnames_abbrev_start0 ; Header: abbreviation table size
	.long	Lset68
	.long	8                               ; Header: augmentation string size
	.ascii	"LLVM0700"                      ; Header: augmentation string
.set Lset69, Lcu_begin0-Lsection_info   ; Compilation unit 0
	.long	Lset69
	.long	1                               ; Bucket 0
	.long	3                               ; Bucket 1
	.long	5                               ; Bucket 2
	.long	7                               ; Bucket 3
	.long	8                               ; Bucket 4
	.long	0                               ; Bucket 5
	.long	11                              ; Bucket 6
	.long	13                              ; Bucket 7
	.long	14                              ; Bucket 8
	.long	15                              ; Bucket 9
	.long	23                              ; Bucket 10
	.long	25                              ; Bucket 11
	.long	27                              ; Bucket 12
	.long	28                              ; Bucket 13
	.long	34                              ; Bucket 14
	.long	36                              ; Bucket 15
	.long	40                              ; Bucket 16
	.long	43                              ; Bucket 17
	.long	0                               ; Bucket 18
	.long	48                              ; Bucket 19
	.long	51                              ; Bucket 20
	.long	54                              ; Bucket 21
	.long	55                              ; Bucket 22
	.long	0                               ; Bucket 23
	.long	0                               ; Bucket 24
	.long	56                              ; Bucket 25
	.long	57                              ; Bucket 26
	.long	0                               ; Bucket 27
	.long	62                              ; Bucket 28
	.long	63                              ; Bucket 29
	.long	64                              ; Bucket 30
	.long	65                              ; Bucket 31
	.long	0                               ; Bucket 32
	.long	2090479413                      ; Hash in Bucket 0
	.long	-995619871                      ; Hash in Bucket 0
	.long	789719536                       ; Hash in Bucket 1
	.long	857652610                       ; Hash in Bucket 1
	.long	270584624                       ; Hash in Bucket 2
	.long	-995076194                      ; Hash in Bucket 2
	.long	1029845589                      ; Hash in Bucket 3
	.long	274811398                       ; Hash in Bucket 4
	.long	-995574987                      ; Hash in Bucket 4
	.long	-994990788                      ; Hash in Bucket 4
	.long	318612267                       ; Hash in Bucket 6
	.long	-1654759093                     ; Hash in Bucket 6
	.long	-1206934473                     ; Hash in Bucket 7
	.long	-1304652851                     ; Hash in Bucket 8
	.long	120857757                       ; Hash in Bucket 9
	.long	301260540                       ; Hash in Bucket 9
	.long	466678419                       ; Hash in Bucket 9
	.long	2090324355                      ; Hash in Bucket 9
	.long	-995076187                      ; Hash in Bucket 9
	.long	-680924602                      ; Hash in Bucket 9
	.long	-680914900                      ; Hash in Bucket 9
	.long	-680910478                      ; Hash in Bucket 9
	.long	-863244222                      ; Hash in Bucket 10
	.long	-735823797                      ; Hash in Bucket 10
	.long	2090147939                      ; Hash in Bucket 11
	.long	-1343633636                     ; Hash in Bucket 11
	.long	784013319                       ; Hash in Bucket 12
	.long	119187235                       ; Hash in Bucket 13
	.long	239667265                       ; Hash in Bucket 13
	.long	2090106493                      ; Hash in Bucket 13
	.long	2090320366                      ; Hash in Bucket 13
	.long	2090587831                      ; Hash in Bucket 13
	.long	-680906448                      ; Hash in Bucket 13
	.long	1474546142                      ; Hash in Bucket 14
	.long	-353240273                      ; Hash in Bucket 14
	.long	1516213923                      ; Hash in Bucket 15
	.long	-2011034344                     ; Hash in Bucket 15
	.long	-680911561                      ; Hash in Bucket 15
	.long	-103762318                      ; Hash in Bucket 15
	.long	1515597682                      ; Hash in Bucket 16
	.long	1515849241                      ; Hash in Bucket 16
	.long	-2064127614                     ; Hash in Bucket 16
	.long	193495088                       ; Hash in Bucket 17
	.long	217009403                       ; Hash in Bucket 17
	.long	-1622611670                     ; Hash in Bucket 17
	.long	-1622544152                     ; Hash in Bucket 17
	.long	-1622434163                     ; Hash in Bucket 17
	.long	274395349                       ; Hash in Bucket 19
	.long	274802008                       ; Hash in Bucket 19
	.long	277697659                       ; Hash in Bucket 19
	.long	227759321                       ; Hash in Bucket 20
	.long	1515597620                      ; Hash in Bucket 20
	.long	1515849179                      ; Hash in Bucket 20
	.long	878862258                       ; Hash in Bucket 21
	.long	-995522697                      ; Hash in Bucket 22
	.long	-282664779                      ; Hash in Bucket 25
	.long	290644127                       ; Hash in Bucket 26
	.long	290711645                       ; Hash in Bucket 26
	.long	290821634                       ; Hash in Bucket 26
	.long	773352188                       ; Hash in Bucket 26
	.long	-104093792                      ; Hash in Bucket 26
	.long	1768099900                      ; Hash in Bucket 28
	.long	613501610                       ; Hash in Bucket 29
	.long	1819312437                      ; Hash in Bucket 30
	.long	239667316                       ; Hash in Bucket 31
	.long	-1921963995                     ; Hash in Bucket 31
	.long	-995245587                      ; Hash in Bucket 31
	.long	1072                            ; String in Bucket 0: long
	.long	1195                            ; String in Bucket 0: vm_op_CALL
	.long	159                             ; String in Bucket 1: uint8_t
	.long	196                             ; String in Bucket 1: unsigned long long
	.long	1353                            ; String in Bucket 2: panic
	.long	1257                            ; String in Bucket 2: vm_op_RETN
	.long	279                             ; String in Bucket 3: runtime_args
	.long	215                             ; String in Bucket 4: state
	.long	1225                            ; String in Bucket 4: vm_op_DISP
	.long	1086                            ; String in Bucket 4: vm_op_TRAP
	.long	1301                            ; String in Bucket 6: diverge
	.long	1314                            ; String in Bucket 6: unusedexta
	.long	1291                            ; String in Bucket 7: undefined
	.long	122                             ; String in Bucket 8: unsigned int
	.long	1055                            ; String in Bucket 9: joff_t
	.long	1465                            ; String in Bucket 9: object
	.long	362                             ; String in Bucket 9: size_t
	.long	221                             ; String in Bucket 9: heap
	.long	1236                            ; String in Bucket 9: vm_op_RETU
	.long	1185                            ; String in Bucket 9: vm_op_APP
	.long	1206                            ; String in Bucket 9: vm_op_JMP
	.long	1097                            ; String in Bucket 9: vm_op_NOP
	.long	1546                            ; String in Bucket 10: closure
	.long	426                             ; String in Bucket 10: function
	.long	509                             ; String in Bucket 11: char
	.long	99                              ; String in Bucket 11: opthread
	.long	1062                            ; String in Bucket 12: ptrdiff_t
	.long	1341                            ; String in Bucket 13: invalidtrap
	.long	1216                            ; String in Bucket 13: vm_op_JR
	.long	108                             ; String in Bucket 13: bc_t
	.long	1309                            ; String in Bucket 13: halt
	.long	1441                            ; String in Bucket 13: op_t
	.long	1247                            ; String in Bucket 13: vm_op_RET
	.long	304                             ; String in Bucket 14: trace_level_t
	.long	1359                            ; String in Bucket 14: stackoverflow
	.long	1279                            ; String in Bucket 15: vm_op_MCLOS
	.long	1475                            ; String in Bucket 15: metainfo
	.long	1107                            ; String in Bucket 15: vm_op_MOV
	.long	385                             ; String in Bucket 15: unsigned long
	.long	1152                            ; String in Bucket 16: vm_op_LSI32
	.long	1164                            ; String in Bucket 16: vm_op_LZI32
	.long	1325                            ; String in Bucket 16: assertionfailed
	.long	1051                            ; String in Bucket 17: int
	.long	447                             ; String in Bucket 17: __ARRAY_SIZE_TYPE__
	.long	1029                            ; String in Bucket 17: int16_t
	.long	1043                            ; String in Bucket 17: int32_t
	.long	1011                            ; String in Bucket 17: int64_t
	.long	1037                            ; String in Bucket 19: short
	.long	1450                            ; String in Bucket 19: ssz_t
	.long	181                             ; String in Bucket 19: val_t
	.long	1077                            ; String in Bucket 20: vm_entry
	.long	1128                            ; String in Bucket 20: vm_op_LSI16
	.long	1140                            ; String in Bucket 20: vm_op_LZI16
	.long	144                             ; String in Bucket 21: unsigned short
	.long	1117                            ; String in Bucket 22: vm_op_EXTA
	.long	369                             ; String in Bucket 25: __darwin_size_t
	.long	135                             ; String in Bucket 26: uint16_t
	.long	113                             ; String in Bucket 26: uint32_t
	.long	187                             ; String in Bucket 26: uint64_t
	.long	1387                            ; String in Bucket 26: unimplemented
	.long	167                             ; String in Bucket 26: unsigned char
	.long	1401                            ; String in Bucket 28: status_t
	.long	1373                            ; String in Bucket 29: invalidlayout
	.long	90                              ; String in Bucket 30: dispatch
	.long	1176                            ; String in Bucket 31: vm_op_LC
	.long	1019                            ; String in Bucket 31: long long
	.long	1268                            ; String in Bucket 31: vm_op_MOBJ
.set Lset70, Lnames30-Lnames_entries0   ; Offset in Bucket 0
	.long	Lset70
.set Lset71, Lnames42-Lnames_entries0   ; Offset in Bucket 0
	.long	Lset71
.set Lset72, Lnames6-Lnames_entries0    ; Offset in Bucket 1
	.long	Lset72
.set Lset73, Lnames10-Lnames_entries0   ; Offset in Bucket 1
	.long	Lset73
.set Lset74, Lnames57-Lnames_entries0   ; Offset in Bucket 2
	.long	Lset74
.set Lset75, Lnames48-Lnames_entries0   ; Offset in Bucket 2
	.long	Lset75
.set Lset76, Lnames13-Lnames_entries0   ; Offset in Bucket 3
	.long	Lset76
.set Lset77, Lnames11-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset77
.set Lset78, Lnames45-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset78
.set Lset79, Lnames32-Lnames_entries0   ; Offset in Bucket 4
	.long	Lset79
.set Lset80, Lnames52-Lnames_entries0   ; Offset in Bucket 6
	.long	Lset80
.set Lset81, Lnames54-Lnames_entries0   ; Offset in Bucket 6
	.long	Lset81
.set Lset82, Lnames51-Lnames_entries0   ; Offset in Bucket 7
	.long	Lset82
.set Lset83, Lnames3-Lnames_entries0    ; Offset in Bucket 8
	.long	Lset83
.set Lset84, Lnames28-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset84
.set Lset85, Lnames64-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset85
.set Lset86, Lnames15-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset86
.set Lset87, Lnames12-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset87
.set Lset88, Lnames46-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset88
.set Lset89, Lnames41-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset89
.set Lset90, Lnames43-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset90
.set Lset91, Lnames33-Lnames_entries0   ; Offset in Bucket 9
	.long	Lset91
.set Lset92, Lnames66-Lnames_entries0   ; Offset in Bucket 10
	.long	Lset92
.set Lset93, Lnames18-Lnames_entries0   ; Offset in Bucket 10
	.long	Lset93
.set Lset94, Lnames20-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset94
.set Lset95, Lnames0-Lnames_entries0    ; Offset in Bucket 11
	.long	Lset95
.set Lset96, Lnames29-Lnames_entries0   ; Offset in Bucket 12
	.long	Lset96
.set Lset97, Lnames56-Lnames_entries0   ; Offset in Bucket 13
	.long	Lset97
.set Lset98, Lnames44-Lnames_entries0   ; Offset in Bucket 13
	.long	Lset98
.set Lset99, Lnames1-Lnames_entries0    ; Offset in Bucket 13
	.long	Lset99
.set Lset100, Lnames53-Lnames_entries0  ; Offset in Bucket 13
	.long	Lset100
.set Lset101, Lnames62-Lnames_entries0  ; Offset in Bucket 13
	.long	Lset101
.set Lset102, Lnames47-Lnames_entries0  ; Offset in Bucket 13
	.long	Lset102
.set Lset103, Lnames14-Lnames_entries0  ; Offset in Bucket 14
	.long	Lset103
.set Lset104, Lnames58-Lnames_entries0  ; Offset in Bucket 14
	.long	Lset104
.set Lset105, Lnames50-Lnames_entries0  ; Offset in Bucket 15
	.long	Lset105
.set Lset106, Lnames65-Lnames_entries0  ; Offset in Bucket 15
	.long	Lset106
.set Lset107, Lnames34-Lnames_entries0  ; Offset in Bucket 15
	.long	Lset107
.set Lset108, Lnames17-Lnames_entries0  ; Offset in Bucket 15
	.long	Lset108
.set Lset109, Lnames38-Lnames_entries0  ; Offset in Bucket 16
	.long	Lset109
.set Lset110, Lnames39-Lnames_entries0  ; Offset in Bucket 16
	.long	Lset110
.set Lset111, Lnames55-Lnames_entries0  ; Offset in Bucket 16
	.long	Lset111
.set Lset112, Lnames27-Lnames_entries0  ; Offset in Bucket 17
	.long	Lset112
.set Lset113, Lnames19-Lnames_entries0  ; Offset in Bucket 17
	.long	Lset113
.set Lset114, Lnames24-Lnames_entries0  ; Offset in Bucket 17
	.long	Lset114
.set Lset115, Lnames26-Lnames_entries0  ; Offset in Bucket 17
	.long	Lset115
.set Lset116, Lnames22-Lnames_entries0  ; Offset in Bucket 17
	.long	Lset116
.set Lset117, Lnames25-Lnames_entries0  ; Offset in Bucket 19
	.long	Lset117
.set Lset118, Lnames63-Lnames_entries0  ; Offset in Bucket 19
	.long	Lset118
.set Lset119, Lnames8-Lnames_entries0   ; Offset in Bucket 19
	.long	Lset119
.set Lset120, Lnames31-Lnames_entries0  ; Offset in Bucket 20
	.long	Lset120
.set Lset121, Lnames36-Lnames_entries0  ; Offset in Bucket 20
	.long	Lset121
.set Lset122, Lnames37-Lnames_entries0  ; Offset in Bucket 20
	.long	Lset122
.set Lset123, Lnames5-Lnames_entries0   ; Offset in Bucket 21
	.long	Lset123
.set Lset124, Lnames35-Lnames_entries0  ; Offset in Bucket 22
	.long	Lset124
.set Lset125, Lnames16-Lnames_entries0  ; Offset in Bucket 25
	.long	Lset125
.set Lset126, Lnames4-Lnames_entries0   ; Offset in Bucket 26
	.long	Lset126
.set Lset127, Lnames2-Lnames_entries0   ; Offset in Bucket 26
	.long	Lset127
.set Lset128, Lnames9-Lnames_entries0   ; Offset in Bucket 26
	.long	Lset128
.set Lset129, Lnames60-Lnames_entries0  ; Offset in Bucket 26
	.long	Lset129
.set Lset130, Lnames7-Lnames_entries0   ; Offset in Bucket 26
	.long	Lset130
.set Lset131, Lnames61-Lnames_entries0  ; Offset in Bucket 28
	.long	Lset131
.set Lset132, Lnames59-Lnames_entries0  ; Offset in Bucket 29
	.long	Lset132
.set Lset133, Lnames21-Lnames_entries0  ; Offset in Bucket 30
	.long	Lset133
.set Lset134, Lnames40-Lnames_entries0  ; Offset in Bucket 31
	.long	Lset134
.set Lset135, Lnames23-Lnames_entries0  ; Offset in Bucket 31
	.long	Lset135
.set Lset136, Lnames49-Lnames_entries0  ; Offset in Bucket 31
	.long	Lset136
Lnames_abbrev_start0:
	.byte	1                               ; Abbrev code
	.byte	36                              ; DW_TAG_base_type
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	2                               ; Abbrev code
	.byte	46                              ; DW_TAG_subprogram
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	3                               ; Abbrev code
	.byte	22                              ; DW_TAG_typedef
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	4                               ; Abbrev code
	.byte	19                              ; DW_TAG_structure_type
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	5                               ; Abbrev code
	.byte	52                              ; DW_TAG_variable
	.byte	3                               ; DW_IDX_die_offset
	.byte	19                              ; DW_FORM_ref4
	.byte	4                               ; DW_IDX_parent
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev
	.byte	0                               ; End of abbrev list
Lnames_abbrev_end0:
Lnames_entries0:
Lnames30:
L7:
	.byte	1                               ; Abbreviation code
	.long	1009                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: long
Lnames42:
L29:
	.byte	2                               ; Abbreviation code
	.long	2858                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_CALL
Lnames6:
L48:
	.byte	3                               ; Abbreviation code
	.long	157                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint8_t
Lnames10:
L64:
	.byte	1                               ; Abbreviation code
	.long	195                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned long long
Lnames57:
L43:
	.byte	2                               ; Abbreviation code
	.long	5013                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: panic
Lnames48:
L10:
	.byte	2                               ; Abbreviation code
	.long	3908                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_RETN
Lnames13:
L14:
	.byte	4                               ; Abbreviation code
	.long	389                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: runtime_args
Lnames11:
L35:
	.byte	4                               ; Abbreviation code
	.long	209                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: state
Lnames45:
L61:
	.byte	2                               ; Abbreviation code
	.long	3351                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_DISP
Lnames32:
L23:
	.byte	2                               ; Abbreviation code
	.long	1149                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_TRAP
Lnames52:
L31:
	.byte	2                               ; Abbreviation code
	.long	4563                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: diverge
Lnames54:
L53:
	.byte	2                               ; Abbreviation code
	.long	4743                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unusedexta
Lnames51:
L44:
	.byte	2                               ; Abbreviation code
	.long	4473                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: undefined
Lnames3:
L24:
	.byte	1                               ; Abbreviation code
	.long	141                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned int
Lnames28:
L4:
	.byte	3                               ; Abbreviation code
	.long	988                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: joff_t
Lnames64:
L36:
	.byte	4                               ; Abbreviation code
	.long	5450                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: object
Lnames15:
L8:
	.byte	3                               ; Abbreviation code
	.long	460                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: size_t
Lnames12:
L39:
	.byte	4                               ; Abbreviation code
	.long	310                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: heap
Lnames46:
L52:
	.byte	2                               ; Abbreviation code
	.long	3531                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_RETU
Lnames41:
L42:
	.byte	2                               ; Abbreviation code
	.long	2678                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_APP
Lnames43:
L16:
	.byte	2                               ; Abbreviation code
	.long	3037                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_JMP
Lnames33:
L57:
	.byte	2                               ; Abbreviation code
	.long	1500                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_NOP
Lnames66:
L28:
	.byte	4                               ; Abbreviation code
	.long	5498                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: closure
Lnames18:
L13:
	.byte	4                               ; Abbreviation code
	.long	485                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: function
Lnames20:
L30:
	.byte	1                               ; Abbreviation code
	.long	539                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: char
Lnames0:
L12:
	.byte	3                               ; Abbreviation code
	.long	69                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: opthread
Lnames29:
L54:
	.byte	3                               ; Abbreviation code
	.long	1001                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: ptrdiff_t
Lnames56:
L9:
	.byte	2                               ; Abbreviation code
	.long	4923                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: invalidtrap
Lnames44:
L60:
	.byte	2                               ; Abbreviation code
	.long	3183                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_JR
Lnames1:
L22:
	.byte	3                               ; Abbreviation code
	.long	125                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: bc_t
Lnames53:
L49:
	.byte	2                               ; Abbreviation code
	.long	4653                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: halt
Lnames62:
L2:
	.byte	3                               ; Abbreviation code
	.long	5429                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: op_t
Lnames47:
L66:
	.byte	2                               ; Abbreviation code
	.long	3713                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_RET
Lnames14:
L65:
	.byte	3                               ; Abbreviation code
	.long	431                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: trace_level_t
Lnames58:
L50:
	.byte	2                               ; Abbreviation code
	.long	5151                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: stackoverflow
Lnames50:
L15:
	.byte	2                               ; Abbreviation code
	.long	4375                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_MCLOS
Lnames65:
L25:
	.byte	3                               ; Abbreviation code
	.long	5474                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: metainfo
Lnames34:
L58:
	.byte	2                               ; Abbreviation code
	.long	1631                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_MOV
Lnames17:
L63:
	.byte	1                               ; Abbreviation code
	.long	476                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned long
Lnames38:
L6:
	.byte	2                               ; Abbreviation code
	.long	2162                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_LSI32
Lnames39:
L38:
	.byte	2                               ; Abbreviation code
	.long	2342                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_LZI32
Lnames55:
L11:
	.byte	2                               ; Abbreviation code
	.long	4833                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: assertionfailed
Lnames27:
L47:
	.byte	1                               ; Abbreviation code
	.long	984                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int
Lnames19:
L0:
	.byte	1                               ; Abbreviation code
	.long	520                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __ARRAY_SIZE_TYPE__
Lnames24:
L1:
	.byte	3                               ; Abbreviation code
	.long	964                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int16_t
Lnames26:
L19:
	.byte	3                               ; Abbreviation code
	.long	976                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int32_t
Lnames22:
L26:
	.byte	3                               ; Abbreviation code
	.long	952                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int64_t
Lnames25:
L20:
	.byte	1                               ; Abbreviation code
	.long	972                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: short
Lnames63:
L3:
	.byte	3                               ; Abbreviation code
	.long	5437                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: ssz_t
Lnames8:
L34:
	.byte	3                               ; Abbreviation code
	.long	179                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: val_t
Lnames31:
L21:
	.byte	2                               ; Abbreviation code
	.long	1013                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_entry
Lnames36:
L41:
	.byte	2                               ; Abbreviation code
	.long	1876                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_LSI16
Lnames37:
L5:
	.byte	2                               ; Abbreviation code
	.long	2019                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_LZI16
Lnames5:
L51:
	.byte	1                               ; Abbreviation code
	.long	153                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned short
Lnames35:
L33:
	.byte	2                               ; Abbreviation code
	.long	1786                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_EXTA
Lnames16:
L45:
	.byte	3                               ; Abbreviation code
	.long	468                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_size_t
Lnames4:
L27:
	.byte	3                               ; Abbreviation code
	.long	145                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint16_t
Lnames2:
L17:
	.byte	3                               ; Abbreviation code
	.long	133                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint32_t
Lnames9:
L59:
	.byte	3                               ; Abbreviation code
	.long	187                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint64_t
Lnames60:
L40:
	.byte	2                               ; Abbreviation code
	.long	5331                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unimplemented
Lnames7:
L18:
	.byte	1                               ; Abbreviation code
	.long	165                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned char
Lnames61:
L62:
	.byte	3                               ; Abbreviation code
	.long	5421                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: status_t
Lnames59:
L37:
	.byte	2                               ; Abbreviation code
	.long	5241                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: invalidlayout
Lnames21:
L56:
	.byte	5                               ; Abbreviation code
	.long	35                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: dispatch
Lnames40:
L32:
	.byte	2                               ; Abbreviation code
	.long	2522                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_LC
Lnames23:
L46:
	.byte	1                               ; Abbreviation code
	.long	960                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: long long
Lnames49:
L55:
	.byte	2                               ; Abbreviation code
	.long	4148                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_MOBJ
	.p2align	2, 0x0
Lnames_end0:
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
