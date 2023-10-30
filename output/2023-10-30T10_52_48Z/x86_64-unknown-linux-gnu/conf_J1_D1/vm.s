	.text
	.file	"vm.c"
	.globl	vm_entry                        # -- Begin function vm_entry
	.p2align	4, 0x90
	.type	vm_entry,@function
vm_entry:                               # @vm_entry
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	40(%rdi), %rsi
	movq	(%rdi), %rax
	movq	8(%rdi), %r12
	leaq	12(%rax), %rbx
	movzbl	8(%rax), %r8d
	movzbl	9(%rax), %edx
	movswl	10(%rax), %ecx
	leaq	dispatch(%rip), %rbp
	callq	*(%rbp,%r8,8)
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	vm_entry, .Lfunc_end0-vm_entry
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_NOP
	.type	vm_op_NOP,@function
vm_op_NOP:                              # @vm_op_NOP
	.cfi_startproc
# %bb.0:                                # %entry
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end1:
	.size	vm_op_NOP, .Lfunc_end1-vm_op_NOP
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_STOPii
	.type	vm_op_STOPii,@function
vm_op_STOPii:                           # @vm_op_STOPii
	.cfi_startproc
# %bb.0:                                # %entry
	movzwl	%cx, %eax
	cmpl	%edx, %eax
	jbe	.LBB2_4
# %bb.1:                                # %for.body.preheader
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsi, %rbx
	movzbl	%dl, %r14d
	movl	%eax, %r12d
	leaq	.L.str(%rip), %r15
	.p2align	4, 0x90
.LBB2_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx,%r14,8), %rdx
	movq	%r15, %rdi
	movl	%r14d, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	incq	%r14
	cmpq	%r14, %r12
	jne	.LBB2_2
# %bb.3:
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
.LBB2_4:                                # %for.cond.cleanup
	retq
.Lfunc_end2:
	.size	vm_op_STOPii, .Lfunc_end2-vm_op_STOPii
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPLTll
	.type	vm_op_CMPLTll,@function
vm_op_CMPLTll:                          # @vm_op_CMPLTll
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movl	%edx, %ecx
	movq	(%rsi,%rcx,8), %rcx
	cmpq	(%rsi,%rax,8), %rcx
	jge	.LBB3_2
# %bb.1:
	xorl	%ecx, %ecx
	jmp	.LBB3_3
.LBB3_2:                                # %cond.false
	movswq	2(%rbx), %rcx
.LBB3_3:                                # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end3:
	.size	vm_op_CMPLTll, .Lfunc_end3-vm_op_CMPLTll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPLEll
	.type	vm_op_CMPLEll,@function
vm_op_CMPLEll:                          # @vm_op_CMPLEll
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movl	%edx, %ecx
	movq	(%rsi,%rcx,8), %rcx
	cmpq	(%rsi,%rax,8), %rcx
	jle	.LBB4_1
# %bb.2:                                # %cond.false
	movswq	2(%rbx), %rcx
	jmp	.LBB4_3
.LBB4_1:
	xorl	%ecx, %ecx
.LBB4_3:                                # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end4:
	.size	vm_op_CMPLEll, .Lfunc_end4-vm_op_CMPLEll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPEQll
	.type	vm_op_CMPEQll,@function
vm_op_CMPEQll:                          # @vm_op_CMPEQll
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movl	%edx, %ecx
	movq	(%rsi,%rcx,8), %rcx
	cmpq	(%rsi,%rax,8), %rcx
	jne	.LBB5_2
# %bb.1:
	xorl	%ecx, %ecx
	jmp	.LBB5_3
.LBB5_2:                                # %cond.false
	movswq	2(%rbx), %rcx
.LBB5_3:                                # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end5:
	.size	vm_op_CMPEQll, .Lfunc_end5-vm_op_CMPEQll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPNEll
	.type	vm_op_CMPNEll,@function
vm_op_CMPNEll:                          # @vm_op_CMPNEll
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movl	%edx, %ecx
	movq	(%rsi,%rcx,8), %rcx
	cmpq	(%rsi,%rax,8), %rcx
	jne	.LBB6_1
# %bb.2:                                # %cond.false
	movswq	2(%rbx), %rcx
	jmp	.LBB6_3
.LBB6_1:
	xorl	%ecx, %ecx
