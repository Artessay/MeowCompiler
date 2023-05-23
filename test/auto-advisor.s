	.text
	.file	"auto-advisor"
	.globl	readLine                        # -- Begin function readLine
	.p2align	4, 0x90
	.type	readLine,@function
readLine:                               # @readLine
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	$0, 12(%rsp)
	callq	getchar@PLT
	movslq	12(%rsp), %rcx
	movq	buffer@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB0_1:                                # %while.loop
                                        # =>This Inner Loop Header: Depth=1
	movb	%al, (%rbx,%rcx)
	movslq	12(%rsp), %rax
	cmpb	$10, (%rbx,%rax)
	je	.LBB0_3
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	12(%rsp)
	callq	getchar@PLT
	movslq	12(%rsp), %rcx
	jmp	.LBB0_1
.LBB0_3:                                # %while.after
	movslq	12(%rsp), %rax
	movb	$0, (%rbx,%rax)
                                        # kill: def $eax killed $eax killed $rax
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	readLine, .Lfunc_end0-readLine
	.cfi_endproc
                                        # -- End function
	.globl	printLine                       # -- Begin function printLine
	.p2align	4, 0x90
	.type	printLine,@function
printLine:                              # @printLine
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	$0, 12(%rsp)
	movq	buffer@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB1_1:                                # %while.loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	12(%rsp), %rax
	cmpb	$0, (%rbx,%rax)
	je	.LBB1_3
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movslq	12(%rsp), %rax
	movsbl	(%rbx,%rax), %edi
	callq	putchar@PLT
	incl	12(%rsp)
	jmp	.LBB1_1
.LBB1_3:                                # %while.after
	movl	$10, %edi
	callq	putchar@PLT
	movl	12(%rsp), %eax
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	printLine, .Lfunc_end1-printLine
	.cfi_endproc
                                        # -- End function
	.globl	judge                           # -- Begin function judge
	.p2align	4, 0x90
	.type	judge,@function
judge:                                  # @judge
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	movslq	%edi, %rax
	imulq	$302, %rax, %rcx                # imm = 0x12E
	movq	coursePrerequisite@GOTPCREL(%rip), %r9
	cmpb	$0, (%r9,%rcx)
	je	.LBB2_8
# %bb.1:
	movq	coursePassed@GOTPCREL(%rip), %r8
	.p2align	4, 0x90
.LBB2_2:                                # %while.loop
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
                                        #     Child Loop BB2_12 Depth 2
	movslq	-12(%rbp), %rcx
	imulq	$302, %rcx, %rcx                # imm = 0x12E
	addq	%r9, %rcx
	movslq	-4(%rbp), %rdx
	cmpb	$0, (%rdx,%rcx)
	je	.LBB2_10
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB2_2 Depth=1
	movq	%rsp, %rdx
	addq	$-16, %rdx
	movq	%rdx, %rsp
	movl	$0, -20(%rbp)
	.p2align	4, 0x90
.LBB2_4:                                # %while.loop8
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-12(%rbp), %rcx
	imulq	$302, %rcx, %rcx                # imm = 0x12E
	addq	%r9, %rcx
	movslq	-4(%rbp), %rsi
	movzbl	(%rsi,%rcx), %ecx
	testb	%cl, %cl
	je	.LBB2_11
# %bb.5:                                # %while.loop8
                                        #   in Loop: Header=BB2_4 Depth=2
	cmpb	$44, %cl
	je	.LBB2_11
# %bb.6:                                # %while.loop8
                                        #   in Loop: Header=BB2_4 Depth=2
	cmpb	$59, %cl
	je	.LBB2_11
# %bb.7:                                # %while.body9
                                        #   in Loop: Header=BB2_4 Depth=2
	movslq	-12(%rbp), %rcx
	imulq	$302, %rcx, %rcx                # imm = 0x12E
	addq	%r9, %rcx
	movslq	-4(%rbp), %rsi
	movzbl	(%rsi,%rcx), %ecx
	movslq	-20(%rbp), %rsi
	movb	%cl, (%rdx,%rsi)
	incl	-20(%rbp)
	incl	-4(%rbp)
	jmp	.LBB2_4
	.p2align	4, 0x90
.LBB2_11:                               # %while.after10
                                        #   in Loop: Header=BB2_2 Depth=1
	movslq	-20(%rbp), %rcx
	movb	$0, (%rdx,%rcx)
	movq	%rsp, %rcx
	leaq	-16(%rcx), %r10
	movq	%r10, %rsp
	movl	$0, -16(%rcx)
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rdi
	movq	%rdi, %rsp
	movl	$0, -16(%rcx)
	.p2align	4, 0x90
