	.file	"ptrace_regs.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"%d"
	.align 8
.LC1:
	.string	"Write called with %lld %lld %lld\n"
.LC2:
	.string	"Write returned with %ld\n"
.LC3:
	.string	"%ld\n"
	.align 8
.LC4:
	.string	"Write called! with %lld %lld %lld\n"
.LC5:
	.string	"Write returned! with %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.file 1 "ptrace_regs.c"
	.loc 1 11 12
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	.loc 1 11 12
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 17 7
	movl	$0, -280(%rbp)
	.loc 1 19 11
	call	fork@PLT
	movl	%eax, -276(%rbp)
	.loc 1 20 6
	cmpl	$0, -276(%rbp)
	jne	.L2
	.loc 1 21 5
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 1 23 5
	leaq	-284(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L3
.L2:
	.loc 1 26 7
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	wait@PLT
	.loc 1 27 12
	movl	-288(%rbp), %eax
	andl	$127, %eax
	.loc 1 27 10
	testl	%eax, %eax
	je	.L11
	.loc 1 29 18
	movl	-276(%rbp), %eax
	movl	$0, %ecx
	movl	$120, %edx
	movl	%eax, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	ptrace@PLT
	movq	%rax, -272(%rbp)
	.loc 1 30 10
	cmpq	$1, -272(%rbp)
	jne	.L5
	.loc 1 31 12
	cmpl	$0, -280(%rbp)
	jne	.L6
	.loc 1 32 21
	movl	$1, -280(%rbp)
	.loc 1 33 11
	leaq	-256(%rbp), %rdx
	movl	-276(%rbp), %eax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$12, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 1 34 11
	movq	-160(%rbp), %rcx
	movq	-152(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L7
.L6:
	.loc 1 38 17
	movl	-276(%rbp), %eax
	movl	$0, %ecx
	movl	$80, %edx
	movl	%eax, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	ptrace@PLT
	movq	%rax, -264(%rbp)
	.loc 1 39 11
	movq	-264(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 42 21
	movl	$0, -280(%rbp)
	jmp	.L7
.L5:
	.loc 1 46 9
	movq	-272(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 47 12
	cmpl	$0, -280(%rbp)
	jne	.L8
	.loc 1 48 21
	movl	$1, -280(%rbp)
	.loc 1 49 11
	leaq	-256(%rbp), %rdx
	movl	-276(%rbp), %eax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$12, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 1 50 11
	movq	-160(%rbp), %rcx
	movq	-152(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L7
.L8:
	.loc 1 54 17
	movl	-276(%rbp), %eax
	movl	$0, %ecx
	movl	$80, %edx
	movl	%eax, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	ptrace@PLT
	movq	%rax, -264(%rbp)
	.loc 1 55 11
	movq	-264(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 58 21
	movl	$0, -280(%rbp)
.L7:
	.loc 1 61 7
	movl	-276(%rbp), %eax
	movl	$0, %ecx
	movl	$0, %edx
	movl	%eax, %esi
	movl	$24, %edi
	movl	$0, %eax
	call	ptrace@PLT
	.loc 1 26 7
	jmp	.L2
.L11:
	.loc 1 28 9
	nop
.L3:
	.loc 1 64 10
	movl	$0, %eax
	.loc 1 65 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 8 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.file 9 "/usr/include/x86_64-linux-gnu/sys/user.h"
	.file 10 "/usr/include/signal.h"
	.file 11 "/usr/include/unistd.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 13 "/usr/include/x86_64-linux-gnu/sys/ptrace.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x69c
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF112
	.byte	0xc
	.long	.LASF113
	.long	.LASF114
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x39
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x6c
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x6c
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x9a
	.byte	0xd
	.long	0x65
	.uleb128 0x6
	.byte	0x8
	.long	0x9d
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x7
	.long	0x9d
	.uleb128 0x8
	.long	.LASF93
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x230
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x97
	.byte	0x8
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x97
	.byte	0x10
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x97
	.byte	0x18
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x97
	.byte	0x20
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x97
	.byte	0x28
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x97
	.byte	0x30
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x97
	.byte	0x38
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x97
	.byte	0x40
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x97
	.byte	0x48
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x97
	.byte	0x50
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x97
	.byte	0x58
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x249
	.byte	0x60
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x24f
	.byte	0x68
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x65
	.byte	0x70
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x65
	.byte	0x74
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x73
	.byte	0x78
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x255
	.byte	0x83
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x265
	.byte	0x88
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x7f
	.byte	0x90
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x270
	.byte	0x98
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x27b
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x24f
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x65
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x281
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF41
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xa9
	.uleb128 0xa
	.long	.LASF115
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF42
	.uleb128 0x6
	.byte	0x8
	.long	0x244
	.uleb128 0x6
	.byte	0x8
	.long	0xa9
	.uleb128 0xc
	.long	0x9d
	.long	0x265
	.uleb128 0xd
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x23c
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x6
	.byte	0x8
	.long	0x26b
	.uleb128 0xb
	.long	.LASF44
	.uleb128 0x6
	.byte	0x8
	.long	0x276
	.uleb128 0xc
	.long	0x9d
	.long	0x291
	.uleb128 0xd
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF45
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x29d
	.uleb128 0x6
	.byte	0x8
	.long	0x230
	.uleb128 0xe
	.long	.LASF46
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x29d
	.uleb128 0xe
	.long	.LASF47
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x29d
	.uleb128 0xe
	.long	.LASF48
	.byte	0x7
	.byte	0x1a
	.byte	0xc
	.long	0x65
	.uleb128 0xc
	.long	0x2dd
	.long	0x2d2
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.long	0x2c7
	.uleb128 0x6
	.byte	0x8
	.long	0xa4
	.uleb128 0x7
	.long	0x2d7
	.uleb128 0xe
	.long	.LASF49
	.byte	0x7
	.byte	0x1b
	.byte	0x1a
	.long	0x2d2
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF50
	.uleb128 0x2
	.long	.LASF51
	.byte	0x8
	.byte	0x61
	.byte	0x11
	.long	0x8b
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF52
	.uleb128 0x10
	.long	.LASF116
	.byte	0x7
	.byte	0x4
	.long	0x40
	.byte	0xd
	.byte	0x1d
	.byte	0x6
	.long	0x41a
	.uleb128 0x11
	.long	.LASF53
	.byte	0
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.uleb128 0x11
	.long	.LASF55
	.byte	0x2
	.uleb128 0x11
	.long	.LASF56
	.byte	0x3
	.uleb128 0x11
	.long	.LASF57
	.byte	0x4
	.uleb128 0x11
	.long	.LASF58
	.byte	0x5
	.uleb128 0x11
	.long	.LASF59
	.byte	0x6
	.uleb128 0x11
	.long	.LASF60
	.byte	0x7
	.uleb128 0x11
	.long	.LASF61
	.byte	0x8
	.uleb128 0x11
	.long	.LASF62
	.byte	0x9
	.uleb128 0x11
	.long	.LASF63
	.byte	0xc
	.uleb128 0x11
	.long	.LASF64
	.byte	0xd
	.uleb128 0x11
	.long	.LASF65
	.byte	0xe
	.uleb128 0x11
	.long	.LASF66
	.byte	0xf
	.uleb128 0x11
	.long	.LASF67
	.byte	0x10
	.uleb128 0x11
	.long	.LASF68
	.byte	0x11
	.uleb128 0x11
	.long	.LASF69
	.byte	0x12
	.uleb128 0x11
	.long	.LASF70
	.byte	0x13
	.uleb128 0x11
	.long	.LASF71
	.byte	0x18
	.uleb128 0x11
	.long	.LASF72
	.byte	0x19
	.uleb128 0x11
	.long	.LASF73
	.byte	0x1a
	.uleb128 0x11
	.long	.LASF74
	.byte	0x1e
	.uleb128 0x11
	.long	.LASF75
	.byte	0x1f
	.uleb128 0x11
	.long	.LASF76
	.byte	0x20
	.uleb128 0x11
	.long	.LASF77
	.byte	0x21
	.uleb128 0x12
	.long	.LASF78
	.value	0x4200
	.uleb128 0x12
	.long	.LASF79
	.value	0x4201
	.uleb128 0x12
	.long	.LASF80
	.value	0x4202
	.uleb128 0x12
	.long	.LASF81
	.value	0x4203
	.uleb128 0x12
	.long	.LASF82
	.value	0x4204
	.uleb128 0x12
	.long	.LASF83
	.value	0x4205
	.uleb128 0x12
	.long	.LASF84
	.value	0x4206
	.uleb128 0x12
	.long	.LASF85
	.value	0x4207
	.uleb128 0x12
	.long	.LASF86
	.value	0x4208
	.uleb128 0x12
	.long	.LASF87
	.value	0x4209
	.uleb128 0x12
	.long	.LASF88
	.value	0x420a
	.uleb128 0x12
	.long	.LASF89
	.value	0x420b
	.uleb128 0x12
	.long	.LASF90
	.value	0x420c
	.uleb128 0x12
	.long	.LASF91
	.value	0x420d
	.uleb128 0x12
	.long	.LASF92
	.value	0x420e
	.byte	0
	.uleb128 0x8
	.long	.LASF94
	.byte	0xd8
	.byte	0x9
	.byte	0x2a
	.byte	0x8
	.long	0x57f
	.uleb128 0x13
	.string	"r15"
	.byte	0x9
	.byte	0x2c
	.byte	0x28
	.long	0x301
	.byte	0
	.uleb128 0x13
	.string	"r14"
	.byte	0x9
	.byte	0x2d
	.byte	0x28
	.long	0x301
	.byte	0x8
	.uleb128 0x13
	.string	"r13"
	.byte	0x9
	.byte	0x2e
	.byte	0x28
	.long	0x301
	.byte	0x10
	.uleb128 0x13
	.string	"r12"
	.byte	0x9
	.byte	0x2f
	.byte	0x28
	.long	0x301
	.byte	0x18
	.uleb128 0x13
	.string	"rbp"
	.byte	0x9
	.byte	0x30
	.byte	0x28
	.long	0x301
	.byte	0x20
	.uleb128 0x13
	.string	"rbx"
	.byte	0x9
	.byte	0x31
	.byte	0x28
	.long	0x301
	.byte	0x28
	.uleb128 0x13
	.string	"r11"
	.byte	0x9
	.byte	0x32
	.byte	0x28
	.long	0x301
	.byte	0x30
	.uleb128 0x13
	.string	"r10"
	.byte	0x9
	.byte	0x33
	.byte	0x28
	.long	0x301
	.byte	0x38
	.uleb128 0x13
	.string	"r9"
	.byte	0x9
	.byte	0x34
	.byte	0x28
	.long	0x301
	.byte	0x40
	.uleb128 0x13
	.string	"r8"
	.byte	0x9
	.byte	0x35
	.byte	0x28
	.long	0x301
	.byte	0x48
	.uleb128 0x13
	.string	"rax"
	.byte	0x9
	.byte	0x36
	.byte	0x28
	.long	0x301
	.byte	0x50
	.uleb128 0x13
	.string	"rcx"
	.byte	0x9
	.byte	0x37
	.byte	0x28
	.long	0x301
	.byte	0x58
	.uleb128 0x13
	.string	"rdx"
	.byte	0x9
	.byte	0x38
	.byte	0x28
	.long	0x301
	.byte	0x60
	.uleb128 0x13
	.string	"rsi"
	.byte	0x9
	.byte	0x39
	.byte	0x28
	.long	0x301
	.byte	0x68
	.uleb128 0x13
	.string	"rdi"
	.byte	0x9
	.byte	0x3a
	.byte	0x28
	.long	0x301
	.byte	0x70
	.uleb128 0x9
	.long	.LASF95
	.byte	0x9
	.byte	0x3b
	.byte	0x28
	.long	0x301
	.byte	0x78
	.uleb128 0x13
	.string	"rip"
	.byte	0x9
	.byte	0x3c
	.byte	0x28
	.long	0x301
	.byte	0x80
	.uleb128 0x13
	.string	"cs"
	.byte	0x9
	.byte	0x3d
	.byte	0x28
	.long	0x301
	.byte	0x88
	.uleb128 0x9
	.long	.LASF96
	.byte	0x9
	.byte	0x3e
	.byte	0x28
	.long	0x301
	.byte	0x90
	.uleb128 0x13
	.string	"rsp"
	.byte	0x9
	.byte	0x3f
	.byte	0x28
	.long	0x301
	.byte	0x98
	.uleb128 0x13
	.string	"ss"
	.byte	0x9
	.byte	0x40
	.byte	0x28
	.long	0x301
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF97
	.byte	0x9
	.byte	0x41
	.byte	0x28
	.long	0x301
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF98
	.byte	0x9
	.byte	0x42
	.byte	0x28
	.long	0x301
	.byte	0xb0
	.uleb128 0x13
	.string	"ds"
	.byte	0x9
	.byte	0x43
	.byte	0x28
	.long	0x301
	.byte	0xb8
	.uleb128 0x13
	.string	"es"
	.byte	0x9
	.byte	0x44
	.byte	0x28
	.long	0x301
	.byte	0xc0
	.uleb128 0x13
	.string	"fs"
	.byte	0x9
	.byte	0x45
	.byte	0x28
	.long	0x301
	.byte	0xc8
	.uleb128 0x13
	.string	"gs"
	.byte	0x9
	.byte	0x46
	.byte	0x28
	.long	0x301
	.byte	0xd0
	.byte	0
	.uleb128 0xc
	.long	0x2dd
	.long	0x58f
	.uleb128 0xd
	.long	0x39
	.byte	0x40
	.byte	0
	.uleb128 0x7
	.long	0x57f
	.uleb128 0x14
	.long	.LASF99
	.byte	0xa
	.value	0x11e
	.byte	0x1a
	.long	0x58f
	.uleb128 0x14
	.long	.LASF100
	.byte	0xa
	.value	0x11f
	.byte	0x1a
	.long	0x58f
	.uleb128 0x14
	.long	.LASF101
	.byte	0xb
	.value	0x21f
	.byte	0xf
	.long	0x5bb
	.uleb128 0x6
	.byte	0x8
	.long	0x97
	.uleb128 0xe
	.long	.LASF102
	.byte	0xc
	.byte	0x24
	.byte	0xe
	.long	0x97
	.uleb128 0xe
	.long	.LASF103
	.byte	0xc
	.byte	0x32
	.byte	0xc
	.long	0x65
	.uleb128 0xe
	.long	.LASF104
	.byte	0xc
	.byte	0x37
	.byte	0xc
	.long	0x65
	.uleb128 0xe
	.long	.LASF105
	.byte	0xc
	.byte	0x3b
	.byte	0xc
	.long	0x65
	.uleb128 0x15
	.long	.LASF117
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.long	0x65
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x693
	.uleb128 0x16
	.long	.LASF106
	.byte	0x1
	.byte	0xc
	.byte	0x9
	.long	0x2f5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -292
	.uleb128 0x16
	.long	.LASF95
	.byte	0x1
	.byte	0xd
	.byte	0x8
	.long	0x6c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x17
	.string	"rax"
	.byte	0x1
	.byte	0xd
	.byte	0x12
	.long	0x6c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x16
	.long	.LASF107
	.byte	0x1
	.byte	0xe
	.byte	0x8
	.long	0x693
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.long	.LASF108
	.byte	0x1
	.byte	0xf
	.byte	0x7
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x16
	.long	.LASF109
	.byte	0x1
	.byte	0x10
	.byte	0x7
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -300
	.uleb128 0x16
	.long	.LASF110
	.byte	0x1
	.byte	0x11
	.byte	0x7
	.long	0x65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0x16
	.long	.LASF111
	.byte	0x1
	.byte	0x12
	.byte	0x1b
	.long	0x41a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.byte	0
	.uleb128 0x18
	.long	0x6c
	.uleb128 0xd
	.long	0x39
	.byte	0x2
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"__off_t"
.LASF92:
	.string	"PTRACE_GET_SYSCALL_INFO"
.LASF67:
	.string	"PTRACE_ATTACH"
.LASF13:
	.string	"_IO_read_ptr"
.LASF25:
	.string	"_chain"
.LASF7:
	.string	"size_t"
.LASF31:
	.string	"_shortbuf"
.LASF90:
	.string	"PTRACE_SECCOMP_GET_FILTER"
.LASF19:
	.string	"_IO_buf_base"
.LASF87:
	.string	"PTRACE_PEEKSIGINFO"
.LASF52:
	.string	"long long unsigned int"
.LASF53:
	.string	"PTRACE_TRACEME"
.LASF81:
	.string	"PTRACE_SETSIGINFO"
.LASF34:
	.string	"_codecvt"
.LASF62:
	.string	"PTRACE_SINGLESTEP"
.LASF63:
	.string	"PTRACE_GETREGS"
.LASF50:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF26:
	.string	"_fileno"
.LASF14:
	.string	"_IO_read_end"
.LASF100:
	.string	"sys_siglist"
.LASF6:
	.string	"long int"
.LASF79:
	.string	"PTRACE_GETEVENTMSG"
.LASF12:
	.string	"_flags"
.LASF35:
	.string	"_wide_data"
.LASF20:
	.string	"_IO_buf_end"
.LASF29:
	.string	"_cur_column"
.LASF43:
	.string	"_IO_codecvt"
.LASF66:
	.string	"PTRACE_SETFPREGS"
.LASF33:
	.string	"_offset"
.LASF98:
	.string	"gs_base"
.LASF71:
	.string	"PTRACE_SYSCALL"
.LASF86:
	.string	"PTRACE_LISTEN"
.LASF91:
	.string	"PTRACE_SECCOMP_GET_METADATA"
.LASF42:
	.string	"_IO_marker"
.LASF45:
	.string	"stdin"
.LASF1:
	.string	"unsigned int"
.LASF70:
	.string	"PTRACE_SETFPXREGS"
.LASF37:
	.string	"_freeres_buf"
.LASF110:
	.string	"insyscall"
.LASF0:
	.string	"long unsigned int"
.LASF80:
	.string	"PTRACE_GETSIGINFO"
.LASF17:
	.string	"_IO_write_ptr"
.LASF113:
	.string	"ptrace_regs.c"
.LASF48:
	.string	"sys_nerr"
.LASF3:
	.string	"short unsigned int"
.LASF21:
	.string	"_IO_save_base"
.LASF83:
	.string	"PTRACE_SETREGSET"
.LASF32:
	.string	"_lock"
.LASF74:
	.string	"PTRACE_ARCH_PRCTL"
.LASF27:
	.string	"_flags2"
.LASF76:
	.string	"PTRACE_SYSEMU_SINGLESTEP"
.LASF65:
	.string	"PTRACE_GETFPREGS"
.LASF46:
	.string	"stdout"
.LASF102:
	.string	"optarg"
.LASF72:
	.string	"PTRACE_GET_THREAD_AREA"
.LASF103:
	.string	"optind"
.LASF18:
	.string	"_IO_write_end"
.LASF96:
	.string	"eflags"
.LASF77:
	.string	"PTRACE_SINGLEBLOCK"
.LASF78:
	.string	"PTRACE_SETOPTIONS"
.LASF115:
	.string	"_IO_lock_t"
.LASF93:
	.string	"_IO_FILE"
.LASF101:
	.string	"__environ"
.LASF75:
	.string	"PTRACE_SYSEMU"
.LASF69:
	.string	"PTRACE_GETFPXREGS"
.LASF39:
	.string	"_mode"
.LASF84:
	.string	"PTRACE_SEIZE"
.LASF28:
	.string	"_old_offset"
.LASF49:
	.string	"sys_errlist"
.LASF24:
	.string	"_markers"
.LASF82:
	.string	"PTRACE_GETREGSET"
.LASF2:
	.string	"unsigned char"
.LASF106:
	.string	"child"
.LASF95:
	.string	"orig_rax"
.LASF10:
	.string	"__pid_t"
.LASF5:
	.string	"short int"
.LASF114:
	.string	"/home/janna/Jannas/OS/week7/2_get_regs"
.LASF56:
	.string	"PTRACE_PEEKUSER"
.LASF41:
	.string	"FILE"
.LASF59:
	.string	"PTRACE_POKEUSER"
.LASF109:
	.string	"input"
.LASF89:
	.string	"PTRACE_SETSIGMASK"
.LASF64:
	.string	"PTRACE_SETREGS"
.LASF105:
	.string	"optopt"
.LASF61:
	.string	"PTRACE_KILL"
.LASF97:
	.string	"fs_base"
.LASF111:
	.string	"regs"
.LASF55:
	.string	"PTRACE_PEEKDATA"
.LASF11:
	.string	"char"
.LASF58:
	.string	"PTRACE_POKEDATA"
.LASF107:
	.string	"params"
.LASF85:
	.string	"PTRACE_INTERRUPT"
.LASF112:
	.string	"GNU C17 9.3.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF104:
	.string	"opterr"
.LASF60:
	.string	"PTRACE_CONT"
.LASF9:
	.string	"__off64_t"
.LASF15:
	.string	"_IO_read_base"
.LASF23:
	.string	"_IO_save_end"
.LASF99:
	.string	"_sys_siglist"
.LASF54:
	.string	"PTRACE_PEEKTEXT"
.LASF38:
	.string	"__pad5"
.LASF57:
	.string	"PTRACE_POKETEXT"
.LASF40:
	.string	"_unused2"
.LASF47:
	.string	"stderr"
.LASF116:
	.string	"__ptrace_request"
.LASF108:
	.string	"status"
.LASF22:
	.string	"_IO_backup_base"
.LASF94:
	.string	"user_regs_struct"
.LASF30:
	.string	"_vtable_offset"
.LASF51:
	.string	"pid_t"
.LASF36:
	.string	"_freeres_list"
.LASF68:
	.string	"PTRACE_DETACH"
.LASF44:
	.string	"_IO_wide_data"
.LASF88:
	.string	"PTRACE_GETSIGMASK"
.LASF117:
	.string	"main"
.LASF16:
	.string	"_IO_write_base"
.LASF73:
	.string	"PTRACE_SET_THREAD_AREA"
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
