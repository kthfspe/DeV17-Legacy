# Dashboard Unit
## Installation

The project requires [arm-none-eabi-gcc](https://developer.arm.com/downloads/-/gnu-rm) v13+ to run.

1. Clone the git repository
```
git clone https://github.com/kthfspe/DBU-SW.git
```
2. Change to the correct branch
```
git checkout ros_development
```
3. Open the project in  the STM32Cube IDE
4. Perform code generation (this can be done by doing a insignificant change and saving the project)
5. Set the correct include path under Project → Properties → C/C++ Build → Settings → MCU GCC Compiler → Include Paths

| Include Path |
| ------ |
| ../Core/Inc |
|../Drivers/OTM8009A|
|../Drivers/ft6x06|
|../Drivers/lv_drivers|
|../Middlewares/Third_Party/lvgl|
|../Drivers/STM32F7xx_HAL_Driver/Inc|
|../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy|
|../Drivers/CMSIS/Device/ST/STM32F7xx/Include|
|../Drivers/CMSIS/Include|
|../Middlewares/Third_Party/FreeRTOS/Source/include|
|../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2|
|../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1|

6. Right click on the /Drivers/lv_drivers/indev/encoder.c and choose “Resource Configurations” → “Exclude from Build”
7. Right click on the Assets folder and in Properties uncheck the “Exclude resource from Build”
8. Build the project
