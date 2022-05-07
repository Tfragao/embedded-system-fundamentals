/*
 * main.h
 *
 *  Created on: Oct 24, 2021
 *      Author: Tyson
 */

#ifndef MAIN_H_
#define MAIN_H_

void task1_handler(void);
void task2_handler(void);
void task3_handler(void);
void task4_handler(void);
void init_systick_timer(uint32_t);
void SysTick_Handler(void);
__attribute__((naked)) void init_scheduler_task(uint32_t);
void init_tasks_stack(void);
void enable_processor_faults(void);
__attribute__((naked)) void  switch_sp_to_psp(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
uint32_t get_psp_value(void);
void save_psp_value(uint32_t);
void update_next_task(void);
void task_delay(uint32_t);
void idle_task(void);
__attribute__((naked)) void PendSV_Handler(void);
void update_global_tick_count(void);
void unblock_tasks(void);
void schedule(void);

//Stack memory calculations (1KB = 1024 bytes (binary))
#define SIZE_TASK_STACK     1024U

#define SIZE_SCHED_STACK    1024U

#define SRAM_START          0x20000000U

#define SIZE_SRAM           ((128) * (1024))

#define SRAM_END            ((SRAM_START) + (SIZE_SRAM))

#define T1_STACK_START      SRAM_END

#define T2_STACK_START      ((SRAM_END) - (1 * SIZE_TASK_STACK))

#define T3_STACK_START      ((SRAM_END) - (2 * SIZE_TASK_STACK))

#define T4_STACK_START      ((SRAM_END) - (3 * SIZE_TASK_STACK))

#define IDLE_STACK_START    ((SRAM_END) - (4 * SIZE_TASK_STACK))

#define SCHED_STACK_START   ((SRAM_END) - (5 * SIZE_TASK_STACK))

#define TICK_HZ             1000U

#define HSI_CLK  			16000000U

#define SYSTICK_TIM_CLK		HSI_CLK

#define MAX_TASKS              5  //4 user task + 1 idle task

#define DUMMY_XPSR			0x01000000U

#define TASK_READY_STATE  0x00

#define TASK_BLOCKED_STATE  0xFF




#endif /* MAIN_H_ */
