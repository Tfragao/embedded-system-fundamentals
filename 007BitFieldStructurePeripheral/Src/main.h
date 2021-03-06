/*
 * main.h
 *
 *  Created on: Oct 14, 2021
 *      Author: Tyson
 */

#ifndef MAIN_H_
#define MAIN_H_
#define WAIT 100000  //Value found via trial and error
void led_on(void);
void led_off(void);

#define CLK_CTRL_REG   0x40023830
#define PORTA_MODE_REG 0x40020000
#define PORTA_OUT_REG  0x40020014
#define LED_ON            1
#define LED_OFF           0

typedef struct
{
	uint32_t gpioa_en             : 1;
	uint32_t gpiob_en             : 1;
	uint32_t gpioc_en             : 1;
	uint32_t gpiod_en             : 1;
	uint32_t gpioe_en             : 1;
	uint32_t gpiof_en             : 1;
	uint32_t gpiog_en             : 1;
	uint32_t gpioh_en             : 1;
	uint32_t reserved1            : 4;
	uint32_t crc_en               : 1;
	uint32_t reserved2            : 5;
	uint32_t bkp_sram_en          : 1;
	uint32_t reserved3            : 2;
	uint32_t dma1_en              : 1;
	uint32_t dma2_en              : 1;
	uint32_t reserved4            : 6;
	uint32_t otghs_en             : 1;
	uint32_t otghs_ulpi_en        : 1;
	uint32_t reserved5            : 1;

}RCC_AHB1ENR_t;

typedef struct
{
	uint32_t pin_0     :2;
	uint32_t pin_1     :2;
	uint32_t pin_2     :2;
	uint32_t pin_3     :2;
	uint32_t pin_4     :2;
	uint32_t pin_5     :2;
	uint32_t pin_6     :2;
	uint32_t pin_7     :2;
	uint32_t pin_8     :2;
	uint32_t pin_9     :2;
	uint32_t pin_10    :2;
	uint32_t pin_11    :2;
	uint32_t pin_12    :2;
	uint32_t pin_13    :2;
	uint32_t pin_14    :2;
	uint32_t pin_15    :2;

}GPIOx_MODE_t;  //Generic structure name to be used with any GPIO A/B...Z

typedef struct
{
	uint32_t pin_0       :1;
	uint32_t pin_1       :1;
	uint32_t pin_2       :1;
	uint32_t pin_3       :1;
	uint32_t pin_4       :1;
	uint32_t pin_5       :1;
	uint32_t pin_6       :1;
	uint32_t pin_7       :1;
	uint32_t pin_8       :1;
	uint32_t pin_9       :1;
	uint32_t pin_10      :1;
	uint32_t pin_11      :1;
	uint32_t pin_12      :1;
	uint32_t pin_13      :1;
	uint32_t pin_14      :1;
	uint32_t pin_15      :1;
	uint32_t reserved    :16;

}GPIOx_ODR_t;



#endif /* MAIN_H_ */