.LBB2_12:                               # %while.loop44
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	(%rdi), %rcx
	cmpb	$0, (%rdx,%rcx)
	je	.LBB2_14
# %bb.13:                               # %while.body45
                                        #   in Loop: Header=BB2_12 Depth=2
	movl	(%r10), %eax
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movslq	(%rdi), %rax
	movsbl	(%rdx,%rax), %eax
	addl	%ecx, %eax
	cltq
	imulq	$2147450881, %rax, %rcx         # imm = 0x7FFF8001
	movq	%rcx, %rsi
	shrq	$63, %rsi
	sarq	$47, %rcx
	addl	%esi, %ecx
	movl	%ecx, %esi
	shll	$16, %esi
	addl	%ecx, %esi
	subl	%esi, %eax
	movl	%eax, (%r10)
	incl	(%rdi)
	jmp	.LBB2_12
	.p2align	4, 0x90
.LBB2_14:                               # %while.after46
                                        #   in Loop: Header=BB2_2 Depth=1
	cmpl	$0, -16(%rbp)
	je	.LBB2_15
# %bb.21:                               # %if.else64
                                        #   in Loop: Header=BB2_2 Depth=1
	cmpl	$1, -16(%rbp)
	jne	.LBB2_2
# %bb.22:                               # %if.then98
                                        #   in Loop: Header=BB2_2 Depth=1
	cmpl	$1, -8(%rbp)
	jne	.LBB2_25
# %bb.23:                               # %if.then98
                                        #   in Loop: Header=BB2_2 Depth=1
	movslq	(%r10), %rax
	cmpl	$1, (%r8,%rax,4)
	jne	.LBB2_25
# %bb.24:                               # %if.then108
                                        #   in Loop: Header=BB2_2 Depth=1
	movl	$1, -8(%rbp)
	jmp	.LBB2_16
	.p2align	4, 0x90
.LBB2_15:                               # %if.then63
                                        #   in Loop: Header=BB2_2 Depth=1
	movslq	(%r10), %rax
	movl	(%r8,%rax,4), %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB2_16
.LBB2_25:                               # %if.else109
                                        #   in Loop: Header=BB2_2 Depth=1
	movl	$0, -8(%rbp)
.LBB2_16:                               # %if.then63
                                        #   in Loop: Header=BB2_2 Depth=1
	movslq	-12(%rbp), %rax
	imulq	$302, %rax, %rax                # imm = 0x12E
	addq	%r9, %rax
	movslq	-4(%rbp), %rcx
	cmpb	$59, (%rcx,%rax)
	jne	.LBB2_19
# %bb.17:                               # %if.then74
                                        #   in Loop: Header=BB2_2 Depth=1
	cmpl	$1, -8(%rbp)
	je	.LBB2_8
# %bb.18:                               # %if.else80
                                        #   in Loop: Header=BB2_2 Depth=1
	movl	$0, -16(%rbp)
	movl	$0, -8(%rbp)
	incl	-4(%rbp)
	jmp	.LBB2_2
	.p2align	4, 0x90
.LBB2_19:                               # %if.else75
                                        #   in Loop: Header=BB2_2 Depth=1
	movslq	-12(%rbp), %rax
	imulq	$302, %rax, %rax                # imm = 0x12E
	addq	%r9, %rax
	movslq	-4(%rbp), %rcx
	cmpb	$44, (%rcx,%rax)
	jne	.LBB2_20
# %bb.26:                               # %if.then90
                                        #   in Loop: Header=BB2_2 Depth=1
	movl	$1, -16(%rbp)
	incl	-4(%rbp)
	jmp	.LBB2_2
.LBB2_8:                                # %if.then
	movl	$1, %eax
	jmp	.LBB2_9
.LBB2_10:                               # %while.after
	xorl	%eax, %eax
	jmp	.LBB2_9
.LBB2_20:                               # %if.else91
	movl	-8(%rbp), %eax
