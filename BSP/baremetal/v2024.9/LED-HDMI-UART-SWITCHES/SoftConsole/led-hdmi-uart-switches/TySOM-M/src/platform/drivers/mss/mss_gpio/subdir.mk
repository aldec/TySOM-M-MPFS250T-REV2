################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/platform/drivers/mss/mss_gpio/mss_gpio.c 

OBJS += \
./src/platform/drivers/mss/mss_gpio/mss_gpio.o 

C_DEPS += \
./src/platform/drivers/mss/mss_gpio/mss_gpio.d 


# Each subdirectory must supply rules for building sources it contributes
src/platform/drivers/mss/mss_gpio/%.o: ../src/platform/drivers/mss/mss_gpio/%.c src/platform/drivers/mss/mss_gpio/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv64-unknown-elf-gcc -march=rv64gc -mabi=lp64d -mcmodel=medany -msmall-data-limit=8 -mstrict-align -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wpadded -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g3 -DNDEBUG=1 -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/boards/TySOM-M" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/boards/TySOM-M/platform_config" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/application" -I"/home/makro/softconsole_2022/led-hdmi-uart-switches/src/platform" -std=gnu11 -Wstrict-prototypes -Wbad-function-cast -Wa,-adhlns="$@.lst" -v --specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


