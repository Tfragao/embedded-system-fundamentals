	.cpu cortex-m4
	.arch armv7e-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.global	current_task
	.data
	.type	current_task, %object
	.size	current_task, 1
current_task:
	.byte	1
	.global	g_tick_count
	.bss
	.align	2
	.type	g_tick_count, %object
	.size	g_tick_count, 4
g_tick_count:
	.space	4
	.global	user_tasks
	.align	2
	.type	user_tasks, %object
	.size	user_tasks, 80
user_tasks:
	.space	80
	.section	.rodata
	.align	2
.LC0:
	.ascii	"This is task 1\000"
	.text
	.align	1
	.global	task1_handler
	.syntax unified
	.thumb
	.thumb_func
	.type	task1_handler, %function
task1_handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L2:
	ldr	r0, .L3
	bl	puts
	b	.L2
.L4:
	.align	2
.L3:
	.word	.LC0
	.size	task1_handler, .-task1_handler
	.section	.rodata
	.align	2
.LC1:
	.ascii	"This is task 2\000"
	.text
	.align	1
	.global	task2_handler
	.syntax unified
	.thumb
	.thumb_func
	.type	task2_handler, %function
task2_handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L6:
	ldr	r0, .L7
	bl	puts
	b	.L6
.L8:
	.align	2
.L7:
	.word	.LC1
	.size	task2_handler, .-task2_handler
	.section	.rodata
	.align	2
.LC2:
	.ascii	"This is task 3\000"
	.text
	.align	1
	.global	task3_handler
	.syntax unified
	.thumb
	.thumb_func
	.type	task3_handler, %function
task3_handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L10:
	ldr	r0, .L11
	bl	puts
	b	.L10
.L12:
	.align	2
.L11:
	.word	.LC2
	.size	task3_handler, .-task3_handler
	.section	.rodata
	.align	2
.LC3:
	.ascii	"This is task 4\000"
	.text
	.align	1
	.global	task4_handler
	.syntax unified
	.thumb
	.thumb_func
	.type	task4_handler, %function
task4_handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
.L14:
	ldr	r0, .L15
	bl	puts
	b	.L14
.L16:
	.align	2
.L15:
	.word	.LC3
	.size	task4_handler, .-task4_handler
	.align	1
	.global	init_systick_timer
	.syntax unified
	.thumb
	.thumb_func
	.type	init_systick_timer, %function