.LBB6_3:                                # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end6:
	.size	vm_op_CMPNEll, .Lfunc_end6-vm_op_CMPNEll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPLTli
	.type	vm_op_CMPLTli,@function
vm_op_CMPLTli:                          # @vm_op_CMPLTli
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edx, %eax
	movslq	%ecx, %rcx
	cmpq	%rcx, (%rsi,%rax,8)
	jge	.LBB7_2
# %bb.1:
	xorl	%ecx, %ecx
	jmp	.LBB7_3
.LBB7_2:                                # %cond.false
	movswq	2(%rbx), %rcx
.LBB7_3:                                # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end7:
	.size	vm_op_CMPLTli, .Lfunc_end7-vm_op_CMPLTli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPLEli
	.type	vm_op_CMPLEli,@function
vm_op_CMPLEli:                          # @vm_op_CMPLEli
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edx, %eax
	movslq	%ecx, %rcx
	cmpq	%rcx, (%rsi,%rax,8)
	jle	.LBB8_1
# %bb.2:                                # %cond.false
	movswq	2(%rbx), %rcx
	jmp	.LBB8_3
.LBB8_1:
	xorl	%ecx, %ecx
.LBB8_3:                                # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end8:
	.size	vm_op_CMPLEli, .Lfunc_end8-vm_op_CMPLEli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPGTli
	.type	vm_op_CMPGTli,@function
vm_op_CMPGTli:                          # @vm_op_CMPGTli
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edx, %eax
	movslq	%ecx, %rcx
	cmpq	%rcx, (%rsi,%rax,8)
	jle	.LBB9_2
# %bb.1:
	xorl	%ecx, %ecx
	jmp	.LBB9_3
.LBB9_2:                                # %cond.false
	movswq	2(%rbx), %rcx
.LBB9_3:                                # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end9:
	.size	vm_op_CMPGTli, .Lfunc_end9-vm_op_CMPGTli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPGEli
	.type	vm_op_CMPGEli,@function
vm_op_CMPGEli:                          # @vm_op_CMPGEli
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edx, %eax
	movslq	%ecx, %rcx
	cmpq	%rcx, (%rsi,%rax,8)
	jge	.LBB10_1
# %bb.2:                                # %cond.false
	movswq	2(%rbx), %rcx
	jmp	.LBB10_3
.LBB10_1:
	xorl	%ecx, %ecx
.LBB10_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end10:
	.size	vm_op_CMPGEli, .Lfunc_end10-vm_op_CMPGEli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPEQli
	.type	vm_op_CMPEQli,@function
vm_op_CMPEQli:                          # @vm_op_CMPEQli
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edx, %eax
	movslq	%ecx, %rcx
	cmpq	%rcx, (%rsi,%rax,8)
	jne	.LBB11_2
# %bb.1:
	xorl	%ecx, %ecx
	jmp	.LBB11_3
.LBB11_2:                               # %cond.false
	movswq	2(%rbx), %rcx
.LBB11_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end11:
	.size	vm_op_CMPEQli, .Lfunc_end11-vm_op_CMPEQli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPNEli
	.type	vm_op_CMPNEli,@function
vm_op_CMPNEli:                          # @vm_op_CMPNEli
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edx, %eax
	movslq	%ecx, %rcx
	cmpq	%rcx, (%rsi,%rax,8)
	jne	.LBB12_1
# %bb.2:                                # %cond.false
	movswq	2(%rbx), %rcx
	jmp	.LBB12_3
.LBB12_1:
	xorl	%ecx, %ecx
.LBB12_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end12:
	.size	vm_op_CMPNEli, .Lfunc_end12-vm_op_CMPNEli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPLTlc
	.type	vm_op_CMPLTlc,@function
vm_op_CMPLTlc:                          # @vm_op_CMPLTlc
	.cfi_startproc
# %bb.0:                                # %entry
	movq	32(%rdi), %rax
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	movslq	%ecx, %rcx
	cmpq	(%rax,%rcx,8), %rdx
	jge	.LBB13_2
# %bb.1:
	xorl	%ecx, %ecx
	jmp	.LBB13_3
.LBB13_2:                               # %cond.false
	movswq	2(%rbx), %rcx
.LBB13_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end13:
	.size	vm_op_CMPLTlc, .Lfunc_end13-vm_op_CMPLTlc
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPLElc
	.type	vm_op_CMPLElc,@function
