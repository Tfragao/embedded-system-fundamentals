/*
 ============================================================================
 Name        : Union.c
 Author      : Taison
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef union
{
	uint16_t shortAddr;
	uint32_t longAddr;
}Address;

union Packet
{
	uint32_t packetValue ;
	struct
	{
		    uint32_t crc             : 2;
			uint32_t status          : 1;
			uint32_t payload         : 12;
			uint32_t bat             : 3;
			uint32_t sensor          : 3;
			uint32_t longAddr        : 8;
			uint32_t shortAddr       : 2;
			uint32_t addrMode        : 1;
	}packetFields;
};


int main(void)
{

#if 0
	Address addr;
	addr.shortAddr = 0xABCD;     //This initialization is overwritten in memory
	addr.longAddr  = 0xEEEECCCC; //By this one
	printf("Short addr = %x\n", addr.shortAddr);
	printf("Long addr = %x\n", addr.longAddr);
#endif

	union Packet packet;
	printf("Enter the 32 bit packet value: ");
	scanf("%X", &packet.packetValue);

	printf("crc                 :%x\n", packet.packetFields.crc);
	printf("status              :%x\n", packet.packetFields.status);
	printf("payload             :%x\n", packet.packetFields.payload);
	printf("bat                 :%x\n", packet.packetFields.bat);
	printf("sensor              :%x\n", packet.packetFields.sensor);
	printf("longAddr            :%x\n", packet.packetFields.longAddr);
	printf("shortAddr           :%x\n", packet.packetFields.shortAddr);
	printf("AddrMode            :%x\n", packet.packetFields.addrMode);

	printf("size of union is %u\n", sizeof(packet));


	return EXIT_SUCCESS;
}
