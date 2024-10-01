################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/Third_Party/lvgl/src/widgets/subdir.mk
-include Middlewares/Third_Party/lvgl/src/misc/subdir.mk
-include Middlewares/Third_Party/lvgl/src/hal/subdir.mk
-include Middlewares/Third_Party/lvgl/src/font/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/win/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/tileview/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/tabview/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/spinner/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/spinbox/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/span/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/msgbox/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/meter/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/menu/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/list/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/led/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/keyboard/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/imgbtn/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/colorwheel/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/chart/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/calendar/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/widgets/animimg/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/themes/mono/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/themes/default/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/themes/basic/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/others/snapshot/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/others/msg/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/others/monkey/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/others/imgfont/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/others/ime/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/others/gridnav/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/others/fragment/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/sjpg/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/rlottie/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/qrcode/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/png/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/gif/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/fsdrv/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/freetype/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/ffmpeg/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/libs/bmp/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/layouts/grid/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/layouts/flex/subdir.mk
-include Middlewares/Third_Party/lvgl/src/extra/subdir.mk
-include Middlewares/Third_Party/lvgl/src/draw/swm341_dma2d/subdir.mk
-include Middlewares/Third_Party/lvgl/src/draw/sw/subdir.mk
-include Middlewares/Third_Party/lvgl/src/draw/stm32_dma2d/subdir.mk
-include Middlewares/Third_Party/lvgl/src/draw/sdl/subdir.mk
-include Middlewares/Third_Party/lvgl/src/draw/nxp/vglite/subdir.mk
-include Middlewares/Third_Party/lvgl/src/draw/nxp/pxp/subdir.mk
-include Middlewares/Third_Party/lvgl/src/draw/arm2d/subdir.mk
-include Middlewares/Third_Party/lvgl/src/draw/subdir.mk
-include Middlewares/Third_Party/lvgl/src/core/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
-include Drivers/lv_drivers/indev/subdir.mk
-include Drivers/lv_drivers/subdir.mk
-include Drivers/ft6x06/subdir.mk
-include Drivers/STM32F7xx_HAL_Driver/Src/subdir.mk
-include Drivers/OTM8009A/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include Assets/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := DBU-SW
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
DBU-SW.elf \

MAP_FILES += \
DBU-SW.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
DBU-SW.list \


# All Target
all: main-build

# Main-build Target
main-build: DBU-SW.elf secondary-outputs

# Tool invocations
DBU-SW.elf DBU-SW.map: $(OBJS) $(USER_OBJS) C:\Users\Powertrain\Desktop\DBU-SW\STM32F769IITX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "DBU-SW.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m7 -T"C:\Users\Powertrain\Desktop\DBU-SW\STM32F769IITX_FLASH.ld" --specs=nosys.specs -Wl,-Map="DBU-SW.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

DBU-SW.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "DBU-SW.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) DBU-SW.elf DBU-SW.list DBU-SW.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
