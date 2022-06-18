################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/adc.c \
../drivers/as393x.c \
../drivers/iadc.c \
../drivers/nvm.c \
../drivers/rtcc.c \
../drivers/wdog.c 

OBJS += \
./drivers/adc.o \
./drivers/as393x.o \
./drivers/iadc.o \
./drivers/nvm.o \
./drivers/rtcc.o \
./drivers/wdog.o 

C_DEPS += \
./drivers/adc.d \
./drivers/as393x.d \
./drivers/iadc.d \
./drivers/nvm.d \
./drivers/rtcc.d \
./drivers/wdog.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/adc.o: ../drivers/adc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"drivers/adc.d" -MT"drivers/adc.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/as393x.o: ../drivers/as393x.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"drivers/as393x.d" -MT"drivers/as393x.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/iadc.o: ../drivers/iadc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"drivers/iadc.d" -MT"drivers/iadc.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/nvm.o: ../drivers/nvm.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"drivers/nvm.d" -MT"drivers/nvm.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/rtcc.o: ../drivers/rtcc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"drivers/rtcc.d" -MT"drivers/rtcc.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/wdog.o: ../drivers/wdog.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -std=c99 -O2 -Wall -ffunction-sections -fdata-sections -mfpu=fpv5-sp-d16 -mfloat-abi=softfp -c -fmessage-length=0 -MMD -MP -MF"drivers/wdog.d" -MT"drivers/wdog.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