init_systick_timer:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L18
	str	r3, [r7, #20]
	ldr	r3, .L18+4
	str	r3, [r7, #16]
	ldr	r2, .L18+8
	ldr	r3, [r7, #4]
	udiv	r3, r2, r3
	subs	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #20]
	ldr	r3, [r3]
	and	r2, r3, #-16777216
	ldr	r3, [r7, #20]
	str	r2, [r3]
	ldr	r3, [r7, #20]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	orrs	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3]
	ldr	r3, [r7, #16]
	ldr	r3, [r3]
	orr	r2, r3, #2
	ldr	r3, [r7, #16]
	str	r2, [r3]
	ldr	r3, [r7, #16]
	ldr	r3, [r3]
	orr	r2, r3, #4
	ldr	r3, [r7, #16]
	str	r2, [r3]
	ldr	r3, [r7, #16]
	ldr	r3, [r3]
	orr	r2, r3, #1
	ldr	r3, [r7, #16]
	str	r2, [r3]
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L19:
	.align	2
.L18:
	.word	-536813548
	.word	-536813552
	.word	16000000
	.size	init_systick_timer, .-init_systick_timer
	.align	1
	.global	PendSV_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	PendSV_Handler, %function
PendSV_Handler:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.syntax unified
@ 98 "main.c" 1
	MRS R0, PSP
@ 0 "" 2
@ 100 "main.c" 1
	STMDB R0!, {R4-R11}
@ 0 "" 2
@ 101 "main.c" 1
	PUSH {LR}
@ 0 "" 2
@ 103 "main.c" 1
	BL save_psp_value
@ 0 "" 2
@ 108 "main.c" 1
	BL update_next_task
@ 0 "" 2
@ 110 "main.c" 1
	BL get_psp_value
@ 0 "" 2
@ 112 "main.c" 1
	LDMIA R0!, {R4-R11}
@ 0 "" 2
@ 114 "main.c" 1
	MSR PSP, R0
@ 0 "" 2
@ 115 "main.c" 1
	POP {LR}
@ 0 "" 2
@ 116 "main.c" 1
	BX LR
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	.size	PendSV_Handler, .-PendSV_Handler
	.align	1
	.global	update_global_tick_count
	.syntax unified
	.thumb
	.thumb_func
	.type	update_global_tick_count, %function
update_global_tick_count:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L22
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L22
	str	r3, [r2]
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L23:
	.align	2
.L22:
	.word	g_tick_count
	.size	update_global_tick_count, .-update_global_tick_count
	.align	1
	.global	unblock_tasks
	.syntax unified
	.thumb
	.thumb_func
	.type	unblock_tasks, %function
unblock_tasks:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #1
	str	r3, [r7, #4]
	b	.L25
.L27:
	ldr	r2, .L28
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L26
	ldr	r2, .L28
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, .L28+4
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L26
	ldr	r2, .L28
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #8
	movs	r2, #0
	strb	r2, [r3]
.L26:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L25:
	ldr	r3, [r7, #4]
	cmp	r3, #4
	ble	.L27
	nop
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L29:
	.align	2
.L28:
	.word	user_tasks
	.word	g_tick_count
	.size	unblock_tasks, .-unblock_tasks
	.align	1
	.global	SysTick_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	SysTick_Handler, %function
SysTick_Handler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L31
	str	r3, [r7, #4]
	bl	update_global_tick_count
	bl	unblock_tasks
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r3, #268435456
	ldr	r3, [r7, #4]
	str	r2, [r3]
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L32:
	.align	2
.L31:
	.word	-536810236
	.size	SysTick_Handler, .-SysTick_Handler
	.align	1
	.global	init_scheduler_task
	.syntax unified
	.thumb
	.thumb_func
	.type	init_scheduler_task, %function
init_scheduler_task:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	r3, r0
	.syntax unified
@ 151 "main.c" 1
	MSR MSP, r3
@ 0 "" 2
@ 152 "main.c" 1
	BX LR
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	.size	init_scheduler_task, .-init_scheduler_task
	.align	1
	.global	init_tasks_stack
	.syntax unified
	.thumb
	.thumb_func
	.type	init_tasks_stack, %function
init_tasks_stack:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L35
.L36:
	ldr	r2, .L41
	ldr	r3, [r7, #12]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #8
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L35:
	ldr	r3, [r7, #12]
	cmp	r3, #4
	ble	.L36
	ldr	r3, .L41
	ldr	r2, .L41+4
	str	r2, [r3]
	ldr	r3, .L41
	ldr	r2, .L41+8
	str	r2, [r3, #16]
	ldr	r3, .L41
	ldr	r2, .L41+12
	str	r2, [r3, #32]
	ldr	r3, .L41
	ldr	r2, .L41+16
	str	r2, [r3, #48]
	ldr	r3, .L41
	ldr	r2, .L41+20
	str	r2, [r3, #64]
	ldr	r3, .L41
	ldr	r2, .L41+24
	str	r2, [r3, #12]
	ldr	r3, .L41
	ldr	r2, .L41+28
	str	r2, [r3, #28]
	ldr	r3, .L41
	ldr	r2, .L41+32
	str	r2, [r3, #44]
	ldr	r3, .L41
	ldr	r2, .L41+36
	str	r2, [r3, #60]
	ldr	r3, .L41
	ldr	r2, .L41+40
	str	r2, [r3, #76]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L37
.L40:
	ldr	r2, .L41
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	ldr	r3, [r3]
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	subs	r3, r3, #4
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	mov	r2, #16777216
	str	r2, [r3]
	ldr	r3, [r7, #8]
	subs	r3, r3, #4
	str	r3, [r7, #8]
	ldr	r2, .L41
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #12
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #8]
	str	r2, [r3]
	ldr	r3, [r7, #8]
	subs	r3, r3, #4
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	mvn	r2, #2
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7]
	b	.L38
.L39:
	ldr	r3, [r7, #8]
	subs	r3, r3, #4
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	movs	r2, #0
	str	r2, [r3]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L38:
	ldr	r3, [r7]
	cmp	r3, #12
	ble	.L39
	ldr	r2, [r7, #8]
	ldr	r1, .L41
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r1
	str	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L37:
	ldr	r3, [r7, #4]
	cmp	r3, #4
	ble	.L40
	nop
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L42:
	.align	2
.L41:
	.word	user_tasks
	.word	536997888
	.word	537001984
	.word	537000960
	.word	536999936
	.word	536998912
	.word	idle_task
	.word	task1_handler
	.word	task2_handler
	.word	task3_handler
	.word	task4_handler
	.size	init_tasks_stack, .-init_tasks_stack
	.align	1
	.global	enable_processor_faults
	.syntax unified
	.thumb
	.thumb_func
	.type	enable_processor_faults, %function
enable_processor_faults:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r3, .L44
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r2, #65536
	str	r2, [r3]
	ldr	r3, [r7, #4]
	mov	r2, #131072
	str	r2, [r3]
	ldr	r3, [r7, #4]
	mov	r2, #262144
	str	r2, [r3]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L45:
	.align	2
.L44:
	.word	-536810204
	.size	enable_processor_faults, .-enable_processor_faults
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Exception: HardFault\000"
	.text
	.align	1
	.global	HardFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	HardFault_Handler, %function
HardFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r0, .L48
	bl	puts
.L47:
	b	.L47
.L49:
	.align	2
.L48:
	.word	.LC4
	.size	HardFault_Handler, .-HardFault_Handler
	.section	.rodata
	.align	2
.LC5:
	.ascii	"Exception: MemMange\000"
	.text
	.align	1
	.global	MemManage_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	MemManage_Handler, %function
MemManage_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r0, .L52
	bl	puts
.L51:
	b	.L51
.L53:
	.align	2
.L52:
	.word	.LC5
	.size	MemManage_Handler, .-MemManage_Handler
	.section	.rodata
	.align	2
.LC6:
	.ascii	"Exception: BusFault\000"
	.text
	.align	1
	.global	BusFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	BusFault_Handler, %function
BusFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r0, .L56
	bl	puts
.L55:
	b	.L55
.L57:
	.align	2
.L56:
	.word	.LC6
	.size	BusFault_Handler, .-BusFault_Handler
	.align	1
	.global	get_psp_value
	.syntax unified
	.thumb
	.thumb_func
	.type	get_psp_value, %function
get_psp_value:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L60
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r2, .L60+4
	lsls	r3, r3, #4
	add	r3, r3, r2
	ldr	r3, [r3]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L61:
	.align	2
.L60:
	.word	current_task
	.word	user_tasks
	.size	get_psp_value, .-get_psp_value
	.align	1
	.global	save_psp_value
	.syntax unified
	.thumb
	.thumb_func
	.type	save_psp_value, %function
save_psp_value:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L63
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r2, .L63+4
	lsls	r3, r3, #4
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	str	r2, [r3]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L64:
	.align	2
.L63:
	.word	current_task
	.word	user_tasks
	.size	save_psp_value, .-save_psp_value
	.align	1
	.global	update_next_task
	.syntax unified
	.thumb
	.thumb_func
	.type	update_next_task, %function
update_next_task:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #255
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
	b	.L66
.L69:
	ldr	r3, .L73
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L73
	strb	r2, [r3]
	ldr	r3, .L73
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L73+4
	umull	r1, r3, r3, r2
	lsrs	r1, r3, #2
	mov	r3, r1
	lsls	r3, r3, #2
	add	r3, r3, r1
	subs	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, .L73
	strb	r2, [r3]
	ldr	r3, .L73
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r2, .L73+8
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #8
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L67
	ldr	r3, .L73
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L71
.L67:
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L66:
	ldr	r3, [r7]
	cmp	r3, #4
	ble	.L69
	b	.L68
.L71:
	nop
.L68:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L72
	ldr	r3, .L73
	movs	r2, #0
	strb	r2, [r3]
.L72:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L74:
	.align	2
.L73:
	.word	current_task
	.word	-858993459
	.word	user_tasks
	.size	update_next_task, .-update_next_task
	.align	1
	.global	switch_sp_to_psp
	.syntax unified
	.thumb
	.thumb_func
	.type	switch_sp_to_psp, %function
switch_sp_to_psp:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.syntax unified
@ 255 "main.c" 1
	PUSH {LR}
@ 0 "" 2
@ 256 "main.c" 1
	BL get_psp_value
@ 0 "" 2
@ 257 "main.c" 1
	MSR PSP, R0
@ 0 "" 2
@ 258 "main.c" 1
	POP {LR}
@ 0 "" 2
@ 261 "main.c" 1
	MOV R0, #0x02
@ 0 "" 2
@ 262 "main.c" 1
	MSR CONTROL, R0
@ 0 "" 2
@ 263 "main.c" 1
	BX LR
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	.size	switch_sp_to_psp, .-switch_sp_to_psp
	.align	1
	.global	schedule
	.syntax unified
	.thumb
	.thumb_func
	.type	schedule, %function
schedule:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r3, .L77
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orr	r2, r3, #268435456
	ldr	r3, [r7, #4]
	str	r2, [r3]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L78:
	.align	2
.L77:
	.word	-536810236
	.size	schedule, .-schedule
	.align	1
	.global	task_delay
	.syntax unified
	.thumb
	.thumb_func
	.type	task_delay, %function
task_delay:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L82
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L81
	ldr	r3, .L82+4
	ldr	r2, [r3]
	ldr	r3, .L82
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	ldr	r3, [r7, #4]
	add	r2, r2, r3
	ldr	r1, .L82+8
	lsls	r3, r0, #4
	add	r3, r3, r1
	adds	r3, r3, #4
	str	r2, [r3]
	ldr	r3, .L82
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r2, .L82+8
	lsls	r3, r3, #4
	add	r3, r3, r2
	adds	r3, r3, #8
	movs	r2, #255
	strb	r2, [r3]
	bl	schedule
.L81:
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L83:
	.align	2
.L82:
	.word	current_task
	.word	g_tick_count
	.word	user_tasks
	.size	task_delay, .-task_delay
	.align	1
	.global	idle_task
	.syntax unified
	.thumb
	.thumb_func
	.type	idle_task, %function
idle_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	idle_task, .-idle_task
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	enable_processor_faults
	ldr	r0, .L87
	bl	init_scheduler_task
	bl	init_tasks_stack
	mov	r0, #1000
	bl	init_systick_timer
	bl	switch_sp_to_psp
	bl	task1_handler
.L86:
	b	.L86
.L88:
	.align	2
.L87:
	.word	536996864
	.size	main, .-main
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
