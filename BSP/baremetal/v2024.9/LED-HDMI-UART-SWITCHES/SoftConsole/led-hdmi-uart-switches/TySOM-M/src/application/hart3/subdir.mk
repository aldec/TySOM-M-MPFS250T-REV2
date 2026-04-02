################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/application/hart3/u54_3.c 

OBJS += \
./src/application/hart3/u54_3.o 

C_DEPS += \
./src/application/hart3/u54_3.d 


# Each subdirectory must supply rules for building sources it contributes
src/application/hart3/%.o: ../src/application/hart3/%.c src/application/hart3/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64d -mcmodel=medany -msmall-data-limit=8 -mstrict-align -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -DNDEBUG=1 -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/boards/TySOM-M" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/boards/TySOM-M/platform_config" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/application" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/platform" -std=gnu11 -Wstrict-prototypes -Wbad-function-cast -Wa,-adhlns="$@.lst" -v --specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


