/*
 ============================================================================
 Name        : 007Structure.c
 Author      : Taison
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>



struct carModel
{
	uint32_t carNumber;
	uint32_t carPrice;
	uint16_t carMaxSpeed;
	float    carWeight;
	//struct carModel Audi;//A structure type CANNOT contain itself as a member //ERROR!!!!!!!!
	struct carModel *ptrAudi; //Structure types can contain pointers to their own type.
};

struct DataSet
{
	char  data1;
	int   data2;
	char  data3;
	short data4;
}__attribute__((packed));  //This is not good for performance

void displayDataElements(struct DataSet *pdata);//Just place here in order for the compiler to see the user defined
												//data strucure. Best way is to put all datastructure in a header file.
void displayDataElements2(struct DataSet pdata);

typedef struct
{
	uint32_t planeNumber;
	uint32_t planePrice;
	uint16_t planeSpeed;
	float planeWeight;
}PlaneModel_t; //_t just to distinguish a typedef and enum (with enum we use _e)

void displayDataElements(struct DataSet *pdata)
{
	printf("data1 = %x\n", pdata->data1);
	printf("data2 = %x\n", pdata->data2);
	printf("data3 = %x\n", pdata->data3);
	printf("data4 = %x\n", pdata->data4);
}

void displayDataElements2(struct DataSet pdata)
{
	printf("data1 = %x\n", pdata.data1);
	printf("data2 = %x\n", pdata.data2);
	printf("data3 = %x\n", pdata.data3);
	printf("data4 = %x\n", pdata.data4);
}

int main(void)
{

#if 0
	struct carModel BMW = {2021, 1500, 220, 1330};
	struct carModel Ford = {4031, 35000,160,1900.96};
	struct carModel Honda = {.carMaxSpeed = 90.90, .carPrice=2000};

	printf("Car details BMW :\nNumber = %d\nPrice= %d\nMaxSpeed = %d\nWeight=%f\n\n", BMW.carNumber, BMW.carPrice, BMW.carMaxSpeed, BMW.carWeight);
	printf("Car details Ford:\nNumber = %d\nPrice= %d\nMaxSpeed = %d\nWeight=%f\n\n", Ford.carNumber, Ford.carPrice, Ford.carMaxSpeed, Ford.carWeight);
	printf("Car details Honda:\nMaxspeed = %d\nPrice= %d\nWeight =%f\nNumber = %d\n", Honda.carMaxSpeed, Honda.carPrice, Honda.carWeight, Honda.carNumber);
	printf("Size of structure car model is %u\n", sizeof(struct carModel));


	struct DataSet data;
	data.data1 = 0x11;
	data.data2 = 0xFFFFEEEE;
	data.data3 = 0x22;
	data.data4 = 0xABCD;
	uint8_t *ptr;
	ptr = (uint8_t*)&data;

	uint32_t totalsize = sizeof(struct DataSet);

	printf("Memory address       content \n");
	printf("===============================\n");

	for(uint32_t count = 0; count < totalsize; ++count)
	{
		printf("%p               %x\n", ptr, *ptr);
		ptr++;
	}

	printf("Total memory consumed by this struct variable is %u\n", sizeof(struct DataSet));
#endif

	PlaneModel_t plane1 = {.planeSpeed = 920, .planeNumber = 12356, .planePrice = 1000000 };
	printf("Plane details AirBus :\nNumber = %d\nPrice= %d\nMaxSpeed = %d\n\n",plane1.planeNumber, plane1.planePrice, plane1.planeSpeed);

	//pData is a pointer variable of type strcut Dataset
	struct DataSet data = {0, 0, 0, 0};
	struct DataSet *pData = NULL;
	//pData now holds the address of structure variable data
	pData = &data;
	//Changing the value of data1 member element of the DataSet structure
	printf("Original value of data1 %x\n", pData->data1);
	pData->data1 = 0x55;  //Same as *(pData) = 0x55
	printf("New value of data1 %x\n", pData->data1);
	printf("Value of second element %d\n", pData->data2);

	//Passing data structure by reference
	displayDataElements(&data);
	printf("\n");
	displayDataElements(pData);

	//Passing data structure by value
	printf("\n");
	displayDataElements2(data);

	return EXIT_SUCCESS;
}
