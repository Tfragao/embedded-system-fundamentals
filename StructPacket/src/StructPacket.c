/*
 ============================================================================
 Name        : StructPacket.c
 Author      : Taison
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

 typedef struct
{
	/*This variables will be referring to different bit fields of single uint32_t memory(4 bytes only) */
	uint32_t crc             : 2;
	uint32_t status          : 1;
	uint32_t payload         : 12;
	uint32_t bat             : 3;
	uint32_t sensor          : 3;
	uint32_t longAddr        : 8;
	uint32_t shortAddr       : 2;
	uint32_t addrMode        : 1;
}Packet_t;

int main(void)
{
	uint32_t packetValue = 0;
	printf("Enter the 32 bit packet value: ");
	scanf("%u", &packetValue);
	Packet_t packet;

	packet.crc  = (uint8_t)packetValue & 0x3;



	printf("crc                 :%x  %u\n", packet.crc);
	printf("status              :%x  %u\n", packet.status);
	printf("payload             :%x  %u\n", packet.payload);
	printf("bat                 :%x  %u\n", packet.bat);
	printf("sensor              :%x  %u\n", packet.sensor);
	printf("longAddr            :%x  %u\n", packet.longAddr);
	printf("shortAddr           :%x  %u\n", packet.shortAddr);
	printf("AddrMode            :%x  %u\n", packet.addrMode);

	return EXIT_SUCCESS;
}
