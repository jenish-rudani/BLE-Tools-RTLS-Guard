################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../utils/boot.c \
../utils/cli.c \
../utils/dbg_utils.c \
../utils/tag_sw_timer.c 

OBJS += \
./utils/boot.o \
./utils/cli.o \
./utils/dbg_utils.o \
./utils/tag_sw_timer.o 

C_DEPS += \
./utils/boot.d \
./utils/cli.d \
./utils/dbg_utils.d \
./utils/tag_sw_timer.d 


# Each subdirectory must supply rules for building sources it contributes
utils/boot.o: ../utils/boot.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"utils/boot.d" -MT"utils/boot.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

utils/cli.o: ../utils/cli.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"utils/cli.d" -MT"utils/cli.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

utils/dbg_utils.o: ../utils/dbg_utils.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"utils/dbg_utils.d" -MT"utils/dbg_utils.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

utils/tag_sw_timer.o: ../utils/tag_sw_timer.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"utils/tag_sw_timer.d" -MT"utils/tag_sw_timer.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


