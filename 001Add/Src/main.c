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

/* global variables */
int g_data1 = -4000;
int g_data2 = 200;
int result = 0;

//uint8_t const data = 10; //In STM32 this variable is stored in Flash Memory (Read-only)
						 //It is write- protected, you can not use pointer to change its value
						//If you put inside main() you can change its value using pointer dereference
						//although the variable is constant.

int main(void)
{
	result = g_data1 + g_data2;
	printf("Result = %d\n", result);

	//Const qualifier
	uint8_t const data = 10; //You can change its value using *ptr, altohugh it is constant
	printf("Value = %u\n", data);

	uint8_t *ptr = (uint8_t*)&data;
	*ptr = 30;
	printf("Value = %u\n", data);

	//Modifiable pointer and constant data:
	uint8_t const *pData = (uint8_t*)0x40000000;
	printf("Address of pData is %p\n", pData);
	//*pData = 1; //ERROR Read-only location
	pData = (uint8_t*)0x50000000;
	printf("Address of pData is %p\n", pData);

	//Modifiable data constant pointer:
	    uint8_t  *const pData2 = (uint8_t*)0x40000000;
		printf("Address of pData2 is %p\n", pData2);
		*pData2 = 1;
		//pData2 = (uint8_t*)0x50000000; //ERROR assignment of read-only variable pData2
		printf("Address of pData2 is %p\n", pData2);

	//constant data and constant pointer:
	uint8_t const *const pData3 = (uint8_t*)0x40000000;
	printf("Address of pData3 is %p\n", pData2);
	//*pData3 = 1; //ERROR Read-only location
	//pData3 = (uint8_t*)0x50000000; //ERROR assignment of read-only variable pData2
	printf("Address of pData3 is %p\n", pData2);

	for(;;);
}