vm_op_CMPLElc:                          # @vm_op_CMPLElc
	.cfi_startproc
# %bb.0:                                # %entry
	movq	32(%rdi), %rax
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	movslq	%ecx, %rcx
	cmpq	(%rax,%rcx,8), %rdx
	jle	.LBB14_1
# %bb.2:                                # %cond.false
	movswq	2(%rbx), %rcx
	jmp	.LBB14_3
.LBB14_1:
	xorl	%ecx, %ecx
.LBB14_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end14:
	.size	vm_op_CMPLElc, .Lfunc_end14-vm_op_CMPLElc
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPGTlc
	.type	vm_op_CMPGTlc,@function
vm_op_CMPGTlc:                          # @vm_op_CMPGTlc
	.cfi_startproc
# %bb.0:                                # %entry
	movq	32(%rdi), %rax
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	movslq	%ecx, %rcx
	cmpq	(%rax,%rcx,8), %rdx
	jle	.LBB15_2
# %bb.1:
	xorl	%ecx, %ecx
	jmp	.LBB15_3
.LBB15_2:                               # %cond.false
	movswq	2(%rbx), %rcx
.LBB15_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end15:
	.size	vm_op_CMPGTlc, .Lfunc_end15-vm_op_CMPGTlc
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPGElc
	.type	vm_op_CMPGElc,@function
vm_op_CMPGElc:                          # @vm_op_CMPGElc
	.cfi_startproc
# %bb.0:                                # %entry
	movq	32(%rdi), %rax
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	movslq	%ecx, %rcx
	cmpq	(%rax,%rcx,8), %rdx
	jge	.LBB16_1
# %bb.2:                                # %cond.false
	movswq	2(%rbx), %rcx
	jmp	.LBB16_3
.LBB16_1:
	xorl	%ecx, %ecx
.LBB16_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end16:
	.size	vm_op_CMPGElc, .Lfunc_end16-vm_op_CMPGElc
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPEQlc
	.type	vm_op_CMPEQlc,@function
vm_op_CMPEQlc:                          # @vm_op_CMPEQlc
	.cfi_startproc
# %bb.0:                                # %entry
	movq	32(%rdi), %rax
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	movslq	%ecx, %rcx
	cmpq	(%rax,%rcx,8), %rdx
	jne	.LBB17_2
# %bb.1:
	xorl	%ecx, %ecx
	jmp	.LBB17_3
.LBB17_2:                               # %cond.false
	movswq	2(%rbx), %rcx
.LBB17_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end17:
	.size	vm_op_CMPEQlc, .Lfunc_end17-vm_op_CMPEQlc
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CMPNElc
	.type	vm_op_CMPNElc,@function
vm_op_CMPNElc:                          # @vm_op_CMPNElc
	.cfi_startproc
# %bb.0:                                # %entry
	movq	32(%rdi), %rax
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	movslq	%ecx, %rcx
	cmpq	(%rax,%rcx,8), %rdx
	jne	.LBB18_1
# %bb.2:                                # %cond.false
	movswq	2(%rbx), %rcx
	jmp	.LBB18_3
.LBB18_1:
	xorl	%ecx, %ecx
.LBB18_3:                               # %cond.end
	leaq	(%rbx,%rcx,4), %rax
	addq	$8, %rax
	movzbl	4(%rbx,%rcx,4), %r8d
	movzbl	5(%rbx,%rcx,4), %edx
	movswl	6(%rbx,%rcx,4), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end18:
	.size	vm_op_CMPNElc, .Lfunc_end18-vm_op_CMPNElc
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_ADDlli
	.type	vm_op_ADDlli,@function
