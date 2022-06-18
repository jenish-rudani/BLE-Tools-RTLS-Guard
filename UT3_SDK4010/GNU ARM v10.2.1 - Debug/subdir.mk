################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../battery_machine.c \
../ble_api.c \
../ble_manager_machine.c \
../lf_decoder.c \
../lf_machine.c \
../main.c \
../tag_beacon_machine.c \
../tag_command.c \
../tag_configuration.c \
../tag_defines.c \
../tag_main_machine.c \
../tag_power_manager.c \
../tag_status_fw_machine.c \
../tag_uptime_machine.c \
../temperature_machine.c \
../template.c \
../version.c 

OBJS += \
./battery_machine.o \
./ble_api.o \
./ble_manager_machine.o \
./lf_decoder.o \
./lf_machine.o \
./main.o \
./tag_beacon_machine.o \
./tag_command.o \
./tag_configuration.o \
./tag_defines.o \
./tag_main_machine.o \
./tag_power_manager.o \
./tag_status_fw_machine.o \
./tag_uptime_machine.o \
./temperature_machine.o \
./template.o \
./version.o 

C_DEPS += \
./battery_machine.d \
./ble_api.d \
./ble_manager_machine.d \
./lf_decoder.d \
./lf_machine.d \
./main.d \
./tag_beacon_machine.d \
./tag_command.d \
./tag_configuration.d \
./tag_defines.d \
./tag_main_machine.d \
./tag_power_manager.d \
./tag_status_fw_machine.d \
./tag_uptime_machine.d \
./temperature_machine.d \
./template.d \
./version.d 


# Each subdirectory must supply rules for building sources it contributes
battery_machine.o: ../battery_machine.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"battery_machine.d" -MT"battery_machine.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

ble_api.o: ../ble_api.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"ble_api.d" -MT"ble_api.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

ble_manager_machine.o: ../ble_manager_machine.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"ble_manager_machine.d" -MT"ble_manager_machine.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lf_decoder.o: ../lf_decoder.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"lf_decoder.d" -MT"lf_decoder.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lf_machine.o: ../lf_machine.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"lf_machine.d" -MT"lf_machine.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.o: ../main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"main.d" -MT"main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tag_beacon_machine.o: ../tag_beacon_machine.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"tag_beacon_machine.d" -MT"tag_beacon_machine.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tag_command.o: ../tag_command.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"tag_command.d" -MT"tag_command.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tag_configuration.o: ../tag_configuration.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"tag_configuration.d" -MT"tag_configuration.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tag_defines.o: ../tag_defines.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"tag_defines.d" -MT"tag_defines.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tag_main_machine.o: ../tag_main_machine.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"tag_main_machine.d" -MT"tag_main_machine.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tag_power_manager.o: ../tag_power_manager.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"tag_power_manager.d" -MT"tag_power_manager.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tag_status_fw_machine.o: ../tag_status_fw_machine.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"tag_status_fw_machine.d" -MT"tag_status_fw_machine.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tag_uptime_machine.o: ../tag_uptime_machine.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"tag_uptime_machine.d" -MT"tag_uptime_machine.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

temperature_machine.o: ../temperature_machine.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"temperature_machine.d" -MT"temperature_machine.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

template.o: ../template.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"template.d" -MT"template.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

version.o: ../version.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"version.d" -MT"version.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


