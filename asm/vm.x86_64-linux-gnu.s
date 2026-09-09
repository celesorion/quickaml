# zig 0.15.1, clang version 20.1.2 (https://github.com/ziglang/zig-bootstrap c6bc9398c72c7a63fe9420a9055dcfd1845bc266): zig cc -O3 -std=c2x -Wall -Wextra -DNDEBUG -DJUMP_MODE=0 -DDECODE_MODE=1 -g0 -Wno-unused-command-line-argument -target x86_64-linux-gnu -S src/vm.c
	.file	"vm.c"
	.text
	.globl	vm_entry                        # -- Begin function vm_entry
	.p2align	4
	.type	vm_entry,@function
vm_entry:                               # @vm_entry
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r15
	movq	(%rdi), %rax
	movq	8(%rax), %rcx
	movq	16(%rcx), %r12
	leaq	104(%rdi), %r13
	movq	%rcx, %rdx
	orq	$1, %rdx
	movq	%rdx, 88(%rdi)
	movq	$0, 96(%rdi)
	movq	32(%rcx), %rcx
	movq	%rcx, 16(%rdi)
	movq	16(%rax), %rcx
	movzbl	(%r12), %eax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	leaq	dispatch(%rip), %rdx
	movabsq	$-562949953421312, %r14         # imm = 0xFFFE000000000000
	callq	*(%rdx,%rax,8)
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end:
	.size	vm_entry, .Lfunc_end-vm_entry
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Halt
	.type	vm_op_Halt,@function
vm_op_Halt:                             # @vm_op_Halt
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end:
	.size	vm_op_Halt, .Lfunc_end-vm_op_Halt
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Nop
	.type	vm_op_Nop,@function
vm_op_Nop:                              # @vm_op_Nop
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_Nop, .Lfunc_end-vm_op_Nop
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function vm_op_Exta
	.type	vm_op_Exta,@function
vm_op_Exta:                             # @vm_op_Exta
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	unusedexta                      # TAILCALL
.Lfunc_end:
	.size	vm_op_Exta, .Lfunc_end-vm_op_Exta
                                        # -- End function
	.text
	.p2align	5                               # -- Begin function vm_op_LoadI
	.type	vm_op_LoadI,@function