vm_op_ADDlli:                           # @vm_op_ADDlli
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movzbl	%ch, %ecx
	movl	%edx, %edx
	addq	(%rsi,%rdx,8), %rcx
	movq	%rcx, (%rsi,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end19:
	.size	vm_op_ADDlli, .Lfunc_end19-vm_op_ADDlli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_SUBlli
	.type	vm_op_SUBlli,@function
vm_op_SUBlli:                           # @vm_op_SUBlli
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movzbl	%ch, %ecx
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	subq	%rcx, %rdx
	movq	%rdx, (%rsi,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end20:
	.size	vm_op_SUBlli, .Lfunc_end20-vm_op_SUBlli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_MULlli
	.type	vm_op_MULlli,@function
vm_op_MULlli:                           # @vm_op_MULlli
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movzbl	%ch, %ecx
	movl	%edx, %edx
	imulq	(%rsi,%rdx,8), %rcx
	movq	%rcx, (%rsi,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end21:
	.size	vm_op_MULlli, .Lfunc_end21-vm_op_MULlli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_DIVlli
	.type	vm_op_DIVlli,@function
vm_op_DIVlli:                           # @vm_op_DIVlli
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, %r8
	movzbl	%ch, %edi
	movl	%edx, %eax
	movq	(%rsi,%rax,8), %rax
	movq	%rax, %rdx
	shrq	$32, %rdx
	je	.LBB22_1
# %bb.2:
	xorl	%edx, %edx
	divq	%rdi
	jmp	.LBB22_3
.LBB22_1:
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%edi
                                        # kill: def $eax killed $eax def $rax
.LBB22_3:
	movzbl	%cl, %ecx
	movq	%rax, (%rsi,%rcx,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %edi
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%rdi,8), %r9
	movq	%rax, %rbx
	movq	%r8, %rdi
	jmpq	*%r9                            # TAILCALL
.Lfunc_end22:
	.size	vm_op_DIVlli, .Lfunc_end22-vm_op_DIVlli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_REMlli
	.type	vm_op_REMlli,@function
vm_op_REMlli:                           # @vm_op_REMlli
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, %r8
	movzbl	%ch, %edi
	movl	%edx, %eax
	movq	(%rsi,%rax,8), %rax
	movq	%rax, %rdx
	shrq	$32, %rdx
	je	.LBB23_1
# %bb.2:
	xorl	%edx, %edx
	divq	%rdi
	jmp	.LBB23_3
.LBB23_1:
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%edi
                                        # kill: def $edx killed $edx def $rdx
.LBB23_3:
	xorl	%eax, %eax
	testq	%rdx, %rdx
	movl	$0, %r9d
	cmoveq	%rdi, %r9
	testq	%rdi, %rdi
	cmovneq	%rax, %r9
	addq	%rdx, %r9
	movzbl	%cl, %eax
	movq	%r9, (%rsi,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %edi
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%rdi,8), %r9
	movq	%rax, %rbx
	movq	%r8, %rdi
	jmpq	*%r9                            # TAILCALL
.Lfunc_end23:
	.size	vm_op_REMlli, .Lfunc_end23-vm_op_REMlli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_DIRlli
	.type	vm_op_DIRlli,@function
vm_op_DIRlli:                           # @vm_op_DIRlli
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, %r8
	movzbl	%ch, %edi
	movl	%edx, %eax
	movq	(%rsi,%rax,8), %rax
	movq	%rax, %rdx
	shrq	$32, %rdx
	je	.LBB24_1
# %bb.2:
	xorl	%edx, %edx
	divq	%rdi
	jmp	.LBB24_3
.LBB24_1:
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%edi
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
.LBB24_3:
	movzbl	%cl, %ecx
	movq	%rax, (%rsi,%rcx,8)
	movq	%rdx, 8(%rsi,%rcx,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %edi
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%rdi,8), %r9
	movq	%rax, %rbx
	movq	%r8, %rdi
	jmpq	*%r9                            # TAILCALL
.Lfunc_end24:
	.size	vm_op_DIRlli, .Lfunc_end24-vm_op_DIRlli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_ADDlll
	.type	vm_op_ADDlll,@function
vm_op_ADDlll:                           # @vm_op_ADDlll
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movzbl	%ch, %ecx
	movl	%edx, %edx
	movq	(%rsi,%rcx,8), %rcx
	addq	(%rsi,%rdx,8), %rcx
	movq	%rcx, (%rsi,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end25:
	.size	vm_op_ADDlll, .Lfunc_end25-vm_op_ADDlll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_SUBlll
	.type	vm_op_SUBlll,@function
vm_op_SUBlll:                           # @vm_op_SUBlll
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movzbl	%ch, %ecx
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	subq	(%rsi,%rcx,8), %rdx
	movq	%rdx, (%rsi,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end26:
	.size	vm_op_SUBlll, .Lfunc_end26-vm_op_SUBlll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_MULlll
	.type	vm_op_MULlll,@function
vm_op_MULlll:                           # @vm_op_MULlll
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movzbl	%ch, %ecx
	movl	%edx, %edx
	movq	(%rsi,%rcx,8), %rcx
	imulq	(%rsi,%rdx,8), %rcx
	movq	%rcx, (%rsi,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end27:
	.size	vm_op_MULlll, .Lfunc_end27-vm_op_MULlll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_DIVlll
	.type	vm_op_DIVlll,@function
vm_op_DIVlll:                           # @vm_op_DIVlll
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, %r9
	movzbl	%ch, %edi
	movl	%edx, %eax
	movq	(%rsi,%rax,8), %rax
	movq	(%rsi,%rdi,8), %r8
	movq	%rax, %rdx
	orq	%r8, %rdx
	shrq	$32, %rdx
	je	.LBB28_1
# %bb.2:
	xorl	%edx, %edx
	divq	%r8
	jmp	.LBB28_3
.LBB28_1:
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%r8d
                                        # kill: def $eax killed $eax def $rax
.LBB28_3:
	movzbl	%cl, %ecx
	movq	%rax, (%rsi,%rcx,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %edi
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%rdi,8), %r8
	movq	%rax, %rbx
	movq	%r9, %rdi
	jmpq	*%r8                            # TAILCALL
.Lfunc_end28:
	.size	vm_op_DIVlll, .Lfunc_end28-vm_op_DIVlll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_REMlll
	.type	vm_op_REMlll,@function
vm_op_REMlll:                           # @vm_op_REMlll
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, %r9
	movzbl	%ch, %edi
	movl	%edx, %eax
	movq	(%rsi,%rax,8), %rax
	movq	(%rsi,%rdi,8), %r8
	movq	%rax, %rdx
	orq	%r8, %rdx
	shrq	$32, %rdx
	je	.LBB29_1
# %bb.2:
	xorl	%edx, %edx
	divq	%r8
	jmp	.LBB29_3
.LBB29_1:
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%r8d
                                        # kill: def $edx killed $edx def $rdx
.LBB29_3:
	movzbl	%cl, %eax
	movq	%rdx, (%rsi,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %edi
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%rdi,8), %r8
	movq	%rax, %rbx
	movq	%r9, %rdi
	jmpq	*%r8                            # TAILCALL
.Lfunc_end29:
	.size	vm_op_REMlll, .Lfunc_end29-vm_op_REMlll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_DIRlll
	.type	vm_op_DIRlll,@function
vm_op_DIRlll:                           # @vm_op_DIRlll
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, %r9
	movzbl	%ch, %edi
	movl	%edx, %eax
	movq	(%rsi,%rax,8), %rax
	movq	(%rsi,%rdi,8), %r8
	movq	%rax, %rdx
	orq	%r8, %rdx
	shrq	$32, %rdx
	je	.LBB30_1
# %bb.2:
	xorl	%edx, %edx
	divq	%r8
	jmp	.LBB30_3
.LBB30_1:
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%r8d
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
.LBB30_3:
	movzbl	%cl, %ecx
	movq	%rax, (%rsi,%rcx,8)
	movq	%rdx, 8(%rsi,%rcx,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %edi
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%rdi,8), %r8
	movq	%rax, %rbx
	movq	%r9, %rdi
	jmpq	*%r8                            # TAILCALL
.Lfunc_end30:
	.size	vm_op_DIRlll, .Lfunc_end30-vm_op_DIRlll
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CONSTli
	.type	vm_op_CONSTli,@function
vm_op_CONSTli:                          # @vm_op_CONSTli
	.cfi_startproc
# %bb.0:                                # %entry
	movslq	%ecx, %rax
	movl	%edx, %ecx
	movq	%rax, (%rsi,%rcx,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end31:
	.size	vm_op_CONSTli, .Lfunc_end31-vm_op_CONSTli
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CLOSkxi
	.type	vm_op_CLOSkxi,@function
vm_op_CLOSkxi:                          # @vm_op_CLOSkxi
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edx, %r13d
	movq	%rsi, %r14
	movq	%rdi, (%rsp)                    # 8-byte Spill
	movzbl	%cl, %r15d
	movzbl	%ch, %eax
	leal	24(,%rax,8), %edi
	callq	immix_malloc@PLT
	movq	(%r12,%r15,8), %rcx
	movq	%rcx, 8(%rax)
	movq	$0, 16(%rax)
	movl	%r13d, %ecx
	movq	%rax, (%r14,%rcx,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %esi
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%rsi,8), %r8
	movq	%rax, %rbx
	movq	(%rsp), %rdi                    # 8-byte Reload
	movq	%r14, %rsi
	popq	%rax
	.cfi_def_cfa_offset 8
	jmpq	*%r8                            # TAILCALL
.Lfunc_end32:
	.size	vm_op_CLOSkxi, .Lfunc_end32-vm_op_CLOSkxi
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_APPLYpi
	.type	vm_op_APPLYpi,@function
vm_op_APPLYpi:                          # @vm_op_APPLYpi
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rbx, %rax
	movl	%edx, %r9d
	movq	(%rsi,%r9,8), %r8
	movq	8(%r8), %rbx
	leaq	(%rsi,%r9,8), %rsi
	addq	$16, %rsi
	cmpq	48(%rdi), %rsi
	jae	.LBB33_1
# %bb.2:                                # %if.end
	movq	%rax, -8(%rsi)
	movq	%r8, (%rsi)
	leaq	12(%rbx), %rax
	movzbl	8(%rbx), %r8d
	movzbl	9(%rbx), %edx
	movswl	10(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.LBB33_1:                               # %if.then
	addq	$8, %rbx
	movzbl	%dl, %edx
	jmp	stackoverflow                   # TAILCALL
.Lfunc_end33:
	.size	vm_op_APPLYpi, .Lfunc_end33-vm_op_APPLYpi
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CALLpxi
	.type	vm_op_CALLpxi,@function
vm_op_CALLpxi:                          # @vm_op_CALLpxi
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rbx, %rax
	movzbl	%cl, %r8d
	movq	(%r12,%r8,8), %rbx
	movl	%edx, %r8d
	leaq	(%rsi,%r8,8), %rsi
	addq	$16, %rsi
	cmpq	48(%rdi), %rsi
	jae	.LBB34_1
# %bb.2:                                # %if.end
	movq	%rax, -8(%rsi)
	leaq	12(%rbx), %rax
	movzbl	8(%rbx), %r8d
	movzbl	9(%rbx), %edx
	movswl	10(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.LBB34_1:                               # %if.then
	addq	$8, %rbx
	movzbl	%dl, %edx
	jmp	stackoverflow                   # TAILCALL
.Lfunc_end34:
	.size	vm_op_CALLpxi, .Lfunc_end34-vm_op_CALLpxi
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_OSETpip
	.type	vm_op_OSETpip,@function
vm_op_OSETpip:                          # @vm_op_OSETpip
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movzbl	%ch, %ecx
	movl	%edx, %edx
	movq	(%rsi,%rdx,8), %rdx
	movq	(%rsi,%rcx,8), %rcx
	movq	%rcx, 8(%rdx,%rax,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end35:
	.size	vm_op_OSETpip, .Lfunc_end35-vm_op_OSETpip
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_OGETppi
	.type	vm_op_OGETppi,@function
vm_op_OGETppi:                          # @vm_op_OGETppi
	.cfi_startproc
# %bb.0:                                # %entry
	movzbl	%cl, %eax
	movzbl	%ch, %ecx
	movq	(%rsi,%rax,8), %rax
	movq	8(%rax,%rcx,8), %rax
	movl	%edx, %ecx
	movq	%rax, (%rsi,%rcx,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end36:
	.size	vm_op_OGETppi, .Lfunc_end36-vm_op_OGETppi
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_CLOSGETpi
	.type	vm_op_CLOSGETpi,@function
vm_op_CLOSGETpi:                        # @vm_op_CLOSGETpi
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rsi), %rax
	movl	%ecx, %ecx
	movq	8(%rax,%rcx,8), %rax
	movl	%edx, %ecx
	movq	%rax, (%rsi,%rcx,8)
	leaq	4(%rbx), %rax
	movzbl	(%rbx), %r8d
	movzbl	1(%rbx), %edx
	movswl	2(%rbx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end37:
	.size	vm_op_CLOSGETpi, .Lfunc_end37-vm_op_CLOSGETpi
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_JUMPj
	.type	vm_op_JUMPj,@function
vm_op_JUMPj:                            # @vm_op_JUMPj
	.cfi_startproc
# %bb.0:                                # %entry
	movslq	%ecx, %rcx
	leaq	(%rbx,%rcx), %rax
	addq	$4, %rax
	movzbl	(%rbx,%rcx), %r8d
	movzbl	1(%rbx,%rcx), %edx
	movswl	2(%rbx,%rcx), %ecx
	movq	(%rbp,%r8,8), %r8
	movq	%rax, %rbx
	jmpq	*%r8                            # TAILCALL
.Lfunc_end38:
	.size	vm_op_JUMPj, .Lfunc_end38-vm_op_JUMPj
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function vm_op_RETp
	.type	vm_op_RETp,@function
vm_op_RETp:                             # @vm_op_RETp
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edx, %eax
	movq	(%rsi,%rax,8), %rax
	movq	%rax, -16(%rsi)
	movq	-8(%rsi), %rax
	movzbl	-3(%rax), %ecx
	shlq	$3, %rcx
	negq	%rcx
	addq	%rcx, %rsi
	addq	$-16, %rsi
	leaq	4(%rax), %rbx
	movzbl	(%rax), %r8d
	movzbl	1(%rax), %edx
	movswl	2(%rax), %ecx
	movq	(%rbp,%r8,8), %rax
	jmpq	*%rax                           # TAILCALL
.Lfunc_end39:
	.size	vm_op_RETp, .Lfunc_end39-vm_op_RETp
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function stackoverflow
	.type	stackoverflow,@function
stackoverflow:                          # @stackoverflow
	.cfi_startproc
# %bb.0:                                # %entry
	leaq	.L.str.2(%rip), %rax
	movq	%rax, 24(%rdi)
	jmp	panic                           # TAILCALL
.Lfunc_end40:
	.size	stackoverflow, .Lfunc_end40-stackoverflow
	.cfi_endproc
                                        # -- End function
	.p2align	6, 0x90                         # -- Begin function panic
	.type	panic,@function
panic:                                  # @panic
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	24(%rdi), %rdx
	leaq	.L.str.3(%rip), %rsi
	movq	%rax, %rdi
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$255, %edi
	callq	exit@PLT
.Lfunc_end41:
	.size	panic, .Lfunc_end41-panic
	.cfi_endproc
                                        # -- End function
	.type	dispatch,@object                # @dispatch
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
dispatch:
	.quad	vm_op_NOP
	.quad	vm_op_STOPii
	.quad	vm_op_CMPLTll
	.quad	vm_op_CMPLEll
	.quad	vm_op_CMPEQll
	.quad	vm_op_CMPNEll
	.quad	vm_op_CMPLTli
	.quad	vm_op_CMPLEli
	.quad	vm_op_CMPGTli
	.quad	vm_op_CMPGEli
	.quad	vm_op_CMPEQli
	.quad	vm_op_CMPNEli
	.quad	vm_op_CMPLTlc
	.quad	vm_op_CMPLElc
	.quad	vm_op_CMPGTlc
	.quad	vm_op_CMPGElc
	.quad	vm_op_CMPEQlc
	.quad	vm_op_CMPNElc
	.quad	vm_op_ADDlli
	.quad	vm_op_SUBlli
	.quad	vm_op_MULlli
	.quad	vm_op_DIVlli
	.quad	vm_op_REMlli
	.quad	vm_op_DIRlli
	.quad	vm_op_ADDlll
	.quad	vm_op_SUBlll
	.quad	vm_op_MULlll
	.quad	vm_op_DIVlll
	.quad	vm_op_REMlll
	.quad	vm_op_DIRlll
	.quad	vm_op_CONSTli
	.quad	vm_op_CLOSkxi
	.quad	vm_op_APPLYpi
	.quad	vm_op_CALLpxi
	.quad	vm_op_OSETpip
	.quad	vm_op_OGETppi
	.quad	vm_op_CLOSGETpi
	.quad	vm_op_JUMPj
	.quad	vm_op_RETp
	.size	dispatch, 312

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"slot[%u] 0x%lx\n"
	.size	.L.str, 16

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"stack overflow"
	.size	.L.str.2, 15

	.type	.L.str.3,@object                # @.str.3
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
