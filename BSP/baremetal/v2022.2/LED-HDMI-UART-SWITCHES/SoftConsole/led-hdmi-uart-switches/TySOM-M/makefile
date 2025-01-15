################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/platform/mpfs_hal/startup_gcc/subdir.mk
-include src/platform/mpfs_hal/common/nwc/subdir.mk
-include src/platform/mpfs_hal/common/subdir.mk
-include src/platform/hal/subdir.mk
-include src/platform/drivers/mss/mss_mmuart/subdir.mk
-include src/platform/drivers/mss/mss_i2c/subdir.mk
-include src/platform/drivers/mss/mss_gpio/subdir.mk
-include src/application/inc/hdmi/subdir.mk
-include src/application/hart4/subdir.mk
-include src/application/hart3/subdir.mk
-include src/application/hart2/subdir.mk
-include src/application/hart1/subdir.mk
-include src/application/hart0/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
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


BUILD_ARTIFACT_NAME := led-hdmi-uart-switches
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
led-hdmi-uart-switches.bin \

SECONDARY_LIST += \
led-hdmi-uart-switches.lst \

SECONDARY_SIZE += \
led-hdmi-uart-switches.siz \


# All Target
all:
	+@$(MAKE) --no-print-directory pre-build && $(MAKE) --no-print-directory main-build

# Main-build Target
main-build: led-hdmi-uart-switches.elf secondary-outputs

# Tool invocations
led-hdmi-uart-switches.elf: $(OBJS) $(USER_OBJS) makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU RISC-V Cross C Linker'
	riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64d -mcmodel=medany -msmall-data-limit=8 -mstrict-align -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -T "/home/makro/softconsole_2022/led-hdmi-uart-switches/src/platform/platform_config_reference/linker/mpfs-envm.ld" -nostartfiles -Xlinker --gc-sections -Wl,-Map,"led-hdmi-uart-switches.map" -Xlinker --print-map --specs=nano.specs --specs=nosys.specs -o "led-hdmi-uart-switches.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

led-hdmi-uart-switches.bin: led-hdmi-uart-switches.elf makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: GNU RISC-V Cross Create Flash Image'
	riscv64-unknown-elf-objcopy -O binary "led-hdmi-uart-switches.elf"  "led-hdmi-uart-switches.bin"
	@echo 'Finished building: $@'
	@echo ' '

led-hdmi-uart-switches.lst: led-hdmi-uart-switches.elf makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: GNU RISC-V Cross Create Listing'
	riscv64-unknown-elf-objdump --source --all-headers --demangle --debugging --file-headers --line-numbers --reloc --syms --wide "led-hdmi-uart-switches.elf" > "led-hdmi-uart-switches.lst"
	@echo 'Finished building: $@'
	@echo ' '

led-hdmi-uart-switches.siz: led-hdmi-uart-switches.elf makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: GNU RISC-V Cross Print Size'
	riscv64-unknown-elf-size --format=sysv "led-hdmi-uart-switches.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_LIST)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) led-hdmi-uart-switches.elf
	-@echo ' '

pre-build:
	-@echo 'Build TySOM-M fpga_config folder from MSS Configurator output. Python script takes xml and output folder location as paramaters.'
	-/home/makro/microchip/SoftConsole-v2022.2-RISC-V-747/python3/bin/python3 ../src/platform/soc_config_generator/mpfs_configuration_generator.py ../src/boards/TySOM-M/fpga_design/design_description  ../src/boards/TySOM-M
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_LIST) $(SECONDARY_SIZE)

.PHONY: all clean dependents main-build pre-build

-include ../makefile.targets
