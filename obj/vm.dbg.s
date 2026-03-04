	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.file	0 "/Users/waterlens/Projects/qxq/vm" "src/vm.c" md5 0x0ac9c966bbb0c49d0ba7acbf7c609c9a
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
	.file	11 "src" "vm.h" md5 0x23344b00194dec2032ae1557502f5766
	.file	12 "src" "bc.h" md5 0x8d079fbb8ce26b8dc7abaf95b816c5e2
	.file	13 "src" "trap.h" md5 0xf7408d08ce49dddaa8c67a579190385b
	.file	14 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_int64_t.h" md5 0xe6d85c1a9e23dbf7518ce3b162aac800
	.file	15 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_int16_t.h" md5 0x47ed3c3ac6f65bfec021ca2b7be18e7e
	.file	16 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/17/include" "__stddef_ptrdiff_t.h" md5 0x21e0c40f3315797d915cc7ea60040a98
	.file	17 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_int32_t.h" md5 0xd23e8406e80ee79983f28509c741fa17
	.globl	_vm_entry                       ; -- Begin function vm_entry
	.p2align	2
_vm_entry:                              ; @vm_entry
Lfunc_begin0:
	.loc	0 16 0                          ; src/vm.c:16:0
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
	.loc	0 17 14 prologue_end            ; src/vm.c:17:14
	ldur	x9, [x29, #-160]
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	.loc	0 17 21 is_stmt 0               ; src/vm.c:17:21
	add	x9, x9, #8
	str	x9, [sp, #200]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	0 0 21                          ; src/vm.c:0:21
	ldr	x0, [sp, #200]                  ; 8-byte Folded Reload
	.loc	0 17 21                         ; src/vm.c:17:21
	bl	___asan_report_load8
	brk	#0x1
LBB0_2:
	.loc	0 0 21                          ; src/vm.c:0:21
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #192]                  ; 8-byte Folded Reload
	.loc	0 17 21                         ; src/vm.c:17:21
	ldr	x9, [x9, #8]
	.loc	0 17 28                         ; src/vm.c:17:28
	add	x9, x9, #8
	.loc	0 17 9                          ; src/vm.c:17:9
	stur	x9, [x29, #-168]
	.loc	0 18 15 is_stmt 1               ; src/vm.c:18:15
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
	.loc	0 18 15                         ; src/vm.c:18:15
	bl	___asan_report_load8
	brk	#0x1
LBB0_4:
	.loc	0 0 15                          ; src/vm.c:0:15
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #168]                  ; 8-byte Folded Reload
	.loc	0 18 15                         ; src/vm.c:18:15
	ldr	x9, [x9, #48]
	add	x9, x9, #32
	.loc	0 18 10                         ; src/vm.c:18:10
	stur	x9, [x29, #-176]
	.loc	0 19 18 is_stmt 1               ; src/vm.c:19:18
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
	.loc	0 19 18                         ; src/vm.c:19:18
	bl	___asan_report_load8
	brk	#0x1
LBB0_6:
	.loc	0 0 18                          ; src/vm.c:0:18
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	.loc	0 19 18                         ; src/vm.c:19:18
	ldr	x9, [x9, #8]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 19 3                          ; src/vm.c:19:3
	ldur	x9, [x29, #-176]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	subs	x9, x9, #16
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 19 16                         ; src/vm.c:19:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 19 16                         ; src/vm.c:19:16
	bl	___asan_report_store8
	brk	#0x1
LBB0_8:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #136]                 ; 8-byte Folded Reload
	.loc	0 19 16                         ; src/vm.c:19:16
	stur	x9, [x10, #-16]
	.loc	0 20 3 is_stmt 1                ; src/vm.c:20:3
	ldur	x9, [x29, #-176]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 20 16 is_stmt 0               ; src/vm.c:20:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_10
	b	LBB0_9
LBB0_9:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 20 16                         ; src/vm.c:20:16
	bl	___asan_report_store8
	brk	#0x1
LBB0_10:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 20 16                         ; src/vm.c:20:16
	stur	xzr, [x9, #-8]
	.loc	0 21 27 is_stmt 1               ; src/vm.c:21:27
	ldur	x9, [x29, #-160]
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	.loc	0 21 34 is_stmt 0               ; src/vm.c:21:34
	add	x9, x9, #16
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB0_12
	b	LBB0_11
LBB0_11:
	.loc	0 0 34                          ; src/vm.c:0:34
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 21 34                         ; src/vm.c:21:34
	bl	___asan_report_load8
	brk	#0x1
LBB0_12:
	.loc	0 0 34                          ; src/vm.c:0:34
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 21 34                         ; src/vm.c:21:34
	ldr	x9, [x9, #16]
	.loc	0 21 21                         ; src/vm.c:21:21
	stur	x9, [x29, #-184]
	.loc	0 26 3 is_stmt 1                ; src/vm.c:26:3
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
	.loc	0 26 3                          ; src/vm.c:26:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB0_15
	b	LBB0_14
LBB0_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 26 3                          ; src/vm.c:26:3
	bl	___asan_report_load1
	brk	#0x1
LBB0_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 26 3                          ; src/vm.c:26:3
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
	.loc	0 26 3                          ; src/vm.c:26:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB0_18
	b	LBB0_17
LBB0_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #56]                   ; 8-byte Folded Reload
	.loc	0 26 3                          ; src/vm.c:26:3
	bl	___asan_report_load1
	brk	#0x1
LBB0_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	.loc	0 26 3                          ; src/vm.c:26:3
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
	.loc	0 26 3                          ; src/vm.c:26:3
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
	.loc	0 26 3                          ; src/vm.c:26:3
	bl	___asan_report_load2
	brk	#0x1
LBB0_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #184]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 26 3                          ; src/vm.c:26:3
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
	.loc	0 26 3                          ; src/vm.c:26:3
	bl	___asan_report_load8
	brk	#0x1
LBB0_23:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 26 3                          ; src/vm.c:26:3
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
	.loc	0 27 3 is_stmt 1                ; src/vm.c:27:3
	mov	w0, #0                          ; =0x0
	.cfi_def_cfa wsp, 432
	.loc	0 27 3 epilogue_begin is_stmt 0 ; src/vm.c:27:3
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
	.p2align	5                               ; -- Begin function vm_op_Trap
_vm_op_Trap:                            ; @vm_op_Trap
Lfunc_begin1:
	.loc	0 88 0 is_stmt 1                ; src/vm.c:88:0
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
	.loc	0 89 15 prologue_end            ; src/vm.c:89:15
	ldurb	w8, [x29, #-19]
	.loc	0 89 9 is_stmt 0                ; src/vm.c:89:9
	stur	w8, [x29, #-60]
	.loc	0 90 11 is_stmt 1               ; src/vm.c:90:11
	ldur	w8, [x29, #-60]
	stur	w8, [x29, #-164]                ; 4-byte Folded Spill
	.loc	0 90 3 is_stmt 0                ; src/vm.c:90:3
	cbz	w8, LBB1_8
	b	LBB1_1
LBB1_1:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 90 3                          ; src/vm.c:90:3
	subs	w8, w8, #1
	b.eq	LBB1_9
	b	LBB1_2
LBB1_2:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 90 3                          ; src/vm.c:90:3
	subs	w8, w8, #2
	b.eq	LBB1_10
	b	LBB1_3
LBB1_3:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 90 3                          ; src/vm.c:90:3
	subs	w8, w8, #3
	b.eq	LBB1_11
	b	LBB1_4
LBB1_4:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 90 3                          ; src/vm.c:90:3
	subs	w8, w8, #4
	subs	w8, w8, #1
	b.ls	LBB1_12
	b	LBB1_5
LBB1_5:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 90 3                          ; src/vm.c:90:3
	subs	w8, w8, #6
	b.eq	LBB1_25
	b	LBB1_6
LBB1_6:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 90 3                          ; src/vm.c:90:3
	subs	w8, w8, #7
	b.eq	LBB1_42
	b	LBB1_7
LBB1_7:                                 ; %entry
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	w8, [x29, #-164]                ; 4-byte Folded Reload
	.loc	0 90 3                          ; src/vm.c:90:3
	subs	w8, w8, #8
	b.eq	LBB1_45
	b	LBB1_51
LBB1_8:                                 ; %sw.bb
Ltmp3:
	.loc	0 92 31 is_stmt 1               ; src/vm.c:92:31
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 92 21 epilogue_begin is_stmt 0 ; src/vm.c:92:21
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
	.loc	0 94 29 is_stmt 1               ; src/vm.c:94:29
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 94 21 epilogue_begin is_stmt 0 ; src/vm.c:94:21
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
	.loc	0 96 26 is_stmt 1               ; src/vm.c:96:26
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 96 21 epilogue_begin is_stmt 0 ; src/vm.c:96:21
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
	.loc	0 98 32 is_stmt 1               ; src/vm.c:98:32
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 98 21 epilogue_begin is_stmt 0 ; src/vm.c:98:21
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
	.loc	0 101 16 is_stmt 1              ; src/vm.c:101:16
	ldurb	w8, [x29, #-18]
	.loc	0 101 11 is_stmt 0              ; src/vm.c:101:11
	stur	w8, [x29, #-68]
	.loc	0 102 16 is_stmt 1              ; src/vm.c:102:16
	ldurh	w8, [x29, #-18]
	lsr	w8, w8, #8
	and	w8, w8, #0xff
	.loc	0 102 11 is_stmt 0              ; src/vm.c:102:11
	stur	w8, [x29, #-72]
Ltmp5:
	.loc	0 104 20 is_stmt 1              ; src/vm.c:104:20
	ldur	w8, [x29, #-68]
	.loc	0 104 16 is_stmt 0              ; src/vm.c:104:16
	stur	w8, [x29, #-76]
	.loc	0 104 10                        ; src/vm.c:104:10
	b	LBB1_13
LBB1_13:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
Ltmp6:
	.loc	0 104 24                        ; src/vm.c:104:24
	ldur	w8, [x29, #-76]
	.loc	0 104 28                        ; src/vm.c:104:28
	ldur	w9, [x29, #-72]
Ltmp7:
	.loc	0 104 5                         ; src/vm.c:104:5
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
	.loc	0 106 7 is_stmt 1               ; src/vm.c:106:7
	b	LBB1_16
LBB1_16:                                ; %do.body
                                        ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-184]                ; 8-byte Folded Reload
Ltmp9:
	.loc	0 106 7                         ; src/vm.c:106:7
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
	.loc	0 106 7                         ; src/vm.c:106:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_18:                                ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	.loc	0 106 7                         ; src/vm.c:106:7
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
	.loc	0 106 7                         ; src/vm.c:106:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_20:                                ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x1, [x29, #-224]                ; 8-byte Folded Reload
	ldur	x0, [x29, #-232]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-216]               ; 8-byte Folded Reload
	ldur	x8, [x29, #-208]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-200]                ; 8-byte Folded Reload
	.loc	0 106 7                         ; src/vm.c:106:7
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
	.loc	0 110 5 is_stmt 1               ; src/vm.c:110:5
	b	LBB1_23
Ltmp11:
LBB1_23:                                ; %for.inc
                                        ;   in Loop: Header=BB1_13 Depth=1
	.loc	0 104 33                        ; src/vm.c:104:33
	ldur	w8, [x29, #-76]
	add	w8, w8, #1
	stur	w8, [x29, #-76]
	.loc	0 104 5 is_stmt 0               ; src/vm.c:104:5
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
	.loc	0 114 16 is_stmt 1              ; src/vm.c:114:16
	ldurb	w9, [x29, #-18]
	.loc	0 114 11 is_stmt 0              ; src/vm.c:114:11
	stur	w9, [x29, #-92]
	.loc	0 115 16 is_stmt 1              ; src/vm.c:115:16
	ldurh	w9, [x29, #-18]
	lsr	w9, w9, #8
	and	w9, w9, #0xff
	.loc	0 115 11 is_stmt 0              ; src/vm.c:115:11
	stur	w9, [x29, #-96]
Ltmp14:
	.loc	0 117 9 is_stmt 1               ; src/vm.c:117:9
	ldur	x9, [x29, #-32]
	str	x9, [sp, #256]                  ; 8-byte Folded Spill
	.loc	0 117 12 is_stmt 0              ; src/vm.c:117:12
	ldur	w10, [x29, #-92]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-248]               ; 8-byte Folded Spill
	.loc	0 117 9                         ; src/vm.c:117:9
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-240]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_27
	b	LBB1_26
LBB1_26:
	.loc	0 0 9                           ; src/vm.c:0:9
	ldur	x0, [x29, #-240]                ; 8-byte Folded Reload
	.loc	0 117 9                         ; src/vm.c:117:9
	bl	___asan_report_load8
	brk	#0x1
LBB1_27:
	.loc	0 0 9                           ; src/vm.c:0:9
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #256]                  ; 8-byte Folded Reload
	ldur	x10, [x29, #-248]               ; 8-byte Folded Reload
	.loc	0 117 9                         ; src/vm.c:117:9
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #224]                  ; 8-byte Folded Spill
	.loc	0 117 19                        ; src/vm.c:117:19
	ldur	x9, [x29, #-32]
	str	x9, [sp, #232]                  ; 8-byte Folded Spill
	.loc	0 117 22                        ; src/vm.c:117:22
	ldur	w10, [x29, #-96]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #240]                 ; 8-byte Folded Spill
	.loc	0 117 19                        ; src/vm.c:117:19
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #248]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB1_29
	b	LBB1_28
LBB1_28:
	.loc	0 0 19                          ; src/vm.c:0:19
	ldr	x0, [sp, #248]                  ; 8-byte Folded Reload
	.loc	0 117 19                        ; src/vm.c:117:19
	bl	___asan_report_load8
	brk	#0x1
LBB1_29:
	.loc	0 0 19                          ; src/vm.c:0:19
	ldr	x8, [sp, #224]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #232]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #240]                 ; 8-byte Folded Reload
	.loc	0 117 19                        ; src/vm.c:117:19
	ldr	x9, [x9, x10, lsl #3]
Ltmp15:
	.loc	0 117 9                         ; src/vm.c:117:9
	subs	x8, x8, x9
	b.eq	LBB1_40
	b	LBB1_30
LBB1_30:                                ; %if.then
Ltmp16:
	.loc	0 119 7 is_stmt 1               ; src/vm.c:119:7
	b	LBB1_31
LBB1_31:                                ; %do.body26
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-184]                ; 8-byte Folded Reload
Ltmp17:
	.loc	0 119 7                         ; src/vm.c:119:7
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
	.loc	0 119 7                         ; src/vm.c:119:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_33:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	.loc	0 119 7                         ; src/vm.c:119:7
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
	.loc	0 119 7                         ; src/vm.c:119:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_35:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #200]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #208]                 ; 8-byte Folded Reload
	.loc	0 119 7                         ; src/vm.c:119:7
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
	.loc	0 119 7                         ; src/vm.c:119:7
	bl	___asan_report_load8
	brk	#0x1
LBB1_37:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldr	x0, [sp, #192]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #160]                 ; 8-byte Folded Reload
	ldr	x8, [sp, #168]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #176]                  ; 8-byte Folded Reload
	.loc	0 119 7                         ; src/vm.c:119:7
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
	.loc	0 121 39 is_stmt 1              ; src/vm.c:121:39
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 121 23 epilogue_begin is_stmt 0 ; src/vm.c:121:23
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
	.loc	0 123 5 is_stmt 1               ; src/vm.c:123:5
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
	.loc	0 126 15 is_stmt 1              ; src/vm.c:126:15
	ldurb	w9, [x29, #-18]
	.loc	0 126 11 is_stmt 0              ; src/vm.c:126:11
	stur	w9, [x29, #-116]
	.loc	0 127 26 is_stmt 1              ; src/vm.c:127:26
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
	.loc	0 127 26                        ; src/vm.c:127:26
	bl	___asan_report_load8
	brk	#0x1
LBB1_44:
	.loc	0 0 26                          ; src/vm.c:0:26
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 127 26                        ; src/vm.c:127:26
	ldr	x8, [x8, x9, lsl #3]
	.loc	0 127 20                        ; src/vm.c:127:20
	stur	x8, [x29, #-128]
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-64]
	b	LBB1_52
Ltmp22:
LBB1_45:                                ; %sw.bb43
	.loc	0 132 5 is_stmt 1               ; src/vm.c:132:5
	b	LBB1_46
LBB1_46:                                ; %do.body44
	.loc	0 0 5 is_stmt 0                 ; src/vm.c:0:5
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
Ltmp23:
	.loc	0 132 5                         ; src/vm.c:132:5
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
	.loc	0 132 5                         ; src/vm.c:132:5
	bl	___asan_report_load8
	brk	#0x1
LBB1_48:
	.loc	0 0 5                           ; src/vm.c:0:5
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 132 5                         ; src/vm.c:132:5
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
	.loc	0 133 5 is_stmt 1               ; src/vm.c:133:5
	b	LBB1_52
Ltmp25:
LBB1_51:                                ; %sw.default
	.loc	0 136 33                        ; src/vm.c:136:33
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.loc	0 136 21 epilogue_begin is_stmt 0 ; src/vm.c:136:21
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
	.loc	0 139 3 is_stmt 1               ; src/vm.c:139:3
	b	LBB1_53
LBB1_53:                                ; %do.body48
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
Ltmp27:
	.loc	0 139 3                         ; src/vm.c:139:3
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
	.loc	0 139 3                         ; src/vm.c:139:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB1_56
	b	LBB1_55
LBB1_55:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 139 3                         ; src/vm.c:139:3
	bl	___asan_report_load1
	brk	#0x1
LBB1_56:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 139 3                         ; src/vm.c:139:3
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
	.loc	0 139 3                         ; src/vm.c:139:3
	bl	___asan_report_load8
	brk	#0x1
LBB1_58:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #80]                  ; 8-byte Folded Reload
	.loc	0 139 3                         ; src/vm.c:139:3
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
	.loc	0 139 3                         ; src/vm.c:139:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB1_61
	b	LBB1_60
LBB1_60:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #56]                   ; 8-byte Folded Reload
	.loc	0 139 3                         ; src/vm.c:139:3
	bl	___asan_report_load1
	brk	#0x1
LBB1_61:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-176]                ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	.loc	0 139 3                         ; src/vm.c:139:3
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
	.loc	0 139 3                         ; src/vm.c:139:3
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
	.loc	0 139 3                         ; src/vm.c:139:3
	bl	___asan_report_load2
	brk	#0x1
LBB1_64:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 139 3                         ; src/vm.c:139:3
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
	.loc	0 139 3 epilogue_begin          ; src/vm.c:139:3
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
	.loc	0 140 1 epilogue_begin is_stmt 1 ; src/vm.c:140:1
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
	.p2align	5                               ; -- Begin function vm_op_Nop
_vm_op_Nop:                             ; @vm_op_Nop
Lfunc_begin2:
	.loc	0 142 0                         ; src/vm.c:142:0
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
	.loc	0 142 22 prologue_end           ; src/vm.c:142:22
	b	LBB2_1
LBB2_1:                                 ; %do.body
	.loc	0 0 22 is_stmt 0                ; src/vm.c:0:22
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
Ltmp31:
	.loc	0 142 22                        ; src/vm.c:142:22
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
	.loc	0 142 22                        ; src/vm.c:142:22
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB2_4
	b	LBB2_3
LBB2_3:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 142 22                        ; src/vm.c:142:22
	bl	___asan_report_load1
	brk	#0x1
LBB2_4:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 142 22                        ; src/vm.c:142:22
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
	.loc	0 142 22                        ; src/vm.c:142:22
	bl	___asan_report_load8
	brk	#0x1
LBB2_6:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 142 22                        ; src/vm.c:142:22
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
	.loc	0 142 22                        ; src/vm.c:142:22
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB2_9
	b	LBB2_8
LBB2_8:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 142 22                        ; src/vm.c:142:22
	bl	___asan_report_load1
	brk	#0x1
LBB2_9:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 142 22                        ; src/vm.c:142:22
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
	.loc	0 142 22                        ; src/vm.c:142:22
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
	.loc	0 142 22                        ; src/vm.c:142:22
	bl	___asan_report_load2
	brk	#0x1
LBB2_12:
	.loc	0 0 22                          ; src/vm.c:0:22
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 142 22                        ; src/vm.c:142:22
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
	.loc	0 142 22 epilogue_begin         ; src/vm.c:142:22
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
	.p2align	5                               ; -- Begin function vm_op_Move
_vm_op_Move:                            ; @vm_op_Move
Lfunc_begin3:
	.loc	0 144 0 is_stmt 1               ; src/vm.c:144:0
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
	.loc	0 145 15 prologue_end           ; src/vm.c:145:15
	ldurb	w9, [x29, #-19]
	.loc	0 145 9 is_stmt 0               ; src/vm.c:145:9
	stur	w9, [x29, #-60]
	.loc	0 146 15 is_stmt 1              ; src/vm.c:146:15
	ldurh	w9, [x29, #-18]
	.loc	0 146 9 is_stmt 0               ; src/vm.c:146:9
	stur	w9, [x29, #-64]
	.loc	0 148 13 is_stmt 1              ; src/vm.c:148:13
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	.loc	0 148 16 is_stmt 0              ; src/vm.c:148:16
	ldur	w10, [x29, #-64]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-112]               ; 8-byte Folded Spill
	.loc	0 148 13                        ; src/vm.c:148:13
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-104]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB3_2
	b	LBB3_1
LBB3_1:
	.loc	0 0 13                          ; src/vm.c:0:13
	ldur	x0, [x29, #-104]                ; 8-byte Folded Reload
	.loc	0 148 13                        ; src/vm.c:148:13
	bl	___asan_report_load8
	brk	#0x1
LBB3_2:
	.loc	0 0 13                          ; src/vm.c:0:13
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	ldur	x9, [x29, #-120]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-112]               ; 8-byte Folded Reload
	.loc	0 148 13                        ; src/vm.c:148:13
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	.loc	0 148 3                         ; src/vm.c:148:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 148 6                         ; src/vm.c:148:6
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #112]                 ; 8-byte Folded Spill
	.loc	0 148 3                         ; src/vm.c:148:3
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 148 11                        ; src/vm.c:148:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB3_4
	b	LBB3_3
LBB3_3:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 148 11                        ; src/vm.c:148:11
	bl	___asan_report_store8
	brk	#0x1
LBB3_4:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #112]                 ; 8-byte Folded Reload
	.loc	0 148 11                        ; src/vm.c:148:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 150 3 is_stmt 1               ; src/vm.c:150:3
	b	LBB3_5
LBB3_5:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
Ltmp34:
	.loc	0 150 3                         ; src/vm.c:150:3
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
	.loc	0 150 3                         ; src/vm.c:150:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB3_8
	b	LBB3_7
LBB3_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 150 3                         ; src/vm.c:150:3
	bl	___asan_report_load1
	brk	#0x1
LBB3_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 150 3                         ; src/vm.c:150:3
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
	.loc	0 150 3                         ; src/vm.c:150:3
	bl	___asan_report_load8
	brk	#0x1
LBB3_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 150 3                         ; src/vm.c:150:3
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
	.loc	0 150 3                         ; src/vm.c:150:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB3_13
	b	LBB3_12
LBB3_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 150 3                         ; src/vm.c:150:3
	bl	___asan_report_load1
	brk	#0x1
LBB3_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 150 3                         ; src/vm.c:150:3
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
	.loc	0 150 3                         ; src/vm.c:150:3
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
	.loc	0 150 3                         ; src/vm.c:150:3
	bl	___asan_report_load2
	brk	#0x1
LBB3_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 150 3                         ; src/vm.c:150:3
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
	.loc	0 150 3 epilogue_begin          ; src/vm.c:150:3
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
	.p2align	5                               ; -- Begin function vm_op_Exta
_vm_op_Exta:                            ; @vm_op_Exta
Lfunc_begin4:
	.loc	0 153 0 is_stmt 1               ; src/vm.c:153:0
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
	.loc	0 153 50 prologue_end           ; src/vm.c:153:50
	ldr	x20, [sp, #40]
	ldrh	w0, [sp, #38]
	ldrb	w1, [sp, #37]
	ldr	x21, [sp, #24]
	ldr	x22, [sp, #16]
	ldr	x23, [sp, #8]
	ldr	x24, [sp]
	.loc	0 153 39 epilogue_begin is_stmt 0 ; src/vm.c:153:39
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	b	_unusedexta
Ltmp38:
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_LoadI
_vm_op_LoadI:                           ; @vm_op_LoadI
Lfunc_begin5:
	.loc	0 155 0 is_stmt 1               ; src/vm.c:155:0
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
	.loc	0 156 15 prologue_end           ; src/vm.c:156:15
	ldurb	w9, [x29, #-11]
	.loc	0 156 9 is_stmt 0               ; src/vm.c:156:9
	stur	w9, [x29, #-52]
	.loc	0 158 13 is_stmt 1              ; src/vm.c:158:13
	ldursh	x9, [x29, #-10]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 158 3 is_stmt 0               ; src/vm.c:158:3
	ldur	x9, [x29, #-24]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 158 6                         ; src/vm.c:158:6
	ldur	w10, [x29, #-52]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-104]               ; 8-byte Folded Spill
	.loc	0 158 3                         ; src/vm.c:158:3
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-96]                 ; 8-byte Folded Spill
	.loc	0 158 11                        ; src/vm.c:158:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB5_2
	b	LBB5_1
LBB5_1:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldur	x0, [x29, #-96]                 ; 8-byte Folded Reload
	.loc	0 158 11                        ; src/vm.c:158:11
	bl	___asan_report_store8
	brk	#0x1
LBB5_2:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldur	x10, [x29, #-104]               ; 8-byte Folded Reload
	.loc	0 158 11                        ; src/vm.c:158:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 160 3 is_stmt 1               ; src/vm.c:160:3
	b	LBB5_3
LBB5_3:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp40:
	.loc	0 160 3                         ; src/vm.c:160:3
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
	.loc	0 160 3                         ; src/vm.c:160:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB5_6
	b	LBB5_5
LBB5_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 160 3                         ; src/vm.c:160:3
	bl	___asan_report_load1
	brk	#0x1
LBB5_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 160 3                         ; src/vm.c:160:3
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
	.loc	0 160 3                         ; src/vm.c:160:3
	bl	___asan_report_load8
	brk	#0x1
LBB5_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 160 3                         ; src/vm.c:160:3
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
	.loc	0 160 3                         ; src/vm.c:160:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB5_11
	b	LBB5_10
LBB5_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 160 3                         ; src/vm.c:160:3
	bl	___asan_report_load1
	brk	#0x1
LBB5_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 160 3                         ; src/vm.c:160:3
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
	.loc	0 160 3                         ; src/vm.c:160:3
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
	.loc	0 160 3                         ; src/vm.c:160:3
	bl	___asan_report_load2
	brk	#0x1
LBB5_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 160 3                         ; src/vm.c:160:3
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
	.loc	0 160 3 epilogue_begin          ; src/vm.c:160:3
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
	.p2align	5                               ; -- Begin function vm_op_LoaduI
_vm_op_LoaduI:                          ; @vm_op_LoaduI
Lfunc_begin6:
	.loc	0 163 0 is_stmt 1               ; src/vm.c:163:0
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
	.loc	0 164 15 prologue_end           ; src/vm.c:164:15
	ldurb	w9, [x29, #-11]
	.loc	0 164 9 is_stmt 0               ; src/vm.c:164:9
	stur	w9, [x29, #-52]
	.loc	0 166 13 is_stmt 1              ; src/vm.c:166:13
	ldurh	w9, [x29, #-10]
                                        ; kill: def $x9 killed $w9
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 166 3 is_stmt 0               ; src/vm.c:166:3
	ldur	x9, [x29, #-24]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 166 6                         ; src/vm.c:166:6
	ldur	w10, [x29, #-52]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-104]               ; 8-byte Folded Spill
	.loc	0 166 3                         ; src/vm.c:166:3
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-96]                 ; 8-byte Folded Spill
	.loc	0 166 11                        ; src/vm.c:166:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB6_2
	b	LBB6_1
LBB6_1:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldur	x0, [x29, #-96]                 ; 8-byte Folded Reload
	.loc	0 166 11                        ; src/vm.c:166:11
	bl	___asan_report_store8
	brk	#0x1
LBB6_2:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldur	x10, [x29, #-104]               ; 8-byte Folded Reload
	.loc	0 166 11                        ; src/vm.c:166:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 168 3 is_stmt 1               ; src/vm.c:168:3
	b	LBB6_3
LBB6_3:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp43:
	.loc	0 168 3                         ; src/vm.c:168:3
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
	.loc	0 168 3                         ; src/vm.c:168:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB6_6
	b	LBB6_5
LBB6_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 168 3                         ; src/vm.c:168:3
	bl	___asan_report_load1
	brk	#0x1
LBB6_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 168 3                         ; src/vm.c:168:3
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
	.loc	0 168 3                         ; src/vm.c:168:3
	bl	___asan_report_load8
	brk	#0x1
LBB6_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 168 3                         ; src/vm.c:168:3
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
	.loc	0 168 3                         ; src/vm.c:168:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB6_11
	b	LBB6_10
LBB6_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 168 3                         ; src/vm.c:168:3
	bl	___asan_report_load1
	brk	#0x1
LBB6_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 168 3                         ; src/vm.c:168:3
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
	.loc	0 168 3                         ; src/vm.c:168:3
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
	.loc	0 168 3                         ; src/vm.c:168:3
	bl	___asan_report_load2
	brk	#0x1
LBB6_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 168 3                         ; src/vm.c:168:3
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
	.loc	0 168 3 epilogue_begin          ; src/vm.c:168:3
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
	.p2align	5                               ; -- Begin function vm_op_LoadC
_vm_op_LoadC:                           ; @vm_op_LoadC
Lfunc_begin7:
	.loc	0 171 0 is_stmt 1               ; src/vm.c:171:0
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
Ltmp45:
	.loc	0 172 15 prologue_end           ; src/vm.c:172:15
	ldurb	w9, [x29, #-19]
	.loc	0 172 9 is_stmt 0               ; src/vm.c:172:9
	stur	w9, [x29, #-60]
	.loc	0 173 15 is_stmt 1              ; src/vm.c:173:15
	ldurh	w9, [x29, #-18]
                                        ; kill: def $x9 killed $w9
	.loc	0 173 9 is_stmt 0               ; src/vm.c:173:9
	stur	x9, [x29, #-72]
	.loc	0 175 13 is_stmt 1              ; src/vm.c:175:13
	ldur	x9, [x29, #-40]
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	.loc	0 175 20 is_stmt 0              ; src/vm.c:175:20
	add	x9, x9, #40
	stur	x9, [x29, #-112]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB7_2
	b	LBB7_1
LBB7_1:
	.loc	0 0 20                          ; src/vm.c:0:20
	ldur	x0, [x29, #-112]                ; 8-byte Folded Reload
	.loc	0 175 20                        ; src/vm.c:175:20
	bl	___asan_report_load8
	brk	#0x1
LBB7_2:
	.loc	0 0 20                          ; src/vm.c:0:20
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 175 20                        ; src/vm.c:175:20
	ldr	x9, [x9, #40]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	.loc	0 175 25                        ; src/vm.c:175:25
	ldur	x10, [x29, #-72]
	str	x10, [sp, #144]                 ; 8-byte Folded Spill
	.loc	0 175 13                        ; src/vm.c:175:13
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-136]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB7_4
	b	LBB7_3
LBB7_3:
	.loc	0 0 13                          ; src/vm.c:0:13
	ldur	x0, [x29, #-136]                ; 8-byte Folded Reload
	.loc	0 175 13                        ; src/vm.c:175:13
	bl	___asan_report_load8
	brk	#0x1
LBB7_4:
	.loc	0 0 13                          ; src/vm.c:0:13
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldr	x9, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #144]                 ; 8-byte Folded Reload
	.loc	0 175 13                        ; src/vm.c:175:13
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 175 3                         ; src/vm.c:175:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 175 6                         ; src/vm.c:175:6
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #120]                 ; 8-byte Folded Spill
	.loc	0 175 3                         ; src/vm.c:175:3
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 175 11                        ; src/vm.c:175:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB7_6
	b	LBB7_5
LBB7_5:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 175 11                        ; src/vm.c:175:11
	bl	___asan_report_store8
	brk	#0x1
LBB7_6:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #120]                 ; 8-byte Folded Reload
	.loc	0 175 11                        ; src/vm.c:175:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 177 3 is_stmt 1               ; src/vm.c:177:3
	b	LBB7_7
LBB7_7:                                 ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
Ltmp46:
	.loc	0 177 3                         ; src/vm.c:177:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-80]
	ldur	x9, [x29, #-80]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB7_10
	b	LBB7_8
LBB7_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB7_10
	b	LBB7_9
LBB7_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	bl	___asan_report_load1
	brk	#0x1
LBB7_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
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
	cbz	w8, LBB7_12
	b	LBB7_11
LBB7_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	bl	___asan_report_load8
	brk	#0x1
LBB7_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-96]
	ldur	x9, [x29, #-80]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB7_15
	b	LBB7_13
LBB7_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB7_15
	b	LBB7_14
LBB7_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	bl	___asan_report_load1
	brk	#0x1
LBB7_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-128]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-80]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB7_18
	b	LBB7_16
LBB7_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB7_18
	b	LBB7_17
LBB7_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
	bl	___asan_report_load2
	brk	#0x1
LBB7_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 177 3                         ; src/vm.c:177:3
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
	.loc	0 177 3 epilogue_begin          ; src/vm.c:177:3
	ldp	x29, x30, [sp, #288]            ; 16-byte Folded Reload
	add	sp, sp, #304
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp47:
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Apply
_vm_op_Apply:                           ; @vm_op_Apply
Lfunc_begin8:
	.loc	0 180 0 is_stmt 1               ; src/vm.c:180:0
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
Ltmp48:
	.loc	0 181 17 prologue_end           ; src/vm.c:181:17
	ldurb	w9, [x29, #-19]
	.loc	0 181 9 is_stmt 0               ; src/vm.c:181:9
	stur	w9, [x29, #-60]
	.loc	0 183 26 is_stmt 1              ; src/vm.c:183:26
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-144]                ; 8-byte Folded Spill
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-136]               ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-128]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB8_2
	b	LBB8_1
LBB8_1:
	.loc	0 0 26 is_stmt 0                ; src/vm.c:0:26
	ldur	x0, [x29, #-128]                ; 8-byte Folded Reload
	.loc	0 183 26                        ; src/vm.c:183:26
	bl	___asan_report_load8
	brk	#0x1
LBB8_2:
	.loc	0 0 26                          ; src/vm.c:0:26
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-144]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-136]               ; 8-byte Folded Reload
	.loc	0 183 26                        ; src/vm.c:183:26
	ldr	x9, [x9, x10, lsl #3]
	.loc	0 183 19                        ; src/vm.c:183:19
	stur	x9, [x29, #-72]
	.loc	0 184 25 is_stmt 1              ; src/vm.c:184:25
	ldur	x9, [x29, #-72]
	stur	x9, [x29, #-168]                ; 8-byte Folded Spill
	add	x9, x9, #8
	stur	x9, [x29, #-160]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB8_4
	b	LBB8_3
LBB8_3:
	.loc	0 0 25 is_stmt 0                ; src/vm.c:0:25
	ldur	x0, [x29, #-160]                ; 8-byte Folded Reload
	.loc	0 184 25                        ; src/vm.c:184:25
	bl	___asan_report_load8
	brk	#0x1
LBB8_4:
	.loc	0 0 25                          ; src/vm.c:0:25
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-168]                ; 8-byte Folded Reload
	.loc	0 184 25                        ; src/vm.c:184:25
	ldr	x9, [x9, #8]
	.loc	0 184 20                        ; src/vm.c:184:20
	stur	x9, [x29, #-80]
	.loc	0 186 17 is_stmt 1              ; src/vm.c:186:17
	ldur	x9, [x29, #-16]
	.loc	0 186 9 is_stmt 0               ; src/vm.c:186:9
	stur	x9, [x29, #-88]
	.loc	0 187 8 is_stmt 1               ; src/vm.c:187:8
	ldur	x9, [x29, #-80]
	.loc	0 187 12 is_stmt 0              ; src/vm.c:187:12
	add	x9, x9, #8
	.loc	0 187 6                         ; src/vm.c:187:6
	stur	x9, [x29, #-16]
	.loc	0 189 8 is_stmt 1               ; src/vm.c:189:8
	ldur	x9, [x29, #-32]
	add	x9, x9, #16
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	add	x9, x9, x10, lsl #3
	.loc	0 189 6 is_stmt 0               ; src/vm.c:189:6
	stur	x9, [x29, #-32]
Ltmp49:
	.loc	0 190 7 is_stmt 1               ; src/vm.c:190:7
	ldur	x9, [x29, #-32]
	str	x9, [sp, #176]                  ; 8-byte Folded Spill
	ldur	x9, [x29, #-40]
	str	x9, [sp, #184]                  ; 8-byte Folded Spill
	add	x9, x9, #56
	stur	x9, [x29, #-176]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB8_6
	b	LBB8_5
LBB8_5:
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x0, [x29, #-176]                ; 8-byte Folded Reload
	.loc	0 190 7                         ; src/vm.c:190:7
	bl	___asan_report_load8
	brk	#0x1
LBB8_6:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldr	x8, [sp, #176]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #184]                  ; 8-byte Folded Reload
	.loc	0 190 7                         ; src/vm.c:190:7
	ldr	x9, [x9, #56]
	subs	x8, x8, x9
	cset	w8, hs
Ltmp50:
	.loc	0 190 7                         ; src/vm.c:190:7
	tbz	w8, #0, LBB8_8
	b	LBB8_7
LBB8_7:                                 ; %if.then
Ltmp51:
	.loc	0 191 35 is_stmt 1              ; src/vm.c:191:35
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 384
	.loc	0 191 21 epilogue_begin is_stmt 0 ; src/vm.c:191:21
	ldp	x29, x30, [sp, #368]            ; 16-byte Folded Reload
	add	sp, sp, #384
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_stackoverflow
Ltmp52:
LBB8_8:                                 ; %if.end
	.cfi_restore_state
	.loc	0 0 21                          ; src/vm.c:0:21
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	.loc	0 194 18 is_stmt 1              ; src/vm.c:194:18
	ldur	x9, [x29, #-80]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	.loc	0 194 3 is_stmt 0               ; src/vm.c:194:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	subs	x9, x9, #16
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	.loc	0 194 16                        ; src/vm.c:194:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB8_10
	b	LBB8_9
LBB8_9:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #168]                  ; 8-byte Folded Reload
	.loc	0 194 16                        ; src/vm.c:194:16
	bl	___asan_report_store8
	brk	#0x1
LBB8_10:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #160]                 ; 8-byte Folded Reload
	.loc	0 194 16                        ; src/vm.c:194:16
	stur	x9, [x10, #-16]
	.loc	0 195 18 is_stmt 1              ; src/vm.c:195:18
	ldur	x9, [x29, #-88]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 195 3 is_stmt 0               ; src/vm.c:195:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 195 16                        ; src/vm.c:195:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB8_12
	b	LBB8_11
LBB8_11:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 195 16                        ; src/vm.c:195:16
	bl	___asan_report_store8
	brk	#0x1
LBB8_12:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #136]                 ; 8-byte Folded Reload
	.loc	0 195 16                        ; src/vm.c:195:16
	stur	x9, [x10, #-8]
	.loc	0 198 11 is_stmt 1              ; src/vm.c:198:11
	ldur	x9, [x29, #-72]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 198 3 is_stmt 0               ; src/vm.c:198:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 198 9                         ; src/vm.c:198:9
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB8_14
	b	LBB8_13
LBB8_13:
	.loc	0 0 9                           ; src/vm.c:0:9
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 198 9                         ; src/vm.c:198:9
	bl	___asan_report_store8
	brk	#0x1
LBB8_14:
	.loc	0 0 9                           ; src/vm.c:0:9
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 198 9                         ; src/vm.c:198:9
	str	x8, [x9]
	.loc	0 200 3 is_stmt 1               ; src/vm.c:200:3
	b	LBB8_15
LBB8_15:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
Ltmp53:
	.loc	0 200 3                         ; src/vm.c:200:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-104]
	ldur	x9, [x29, #-104]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB8_18
	b	LBB8_16
LBB8_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB8_18
	b	LBB8_17
LBB8_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	bl	___asan_report_load1
	brk	#0x1
LBB8_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
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
	cbz	w8, LBB8_20
	b	LBB8_19
LBB8_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	bl	___asan_report_load8
	brk	#0x1
LBB8_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-120]
	ldur	x9, [x29, #-104]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB8_23
	b	LBB8_21
LBB8_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB8_23
	b	LBB8_22
LBB8_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	bl	___asan_report_load1
	brk	#0x1
LBB8_23:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-104]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB8_26
	b	LBB8_24
LBB8_24:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB8_26
	b	LBB8_25
LBB8_25:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
	bl	___asan_report_load2
	brk	#0x1
LBB8_26:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 200 3                         ; src/vm.c:200:3
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
	.loc	0 200 3 epilogue_begin          ; src/vm.c:200:3
	ldp	x29, x30, [sp, #368]            ; 16-byte Folded Reload
	add	sp, sp, #384
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp54:
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Call
_vm_op_Call:                            ; @vm_op_Call
Lfunc_begin9:
	.loc	0 203 0 is_stmt 1               ; src/vm.c:203:0
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
Ltmp55:
	.loc	0 204 15 prologue_end           ; src/vm.c:204:15
	ldurb	w9, [x29, #-19]
	.loc	0 204 9 is_stmt 0               ; src/vm.c:204:9
	stur	w9, [x29, #-60]
	.loc	0 205 14 is_stmt 1              ; src/vm.c:205:14
	ldurb	w9, [x29, #-18]
	.loc	0 205 9 is_stmt 0               ; src/vm.c:205:9
	stur	w9, [x29, #-64]
	.loc	0 207 25 is_stmt 1              ; src/vm.c:207:25
	ldur	x9, [x29, #-56]
	stur	x9, [x29, #-136]                ; 8-byte Folded Spill
	ldur	w10, [x29, #-64]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-128]               ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB9_2
	b	LBB9_1
LBB9_1:
	.loc	0 0 25 is_stmt 0                ; src/vm.c:0:25
	ldur	x0, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 207 25                        ; src/vm.c:207:25
	bl	___asan_report_load8
	brk	#0x1
LBB9_2:
	.loc	0 0 25                          ; src/vm.c:0:25
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-136]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-128]               ; 8-byte Folded Reload
	.loc	0 207 25                        ; src/vm.c:207:25
	ldr	x9, [x9, x10, lsl #3]
	.loc	0 207 20                        ; src/vm.c:207:20
	stur	x9, [x29, #-72]
	.loc	0 209 17 is_stmt 1              ; src/vm.c:209:17
	ldur	x9, [x29, #-16]
	.loc	0 209 9 is_stmt 0               ; src/vm.c:209:9
	stur	x9, [x29, #-80]
	.loc	0 210 8 is_stmt 1               ; src/vm.c:210:8
	ldur	x9, [x29, #-72]
	.loc	0 210 12 is_stmt 0              ; src/vm.c:210:12
	add	x9, x9, #8
	.loc	0 210 6                         ; src/vm.c:210:6
	stur	x9, [x29, #-16]
	.loc	0 212 8 is_stmt 1               ; src/vm.c:212:8
	ldur	x9, [x29, #-32]
	add	x9, x9, #16
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	add	x9, x9, x10, lsl #3
	.loc	0 212 6 is_stmt 0               ; src/vm.c:212:6
	stur	x9, [x29, #-32]
Ltmp56:
	.loc	0 213 7 is_stmt 1               ; src/vm.c:213:7
	ldur	x9, [x29, #-32]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	ldur	x9, [x29, #-40]
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	add	x9, x9, #56
	stur	x9, [x29, #-152]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB9_4
	b	LBB9_3
LBB9_3:
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x0, [x29, #-152]                ; 8-byte Folded Reload
	.loc	0 213 7                         ; src/vm.c:213:7
	bl	___asan_report_load8
	brk	#0x1
LBB9_4:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldr	x8, [sp, #152]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 213 7                         ; src/vm.c:213:7
	ldr	x9, [x9, #56]
	subs	x8, x8, x9
	cset	w8, hs
Ltmp57:
	.loc	0 213 7                         ; src/vm.c:213:7
	tbz	w8, #0, LBB9_6
	b	LBB9_5
LBB9_5:                                 ; %if.then
Ltmp58:
	.loc	0 214 35 is_stmt 1              ; src/vm.c:214:35
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 336
	.loc	0 214 21 epilogue_begin is_stmt 0 ; src/vm.c:214:21
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_stackoverflow
Ltmp59:
LBB9_6:                                 ; %if.end
	.cfi_restore_state
	.loc	0 0 21                          ; src/vm.c:0:21
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	.loc	0 217 18 is_stmt 1              ; src/vm.c:217:18
	ldur	x9, [x29, #-72]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 217 3 is_stmt 0               ; src/vm.c:217:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	subs	x9, x9, #16
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 217 16                        ; src/vm.c:217:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB9_8
	b	LBB9_7
LBB9_7:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 217 16                        ; src/vm.c:217:16
	bl	___asan_report_store8
	brk	#0x1
LBB9_8:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #136]                 ; 8-byte Folded Reload
	.loc	0 217 16                        ; src/vm.c:217:16
	stur	x9, [x10, #-16]
	.loc	0 218 18 is_stmt 1              ; src/vm.c:218:18
	ldur	x9, [x29, #-80]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 218 3 is_stmt 0               ; src/vm.c:218:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 218 16                        ; src/vm.c:218:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB9_10
	b	LBB9_9
LBB9_9:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 218 16                        ; src/vm.c:218:16
	bl	___asan_report_store8
	brk	#0x1
LBB9_10:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 218 16                        ; src/vm.c:218:16
	stur	x8, [x9, #-8]
	.loc	0 220 3 is_stmt 1               ; src/vm.c:220:3
	b	LBB9_11
LBB9_11:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
Ltmp60:
	.loc	0 220 3                         ; src/vm.c:220:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-96]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB9_14
	b	LBB9_12
LBB9_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB9_14
	b	LBB9_13
LBB9_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	bl	___asan_report_load1
	brk	#0x1
LBB9_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
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
	cbz	w8, LBB9_16
	b	LBB9_15
LBB9_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	bl	___asan_report_load8
	brk	#0x1
LBB9_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-112]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB9_19
	b	LBB9_17
LBB9_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB9_19
	b	LBB9_18
LBB9_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	bl	___asan_report_load1
	brk	#0x1
LBB9_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-144]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB9_22
	b	LBB9_20
LBB9_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB9_22
	b	LBB9_21
LBB9_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
	bl	___asan_report_load2
	brk	#0x1
LBB9_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 220 3                         ; src/vm.c:220:3
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
	.loc	0 220 3 epilogue_begin          ; src/vm.c:220:3
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp61:
Lfunc_end9:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Jmp
_vm_op_Jmp:                             ; @vm_op_Jmp
Lfunc_begin10:
	.loc	0 223 0 is_stmt 1               ; src/vm.c:223:0
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
Ltmp62:
	.loc	0 224 19 prologue_end           ; src/vm.c:224:19
	ldursh	x8, [x29, #-10]
	.loc	0 224 10 is_stmt 0              ; src/vm.c:224:10
	stur	x8, [x29, #-56]
	.loc	0 226 8 is_stmt 1               ; src/vm.c:226:8
	ldur	x8, [x29, #-8]
	ldur	x9, [x29, #-56]
	add	x8, x8, x9, lsl #2
	.loc	0 226 6 is_stmt 0               ; src/vm.c:226:6
	stur	x8, [x29, #-8]
	.loc	0 228 3 is_stmt 1               ; src/vm.c:228:3
	b	LBB10_1
LBB10_1:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp63:
	.loc	0 228 3                         ; src/vm.c:228:3
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-64]
	ldur	x9, [x29, #-64]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB10_4
	b	LBB10_2
LBB10_2:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB10_4
	b	LBB10_3
LBB10_3:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	bl	___asan_report_load1
	brk	#0x1
LBB10_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
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
	cbz	w8, LBB10_6
	b	LBB10_5
LBB10_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	bl	___asan_report_load8
	brk	#0x1
LBB10_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-80]
	ldur	x9, [x29, #-64]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB10_9
	b	LBB10_7
LBB10_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB10_9
	b	LBB10_8
LBB10_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	bl	___asan_report_load1
	brk	#0x1
LBB10_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-64]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB10_12
	b	LBB10_10
LBB10_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB10_12
	b	LBB10_11
LBB10_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
	bl	___asan_report_load2
	brk	#0x1
LBB10_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 228 3                         ; src/vm.c:228:3
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
	.loc	0 228 3 epilogue_begin          ; src/vm.c:228:3
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	add	sp, sp, #208
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp64:
Lfunc_end10:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Jr
_vm_op_Jr:                              ; @vm_op_Jr
Lfunc_begin11:
	.loc	0 231 0 is_stmt 1               ; src/vm.c:231:0
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
Ltmp65:
	.loc	0 232 15 prologue_end           ; src/vm.c:232:15
	ldurb	w9, [x29, #-11]
                                        ; kill: def $x9 killed $w9
	.loc	0 232 9 is_stmt 0               ; src/vm.c:232:9
	stur	x9, [x29, #-56]
	.loc	0 233 19 is_stmt 1              ; src/vm.c:233:19
	ldur	x9, [x29, #-24]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	ldur	x10, [x29, #-56]
	str	x10, [sp, #112]                 ; 8-byte Folded Spill
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-104]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB11_2
	b	LBB11_1
LBB11_1:
	.loc	0 0 19 is_stmt 0                ; src/vm.c:0:19
	ldur	x0, [x29, #-104]                ; 8-byte Folded Reload
	.loc	0 233 19                        ; src/vm.c:233:19
	bl	___asan_report_load8
	brk	#0x1
LBB11_2:
	.loc	0 0 19                          ; src/vm.c:0:19
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 233 19                        ; src/vm.c:233:19
	ldr	x8, [x8, x9, lsl #3]
	.loc	0 233 10                        ; src/vm.c:233:10
	stur	x8, [x29, #-64]
	.loc	0 235 8 is_stmt 1               ; src/vm.c:235:8
	ldur	x8, [x29, #-8]
	ldur	x9, [x29, #-64]
	add	x8, x8, x9, lsl #2
	.loc	0 235 6 is_stmt 0               ; src/vm.c:235:6
	stur	x8, [x29, #-8]
	.loc	0 237 3 is_stmt 1               ; src/vm.c:237:3
	b	LBB11_3
LBB11_3:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp66:
	.loc	0 237 3                         ; src/vm.c:237:3
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-72]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB11_6
	b	LBB11_4
LBB11_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB11_6
	b	LBB11_5
LBB11_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	bl	___asan_report_load1
	brk	#0x1
LBB11_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
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
	cbz	w8, LBB11_8
	b	LBB11_7
LBB11_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	bl	___asan_report_load8
	brk	#0x1
LBB11_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB11_11
	b	LBB11_9
LBB11_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB11_11
	b	LBB11_10
LBB11_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	bl	___asan_report_load1
	brk	#0x1
LBB11_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-72]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB11_14
	b	LBB11_12
LBB11_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB11_14
	b	LBB11_13
LBB11_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
	bl	___asan_report_load2
	brk	#0x1
LBB11_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 237 3                         ; src/vm.c:237:3
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
	.loc	0 237 3 epilogue_begin          ; src/vm.c:237:3
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #240
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp67:
Lfunc_end11:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Disp
_vm_op_Disp:                            ; @vm_op_Disp
Lfunc_begin12:
	.loc	0 240 0 is_stmt 1               ; src/vm.c:240:0
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
Ltmp68:
	.loc	0 241 22 prologue_end           ; src/vm.c:241:22
	ldurb	w9, [x29, #-11]
	.loc	0 241 9 is_stmt 0               ; src/vm.c:241:9
	stur	w9, [x29, #-52]
	.loc	0 242 18 is_stmt 1              ; src/vm.c:242:18
	ldursh	w9, [x29, #-10]
	.loc	0 242 11 is_stmt 0              ; src/vm.c:242:11
	stur	w9, [x29, #-56]
	.loc	0 244 17 is_stmt 1              ; src/vm.c:244:17
	ldur	x9, [x29, #-24]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 244 20 is_stmt 0              ; src/vm.c:244:20
	ldur	w10, [x29, #-52]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #112]                 ; 8-byte Folded Spill
	.loc	0 244 17                        ; src/vm.c:244:17
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-104]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB12_2
	b	LBB12_1
LBB12_1:
	.loc	0 0 17                          ; src/vm.c:0:17
	ldur	x0, [x29, #-104]                ; 8-byte Folded Reload
	.loc	0 244 17                        ; src/vm.c:244:17
	bl	___asan_report_load8
	brk	#0x1
LBB12_2:
	.loc	0 0 17                          ; src/vm.c:0:17
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 244 17                        ; src/vm.c:244:17
	ldr	x8, [x8, x9, lsl #3]
	.loc	0 244 34                        ; src/vm.c:244:34
	ldursw	x9, [x29, #-56]
	.loc	0 244 32                        ; src/vm.c:244:32
	add	x8, x8, x9
                                        ; kill: def $w8 killed $w8 killed $x8
	.loc	0 244 9                         ; src/vm.c:244:9
	stur	w8, [x29, #-60]
	.loc	0 245 8 is_stmt 1               ; src/vm.c:245:8
	ldur	x8, [x29, #-8]
	ldur	w9, [x29, #-60]
                                        ; kill: def $x9 killed $w9
	add	x8, x8, x9, lsl #2
	.loc	0 245 6 is_stmt 0               ; src/vm.c:245:6
	stur	x8, [x29, #-8]
	.loc	0 247 3 is_stmt 1               ; src/vm.c:247:3
	b	LBB12_3
LBB12_3:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
Ltmp69:
	.loc	0 247 3                         ; src/vm.c:247:3
	ldur	x9, [x29, #-8]
	stur	x9, [x29, #-72]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB12_6
	b	LBB12_4
LBB12_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB12_6
	b	LBB12_5
LBB12_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	bl	___asan_report_load1
	brk	#0x1
LBB12_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
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
	cbz	w8, LBB12_8
	b	LBB12_7
LBB12_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	bl	___asan_report_load8
	brk	#0x1
LBB12_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-72]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB12_11
	b	LBB12_9
LBB12_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB12_11
	b	LBB12_10
LBB12_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	bl	___asan_report_load1
	brk	#0x1
LBB12_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-11]
	ldur	x9, [x29, #-72]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB12_14
	b	LBB12_12
LBB12_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB12_14
	b	LBB12_13
LBB12_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
	bl	___asan_report_load2
	brk	#0x1
LBB12_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 247 3                         ; src/vm.c:247:3
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
	.loc	0 247 3 epilogue_begin          ; src/vm.c:247:3
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #240
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp70:
Lfunc_end12:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Retu
_vm_op_Retu:                            ; @vm_op_Retu
Lfunc_begin13:
	.loc	0 250 0 is_stmt 1               ; src/vm.c:250:0
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
Ltmp71:
	.loc	0 251 3 prologue_end            ; src/vm.c:251:3
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-128]                ; 8-byte Folded Spill
	subs	x9, x9, #16
	stur	x9, [x29, #-120]                ; 8-byte Folded Spill
	.loc	0 251 16 is_stmt 0              ; src/vm.c:251:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB13_2
	b	LBB13_1
LBB13_1:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x0, [x29, #-120]                ; 8-byte Folded Reload
	.loc	0 251 16                        ; src/vm.c:251:16
	bl	___asan_report_store8
	brk	#0x1
LBB13_2:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldur	x9, [x29, #-128]                ; 8-byte Folded Reload
	.loc	0 251 16                        ; src/vm.c:251:16
	stur	xzr, [x9, #-16]
	.loc	0 253 14 is_stmt 1              ; src/vm.c:253:14
	ldur	x9, [x29, #-32]
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB13_4
	b	LBB13_3
LBB13_3:
	.loc	0 0 14 is_stmt 0                ; src/vm.c:0:14
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 253 14                        ; src/vm.c:253:14
	bl	___asan_report_load8
	brk	#0x1
LBB13_4:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #120]                  ; 8-byte Folded Reload
	.loc	0 253 14                        ; src/vm.c:253:14
	ldur	x9, [x9, #-8]
	.loc	0 253 9                         ; src/vm.c:253:9
	stur	x9, [x29, #-64]
	.loc	0 255 3 is_stmt 1               ; src/vm.c:255:3
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
	cbz	w8, LBB13_7
	b	LBB13_5
LBB13_5:
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	w8, [sp, #116]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 255 3                         ; src/vm.c:255:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB13_7
	b	LBB13_6
LBB13_6:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 255 3                         ; src/vm.c:255:3
	bl	___asan_report_load1
	brk	#0x1
LBB13_7:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 255 3                         ; src/vm.c:255:3
	ldrb	w8, [x8, #1]
	stur	w8, [x29, #-76]
	.loc	0 257 8 is_stmt 1               ; src/vm.c:257:8
	ldur	x8, [x29, #-32]
	subs	x8, x8, #16
	ldur	w9, [x29, #-76]
	mov	x10, x9
	mov	x9, #0                          ; =0x0
	subs	x9, x9, x10
	add	x8, x8, x9, lsl #3
	.loc	0 257 6 is_stmt 0               ; src/vm.c:257:6
	stur	x8, [x29, #-32]
	.loc	0 258 8 is_stmt 1               ; src/vm.c:258:8
	ldur	x8, [x29, #-64]
	.loc	0 258 6 is_stmt 0               ; src/vm.c:258:6
	stur	x8, [x29, #-16]
	.loc	0 260 3 is_stmt 1               ; src/vm.c:260:3
	b	LBB13_8
LBB13_8:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
Ltmp72:
	.loc	0 260 3                         ; src/vm.c:260:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-88]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB13_11
	b	LBB13_9
LBB13_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB13_11
	b	LBB13_10
LBB13_10:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	bl	___asan_report_load1
	brk	#0x1
LBB13_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
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
	cbz	w8, LBB13_13
	b	LBB13_12
LBB13_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	bl	___asan_report_load8
	brk	#0x1
LBB13_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-104]
	ldur	x9, [x29, #-88]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB13_16
	b	LBB13_14
LBB13_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB13_16
	b	LBB13_15
LBB13_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	bl	___asan_report_load1
	brk	#0x1
LBB13_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-88]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB13_19
	b	LBB13_17
LBB13_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB13_19
	b	LBB13_18
LBB13_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
	bl	___asan_report_load2
	brk	#0x1
LBB13_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 260 3                         ; src/vm.c:260:3
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
	.loc	0 260 3 epilogue_begin          ; src/vm.c:260:3
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	add	sp, sp, #288
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp73:
Lfunc_end13:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Ret
_vm_op_Ret:                             ; @vm_op_Ret
Lfunc_begin14:
	.loc	0 263 0 is_stmt 1               ; src/vm.c:263:0
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
Ltmp74:
	.loc	0 264 14 prologue_end           ; src/vm.c:264:14
	ldurb	w9, [x29, #-19]
	.loc	0 264 9 is_stmt 0               ; src/vm.c:264:9
	stur	w9, [x29, #-60]
	.loc	0 266 18 is_stmt 1              ; src/vm.c:266:18
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-144]                ; 8-byte Folded Spill
	.loc	0 266 21 is_stmt 0              ; src/vm.c:266:21
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	stur	x10, [x29, #-136]               ; 8-byte Folded Spill
	.loc	0 266 18                        ; src/vm.c:266:18
	add	x9, x9, x10, lsl #3
	stur	x9, [x29, #-128]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB14_2
	b	LBB14_1
LBB14_1:
	.loc	0 0 18                          ; src/vm.c:0:18
	ldur	x0, [x29, #-128]                ; 8-byte Folded Reload
	.loc	0 266 18                        ; src/vm.c:266:18
	bl	___asan_report_load8
	brk	#0x1
LBB14_2:
	.loc	0 0 18                          ; src/vm.c:0:18
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-144]                ; 8-byte Folded Reload
	ldur	x10, [x29, #-136]               ; 8-byte Folded Reload
	.loc	0 266 18                        ; src/vm.c:266:18
	ldr	x9, [x9, x10, lsl #3]
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 266 3                         ; src/vm.c:266:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	subs	x9, x9, #16
	str	x9, [sp, #160]                  ; 8-byte Folded Spill
	.loc	0 266 16                        ; src/vm.c:266:16
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB14_4
	b	LBB14_3
LBB14_3:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 266 16                        ; src/vm.c:266:16
	bl	___asan_report_store8
	brk	#0x1
LBB14_4:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #152]                 ; 8-byte Folded Reload
	.loc	0 266 16                        ; src/vm.c:266:16
	stur	x9, [x10, #-16]
	.loc	0 268 14 is_stmt 1              ; src/vm.c:268:14
	ldur	x9, [x29, #-32]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	subs	x9, x9, #8
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB14_6
	b	LBB14_5
LBB14_5:
	.loc	0 0 14 is_stmt 0                ; src/vm.c:0:14
	ldr	x0, [sp, #136]                  ; 8-byte Folded Reload
	.loc	0 268 14                        ; src/vm.c:268:14
	bl	___asan_report_load8
	brk	#0x1
LBB14_6:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 268 14                        ; src/vm.c:268:14
	ldur	x9, [x9, #-8]
	.loc	0 268 9                         ; src/vm.c:268:9
	stur	x9, [x29, #-72]
	.loc	0 270 3 is_stmt 1               ; src/vm.c:270:3
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
	cbz	w8, LBB14_9
	b	LBB14_7
LBB14_7:
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	w8, [sp, #124]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 270 3                         ; src/vm.c:270:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB14_9
	b	LBB14_8
LBB14_8:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #112]                  ; 8-byte Folded Reload
	.loc	0 270 3                         ; src/vm.c:270:3
	bl	___asan_report_load1
	brk	#0x1
LBB14_9:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 270 3                         ; src/vm.c:270:3
	ldrb	w8, [x8, #1]
	stur	w8, [x29, #-84]
	.loc	0 272 8 is_stmt 1               ; src/vm.c:272:8
	ldur	x8, [x29, #-32]
	subs	x8, x8, #16
	ldur	w9, [x29, #-84]
	mov	x10, x9
	mov	x9, #0                          ; =0x0
	subs	x9, x9, x10
	add	x8, x8, x9, lsl #3
	.loc	0 272 6 is_stmt 0               ; src/vm.c:272:6
	stur	x8, [x29, #-32]
	.loc	0 273 8 is_stmt 1               ; src/vm.c:273:8
	ldur	x8, [x29, #-72]
	.loc	0 273 6 is_stmt 0               ; src/vm.c:273:6
	stur	x8, [x29, #-16]
	.loc	0 275 3 is_stmt 1               ; src/vm.c:275:3
	b	LBB14_10
LBB14_10:                               ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
Ltmp75:
	.loc	0 275 3                         ; src/vm.c:275:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-96]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB14_13
	b	LBB14_11
LBB14_11:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB14_13
	b	LBB14_12
LBB14_12:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	bl	___asan_report_load1
	brk	#0x1
LBB14_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
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
	cbz	w8, LBB14_15
	b	LBB14_14
LBB14_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	bl	___asan_report_load8
	brk	#0x1
LBB14_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-112]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB14_18
	b	LBB14_16
LBB14_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB14_18
	b	LBB14_17
LBB14_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	bl	___asan_report_load1
	brk	#0x1
LBB14_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-96]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB14_21
	b	LBB14_19
LBB14_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB14_21
	b	LBB14_20
LBB14_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
	bl	___asan_report_load2
	brk	#0x1
LBB14_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 275 3                         ; src/vm.c:275:3
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
	.loc	0 275 3 epilogue_begin          ; src/vm.c:275:3
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp76:
Lfunc_end14:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Retn
_vm_op_Retn:                            ; @vm_op_Retn
Lfunc_begin15:
	.loc	0 278 0 is_stmt 1               ; src/vm.c:278:0
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
Ltmp77:
	.loc	0 279 14 prologue_end           ; src/vm.c:279:14
	ldurb	w9, [x29, #-19]
	.loc	0 279 9 is_stmt 0               ; src/vm.c:279:9
	stur	w9, [x29, #-60]
	.loc	0 280 17 is_stmt 1              ; src/vm.c:280:17
	ldurh	w9, [x29, #-18]
	.loc	0 280 9 is_stmt 0               ; src/vm.c:280:9
	stur	w9, [x29, #-64]
	.loc	0 282 14 is_stmt 1              ; src/vm.c:282:14
	ldur	x9, [x29, #-32]
	stur	x9, [x29, #-152]                ; 8-byte Folded Spill
	subs	x9, x9, #8
	stur	x9, [x29, #-144]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB15_2
	b	LBB15_1
LBB15_1:
	.loc	0 0 14 is_stmt 0                ; src/vm.c:0:14
	ldur	x0, [x29, #-144]                ; 8-byte Folded Reload
	.loc	0 282 14                        ; src/vm.c:282:14
	bl	___asan_report_load8
	brk	#0x1
LBB15_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	.loc	0 282 14                        ; src/vm.c:282:14
	ldur	x8, [x8, #-8]
	.loc	0 282 9                         ; src/vm.c:282:9
	stur	x8, [x29, #-72]
	.loc	0 284 17 is_stmt 1              ; src/vm.c:284:17
	ldur	x8, [x29, #-32]
	subs	x8, x8, #16
	.loc	0 284 10 is_stmt 0              ; src/vm.c:284:10
	stur	x8, [x29, #-80]
Ltmp78:
	.loc	0 286 14 is_stmt 1              ; src/vm.c:286:14
	stur	wzr, [x29, #-84]
	.loc	0 286 8 is_stmt 0               ; src/vm.c:286:8
	b	LBB15_3
LBB15_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
Ltmp79:
	.loc	0 286 21                        ; src/vm.c:286:21
	ldur	w8, [x29, #-84]
	.loc	0 286 25                        ; src/vm.c:286:25
	ldur	w9, [x29, #-64]
Ltmp80:
	.loc	0 286 3                         ; src/vm.c:286:3
	subs	w8, w8, w9
	b.lo	LBB15_5
	b	LBB15_4
LBB15_4:                                ; %for.cond.cleanup
	.loc	0 0 3                           ; src/vm.c:0:3
	b	LBB15_11
LBB15_5:                                ; %for.body
                                        ;   in Loop: Header=BB15_3 Depth=1
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
Ltmp81:
	.loc	0 287 14 is_stmt 1              ; src/vm.c:287:14
	ldur	x9, [x29, #-32]
	str	x9, [sp, #152]                  ; 8-byte Folded Spill
	.loc	0 287 17 is_stmt 0              ; src/vm.c:287:17
	ldur	w10, [x29, #-60]
	.loc	0 287 22                        ; src/vm.c:287:22
	ldur	w11, [x29, #-84]
	.loc	0 287 20                        ; src/vm.c:287:20
	add	w10, w10, w11
	str	w10, [sp, #164]                 ; 4-byte Folded Spill
	.loc	0 287 14                        ; src/vm.c:287:14
	add	x9, x9, w10, uxtw #3
	str	x9, [sp, #168]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB15_7
	b	LBB15_6
LBB15_6:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #168]                  ; 8-byte Folded Reload
	.loc	0 287 14                        ; src/vm.c:287:14
	bl	___asan_report_load8
	brk	#0x1
LBB15_7:                                ;   in Loop: Header=BB15_3 Depth=1
	.loc	0 0 14                          ; src/vm.c:0:14
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	ldr	x9, [sp, #152]                  ; 8-byte Folded Reload
	ldr	w10, [sp, #164]                 ; 4-byte Folded Reload
	.loc	0 287 14                        ; src/vm.c:287:14
	ldr	x9, [x9, w10, uxtw #3]
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	.loc	0 287 5                         ; src/vm.c:287:5
	ldur	x9, [x29, #-80]
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 287 9                         ; src/vm.c:287:9
	ldur	w10, [x29, #-84]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #136]                 ; 8-byte Folded Spill
	.loc	0 287 5                         ; src/vm.c:287:5
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	.loc	0 287 12                        ; src/vm.c:287:12
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB15_9
	b	LBB15_8
LBB15_8:
	.loc	0 0 12                          ; src/vm.c:0:12
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 287 12                        ; src/vm.c:287:12
	bl	___asan_report_store8
	brk	#0x1
LBB15_9:                                ;   in Loop: Header=BB15_3 Depth=1
	.loc	0 0 12                          ; src/vm.c:0:12
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #128]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #136]                 ; 8-byte Folded Reload
	.loc	0 287 12                        ; src/vm.c:287:12
	str	x8, [x9, x10, lsl #3]
	.loc	0 287 5                         ; src/vm.c:287:5
	b	LBB15_10
LBB15_10:                               ; %for.inc
                                        ;   in Loop: Header=BB15_3 Depth=1
	.loc	0 286 33 is_stmt 1              ; src/vm.c:286:33
	ldur	w8, [x29, #-84]
	add	w8, w8, #1
	stur	w8, [x29, #-84]
	.loc	0 286 3 is_stmt 0               ; src/vm.c:286:3
	b	LBB15_3
Ltmp82:
LBB15_11:                               ; %for.end
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	.loc	0 289 3 is_stmt 1               ; src/vm.c:289:3
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
	cbz	w8, LBB15_14
	b	LBB15_12
LBB15_12:
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	w8, [sp, #116]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB15_14
	b	LBB15_13
LBB15_13:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #104]                  ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	bl	___asan_report_load1
	brk	#0x1
LBB15_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	.loc	0 289 3                         ; src/vm.c:289:3
	ldrb	w8, [x8, #1]
	stur	w8, [x29, #-100]
	.loc	0 291 8 is_stmt 1               ; src/vm.c:291:8
	ldur	x8, [x29, #-32]
	subs	x8, x8, #16
	ldur	w9, [x29, #-100]
	mov	x10, x9
	mov	x9, #0                          ; =0x0
	subs	x9, x9, x10
	add	x8, x8, x9, lsl #3
	.loc	0 291 6 is_stmt 0               ; src/vm.c:291:6
	stur	x8, [x29, #-32]
	.loc	0 292 8 is_stmt 1               ; src/vm.c:292:8
	ldur	x8, [x29, #-72]
	.loc	0 292 6 is_stmt 0               ; src/vm.c:292:6
	stur	x8, [x29, #-16]
	.loc	0 294 3 is_stmt 1               ; src/vm.c:294:3
	b	LBB15_15
LBB15_15:                               ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
Ltmp83:
	.loc	0 294 3                         ; src/vm.c:294:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-112]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #92]                   ; 4-byte Folded Spill
	cbz	w8, LBB15_18
	b	LBB15_16
LBB15_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #92]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB15_18
	b	LBB15_17
LBB15_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	bl	___asan_report_load1
	brk	#0x1
LBB15_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
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
	cbz	w8, LBB15_20
	b	LBB15_19
LBB15_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #64]                   ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	bl	___asan_report_load8
	brk	#0x1
LBB15_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-128]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	w8, LBB15_23
	b	LBB15_21
LBB15_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB15_23
	b	LBB15_22
LBB15_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	bl	___asan_report_load1
	brk	#0x1
LBB15_23:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldur	x8, [x29, #-160]                ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-112]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	cbz	w8, LBB15_26
	b	LBB15_24
LBB15_24:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB15_26
	b	LBB15_25
LBB15_25:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
	bl	___asan_report_load2
	brk	#0x1
LBB15_26:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	.loc	0 294 3                         ; src/vm.c:294:3
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
	.loc	0 294 3 epilogue_begin          ; src/vm.c:294:3
	ldp	x29, x30, [sp, #336]            ; 16-byte Folded Reload
	add	sp, sp, #352
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp84:
Lfunc_end15:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_MkObj
_vm_op_MkObj:                           ; @vm_op_MkObj
Lfunc_begin16:
	.loc	0 297 0 is_stmt 1               ; src/vm.c:297:0
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
Ltmp85:
	.loc	0 298 15 prologue_end           ; src/vm.c:298:15
	ldurb	w9, [x29, #-19]
	.loc	0 298 9 is_stmt 0               ; src/vm.c:298:9
	stur	w9, [x29, #-60]
	.loc	0 299 18 is_stmt 1              ; src/vm.c:299:18
	ldurh	w9, [x29, #-18]
	.loc	0 299 9 is_stmt 0               ; src/vm.c:299:9
	stur	w9, [x29, #-64]
Ltmp86:
	.loc	0 301 7 is_stmt 1               ; src/vm.c:301:7
	ldur	w9, [x29, #-64]
                                        ; kill: def $x9 killed $w9
	stur	x9, [x29, #-152]                ; 8-byte Folded Spill
	ldur	x9, [x29, #-40]
	stur	x9, [x29, #-144]                ; 8-byte Folded Spill
	add	x9, x9, #32
	stur	x9, [x29, #-136]                ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB16_2
	b	LBB16_1
LBB16_1:
	.loc	0 0 7 is_stmt 0                 ; src/vm.c:0:7
	ldur	x0, [x29, #-136]                ; 8-byte Folded Reload
	.loc	0 301 7                         ; src/vm.c:301:7
	bl	___asan_report_load8
	brk	#0x1
LBB16_2:
	.loc	0 0 7                           ; src/vm.c:0:7
	ldur	x8, [x29, #-152]                ; 8-byte Folded Reload
	ldur	x9, [x29, #-144]                ; 8-byte Folded Reload
	.loc	0 301 7                         ; src/vm.c:301:7
	ldr	x9, [x9, #32]
	subs	x8, x8, x9
	cset	w8, hi
Ltmp87:
	.loc	0 301 7                         ; src/vm.c:301:7
	tbz	w8, #0, LBB16_4
	b	LBB16_3
LBB16_3:                                ; %if.then
Ltmp88:
	.loc	0 302 35 is_stmt 1              ; src/vm.c:302:35
	ldur	x20, [x29, #-16]
	ldurh	w0, [x29, #-18]
	ldurb	w1, [x29, #-19]
	ldur	x21, [x29, #-32]
	ldur	x22, [x29, #-40]
	ldur	x23, [x29, #-48]
	ldur	x24, [x29, #-56]
	.cfi_def_cfa wsp, 336
	.loc	0 302 21 epilogue_begin is_stmt 0 ; src/vm.c:302:21
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_invalidlayout
Ltmp89:
LBB16_4:                                ; %if.end
	.cfi_restore_state
	.loc	0 0 21                          ; src/vm.c:0:21
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 305 3 is_stmt 1               ; src/vm.c:305:3
	ldur	x9, [x29, #-16]
	mov	x10, x9
	add	x10, x10, #4
	stur	x10, [x29, #-16]
	stur	x9, [x29, #-80]
	.loc	0 306 16                        ; src/vm.c:306:16
	ldur	x9, [x29, #-80]
	str	x9, [sp, #136]                  ; 8-byte Folded Spill
	str	x9, [sp, #144]                  ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #156]                  ; 4-byte Folded Spill
	cbz	w8, LBB16_7
	b	LBB16_5
LBB16_5:
	.loc	0 0 16 is_stmt 0                ; src/vm.c:0:16
	ldr	w8, [sp, #156]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 306 16                        ; src/vm.c:306:16
	and	x9, x9, #0x7
	add	x9, x9, #3
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB16_7
	b	LBB16_6
LBB16_6:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x0, [sp, #144]                  ; 8-byte Folded Reload
	.loc	0 306 16                        ; src/vm.c:306:16
	bl	___asan_report_load4
	brk	#0x1
LBB16_7:
	.loc	0 0 16                          ; src/vm.c:0:16
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	.loc	0 306 16                        ; src/vm.c:306:16
	ldr	w8, [x8]
	lsr	w8, w8, #8
	.loc	0 306 9                         ; src/vm.c:306:9
	stur	w8, [x29, #-84]
	.loc	0 309 3 is_stmt 1               ; src/vm.c:309:3
	b	LBB16_8
LBB16_8:                                ; %do.body
Ltmp90:
	.loc	0 309 3 is_stmt 0               ; src/vm.c:309:3
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
	b	LBB16_9
LBB16_9:                                ; %do.cond
	b	LBB16_10
Ltmp91:
LBB16_10:                               ; %do.end
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	.loc	0 311 13 is_stmt 1              ; src/vm.c:311:13
	ldur	x9, [x29, #-96]
	str	x9, [sp, #104]                  ; 8-byte Folded Spill
	.loc	0 311 3 is_stmt 0               ; src/vm.c:311:3
	ldur	x9, [x29, #-32]
	str	x9, [sp, #112]                  ; 8-byte Folded Spill
	.loc	0 311 6                         ; src/vm.c:311:6
	ldur	w10, [x29, #-60]
                                        ; kill: def $x10 killed $w10
	str	x10, [sp, #120]                 ; 8-byte Folded Spill
	.loc	0 311 3                         ; src/vm.c:311:3
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #128]                  ; 8-byte Folded Spill
	.loc	0 311 11                        ; src/vm.c:311:11
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB16_12
	b	LBB16_11
LBB16_11:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x0, [sp, #128]                  ; 8-byte Folded Reload
	.loc	0 311 11                        ; src/vm.c:311:11
	bl	___asan_report_store8
	brk	#0x1
LBB16_12:
	.loc	0 0 11                          ; src/vm.c:0:11
	ldr	x8, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #112]                  ; 8-byte Folded Reload
	ldr	x10, [sp, #120]                 ; 8-byte Folded Reload
	.loc	0 311 11                        ; src/vm.c:311:11
	str	x8, [x9, x10, lsl #3]
	.loc	0 313 3 is_stmt 1               ; src/vm.c:313:3
	b	LBB16_13
LBB16_13:                               ; %do.body7
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
Ltmp92:
	.loc	0 313 3                         ; src/vm.c:313:3
	ldur	x9, [x29, #-16]
	stur	x9, [x29, #-112]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #80]                   ; 8-byte Folded Spill
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	cbz	w8, LBB16_16
	b	LBB16_14
LBB16_14:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB16_16
	b	LBB16_15
LBB16_15:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	bl	___asan_report_load1
	brk	#0x1
LBB16_16:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #80]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
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
	cbz	w8, LBB16_18
	b	LBB16_17
LBB16_17:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	bl	___asan_report_load8
	brk	#0x1
LBB16_18:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	ldr	x9, [x9, x10, lsl #3]
	stur	x9, [x29, #-128]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	add	x9, x9, #1
	str	x9, [sp, #40]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	cbz	w8, LBB16_21
	b	LBB16_19
LBB16_19:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	and	x9, x9, #0x7
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB16_21
	b	LBB16_20
LBB16_20:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	bl	___asan_report_load1
	brk	#0x1
LBB16_21:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #160]                  ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	ldrb	w9, [x9, #1]
	sturb	w9, [x29, #-19]
	ldur	x9, [x29, #-112]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x9, x9, #2
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	cbz	w8, LBB16_24
	b	LBB16_22
LBB16_22:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	and	x9, x9, #0x7
	add	x9, x9, #1
                                        ; kill: def $w9 killed $w9 killed $x9
	sxtb	w8, w8
	subs	w8, w8, w9, sxtb
	b.gt	LBB16_24
	b	LBB16_23
LBB16_23:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
	bl	___asan_report_load2
	brk	#0x1
LBB16_24:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 313 3                         ; src/vm.c:313:3
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
	.loc	0 313 3 epilogue_begin          ; src/vm.c:313:3
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	sp, sp, #336
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	br	x2
Ltmp93:
Lfunc_end16:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function vm_op_Clos
_vm_op_Clos:                            ; @vm_op_Clos
Lfunc_begin17:
	.loc	0 316 0 is_stmt 1               ; src/vm.c:316:0
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
Ltmp95:
	.loc	0 316 53 prologue_end           ; src/vm.c:316:53
	ldr	x20, [sp, #40]
	ldrh	w0, [sp, #38]
	ldrb	w1, [sp, #37]
	ldr	x21, [sp, #24]
	ldr	x22, [sp, #16]
	ldr	x23, [sp, #8]
	ldr	x24, [sp]
	.loc	0 316 39 epilogue_begin is_stmt 0 ; src/vm.c:316:39
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	b	_unimplemented
Ltmp96:
Lfunc_end17:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function undefined
_undefined:                             ; @undefined
Lfunc_begin18:
	.loc	0 50 0 is_stmt 1                ; src/vm.c:50:0
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
Ltmp97:
	.loc	0 51 3 prologue_end             ; src/vm.c:51:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 51 10 is_stmt 0               ; src/vm.c:51:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 51 14                         ; src/vm.c:51:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB18_2
	b	LBB18_1
LBB18_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 51 14                         ; src/vm.c:51:14
	bl	___asan_report_store8
	brk	#0x1
LBB18_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 51 14                         ; src/vm.c:51:14
	adrp	x8, _.str.4@PAGE
	add	x8, x8, _.str.4@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 52 25 is_stmt 1               ; src/vm.c:52:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 52 19 epilogue_begin is_stmt 0 ; src/vm.c:52:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp98:
Lfunc_end18:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function diverge
_diverge:                               ; @diverge
Lfunc_begin19:
	.loc	0 80 0 is_stmt 1                ; src/vm.c:80:0
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
Ltmp100:
	.loc	0 81 3 prologue_end             ; src/vm.c:81:3
	b	LBB19_1
LBB19_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
Ltmp101:
	.loc	0 81 3 is_stmt 0                ; src/vm.c:81:3
	b	LBB19_1
Ltmp102:
Lfunc_end19:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function halt
_halt:                                  ; @halt
Lfunc_begin20:
	.loc	0 86 0 is_stmt 1                ; src/vm.c:86:0
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
Ltmp104:
	.loc	0 86 21 prologue_end epilogue_begin ; src/vm.c:86:21
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	ret
Ltmp105:
Lfunc_end20:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unusedexta
_unusedexta:                            ; @unusedexta
Lfunc_begin21:
	.loc	0 74 0                          ; src/vm.c:74:0
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
Ltmp106:
	.loc	0 75 3 prologue_end             ; src/vm.c:75:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 75 10 is_stmt 0               ; src/vm.c:75:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 75 14                         ; src/vm.c:75:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB21_2
	b	LBB21_1
LBB21_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 75 14                         ; src/vm.c:75:14
	bl	___asan_report_store8
	brk	#0x1
LBB21_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 75 14                         ; src/vm.c:75:14
	adrp	x8, _.str.6@PAGE
	add	x8, x8, _.str.6@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 76 25 is_stmt 1               ; src/vm.c:76:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 76 19 epilogue_begin is_stmt 0 ; src/vm.c:76:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp107:
Lfunc_end21:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function assertionfailed
_assertionfailed:                       ; @assertionfailed
Lfunc_begin22:
	.loc	0 62 0 is_stmt 1                ; src/vm.c:62:0
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
Ltmp108:
	.loc	0 63 3 prologue_end             ; src/vm.c:63:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 63 10 is_stmt 0               ; src/vm.c:63:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 63 14                         ; src/vm.c:63:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB22_2
	b	LBB22_1
LBB22_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 63 14                         ; src/vm.c:63:14
	bl	___asan_report_store8
	brk	#0x1
LBB22_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 63 14                         ; src/vm.c:63:14
	adrp	x8, _.str.7@PAGE
	add	x8, x8, _.str.7@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 64 25 is_stmt 1               ; src/vm.c:64:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 64 19 epilogue_begin is_stmt 0 ; src/vm.c:64:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp109:
Lfunc_end22:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidtrap
_invalidtrap:                           ; @invalidtrap
Lfunc_begin23:
	.loc	0 68 0 is_stmt 1                ; src/vm.c:68:0
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
Ltmp110:
	.loc	0 69 3 prologue_end             ; src/vm.c:69:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 69 10 is_stmt 0               ; src/vm.c:69:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 69 14                         ; src/vm.c:69:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB23_2
	b	LBB23_1
LBB23_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 69 14                         ; src/vm.c:69:14
	bl	___asan_report_store8
	brk	#0x1
LBB23_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 69 14                         ; src/vm.c:69:14
	adrp	x8, _.str.8@PAGE
	add	x8, x8, _.str.8@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 70 25 is_stmt 1               ; src/vm.c:70:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 70 19 epilogue_begin is_stmt 0 ; src/vm.c:70:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp111:
Lfunc_end23:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function panic
_panic:                                 ; @panic
Lfunc_begin24:
	.loc	0 31 0 is_stmt 1                ; src/vm.c:31:0
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
Ltmp112:
	.loc	0 33 3 prologue_end             ; src/vm.c:33:3
	b	LBB24_1
LBB24_1:                                ; %do.body
	.loc	0 0 3 is_stmt 0                 ; src/vm.c:0:3
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #40]                   ; 8-byte Folded Reload
Ltmp113:
	.loc	0 33 3                          ; src/vm.c:33:3
	; InlineAsm Start
	mov	x10, x30
	; InlineAsm End
	str	x10, [sp, #64]
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB24_3
	b	LBB24_2
LBB24_2:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	.loc	0 33 3                          ; src/vm.c:33:3
	bl	___asan_report_load8
	brk	#0x1
LBB24_3:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	.loc	0 33 3                          ; src/vm.c:33:3
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
	cbz	w8, LBB24_5
	b	LBB24_4
LBB24_4:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	0 33 3                          ; src/vm.c:33:3
	bl	___asan_report_load8
	brk	#0x1
LBB24_5:
	.loc	0 0 3                           ; src/vm.c:0:3
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	0 33 3                          ; src/vm.c:33:3
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
	b	LBB24_6
LBB24_6:                                ; %do.cond
	b	LBB24_7
Ltmp114:
LBB24_7:                                ; %do.end
	.loc	0 34 3 is_stmt 1                ; src/vm.c:34:3
	b	LBB24_8
LBB24_8:                                ; %do.body1
Ltmp115:
	.loc	0 34 3 is_stmt 0                ; src/vm.c:34:3
	; InlineAsm Start
	mov	x8, x30
	; InlineAsm End
	str	x8, [sp, #56]
	bl	___asan_handle_no_return
	mov	w0, #255                        ; =0xff
	bl	_exit
Ltmp116:
Lfunc_end24:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function stackoverflow
_stackoverflow:                         ; @stackoverflow
Lfunc_begin25:
	.loc	0 38 0 is_stmt 1                ; src/vm.c:38:0
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
Ltmp117:
	.loc	0 39 3 prologue_end             ; src/vm.c:39:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 39 10 is_stmt 0               ; src/vm.c:39:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 39 14                         ; src/vm.c:39:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB25_2
	b	LBB25_1
LBB25_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 39 14                         ; src/vm.c:39:14
	bl	___asan_report_store8
	brk	#0x1
LBB25_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 39 14                         ; src/vm.c:39:14
	adrp	x8, _.str.9@PAGE
	add	x8, x8, _.str.9@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 40 25 is_stmt 1               ; src/vm.c:40:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 40 19 epilogue_begin is_stmt 0 ; src/vm.c:40:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp118:
Lfunc_end25:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function invalidlayout
_invalidlayout:                         ; @invalidlayout
Lfunc_begin26:
	.loc	0 56 0 is_stmt 1                ; src/vm.c:56:0
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
Ltmp119:
	.loc	0 57 3 prologue_end             ; src/vm.c:57:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 57 10 is_stmt 0               ; src/vm.c:57:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 57 14                         ; src/vm.c:57:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB26_2
	b	LBB26_1
LBB26_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 57 14                         ; src/vm.c:57:14
	bl	___asan_report_store8
	brk	#0x1
LBB26_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 57 14                         ; src/vm.c:57:14
	adrp	x8, _.str.10@PAGE
	add	x8, x8, _.str.10@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 58 25 is_stmt 1               ; src/vm.c:58:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 58 19 epilogue_begin is_stmt 0 ; src/vm.c:58:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp120:
Lfunc_end26:
	.cfi_endproc
                                        ; -- End function
	.p2align	5                               ; -- Begin function unimplemented
_unimplemented:                         ; @unimplemented
Lfunc_begin27:
	.loc	0 44 0 is_stmt 1                ; src/vm.c:44:0
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
Ltmp121:
	.loc	0 45 3 prologue_end             ; src/vm.c:45:3
	ldr	x9, [sp, #32]
	str	x9, [sp]                        ; 8-byte Folded Spill
	.loc	0 45 10 is_stmt 0               ; src/vm.c:45:10
	add	x9, x9, #64
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	.loc	0 45 14                         ; src/vm.c:45:14
	add	x8, x8, x9, lsr #3
	ldrb	w8, [x8]
	cbz	w8, LBB27_2
	b	LBB27_1
LBB27_1:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	.loc	0 45 14                         ; src/vm.c:45:14
	bl	___asan_report_store8
	brk	#0x1
LBB27_2:
	.loc	0 0 14                          ; src/vm.c:0:14
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	0 45 14                         ; src/vm.c:45:14
	adrp	x8, _.str.11@PAGE
	add	x8, x8, _.str.11@PAGEOFF
	str	x8, [x9, #64]
	.loc	0 46 25 is_stmt 1               ; src/vm.c:46:25
	ldur	x20, [x29, #-8]
	ldurh	w0, [x29, #-10]
	ldurb	w1, [x29, #-11]
	ldur	x21, [x29, #-24]
	ldr	x22, [sp, #32]
	ldr	x23, [sp, #24]
	ldr	x24, [sp, #16]
	.cfi_def_cfa wsp, 80
	.loc	0 46 19 epilogue_begin is_stmt 0 ; src/vm.c:46:19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	b	_panic
Ltmp122:
Lfunc_end27:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function asan.module_ctor
_asan.module_ctor:                      ; @asan.module_ctor
Lfunc_begin28:
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
Lfunc_end28:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function asan.module_dtor
_asan.module_dtor:                      ; @asan.module_dtor
Lfunc_begin29:
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
Lfunc_end29:
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__const
	.p2align	5, 0x0                          ; @dispatch
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
	.space	56

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
	.quad	136                             ; 0x88
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
	.byte	1                               ; Abbrev [1] 0xc:0x13f9 DW_TAG_compile_unit
	.byte	0                               ; DW_AT_producer
	.short	29                              ; DW_AT_language
	.byte	1                               ; DW_AT_name
.set Lset2, Lstr_offsets_base0-Lsection_str_off ; DW_AT_str_offsets_base
	.long	Lset2
.set Lset3, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset3
	.byte	2                               ; DW_AT_comp_dir
	.byte	12                              ; DW_AT_low_pc
.set Lset4, Lfunc_end27-Lfunc_begin0    ; DW_AT_high_pc
	.long	Lset4
.set Lset5, Laddr_table_base0-Lsection_info0 ; DW_AT_addr_base
	.long	Lset5
	.byte	2                               ; Abbrev [2] 0x23:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_name
	.long	47                              ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.short	318                             ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	0
	.byte	3                               ; Abbrev [3] 0x2f:0xc DW_TAG_array_type
	.long	59                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x34:0x6 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	17                              ; DW_AT_count
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
	.byte	106                             ; DW_AT_decl_line
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
	.byte	106                             ; DW_AT_decl_line
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
	.byte	119                             ; DW_AT_decl_line
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
	.byte	51                              ; DW_AT_decl_line
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
	.byte	33                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	5
	.byte	19                              ; Abbrev [19] 0x296:0xa DW_TAG_variable
	.long	672                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
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
	.byte	63                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	7
	.byte	19                              ; Abbrev [19] 0x2b6:0xa DW_TAG_variable
	.long	704                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	69                              ; DW_AT_decl_line
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
	.byte	39                              ; DW_AT_decl_line
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
	.byte	57                              ; DW_AT_decl_line
	.byte	2                               ; DW_AT_location
	.byte	161
	.byte	10
	.byte	19                              ; Abbrev [19] 0x2ec:0xa DW_TAG_variable
	.long	758                             ; DW_AT_type
	.byte	0                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
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
	.byte	14                              ; Abbrev [14] 0x344:0x3f DW_TAG_enumeration_type
	.long	141                             ; DW_AT_type
	.byte	4                               ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
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
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x383:0x24 DW_TAG_enumeration_type
	.long	141                             ; DW_AT_type
	.byte	4                               ; DW_AT_byte_size
	.byte	13                              ; DW_AT_decl_file
	.byte	15                              ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x38b:0x3 DW_TAG_enumerator
	.byte	88                              ; DW_AT_name
	.byte	0                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x38e:0x3 DW_TAG_enumerator
	.byte	89                              ; DW_AT_name
	.byte	1                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x391:0x3 DW_TAG_enumerator
	.byte	90                              ; DW_AT_name
	.byte	2                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x394:0x3 DW_TAG_enumerator
	.byte	91                              ; DW_AT_name
	.byte	3                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x397:0x3 DW_TAG_enumerator
	.byte	92                              ; DW_AT_name
	.byte	4                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x39a:0x3 DW_TAG_enumerator
	.byte	93                              ; DW_AT_name
	.byte	5                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x39d:0x3 DW_TAG_enumerator
	.byte	94                              ; DW_AT_name
	.byte	6                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x3a0:0x3 DW_TAG_enumerator
	.byte	95                              ; DW_AT_name
	.byte	7                               ; DW_AT_const_value
	.byte	15                              ; Abbrev [15] 0x3a3:0x3 DW_TAG_enumerator
	.byte	96                              ; DW_AT_name
	.byte	8                               ; DW_AT_const_value
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x3a7:0x1 DW_TAG_pointer_type
	.byte	6                               ; Abbrev [6] 0x3a8:0x5 DW_TAG_pointer_type
	.long	145                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3ad:0x5 DW_TAG_pointer_type
	.long	59                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x3b2:0x8 DW_TAG_typedef
	.long	954                             ; DW_AT_type
	.byte	98                              ; DW_AT_name
	.byte	14                              ; DW_AT_decl_file
	.byte	30                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x3ba:0x4 DW_TAG_base_type
	.byte	97                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; Abbrev [7] 0x3be:0x8 DW_TAG_typedef
	.long	966                             ; DW_AT_type
	.byte	100                             ; DW_AT_name
	.byte	15                              ; DW_AT_decl_file
	.byte	30                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x3c6:0x4 DW_TAG_base_type
	.byte	99                              ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	2                               ; DW_AT_byte_size
	.byte	7                               ; Abbrev [7] 0x3ca:0x8 DW_TAG_typedef
	.long	946                             ; DW_AT_type
	.byte	101                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.byte	6                               ; Abbrev [6] 0x3d2:0x5 DW_TAG_pointer_type
	.long	165                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x3d7:0x8 DW_TAG_typedef
	.long	991                             ; DW_AT_type
	.byte	103                             ; DW_AT_name
	.byte	16                              ; DW_AT_decl_file
	.byte	18                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x3df:0x4 DW_TAG_base_type
	.byte	102                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; Abbrev [7] 0x3e3:0x8 DW_TAG_typedef
	.long	1003                            ; DW_AT_type
	.byte	105                             ; DW_AT_name
	.byte	17                              ; DW_AT_decl_file
	.byte	30                              ; DW_AT_decl_line
	.byte	11                              ; Abbrev [11] 0x3eb:0x4 DW_TAG_base_type
	.byte	104                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	21                              ; Abbrev [21] 0x3ef:0x88 DW_TAG_subprogram
	.byte	12                              ; DW_AT_low_pc
.set Lset6, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset6
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	106                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	5014                            ; DW_AT_type
                                        ; DW_AT_external
	.byte	22                              ; Abbrev [22] 0x3fe:0xc DW_TAG_formal_parameter
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\340~"
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
	.long	204                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x40a:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\330~"
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	17                              ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x416:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\320~"
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	18                              ; DW_AT_decl_line
	.long	174                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x422:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\310~"
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.long	524                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x42e:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\307~"
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x43a:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\306~"
	.byte	138                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x446:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\305~"
	.byte	139                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x452:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\302~"
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x45e:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270~"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x46a:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264~"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x477:0x15f DW_TAG_subprogram
	.byte	13                              ; DW_AT_low_pc
.set Lset7, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset7
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	108                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x483:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x48e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x499:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x4a4:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x4af:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x4ba:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x4c5:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x4d0:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	144                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x4db:0x58 DW_TAG_lexical_block
	.byte	14                              ; DW_AT_low_pc
.set Lset8, Ltmp12-Ltmp4                ; DW_AT_high_pc
	.long	Lset8
	.byte	23                              ; Abbrev [23] 0x4e1:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.byte	153                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	101                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x4ed:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	154                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	102                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x4f9:0x39 DW_TAG_lexical_block
	.byte	15                              ; DW_AT_low_pc
.set Lset9, Ltmp12-Ltmp5                ; DW_AT_high_pc
	.long	Lset9
	.byte	23                              ; Abbrev [23] 0x4ff:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	156                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	104                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x50b:0x26 DW_TAG_lexical_block
	.byte	16                              ; DW_AT_low_pc
.set Lset10, Ltmp11-Ltmp8               ; DW_AT_high_pc
	.long	Lset10
	.byte	23                              ; Abbrev [23] 0x511:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	155                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	105                             ; DW_AT_decl_line
	.long	1003                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x51d:0x13 DW_TAG_lexical_block
	.byte	17                              ; DW_AT_low_pc
.set Lset11, Ltmp10-Ltmp9               ; DW_AT_high_pc
	.long	Lset11
	.byte	23                              ; Abbrev [23] 0x523:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x533:0x45 DW_TAG_lexical_block
	.byte	18                              ; DW_AT_low_pc
.set Lset12, Ltmp20-Ltmp13              ; DW_AT_high_pc
	.long	Lset12
	.byte	23                              ; Abbrev [23] 0x539:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.byte	153                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	114                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x545:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	154                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	115                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x551:0x26 DW_TAG_lexical_block
	.byte	19                              ; DW_AT_low_pc
.set Lset13, Ltmp19-Ltmp16              ; DW_AT_high_pc
	.long	Lset13
	.byte	23                              ; Abbrev [23] 0x557:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.byte	155                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	118                             ; DW_AT_decl_line
	.long	1003                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x563:0x13 DW_TAG_lexical_block
	.byte	20                              ; DW_AT_low_pc
.set Lset14, Ltmp18-Ltmp17              ; DW_AT_high_pc
	.long	Lset14
	.byte	23                              ; Abbrev [23] 0x569:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	119                             ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x578:0x1f DW_TAG_lexical_block
	.byte	21                              ; DW_AT_low_pc
.set Lset15, Ltmp22-Ltmp21              ; DW_AT_high_pc
	.long	Lset15
	.byte	23                              ; Abbrev [23] 0x57e:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\214\177"
	.byte	147                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	126                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x58a:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.byte	148                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	127                             ; DW_AT_decl_line
	.long	5038                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x597:0x13 DW_TAG_lexical_block
	.byte	22                              ; DW_AT_low_pc
.set Lset16, Ltmp24-Ltmp23              ; DW_AT_high_pc
	.long	Lset16
	.byte	23                              ; Abbrev [23] 0x59d:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\370~"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	132                             ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x5aa:0x2b DW_TAG_lexical_block
	.byte	23                              ; DW_AT_low_pc
.set Lset17, Ltmp28-Ltmp27              ; DW_AT_high_pc
	.long	Lset17
	.byte	23                              ; Abbrev [23] 0x5b0:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\360~"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x5bc:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\354~"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x5c8:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\340~"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x5d6:0x83 DW_TAG_subprogram
	.byte	24                              ; DW_AT_low_pc
.set Lset18, Lfunc_end2-Lfunc_begin2    ; DW_AT_high_pc
	.long	Lset18
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	109                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x5e2:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x5ed:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x5f8:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x603:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x60e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x619:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x624:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x62f:0x29 DW_TAG_lexical_block
	.byte	25                              ; DW_AT_low_pc
.set Lset19, Ltmp32-Ltmp31              ; DW_AT_high_pc
	.long	Lset19
	.byte	23                              ; Abbrev [23] 0x635:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x640:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x64b:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x659:0x9b DW_TAG_subprogram
	.byte	26                              ; DW_AT_low_pc
.set Lset20, Lfunc_end3-Lfunc_begin3    ; DW_AT_high_pc
	.long	Lset20
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	110                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x665:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x670:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x67b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x686:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x691:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x69c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x6a7:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	144                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x6b2:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	158                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x6bd:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	159                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	146                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x6c8:0x2b DW_TAG_lexical_block
	.byte	27                              ; DW_AT_low_pc
.set Lset21, Ltmp35-Ltmp34              ; DW_AT_high_pc
	.long	Lset21
	.byte	23                              ; Abbrev [23] 0x6ce:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	150                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x6da:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	150                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x6e6:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	150                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x6f4:0x5a DW_TAG_subprogram
	.byte	28                              ; DW_AT_low_pc
.set Lset22, Lfunc_end4-Lfunc_begin4    ; DW_AT_high_pc
	.long	Lset22
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.byte	111                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x700:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	40
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x70b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	38
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x716:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	37
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x721:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x72c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x737:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x742:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x74e:0x8f DW_TAG_subprogram
	.byte	29                              ; DW_AT_low_pc
.set Lset23, Lfunc_end5-Lfunc_begin5    ; DW_AT_high_pc
	.long	Lset23
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	112                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x75a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x765:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x770:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x77b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x786:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x791:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x79c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x7a7:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.byte	158                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x7b2:0x2a DW_TAG_lexical_block
	.byte	30                              ; DW_AT_low_pc
.set Lset24, Ltmp41-Ltmp40              ; DW_AT_high_pc
	.long	Lset24
	.byte	23                              ; Abbrev [23] 0x7b8:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x7c3:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x7cf:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x7dd:0x8f DW_TAG_subprogram
	.byte	31                              ; DW_AT_low_pc
.set Lset25, Lfunc_end6-Lfunc_begin6    ; DW_AT_high_pc
	.long	Lset25
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	113                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x7e9:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x7f4:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x7ff:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x80a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x815:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x820:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x82b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	163                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x836:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.byte	158                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	164                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x841:0x2a DW_TAG_lexical_block
	.byte	32                              ; DW_AT_low_pc
.set Lset26, Ltmp44-Ltmp43              ; DW_AT_high_pc
	.long	Lset26
	.byte	23                              ; Abbrev [23] 0x847:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	168                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x852:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	168                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x85e:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	168                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x86c:0x9c DW_TAG_subprogram
	.byte	33                              ; DW_AT_low_pc
.set Lset27, Lfunc_end7-Lfunc_begin7    ; DW_AT_high_pc
	.long	Lset27
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	114                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x878:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x883:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x88e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x899:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x8a4:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x8af:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x8ba:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x8c5:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	158                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	172                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x8d0:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	160                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	173                             ; DW_AT_decl_line
	.long	179                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x8dc:0x2b DW_TAG_lexical_block
	.byte	34                              ; DW_AT_low_pc
.set Lset28, Ltmp47-Ltmp46              ; DW_AT_high_pc
	.long	Lset28
	.byte	23                              ; Abbrev [23] 0x8e2:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x8ee:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x8fa:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x908:0xb4 DW_TAG_subprogram
	.byte	35                              ; DW_AT_low_pc
.set Lset29, Lfunc_end8-Lfunc_begin8    ; DW_AT_high_pc
	.long	Lset29
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	115                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x914:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x91f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x92a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x935:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x940:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x94b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x956:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x961:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	161                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	181                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x96c:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	162                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	183                             ; DW_AT_decl_line
	.long	5086                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x978:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	165                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.long	480                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x984:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	166                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	186                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x990:0x2b DW_TAG_lexical_block
	.byte	36                              ; DW_AT_low_pc
.set Lset30, Ltmp54-Ltmp53              ; DW_AT_high_pc
	.long	Lset30
	.byte	23                              ; Abbrev [23] 0x996:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x9a2:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\224\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x9ae:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\210\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	200                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x9bc:0xb3 DW_TAG_subprogram
	.byte	37                              ; DW_AT_low_pc
.set Lset31, Lfunc_end9-Lfunc_begin9    ; DW_AT_high_pc
	.long	Lset31
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	116                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	203                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x9c8:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	203                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x9d3:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	203                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x9de:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	203                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x9e9:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	203                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x9f4:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	203                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x9ff:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	203                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa0a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	203                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa15:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	158                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	204                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa20:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	167                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	205                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa2b:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	165                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	207                             ; DW_AT_decl_line
	.long	480                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa37:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	166                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	209                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xa43:0x2b DW_TAG_lexical_block
	.byte	38                              ; DW_AT_low_pc
.set Lset32, Ltmp61-Ltmp60              ; DW_AT_high_pc
	.long	Lset32
	.byte	23                              ; Abbrev [23] 0xa49:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	220                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa55:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	220                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xa61:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	220                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0xa6f:0x8f DW_TAG_subprogram
	.byte	39                              ; DW_AT_low_pc
.set Lset33, Lfunc_end10-Lfunc_begin10  ; DW_AT_high_pc
	.long	Lset33
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	117                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	223                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0xa7b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	223                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa86:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	223                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa91:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	223                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xa9c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	223                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xaa7:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	223                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xab2:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	223                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xabd:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	223                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xac8:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	168                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	224                             ; DW_AT_decl_line
	.long	970                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xad3:0x2a DW_TAG_lexical_block
	.byte	40                              ; DW_AT_low_pc
.set Lset34, Ltmp64-Ltmp63              ; DW_AT_high_pc
	.long	Lset34
	.byte	23                              ; Abbrev [23] 0xad9:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	228                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xae4:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	228                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xaf0:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	228                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0xafe:0x9b DW_TAG_subprogram
	.byte	41                              ; DW_AT_low_pc
.set Lset35, Lfunc_end11-Lfunc_begin11  ; DW_AT_high_pc
	.long	Lset35
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	118                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	231                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0xb0a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	231                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb15:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	231                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb20:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	231                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb2b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	231                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb36:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	231                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb41:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	231                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xb4c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	231                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb57:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	159                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	232                             ; DW_AT_decl_line
	.long	179                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb62:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	168                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	233                             ; DW_AT_decl_line
	.long	970                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xb6d:0x2b DW_TAG_lexical_block
	.byte	42                              ; DW_AT_low_pc
.set Lset36, Ltmp67-Ltmp66              ; DW_AT_high_pc
	.long	Lset36
	.byte	23                              ; Abbrev [23] 0xb73:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	237                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb7f:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	237                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xb8b:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	237                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0xb99:0xa6 DW_TAG_subprogram
	.byte	43                              ; DW_AT_low_pc
.set Lset37, Lfunc_end12-Lfunc_begin12  ; DW_AT_high_pc
	.long	Lset37
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	119                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	240                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0xba5:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	240                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xbb0:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	240                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xbbb:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	240                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xbc6:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	240                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xbd1:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	240                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xbdc:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	240                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xbe7:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	240                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xbf2:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.byte	169                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	241                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xbfd:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	170                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	242                             ; DW_AT_decl_line
	.long	995                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xc08:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	35                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	244                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xc13:0x2b DW_TAG_lexical_block
	.byte	44                              ; DW_AT_low_pc
.set Lset38, Ltmp70-Ltmp69              ; DW_AT_high_pc
	.long	Lset38
	.byte	23                              ; Abbrev [23] 0xc19:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	247                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xc25:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	247                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xc31:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	247                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0xc3f:0xab DW_TAG_subprogram
	.byte	45                              ; DW_AT_low_pc
.set Lset39, Lfunc_end13-Lfunc_begin13  ; DW_AT_high_pc
	.long	Lset39
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	120                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	250                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0xc4b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	250                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc56:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	250                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc61:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	250                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc6c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	250                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc77:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	250                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc82:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	250                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xc8d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	250                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xc98:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	171                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	253                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xca3:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	172                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	255                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0xcaf:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.byte	173                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	255                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xcbb:0x2e DW_TAG_lexical_block
	.byte	46                              ; DW_AT_low_pc
.set Lset40, Ltmp73-Ltmp72              ; DW_AT_high_pc
	.long	Lset40
	.byte	26                              ; Abbrev [26] 0xcc1:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xcce:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xcdb:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	260                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xcea:0xc3 DW_TAG_subprogram
	.byte	47                              ; DW_AT_low_pc
.set Lset41, Lfunc_end14-Lfunc_begin14  ; DW_AT_high_pc
	.long	Lset41
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	121                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	263                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xcf7:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	263                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd03:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	263                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd0f:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	263                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd1b:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	263                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd27:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	263                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd33:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	263                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xd3f:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	263                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd4b:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	174                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	264                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd57:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	171                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	268                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd64:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	172                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd71:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	173                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xd7e:0x2e DW_TAG_lexical_block
	.byte	48                              ; DW_AT_low_pc
.set Lset42, Ltmp76-Ltmp75              ; DW_AT_high_pc
	.long	Lset42
	.byte	26                              ; Abbrev [26] 0xd84:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	275                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd91:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	275                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xd9e:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	275                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xdad:0xf0 DW_TAG_subprogram
	.byte	49                              ; DW_AT_low_pc
.set Lset43, Lfunc_end15-Lfunc_begin15  ; DW_AT_high_pc
	.long	Lset43
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	122                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xdba:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xdc6:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xdd2:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xdde:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xdea:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xdf6:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xe02:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe0e:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	174                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	279                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe1a:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	175                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	280                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe26:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.byte	171                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	282                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe33:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	176                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	284                             ; DW_AT_decl_line
	.long	174                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe40:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	172                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe4d:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.byte	173                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xe5a:0x14 DW_TAG_lexical_block
	.byte	50                              ; DW_AT_low_pc
.set Lset44, Ltmp82-Ltmp78              ; DW_AT_high_pc
	.long	Lset44
	.byte	26                              ; Abbrev [26] 0xe60:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	156                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	286                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0xe6e:0x2e DW_TAG_lexical_block
	.byte	51                              ; DW_AT_low_pc
.set Lset45, Ltmp84-Ltmp83              ; DW_AT_high_pc
	.long	Lset45
	.byte	26                              ; Abbrev [26] 0xe74:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	294                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe81:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\214\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	294                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xe8e:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	294                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xe9d:0xe3 DW_TAG_subprogram
	.byte	52                              ; DW_AT_low_pc
.set Lset46, Lfunc_end16-Lfunc_begin16  ; DW_AT_high_pc
	.long	Lset46
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	123                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xeaa:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xeb6:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	110
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xec2:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	109
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xece:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xeda:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xee6:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xef2:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	297                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xefe:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	68
	.byte	158                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	298                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf0a:0xc DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.byte	177                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	299                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf16:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.byte	178                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	305                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf23:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.byte	179                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	306                             ; DW_AT_decl_line
	.long	5030                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf30:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.byte	148                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	308                             ; DW_AT_decl_line
	.long	5038                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0xf3d:0x14 DW_TAG_lexical_block
	.byte	53                              ; DW_AT_low_pc
.set Lset47, Ltmp91-Ltmp90              ; DW_AT_high_pc
	.long	Lset47
	.byte	26                              ; Abbrev [26] 0xf43:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	309                             ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0xf51:0x2e DW_TAG_lexical_block
	.byte	54                              ; DW_AT_low_pc
.set Lset48, Ltmp93-Ltmp92              ; DW_AT_high_pc
	.long	Lset48
	.byte	26                              ; Abbrev [26] 0xf57:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.byte	141                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	313                             ; DW_AT_decl_line
	.long	120                             ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf64:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\214\177"
	.byte	142                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	313                             ; DW_AT_decl_line
	.long	5022                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0xf71:0xd DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.byte	157                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	313                             ; DW_AT_decl_line
	.long	59                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0xf80:0x62 DW_TAG_subprogram
	.byte	55                              ; DW_AT_low_pc
.set Lset49, Lfunc_end17-Lfunc_begin17  ; DW_AT_high_pc
	.long	Lset49
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.byte	124                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	316                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	28                              ; Abbrev [28] 0xf8d:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	40
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	316                             ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xf99:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	38
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	316                             ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xfa5:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	37
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	316                             ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xfb1:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	316                             ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xfbd:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	316                             ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xfc9:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	316                             ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	28                              ; Abbrev [28] 0xfd5:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.short	316                             ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0xfe2:0x5a DW_TAG_subprogram
	.byte	56                              ; DW_AT_low_pc
.set Lset50, Lfunc_end18-Lfunc_begin18  ; DW_AT_high_pc
	.long	Lset50
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	125                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0xfee:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0xff9:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1004:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x100f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x101a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1025:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1030:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x103c:0x5a DW_TAG_subprogram
	.byte	57                              ; DW_AT_low_pc
.set Lset51, Lfunc_end19-Lfunc_begin19  ; DW_AT_high_pc
	.long	Lset51
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.byte	126                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1048:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	40
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1053:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	38
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x105e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	37
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1069:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1074:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x107f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x108a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x1096:0x5a DW_TAG_subprogram
	.byte	58                              ; DW_AT_low_pc
.set Lset52, Lfunc_end20-Lfunc_begin20  ; DW_AT_high_pc
	.long	Lset52
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.byte	127                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x10a2:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	40
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x10ad:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	38
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x10b8:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	37
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x10c3:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x10ce:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x10d9:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x10e4:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x10f0:0x5a DW_TAG_subprogram
	.byte	59                              ; DW_AT_low_pc
.set Lset53, Lfunc_end21-Lfunc_begin21  ; DW_AT_high_pc
	.long	Lset53
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	128                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x10fc:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1107:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1112:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x111d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1128:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1133:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x113e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x114a:0x5a DW_TAG_subprogram
	.byte	60                              ; DW_AT_low_pc
.set Lset54, Lfunc_end22-Lfunc_begin22  ; DW_AT_high_pc
	.long	Lset54
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	129                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1156:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1161:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x116c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1177:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1182:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x118d:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1198:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x11a4:0x5a DW_TAG_subprogram
	.byte	61                              ; DW_AT_low_pc
.set Lset55, Lfunc_end23-Lfunc_begin23  ; DW_AT_high_pc
	.long	Lset55
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	130                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x11b0:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11bb:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11c6:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11d1:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11dc:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11e7:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x11f2:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x11fe:0x8a DW_TAG_subprogram
	.byte	62                              ; DW_AT_low_pc
.set Lset56, Lfunc_end24-Lfunc_begin24  ; DW_AT_high_pc
	.long	Lset56
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	131                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x120a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1215:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1220:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x122b:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1236:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1241:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x124c:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x1257:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.byte	155                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.long	1003                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x1262:0x13 DW_TAG_lexical_block
	.byte	63                              ; DW_AT_low_pc
.set Lset57, Ltmp114-Ltmp113            ; DW_AT_high_pc
	.long	Lset57
	.byte	23                              ; Abbrev [23] 0x1268:0xc DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	143
	.asciz	"\300"
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	33                              ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x1275:0x12 DW_TAG_lexical_block
	.byte	64                              ; DW_AT_low_pc
.set Lset58, Ltmp116-Ltmp115            ; DW_AT_high_pc
	.long	Lset58
	.byte	23                              ; Abbrev [23] 0x127b:0xb DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	56
	.byte	146                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	476                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x1288:0x5a DW_TAG_subprogram
	.byte	65                              ; DW_AT_low_pc
.set Lset59, Lfunc_end25-Lfunc_begin25  ; DW_AT_high_pc
	.long	Lset59
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	132                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1294:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x129f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12aa:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12b5:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12c0:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12cb:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12d6:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x12e2:0x5a DW_TAG_subprogram
	.byte	66                              ; DW_AT_low_pc
.set Lset60, Lfunc_end26-Lfunc_begin26  ; DW_AT_high_pc
	.long	Lset60
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	133                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x12ee:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x12f9:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1304:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x130f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x131a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1325:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1330:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x133c:0x5a DW_TAG_subprogram
	.byte	67                              ; DW_AT_low_pc
.set Lset61, Lfunc_end27-Lfunc_begin27  ; DW_AT_high_pc
	.long	Lset61
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.byte	134                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	205                             ; DW_AT_calling_convention
	.byte	22                              ; Abbrev [22] 0x1348:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.byte	135                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.long	115                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1353:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	118
	.byte	140                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.long	145                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x135e:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	117
	.byte	137                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.long	157                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1369:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.byte	136                             ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.long	169                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x1374:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.byte	49                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.long	199                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x137f:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.byte	3                               ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.long	543                             ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x138a:0xb DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.byte	40                              ; DW_AT_name
	.byte	0                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.long	554                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x1396:0x8 DW_TAG_typedef
	.long	770                             ; DW_AT_type
	.byte	107                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	49                              ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0x139e:0x8 DW_TAG_typedef
	.long	836                             ; DW_AT_type
	.byte	143                             ; DW_AT_name
	.byte	12                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	7                               ; Abbrev [7] 0x13a6:0x8 DW_TAG_typedef
	.long	133                             ; DW_AT_type
	.byte	145                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	10                              ; DW_AT_decl_line
	.byte	6                               ; Abbrev [6] 0x13ae:0x5 DW_TAG_pointer_type
	.long	5043                            ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x13b3:0x18 DW_TAG_structure_type
	.byte	152                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	10                              ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x13b8:0x9 DW_TAG_member
	.byte	149                             ; DW_AT_name
	.long	5067                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x13c1:0x9 DW_TAG_member
	.byte	151                             ; DW_AT_name
	.long	5075                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x13cb:0x8 DW_TAG_typedef
	.long	187                             ; DW_AT_type
	.byte	150                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	13                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x13d3:0xb DW_TAG_array_type
	.long	179                             ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x13d8:0x5 DW_TAG_subrange_type
	.long	520                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	6                               ; Abbrev [6] 0x13de:0x5 DW_TAG_pointer_type
	.long	5091                            ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x13e3:0x21 DW_TAG_structure_type
	.byte	164                             ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	10                              ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x13e8:0x9 DW_TAG_member
	.byte	149                             ; DW_AT_name
	.long	5067                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	25                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x13f1:0x9 DW_TAG_member
	.byte	163                             ; DW_AT_name
	.long	179                             ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	13                              ; Abbrev [13] 0x13fa:0x9 DW_TAG_member
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
	.long	724                             ; Length of String Offsets Set
	.short	5
	.short	0
Lstr_offsets_base0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 17.0.0 (clang-1700.6.4.2)" ; string offset=0
	.asciz	"src/vm.c"                      ; string offset=46
	.asciz	"/Users/waterlens/Projects/qxq/vm" ; string offset=55
	.asciz	"dispatch"                      ; string offset=88
	.asciz	"opthread"                      ; string offset=97
	.asciz	"bc_t"                          ; string offset=106
	.asciz	"uint32_t"                      ; string offset=111
	.asciz	"unsigned int"                  ; string offset=120
	.asciz	"uint16_t"                      ; string offset=133
	.asciz	"unsigned short"                ; string offset=142
	.asciz	"uint8_t"                       ; string offset=157
	.asciz	"unsigned char"                 ; string offset=165
	.asciz	"val_t"                         ; string offset=179
	.asciz	"uint64_t"                      ; string offset=185
	.asciz	"unsigned long long"            ; string offset=194
	.asciz	"state"                         ; string offset=213
	.asciz	"heap"                          ; string offset=219
	.asciz	"bump"                          ; string offset=224
	.asciz	"from_base"                     ; string offset=229
	.asciz	"from_limit"                    ; string offset=239
	.asciz	"to_base"                       ; string offset=250
	.asciz	"to_limit"                      ; string offset=258
	.asciz	"scan"                          ; string offset=267
	.asciz	"args"                          ; string offset=272
	.asciz	"runtime_args"                  ; string offset=277
	.asciz	"trace_level"                   ; string offset=290
	.asciz	"trace_level_t"                 ; string offset=302
	.asciz	"TRACE_0"                       ; string offset=316
	.asciz	"TRACE_1"                       ; string offset=324
	.asciz	"TRACE_2"                       ; string offset=332
	.asciz	"TRACE_ALL"                     ; string offset=340
	.asciz	"base_size"                     ; string offset=350
	.asciz	"size_t"                        ; string offset=360
	.asciz	"__darwin_size_t"               ; string offset=367
	.asciz	"unsigned long"                 ; string offset=383
	.asciz	"align"                         ; string offset=397
	.asciz	"descspace_size"                ; string offset=403
	.asciz	"entry"                         ; string offset=418
	.asciz	"function"                      ; string offset=424
	.asciz	"oplimit"                       ; string offset=433
	.asciz	"ops"                           ; string offset=441
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=445
	.asciz	"fns"                           ; string offset=465
	.asciz	"numfn"                         ; string offset=469
	.asciz	"numobject"                     ; string offset=475
	.asciz	"ctbl"                          ; string offset=485
	.asciz	"stk"                           ; string offset=490
	.asciz	"stklimit"                      ; string offset=494
	.asciz	"msg"                           ; string offset=503
	.asciz	"char"                          ; string offset=507
	.asciz	"rtargs"                        ; string offset=512
	.asciz	"S_OK"                          ; string offset=519
	.asciz	"S_EOF"                         ; string offset=524
	.asciz	"S_LIMIT"                       ; string offset=530
	.asciz	"S_READ_ERR"                    ; string offset=538
	.asciz	"S_UNPAIRED"                    ; string offset=549
	.asciz	"S_INVALID_FNID"                ; string offset=560
	.asciz	"S_INVALID_NUMFN"               ; string offset=575
	.asciz	"S_INVALID_NUMBC"               ; string offset=591
	.asciz	"S_INVALID_NUMOBJECT"           ; string offset=607
	.asciz	"S_INVALID_LAYOUT_KIND"         ; string offset=627
	.asciz	"S_INVALID_LAYOUT_SIZE"         ; string offset=649
	.asciz	"S_NOT_AN_OPERAND"              ; string offset=671
	.asciz	"S_NOT_A_INT"                   ; string offset=688
	.asciz	"S_BAD_OP"                      ; string offset=700
	.asciz	"S_INSUFFICIENT_ARGS"           ; string offset=709
	.asciz	"S_DESCSPACE_INIT_FAILED"       ; string offset=729
	.asciz	"S_HEAP_INIT_FAILED"            ; string offset=753
	.asciz	"S_STATE_INIT_FAILED"           ; string offset=772
	.asciz	"S_INVALID_OBJ_DESC"            ; string offset=792
	.asciz	"Trap"                          ; string offset=811
	.asciz	"Nop"                           ; string offset=816
	.asciz	"Move"                          ; string offset=820
	.asciz	"Exta"                          ; string offset=825
	.asciz	"LoadI"                         ; string offset=830
	.asciz	"LoaduI"                        ; string offset=836
	.asciz	"LoadC"                         ; string offset=843
	.asciz	"Apply"                         ; string offset=849
	.asciz	"Call"                          ; string offset=855
	.asciz	"Jmp"                           ; string offset=860
	.asciz	"Jr"                            ; string offset=864
	.asciz	"Disp"                          ; string offset=867
	.asciz	"Retu"                          ; string offset=872
	.asciz	"Ret"                           ; string offset=877
	.asciz	"Retn"                          ; string offset=881
	.asciz	"MkObj"                         ; string offset=886
	.asciz	"Clos"                          ; string offset=892
	.asciz	"LIMIT"                         ; string offset=897
	.asciz	"T_UNDEFINED"                   ; string offset=903
	.asciz	"T_DIVERGE"                     ; string offset=915
	.asciz	"T_HALT"                        ; string offset=925
	.asciz	"T_UNUSEDEXTA"                  ; string offset=932
	.asciz	"T_PRINTREGS"                   ; string offset=945
	.asciz	"T_PRINTREGSX"                  ; string offset=957
	.asciz	"T_ASSERT_EQ"                   ; string offset=970
	.asciz	"T_PRINTOBJ"                    ; string offset=982
	.asciz	"T_HEAPSTAT"                    ; string offset=993
	.asciz	"int64_t"                       ; string offset=1004
	.asciz	"long long"                     ; string offset=1012
	.asciz	"int16_t"                       ; string offset=1022
	.asciz	"short"                         ; string offset=1030
	.asciz	"joff_t"                        ; string offset=1036
	.asciz	"ptrdiff_t"                     ; string offset=1043
	.asciz	"long"                          ; string offset=1053
	.asciz	"int32_t"                       ; string offset=1058
	.asciz	"int"                           ; string offset=1066
	.asciz	"vm_entry"                      ; string offset=1070
	.asciz	"vm_op_Trap"                    ; string offset=1079
	.asciz	"vm_op_Nop"                     ; string offset=1090
	.asciz	"vm_op_Move"                    ; string offset=1100
	.asciz	"vm_op_Exta"                    ; string offset=1111
	.asciz	"vm_op_LoadI"                   ; string offset=1122
	.asciz	"vm_op_LoaduI"                  ; string offset=1134
	.asciz	"vm_op_LoadC"                   ; string offset=1147
	.asciz	"vm_op_Apply"                   ; string offset=1159
	.asciz	"vm_op_Call"                    ; string offset=1171
	.asciz	"vm_op_Jmp"                     ; string offset=1182
	.asciz	"vm_op_Jr"                      ; string offset=1192
	.asciz	"vm_op_Disp"                    ; string offset=1201
	.asciz	"vm_op_Retu"                    ; string offset=1212
	.asciz	"vm_op_Ret"                     ; string offset=1223
	.asciz	"vm_op_Retn"                    ; string offset=1233
	.asciz	"vm_op_MkObj"                   ; string offset=1244
	.asciz	"vm_op_Clos"                    ; string offset=1256
	.asciz	"undefined"                     ; string offset=1267
	.asciz	"diverge"                       ; string offset=1277
	.asciz	"halt"                          ; string offset=1285
	.asciz	"unusedexta"                    ; string offset=1290
	.asciz	"assertionfailed"               ; string offset=1301
	.asciz	"invalidtrap"                   ; string offset=1317
	.asciz	"panic"                         ; string offset=1329
	.asciz	"stackoverflow"                 ; string offset=1335
	.asciz	"invalidlayout"                 ; string offset=1349
	.asciz	"unimplemented"                 ; string offset=1363
	.asciz	"status_t"                      ; string offset=1377
	.asciz	"ip"                            ; string offset=1386
	.asciz	"bp"                            ; string offset=1389
	.asciz	"a3a"                           ; string offset=1392
	.asciz	"a3b"                           ; string offset=1396
	.asciz	"a3c"                           ; string offset=1400
	.asciz	"a2b"                           ; string offset=1404
	.asciz	"insnp"                         ; string offset=1408
	.asciz	"op"                            ; string offset=1414
	.asciz	"op_t"                          ; string offset=1417
	.asciz	"tid"                           ; string offset=1422
	.asciz	"ssz_t"                         ; string offset=1426
	.asciz	"lr"                            ; string offset=1432
	.asciz	"o"                             ; string offset=1435
	.asciz	"obj"                           ; string offset=1437
	.asciz	"object"                        ; string offset=1441
	.asciz	"hd"                            ; string offset=1448
	.asciz	"metainfo"                      ; string offset=1451
	.asciz	"fields"                        ; string offset=1460
	.asciz	"i1"                            ; string offset=1467
	.asciz	"i2"                            ; string offset=1470
	.asciz	"r"                             ; string offset=1473
	.asciz	"i"                             ; string offset=1475
	.asciz	"next"                          ; string offset=1477
	.asciz	"dst"                           ; string offset=1482
	.asciz	"src"                           ; string offset=1486
	.asciz	"imm"                           ; string offset=1490
	.asciz	"iclos"                         ; string offset=1494
	.asciz	"clos"                          ; string offset=1500
	.asciz	"closure"                       ; string offset=1505
	.asciz	"fp"                            ; string offset=1513
	.asciz	"fn"                            ; string offset=1516
	.asciz	"oldip"                         ; string offset=1519
	.asciz	"fx"                            ; string offset=1525
	.asciz	"target"                        ; string offset=1528
	.asciz	"dispatched"                    ; string offset=1535
	.asciz	"base"                          ; string offset=1546
	.asciz	"ra"                            ; string offset=1551
	.asciz	"prev_insnp"                    ; string offset=1554
	.asciz	"fo"                            ; string offset=1565
	.asciz	"rv"                            ; string offset=1568
	.asciz	"nargs"                         ; string offset=1571
	.asciz	"rvs"                           ; string offset=1577
	.asciz	"layout"                        ; string offset=1581
	.asciz	"exta"                          ; string offset=1588
	.asciz	"size"                          ; string offset=1593
	.section	__DWARF,__debug_str_offs,regular,debug
	.long	0
	.long	46
	.long	55
	.long	88
	.long	120
	.long	111
	.long	106
	.long	142
	.long	133
	.long	165
	.long	157
	.long	194
	.long	185
	.long	179
	.long	219
	.long	224
	.long	229
	.long	239
	.long	250
	.long	258
	.long	267
	.long	272
	.long	290
	.long	316
	.long	324
	.long	332
	.long	340
	.long	302
	.long	350
	.long	383
	.long	367
	.long	360
	.long	397
	.long	403
	.long	277
	.long	418
	.long	433
	.long	441
	.long	445
	.long	424
	.long	465
	.long	469
	.long	475
	.long	485
	.long	490
	.long	494
	.long	503
	.long	507
	.long	512
	.long	213
	.long	97
	.long	519
	.long	524
	.long	530
	.long	538
	.long	549
	.long	560
	.long	575
	.long	591
	.long	607
	.long	627
	.long	649
	.long	671
	.long	688
	.long	700
	.long	709
	.long	729
	.long	753
	.long	772
	.long	792
	.long	811
	.long	816
	.long	820
	.long	825
	.long	830
	.long	836
	.long	843
	.long	849
	.long	855
	.long	860
	.long	864
	.long	867
	.long	872
	.long	877
	.long	881
	.long	886
	.long	892
	.long	897
	.long	903
	.long	915
	.long	925
	.long	932
	.long	945
	.long	957
	.long	970
	.long	982
	.long	993
	.long	1012
	.long	1004
	.long	1030
	.long	1022
	.long	1036
	.long	1053
	.long	1043
	.long	1066
	.long	1058
	.long	1070
	.long	1377
	.long	1079
	.long	1090
	.long	1100
	.long	1111
	.long	1122
	.long	1134
	.long	1147
	.long	1159
	.long	1171
	.long	1182
	.long	1192
	.long	1201
	.long	1212
	.long	1223
	.long	1233
	.long	1244
	.long	1256
	.long	1267
	.long	1277
	.long	1285
	.long	1290
	.long	1301
	.long	1317
	.long	1329
	.long	1335
	.long	1349
	.long	1363
	.long	1386
	.long	1389
	.long	1392
	.long	1396
	.long	1400
	.long	1404
	.long	1408
	.long	1414
	.long	1417
	.long	1422
	.long	1426
	.long	1432
	.long	1435
	.long	1437
	.long	1448
	.long	1451
	.long	1460
	.long	1441
	.long	1467
	.long	1470
	.long	1473
	.long	1475
	.long	1477
	.long	1482
	.long	1486
	.long	1490
	.long	1494
	.long	1500
	.long	1513
	.long	1505
	.long	1516
	.long	1519
	.long	1525
	.long	1528
	.long	1535
	.long	1546
	.long	1551
	.long	1554
	.long	1565
	.long	1568
	.long	1571
	.long	1577
	.long	1581
	.long	1588
	.long	1593
	.section	__DWARF,__debug_addr,regular,debug
Lsection_info0:
.set Lset62, Ldebug_addr_end0-Ldebug_addr_start0 ; Length of contribution
	.long	Lset62
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
	.quad	Ltmp53
	.quad	Lfunc_begin9
	.quad	Ltmp60
	.quad	Lfunc_begin10
	.quad	Ltmp63
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
	.quad	Ltmp83
	.quad	Lfunc_begin16
	.quad	Ltmp90
	.quad	Ltmp92
	.quad	Lfunc_begin17
	.quad	Lfunc_begin18
	.quad	Lfunc_begin19
	.quad	Lfunc_begin20
	.quad	Lfunc_begin21
	.quad	Lfunc_begin22
	.quad	Lfunc_begin23
	.quad	Lfunc_begin24
	.quad	Ltmp113
	.quad	Ltmp115
	.quad	Lfunc_begin25
	.quad	Lfunc_begin26
	.quad	Lfunc_begin27
Ldebug_addr_end0:
	.section	__DWARF,__debug_names,regular,debug
Ldebug_names_begin:
.set Lset63, Lnames_end0-Lnames_start0  ; Header: unit length
	.long	Lset63
Lnames_start0:
	.short	5                               ; Header: version
	.short	0                               ; Header: padding
	.long	1                               ; Header: compilation unit count
	.long	0                               ; Header: local type unit count
	.long	0                               ; Header: foreign type unit count
	.long	32                              ; Header: bucket count
	.long	65                              ; Header: name count
.set Lset64, Lnames_abbrev_end0-Lnames_abbrev_start0 ; Header: abbreviation table size
	.long	Lset64
	.long	8                               ; Header: augmentation string size
	.ascii	"LLVM0700"                      ; Header: augmentation string
.set Lset65, Lcu_begin0-Lsection_info   ; Compilation unit 0
	.long	Lset65
	.long	1                               ; Bucket 0
	.long	2                               ; Bucket 1
	.long	4                               ; Bucket 2
	.long	8                               ; Bucket 3
	.long	0                               ; Bucket 4
	.long	12                              ; Bucket 5
	.long	14                              ; Bucket 6
	.long	15                              ; Bucket 7
	.long	16                              ; Bucket 8
	.long	0                               ; Bucket 9
	.long	18                              ; Bucket 10
	.long	20                              ; Bucket 11
	.long	24                              ; Bucket 12
	.long	25                              ; Bucket 13
	.long	27                              ; Bucket 14
	.long	29                              ; Bucket 15
	.long	30                              ; Bucket 16
	.long	0                               ; Bucket 17
	.long	34                              ; Bucket 18
	.long	37                              ; Bucket 19
	.long	0                               ; Bucket 20
	.long	38                              ; Bucket 21
	.long	44                              ; Bucket 22
	.long	45                              ; Bucket 23
	.long	48                              ; Bucket 24
	.long	51                              ; Bucket 25
	.long	0                               ; Bucket 26
	.long	52                              ; Bucket 27
	.long	54                              ; Bucket 28
	.long	60                              ; Bucket 29
	.long	63                              ; Bucket 30
	.long	65                              ; Bucket 31
	.long	-104093792                      ; Hash in Bucket 0
	.long	239667265                       ; Hash in Bucket 1
	.long	-995619871                      ; Hash in Bucket 1
	.long	290821634                       ; Hash in Bucket 2
	.long	857652610                       ; Hash in Bucket 2
	.long	-2064127614                     ; Hash in Bucket 2
	.long	-863244222                      ; Hash in Bucket 2
	.long	119187235                       ; Hash in Bucket 3
	.long	2090147939                      ; Hash in Bucket 3
	.long	2090324355                      ; Hash in Bucket 3
	.long	-1529859549                     ; Hash in Bucket 3
	.long	-1921963995                     ; Hash in Bucket 5
	.long	-995076187                      ; Hash in Bucket 5
	.long	274811398                       ; Hash in Bucket 6
	.long	784013319                       ; Hash in Bucket 7
	.long	1515446888                      ; Hash in Bucket 8
	.long	-1622544152                     ; Hash in Bucket 8
	.long	613501610                       ; Hash in Bucket 10
	.long	-1622611670                     ; Hash in Bucket 10
	.long	318612267                       ; Hash in Bucket 11
	.long	1502454315                      ; Hash in Bucket 11
	.long	-1654759093                     ; Hash in Bucket 11
	.long	-735823797                      ; Hash in Bucket 11
	.long	-680914900                      ; Hash in Bucket 12
	.long	-1622434163                     ; Hash in Bucket 13
	.long	-1304652851                     ; Hash in Bucket 13
	.long	1515446894                      ; Hash in Bucket 14
	.long	2090320366                      ; Hash in Bucket 14
	.long	-353240273                      ; Hash in Bucket 15
	.long	193495088                       ; Hash in Bucket 16
	.long	270584624                       ; Hash in Bucket 16
	.long	789719536                       ; Hash in Bucket 16
	.long	-680906448                      ; Hash in Bucket 16
	.long	878862258                       ; Hash in Bucket 18
	.long	-680910478                      ; Hash in Bucket 18
	.long	-103762318                      ; Hash in Bucket 18
	.long	466678419                       ; Hash in Bucket 19
	.long	274395349                       ; Hash in Bucket 21
	.long	1029845589                      ; Hash in Bucket 21
	.long	1819312437                      ; Hash in Bucket 21
	.long	2090479413                      ; Hash in Bucket 21
	.long	-995574987                      ; Hash in Bucket 21
	.long	-282664779                      ; Hash in Bucket 21
	.long	-995607786                      ; Hash in Bucket 22
	.long	2090587831                      ; Hash in Bucket 23
	.long	-1206934473                     ; Hash in Bucket 23
	.long	-995522697                      ; Hash in Bucket 23
	.long	274802008                       ; Hash in Bucket 24
	.long	1516504248                      ; Hash in Bucket 24
	.long	-2011034344                     ; Hash in Bucket 24
	.long	227759321                       ; Hash in Bucket 25
	.long	217009403                       ; Hash in Bucket 27
	.long	277697659                       ; Hash in Bucket 27
	.long	301260540                       ; Hash in Bucket 28
	.long	773352188                       ; Hash in Bucket 28
	.long	1768099900                      ; Hash in Bucket 28
	.long	-1343633636                     ; Hash in Bucket 28
	.long	-995244932                      ; Hash in Bucket 28
	.long	-994990788                      ; Hash in Bucket 28
	.long	120857757                       ; Hash in Bucket 29
	.long	290711645                       ; Hash in Bucket 29
	.long	2090106493                      ; Hash in Bucket 29
	.long	1474546142                      ; Hash in Bucket 30
	.long	-995076194                      ; Hash in Bucket 30
	.long	290644127                       ; Hash in Bucket 31
	.long	165                             ; String in Bucket 0: unsigned char
	.long	1192                            ; String in Bucket 1: vm_op_Jr
	.long	1171                            ; String in Bucket 1: vm_op_Call
	.long	185                             ; String in Bucket 2: uint64_t
	.long	194                             ; String in Bucket 2: unsigned long long
	.long	1301                            ; String in Bucket 2: assertionfailed
	.long	1505                            ; String in Bucket 2: closure
	.long	1317                            ; String in Bucket 3: invalidtrap
	.long	507                             ; String in Bucket 3: char
	.long	219                             ; String in Bucket 3: heap
	.long	1134                            ; String in Bucket 3: vm_op_LoaduI
	.long	1012                            ; String in Bucket 5: long long
	.long	1212                            ; String in Bucket 5: vm_op_Retu
	.long	213                             ; String in Bucket 6: state
	.long	1043                            ; String in Bucket 7: ptrdiff_t
	.long	1147                            ; String in Bucket 8: vm_op_LoadC
	.long	1058                            ; String in Bucket 8: int32_t
	.long	1349                            ; String in Bucket 10: invalidlayout
	.long	1022                            ; String in Bucket 10: int16_t
	.long	1277                            ; String in Bucket 11: diverge
	.long	1159                            ; String in Bucket 11: vm_op_Apply
	.long	1290                            ; String in Bucket 11: unusedexta
	.long	424                             ; String in Bucket 11: function
	.long	1182                            ; String in Bucket 12: vm_op_Jmp
	.long	1004                            ; String in Bucket 13: int64_t
	.long	120                             ; String in Bucket 13: unsigned int
	.long	1122                            ; String in Bucket 14: vm_op_LoadI
	.long	1285                            ; String in Bucket 14: halt
	.long	1335                            ; String in Bucket 15: stackoverflow
	.long	1066                            ; String in Bucket 16: int
	.long	1329                            ; String in Bucket 16: panic
	.long	157                             ; String in Bucket 16: uint8_t
	.long	1223                            ; String in Bucket 16: vm_op_Ret
	.long	142                             ; String in Bucket 18: unsigned short
	.long	1090                            ; String in Bucket 18: vm_op_Nop
	.long	383                             ; String in Bucket 18: unsigned long
	.long	360                             ; String in Bucket 19: size_t
	.long	1030                            ; String in Bucket 21: short
	.long	277                             ; String in Bucket 21: runtime_args
	.long	88                              ; String in Bucket 21: dispatch
	.long	1053                            ; String in Bucket 21: long
	.long	1201                            ; String in Bucket 21: vm_op_Disp
	.long	367                             ; String in Bucket 21: __darwin_size_t
	.long	1256                            ; String in Bucket 22: vm_op_Clos
	.long	1417                            ; String in Bucket 23: op_t
	.long	1267                            ; String in Bucket 23: undefined
	.long	1111                            ; String in Bucket 23: vm_op_Exta
	.long	1426                            ; String in Bucket 24: ssz_t
	.long	1244                            ; String in Bucket 24: vm_op_MkObj
	.long	1451                            ; String in Bucket 24: metainfo
	.long	1070                            ; String in Bucket 25: vm_entry
	.long	445                             ; String in Bucket 27: __ARRAY_SIZE_TYPE__
	.long	179                             ; String in Bucket 27: val_t
	.long	1441                            ; String in Bucket 28: object
	.long	1363                            ; String in Bucket 28: unimplemented
	.long	1377                            ; String in Bucket 28: status_t
	.long	97                              ; String in Bucket 28: opthread
	.long	1100                            ; String in Bucket 28: vm_op_Move
	.long	1079                            ; String in Bucket 28: vm_op_Trap
	.long	1036                            ; String in Bucket 29: joff_t
	.long	111                             ; String in Bucket 29: uint32_t
	.long	106                             ; String in Bucket 29: bc_t
	.long	302                             ; String in Bucket 30: trace_level_t
	.long	1233                            ; String in Bucket 30: vm_op_Retn
	.long	133                             ; String in Bucket 31: uint16_t
.set Lset66, Lnames7-Lnames_entries0    ; Offset in Bucket 0
	.long	Lset66
.set Lset67, Lnames42-Lnames_entries0   ; Offset in Bucket 1
	.long	Lset67
.set Lset68, Lnames40-Lnames_entries0   ; Offset in Bucket 1
	.long	Lset68
.set Lset69, Lnames9-Lnames_entries0    ; Offset in Bucket 2
	.long	Lset69
.set Lset70, Lnames10-Lnames_entries0   ; Offset in Bucket 2
	.long	Lset70
.set Lset71, Lnames53-Lnames_entries0   ; Offset in Bucket 2
	.long	Lset71
.set Lset72, Lnames64-Lnames_entries0   ; Offset in Bucket 2
	.long	Lset72
.set Lset73, Lnames54-Lnames_entries0   ; Offset in Bucket 3
	.long	Lset73
.set Lset74, Lnames20-Lnames_entries0   ; Offset in Bucket 3
	.long	Lset74
.set Lset75, Lnames12-Lnames_entries0   ; Offset in Bucket 3
	.long	Lset75
.set Lset76, Lnames37-Lnames_entries0   ; Offset in Bucket 3
	.long	Lset76
.set Lset77, Lnames23-Lnames_entries0   ; Offset in Bucket 5
	.long	Lset77
.set Lset78, Lnames44-Lnames_entries0   ; Offset in Bucket 5
	.long	Lset78
.set Lset79, Lnames11-Lnames_entries0   ; Offset in Bucket 6
	.long	Lset79
.set Lset80, Lnames27-Lnames_entries0   ; Offset in Bucket 7
	.long	Lset80
.set Lset81, Lnames38-Lnames_entries0   ; Offset in Bucket 8
	.long	Lset81
.set Lset82, Lnames29-Lnames_entries0   ; Offset in Bucket 8
	.long	Lset82
.set Lset83, Lnames57-Lnames_entries0   ; Offset in Bucket 10
	.long	Lset83
.set Lset84, Lnames24-Lnames_entries0   ; Offset in Bucket 10
	.long	Lset84
.set Lset85, Lnames50-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset85
.set Lset86, Lnames39-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset86
.set Lset87, Lnames52-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset87
.set Lset88, Lnames18-Lnames_entries0   ; Offset in Bucket 11
	.long	Lset88
.set Lset89, Lnames41-Lnames_entries0   ; Offset in Bucket 12
	.long	Lset89
.set Lset90, Lnames22-Lnames_entries0   ; Offset in Bucket 13
	.long	Lset90
.set Lset91, Lnames3-Lnames_entries0    ; Offset in Bucket 13
	.long	Lset91
.set Lset92, Lnames36-Lnames_entries0   ; Offset in Bucket 14
	.long	Lset92
.set Lset93, Lnames51-Lnames_entries0   ; Offset in Bucket 14
	.long	Lset93
.set Lset94, Lnames56-Lnames_entries0   ; Offset in Bucket 15
	.long	Lset94
.set Lset95, Lnames30-Lnames_entries0   ; Offset in Bucket 16
	.long	Lset95
.set Lset96, Lnames55-Lnames_entries0   ; Offset in Bucket 16
	.long	Lset96
.set Lset97, Lnames6-Lnames_entries0    ; Offset in Bucket 16
	.long	Lset97
.set Lset98, Lnames45-Lnames_entries0   ; Offset in Bucket 16
	.long	Lset98
.set Lset99, Lnames5-Lnames_entries0    ; Offset in Bucket 18
	.long	Lset99
.set Lset100, Lnames33-Lnames_entries0  ; Offset in Bucket 18
	.long	Lset100
.set Lset101, Lnames17-Lnames_entries0  ; Offset in Bucket 18
	.long	Lset101
.set Lset102, Lnames15-Lnames_entries0  ; Offset in Bucket 19
	.long	Lset102
.set Lset103, Lnames25-Lnames_entries0  ; Offset in Bucket 21
	.long	Lset103
.set Lset104, Lnames13-Lnames_entries0  ; Offset in Bucket 21
	.long	Lset104
.set Lset105, Lnames21-Lnames_entries0  ; Offset in Bucket 21
	.long	Lset105
.set Lset106, Lnames28-Lnames_entries0  ; Offset in Bucket 21
	.long	Lset106
.set Lset107, Lnames43-Lnames_entries0  ; Offset in Bucket 21
	.long	Lset107
.set Lset108, Lnames16-Lnames_entries0  ; Offset in Bucket 21
	.long	Lset108
.set Lset109, Lnames48-Lnames_entries0  ; Offset in Bucket 22
	.long	Lset109
.set Lset110, Lnames60-Lnames_entries0  ; Offset in Bucket 23
	.long	Lset110
.set Lset111, Lnames49-Lnames_entries0  ; Offset in Bucket 23
	.long	Lset111
.set Lset112, Lnames35-Lnames_entries0  ; Offset in Bucket 23
	.long	Lset112
.set Lset113, Lnames61-Lnames_entries0  ; Offset in Bucket 24
	.long	Lset113
.set Lset114, Lnames47-Lnames_entries0  ; Offset in Bucket 24
	.long	Lset114
.set Lset115, Lnames63-Lnames_entries0  ; Offset in Bucket 24
	.long	Lset115
.set Lset116, Lnames31-Lnames_entries0  ; Offset in Bucket 25
	.long	Lset116
.set Lset117, Lnames19-Lnames_entries0  ; Offset in Bucket 27
	.long	Lset117
.set Lset118, Lnames8-Lnames_entries0   ; Offset in Bucket 27
	.long	Lset118
.set Lset119, Lnames62-Lnames_entries0  ; Offset in Bucket 28
	.long	Lset119
.set Lset120, Lnames58-Lnames_entries0  ; Offset in Bucket 28
	.long	Lset120
.set Lset121, Lnames59-Lnames_entries0  ; Offset in Bucket 28
	.long	Lset121
.set Lset122, Lnames0-Lnames_entries0   ; Offset in Bucket 28
	.long	Lset122
.set Lset123, Lnames34-Lnames_entries0  ; Offset in Bucket 28
	.long	Lset123
.set Lset124, Lnames32-Lnames_entries0  ; Offset in Bucket 28
	.long	Lset124
.set Lset125, Lnames26-Lnames_entries0  ; Offset in Bucket 29
	.long	Lset125
.set Lset126, Lnames2-Lnames_entries0   ; Offset in Bucket 29
	.long	Lset126
.set Lset127, Lnames1-Lnames_entries0   ; Offset in Bucket 29
	.long	Lset127
.set Lset128, Lnames14-Lnames_entries0  ; Offset in Bucket 30
	.long	Lset128
.set Lset129, Lnames46-Lnames_entries0  ; Offset in Bucket 30
	.long	Lset129
.set Lset130, Lnames4-Lnames_entries0   ; Offset in Bucket 31
	.long	Lset130
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
Lnames7:
L21:
	.byte	1                               ; Abbreviation code
	.long	165                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned char
Lnames42:
L47:
	.byte	2                               ; Abbreviation code
	.long	2814                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Jr
Lnames40:
L40:
	.byte	2                               ; Abbreviation code
	.long	2492                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Call
Lnames9:
L57:
	.byte	3                               ; Abbreviation code
	.long	187                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint64_t
Lnames10:
L62:
	.byte	1                               ; Abbreviation code
	.long	195                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned long long
Lnames53:
L13:
	.byte	2                               ; Abbreviation code
	.long	4426                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: assertionfailed
Lnames64:
L33:
	.byte	4                               ; Abbreviation code
	.long	5091                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: closure
Lnames54:
L17:
	.byte	2                               ; Abbreviation code
	.long	4516                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: invalidtrap
Lnames20:
L32:
	.byte	1                               ; Abbreviation code
	.long	539                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: char
Lnames12:
L39:
	.byte	4                               ; Abbreviation code
	.long	310                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: heap
Lnames37:
L58:
	.byte	2                               ; Abbreviation code
	.long	2013                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_LoaduI
Lnames23:
L12:
	.byte	1                               ; Abbreviation code
	.long	954                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: long long
Lnames44:
L53:
	.byte	2                               ; Abbreviation code
	.long	3135                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Retu
Lnames11:
L38:
	.byte	4                               ; Abbreviation code
	.long	209                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: state
Lnames27:
L54:
	.byte	3                               ; Abbreviation code
	.long	983                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: ptrdiff_t
Lnames38:
L3:
	.byte	2                               ; Abbreviation code
	.long	2156                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_LoadC
Lnames29:
L42:
	.byte	3                               ; Abbreviation code
	.long	995                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int32_t
Lnames57:
L41:
	.byte	2                               ; Abbreviation code
	.long	4834                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: invalidlayout
Lnames24:
L4:
	.byte	3                               ; Abbreviation code
	.long	958                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int16_t
Lnames50:
L51:
	.byte	2                               ; Abbreviation code
	.long	4156                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: diverge
Lnames39:
L10:
	.byte	2                               ; Abbreviation code
	.long	2312                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Apply
Lnames52:
L31:
	.byte	2                               ; Abbreviation code
	.long	4336                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unusedexta
Lnames18:
L15:
	.byte	4                               ; Abbreviation code
	.long	485                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: function
Lnames41:
L14:
	.byte	2                               ; Abbreviation code
	.long	2671                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Jmp
Lnames22:
L6:
	.byte	3                               ; Abbreviation code
	.long	946                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int64_t
Lnames3:
L25:
	.byte	1                               ; Abbreviation code
	.long	141                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned int
Lnames36:
L11:
	.byte	2                               ; Abbreviation code
	.long	1870                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_LoadI
Lnames51:
L44:
	.byte	2                               ; Abbreviation code
	.long	4246                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: halt
Lnames56:
L34:
	.byte	2                               ; Abbreviation code
	.long	4744                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: stackoverflow
Lnames30:
L46:
	.byte	1                               ; Abbreviation code
	.long	1003                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: int
Lnames55:
L19:
	.byte	2                               ; Abbreviation code
	.long	4606                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: panic
Lnames6:
L49:
	.byte	3                               ; Abbreviation code
	.long	157                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint8_t
Lnames45:
L8:
	.byte	2                               ; Abbreviation code
	.long	3306                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Ret
Lnames5:
L50:
	.byte	1                               ; Abbreviation code
	.long	153                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned short
Lnames33:
L36:
	.byte	2                               ; Abbreviation code
	.long	1494                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Nop
Lnames17:
L59:
	.byte	1                               ; Abbreviation code
	.long	476                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unsigned long
Lnames15:
L7:
	.byte	3                               ; Abbreviation code
	.long	460                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: size_t
Lnames25:
L64:
	.byte	1                               ; Abbreviation code
	.long	966                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: short
Lnames13:
L16:
	.byte	4                               ; Abbreviation code
	.long	389                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: runtime_args
Lnames21:
L56:
	.byte	5                               ; Abbreviation code
	.long	35                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: dispatch
Lnames28:
L61:
	.byte	1                               ; Abbreviation code
	.long	991                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: long
Lnames43:
L23:
	.byte	2                               ; Abbreviation code
	.long	2969                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Disp
Lnames16:
L43:
	.byte	3                               ; Abbreviation code
	.long	468                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __darwin_size_t
Lnames48:
L27:
	.byte	2                               ; Abbreviation code
	.long	3968                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Clos
Lnames60:
L22:
	.byte	3                               ; Abbreviation code
	.long	5022                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: op_t
Lnames49:
L29:
	.byte	2                               ; Abbreviation code
	.long	4066                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: undefined
Lnames35:
L52:
	.byte	2                               ; Abbreviation code
	.long	1780                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Exta
Lnames61:
L1:
	.byte	3                               ; Abbreviation code
	.long	5030                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: ssz_t
Lnames47:
L45:
	.byte	2                               ; Abbreviation code
	.long	3741                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_MkObj
Lnames63:
L20:
	.byte	3                               ; Abbreviation code
	.long	5067                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: metainfo
Lnames31:
L5:
	.byte	2                               ; Abbreviation code
	.long	1007                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_entry
Lnames19:
L2:
	.byte	1                               ; Abbreviation code
	.long	520                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: __ARRAY_SIZE_TYPE__
Lnames8:
L37:
	.byte	3                               ; Abbreviation code
	.long	179                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: val_t
Lnames62:
L48:
	.byte	4                               ; Abbreviation code
	.long	5043                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: object
Lnames58:
L60:
	.byte	2                               ; Abbreviation code
	.long	4924                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: unimplemented
Lnames59:
L28:
	.byte	3                               ; Abbreviation code
	.long	5014                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: status_t
Lnames0:
L9:
	.byte	3                               ; Abbreviation code
	.long	69                              ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: opthread
Lnames34:
L0:
	.byte	2                               ; Abbreviation code
	.long	1625                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Move
Lnames32:
L30:
	.byte	2                               ; Abbreviation code
	.long	1143                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Trap
Lnames26:
L55:
	.byte	3                               ; Abbreviation code
	.long	970                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: joff_t
Lnames2:
L18:
	.byte	3                               ; Abbreviation code
	.long	133                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint32_t
Lnames1:
L24:
	.byte	3                               ; Abbreviation code
	.long	125                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: bc_t
Lnames14:
L63:
	.byte	3                               ; Abbreviation code
	.long	431                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: trace_level_t
Lnames46:
L35:
	.byte	2                               ; Abbreviation code
	.long	3501                            ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: vm_op_Retn
Lnames4:
L26:
	.byte	3                               ; Abbreviation code
	.long	145                             ; DW_IDX_die_offset
	.byte	0                               ; DW_IDX_parent
                                        ; End of list: uint16_t
	.p2align	2, 0x0
Lnames_end0:
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