vm_op_LoadI:                            # @vm_op_LoadI
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movswq	%di, %rax
	movl	%eax, %eax
	orq	%r14, %rax
	movl	%esi, %esi
	movq	%rax, (%r13,%rsi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_LoadI, .Lfunc_end-vm_op_LoadI
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_LoaduI
	.type	vm_op_LoaduI,@function
vm_op_LoaduI:                           # @vm_op_LoaduI
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, %eax
	orq	%r14, %rax
	movl	%esi, %esi
	movq	%rax, (%r13,%rsi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_LoaduI, .Lfunc_end-vm_op_LoaduI
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_LoadR
	.type	vm_op_LoadR,@function
vm_op_LoadR:                            # @vm_op_LoadR
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	cmpl	$7, %edi
	ja	.L2
# %bb.1:
	movl	$197, %eax
	btl	%edi, %eax
	jae	.L2
# %bb.3:
	movzwl	%di, %eax
	movzbl	%sil, %esi
	movq	%rax, (%r13,%rsi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L2:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	badop                           # TAILCALL
.Lfunc_end:
	.size	vm_op_LoadR, .Lfunc_end-vm_op_LoadR
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_LoadC
	.type	vm_op_LoadC,@function
vm_op_LoadC:                            # @vm_op_LoadC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	16(%r15), %rax
	movl	%edi, %edi
	movq	(%rax,%rdi,8), %rax
	movl	%esi, %esi
	movq	%rax, (%r13,%rsi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_LoadC, .Lfunc_end-vm_op_LoadC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_LoadType
	.type	vm_op_LoadType,@function
vm_op_LoadType:                         # @vm_op_LoadType
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	(%r15), %rax
	movl	%edi, %r8d
	cmpq	%r8, 40(%rax)
	jbe	.L1
# %bb.2:
	movq	24(%rax), %rax
	movq	(%rax,%r8,8), %rax
	orq	$4, %rax
	movzbl	%sil, %esi
	movq	%rax, (%r13,%rsi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L1:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	badop                           # TAILCALL
.Lfunc_end:
	.size	vm_op_LoadType, .Lfunc_end-vm_op_LoadType
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_LoadFree
	.type	vm_op_LoadFree,@function
vm_op_LoadFree:                         # @vm_op_LoadFree
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	-16(%r13), %r8
	testl	%edi, %edi
	je	.L3
# %bb.1:
	movzwl	%di, %eax
	cmpl	%eax, 47(%r8)
	jb	.L4
# %bb.2:
	movl	%edi, %eax
	movq	47(%r8,%rax,8), %r8
.L3:
	movzbl	%sil, %eax
	movq	%r8, (%r13,%rax,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L4:
	movzbl	%sil, %esi
	movl	%eax, %edi
	popq	%rbp
	jmp	badop                           # TAILCALL
.Lfunc_end:
	.size	vm_op_LoadFree, .Lfunc_end-vm_op_LoadFree
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_LoadField
	.type	vm_op_LoadField,@function
vm_op_LoadField:                        # @vm_op_LoadField
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %ebx
	movl	%edi, %r8d
	movzbl	%r8b, %eax
	movq	(%r13,%rax,8), %rdi
	movq	16(%r15), %rax
	movl	%r8d, %esi
	shrl	$8, %esi
	movq	(%rax,%rsi,8), %rsi
	callq	member_slot
	testq	%rax, %rax
	je	.L1
# %bb.2:
	movq	(%rax), %rax
	movzbl	%bl, %esi
	movq	%rax, (%r13,%rsi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L1:
	movzwl	%r8w, %edi
	movzbl	%bl, %esi
	popq	%rbp
	jmp	nomember                        # TAILCALL
.Lfunc_end:
	.size	vm_op_LoadField, .Lfunc_end-vm_op_LoadField
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_SetField
	.type	vm_op_SetField,@function
vm_op_SetField:                         # @vm_op_SetField
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rcx, -8(%rbp)                  # 8-byte Spill
	movq	%rdx, %rcx
	movl	%esi, %ebx
	movl	%edi, %r9d
	movzbl	%r9b, %eax
	movq	(%r13,%rax,8), %rdi
	movq	16(%r15), %r10
	movl	%r9d, %r8d
	shrl	$8, %r8d
	movq	(%r10,%r8,8), %rsi
	leaq	-16(%rbp), %rdx
	callq	field_slot
	testq	%rax, %rax
	je	.L1
# %bb.3:
	movq	(%r15), %rdx
	movq	(%rdx), %rdi
	movq	-16(%rbp), %rdx
	movzbl	%bl, %esi
	movq	(%r13,%rsi,8), %rsi
	movq	%rsi, (%rax)
	cmpl	$1, 40(%rdi)
	jne	.L6
# %bb.4:
	movl	$768, %eax                      # imm = 0x300
	andl	(%rdx), %eax
	cmpl	$512, %eax                      # imm = 0x200
	je	.L5
.L6:
	movzbl	(%r12), %eax
	movq	(%rcx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	%rcx, %rdx
	movq	-8(%rbp), %rcx                  # 8-byte Reload
	addq	$16, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L1:
	movq	(%r10,%r8,8), %rsi
	callq	member_slot
	movzwl	%r9w, %edi
	movzbl	%bl, %esi
	movq	%rcx, %rdx
	testq	%rax, %rax
	jne	.L2
# %bb.7:
	movq	-8(%rbp), %rcx                  # 8-byte Reload
	addq	$16, %rsp
	popq	%rbp
	jmp	nomember                        # TAILCALL
.L2:
	movq	-8(%rbp), %rcx                  # 8-byte Reload
	addq	$16, %rsp
	popq	%rbp
	jmp	notafield                       # TAILCALL
.L5:
	callq	gc_store_field_slow@PLT
	jmp	.L6
.Lfunc_end:
	.size	vm_op_SetField, .Lfunc_end-vm_op_SetField
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_LoadInd
	.type	vm_op_LoadInd,@function
vm_op_LoadInd:                          # @vm_op_LoadInd
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rcx, %r8
	movq	%rdx, %r9
	movl	%esi, %ebx
	movl	%edi, %r10d
	movzbl	%r10b, %eax
	movl	%edi, %ecx
	shrl	$8, %ecx
	movl	(%r12), %edx
	shrl	$8, %edx
	movq	(%r13,%rax,8), %rsi
	testq	%rsi, %rsi
	je	.L6
# %bb.1:
	movq	%r14, %rax
	orq	$2, %rax
	andq	%rsi, %rax
	jne	.L6
# %bb.2:
	movq	%rsi, %rax
	andq	$-8, %rax
	movl	(%rax), %edi
	movl	%edi, %r11d
	andl	$254, %r11d
	cmpl	$4, %r11d
	jne	.L6
# %bb.3:
	movq	24(%r15), %r11
	movq	(%r11,%rdx,8), %r11
	orq	$4, %r11
	cmpq	%r11, 16(%rax)
	jne	.L6
# %bb.4:
	andl	$5, %edi
	cmpl	$4, %edi
	jne	.L8
# %bb.5:
	addq	$16, %rax
	movl	%ecx, %ecx
	leaq	(%rax,%rcx,8), %rax
	addq	$8, %rax
	jmp	.L9
.L6:
	movq	(%r15), %rdi
	callq	typed_member_slow
	testq	%rax, %rax
	je	.L7
.L9:
	movq	(%rax), %rax
	movzbl	%bl, %ecx
	movq	%rax, (%r13,%rcx,8)
	movzbl	4(%r12), %eax
	movq	(%r9,%rax,8), %rax
	movzbl	5(%r12), %esi
	movzwl	6(%r12), %edi
	addq	$8, %r12
	movq	%r9, %rdx
	movq	%r8, %rcx
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L8:
	movq	24(%rax), %rdx
	andq	$-8, %rdx
	movzbl	32(%rax,%rcx), %eax
	leaq	(%rdx,%rax,8), %rax
	addq	$24, %rax
	jmp	.L9
.L7:
	addq	$4, %r12
	movzwl	%r10w, %edi
	movzbl	%bl, %esi
	movq	%r9, %rdx
	movq	%r8, %rcx
	popq	%rbp
	jmp	nomember                        # TAILCALL
.Lfunc_end:
	.size	vm_op_LoadInd, .Lfunc_end-vm_op_LoadInd
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_SetInd
	.type	vm_op_SetInd,@function
vm_op_SetInd:                           # @vm_op_SetInd
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rcx, %r11
	movq	%rdx, %r10
	movl	%esi, %ebx
	movl	%edi, %r9d
	movzbl	%r9b, %eax
	movl	%edi, %ecx
	shrl	$8, %ecx
	movl	(%r12), %edx
	shrl	$8, %edx
	movq	(%r13,%rax,8), %rsi
	testq	%rsi, %rsi
	je	.L6
# %bb.1:
	movq	%r14, %rax
	orq	$2, %rax
	andq	%rsi, %rax
	jne	.L6
# %bb.2:
	movq	%rsi, %r8
	andq	$-8, %r8
	movl	(%r8), %eax
	movl	%eax, %edi
	andl	$254, %edi
	cmpl	$4, %edi
	jne	.L6
# %bb.3:
	movq	24(%r15), %rdi
	movq	(%rdi,%rdx,8), %rdi
	orq	$4, %rdi
	cmpq	%rdi, 16(%r8)
	jne	.L6
# %bb.4:
	andl	$5, %eax
	cmpl	$4, %eax
	jne	.L10
# %bb.5:
	leaq	16(%r8), %rax
	movl	%ecx, %ecx
	leaq	(%rax,%rcx,8), %rax
	addq	$8, %rax
	jmp	.L11
.L6:
	movq	%r11, -8(%rbp)                  # 8-byte Spill
	movq	(%r15), %rdi
	leaq	-16(%rbp), %r8
	callq	typed_field_slow
	testq	%rax, %rax
	je	.L8
# %bb.7:
	movq	-16(%rbp), %r8
	movq	-8(%rbp), %r11                  # 8-byte Reload
.L11:
	movq	(%r15), %rcx
	movq	(%rcx), %rdi
	movzbl	%bl, %ecx
	movq	(%r13,%rcx,8), %rsi
	movq	%rsi, (%rax)
	cmpl	$1, 40(%rdi)
	jne	.L14
# %bb.12:
	movl	$768, %eax                      # imm = 0x300
	andl	(%r8), %eax
	cmpl	$512, %eax                      # imm = 0x200
	je	.L13
.L14:
	movzbl	4(%r12), %eax
	movq	(%r10,%rax,8), %rax
	movzbl	5(%r12), %esi
	movzwl	6(%r12), %edi
	addq	$8, %r12
	movq	%r10, %rdx
	movq	%r11, %rcx
	addq	$16, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L10:
	movzbl	32(%r8,%rcx), %eax
	movq	24(%r8), %r8
	andq	$-8, %r8
	leaq	(%r8,%rax,8), %rax
	addq	$24, %rax
	jmp	.L11
.L8:
	callq	typed_member_slow
	addq	$4, %r12
	movzwl	%r9w, %edi
	movzbl	%bl, %esi
	movq	%r10, %rdx
	testq	%rax, %rax
	jne	.L9
# %bb.15:
	movq	-8(%rbp), %rcx                  # 8-byte Reload
	addq	$16, %rsp
	popq	%rbp
	jmp	nomember                        # TAILCALL
.L13:
	movq	%r11, %rax
	callq	gc_store_field_slow@PLT
	movq	%rax, %r11
	jmp	.L14
.L9:
	movq	-8(%rbp), %rcx                  # 8-byte Reload
	addq	$16, %rsp
	popq	%rbp
	jmp	notafield                       # TAILCALL
.Lfunc_end:
	.size	vm_op_SetInd, .Lfunc_end-vm_op_SetInd
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_View
	.type	vm_op_View,@function
vm_op_View:                             # @vm_op_View
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%esi, %r8d
	movl	%edi, %eax
	shrl	$8, %eax
	movq	(%r13,%rax,8), %r9
	leaq	7(%r14), %rax
	andq	%r9, %rax
	cmpq	$4, %rax
	jne	.L19
# %bb.1:
	movzbl	%dil, %eax
	movq	(%r13,%rax,8), %r10
	testq	%r10, %r10
	je	.L20
# %bb.2:
	movq	%r14, %rax
	orq	$2, %rax
	andq	%r10, %rax
	jne	.L20
# %bb.3:
	andq	$-8, %r10
	movzbl	(%r10), %eax
	cmpq	$5, %rax
	jne	.L5
# %bb.4:
	movq	24(%r10), %r10
	andq	$-8, %r10
	movzbl	(%r10), %eax
.L5:
	cmpl	$4, %eax
	jne	.L20
# %bb.6:
	movq	16(%r10), %rax
	cmpq	%r9, %rax
	jne	.L9
# %bb.7:
	movzbl	%r8b, %eax
	movq	%r10, (%r13,%rax,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	jmp	.L8
.L9:
	movl	%edi, -8(%rbp)                  # 4-byte Spill
	movq	%rdx, -24(%rbp)                 # 8-byte Spill
	movq	(%r15), %rdx
	movq	%rdx, -32(%rbp)                 # 8-byte Spill
	addq	$-4, %r9
	movq	12(%rax), %rdi
	andq	$-8, %rdi
	movq	16(%r9), %rsi
	andq	$-8, %rsi
	leaq	-40(%rbp), %rdx
	callq	view_template
	testq	%rax, %rax
	je	.L10
# %bb.14:
	movq	%rax, %rbx
	movl	%r8d, -12(%rbp)                 # 4-byte Spill
	movl	(%rsi), %r8d
	addl	$39, %r8d
	andl	$-8, %r8d
	movq	%r8, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	alloc_object@PLT
	testq	%rax, %rax
	je	.L15
# %bb.16:
	movq	%rcx, -8(%rbp)                  # 8-byte Spill
	movq	%rax, %rdi
	movq	%r9, %rsi
	movq	%r10, %rdx
	movq	%rbx, %rcx
	callq	view_init@PLT
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	movq	(%rcx), %rdi
	movq	%rax, %rsi
	callq	gc_publish_new_object@PLT
	movzbl	-12(%rbp), %ecx                 # 1-byte Folded Reload
	movq	%rax, (%r13,%rcx,8)
	cmpb	$0, 65(%r15)
	je	.L17
.L18:
	movzbl	(%r12), %eax
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	-8(%rbp), %rcx                  # 8-byte Reload
.L8:
	addq	$48, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L20:
	movzwl	%di, %edi
	movzbl	%r8b, %esi
	addq	$48, %rsp
	popq	%rbp
	jmp	notaninstance                   # TAILCALL
.L19:
	movzwl	%di, %edi
	movzbl	%r8b, %esi
	addq	$48, %rsp
	popq	%rbp
	jmp	notatype                        # TAILCALL
.L10:
	movq	-40(%rbp), %rdx
	testq	%rdx, %rdx
	jne	.L13
# %bb.11:
	movzwl	-8(%rbp), %edi                  # 2-byte Folded Reload
	movzbl	%r8b, %esi
	jmp	.L12
.L15:
	movzwl	-8(%rbp), %edi                  # 2-byte Folded Reload
	movzbl	-12(%rbp), %esi                 # 1-byte Folded Reload
.L12:
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	jmp	outofmemory                     # TAILCALL
.L17:
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r8, %rdx
	callq	gc_poll_slow@PLT
	jmp	.L18
.L13:
	callq	cannotview_format
	movzwl	-8(%rbp), %edi                  # 2-byte Folded Reload
	movzbl	%r8b, %esi
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	jmp	cannotview                      # TAILCALL
.Lfunc_end:
	.size	vm_op_View, .Lfunc_end-vm_op_View
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Move
	.type	vm_op_Move,@function
vm_op_Move:                             # @vm_op_Move
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, %eax
	movq	(%r13,%rax,8), %rax
	movl	%esi, %esi
	movq	%rax, (%r13,%rsi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_Move, .Lfunc_end-vm_op_Move
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Apply
	.type	vm_op_Apply,@function
vm_op_Apply:                            # @vm_op_Apply
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%esi, %r9d
	movq	(%r13,%r9,8), %r8
	leaq	7(%r14), %rax
	andq	%r8, %rax
	cmpq	$1, %rax
	jne	.L5
# %bb.1:
	movq	15(%r8), %rax
	cmpb	$0, 65(%r15)
	je	.L2
.L3:
	leaq	(,%r9,8), %r10
	addq	%r13, %r10
	leaq	16(%r13,%r9,8), %r13
	movzbl	51(%r8), %r9d
	leaq	(%r10,%r9,8), %r9
	addq	$16, %r9
	cmpq	56(%r15), %r9
	ja	.L6
# %bb.4:
	movq	%r8, -16(%r13)
	movq	%r12, -8(%r13)
	movq	31(%r8), %rsi
	movq	%rsi, 16(%r15)
	movzbl	(%rax), %esi
	movq	(%rdx,%rsi,8), %r8
	movzbl	1(%rax), %esi
	movzwl	2(%rax), %edi
	addq	$4, %rax
	movq	%rax, %r12
	addq	$16, %rsp
	popq	%rbp
	jmpq	*%r8                            # TAILCALL
.L5:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	addq	$16, %rsp
	popq	%rbp
	jmp	notafunction                    # TAILCALL
.L2:
	movq	%rdx, -8(%rbp)                  # 8-byte Spill
	movl	$256, %edx                      # imm = 0x100
	movl	%edi, %ebx
	movq	%r15, %rdi
	movl	%esi, %r10d
	movq	%r13, %rsi
	callq	gc_poll_slow@PLT
	movl	%ebx, %edi
	movl	%r10d, %esi
	movq	-8(%rbp), %rdx                  # 8-byte Reload
	jmp	.L3
.L6:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	movq	%rax, %r12
	addq	$16, %rsp
	popq	%rbp
	jmp	stackoverflow                   # TAILCALL
.Lfunc_end:
	.size	vm_op_Apply, .Lfunc_end-vm_op_Apply
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Invoke
	.type	vm_op_Invoke,@function
vm_op_Invoke:                           # @vm_op_Invoke
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %r8d
	movl	%edi, %ebx
	movzbl	%bl, %eax
	movq	(%r13,%rax,8), %rdi
	leaq	7(%r14), %rax
	andq	%rdi, %rax
	cmpq	$4, %rax
	je	.L3
# %bb.1:
	movq	16(%r15), %rax
	movl	%ebx, %esi
	shrl	$8, %esi
	movq	(%rax,%rsi,8), %rsi
	callq	member_slot
	testq	%rax, %rax
	je	.L4
# %bb.2:
	movq	(%rax), %rax
	movzbl	%r8b, %esi
	movq	%rax, (%r13,%rsi,8)
	movzwl	%bx, %edi
	popq	%rbp
	jmp	vm_op_Apply                     # TAILCALL
.L3:
	movzwl	%bx, %edi
	movzbl	%r8b, %esi
	popq	%rbp
	jmp	notaninstance                   # TAILCALL
.L4:
	movzwl	%bx, %edi
	movzbl	%r8b, %esi
	popq	%rbp
	jmp	nomember                        # TAILCALL
.Lfunc_end:
	.size	vm_op_Invoke, .Lfunc_end-vm_op_Invoke
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Call
	.type	vm_op_Call,@function
vm_op_Call:                             # @vm_op_Call
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	movl	%edi, %r8d
	movq	(%rcx,%r8,8), %r8
	movq	16(%r8), %r12
	cmpb	$0, 65(%r15)
	je	.L1
.L2:
	movzbl	%sil, %esi
	leaq	(,%rsi,8), %r9
	addq	%r13, %r9
	leaq	16(%r13,%rsi,8), %r13
	movzbl	52(%r8), %r10d
	leaq	(%r9,%r10,8), %r9
	addq	$16, %r9
	cmpq	56(%r15), %r9
	ja	.L3
# %bb.4:
	movq	%r8, %rsi
	orq	$1, %rsi
	movq	%rsi, -16(%r13)
	movq	%rax, -8(%r13)
	movq	32(%r8), %rax
	movq	%rax, 16(%r15)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L1:
	movq	%rdx, %r9
	movl	$256, %edx                      # imm = 0x100
	movl	%edi, %ebx
	movq	%r15, %rdi
	movl	%esi, %r10d
	movq	%r13, %rsi
	callq	gc_poll_slow@PLT
	movl	%r10d, %esi
	movl	%ebx, %edi
	movq	%r9, %rdx
	jmp	.L2
.L3:
	movzwl	%di, %edi
	popq	%rbp
	jmp	stackoverflow                   # TAILCALL
.Lfunc_end:
	.size	vm_op_Call, .Lfunc_end-vm_op_Call
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Native
	.type	vm_op_Native,@function
vm_op_Native:                           # @vm_op_Native
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	%edi, %ebx
	movl	%edi, %eax
	movq	nnatives@GOTPCREL(%rip), %rdi
	cmpq	%rax, (%rdi)
	jbe	.L3
# %bb.1:
	movq	%r12, -16(%rbp)                 # 8-byte Spill
	movl	%esi, %r12d
	movq	%rcx, -24(%rbp)                 # 8-byte Spill
	movq	%rdx, -8(%rbp)                  # 8-byte Spill
	leaq	(%rax,%rax,2), %rax
	movq	natives@GOTPCREL(%rip), %rcx
	leaq	-32(%rbp), %rdx
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	*16(%rcx,%rax,8)
	testq	%rax, %rax
	jne	.L4
# %bb.2:
	movq	-32(%rbp), %rcx
	leaq	-16(%r13), %rax
	movq	%rcx, -16(%r13)
	movq	-8(%r13), %r12
	movzbl	-3(%r12), %ecx
	shll	$3, %ecx
	subq	%rcx, %rax
	movq	-16(%rax), %rcx
	movq	31(%rcx), %rcx
	movq	%rcx, 16(%r15)
	movzbl	(%r12), %ecx
	movq	-8(%rbp), %rdx                  # 8-byte Reload
	movq	(%rdx,%rcx,8), %r8
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	%rax, %r13
	movq	-24(%rbp), %rcx                 # 8-byte Reload
	addq	$32, %rsp
	popq	%rbp
	jmpq	*%r8                            # TAILCALL
.L3:
	movzwl	%bx, %edi
	movzbl	%sil, %esi
	addq	$32, %rsp
	popq	%rbp
	jmp	badop                           # TAILCALL
.L4:
	movzwl	%bx, %edi
	movzbl	%r12b, %esi
	movq	-16(%rbp), %r12                 # 8-byte Reload
	movq	-8(%rbp), %rdx                  # 8-byte Reload
	movq	%rax, %rcx
	addq	$32, %rsp
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	vm_op_Native, .Lfunc_end-vm_op_Native
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Retu
	.type	vm_op_Retu,@function
vm_op_Retu:                             # @vm_op_Retu
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	-16(%r13), %rax
	movq	$0, -16(%r13)
	movq	-8(%r13), %r12
	movzbl	-3(%r12), %esi
	shll	$3, %esi
	subq	%rsi, %rax
	movq	-16(%rax), %rsi
	movq	31(%rsi), %rsi
	movq	%rsi, 16(%r15)
	movzbl	(%r12), %esi
	movq	(%rdx,%rsi,8), %r8
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	%rax, %r13
	popq	%rbp
	jmpq	*%r8                            # TAILCALL
.Lfunc_end:
	.size	vm_op_Retu, .Lfunc_end-vm_op_Retu
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Ret
	.type	vm_op_Ret,@function
vm_op_Ret:                              # @vm_op_Ret
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %eax
	movq	(%r13,%rax,8), %rsi
	leaq	-16(%r13), %rax
	movq	%rsi, -16(%r13)
	movq	-8(%r13), %r12
	movzbl	-3(%r12), %esi
	shll	$3, %esi
	subq	%rsi, %rax
	movq	-16(%rax), %rsi
	movq	31(%rsi), %rsi
	movq	%rsi, 16(%r15)
	movzbl	(%r12), %esi
	movq	(%rdx,%rsi,8), %r8
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	%rax, %r13
	popq	%rbp
	jmpq	*%r8                            # TAILCALL
.Lfunc_end:
	.size	vm_op_Ret, .Lfunc_end-vm_op_Ret
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Retn
	.type	vm_op_Retn,@function
vm_op_Retn:                             # @vm_op_Retn
# %bb.0:
	movq	%r13, %rax
	movq	-8(%r13), %r12
	addq	$-16, %r13
	testl	%edi, %edi
	je	.L8
# %bb.1:
	movzbl	%sil, %r8d
	movzwl	%di, %esi
	cmpw	$4, %si
	jae	.L3
# %bb.2:
	xorl	%edi, %edi
	jmp	.L6
.L3:
	movl	%esi, %edi
	andl	$-4, %edi
	leaq	(%rax,%r8,8), %r9
	addq	$16, %r9
	leal	(,%rsi,8), %r10d
	andl	$-32, %r10d
	xorl	%r11d, %r11d
	.p2align	4
.L4:                               # =>This Inner Loop Header: Depth=1
	movups	-16(%r9,%r11), %xmm0
	movups	(%r9,%r11), %xmm1
	movups	%xmm0, -16(%rax,%r11)
	movups	%xmm1, (%rax,%r11)
	addq	$32, %r11
	cmpq	%r11, %r10
	jne	.L4
# %bb.5:
	cmpl	%esi, %edi
	je	.L8
.L6:
	leaq	(%rax,%r8,8), %rax
	.p2align	4
.L7:                               # =>This Inner Loop Header: Depth=1
	movq	(%rax,%rdi,8), %r8
	movq	%r8, (%r13,%rdi,8)
	addq	$1, %rdi
	cmpq	%rdi, %rsi
	jne	.L7
.L8:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	-3(%r12), %eax
	shll	$3, %eax
	subq	%rax, %r13
	movq	-16(%r13), %rax
	movq	31(%rax), %rax
	movq	%rax, 16(%r15)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_Retn, .Lfunc_end-vm_op_Retn
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Clos
	.type	vm_op_Clos,@function
vm_op_Clos:                             # @vm_op_Clos
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdx, %rbx
	movl	%esi, -4(%rbp)                  # 4-byte Spill
	movq	(%r15), %r9
	movl	%edi, -8(%rbp)                  # 4-byte Spill
	movl	%edi, %eax
	movq	(%rcx,%rax,8), %r8
	movq	%r15, %rdi
	movq	%r8, %rsi
	movq	%r13, %rdx
	callq	thunk_alloc_instance
	testq	%rax, %rax
	je	.L8
# %bb.1:
	movq	%rax, %r10
	movq	%r14, -16(%rbp)                 # 8-byte Spill
	movq	%rbx, -24(%rbp)                 # 8-byte Spill
	movq	%rcx, -32(%rbp)                 # 8-byte Spill
	movl	48(%r8), %ebx
	testq	%rbx, %rbx
	je	.L5
# %bb.2:
	xorl	%r14d, %r14d
	leaq	-40(%rbp), %rdx
	.p2align	4
.L3:                               # =>This Inner Loop Header: Depth=1
	movq	56(%r8,%r14,8), %rdi
	movq	%r13, %rsi
	callq	capture_loc_resolve
	testb	%al, %al
	je	.L9
# %bb.4:                                #   in Loop: Header=BB23_3 Depth=1
	movq	-40(%rbp), %rax
	movq	%rax, 56(%r10,%r14,8)
	addq	$1, %r14
	cmpq	%r14, %rbx
	jne	.L3
.L5:
	movq	(%r9), %rdi
	movq	%r10, %rsi
	callq	gc_publish_new_object@PLT
	movq	%r10, %rax
	orq	$1, %rax
	movzbl	-4(%rbp), %ecx                  # 1-byte Folded Reload
	movq	%rax, (%r13,%rcx,8)
	cmpb	$0, 65(%r15)
	je	.L6
.L7:
	movzbl	(%r12), %eax
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	-16(%rbp), %r14                 # 8-byte Reload
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L9:
	movzwl	-8(%rbp), %edi                  # 2-byte Folded Reload
	movzbl	-4(%rbp), %esi                  # 1-byte Folded Reload
	movq	-16(%rbp), %r14                 # 8-byte Reload
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	jmp	badop                           # TAILCALL
.L8:
	movzwl	-8(%rbp), %edi                  # 2-byte Folded Reload
	movzbl	-4(%rbp), %esi                  # 1-byte Folded Reload
	movq	%rbx, %rdx
	addq	$48, %rsp
	popq	%rbp
	jmp	outofmemory                     # TAILCALL
.L6:
	movl	4(%r10), %edx
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	gc_poll_slow@PLT
	jmp	.L7
.Lfunc_end:
	.size	vm_op_Clos, .Lfunc_end-vm_op_Clos
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_WObj
	.type	vm_op_WObj,@function
vm_op_WObj:                             # @vm_op_WObj
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%esi, %r9d
	movl	%edi, %r8d
	movl	%r8d, %ebx
	movzbl	%r8b, %r10d
	cmpl	$3, %r10d
	je	.L22
# %bb.1:
	cmpl	$5, %r10d
	jae	.L22
# %bb.2:
	movq	(%r15), %rax
	movq	%rax, -40(%rbp)                 # 8-byte Spill
	shrl	$8, %r8d
	cmpl	$4, %r10d
	jne	.L5
# %bb.3:
	movzbl	%r9b, %esi
	movq	(%r13,%rsi,8), %rax
	leaq	7(%r14), %rdi
	andq	%rax, %rdi
	cmpq	$4, %rdi
	jne	.L23
# %bb.4:
	movq	12(%rax), %rax
	andq	$-8, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	cmpl	%eax, %r8d
	jne	.L23
.L5:
	movl	%r9d, -4(%rbp)                  # 4-byte Spill
	movq	%r14, -16(%rbp)                 # 8-byte Spill
	movq	%rdx, -24(%rbp)                 # 8-byte Spill
	movq	%rcx, -32(%rbp)                 # 8-byte Spill
	leal	23(,%r8,8), %r9d
	andl	$-8, %r9d
	movq	%r9, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	alloc_object@PLT
	testq	%rax, %rax
	je	.L25
# %bb.6:
	movl	%r8d, %edx
	movq	%rax, %rdi
	movl	%r10d, %esi
	callq	object_init@PLT
	movzwl	%bx, %edi
	cmpl	$256, %edi                      # imm = 0x100
	jb	.L20
# %bb.7:
	movzbl	-4(%rbp), %esi                  # 1-byte Folded Reload
	cmpl	$3584, %edi                     # imm = 0xE00
	jb	.L8
# %bb.9:
	leal	(,%rsi,8), %r8d
	movq	%rax, %r10
	subq	%r8, %r10
	subq	%r13, %r10
	addq	$16, %r10
	cmpq	$32, %r10
	jae	.L11
.L8:
	xorl	%edi, %edi
.L14:
	movq	%rdx, %r10
	movq	%rdi, %r8
	andq	$3, %r10
	je	.L17
# %bb.15:
	leaq	(,%rsi,8), %r11
	addq	%r13, %r11
	movq	%rdi, %r8
	.p2align	4
.L16:                              # =>This Inner Loop Header: Depth=1
	movq	(%r11,%r8,8), %r14
	movq	%r14, 16(%rax,%r8,8)
	addq	$1, %r8
	addq	$-1, %r10
	jne	.L16
.L17:
	subq	%rdx, %rdi
	cmpq	$-4, %rdi
	ja	.L20
# %bb.18:
	leaq	24(,%rsi,8), %rsi
	addq	%r13, %rsi
	.p2align	4
.L19:                              # =>This Inner Loop Header: Depth=1
	movq	-24(%rsi,%r8,8), %rdi
	movq	%rdi, 16(%rax,%r8,8)
	movq	-16(%rsi,%r8,8), %rdi
	movq	%rdi, 24(%rax,%r8,8)
	movq	-8(%rsi,%r8,8), %rdi
	movq	%rdi, 32(%rax,%r8,8)
	movq	(%rsi,%r8,8), %rdi
	movq	%rdi, 40(%rax,%r8,8)
	addq	$4, %r8
	cmpq	%r8, %rdx
	jne	.L19
	jmp	.L20
.L11:
	movl	%edx, %edi
	andl	$-4, %edi
	addq	%r13, %r8
	addq	$16, %r8
	shrl	$5, %ebx
	andl	$2016, %ebx                     # imm = 0x7E0
	xorl	%r10d, %r10d
	.p2align	4
.L12:                              # =>This Inner Loop Header: Depth=1
	movups	-16(%r8,%r10), %xmm0
	movups	(%r8,%r10), %xmm1
	movups	%xmm0, 16(%rax,%r10)
	movups	%xmm1, 32(%rax,%r10)
	addq	$32, %r10
	cmpq	%r10, %rbx
	jne	.L12
# %bb.13:
	cmpl	%edx, %edi
	jne	.L14
.L20:
	movq	-40(%rbp), %rcx                 # 8-byte Reload
	movq	(%rcx), %rdi
	movq	%rax, %rsi
	callq	gc_publish_new_object@PLT
	movzbl	-4(%rbp), %edx                  # 1-byte Folded Reload
	movq	%rax, (%r13,%rdx,8)
	cmpb	$0, 65(%r15)
	je	.L26
.L21:
	movzbl	(%r12), %eax
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	-16(%rbp), %r14                 # 8-byte Reload
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L22:
	movzwl	%bx, %edi
	movzbl	%r9b, %esi
	jmp	.L24
.L23:
	movzwl	%bx, %edi
.L24:
	addq	$48, %rsp
	popq	%rbp
	jmp	invalidlayout                   # TAILCALL
.L25:
	movzwl	%bx, %edi
	movzbl	-4(%rbp), %esi                  # 1-byte Folded Reload
	movq	-16(%rbp), %r14                 # 8-byte Reload
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	jmp	outofmemory                     # TAILCALL
.L26:
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r9, %rdx
	callq	gc_poll_slow@PLT
	jmp	.L21
.Lfunc_end:
	.size	vm_op_WObj, .Lfunc_end-vm_op_WObj
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Jmp
	.type	vm_op_Jmp,@function
vm_op_Jmp:                              # @vm_op_Jmp
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movswl	%di, %eax
	shll	$8, %eax
	orl	%esi, %eax
	cltq
	movzbl	(%r12,%rax,4), %esi
	movq	(%rdx,%rsi,8), %r8
	movzbl	1(%r12,%rax,4), %esi
	movzwl	2(%r12,%rax,4), %edi
	leaq	(%r12,%rax,4), %r12
	addq	$4, %r12
	popq	%rbp
	jmpq	*%r8                            # TAILCALL
.Lfunc_end:
	.size	vm_op_Jmp, .Lfunc_end-vm_op_Jmp
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_Goto
	.type	vm_op_Goto,@function
vm_op_Goto:                             # @vm_op_Goto
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %eax
	movq	(%r13,%rax,8), %rax
	movq	%rax, %r8
	notq	%r8
	testq	%r8, %r14
	jne	.L2
# %bb.1:
	cltq
	movzbl	(%r12,%rax,4), %esi
	movq	(%rdx,%rsi,8), %r8
	movzbl	1(%r12,%rax,4), %esi
	movzwl	2(%r12,%rax,4), %edi
	leaq	(%r12,%rax,4), %r12
	addq	$4, %r12
	popq	%rbp
	jmpq	*%r8                            # TAILCALL
.L2:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	notaoffset                      # TAILCALL
.Lfunc_end:
	.size	vm_op_Goto, .Lfunc_end-vm_op_Goto
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_AddDC
	.type	vm_op_AddDC,@function
vm_op_AddDC:                            # @vm_op_AddDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %eax
	movq	(%r13,%rax,8), %r8
	movq	16(%r15), %rax
	movzbl	%dil, %r9d
	movq	(%rax,%r9,8), %rax
	movq	%r8, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L4
# %bb.1:
	movq	%rax, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L8
# %bb.2:
	addl	%r8d, %eax
	jo	.L8
# %bb.3:
	movl	%eax, %eax
	orq	%r14, %rax
	jmp	.L7
.L4:
	testq	%r9, %r9
	je	.L8
# %bb.5:
	movq	%rax, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L6
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dc_fallback         # TAILCALL
.L6:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %rax
	movq	%rax, %xmm1
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	subq	%r14, %rax
.L7:
	shrl	$8, %edi
	movq	%rax, (%r13,%rdi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_AddDC, .Lfunc_end-vm_op_AddDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_SubDC
	.type	vm_op_SubDC,@function
vm_op_SubDC:                            # @vm_op_SubDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %eax
	movq	(%r13,%rax,8), %rax
	movq	16(%r15), %r8
	movzbl	%dil, %r9d
	movq	(%r8,%r9,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L4
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L8
# %bb.2:
	subl	%r8d, %eax
	jo	.L8
# %bb.3:
	movl	%eax, %eax
	orq	%r14, %rax
	jmp	.L7
.L4:
	testq	%r9, %r9
	je	.L8
# %bb.5:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L6
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dc_fallback         # TAILCALL
.L6:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	subsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	subq	%r14, %rax
.L7:
	shrl	$8, %edi
	movq	%rax, (%r13,%rdi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_SubDC, .Lfunc_end-vm_op_SubDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_MulDC
	.type	vm_op_MulDC,@function
vm_op_MulDC:                            # @vm_op_MulDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %eax
	movq	(%r13,%rax,8), %r8
	movq	16(%r15), %rax
	movzbl	%dil, %r9d
	movq	(%rax,%r9,8), %rax
	movq	%r8, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L4
# %bb.1:
	movq	%rax, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L8
# %bb.2:
	imull	%r8d, %eax
	jo	.L8
# %bb.3:
	movl	%eax, %eax
	orq	%r14, %rax
	jmp	.L7
.L4:
	testq	%r9, %r9
	je	.L8
# %bb.5:
	movq	%rax, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L6
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dc_fallback         # TAILCALL
.L6:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %rax
	movq	%rax, %xmm1
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	subq	%r14, %rax
.L7:
	shrl	$8, %edi
	movq	%rax, (%r13,%rdi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_MulDC, .Lfunc_end-vm_op_MulDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_DivDC
	.type	vm_op_DivDC,@function
vm_op_DivDC:                            # @vm_op_DivDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %eax
	movq	(%r13,%rax,8), %r8
	movq	16(%r15), %rax
	movzbl	%dil, %r9d
	movq	(%rax,%r9,8), %r9
	movq	%r8, %rax
	andq	%r14, %rax
	cmpq	%r14, %rax
	jne	.L6
# %bb.1:
	movq	%r9, %rax
	notq	%rax
	testq	%rax, %r14
	jne	.L10
# %bb.2:
	testl	%r9d, %r9d
	je	.L10
# %bb.3:
	movl	%r8d, %eax
	negl	%eax
	jno	.L5
# %bb.4:
	cmpl	$-1, %r9d
	je	.L10
.L5:
	movl	%r8d, %eax
	movq	%rdx, %r10
	cltd
	idivl	%r9d
	movl	%edx, %esi
	movq	%r10, %rdx
	testl	%esi, %esi
	setne	%bl
	xorl	%r8d, %r9d
	sets	%sil
	andb	%bl, %sil
	movzbl	%sil, %esi
	subl	%esi, %eax
	orq	%r14, %rax
	jmp	.L9
.L6:
	testq	%rax, %rax
	je	.L10
# %bb.7:
	movq	%r9, %rax
	andq	%r14, %rax
	sete	%bl
	cmpq	%r14, %rax
	sete	%al
	orb	%bl, %al
	je	.L8
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dc_fallback         # TAILCALL
.L8:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	subq	%r14, %rax
.L9:
	shrl	$8, %edi
	movq	%rax, (%r13,%rdi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_DivDC, .Lfunc_end-vm_op_DivDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_RemDC
	.type	vm_op_RemDC,@function
vm_op_RemDC:                            # @vm_op_RemDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	%edi, %ebx
	movl	%esi, %eax
	movq	(%r13,%rax,8), %rdi
	movq	16(%r15), %rax
	movzbl	%bl, %r8d
	movq	(%rax,%r8,8), %r8
	movq	%rdi, %rax
	andq	%r14, %rax
	cmpq	%r14, %rax
	jne	.L4
# %bb.1:
	movq	%r8, %rax
	notq	%rax
	testq	%rax, %r14
	jne	.L8
# %bb.2:
	testl	%r8d, %r8d
	je	.L8
# %bb.3:
	movq	%rdx, -8(%rbp)                  # 8-byte Spill
	movl	%edi, %eax
	cltd
	idivl	%r8d
	xorl	%r8d, %edi
	sarl	$31, %edi
	andl	%r8d, %edi
	addl	%edx, %edi
	testl	%edx, %edx
	cmovel	%edx, %edi
	orq	%r14, %rdi
	jmp	.L7
.L4:
	testq	%rax, %rax
	je	.L8
# %bb.5:
	movq	%r8, %rax
	andq	%r14, %rax
	sete	%r9b
	cmpq	%r14, %rax
	sete	%al
	orb	%r9b, %al
	je	.L6
.L8:
	movzwl	%bx, %edi
	movzbl	%sil, %esi
	addq	$32, %rsp
	popq	%rbp
	jmp	vm_op_arith_dc_fallback         # TAILCALL
.L6:
	movq	%rdx, -8(%rbp)                  # 8-byte Spill
	addq	%r14, %rdi
	movq	%rdi, %xmm0
	movq	%xmm0, -24(%rbp)                # 8-byte Folded Spill
	addq	%r14, %r8
	movq	%r8, %xmm1
	movq	%xmm1, -16(%rbp)                # 8-byte Folded Spill
	divsd	%xmm1, %xmm0
	movq	%rcx, -32(%rbp)                 # 8-byte Spill
	callq	floor@PLT
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	mulsd	-16(%rbp), %xmm0                # 8-byte Folded Reload
	movsd	-24(%rbp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movq	%xmm1, %rdi
	subq	%r14, %rdi
.L7:
	shrl	$8, %ebx
	movq	%rdi, (%r13,%rbx,8)
	movzbl	(%r12), %eax
	movq	-8(%rbp), %rdx                  # 8-byte Reload
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	addq	$32, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_RemDC, .Lfunc_end-vm_op_RemDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_AddDD
	.type	vm_op_AddDD,@function
vm_op_AddDD:                            # @vm_op_AddDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	%dil, %eax
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	(%r13,%rax,8), %rax
	movq	%r8, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L4
# %bb.1:
	movq	%rax, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L8
# %bb.2:
	addl	%r8d, %eax
	jo	.L8
# %bb.3:
	movl	%eax, %eax
	orq	%r14, %rax
	jmp	.L7
.L4:
	testq	%r9, %r9
	je	.L8
# %bb.5:
	movq	%rax, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L6
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dd_fallback         # TAILCALL
.L6:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %rax
	movq	%rax, %xmm1
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	subq	%r14, %rax
.L7:
	shrl	$8, %edi
	movq	%rax, (%r13,%rdi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_AddDD, .Lfunc_end-vm_op_AddDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_SubDD
	.type	vm_op_SubDD,@function
vm_op_SubDD:                            # @vm_op_SubDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	%dil, %r8d
	movl	%esi, %eax
	movq	(%r13,%rax,8), %rax
	movq	(%r13,%r8,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L4
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L8
# %bb.2:
	subl	%r8d, %eax
	jo	.L8
# %bb.3:
	movl	%eax, %eax
	orq	%r14, %rax
	jmp	.L7
.L4:
	testq	%r9, %r9
	je	.L8
# %bb.5:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L6
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dd_fallback         # TAILCALL
.L6:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	subsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	subq	%r14, %rax
.L7:
	shrl	$8, %edi
	movq	%rax, (%r13,%rdi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_SubDD, .Lfunc_end-vm_op_SubDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_MulDD
	.type	vm_op_MulDD,@function
vm_op_MulDD:                            # @vm_op_MulDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	%dil, %eax
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	(%r13,%rax,8), %rax
	movq	%r8, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L4
# %bb.1:
	movq	%rax, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L8
# %bb.2:
	imull	%r8d, %eax
	jo	.L8
# %bb.3:
	movl	%eax, %eax
	orq	%r14, %rax
	jmp	.L7
.L4:
	testq	%r9, %r9
	je	.L8
# %bb.5:
	movq	%rax, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L6
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dd_fallback         # TAILCALL
.L6:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %rax
	movq	%rax, %xmm1
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	subq	%r14, %rax
.L7:
	shrl	$8, %edi
	movq	%rax, (%r13,%rdi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_MulDD, .Lfunc_end-vm_op_MulDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_DivDD
	.type	vm_op_DivDD,@function
vm_op_DivDD:                            # @vm_op_DivDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	%dil, %eax
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	(%r13,%rax,8), %r9
	movq	%r8, %rax
	andq	%r14, %rax
	cmpq	%r14, %rax
	jne	.L6
# %bb.1:
	movq	%r9, %rax
	notq	%rax
	testq	%rax, %r14
	jne	.L10
# %bb.2:
	testl	%r9d, %r9d
	je	.L10
# %bb.3:
	movl	%r8d, %eax
	negl	%eax
	jno	.L5
# %bb.4:
	cmpl	$-1, %r9d
	je	.L10
.L5:
	movl	%r8d, %eax
	movq	%rdx, %r10
	cltd
	idivl	%r9d
	movl	%edx, %esi
	movq	%r10, %rdx
	testl	%esi, %esi
	setne	%bl
	xorl	%r8d, %r9d
	sets	%sil
	andb	%bl, %sil
	movzbl	%sil, %esi
	subl	%esi, %eax
	orq	%r14, %rax
	jmp	.L9
.L6:
	testq	%rax, %rax
	je	.L10
# %bb.7:
	movq	%r9, %rax
	andq	%r14, %rax
	sete	%bl
	cmpq	%r14, %rax
	sete	%al
	orb	%bl, %al
	je	.L8
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dd_fallback         # TAILCALL
.L8:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	subq	%r14, %rax
.L9:
	shrl	$8, %edi
	movq	%rax, (%r13,%rdi,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_DivDD, .Lfunc_end-vm_op_DivDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_RemDD
	.type	vm_op_RemDD,@function
vm_op_RemDD:                            # @vm_op_RemDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	%edi, %ebx
	movzbl	%bl, %eax
	movl	%esi, %edi
	movq	(%r13,%rdi,8), %rdi
	movq	(%r13,%rax,8), %r8
	movq	%rdi, %rax
	andq	%r14, %rax
	cmpq	%r14, %rax
	jne	.L4
# %bb.1:
	movq	%r8, %rax
	notq	%rax
	testq	%rax, %r14
	jne	.L8
# %bb.2:
	testl	%r8d, %r8d
	je	.L8
# %bb.3:
	movq	%rdx, -8(%rbp)                  # 8-byte Spill
	movl	%edi, %eax
	cltd
	idivl	%r8d
	xorl	%r8d, %edi
	sarl	$31, %edi
	andl	%r8d, %edi
	addl	%edx, %edi
	testl	%edx, %edx
	cmovel	%edx, %edi
	orq	%r14, %rdi
	jmp	.L7
.L4:
	testq	%rax, %rax
	je	.L8
# %bb.5:
	movq	%r8, %rax
	andq	%r14, %rax
	sete	%r9b
	cmpq	%r14, %rax
	sete	%al
	orb	%r9b, %al
	je	.L6
.L8:
	movzwl	%bx, %edi
	movzbl	%sil, %esi
	addq	$32, %rsp
	popq	%rbp
	jmp	vm_op_arith_dd_fallback         # TAILCALL
.L6:
	movq	%rdx, -8(%rbp)                  # 8-byte Spill
	addq	%r14, %rdi
	movq	%rdi, %xmm0
	movq	%xmm0, -24(%rbp)                # 8-byte Folded Spill
	addq	%r14, %r8
	movq	%r8, %xmm1
	movq	%xmm1, -16(%rbp)                # 8-byte Folded Spill
	divsd	%xmm1, %xmm0
	movq	%r15, -32(%rbp)                 # 8-byte Spill
	movq	%rcx, %r15
	callq	floor@PLT
	movq	%r15, %rcx
	movq	-32(%rbp), %r15                 # 8-byte Reload
	mulsd	-16(%rbp), %xmm0                # 8-byte Folded Reload
	movsd	-24(%rbp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movq	%xmm1, %rdi
	subq	%r14, %rdi
.L7:
	shrl	$8, %ebx
	movq	%rdi, (%r13,%rbx,8)
	movzbl	(%r12), %eax
	movq	-8(%rbp), %rdx                  # 8-byte Reload
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	addq	$32, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_RemDD, .Lfunc_end-vm_op_RemDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_NegD
	.type	vm_op_NegD,@function
vm_op_NegD:                             # @vm_op_NegD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, %eax
	movl	%esi, %edi
	movq	(%r13,%rdi,8), %rdi
	movq	%rdi, %r8
	andq	%r14, %r8
	cmpq	%r14, %r8
	jne	.L3
# %bb.1:
	movl	%edi, %esi
	negl	%esi
	jo	.L6
# %bb.2:
	negl	%edi
	orq	%r14, %rdi
	jmp	.L7
.L3:
	testq	%r8, %r8
	je	.L5
# %bb.4:
	addq	%r14, %rdi
	movabsq	$-9223372036854775808, %rsi     # imm = 0x8000000000000000
	xorq	%rdi, %rsi
	subq	%r14, %rsi
	movq	%rsi, %rdi
.L7:
	movzbl	%ah, %eax
	movq	%rdi, (%r13,%rax,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L5:
	movzwl	%ax, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_arith_dd_fallback         # TAILCALL
.L6:
	movabsq	$4746794007248502784, %rdi      # imm = 0x41E0000000000000
	subq	%r14, %rdi
	jmp	.L7
.Lfunc_end:
	.size	vm_op_NegD, .Lfunc_end-vm_op_NegD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_SetCond
	.type	vm_op_SetCond,@function
vm_op_SetCond:                          # @vm_op_SetCond
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movb	$0, 64(%r15)
	movzbl	(%r12), %eax
	addq	$4, %r12
	addl	$-39, %eax
	cmpl	$15, %eax
	jae	.L1
# %bb.2:
	movl	%eax, %eax
	leaq	dispatch_setc(%rip), %r8
	movq	(%r8,%rax,8), %rax
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L1:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_setcond_bad_op            # TAILCALL
.Lfunc_end:
	.size	vm_op_SetCond, .Lfunc_end-vm_op_SetCond
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_SetCondJ
	.type	vm_op_SetCondJ,@function
vm_op_SetCondJ:                         # @vm_op_SetCondJ
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movb	$1, 64(%r15)
	movzbl	(%r12), %eax
	addq	$4, %r12
	addl	$-39, %eax
	cmpl	$15, %eax
	jae	.L1
# %bb.2:
	movl	%eax, %eax
	leaq	dispatch_setc(%rip), %r8
	movq	(%r8,%rax,8), %rax
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L1:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_setcond_bad_op            # TAILCALL
.Lfunc_end:
	.size	vm_op_SetCondJ, .Lfunc_end-vm_op_SetCondJ
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpNotF
	.type	vm_op_CmpNotF,@function
vm_op_CmpNotF:                          # @vm_op_CmpNotF
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %esi
	movq	(%r13,%rsi,8), %rsi
	andq	$-5, %rsi
	cmpl	$65535, %edi                    # imm = 0xFFFF
	je	.L1
# %bb.2:
	cmpq	$2, %rsi
	jne	.L4
.L3:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L4:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L1:
	cmpq	$2, %rsi
	jne	.L3
	jmp	.L4
.Lfunc_end:
	.size	vm_op_CmpNotF, .Lfunc_end-vm_op_CmpNotF
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpEqDI
	.type	vm_op_CmpEqDI,@function
vm_op_CmpEqDI:                          # @vm_op_CmpEqDI
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	%r8, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L2
# %bb.1:
	movswl	%di, %esi
	cmpl	%esi, %r8d
	je	.L5
.L4:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L5:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L2:
	testq	%r9, %r9
	je	.L6
# %bb.3:
	addq	%r14, %r8
	movq	%r8, %xmm0
	movswl	%di, %esi
	cvtsi2sd	%esi, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L4
	jnp	.L5
	jmp	.L4
.L6:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_di_fallback       # TAILCALL
.Lfunc_end:
	.size	vm_op_CmpEqDI, .Lfunc_end-vm_op_CmpEqDI
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpNeDI
	.type	vm_op_CmpNeDI,@function
vm_op_CmpNeDI:                          # @vm_op_CmpNeDI
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	%r8, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L2
# %bb.1:
	movswl	%di, %esi
	cmpl	%esi, %r8d
	jne	.L5
.L4:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L5:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L2:
	testq	%r9, %r9
	je	.L6
# %bb.3:
	addq	%r14, %r8
	movq	%r8, %xmm0
	movswl	%di, %esi
	cvtsi2sd	%esi, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L5
	jp	.L5
	jmp	.L4
.L6:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_di_fallback       # TAILCALL
.Lfunc_end:
	.size	vm_op_CmpNeDI, .Lfunc_end-vm_op_CmpNeDI
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpEqDC
	.type	vm_op_CmpEqDC,@function
vm_op_CmpEqDC:                          # @vm_op_CmpEqDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	16(%r15), %r9
	movl	%edi, %r10d
	movq	(%r9,%r10,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	je	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dc_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L6
	jnp	.L7
	jmp	.L6
.Lfunc_end:
	.size	vm_op_CmpEqDC, .Lfunc_end-vm_op_CmpEqDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpNeDC
	.type	vm_op_CmpNeDC,@function
vm_op_CmpNeDC:                          # @vm_op_CmpNeDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	16(%r15), %r9
	movl	%edi, %r10d
	movq	(%r9,%r10,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jne	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dc_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L7
	jp	.L7
	jmp	.L6
.Lfunc_end:
	.size	vm_op_CmpNeDC, .Lfunc_end-vm_op_CmpNeDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpLtDC
	.type	vm_op_CmpLtDC,@function
vm_op_CmpLtDC:                          # @vm_op_CmpLtDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	16(%r15), %r9
	movl	%edi, %r10d
	movq	(%r9,%r10,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jl	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dc_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L6
	jmp	.L7
.Lfunc_end:
	.size	vm_op_CmpLtDC, .Lfunc_end-vm_op_CmpLtDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpLeDC
	.type	vm_op_CmpLeDC,@function
vm_op_CmpLeDC:                          # @vm_op_CmpLeDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	16(%r15), %r9
	movl	%edi, %r10d
	movq	(%r9,%r10,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jle	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dc_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L6
	jmp	.L7
.Lfunc_end:
	.size	vm_op_CmpLeDC, .Lfunc_end-vm_op_CmpLeDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpGtDC
	.type	vm_op_CmpGtDC,@function
vm_op_CmpGtDC:                          # @vm_op_CmpGtDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	16(%r15), %r9
	movl	%edi, %r10d
	movq	(%r9,%r10,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jg	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dc_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	.L6
	jmp	.L7
.Lfunc_end:
	.size	vm_op_CmpGtDC, .Lfunc_end-vm_op_CmpGtDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpGeDC
	.type	vm_op_CmpGeDC,@function
vm_op_CmpGeDC:                          # @vm_op_CmpGeDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movq	16(%r15), %r9
	movl	%edi, %r10d
	movq	(%r9,%r10,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jge	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dc_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm1, %xmm0
	jb	.L6
	jmp	.L7
.Lfunc_end:
	.size	vm_op_CmpGeDC, .Lfunc_end-vm_op_CmpGeDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpEqDD
	.type	vm_op_CmpEqDD,@function
vm_op_CmpEqDD:                          # @vm_op_CmpEqDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movl	%edi, %r9d
	movq	(%r13,%r9,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	je	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dd_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L6
	jnp	.L7
	jmp	.L6
.Lfunc_end:
	.size	vm_op_CmpEqDD, .Lfunc_end-vm_op_CmpEqDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpNeDD
	.type	vm_op_CmpNeDD,@function
vm_op_CmpNeDD:                          # @vm_op_CmpNeDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movl	%edi, %r9d
	movq	(%r13,%r9,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jne	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dd_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L7
	jp	.L7
	jmp	.L6
.Lfunc_end:
	.size	vm_op_CmpNeDD, .Lfunc_end-vm_op_CmpNeDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpLtDD
	.type	vm_op_CmpLtDD,@function
vm_op_CmpLtDD:                          # @vm_op_CmpLtDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movl	%edi, %r9d
	movq	(%r13,%r9,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jl	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dd_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L6
	jmp	.L7
.Lfunc_end:
	.size	vm_op_CmpLtDD, .Lfunc_end-vm_op_CmpLtDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpLeDD
	.type	vm_op_CmpLeDD,@function
vm_op_CmpLeDD:                          # @vm_op_CmpLeDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movl	%edi, %r9d
	movq	(%r13,%r9,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jle	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dd_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L6
	jmp	.L7
.Lfunc_end:
	.size	vm_op_CmpLeDD, .Lfunc_end-vm_op_CmpLeDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpGtDD
	.type	vm_op_CmpGtDD,@function
vm_op_CmpGtDD:                          # @vm_op_CmpGtDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movl	%edi, %r9d
	movq	(%r13,%r9,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jg	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dd_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	.L6
	jmp	.L7
.Lfunc_end:
	.size	vm_op_CmpGtDD, .Lfunc_end-vm_op_CmpGtDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_CmpGeDD
	.type	vm_op_CmpGeDD,@function
vm_op_CmpGeDD:                          # @vm_op_CmpGeDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%r12, %rax
	addq	$4, %r12
	movl	%esi, %r8d
	movq	(%r13,%r8,8), %r8
	movl	%edi, %r9d
	movq	(%r13,%r9,8), %r9
	movq	%r8, %r10
	andq	%r14, %r10
	cmpq	%r14, %r10
	jne	.L3
# %bb.1:
	movq	%r9, %r10
	notq	%r10
	testq	%r10, %r14
	jne	.L8
# %bb.2:
	cmpl	%r9d, %r8d
	jge	.L7
.L6:
	movl	(%rax), %eax
	sarl	$8, %eax
	cltq
	leaq	(%r12,%rax,4), %r12
.L7:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L3:
	testq	%r10, %r10
	je	.L8
# %bb.4:
	movq	%r9, %r10
	andq	%r14, %r10
	sete	%bl
	cmpq	%r14, %r10
	sete	%r10b
	orb	%bl, %r10b
	je	.L5
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_dd_fallback       # TAILCALL
.L5:
	addq	%r14, %r8
	movq	%r8, %xmm0
	addq	%r14, %r9
	movq	%r9, %xmm1
	ucomisd	%xmm1, %xmm0
	jb	.L6
	jmp	.L7
.Lfunc_end:
	.size	vm_op_CmpGeDD, .Lfunc_end-vm_op_CmpGeDD
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function unusedexta
	.type	unusedexta,@function
unusedexta:                             # @unusedexta
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	unusedexta, .Lfunc_end-unusedexta
                                        # -- End function
	.p2align	5                               # -- Begin function panic
	.type	panic,@function
panic:                                  # @panic
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.L.str.2(%rip), %rsi
	movq	%rcx, %rdx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$255, %edi
	callq	exit@PLT
.Lfunc_end:
	.size	panic, .Lfunc_end-panic
                                        # -- End function
	.p2align	5                               # -- Begin function badop
	.type	badop,@function
badop:                                  # @badop
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.3(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	badop, .Lfunc_end-badop
                                        # -- End function
	.text
	.p2align	4                               # -- Begin function member_slot
	.type	member_slot,@function
member_slot:                            # @member_slot
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	movq	%rsi, %rax
	shrq	$49, %rax
	cmpl	$32766, %eax                    # imm = 0x7FFE
	jbe	.L1
# %bb.2:
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L15
# %bb.3:
	movabsq	$-562949953421313, %r11         # imm = 0xFFFDFFFFFFFFFFFF
	addq	$3, %r11
	andq	%rdi, %r11
	jne	.L15
# %bb.4:
	movabsq	$562949953421304, %rax          # imm = 0x1FFFFFFFFFFF8
	andq	%rax, %rdi
	movq	(%rdi), %r11
	testb	%r11b, %r11b
	je	.L5
# %bb.6:
	xorl	%eax, %eax
	cmpb	$4, %r11b
	je	.L7
# %bb.8:
	movsbl	%r11b, %r11d
	cmpl	$5, %r11d
	jne	.L15
# %bb.9:
	movq	24(%rdi), %r11
	andq	$-8, %r11
	leaq	32(%rdi), %rax
	jmp	.L10
.L1:
	movl	-1(%rsi), %edx
	addq	$3, %rsi
	addq	$-9, %rdx
	callq	member_slot_named
	jmp	.L15
.L5:
	movl	%esi, %ecx
	shrq	$32, %r11
	addq	$-16, %r11
	shrq	$3, %r11
	xorl	%eax, %eax
	cmpq	%rcx, %r11
	leaq	16(%rdi,%rcx,8), %r11
	cmovaq	%r11, %rax
	jmp	.L15
.L7:
	movq	%rdi, %r11
.L10:
	movq	16(%rdi), %rcx
	movq	12(%rcx), %rcx
	andq	$-8, %rcx
	cmpl	%esi, (%rcx)
	jbe	.L11
# %bb.12:
	testq	%rax, %rax
	je	.L14
# %bb.13:
	movl	%esi, %ecx
	movzbl	(%rax,%rcx), %esi
.L14:
	addl	$1, %esi
	leaq	(%r11,%rsi,8), %rax
	addq	$16, %rax
	jmp	.L15
.L11:
	xorl	%eax, %eax
.L15:
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	retq
.Lfunc_end:
	.size	member_slot, .Lfunc_end-member_slot
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function nomember
	.type	nomember,@function
nomember:                               # @nomember
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.4(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	nomember, .Lfunc_end-nomember
                                        # -- End function
	.text
	.p2align	4                               # -- Begin function member_slot_named
	.type	member_slot_named,@function
member_slot_named:                      # @member_slot_named
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	movq	%rsi, -120(%rbp)                # 8-byte Spill
	xorl	%r12d, %r12d
	testq	%rdi, %rdi
	je	.L34
# %bb.1:
	movq	%rdi, %r15
	movabsq	$-562949953421310, %rax         # imm = 0xFFFE000000000002
	andq	%rdi, %rax
	jne	.L34
# %bb.2:
	movq	%rdx, %rbx
	movabsq	$562949953421304, %rax          # imm = 0x1FFFFFFFFFFF8
	andq	%rax, %r15
	movq	(%r15), %rax
	cmpb	$3, %al
	jne	.L12
# %bb.3:
	movq	16(%r15), %rax
	addq	$16, %r15
	andq	$-8, %rax
	movl	8(%rax), %ecx
	addl	4(%rax), %ecx
	je	.L4
# %bb.5:
	movl	(%rax), %r11d
	movl	%ecx, -112(%rbp)                # 4-byte Spill
	movl	%ecx, %r12d
	shlq	$4, %r11
	leaq	(%r11,%rax), %r13
	addq	$40, %r13
	xorl	%r14d, %r14d
	jmp	.L6
	.p2align	4
.L8:                               #   in Loop: Header=BB60_6 Depth=1
	addq	$1, %r14
	addq	$16, %r13
	cmpq	%r14, %r12
	je	.L9
.L6:                               # =>This Inner Loop Header: Depth=1
	movl	(%r13), %eax
	cmpq	%rax, %rbx
	jne	.L8
# %bb.7:                                #   in Loop: Header=BB60_6 Depth=1
	movq	-8(%r13), %rdi
	movq	-120(%rbp), %rsi                # 8-byte Reload
	movq	%rbx, %rdx
	callq	bcmp@PLT
	testl	%eax, %eax
	jne	.L8
# %bb.10:
	movl	-112(%rbp), %ecx                # 4-byte Reload
	jmp	.L11
.L12:
	xorl	%r12d, %r12d
	cmpb	$4, %al
	je	.L13
# %bb.14:
	movsbl	%al, %eax
	cmpl	$5, %eax
	jne	.L34
# %bb.15:
	movq	24(%r15), %rax
	andq	$-8, %rax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	leaq	32(%r15), %rax
	movq	%rax, -128(%rbp)                # 8-byte Spill
	jmp	.L16
.L9:
	movl	-112(%rbp), %ecx                # 4-byte Reload
	movl	%ecx, %r14d
	jmp	.L11
.L4:
	xorl	%r14d, %r14d
.L11:
	cmpl	%ecx, %r14d
	movl	%ecx, %eax
	cmovbl	%r14d, %eax
	addl	$1, %eax
	xorl	%r12d, %r12d
	cmpl	%ecx, %r14d
	leaq	(%r15,%rax,8), %rax
	jmp	.L33
.L13:
	movq	%r15, -104(%rbp)                # 8-byte Spill
	movq	$0, -128(%rbp)                  # 8-byte Folded Spill
.L16:
	movq	16(%r15), %r13
	movq	12(%r13), %rax
	andq	$-8, %rax
	movl	(%rax), %r15d
	testq	%r15, %r15
	movq	%rax, -112(%rbp)                # 8-byte Spill
	je	.L23
# %bb.17:
	leaq	40(%rax), %r14
	xorl	%r12d, %r12d
	jmp	.L18
	.p2align	4
.L20:                              #   in Loop: Header=BB60_18 Depth=1
	addq	$1, %r12
	addq	$16, %r14
	cmpq	%r12, %r15
	je	.L21
.L18:                              # =>This Inner Loop Header: Depth=1
	movl	(%r14), %eax
	cmpq	%rax, %rbx
	jne	.L20
# %bb.19:                               #   in Loop: Header=BB60_18 Depth=1
	movq	-8(%r14), %rdi
	movq	-120(%rbp), %rsi                # 8-byte Reload
	movq	%rbx, %rdx
	callq	bcmp@PLT
	testl	%eax, %eax
	jne	.L20
.L23:
	cmpl	%r15d, %r12d
	movl	%r15d, %eax
	cmovbl	%r12d, %eax
	cmpl	%r15d, %r12d
	jae	.L21
# %bb.24:
	movq	-128(%rbp), %r11                # 8-byte Reload
	testq	%r11, %r11
	je	.L26
# %bb.25:
	movl	%eax, %eax
	movzbl	(%r11,%rax), %eax
.L26:
	movl	%eax, %eax
	movq	-104(%rbp), %r11                # 8-byte Reload
	leaq	(%r11,%rax,8), %r12
	addq	$24, %r12
	jmp	.L34
.L21:
	addq	$12, %r13
	movq	%r13, -104(%rbp)                # 8-byte Spill
	movq	-112(%rbp), %rax                # 8-byte Reload
	movl	4(%rax), %r13d
	testq	%r13, %r13
	je	.L22
# %bb.27:
	shlq	$4, %r15
	leaq	(%r15,%rax), %r14
	addq	$40, %r14
	xorl	%r15d, %r15d
	jmp	.L28
	.p2align	4
.L30:                              #   in Loop: Header=BB60_28 Depth=1
	addq	$1, %r15
	addq	$16, %r14
	cmpq	%r15, %r13
	je	.L31
.L28:                              # =>This Inner Loop Header: Depth=1
	movl	(%r14), %eax
	cmpq	%rax, %rbx
	jne	.L30
# %bb.29:                               #   in Loop: Header=BB60_28 Depth=1
	movq	-8(%r14), %rdi
	movq	-120(%rbp), %rsi                # 8-byte Reload
	movq	%rbx, %rdx
	callq	bcmp@PLT
	testl	%eax, %eax
	jne	.L30
	jmp	.L32
.L31:
	movl	%r13d, %r15d
	jmp	.L32
.L22:
	xorl	%r15d, %r15d
.L32:
	cmpl	%r13d, %r15d
	movl	%r13d, %eax
	cmovbl	%r15d, %eax
	addl	$1, %eax
	xorl	%r12d, %r12d
	cmpl	%r13d, %r15d
	movq	-104(%rbp), %r11                # 8-byte Reload
	leaq	(%r11,%rax,8), %rax
.L33:
	cmovbq	%rax, %r12
.L34:
	movq	%r12, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8
	popq	%r9
	popq	%r10
	popq	%rbp
	retq
.Lfunc_end:
	.size	member_slot_named, .Lfunc_end-member_slot_named
                                        # -- End function
	.p2align	4                               # -- Begin function field_slot
	.type	field_slot,@function
field_slot:                             # @field_slot
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	movq	%rdx, %rcx
	movq	%rsi, %rax
	shrq	$49, %rax
	cmpl	$32766, %eax                    # imm = 0x7FFE
	jbe	.L1
# %bb.2:
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L13
# %bb.3:
	movabsq	$-562949953421313, %r11         # imm = 0xFFFDFFFFFFFFFFFF
	addq	$3, %r11
	andq	%rdi, %r11
	jne	.L13
# %bb.4:
	movabsq	$562949953421304, %rax          # imm = 0x1FFFFFFFFFFF8
	andq	%rax, %rdi
	movq	(%rdi), %r11
	xorl	%eax, %eax
	cmpb	$4, %r11b
	je	.L5
# %bb.6:
	movsbl	%r11b, %r11d
	cmpl	$5, %r11d
	jne	.L13
# %bb.7:
	movq	24(%rdi), %r11
	andq	$-8, %r11
	movq	%rdi, %rax
	addq	$32, %rax
	jmp	.L8
.L1:
	movl	-1(%rsi), %edx
	addq	$3, %rsi
	addq	$-9, %rdx
	callq	field_slot_named
	jmp	.L13
.L5:
	movq	%rdi, %r11
.L8:
	movq	16(%rdi), %rdx
	movq	12(%rdx), %rdx
	andq	$-8, %rdx
	cmpl	%esi, (%rdx)
	jbe	.L9
# %bb.10:
	movq	%r11, (%rcx)
	testq	%rax, %rax
	je	.L12
# %bb.11:
	movl	%esi, %ecx
	movzbl	(%rax,%rcx), %esi
.L12:
	addl	$1, %esi
	leaq	(%r11,%rsi,8), %rax
	addq	$16, %rax
	jmp	.L13
.L9:
	xorl	%eax, %eax
.L13:
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	retq
.Lfunc_end:
	.size	field_slot, .Lfunc_end-field_slot
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function notafield
	.type	notafield,@function
notafield:                              # @notafield
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.5(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	notafield, .Lfunc_end-notafield
                                        # -- End function
	.text
	.p2align	4                               # -- Begin function field_slot_named
	.type	field_slot_named,@function
field_slot_named:                       # @field_slot_named
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	xorl	%r14d, %r14d
	testq	%rdi, %rdi
	je	.L18
# %bb.1:
	movabsq	$-562949953421310, %rax         # imm = 0xFFFE000000000002
	andq	%rdi, %rax
	jne	.L18
# %bb.2:
	movq	%rdx, %r15
	movq	%rsi, %r12
	movabsq	$562949953421304, %rax          # imm = 0x1FFFFFFFFFFF8
	andq	%rax, %rdi
	movq	(%rdi), %rax
	xorl	%r14d, %r14d
	cmpb	$4, %al
	je	.L5
# %bb.3:
	movsbl	%al, %eax
	cmpl	$5, %eax
	jne	.L18
# %bb.4:
	movq	24(%rdi), %rax
	andq	$-8, %rax
	movq	%rax, -112(%rbp)                # 8-byte Spill
	movq	%rdi, %rax
	addq	$32, %rax
	movq	%rax, -104(%rbp)                # 8-byte Spill
	jmp	.L6
.L5:
	movq	%rdi, -112(%rbp)                # 8-byte Spill
	movq	$0, -104(%rbp)                  # 8-byte Folded Spill
.L6:
	movq	16(%rdi), %rax
	movq	12(%rax), %rbx
	andq	$-8, %rbx
	movl	(%rbx), %r13d
	testq	%r13, %r13
	je	.L12
# %bb.7:
	movq	%rcx, -120(%rbp)                # 8-byte Spill
	addq	$40, %rbx
	xorl	%r14d, %r14d
	jmp	.L9
	.p2align	4
.L8:                               #   in Loop: Header=BB63_9 Depth=1
	addq	$1, %r14
	addq	$16, %rbx
	cmpq	%r14, %r13
	je	.L17
.L9:                               # =>This Inner Loop Header: Depth=1
	movl	(%rbx), %eax
	cmpq	%rax, %r15
	jne	.L8
# %bb.10:                               #   in Loop: Header=BB63_9 Depth=1
	movq	-8(%rbx), %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	bcmp@PLT
	testl	%eax, %eax
	jne	.L8
# %bb.11:
	movq	-120(%rbp), %rcx                # 8-byte Reload
.L12:
	cmpl	%r13d, %r14d
	cmovbl	%r14d, %r13d
	jae	.L17
# %bb.13:
	movq	-112(%rbp), %r11                # 8-byte Reload
	movq	%r11, (%rcx)
	movq	-104(%rbp), %rcx                # 8-byte Reload
	testq	%rcx, %rcx
	je	.L15
# %bb.14:
	movl	%r13d, %eax
	movzbl	(%rcx,%rax), %r13d
.L15:
	movl	%r13d, %eax
	leaq	(%r11,%rax,8), %r14
	addq	$24, %r14
	jmp	.L18
.L17:
	xorl	%r14d, %r14d
.L18:
	movq	%r14, %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8
	popq	%r9
	popq	%r10
	popq	%rbp
	retq
.Lfunc_end:
	.size	field_slot_named, .Lfunc_end-field_slot_named
                                        # -- End function
	.p2align	4                               # -- Begin function typed_member_slow
	.type	typed_member_slow,@function
typed_member_slow:                      # @typed_member_slow
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %r8
	movl	%edx, %esi
	movl	%ecx, %edx
	callq	typed_field_name
	testq	%rax, %rax
	je	.L1
# %bb.2:
	movq	(%rax), %rsi
	movl	8(%rax), %edx
	movq	%r8, %rdi
	callq	member_slot_named
.L3:
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8
	popq	%rbp
	retq
.L1:
	xorl	%eax, %eax
	jmp	.L3
.Lfunc_end:
	.size	typed_member_slow, .Lfunc_end-typed_member_slow
                                        # -- End function
	.p2align	4                               # -- Begin function typed_field_name
	.type	typed_field_name,@function
typed_field_name:                       # @typed_field_name
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rcx
	movl	%esi, %eax
	cmpq	%rax, 40(%rdi)
	jbe	.L1
# %bb.2:
	movq	24(%rdi), %r11
	movq	(%r11,%rax,8), %rax
	movq	16(%rax), %r11
	andq	$-8, %r11
	movl	%edx, %ecx
	shlq	$4, %rcx
	xorl	%eax, %eax
	cmpl	(%r11), %edx
	leaq	32(%r11,%rcx), %r11
	cmovbq	%r11, %rax
.L3:
	popq	%rcx
	popq	%rbp
	retq
.L1:
	xorl	%eax, %eax
	jmp	.L3
.Lfunc_end:
	.size	typed_field_name, .Lfunc_end-typed_field_name
                                        # -- End function
	.p2align	4                               # -- Begin function typed_field_slow
	.type	typed_field_slow,@function
typed_field_slow:                       # @typed_field_slow
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r9
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%rax
	movq	%rsi, %r9
	movl	%edx, %esi
	movl	%ecx, %edx
	callq	typed_field_name
	testq	%rax, %rax
	je	.L1
# %bb.2:
	movq	(%rax), %rsi
	movl	8(%rax), %edx
	movq	%r9, %rdi
	movq	%r8, %rcx
	callq	field_slot_named
.L3:
	addq	$8, %rsp
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r9
	popq	%rbp
	retq
.L1:
	xorl	%eax, %eax
	jmp	.L3
.Lfunc_end:
	.size	typed_field_slow, .Lfunc_end-typed_field_slow
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function notatype
	.type	notatype,@function
notatype:                               # @notatype
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.6(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	notatype, .Lfunc_end-notatype
                                        # -- End function
	.p2align	5                               # -- Begin function notaninstance
	.type	notaninstance,@function
notaninstance:                          # @notaninstance
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.7(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	notaninstance, .Lfunc_end-notaninstance
                                        # -- End function
	.text
	.p2align	4                               # -- Begin function view_template
	.type	view_template,@function
view_template:                          # @view_template
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$80, %rsp
	movq	%rsi, %r13
	movq	%rdi, %r12
	movq	$0, (%rdx)
	movq	24(%rdi), %r15
	testq	%r15, %r15
	je	.L4
# %bb.1:
	movq	%r15, %rbx
	.p2align	4
.L2:                               # =>This Inner Loop Header: Depth=1
	cmpq	%r13, (%rbx)
	je	.L15
# %bb.3:                                #   in Loop: Header=BB69_2 Depth=1
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L2
.L4:
	movq	%rdx, -168(%rbp)                # 8-byte Spill
	movl	(%r13), %r14d
	leaq	16(%r14), %rdi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.L17
# %bb.5:
	movq	%rax, %rbx
	movq	%r15, -152(%rbp)                # 8-byte Spill
	testq	%r14, %r14
	je	.L14
# %bb.6:
	leaq	32(%r13), %r11
	movq	%r11, -104(%rbp)                # 8-byte Spill
	movl	(%r12), %r15d
	leaq	40(%r12), %r11
	movq	%r11, -160(%rbp)                # 8-byte Spill
	xorl	%r11d, %r11d
	movq	%r12, -136(%rbp)                # 8-byte Spill
	movq	%r13, -128(%rbp)                # 8-byte Spill
	movq	%r14, -120(%rbp)                # 8-byte Spill
.L7:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB69_10 Depth 2
	movq	%r11, -144(%rbp)                # 8-byte Spill
	shlq	$4, %r11
	movq	%r11, -112(%rbp)                # 8-byte Spill
	testq	%r15, %r15
	je	.L16
# %bb.8:                                #   in Loop: Header=BB69_7 Depth=1
	movq	-104(%rbp), %rax                # 8-byte Reload
	movq	-112(%rbp), %r11                # 8-byte Reload
	movq	(%rax,%r11), %rcx
	movq	%rcx, -176(%rbp)                # 8-byte Spill
	movl	8(%rax,%r11), %r14d
	movq	-160(%rbp), %r12                # 8-byte Reload
	xorl	%r13d, %r13d
	jmp	.L10
	.p2align	4
.L9:                               #   in Loop: Header=BB69_10 Depth=2
	addq	$1, %r13
	addq	$16, %r12
	cmpq	%r13, %r15
	je	.L16
.L10:                              #   Parent Loop BB69_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	(%r12), %r14d
	jne	.L9
# %bb.11:                               #   in Loop: Header=BB69_10 Depth=2
	movq	-8(%r12), %rdi
	movq	-176(%rbp), %rsi                # 8-byte Reload
	movq	%r14, %rdx
	callq	bcmp@PLT
	testl	%eax, %eax
	jne	.L9
# %bb.12:                               #   in Loop: Header=BB69_7 Depth=1
	cmpl	%r13d, %r15d
	jbe	.L16
# %bb.13:                               #   in Loop: Header=BB69_7 Depth=1
	movq	-144(%rbp), %r11                # 8-byte Reload
	movb	%r13b, 16(%rbx,%r11)
	addq	$1, %r11
	movq	-120(%rbp), %r14                # 8-byte Reload
	cmpq	%r14, %r11
	movq	-136(%rbp), %r12                # 8-byte Reload
	movq	-128(%rbp), %r13                # 8-byte Reload
	jne	.L7
.L14:
	movq	%r13, (%rbx)
	movq	-152(%rbp), %rax                # 8-byte Reload
	movq	%rax, 8(%rbx)
	movq	%rbx, 24(%r12)
.L15:
	addq	$16, %rbx
	jmp	.L18
.L16:
	movq	-104(%rbp), %r14                # 8-byte Reload
	addq	-112(%rbp), %r14                # 8-byte Folded Reload
	movq	%rbx, %rdi
	callq	free@PLT
	movq	-168(%rbp), %rax                # 8-byte Reload
	movq	%r14, (%rax)
.L17:
	xorl	%ebx, %ebx
.L18:
	movq	%rbx, %rax
	addq	$80, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8
	popq	%r9
	popq	%r10
	popq	%rbp
	retq
.Lfunc_end:
	.size	view_template, .Lfunc_end-view_template
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function outofmemory
	.type	outofmemory,@function
outofmemory:                            # @outofmemory
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.8(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	outofmemory, .Lfunc_end-outofmemory
                                        # -- End function
	.text
	.p2align	4                               # -- Begin function cannotview_format
	.type	cannotview_format,@function
cannotview_format:                      # @cannotview_format
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%rax
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r11
	movq	%rsi, %r10
	movl	12(%rdi), %ecx
	movq	16(%rdi), %r8
	movl	12(%rsi), %r9d
	movl	8(%rdx), %ebx
	subq	$8, %rsp
	leaq	cannotview_msg(%rip), %rdi
	leaq	.L.str.9(%rip), %rdx
	movl	$256, %esi                      # imm = 0x100
	xorl	%eax, %eax
	pushq	(%r11)
	pushq	%rbx
	pushq	16(%r10)
	callq	snprintf@PLT
	addq	$40, %rsp
	popq	%rbx
	popq	%rax
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8
	popq	%r9
	popq	%r10
	popq	%rbp
	retq
.Lfunc_end:
	.size	cannotview_format, .Lfunc_end-cannotview_format
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function cannotview
	.type	cannotview,@function
cannotview:                             # @cannotview
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	cannotview_msg(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	cannotview, .Lfunc_end-cannotview
                                        # -- End function
	.p2align	5                               # -- Begin function notafunction
	.type	notafunction,@function
notafunction:                           # @notafunction
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.10(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	notafunction, .Lfunc_end-notafunction
                                        # -- End function
	.p2align	5                               # -- Begin function stackoverflow
	.type	stackoverflow,@function
stackoverflow:                          # @stackoverflow
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.11(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	stackoverflow, .Lfunc_end-stackoverflow
                                        # -- End function
	.text
	.p2align	4                               # -- Begin function thunk_alloc_instance
	.type	thunk_alloc_instance,@function
thunk_alloc_instance:                   # @thunk_alloc_instance
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	pushq	%rax
	movq	%rsi, %rcx
	movq	%rdi, %rsi
	movl	48(%rcx), %eax
	leal	63(,%rax,8), %edi
	andl	$-8, %edi
	callq	alloc_object@PLT
	testq	%rax, %rax
	je	.L2
# %bb.1:
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	thunk_instance_init@PLT
.L2:
	addq	$8, %rsp
	popq	%rcx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	retq
.Lfunc_end:
	.size	thunk_alloc_instance, .Lfunc_end-thunk_alloc_instance
                                        # -- End function
	.p2align	4                               # -- Begin function capture_loc_resolve
	.type	capture_loc_resolve,@function
capture_loc_resolve:                    # @capture_loc_resolve
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	-16(%rsi), %rax
	movq	%rdi, %r11
	shrq	$16, %r11
	cmpw	$1, %r11w
	je	.L4
# %bb.1:
	movzwl	%r11w, %r11d
	testl	%r11d, %r11d
	jne	.L8
# %bb.2:
	movzbl	51(%rax), %eax
	cmpw	%ax, %di
	jae	.L8
# %bb.3:
	movzwl	%di, %eax
	movq	(%rsi,%rax,8), %rax
	jmp	.L7
.L4:
	testw	%di, %di
	je	.L7
# %bb.5:
	movzwl	%di, %r11d
	cmpl	%r11d, 47(%rax)
	jb	.L8
# %bb.6:
	addl	$-1, %r11d
	movq	55(%rax,%r11,8), %rax
.L7:
	movq	%rax, (%rdx)
	movb	$1, %al
	popq	%rbp
	retq
.L8:
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end:
	.size	capture_loc_resolve, .Lfunc_end-capture_loc_resolve
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function invalidlayout
	.type	invalidlayout,@function
invalidlayout:                          # @invalidlayout
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.12(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	invalidlayout, .Lfunc_end-invalidlayout
                                        # -- End function
	.p2align	5                               # -- Begin function notaoffset
	.type	notaoffset,@function
notaoffset:                             # @notaoffset
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.13(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	notaoffset, .Lfunc_end-notaoffset
                                        # -- End function
	.text
	.p2align	5                               # -- Begin function vm_op_arith_dc_fallback
	.type	vm_op_arith_dc_fallback,@function
vm_op_arith_dc_fallback:                # @vm_op_arith_dc_fallback
# %bb.0:
	movl	%esi, %eax
	movq	(%r13,%rax,8), %rax
	movq	%rax, %r8
	andq	%r14, %r8
	cmpq	%r14, %r8
	jne	.L2
# %bb.1:
	cvtsi2sd	%eax, %xmm0
	jmp	.L4
.L2:
	testq	%r8, %r8
	je	.L17
# %bb.3:
	addq	%r14, %rax
	movq	%rax, %xmm0
.L4:
	movq	16(%r15), %rax
	movzwl	%di, %ebx
	movzbl	%bl, %edi
	movq	(%rax,%rdi,8), %rax
	movq	%rax, %rdi
	andq	%r14, %rdi
	cmpq	%r14, %rdi
	jne	.L6
# %bb.5:
	cvtsi2sd	%eax, %xmm1
	jmp	.L8
.L6:
	testq	%rdi, %rdi
	je	.L14
# %bb.7:
	addq	%r14, %rax
	movq	%rax, %xmm1
.L8:
	movzbl	-4(%r12), %eax
	addl	$-26, %eax
	cmpl	$4, %eax
	ja	.L14
# %bb.9:
	leaq	.LJTI0(%rip), %rsi
	movslq	(%rsi,%rax,4), %rax
	addq	%rsi, %rax
	jmpq	*%rax
.L15:
	addsd	%xmm1, %xmm0
	jmp	.L16
.L13:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%xmm0, -8(%rbp)                 # 8-byte Folded Spill
	movsd	-8(%rbp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movq	%rcx, -32(%rbp)                 # 8-byte Spill
	movq	%rdx, -24(%rbp)                 # 8-byte Spill
	movsd	%xmm1, -16(%rbp)                # 8-byte Spill
	callq	floor@PLT
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	mulsd	-16(%rbp), %xmm0                # 8-byte Folded Reload
	movsd	-8(%rbp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movsd	%xmm1, -8(%rbp)                 # 8-byte Spill
	movsd	-8(%rbp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addq	$32, %rsp
	popq	%rbp
	jmp	.L16
.L11:
	mulsd	%xmm1, %xmm0
	jmp	.L16
.L12:
	divsd	%xmm1, %xmm0
	jmp	.L16
.L10:
	subsd	%xmm1, %xmm0
.L16:
	movq	%xmm0, %rax
	subq	%r14, %rax
	shrl	$8, %ebx
	movq	%rax, (%r13,%rbx,8)
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	jmpq	*%rax                           # TAILCALL
.L14:
	movzbl	%sil, %esi
	movl	%ebx, %edi
	jmp	notanumber                      # TAILCALL
.L17:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	jmp	notanumber                      # TAILCALL
.Lfunc_end:
	.size	vm_op_arith_dc_fallback, .Lfunc_end-vm_op_arith_dc_fallback
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0:
	.long	.L15-.LJTI0
	.long	.L10-.LJTI0
	.long	.L11-.LJTI0
	.long	.L12-.LJTI0
	.long	.L13-.LJTI0
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function notanumber
	.type	notanumber,@function
notanumber:                             # @notanumber
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.14(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	notanumber, .Lfunc_end-notanumber
                                        # -- End function
	.text
	.p2align	5                               # -- Begin function vm_op_arith_dd_fallback
	.type	vm_op_arith_dd_fallback,@function
vm_op_arith_dd_fallback:                # @vm_op_arith_dd_fallback
# %bb.0:
	movl	%edi, %eax
	movl	%esi, %edi
	movq	(%r13,%rdi,8), %rdi
	movq	%rdi, %r8
	andq	%r14, %r8
	cmpq	%r14, %r8
	jne	.L2
# %bb.1:
	cvtsi2sd	%edi, %xmm0
	jmp	.L4
.L2:
	testq	%r8, %r8
	je	.L20
# %bb.3:
	addq	%r14, %rdi
	movq	%rdi, %xmm0
.L4:
	movzbl	-4(%r12), %edi
	cmpl	$36, %edi
	jne	.L6
# %bb.5:
	movq	%xmm0, %rsi
	movabsq	$-9223372036854775808, %rdi     # imm = 0x8000000000000000
	xorq	%rsi, %rdi
	subq	%r14, %rdi
	movzbl	%ah, %eax
	movq	%rdi, (%r13,%rax,8)
	jmp	.L19
.L6:
	movzwl	%ax, %ebx
	movzbl	%bl, %eax
	movq	(%r13,%rax,8), %rax
	movq	%rax, %r8
	andq	%r14, %r8
	cmpq	%r14, %r8
	jne	.L8
# %bb.7:
	cvtsi2sd	%eax, %xmm1
	jmp	.L10
.L8:
	testq	%r8, %r8
	je	.L16
# %bb.9:
	addq	%r14, %rax
	movq	%rax, %xmm1
.L10:
	addl	$-31, %edi
	cmpl	$4, %edi
	ja	.L16
# %bb.11:
	leaq	.LJTI0(%rip), %rax
	movslq	(%rax,%rdi,4), %rsi
	addq	%rax, %rsi
	jmpq	*%rsi
.L17:
	addsd	%xmm1, %xmm0
	jmp	.L18
.L15:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%xmm0, -8(%rbp)                 # 8-byte Folded Spill
	movsd	-8(%rbp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movq	%rcx, -32(%rbp)                 # 8-byte Spill
	movq	%rdx, -24(%rbp)                 # 8-byte Spill
	movsd	%xmm1, -16(%rbp)                # 8-byte Spill
	callq	floor@PLT
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	mulsd	-16(%rbp), %xmm0                # 8-byte Folded Reload
	movsd	-8(%rbp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movsd	%xmm1, -8(%rbp)                 # 8-byte Spill
	movsd	-8(%rbp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addq	$32, %rsp
	popq	%rbp
	jmp	.L18
.L13:
	mulsd	%xmm1, %xmm0
	jmp	.L18
.L14:
	divsd	%xmm1, %xmm0
	jmp	.L18
.L12:
	subsd	%xmm1, %xmm0
.L18:
	movq	%xmm0, %rax
	subq	%r14, %rax
	shrl	$8, %ebx
	movq	%rax, (%r13,%rbx,8)
.L19:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	jmpq	*%rax                           # TAILCALL
.L20:
	movzwl	%ax, %edi
	movzbl	%sil, %esi
	jmp	notanumber                      # TAILCALL
.L16:
	movzbl	%sil, %esi
	movl	%ebx, %edi
	jmp	notanumber                      # TAILCALL
.Lfunc_end:
	.size	vm_op_arith_dd_fallback, .Lfunc_end-vm_op_arith_dd_fallback
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0:
	.long	.L17-.LJTI0
	.long	.L12-.LJTI0
	.long	.L13-.LJTI0
	.long	.L14-.LJTI0
	.long	.L15-.LJTI0
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function vm_op_setcond_bad_op
	.type	vm_op_setcond_bad_op,@function
vm_op_setcond_bad_op:                   # @vm_op_setcond_bad_op
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	unimplemented                   # TAILCALL
.Lfunc_end:
	.size	vm_op_setcond_bad_op, .Lfunc_end-vm_op_setcond_bad_op
                                        # -- End function
	.p2align	5                               # -- Begin function unimplemented
	.type	unimplemented,@function
unimplemented:                          # @unimplemented
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.15(%rip), %rcx
	popq	%rbp
	jmp	panic                           # TAILCALL
.Lfunc_end:
	.size	unimplemented, .Lfunc_end-unimplemented
                                        # -- End function
	.text
	.p2align	5                               # -- Begin function vm_op_setc_CmpNotF
	.type	vm_op_setc_CmpNotF,@function
vm_op_setc_CmpNotF:                     # @vm_op_setc_CmpNotF
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %eax
	movzbl	%ah, %ebx
	movq	(%r13,%rbx,8), %r8
	cmpl	$-65536, %eax                   # imm = 0xFFFF0000
	setae	%al
	andq	$-5, %r8
	cmpq	$2, %r8
	sete	%bl
	xorb	%al, %bl
	movl	%esi, %eax
	je	.L1
# %bb.2:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
	jmp	.L3
.L1:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
.L3:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpNotF, .Lfunc_end-vm_op_setc_CmpNotF
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpEqDI
	.type	vm_op_setc_CmpEqDI,@function
vm_op_setc_CmpEqDI:                     # @vm_op_setc_CmpEqDI
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %eax
	movzbl	%ah, %ebx
	movq	(%r13,%rbx,8), %r8
	sarl	$16, %eax
	movq	%r8, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L4
# %bb.1:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jne	.L9
# %bb.2:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L3
.L4:
	testq	%r9, %r9
	je	.L8
# %bb.5:
	addq	%r14, %r8
	cvtsi2sd	%eax, %xmm0
	movq	%r8, %xmm1
	ucomisd	%xmm0, %xmm1
	movzbl	%sil, %eax
	jne	.L7
	jp	.L7
# %bb.6:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L3:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L10
.L9:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L10
.L7:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L10:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_di_fallback       # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpEqDI, .Lfunc_end-vm_op_setc_CmpEqDI
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpNeDI
	.type	vm_op_setc_CmpNeDI,@function
vm_op_setc_CmpNeDI:                     # @vm_op_setc_CmpNeDI
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %eax
	movzbl	%ah, %ebx
	movq	(%r13,%rbx,8), %r8
	sarl	$16, %eax
	movq	%r8, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L4
# %bb.1:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jne	.L2
# %bb.9:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L10
.L4:
	testq	%r9, %r9
	je	.L8
# %bb.5:
	addq	%r14, %r8
	cvtsi2sd	%eax, %xmm0
	movq	%r8, %xmm1
	ucomisd	%xmm0, %xmm1
	movzbl	%sil, %eax
	jne	.L6
	jnp	.L7
.L6:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
	jmp	.L3
.L2:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
.L3:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L10
.L7:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L10:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L8:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_di_fallback       # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpNeDI, .Lfunc_end-vm_op_setc_CmpNeDI
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpEqDC
	.type	vm_op_setc_CmpEqDC,@function
vm_op_setc_CmpEqDC:                     # @vm_op_setc_CmpEqDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	movq	16(%r15), %r8
	shrl	$16, %ebx
	movq	(%r8,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jne	.L11
# %bb.3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm1, %xmm0
	movzbl	%sil, %eax
	jne	.L9
	jp	.L9
# %bb.8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L12
.L11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpEqDC, .Lfunc_end-vm_op_setc_CmpEqDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpNeDC
	.type	vm_op_setc_CmpNeDC,@function
vm_op_setc_CmpNeDC:                     # @vm_op_setc_CmpNeDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	movq	16(%r15), %r8
	shrl	$16, %ebx
	movq	(%r8,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jne	.L3
# %bb.11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm1, %xmm0
	movzbl	%sil, %eax
	jne	.L8
	jnp	.L9
.L8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
	jmp	.L4
.L3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L12
.L9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpNeDC, .Lfunc_end-vm_op_setc_CmpNeDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpLtDC
	.type	vm_op_setc_CmpLtDC,@function
vm_op_setc_CmpLtDC:                     # @vm_op_setc_CmpLtDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	movq	16(%r15), %r8
	shrl	$16, %ebx
	movq	(%r8,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jge	.L11
# %bb.3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm0, %xmm1
	movzbl	%sil, %eax
	jbe	.L9
# %bb.8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L12
.L11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpLtDC, .Lfunc_end-vm_op_setc_CmpLtDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpLeDC
	.type	vm_op_setc_CmpLeDC,@function
vm_op_setc_CmpLeDC:                     # @vm_op_setc_CmpLeDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	movq	16(%r15), %r8
	shrl	$16, %ebx
	movq	(%r8,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jle	.L3
# %bb.11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm0, %xmm1
	movzbl	%sil, %eax
	jae	.L8
# %bb.9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
	jmp	.L12
.L3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpLeDC, .Lfunc_end-vm_op_setc_CmpLeDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpGtDC
	.type	vm_op_setc_CmpGtDC,@function
vm_op_setc_CmpGtDC:                     # @vm_op_setc_CmpGtDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	movq	16(%r15), %r8
	shrl	$16, %ebx
	movq	(%r8,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jle	.L11
# %bb.3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm1, %xmm0
	movzbl	%sil, %eax
	jbe	.L9
# %bb.8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L12
.L11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpGtDC, .Lfunc_end-vm_op_setc_CmpGtDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpGeDC
	.type	vm_op_setc_CmpGeDC,@function
vm_op_setc_CmpGeDC:                     # @vm_op_setc_CmpGeDC
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	movq	16(%r15), %r8
	shrl	$16, %ebx
	movq	(%r8,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jge	.L3
# %bb.11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm1, %xmm0
	movzbl	%sil, %eax
	jae	.L8
# %bb.9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
	jmp	.L12
.L3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpGeDC, .Lfunc_end-vm_op_setc_CmpGeDC
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpEqDD
	.type	vm_op_setc_CmpEqDD,@function
vm_op_setc_CmpEqDD:                     # @vm_op_setc_CmpEqDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	shrl	$16, %ebx
	movq	(%r13,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jne	.L11
# %bb.3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm1, %xmm0
	movzbl	%sil, %eax
	jne	.L9
	jp	.L9
# %bb.8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L12
.L11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpEqDD, .Lfunc_end-vm_op_setc_CmpEqDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpNeDD
	.type	vm_op_setc_CmpNeDD,@function
vm_op_setc_CmpNeDD:                     # @vm_op_setc_CmpNeDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	shrl	$16, %ebx
	movq	(%r13,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jne	.L3
# %bb.11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm1, %xmm0
	movzbl	%sil, %eax
	jne	.L8
	jnp	.L9
.L8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
	jmp	.L4
.L3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L12
.L9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpNeDD, .Lfunc_end-vm_op_setc_CmpNeDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpLtDD
	.type	vm_op_setc_CmpLtDD,@function
vm_op_setc_CmpLtDD:                     # @vm_op_setc_CmpLtDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	shrl	$16, %ebx
	movq	(%r13,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jge	.L11
# %bb.3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm0, %xmm1
	movzbl	%sil, %eax
	jbe	.L9
# %bb.8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L12
.L11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpLtDD, .Lfunc_end-vm_op_setc_CmpLtDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpLeDD
	.type	vm_op_setc_CmpLeDD,@function
vm_op_setc_CmpLeDD:                     # @vm_op_setc_CmpLeDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	shrl	$16, %ebx
	movq	(%r13,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jle	.L3
# %bb.11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm0, %xmm1
	movzbl	%sil, %eax
	jae	.L8
# %bb.9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
	jmp	.L12
.L3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpLeDD, .Lfunc_end-vm_op_setc_CmpLeDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpGtDD
	.type	vm_op_setc_CmpGtDD,@function
vm_op_setc_CmpGtDD:                     # @vm_op_setc_CmpGtDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	shrl	$16, %ebx
	movq	(%r13,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jle	.L11
# %bb.3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm1, %xmm0
	movzbl	%sil, %eax
	jbe	.L9
# %bb.8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
	jmp	.L12
.L11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpGtDD, .Lfunc_end-vm_op_setc_CmpGtDD
                                        # -- End function
	.p2align	5                               # -- Begin function vm_op_setc_CmpGeDD
	.type	vm_op_setc_CmpGeDD,@function
vm_op_setc_CmpGeDD:                     # @vm_op_setc_CmpGeDD
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	-4(%r12), %ebx
	movzbl	%bh, %eax
	movq	(%r13,%rax,8), %rax
	shrl	$16, %ebx
	movq	(%r13,%rbx,8), %r8
	movq	%rax, %r9
	andq	%r14, %r9
	cmpq	%r14, %r9
	jne	.L5
# %bb.1:
	movq	%r8, %r9
	notq	%r9
	testq	%r9, %r14
	jne	.L10
# %bb.2:
	movzbl	%sil, %esi
	cmpl	%r8d, %eax
	jge	.L3
# %bb.11:
	cmpw	$1, %di
	movl	$7, %eax
	sbbq	$0, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L12
.L5:
	testq	%r9, %r9
	je	.L10
# %bb.6:
	movq	%r8, %r9
	andq	%r14, %r9
	sete	%bl
	cmpq	%r14, %r9
	sete	%r9b
	orb	%bl, %r9b
	je	.L7
.L10:
	movzwl	%di, %edi
	movzbl	%sil, %esi
	popq	%rbp
	jmp	vm_op_compare_setc_fallback     # TAILCALL
.L7:
	addq	%r14, %rax
	movq	%rax, %xmm0
	addq	%r14, %r8
	movq	%r8, %xmm1
	ucomisd	%xmm1, %xmm0
	movzbl	%sil, %eax
	jae	.L8
# %bb.9:
	cmpw	$1, %di
	movl	$7, %esi
	sbbq	$0, %rsi
	movq	%rsi, (%r13,%rax,8)
	jmp	.L12
.L3:
	xorl	%eax, %eax
	cmpw	$1, %di
	adcq	$6, %rax
	movq	%rax, (%r13,%rsi,8)
	jmp	.L4
.L8:
	xorl	%esi, %esi
	cmpw	$1, %di
	adcq	$6, %rsi
	movq	%rsi, (%r13,%rax,8)
.L4:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
.L12:
	movzbl	(%r12), %eax
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.Lfunc_end:
	.size	vm_op_setc_CmpGeDD, .Lfunc_end-vm_op_setc_CmpGeDD
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.p2align	5                               # -- Begin function vm_op_compare_di_fallback
	.type	vm_op_compare_di_fallback,@function
vm_op_compare_di_fallback:              # @vm_op_compare_di_fallback
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	notanumber                      # TAILCALL
.Lfunc_end:
	.size	vm_op_compare_di_fallback, .Lfunc_end-vm_op_compare_di_fallback
                                        # -- End function
	.text
	.p2align	5                               # -- Begin function vm_op_compare_setc_fallback
	.type	vm_op_compare_setc_fallback,@function
vm_op_compare_setc_fallback:            # @vm_op_compare_setc_fallback
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdx, %r9
	movl	%esi, %ebx
	movl	-4(%r12), %edx
	movzbl	%dl, %r10d
	movzbl	%dh, %eax
	movq	%r13, %rsi
	cmpl	$47, %r10d
	ja	.L2
# %bb.1:
	movq	16(%r15), %rsi
.L2:
	movq	(%r13,%rax,8), %rax
	movl	%edx, %r8d
	shrl	$16, %r8d
	movq	(%rsi,%r8,8), %rsi
	movzbl	%dl, %edx
	addl	$-42, %edx
	cmpl	$7, %edx
	ja	.L6
# %bb.3:
	leaq	.LJTI0(%rip), %r8
	movslq	(%r8,%rdx,4), %rdx
	addq	%r8, %rdx
	jmpq	*%rdx
.L4:
	testw	%di, %di
	setne	%r8b
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	val_eq
	xorb	%al, %r8b
	movzbl	%r8b, %edx
	orq	$6, %rdx
	movzbl	%bl, %esi
	movq	%rdx, (%r13,%rsi,8)
	testb	%al, %al
	je	.L9
.L8:
	movzbl	64(%r15), %eax
	leaq	(%r12,%rax,4), %r12
.L9:
	movzbl	(%r12), %eax
	movq	(%r9,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	%r9, %rdx
	addq	$32, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L5:
	testw	%di, %di
	setne	%r8b
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	val_eq
	xorb	%al, %r8b
	movzbl	%r8b, %edx
	xorq	$7, %rdx
	movzbl	%bl, %esi
	movq	%rdx, (%r13,%rsi,8)
	testb	%al, %al
	je	.L8
	jmp	.L9
.L6:
	movl	%edi, -4(%rbp)                  # 4-byte Spill
	movq	%rcx, -16(%rbp)                 # 8-byte Spill
	leaq	-32(%rbp), %rcx
	leaq	-24(%rbp), %r8
	movq	%rax, %rdi
	movq	%r14, %rdx
	callq	val_to_f64_pair
	testb	%al, %al
	je	.L10
# %bb.7:
	cmpw	$0, -4(%rbp)                    # 2-byte Folded Reload
	setne	%cl
	movsd	-32(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	-24(%rbp), %xmm1                # xmm1 = mem[0],zero
	movl	%r10d, %edi
	callq	cmp_f64
	xorb	%al, %cl
	movzbl	%cl, %ecx
	orq	$6, %rcx
	movzbl	%bl, %edx
	movq	%rcx, (%r13,%rdx,8)
	testb	%al, %al
	movq	-16(%rbp), %rcx                 # 8-byte Reload
	jne	.L8
	jmp	.L9
.L10:
	movzwl	-4(%rbp), %edi                  # 2-byte Folded Reload
	movzbl	%bl, %esi
	movq	%r9, %rdx
	movq	-16(%rbp), %rcx                 # 8-byte Reload
	addq	$32, %rsp
	popq	%rbp
	jmp	notanumber                      # TAILCALL
.Lfunc_end:
	.size	vm_op_compare_setc_fallback, .Lfunc_end-vm_op_compare_setc_fallback
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0:
	.long	.L4-.LJTI0
	.long	.L5-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L4-.LJTI0
	.long	.L5-.LJTI0
                                        # -- End function
	.text
	.p2align	4                               # -- Begin function val_eq
	.type	val_eq,@function
val_eq:                                 # @val_eq
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	subq	$24, %rsp
	movb	$1, %al
	cmpq	%rsi, %rdi
	je	.L8
# %bb.1:
	leaq	-72(%rbp), %rcx
	leaq	-64(%rbp), %r8
	callq	val_to_f64_pair
	testb	%al, %al
	je	.L3
# %bb.2:
	movsd	-64(%rbp), %xmm0                # xmm0 = mem[0],zero
	cmpeqsd	-72(%rbp), %xmm0
	movq	%xmm0, %rax
	andl	$1, %eax
	jmp	.L8
.L3:
	addq	$7, %rdx
	movq	%rdx, %rax
	andq	%rdi, %rax
	xorq	$5, %rax
	andq	%rsi, %rdx
	xorq	$5, %rdx
	orq	%rax, %rdx
	jne	.L7
# %bb.4:
	movq	-5(%rdi), %rdx
	shrq	$32, %rdx
	movl	-1(%rsi), %eax
	cmpq	%rax, %rdx
	jne	.L7
# %bb.5:
	addq	$-5, %rdi
	addq	$-5, %rsi
	addq	$-9, %rdx
	addq	$8, %rdi
	addq	$8, %rsi
	callq	bcmp@PLT
	testl	%eax, %eax
	sete	%al
	jmp	.L8
.L7:
	xorl	%eax, %eax
.L8:
	addq	$24, %rsp
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8
	popq	%r9
	popq	%r10
	popq	%rbp
	retq
.Lfunc_end:
	.size	val_eq, .Lfunc_end-val_eq
                                        # -- End function
	.p2align	4                               # -- Begin function val_to_f64_pair
	.type	val_to_f64_pair,@function
val_to_f64_pair:                        # @val_to_f64_pair
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rax
	andq	%rdi, %rax
	cmpq	%rdx, %rax
	jne	.L2
# %bb.1:
	cvtsi2sd	%edi, %xmm0
	jmp	.L4
.L2:
	testq	%rax, %rax
	je	.L10
# %bb.3:
	addq	%rdx, %rdi
	movq	%rdi, %xmm0
.L4:
	movq	%xmm0, (%rcx)
	movq	%rdx, %rax
	andq	%rsi, %rax
	cmpq	%rdx, %rax
	jne	.L6
# %bb.5:
	xorps	%xmm0, %xmm0
	cvtsi2sd	%esi, %xmm0
	jmp	.L8
.L6:
	testq	%rax, %rax
	je	.L10
# %bb.7:
	addq	%rsi, %rdx
	movq	%rdx, %xmm0
.L8:
	movq	%xmm0, (%r8)
	movb	$1, %al
	jmp	.L11
.L10:
	xorl	%eax, %eax
.L11:
	popq	%rdx
	popq	%rdi
	popq	%rbp
	retq
.Lfunc_end:
	.size	val_to_f64_pair, .Lfunc_end-val_to_f64_pair
                                        # -- End function
	.p2align	4                               # -- Begin function cmp_f64
	.type	cmp_f64,@function
cmp_f64:                                # @cmp_f64
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	addl	$-42, %edi
	leaq	.LJTI0(%rip), %rax
	movslq	(%rax,%rdi,4), %r11
	addq	%rax, %r11
	jmpq	*%r11
.L1:
	cmpeqsd	%xmm1, %xmm0
	jmp	.L2
.L6:
	ucomisd	%xmm1, %xmm0
	seta	%al
	jmp	.L9
.L4:
	ucomisd	%xmm0, %xmm1
	seta	%al
	jmp	.L9
.L5:
	ucomisd	%xmm0, %xmm1
	jmp	.L8
.L3:
	cmpneqsd	%xmm1, %xmm0
.L2:
	movq	%xmm0, %rax
	andl	$1, %eax
	jmp	.L9
.L7:
	ucomisd	%xmm1, %xmm0
.L8:
	setae	%al
.L9:
	popq	%rdi
	popq	%rbp
	retq
.Lfunc_end:
	.size	cmp_f64, .Lfunc_end-cmp_f64
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0:
	.long	.L1-.LJTI0
	.long	.L3-.LJTI0
	.long	.L4-.LJTI0
	.long	.L5-.LJTI0
	.long	.L6-.LJTI0
	.long	.L7-.LJTI0
	.long	.L1-.LJTI0
	.long	.L3-.LJTI0
	.long	.L4-.LJTI0
	.long	.L5-.LJTI0
	.long	.L6-.LJTI0
	.long	.L7-.LJTI0
                                        # -- End function
	.text
	.p2align	5                               # -- Begin function vm_op_compare_dc_fallback
	.type	vm_op_compare_dc_fallback,@function
vm_op_compare_dc_fallback:              # @vm_op_compare_dc_fallback
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdx, %r8
	movq	%r14, %rdx
	movl	%esi, %r14d
	movl	%edi, %r9d
	movq	%r12, %r10
	addq	$-4, %r12
	movl	%esi, %eax
	movq	%r13, -8(%rbp)                  # 8-byte Spill
	movq	(%r13,%rax,8), %rdi
	movq	%r15, -16(%rbp)                 # 8-byte Spill
	movq	16(%r15), %rax
	movl	%r9d, %esi
	movq	(%rax,%rsi,8), %rsi
	movzbl	-8(%r10), %ebx
	leal	-42(%rbx), %eax
	cmpl	$7, %eax
	ja	.L6
# %bb.1:
	leaq	.LJTI0(%rip), %r11
	movslq	(%r11,%rax,4), %rax
	addq	%r11, %rax
	jmpq	*%rax
.L2:
	movq	%rdx, %r14
	callq	val_eq
	movzbl	%al, %eax
	testb	%al, %al
	cmovneq	%r10, %r12
	movzbl	-4(%r10,%rax,4), %eax
	jmp	.L3
.L5:
	movq	%rdx, %r14
	callq	val_eq
	movl	%eax, %edx
	xorb	$1, %dl
	movzbl	%dl, %edx
	testb	%al, %al
	cmoveq	%r10, %r12
	movzbl	-4(%r10,%rdx,4), %eax
.L3:
	movq	(%r8,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	-8(%rbp), %r13                  # 8-byte Reload
	movq	-16(%rbp), %r15                 # 8-byte Reload
	movq	%r8, %rdx
.L4:
	addq	$48, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L6:
	movq	%r8, -24(%rbp)                  # 8-byte Spill
	movq	%rcx, -32(%rbp)                 # 8-byte Spill
	leaq	-48(%rbp), %rcx
	leaq	-40(%rbp), %r8
	movq	%rdx, %r15
	callq	val_to_f64_pair
	testb	%al, %al
	je	.L8
# %bb.7:
	movsd	-48(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	-40(%rbp), %xmm1                # xmm1 = mem[0],zero
	movl	%ebx, %edi
	callq	cmp_f64
	movzbl	%al, %eax
	testb	%al, %al
	cmovneq	%r10, %r12
	movzbl	-4(%r10,%rax,4), %eax
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	-8(%rbp), %r13                  # 8-byte Reload
	movq	%r15, %r14
	movq	-16(%rbp), %r15                 # 8-byte Reload
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	jmp	.L4
.L8:
	movzwl	%r9w, %edi
	movzbl	%r14b, %esi
	movq	-8(%rbp), %r13                  # 8-byte Reload
	movq	%r15, %r14
	movq	-16(%rbp), %r15                 # 8-byte Reload
	movq	-24(%rbp), %rdx                 # 8-byte Reload
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	jmp	notanumber                      # TAILCALL
.Lfunc_end:
	.size	vm_op_compare_dc_fallback, .Lfunc_end-vm_op_compare_dc_fallback
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0:
	.long	.L2-.LJTI0
	.long	.L5-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L2-.LJTI0
	.long	.L5-.LJTI0
                                        # -- End function
	.text
	.p2align	5                               # -- Begin function vm_op_compare_dd_fallback
	.type	vm_op_compare_dd_fallback,@function
vm_op_compare_dd_fallback:              # @vm_op_compare_dd_fallback
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdx, %r8
	movq	%r15, -8(%rbp)                  # 8-byte Spill
	movl	%esi, %r15d
	movl	%edi, %r9d
	movq	%r12, %r10
	addq	$-4, %r12
	movl	%esi, %eax
	movq	(%r13,%rax,8), %rdi
	movl	%r9d, %eax
	movq	(%r13,%rax,8), %rsi
	movzbl	-8(%r10), %ebx
	leal	-42(%rbx), %eax
	cmpl	$7, %eax
	ja	.L6
# %bb.1:
	leaq	.LJTI0(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmpq	*%rax
.L2:
	movq	%r14, %rdx
	callq	val_eq
	movzbl	%al, %eax
	testb	%al, %al
	cmovneq	%r10, %r12
	movzbl	-4(%r10,%rax,4), %eax
	jmp	.L3
.L5:
	movq	%r14, %rdx
	callq	val_eq
	movl	%eax, %edx
	xorb	$1, %dl
	movzbl	%dl, %edx
	testb	%al, %al
	cmoveq	%r10, %r12
	movzbl	-4(%r10,%rdx,4), %eax
.L3:
	movq	(%r8,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	-8(%rbp), %r15                  # 8-byte Reload
	movq	%r8, %rdx
.L4:
	addq	$48, %rsp
	popq	%rbp
	jmpq	*%rax                           # TAILCALL
.L6:
	movq	%r8, -16(%rbp)                  # 8-byte Spill
	movq	%rcx, -24(%rbp)                 # 8-byte Spill
	leaq	-40(%rbp), %rcx
	leaq	-32(%rbp), %r8
	movq	%r14, %rdx
	callq	val_to_f64_pair
	testb	%al, %al
	je	.L8
# %bb.7:
	movsd	-40(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	-32(%rbp), %xmm1                # xmm1 = mem[0],zero
	movl	%ebx, %edi
	callq	cmp_f64
	movzbl	%al, %eax
	testb	%al, %al
	cmovneq	%r10, %r12
	movzbl	-4(%r10,%rax,4), %eax
	movq	-16(%rbp), %rdx                 # 8-byte Reload
	movq	(%rdx,%rax,8), %rax
	movzbl	1(%r12), %esi
	movzwl	2(%r12), %edi
	addq	$4, %r12
	movq	-8(%rbp), %r15                  # 8-byte Reload
	movq	-24(%rbp), %rcx                 # 8-byte Reload
	jmp	.L4
.L8:
	movzwl	%r9w, %edi
	movzbl	%r15b, %esi
	movq	-8(%rbp), %r15                  # 8-byte Reload
	movq	-16(%rbp), %rdx                 # 8-byte Reload
	movq	-24(%rbp), %rcx                 # 8-byte Reload
	addq	$48, %rsp
	popq	%rbp
	jmp	notanumber                      # TAILCALL
.Lfunc_end:
	.size	vm_op_compare_dd_fallback, .Lfunc_end-vm_op_compare_dd_fallback
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0:
	.long	.L2-.LJTI0
	.long	.L5-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L6-.LJTI0
	.long	.L2-.LJTI0
	.long	.L5-.LJTI0
                                        # -- End function
	.type	dispatch,@object                # @dispatch
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
dispatch:
	.quad	vm_op_Halt
	.quad	vm_op_Nop
	.quad	vm_op_Exta
	.quad	vm_op_LoadI
	.quad	vm_op_LoaduI
	.quad	vm_op_LoadR
	.quad	vm_op_LoadC
	.quad	vm_op_LoadType
	.quad	vm_op_LoadFree
	.quad	vm_op_LoadField
	.quad	vm_op_SetField
	.quad	vm_op_LoadInd
	.quad	vm_op_SetInd
	.quad	vm_op_View
	.quad	vm_op_Move
	.quad	vm_op_Apply
	.quad	vm_op_Invoke
	.quad	vm_op_Call
	.quad	vm_op_Native
	.quad	vm_op_Retu
	.quad	vm_op_Ret
	.quad	vm_op_Retn
	.quad	vm_op_Clos
	.quad	vm_op_WObj
	.quad	vm_op_Jmp
	.quad	vm_op_Goto
	.quad	vm_op_AddDC
	.quad	vm_op_SubDC
	.quad	vm_op_MulDC
	.quad	vm_op_DivDC
	.quad	vm_op_RemDC
	.quad	vm_op_AddDD
	.quad	vm_op_SubDD
	.quad	vm_op_MulDD
	.quad	vm_op_DivDD
	.quad	vm_op_RemDD
	.quad	vm_op_NegD
	.quad	vm_op_SetCond
	.quad	vm_op_SetCondJ
	.quad	vm_op_CmpNotF
	.quad	vm_op_CmpEqDI
	.quad	vm_op_CmpNeDI
	.quad	vm_op_CmpEqDC
	.quad	vm_op_CmpNeDC
	.quad	vm_op_CmpLtDC
	.quad	vm_op_CmpLeDC
	.quad	vm_op_CmpGtDC
	.quad	vm_op_CmpGeDC
	.quad	vm_op_CmpEqDD
	.quad	vm_op_CmpNeDD
	.quad	vm_op_CmpLtDD
	.quad	vm_op_CmpLeDD
	.quad	vm_op_CmpGtDD
	.quad	vm_op_CmpGeDD
	.size	dispatch, 432

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"unused extra arguments"
	.size	.L.str, 23

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"panic: %s\n"
	.size	.L.str.2, 11

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"bad opcode"
	.size	.L.str.3, 11

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"no such member"
	.size	.L.str.4, 15

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"not a field"
	.size	.L.str.5, 12

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"not a type"
	.size	.L.str.6, 11

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"not an instance"
	.size	.L.str.7, 16

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"out of memory"
	.size	.L.str.8, 14

	.type	cannotview_msg,@object          # @cannotview_msg
	.local	cannotview_msg
	.comm	cannotview_msg,256,16
	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"cannot view %.*s as %.*s: no field %.*s"
	.size	.L.str.9, 40

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"not a function"
	.size	.L.str.10, 15

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"stack overflow"
	.size	.L.str.11, 15

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"invalid layout"
	.size	.L.str.12, 15

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"not a offset"
	.size	.L.str.13, 13

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"not a number"
	.size	.L.str.14, 13

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"unimplemented"
	.size	.L.str.15, 14

	.type	dispatch_setc,@object           # @dispatch_setc
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
dispatch_setc:
	.quad	vm_op_setc_CmpNotF
	.quad	vm_op_setc_CmpEqDI
	.quad	vm_op_setc_CmpNeDI
	.quad	vm_op_setc_CmpEqDC
	.quad	vm_op_setc_CmpNeDC
	.quad	vm_op_setc_CmpLtDC
	.quad	vm_op_setc_CmpLeDC
	.quad	vm_op_setc_CmpGtDC
	.quad	vm_op_setc_CmpGeDC
	.quad	vm_op_setc_CmpEqDD
	.quad	vm_op_setc_CmpNeDD
	.quad	vm_op_setc_CmpLtDD
	.quad	vm_op_setc_CmpLeDD
	.quad	vm_op_setc_CmpGtDD
	.quad	vm_op_setc_CmpGeDD
	.size	dispatch_setc, 120

	.ident	"clang version 20.1.2 (https://github.com/ziglang/zig-bootstrap c6bc9398c72c7a63fe9420a9055dcfd1845bc266)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym vm_op_Halt
	.addrsig_sym vm_op_Nop
	.addrsig_sym vm_op_Exta
	.addrsig_sym vm_op_LoadI
	.addrsig_sym vm_op_LoaduI
	.addrsig_sym vm_op_LoadR
	.addrsig_sym vm_op_LoadC
	.addrsig_sym vm_op_LoadType
	.addrsig_sym vm_op_LoadFree
	.addrsig_sym vm_op_LoadField
	.addrsig_sym vm_op_SetField
	.addrsig_sym vm_op_LoadInd
	.addrsig_sym vm_op_SetInd
	.addrsig_sym vm_op_View
	.addrsig_sym vm_op_Move
	.addrsig_sym vm_op_Apply
	.addrsig_sym vm_op_Invoke
	.addrsig_sym vm_op_Call
	.addrsig_sym vm_op_Native
	.addrsig_sym vm_op_Retu
	.addrsig_sym vm_op_Ret
	.addrsig_sym vm_op_Retn
	.addrsig_sym vm_op_Clos
	.addrsig_sym vm_op_WObj
	.addrsig_sym vm_op_Jmp
	.addrsig_sym vm_op_Goto
	.addrsig_sym vm_op_AddDC
	.addrsig_sym vm_op_SubDC
	.addrsig_sym vm_op_MulDC
	.addrsig_sym vm_op_DivDC
	.addrsig_sym vm_op_RemDC
	.addrsig_sym vm_op_AddDD
	.addrsig_sym vm_op_SubDD
	.addrsig_sym vm_op_MulDD
	.addrsig_sym vm_op_DivDD
	.addrsig_sym vm_op_RemDD
	.addrsig_sym vm_op_NegD
	.addrsig_sym vm_op_SetCond
	.addrsig_sym vm_op_SetCondJ
	.addrsig_sym vm_op_CmpNotF
	.addrsig_sym vm_op_CmpEqDI
	.addrsig_sym vm_op_CmpNeDI
	.addrsig_sym vm_op_CmpEqDC
	.addrsig_sym vm_op_CmpNeDC
	.addrsig_sym vm_op_CmpLtDC
	.addrsig_sym vm_op_CmpLeDC
	.addrsig_sym vm_op_CmpGtDC
	.addrsig_sym vm_op_CmpGeDC
	.addrsig_sym vm_op_CmpEqDD
	.addrsig_sym vm_op_CmpNeDD
	.addrsig_sym vm_op_CmpLtDD
	.addrsig_sym vm_op_CmpLeDD
	.addrsig_sym vm_op_CmpGtDD
	.addrsig_sym vm_op_CmpGeDD
	.addrsig_sym vm_op_setc_CmpNotF
	.addrsig_sym vm_op_setc_CmpEqDI
	.addrsig_sym vm_op_setc_CmpNeDI
	.addrsig_sym vm_op_setc_CmpEqDC
	.addrsig_sym vm_op_setc_CmpNeDC
	.addrsig_sym vm_op_setc_CmpLtDC
	.addrsig_sym vm_op_setc_CmpLeDC
	.addrsig_sym vm_op_setc_CmpGtDC
	.addrsig_sym vm_op_setc_CmpGeDC
	.addrsig_sym vm_op_setc_CmpEqDD
	.addrsig_sym vm_op_setc_CmpNeDD
	.addrsig_sym vm_op_setc_CmpLtDD
	.addrsig_sym vm_op_setc_CmpLeDD
	.addrsig_sym vm_op_setc_CmpGtDD
	.addrsig_sym vm_op_setc_CmpGeDD
	.addrsig_sym dispatch
	.addrsig_sym cannotview_msg
