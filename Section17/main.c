/**
 ******************************************************************************
 * @file           : main.c
 * @author         : Auto-generated by STM32CubeIDE
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */

#if !defined(__SOFT_FP__) && defined(__ARM_FP)
  #warning "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
#endif

#include<stdio.h>
#include<stdint.h>
#include "main.h"

uint8_t current_task = 1; //task1 is running
uint32_t g_tick_count = 0;

typedef struct
{
	uint32_t psp_value;
	uint32_t block_count;
	uint8_t current_state;
	void (*task_handler)(void);
}TCB_t;

TCB_t user_tasks[MAX_TASKS];

void task1_handler(void)
{
	while(1)
	{
		printf("This is task 1\n");
	}
}

void task2_handler(void)
{
	while(1)
	{
		printf("This is task 2\n");
	}
}

void task3_handler(void)
{
	while(1)
	{
		printf("This is task 3\n");
	}
}

void task4_handler(void)
{
	while(1)
	{
		printf("This is task 4\n");
	}
}

void init_systick_timer(uint32_t tick_hz)
{
	uint32_t *pRVR = (uint32_t*)0xE000E014; //In order to upload the value wanted in the SYST_RVR register
	uint32_t *pCSR = (uint32_t*)0xE000E010;
	uint32_t count_value = (SYSTICK_TIM_CLK / tick_hz) - 1;

	//Clear the value of SVR
	*pRVR &= ~(0x00FFFFFF);

	//Load the value in to SVR
	*pRVR |= count_value;

	//Some settings
	*pCSR |= (1 << 1); //Enables SysTick exception request
	*pCSR |= (1 << 2); //Indicates the clock source

	//Enables the counter
	*pCSR |= (1 << 0);
}

__attribute__((naked)) void PendSV_Handler()
{
	/* save the context of current task */

		 //1. Get current running task's PSP value
		__asm volatile("MRS R0, PSP");
	    //2. Using that PSP value store SF2 (R4 to R11)
		__asm volatile("STMDB R0!, {R4-R11}");
		__asm volatile("PUSH {LR}");
	    // 3. Save the current value of PSP
		__asm volatile("BL save_psp_value");

		/* Retrieve the context of next task */

		//1. Decide next task to run
		__asm volatile("BL update_next_task");
		//2. Get its past PSP value
		__asm volatile("BL get_psp_value");
		//3. Using that PSP value retrieves SF2 (R4 to R11)
		__asm volatile("LDMIA R0!, {R4-R11}");
		//4. Update PSP and exit
		__asm volatile("MSR PSP, R0");
		__asm volatile ("POP {LR}");
		__asm volatile("BX LR");
}

void update_global_tick_count(void)
{
	g_tick_count++;
}

void unblock_tasks(void)
{
	for (int i = 1; i < MAX_TASKS; ++i)
	{
		if(user_tasks[i].current_state != TASK_READY_STATE)
		{
			if(user_tasks[i].block_count == g_tick_count)
			{
				user_tasks[i].current_state = TASK_READY_STATE;
			}
		}
	}
}


 void SysTick_Handler(void)
{
	uint32_t *pICSR = (uint32_t*)0xE000ED04;
	update_global_tick_count();
	unblock_tasks();
	//Pend the pendsv exception
	*pICSR |= (1 << 28);

}

__attribute__((naked)) void init_scheduler_task(uint32_t sched_top_of_stack)
{
	__asm volatile ("MSR MSP, %0": : "r" (sched_top_of_stack) : );
	__asm volatile("BX LR");

}

