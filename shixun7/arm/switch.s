	.arch armv8-a
	.file	"switch.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	sub	sp, sp, #16
	mov	w0, 50
	str	w0, [sp, 12]
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 12]
	mul	w0, w1, w0
	cmp	w0, 50
	beq	.L3
	cmp	w0, 50
	bgt	.L4
	cmp	w0, 10
	beq	.L5
	cmp	w0, 20
	beq	.L6
	b	.L2
.L4:
	cmp	w0, 70
	beq	.L7
	cmp	w0, 80
	beq	.L8
	b	.L2
.L5:
	mov	w0, 10
	str	w0, [sp, 12]
	b	.L9
.L8:
	mov	w0, 80
	str	w0, [sp, 12]
	b	.L9
.L3:
	mov	w0, 50
	str	w0, [sp, 12]
	b	.L9
.L7:
	mov	w0, 70
	str	w0, [sp, 12]
	b	.L9
.L6:
	mov	w0, 20
	str	w0, [sp, 12]
	b	.L9
.L2:
	mov	w0, 40
	str	w0, [sp, 12]
.L9:
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 12]
	mul	w0, w1, w0
	sub	w0, w0, #1
	cmp	w0, 9
	bhi	.L10
	adrp	x1, .L12
	add	x1, x1, :lo12:.L12
	ldr	w0, [x1,w0,uxtw #2]
	adr	x1, .Lrtx12
	add	x0, x1, w0, sxtw #2
	br	x0
.Lrtx12:
	.section	.rodata
	.align	0
	.align	2
.L12:
	.word	(.L11 - .Lrtx12) / 4
	.word	(.L13 - .Lrtx12) / 4
	.word	(.L10 - .Lrtx12) / 4
	.word	(.L10 - .Lrtx12) / 4
	.word	(.L14 - .Lrtx12) / 4
	.word	(.L15 - .Lrtx12) / 4
	.word	(.L16 - .Lrtx12) / 4
	.word	(.L10 - .Lrtx12) / 4
	.word	(.L17 - .Lrtx12) / 4
	.word	(.L18 - .Lrtx12) / 4
	.text
.L16:
	mov	w0, 7
	str	w0, [sp, 12]
	b	.L19
.L11:
	mov	w0, 1
	str	w0, [sp, 12]
	b	.L19
.L15:
	mov	w0, 6
	str	w0, [sp, 12]
	b	.L19
.L17:
	mov	w0, 9
	str	w0, [sp, 12]
	b	.L19
.L14:
	mov	w0, 5
	str	w0, [sp, 12]
	b	.L19
.L18:
	mov	w0, 10
	str	w0, [sp, 12]
	b	.L19
.L13:
	mov	w0, 2
	str	w0, [sp, 12]
	b	.L19
.L10:
	mov	w0, 40
	str	w0, [sp, 12]
.L19:
	mov	w0, 0
	add	sp, sp, 16
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits