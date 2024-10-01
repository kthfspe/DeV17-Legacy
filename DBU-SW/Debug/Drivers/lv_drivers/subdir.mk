################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lv_drivers/display.c 

OBJS += \
./Drivers/lv_drivers/display.o 

C_DEPS += \
./Drivers/lv_drivers/display.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lv_drivers/%.o Drivers/lv_drivers/%.su Drivers/lv_drivers/%.cyclo: ../Drivers/lv_drivers/%.c Drivers/lv_drivers/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F769xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/lv_drivers -I../Middlewares/Third_Party/lvgl -I../Drivers/OTM8009A -I../Drivers/ft6x06 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lv_drivers

clean-Drivers-2f-lv_drivers:
	-$(RM) ./Drivers/lv_drivers/display.cyclo ./Drivers/lv_drivers/display.d ./Drivers/lv_drivers/display.o ./Drivers/lv_drivers/display.su

.PHONY: clean-Drivers-2f-lv_drivers

