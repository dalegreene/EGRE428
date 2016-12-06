#include <stdio.h>
#include "xil_io.h"
#include "xparameters.h"
#include "platform.h"
#include "xgpio.h"
int main()
{
       int sw_state = 0;
       char name[20];
      XGpio gpio; // Create a GPIO instance

    //XGpio GpioOutput;
      XGpio GpioInput;

      //Initialize each of the AXI GPIOs as input and output
      XGpio_Initialize(&gpio,XPAR_AXI_GPIO_1_DEVICE_ID); // initialize the GPIO instance

      XGpio_Initialize(&GpioInput,XPAR_AXI_GPIO_0_DEVICE_ID); // initialize the GPIO instance

      //Set mode of GPIO to input
      XGpio_SetDataDirection(&GpioInput, 1, 0xFF);



      Xil_Out32(XPAR_AXI_GPIO_1_BASEADDR+XGPIO_TRI_OFFSET,0);// Set channel 1 as output

     init_platform();

     print("Hello World\n\r");

     printf("Enter name: ");
     scanf("%s", name);
     printf("Name is %s\n", name);
    while(1){

		XGpio_DiscreteWrite(&gpio,1, sw_state);

		sw_state = XGpio_DiscreteRead(&GpioInput, 1);

		printf("Switch state = %d\r\n", sw_state);


    }

    return 0;
}