.LBB2_9:                                # %if.then
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	judge, .Lfunc_end2-judge
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	$0, -44(%rbp)
	movl	$0, -68(%rbp)
	movl	$0, -64(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -56(%rbp)
	callq	readLine@PLT
	movl	%eax, -60(%rbp)
	movl	$0, -48(%rbp)
	movq	buffer@GOTPCREL(%rip), %r15
	movq	courses@GOTPCREL(%rip), %r12
	.p2align	4, 0x90
.LBB3_1:                                # %while.loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	-48(%rbp), %rax
	cmpb	$0, (%r15,%rax)
	je	.LBB3_3
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movslq	-48(%rbp), %rax
	movzbl	(%r15,%rax), %ecx
	movslq	-44(%rbp), %rdx
	imulq	$302, %rdx, %rdx                # imm = 0x12E
	addq	%r12, %rdx
	movb	%cl, (%rax,%rdx)
	incl	-48(%rbp)
	jmp	.LBB3_1
.LBB3_3:                                # %while.after
	movslq	-44(%rbp), %rax
	imulq	$302, %rax, %rax                # imm = 0x12E
	addq	courses@GOTPCREL(%rip), %rax
	movslq	-48(%rbp), %rcx
	movb	$0, (%rcx,%rax)
	movq	courseName@GOTPCREL(%rip), %r14
	movq	coursePrerequisite@GOTPCREL(%rip), %r13
	.p2align	4, 0x90
.LBB3_4:                                # %while.loop14
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_6 Depth 2
                                        #     Child Loop BB3_10 Depth 2
                                        #     Child Loop BB3_19 Depth 2
                                        #     Child Loop BB3_31 Depth 2
	cmpl	$0, -60(%rbp)
	je	.LBB3_34
# %bb.5:                                # %while.body15
                                        #   in Loop: Header=BB3_4 Depth=1
	movq	%rsp, %rax
	leaq	-16(%rax), %rdx
	movq	%rdx, %rsp
	movq	%rsp, %rsi
	leaq	-16(%rsi), %rcx
	movq	%rcx, %rsp
	movl	$0, -16(%rsi)
	movl	$0, -16(%rax)
	.p2align	4, 0x90
.LBB3_6:                                # %while.loop19
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	(%rcx), %rax
	movsbl	(%r15,%rax), %eax
	cmpl	$124, %eax
	je	.LBB3_9
# %bb.7:                                # %while.loop19
                                        #   in Loop: Header=BB3_6 Depth=2
	testl	%eax, %eax
	je	.LBB3_9
# %bb.8:                                # %while.body20
                                        #   in Loop: Header=BB3_6 Depth=2
	movslq	(%rcx), %rax
	movzbl	(%r15,%rax), %eax
	movslq	-44(%rbp), %rsi
	imulq	$302, %rsi, %rsi                # imm = 0x12E
	addq	%r14, %rsi
	movslq	(%rdx), %rdi
	movb	%al, (%rdi,%rsi)
	incl	(%rdx)
	incl	(%rcx)
	jmp	.LBB3_6
	.p2align	4, 0x90
.LBB3_9:                                # %while.after21
                                        #   in Loop: Header=BB3_4 Depth=1
	movslq	-44(%rbp), %rax
	imulq	$302, %rax, %rax                # imm = 0x12E
	addq	%r14, %rax
	movslq	(%rdx), %rsi
	movb	$0, (%rsi,%rax)
	incl	(%rcx)
	movq	%rsp, %rsi
	leaq	-16(%rsi), %rax
	movq	%rax, %rsp
	movslq	(%rcx), %rdi
	movb	(%r15,%rdi), %bl
	addb	$-48, %bl
	movsbl	%bl, %edi
	movl	%edi, -16(%rsi)
	incl	(%rcx)
	movl	-16(%rsi), %esi
	addl	%esi, -68(%rbp)
	incl	(%rcx)
	movl	$0, (%rdx)
	.p2align	4, 0x90
.LBB3_10:                               # %while.loop61
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	(%rcx), %rsi
	movzbl	(%r15,%rsi), %ebx
	cmpb	$124, %bl
	je	.LBB3_13
# %bb.11:                               # %while.loop61
                                        #   in Loop: Header=BB3_10 Depth=2
	testb	%bl, %bl
	je	.LBB3_13
# %bb.12:                               # %while.body62
                                        #   in Loop: Header=BB3_10 Depth=2
	movslq	(%rcx), %rsi
	movzbl	(%r15,%rsi), %ebx
	movslq	-44(%rbp), %rsi
	imulq	$302, %rsi, %rsi                # imm = 0x12E
	addq	%r13, %rsi
	movslq	(%rdx), %rdi
	movb	%bl, (%rdi,%rsi)
	incl	(%rdx)
	incl	(%rcx)
	jmp	.LBB3_10
	.p2align	4, 0x90
.LBB3_13:                               # %while.after63
                                        #   in Loop: Header=BB3_4 Depth=1
	movslq	-44(%rbp), %rsi
	imulq	$302, %rsi, %rsi                # imm = 0x12E
	addq	%r13, %rsi
	movslq	(%rdx), %rdx
	movb	$0, (%rdx,%rsi)
	incl	(%rcx)
	movq	%rsp, %rsi
	leaq	-16(%rsi), %rdx
	movq	%rdx, %rsp
	movslq	(%rcx), %rcx
	movsbl	(%r15,%rcx), %ecx
	movl	%ecx, -16(%rsi)
	movq	%rsp, %rdi
	leaq	-16(%rdi), %rcx
	movq	%rcx, %rsp
	movl	$-1, -16(%rdi)
	cmpl	$65, -16(%rsi)
	jne	.LBB3_22
# %bb.14:                               # %if.then
                                        #   in Loop: Header=BB3_4 Depth=1
	movl	$4, (%rcx)
	jmp	.LBB3_15
	.p2align	4, 0x90
.LBB3_22:                               # %if.else
                                        #   in Loop: Header=BB3_4 Depth=1
	cmpl	$66, (%rdx)
	jne	.LBB3_23
# %bb.21:                               # %if.then97
                                        #   in Loop: Header=BB3_4 Depth=1
	movl	$3, (%rcx)
	jmp	.LBB3_15
	.p2align	4, 0x90
.LBB3_23:                               # %if.else98
                                        #   in Loop: Header=BB3_4 Depth=1
	cmpl	$67, (%rdx)
	jne	.LBB3_25
# %bb.24:                               # %if.then102
                                        #   in Loop: Header=BB3_4 Depth=1
	movl	$2, (%rcx)
	jmp	.LBB3_15
.LBB3_25:                               # %if.else103
                                        #   in Loop: Header=BB3_4 Depth=1
	cmpl	$68, (%rdx)
	jne	.LBB3_27
# %bb.26:                               # %if.then107
                                        #   in Loop: Header=BB3_4 Depth=1
	movl	$1, (%rcx)
	jmp	.LBB3_15
.LBB3_27:                               # %if.else108
                                        #   in Loop: Header=BB3_4 Depth=1
	cmpl	$70, (%rdx)
	jne	.LBB3_15
# %bb.28:                               # %if.then112
                                        #   in Loop: Header=BB3_4 Depth=1
	movl	$0, (%rcx)
	.p2align	4, 0x90
.LBB3_15:                               # %if.merge
                                        #   in Loop: Header=BB3_4 Depth=1
	cmpl	$0, (%rcx)
	js	.LBB3_17
# %bb.16:                               # %if.then116
                                        #   in Loop: Header=BB3_4 Depth=1
	movl	(%rax), %edx
	addl	%edx, -52(%rbp)
	movl	(%rax), %edx
	imull	(%rcx), %edx
	addl	%edx, -64(%rbp)
.LBB3_17:                               # %if.merge118
                                        #   in Loop: Header=BB3_4 Depth=1
	cmpl	$0, (%rcx)
	jle	.LBB3_30
# %bb.18:                               # %if.then128
                                        #   in Loop: Header=BB3_4 Depth=1
	movl	(%rax), %eax
	addl	%eax, -56(%rbp)
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rax
	movq	%rax, %rsp
	movl	$0, -16(%rcx)
	movq	%rsp, %rdx
	leaq	-16(%rdx), %rcx
	movq	%rcx, %rsp
	movl	$0, -16(%rdx)
	.p2align	4, 0x90
.LBB3_19:                               # %while.loop134
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-44(%rbp), %rdx
	imulq	$302, %rdx, %rdx                # imm = 0x12E
	addq	%r14, %rdx
	movslq	(%rcx), %rsi
	cmpb	$0, (%rsi,%rdx)
	je	.LBB3_29
# %bb.20:                               # %while.body135
                                        #   in Loop: Header=BB3_19 Depth=2
	movl	(%rax), %edx
	movl	%edx, %esi
	shll	$5, %esi
	addl	%edx, %esi
	movslq	-44(%rbp), %rdx
	imulq	$302, %rdx, %rdx                # imm = 0x12E
	addq	%r14, %rdx
	movslq	(%rcx), %rdi
	movsbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	movslq	%edx, %rdx
	imulq	$2147450881, %rdx, %rsi         # imm = 0x7FFF8001
	movq	%rsi, %rdi
	shrq	$63, %rdi
	sarq	$47, %rsi
	addl	%edi, %esi
	movl	%esi, %edi
	shll	$16, %edi
	addl	%esi, %edi
	subl	%edi, %edx
	movl	%edx, (%rax)
	incl	(%rcx)
	jmp	.LBB3_19
	.p2align	4, 0x90
.LBB3_29:                               # %while.after136
                                        #   in Loop: Header=BB3_4 Depth=1
	movslq	(%rax), %rax
	movq	coursePassed@GOTPCREL(%rip), %rcx
	movl	$1, (%rcx,%rax,4)
.LBB3_30:                               # %if.merge130
                                        #   in Loop: Header=BB3_4 Depth=1
	incl	-44(%rbp)
	callq	readLine@PLT
	movl	%eax, -60(%rbp)
	movl	$0, -48(%rbp)
	.p2align	4, 0x90
.LBB3_31:                               # %while.loop160
                                        #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-48(%rbp), %rax
	cmpb	$0, (%r15,%rax)
	je	.LBB3_4
# %bb.32:                               # %while.body161
                                        #   in Loop: Header=BB3_31 Depth=2
	movslq	-48(%rbp), %rax
	movzbl	(%r15,%rax), %ecx
	movslq	-44(%rbp), %rdx
	imulq	$302, %rdx, %rdx                # imm = 0x12E
	addq	%r12, %rdx
	movb	%cl, (%rax,%rdx)
	incl	-48(%rbp)
	jmp	.LBB3_31
.LBB3_34:                               # %while.after16
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, %rsp
	cmpl	$0, -52(%rbp)
	je	.LBB3_33
# %bb.35:                               # %if.else179
	cvtsi2sdl	-64(%rbp), %xmm0
	cvtsi2sdl	-52(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	jmp	.LBB3_36
.LBB3_33:                               # %if.then178
	movq	$0, (%rax)
.LBB3_36:                               # %if.merge180
	movq	%rsp, %rbx
	leaq	-16(%rbx), %rsp
	movl	-68(%rbp), %ecx
	subl	-56(%rbp), %ecx
	movl	%ecx, -16(%rbx)
	movsd	(%rax), %xmm0                   # xmm0 = mem[0],zero
	movl	$.Lstring, %edi
	movb	$1, %al
	callq	printf@PLT
	movl	-52(%rbp), %esi
	movl	$.Lstring.1, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	-56(%rbp), %esi
	movl	$.Lstring.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	-16(%rbx), %esi
	movl	$.Lstring.3, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$.Lstring.4, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	cmpl	$0, -16(%rbx)
	je	.LBB3_37
# %bb.39:                               # %if.else199
	movq	%rsp, %rax
	leaq	-16(%rax), %rbx
	movq	%rbx, %rsp
	movl	$0, -16(%rax)
	jmp	.LBB3_40
	.p2align	4, 0x90
.LBB3_46:                               # %if.merge234
                                        #   in Loop: Header=BB3_40 Depth=1
	incl	(%rbx)
.LBB3_40:                               # %for.loop
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_42 Depth 2
                                        #     Child Loop BB3_48 Depth 2
	movl	(%rbx), %eax
	cmpl	-44(%rbp), %eax
	jge	.LBB3_38
# %bb.41:                               # %for.body
                                        #   in Loop: Header=BB3_40 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rax
	movq	%rax, %rsp
	movl	$0, -16(%rcx)
	movq	%rsp, %rdx
	leaq	-16(%rdx), %rcx
	movq	%rcx, %rsp
	movl	$0, -16(%rdx)
	.p2align	4, 0x90
.LBB3_42:                               # %while.loop207
                                        #   Parent Loop BB3_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	(%rbx), %rdx
	imulq	$302, %rdx, %rdx                # imm = 0x12E
	addq	%r14, %rdx
	movslq	(%rcx), %rsi
	cmpb	$0, (%rsi,%rdx)
	je	.LBB3_44
# %bb.43:                               # %while.body208
                                        #   in Loop: Header=BB3_42 Depth=2
	movl	(%rax), %edx
	movl	%edx, %esi
	shll	$5, %esi
	addl	%edx, %esi
	movslq	(%rbx), %rdx
	imulq	$302, %rdx, %rdx                # imm = 0x12E
	addq	%r14, %rdx
	movslq	(%rcx), %rdi
	movsbl	(%rdi,%rdx), %edx
	addl	%esi, %edx
	movslq	%edx, %rdx
	imulq	$2147450881, %rdx, %rsi         # imm = 0x7FFF8001
	movq	%rsi, %rdi
	shrq	$63, %rdi
	sarq	$47, %rsi
	addl	%edi, %esi
	movl	%esi, %edi
	shll	$16, %edi
	addl	%esi, %edi
	subl	%edi, %edx
	movl	%edx, (%rax)
	incl	(%rcx)
	jmp	.LBB3_42
	.p2align	4, 0x90
.LBB3_44:                               # %while.after209
                                        #   in Loop: Header=BB3_40 Depth=1
	movslq	(%rax), %rax
	movq	coursePassed@GOTPCREL(%rip), %rcx
	cmpl	$1, (%rcx,%rax,4)
	je	.LBB3_46
# %bb.45:                               # %if.then232
                                        #   in Loop: Header=BB3_40 Depth=1
	movl	(%rbx), %edi
	callq	judge@PLT
	cmpl	$1, %eax
	jne	.LBB3_46
# %bb.47:                               # %if.then238
                                        #   in Loop: Header=BB3_40 Depth=1
	movl	$.Lstring.6, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rax
	movq	%rax, %rsp
	movl	$0, -16(%rcx)
	.p2align	4, 0x90
.LBB3_48:                               # %while.loop243
                                        #   Parent Loop BB3_40 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	(%rbx), %rcx
	imulq	$302, %rcx, %rcx                # imm = 0x12E
	addq	%r14, %rcx
	movslq	(%rax), %rdx
	cmpb	$0, (%rdx,%rcx)
	je	.LBB3_50
# %bb.49:                               # %while.body244
                                        #   in Loop: Header=BB3_48 Depth=2
	movslq	(%rbx), %rcx
	imulq	$302, %rcx, %rcx                # imm = 0x12E
	addq	%r14, %rcx
	movslq	(%rax), %rdx
	movzbl	(%rdx,%rcx), %ecx
	movb	%cl, (%r15,%rdx)
	incl	(%rax)
	jmp	.LBB3_48
	.p2align	4, 0x90
.LBB3_50:                               # %while.after245
                                        #   in Loop: Header=BB3_40 Depth=1
	movslq	(%rax), %rax
	movb	$0, (%r15,%rax)
	callq	printLine@PLT
	incl	(%rbx)
	jmp	.LBB3_40
.LBB3_37:                               # %if.then198
	movl	$.Lstring.5, %edi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB3_38:                               # %if.merge200
	movl	$.Lstring.7, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	courses,@object                 # @courses
	.bss
	.globl	courses
	.p2align	4
courses:
	.zero	91204
	.size	courses, 91204

	.type	courseName,@object              # @courseName
	.globl	courseName
	.p2align	4
courseName:
	.zero	91204
	.size	courseName, 91204

	.type	coursePrerequisite,@object      # @coursePrerequisite
	.globl	coursePrerequisite
	.p2align	4
coursePrerequisite:
	.zero	91204
	.size	coursePrerequisite, 91204

	.type	coursePassed,@object            # @coursePassed
	.globl	coursePassed
	.p2align	4
coursePassed:
	.zero	262148
	.size	coursePassed, 262148

	.type	buffer,@object                  # @buffer
	.globl	buffer
	.p2align	4
buffer:
	.zero	302
	.size	buffer, 302

	.type	.Lstring,@object                # @string
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstring:
	.asciz	"GPA: %.1f\n"
	.size	.Lstring, 11

	.type	.Lstring.1,@object              # @string.1
.Lstring.1:
	.asciz	"Hours Attempted: %d\n"
	.size	.Lstring.1, 21

	.type	.Lstring.2,@object              # @string.2
.Lstring.2:
	.asciz	"Hours Completed: %d\n"
	.size	.Lstring.2, 21

	.type	.Lstring.3,@object              # @string.3
.Lstring.3:
	.asciz	"Credits Remaining: %d\n"
	.size	.Lstring.3, 23

	.type	.Lstring.4,@object              # @string.4
.Lstring.4:
	.asciz	"\nPossible Courses to Take Next\n"
	.size	.Lstring.4, 32

	.type	.Lstring.5,@object              # @string.5
.Lstring.5:
	.asciz	"  None - Congratulations!\n"
	.size	.Lstring.5, 27

	.type	.Lstring.6,@object              # @string.6
.Lstring.6:
	.asciz	"  "
	.size	.Lstring.6, 3

	.type	.Lstring.7,@object              # @string.7
.Lstring.7:
	.asciz	"let's see\n"
	.size	.Lstring.7, 11

	.section	".note.GNU-stack","",@progbits