void init_tasks_stack(void)
{
	for (int i = 0; i < 5; ++i)
	{
		user_tasks[i].current_state = TASK_READY_STATE;
	}

	user_tasks[0].psp_value = IDLE_STACK_START;
	user_tasks[1].psp_value = T1_STACK_START;
	user_tasks[2].psp_value = T2_STACK_START;
	user_tasks[3].psp_value = T3_STACK_START;
	user_tasks[4].psp_value = T4_STACK_START;

	user_tasks[0].task_handler = idle_task;
	user_tasks[1].task_handler = task1_handler;
	user_tasks[2].task_handler = task2_handler;
	user_tasks[3].task_handler = task3_handler;
	user_tasks[4].task_handler = task4_handler;

	uint32_t *pPSP;

	for(int i = 0; i < MAX_TASKS; ++i)
	{
		pPSP = (uint32_t*)user_tasks[i].psp_value;
		pPSP--;               //Task model is full descending, First decrement
	   *pPSP = DUMMY_XPSR;  //next, store the value xpsr value has to be 0x00100000

	   pPSP--;  //PC
	   *pPSP = (uint32_t)user_tasks[i].task_handler;

	   pPSP--; //LR
	   *pPSP = 0xFFFFFFFD;


	   for (int j = 0; j < 13; ++j)
	   {
		   pPSP--;
		   *pPSP = 0;
	   }
	   user_tasks[i].psp_value = (uint32_t)pPSP;
	}
}

void enable_processor_faults(void)
{
	 uint32_t *pSHCSR = (uint32_t*)0xE000ED24;
	*pSHCSR = (1 << 16); //Mem manage
	*pSHCSR = (1 << 17); //Bus Fault
	*pSHCSR = (1 << 18); //Usage Fault
}

void HardFault_Handler(void)
{
	printf("Exception: HardFault\n");
	while(1);
}
void MemManage_Handler(void)
{
	printf("Exception: MemMange\n");
	while(1);
}
void BusFault_Handler(void)
{
	printf("Exception: BusFault\n");
	while(1);
}

uint32_t get_psp_value(void)
{
	return user_tasks[current_task].psp_value;
}

void save_psp_value(uint32_t current_psp_value)
{
	user_tasks[current_task].psp_value = current_psp_value;
}

void update_next_task(void)
{
	int state = TASK_BLOCKED_STATE;

	for(int i = 0; i < MAX_TASKS; ++i)
	{
		//Round Robin fashion
		current_task++;
		current_task %=  MAX_TASKS;
		state = user_tasks[current_task].current_state;
		if((state == TASK_READY_STATE) && (current_task != 0))
			break;
	}
	if(state != TASK_READY_STATE)
		current_task = 0;

}

__attribute__((naked)) void  switch_sp_to_psp(void)
{
	//1. initialize the PSP with Task1 stack start (task1 because is the first task we will launch)
	//get the value of psp of current_task
	__asm volatile ("PUSH {LR}");              //preserve LR which connects back to main
	__asm volatile ("BL get_psp_value");
	__asm volatile ("MSR PSP, R0");			  //initialize psp
	__asm volatile ("POP {LR}");			 //pops back LR value

   //2. change SP to PSP using CONTROL register
   __asm volatile ("MOV R0, #0x02");
   __asm volatile ("MSR CONTROL, R0");
   __asm volatile ("BX LR");
}

void schedule(void)
{
	uint32_t *pICSR = (uint32_t*)0xE000ED04;
	//Pend the pendsv exception
	*pICSR |= (1 << 28);
}

void task_delay(uint32_t tick_count)
{
	if(current_task)  //if it is idle task the code will note execute (current_task == 0)
	{
		user_tasks[current_task].block_count = g_tick_count + tick_count;
		user_tasks[current_task].current_state = TASK_BLOCKED_STATE;
		schedule();
	}
}

void idle_task(void)
{

}

//semihosting init function
extern void initialise_monitor_handles(void);

int main(void)
{
	enable_processor_faults();
	initialise_monitor_handles();

	init_scheduler_task(SCHED_STACK_START);
	
	printf("Implementation of simple task scheduler\n");

	init_tasks_stack();

	init_systick_timer(TICK_HZ);

	switch_sp_to_psp();

	task1_handler();

	for(;;);
}