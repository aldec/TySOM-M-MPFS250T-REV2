################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/platform/hal/hal_irq.c 

S_UPPER_SRCS += \
../src/platform/hal/hw_reg_access.S 

OBJS += \
./src/platform/hal/hal_irq.o \
./src/platform/hal/hw_reg_access.o 

S_UPPER_DEPS += \
./src/platform/hal/hw_reg_access.d 

C_DEPS += \
./src/platform/hal/hal_irq.d 


# Each subdirectory must supply rules for building sources it contributes
src/platform/hal/%.o: ../src/platform/hal/%.c src/platform/hal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64d -mcmodel=medany -msmall-data-limit=8 -mstrict-align -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -DNDEBUG=1 -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/boards/TySOM-M" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/boards/TySOM-M/platform_config" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/application" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/platform" -std=gnu11 -Wstrict-prototypes -Wbad-function-cast -Wa,-adhlns="$@.lst" -v --specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/platform/hal/%.o: ../src/platform/hal/%.S src/platform/hal/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross Assembler'
	riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64d -mcmodel=medany -msmall-data-limit=8 -mstrict-align -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -x assembler-with-cpp -DNDEBUG=1 -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/platform/mpfs_hal/common" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/platform" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/application" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/boards/TySOM-M" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/boards/TySOM-M/platform_config" -Wa,-adhlns="$@.lst" -v --specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


