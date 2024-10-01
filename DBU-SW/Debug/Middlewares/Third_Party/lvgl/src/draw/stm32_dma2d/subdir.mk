################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.c 

OBJS += \
./Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.o 

C_DEPS += \
./Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/%.o Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/%.su Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/%.cyclo: ../Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/%.c Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F769xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/lv_drivers -I../Middlewares/Third_Party/lvgl -I../Drivers/OTM8009A -I../Drivers/ft6x06 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lvgl-2f-src-2f-draw-2f-stm32_dma2d

clean-Middlewares-2f-Third_Party-2f-lvgl-2f-src-2f-draw-2f-stm32_dma2d:
	-$(RM) ./Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.cyclo ./Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.d ./Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.o ./Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lvgl-2f-src-2f-draw-2f-stm32_dma2d

