################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/CAN/can_can1.c \
../Core/CAN/can_hal_callbacks.c \
../Core/CAN/can_hal_can1.c 

OBJS += \
./Core/CAN/can_can1.o \
./Core/CAN/can_hal_callbacks.o \
./Core/CAN/can_hal_can1.o 

C_DEPS += \
./Core/CAN/can_can1.d \
./Core/CAN/can_hal_callbacks.d \
./Core/CAN/can_hal_can1.d 


# Each subdirectory must supply rules for building sources it contributes
Core/CAN/%.o Core/CAN/%.su Core/CAN/%.cyclo: ../Core/CAN/%.c Core/CAN/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0 -std=gnu11 -g3 -DSTM32F091xC -DUSE_HAL_DRIVER -DDEBUG -c -I"C:/Users/Simon Richter/Documents/GitHub/SA/CAN" -I../Drivers/STM32F0xx_HAL_Driver/Inc -I../Drivers/CMSIS/Include -I../Core/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F0xx/Include -I../Middlewares/ST/ARM/DSP/Inc -I"C:/Users/ionie/Documents/UniDocs/KTH/FS/Technical/CCU-SW/Core/CAN" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-CAN

clean-Core-2f-CAN:
	-$(RM) ./Core/CAN/can_can1.cyclo ./Core/CAN/can_can1.d ./Core/CAN/can_can1.o ./Core/CAN/can_can1.su ./Core/CAN/can_hal_callbacks.cyclo ./Core/CAN/can_hal_callbacks.d ./Core/CAN/can_hal_callbacks.o ./Core/CAN/can_hal_callbacks.su ./Core/CAN/can_hal_can1.cyclo ./Core/CAN/can_hal_can1.d ./Core/CAN/can_hal_can1.o ./Core/CAN/can_hal_can1.su

.PHONY: clean-Core-2f-CAN

