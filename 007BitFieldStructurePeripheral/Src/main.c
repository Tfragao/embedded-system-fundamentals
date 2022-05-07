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

#include<stdint.h>
#include<stdio.h>

#include "main.h"

void led_on(void)
{
	GPIOx_ODR_t volatile *const pPortAoutReg = (GPIOx_ODR_t*)PORTA_OUT_REG;
	pPortAoutReg->pin_5 = LED_ON;

}

void led_off(void)
{
	GPIOx_ODR_t volatile *const pPortAoutReg = (GPIOx_ODR_t*)PORTA_OUT_REG;
	pPortAoutReg->pin_5 = LED_OFF;
}

int main(void)
{
	//1. Enable clock

	RCC_AHB1ENR_t volatile *const pclkCtrlReg = (RCC_AHB1ENR_t*)CLK_CTRL_REG;
	pclkCtrlReg->gpioa_en = 1;

	//2. Configure the mode of the IO pin as output

	GPIOx_MODE_t  volatile *const pPortAmodeReg = (GPIOx_MODE_t*)PORTA_MODE_REG;
	pPortAmodeReg->pin_5 = 1;

	for(;;)
	{
		led_on();
		for(uint32_t count = 0; count < WAIT; ++count );  //SW delay
		led_off();
		for(uint32_t count = 0; count < WAIT; ++count );  //SW delay
	}


}
