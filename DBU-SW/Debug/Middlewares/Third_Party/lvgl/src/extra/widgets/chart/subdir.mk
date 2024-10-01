################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/lvgl/src/extra/widgets/chart/lv_chart.c 

OBJS += \
./Middlewares/Third_Party/lvgl/src/extra/widgets/chart/lv_chart.o 

C_DEPS += \
./Middlewares/Third_Party/lvgl/src/extra/widgets/chart/lv_chart.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/lvgl/src/extra/widgets/chart/%.o Middlewares/Third_Party/lvgl/src/extra/widgets/chart/%.su Middlewares/Third_Party/lvgl/src/extra/widgets/chart/%.cyclo: ../Middlewares/Third_Party/lvgl/src/extra/widgets/chart/%.c Middlewares/Third_Party/lvgl/src/extra/widgets/chart/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F769xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/lv_drivers -I../Middlewares/Third_Party/lvgl -I../Drivers/OTM8009A -I../Drivers/ft6x06 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-lvgl-2f-src-2f-extra-2f-widgets-2f-chart

clean-Middlewares-2f-Third_Party-2f-lvgl-2f-src-2f-extra-2f-widgets-2f-chart:
	-$(RM) ./Middlewares/Third_Party/lvgl/src/extra/widgets/chart/lv_chart.cyclo ./Middlewares/Third_Party/lvgl/src/extra/widgets/chart/lv_chart.d ./Middlewares/Third_Party/lvgl/src/extra/widgets/chart/lv_chart.o ./Middlewares/Third_Party/lvgl/src/extra/widgets/chart/lv_chart.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-lvgl-2f-src-2f-extra-2f-widgets-2f-chart

