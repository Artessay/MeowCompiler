	.text
	.file	"quicksort"
	.globl	quickSort                       # -- Begin function quickSort
	.p2align	4, 0x90
	.type	quickSort,@function
quickSort:                              # @quickSort
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -16(%rbp)
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	addl	%esi, %edi
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%edi, %eax
	sarl	%eax
	movslq	%eax, %rcx
	movq	array@GOTPCREL(%rip), %rax
	movl	(%rax,%rcx,4), %ecx
	movl	%ecx, -12(%rbp)
	.p2align	4, 0x90
.LBB0_1:                                # %while.loop
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #     Child Loop BB0_9 Depth 2
	movl	-4(%rbp), %ecx
	cmpl	-8(%rbp), %ecx
	jg	.LBB0_2
	.p2align	4, 0x90
.LBB0_7:                                # %while.loop5
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %ecx
	cmpl	-12(%rbp), %ecx
	jge	.LBB0_9
# %bb.8:                                # %while.body6
                                        #   in Loop: Header=BB0_7 Depth=2
	incl	-4(%rbp)
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_10:                               # %while.body17
                                        #   in Loop: Header=BB0_9 Depth=2
	decl	-8(%rbp)
.LBB0_9:                                # %while.loop16
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-8(%rbp), %rcx
	movl	(%rax,%rcx,4), %ecx
	cmpl	-12(%rbp), %ecx
	jg	.LBB0_10
# %bb.11:                               # %while.after18
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %ecx
	cmpl	-8(%rbp), %ecx
	jg	.LBB0_1
# %bb.12:                               # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movslq	-4(%rbp), %rdx
	movl	(%rax,%rdx,4), %edx
	movl	%edx, -16(%rcx)
	movslq	-8(%rbp), %rdx
	movl	(%rax,%rdx,4), %esi
	movslq	-4(%rbp), %rdi
	movl	%esi, (%rax,%rdi,4)
	movl	-16(%rcx), %ecx
	movl	%ecx, (%rax,%rdx,4)
	leal	1(%rdi), %ecx
	movl	%ecx, -4(%rbp)
	leal	-1(%rdx), %ecx
	movl	%ecx, -8(%rbp)
	jmp	.LBB0_1
.LBB0_2:                                # %while.after
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB0_4
# %bb.3:                                # %if.then52
	movl	-20(%rbp), %edi
	movl	-8(%rbp), %esi
	callq	quickSort@PLT
.LBB0_4:                                # %if.merge54
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_6
# %bb.5:                                # %if.then60
	movl	-4(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	quickSort@PLT
.LBB0_6:                                # %if.merge62
	xorl	%eax, %eax
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	quickSort, .Lfunc_end0-quickSort
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
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	leaq	-24(%rbp), %rsi
	movl	$.Lstring, %edi
	xorl	%eax, %eax
	callq	scanf@PLT
	movl	$0, -20(%rbp)
	movq	array@GOTPCREL(%rip), %r14
	.p2align	4, 0x90
.LBB1_1:                                # %for.loop
                                        # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB1_3
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movslq	-20(%rbp), %rsi
	shlq	$2, %rsi
	addq	%r14, %rsi
	movl	$.Lstring.1, %edi
	xorl	%eax, %eax
	callq	scanf@PLT
	incl	-20(%rbp)
	jmp	.LBB1_1
.LBB1_3:                                # %for.after
	movl	-24(%rbp), %esi
	decl	%esi
	xorl	%edi, %edi
	callq	quickSort@PLT
	movq	%rsp, %rax
	leaq	-16(%rax), %rbx
	movq	%rbx, %rsp
	movl	$0, -16(%rax)
	.p2align	4, 0x90
.LBB1_4:                                # %for.loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rbx), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB1_6
# %bb.5:                                # %for.body12
                                        #   in Loop: Header=BB1_4 Depth=1
	movslq	(%rbx), %rax
	movl	(%r14,%rax,4), %esi
	movl	$.Lstring.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	incl	(%rbx)
	jmp	.LBB1_4
.LBB1_6:                                # %for.after13
	xorl	%eax, %eax
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	array,@object                   # @array
	.bss
	.globl	array
	.p2align	4
array:
	.zero	40000
	.size	array, 40000

	.type	.Lstring,@object                # @string
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstring:
	.asciz	"%d"
	.size	.Lstring, 3

	.type	.Lstring.1,@object              # @string.1
.Lstring.1:
	.asciz	"%d"
	.size	.Lstring.1, 3

	.type	.Lstring.2,@object              # @string.2
.Lstring.2:
	.asciz	"%d\n"
	.size	.Lstring.2, 4

	.section	".note.GNU-stack","",@progbits
