/*
 ============================================================================
 Name        : Arrays.c
 Author      : Taison
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include<stdint.h>

int main(void)
{
	uint8_t someData[10] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};

	printf("Values stored in the array are: ");
	for(uint8_t count = 0; count < 10; ++count)
	{
		printf("%d ", someData[count]);
	}
	char *msg3   = "hello"; //(Stored in ROM)
	char msg4[]  = "hello"; //(Stored in RAM)
	msg4[0] = 'T';
	msg3[0] = 'T';
    printf("\n");
	return EXIT_SUCCESS;
}
