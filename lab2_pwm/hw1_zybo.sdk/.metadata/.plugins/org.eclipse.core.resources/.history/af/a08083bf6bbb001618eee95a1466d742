#include <stdio.h>
#include "platform.h"
#include "xil_io.h"
	int main()
	{
	unsigned int reg1, reg2,value=0;
	init_platform();
		while(1)
		{
		printf("Please enter a value for register 1: (0-255)\r\n");
		scanf("%u",&value);
		if(value < 256)
		{
			Xil_Out32(XPAR_TEST_CORE_0_S00_AXI_BASEADDR+0,value);
			reg1 = Xil_In32(XPAR_TEST_CORE_0_S00_AXI_BASEADDR+0);
			reg2 = Xil_In32(XPAR_TEST_CORE_0_S00_AXI_BASEADDR+4);
			printf("Reg1: %u Reg2: %u \r\n", reg1, reg2);
			value++;
		}
		else
		{
			printf("Please enter a value in the specified range\r\n");
		}
		}
	return 0; //Should never get here
	}
