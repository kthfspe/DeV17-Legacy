################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Assets/Montserrat_96_Bold.c \
../Assets/assets.c \
../Assets/kthfs.c \
../Assets/kthfs_logo.c \
../Assets/mTemp_icon.c 

OBJS += \
./Assets/Montserrat_96_Bold.o \
./Assets/assets.o \
./Assets/kthfs.o \
./Assets/kthfs_logo.o \
./Assets/mTemp_icon.o 

C_DEPS += \
./Assets/Montserrat_96_Bold.d \
./Assets/assets.d \
./Assets/kthfs.d \
./Assets/kthfs_logo.d \
./Assets/mTemp_icon.d 


# Each subdirectory must supply rules for building sources it contributes
Assets/%.o Assets/%.su Assets/%.cyclo: ../Assets/%.c Assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F769xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../Drivers/lv_drivers -I../Middlewares/Third_Party/lvgl -I../Drivers/OTM8009A -I../Drivers/ft6x06 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Assets

clean-Assets:
	-$(RM) ./Assets/Montserrat_96_Bold.cyclo ./Assets/Montserrat_96_Bold.d ./Assets/Montserrat_96_Bold.o ./Assets/Montserrat_96_Bold.su ./Assets/assets.cyclo ./Assets/assets.d ./Assets/assets.o ./Assets/assets.su ./Assets/kthfs.cyclo ./Assets/kthfs.d ./Assets/kthfs.o ./Assets/kthfs.su ./Assets/kthfs_logo.cyclo ./Assets/kthfs_logo.d ./Assets/kthfs_logo.o ./Assets/kthfs_logo.su ./Assets/mTemp_icon.cyclo ./Assets/mTemp_icon.d ./Assets/mTemp_icon.o ./Assets/mTemp_icon.su

.PHONY: clean-Assets

