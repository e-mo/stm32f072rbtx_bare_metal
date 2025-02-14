# stm32f072rbtx_bare_metal

This is a minimal build setup for programming the STM32F07RBTx family of microcontrollers without the use of STMCubeMX or the STMCubeIDE.

## Contents

- **Linker script (STM32F07RBTX_FLASH.ld) and startup program (startup_stm32f07rbtx.s)**  
  Both files are copied from STM32CubeIDE source and modified to remove any HAL specific functions.
- **Pre-configured Makefile**    
  Simply add your source files to the source folder designated in the Makefile (./src by default) and build away. 
- **All helpful vendor provided ST and Cortex-m0 header files**    
  Both ST and ARM provide open-source hardware definition headers to make our lives easier.
- **Empty main.c**  
  Ready for your code.

## Resources

#### Tutorials
This repo was constructed with the help of many online resources but I would like to give a special shoutout to [Vivonomicon](https://vivonomicon.com/) for the first six parts of their "STM32 Baremetal Examples" series. They are written from the perspective of a different STM32 MCU but you can use this repo to follow along.  
  
**If you don't know what to do next, I fully recommend using these tutorials to get yourself started as they will help you understand the code as well as lead you through installing any required tooling:**      
- [1: hello arm](https://vivonomicon.com/2018/04/02/bare-metal-stm32-programming-part-1-hello-arm/)
- [2: making it to main](https://vivonomicon.com/2018/04/20/bare-metal-stm32-programming-part-2-making-it-to-main/)
- [3: leds and buttons](https://vivonomicon.com/2018/04/22/bare-metal-stm32-programming-part-3-leds-and-buttons/)
- [3.5: supporting multiple chips](https://vivonomicon.com/2018/04/25/bare-metal-stm32-programming-part-3-5-supporting-multiple-chips/)
- [4: intro to hardware interrupts](https://vivonomicon.com/2018/04/28/bare-metal-stm32-programming-part-4-intro-to-hardware-interrupts/)
- [5: timer peripherals and the system clock](https://vivonomicon.com/2018/05/20/bare-metal-stm32-programming-part-5-timer-peripherals-and-the-system-clock)

**Notes on following tutorial:**  
part 1: `gdb-multiarch` may be used in lieu of `arm-none-eabi-gdb`.  

### Contact me

If you are struggling to get this running, please feel free to email me.  
emorse8686@gmail.com
