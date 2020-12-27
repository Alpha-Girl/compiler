	.file	"class.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text._ZN1AC2Ei,"axG",@progbits,_ZN1AC5Ei,comdat
	.align 2
	.weak	_ZN1AC2Ei
	.type	_ZN1AC2Ei, @function
_ZN1AC2Ei:
.LFB1494:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1494:
	.size	_ZN1AC2Ei, .-_ZN1AC2Ei
	.weak	_ZN1AC1Ei
	.set	_ZN1AC1Ei,_ZN1AC2Ei
	.section	.text._ZN1A5getMaEv,"axG",@progbits,_ZN1A5getMaEv,comdat
	.align 2
	.weak	_ZN1A5getMaEv
	.type	_ZN1A5getMaEv, @function
_ZN1A5getMaEv:
.LFB1496:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1496:
	.size	_ZN1A5getMaEv, .-_ZN1A5getMaEv
	.section	.text._ZN1BC2Eii,"axG",@progbits,_ZN1BC5Eii,comdat
	.align 2
	.weak	_ZN1BC2Eii
	.type	_ZN1BC2Eii, @function
_ZN1BC2Eii:
.LFB1498:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZN1AC2Ei
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, 4(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1498:
	.size	_ZN1BC2Eii, .-_ZN1BC2Eii
	.weak	_ZN1BC1Eii
	.set	_ZN1BC1Eii,_ZN1BC2Eii
	.section	.text._ZN1CC2Eii,"axG",@progbits,_ZN1CC5Eii,comdat
	.align 2
	.weak	_ZN1CC2Eii
	.type	_ZN1CC2Eii, @function
_ZN1CC2Eii:
.LFB1501:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZN1AC2Ei
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, 4(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1501:
	.size	_ZN1CC2Eii, .-_ZN1CC2Eii
	.weak	_ZN1CC1Eii
	.set	_ZN1CC1Eii,_ZN1CC2Eii
	.section	.text._ZN1DC2Eiiii,"axG",@progbits,_ZN1DC5Eiiii,comdat
	.align 2
	.weak	_ZN1DC2Eiiii
	.type	_ZN1DC2Eiiii, @function
_ZN1DC2Eiiii:
.LFB1504:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movl	%r8d, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	_ZN1BC2Eii
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rcx
	movl	-20(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	_ZN1CC2Eii
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, 16(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1504:
	.size	_ZN1DC2Eiiii, .-_ZN1DC2Eiiii
	.weak	_ZN1DC1Eiiii
	.set	_ZN1DC1Eiiii,_ZN1DC2Eiiii
	.section	.text._ZN1D4funcEv,"axG",@progbits,_ZN1D4funcEv,comdat
	.align 2
	.weak	_ZN1D4funcEv
	.type	_ZN1D4funcEv, @function
_ZN1D4funcEv:
.LFB1506:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN1A5getMaEv
	movl	%eax, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1506:
	.size	_ZN1D4funcEv, .-_ZN1D4funcEv
	.text
	.globl	main
	.type	main, @function
main:
.LFB1507:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-32(%rbp), %rax
	movl	$4, %r8d
	movl	$3, %ecx
	movl	$2, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZN1DC1Eiiii
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN1D4funcEv
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1507:
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1988:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L13
	cmpl	$65535, -8(%rbp)
	jne	.L13
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	__cxa_atexit@PLT
.L13:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1988:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB1989:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1989:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
