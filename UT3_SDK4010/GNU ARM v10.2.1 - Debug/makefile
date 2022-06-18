################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include utils/subdir.mk
-include gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/subdir.mk
-include gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_protocol_crypto/src/subdir.mk
-include gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_mbedtls_support/src/subdir.mk
-include gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/subdir.mk
-include gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/subdir.mk
-include gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/subdir.mk
-include gecko_sdk_4.0.1/util/silicon_labs/silabs_core/memory_manager/subdir.mk
-include gecko_sdk_4.0.1/protocol/bluetooth/lib/EFR32BG22/GCC/subdir.mk
-include gecko_sdk_4.0.1/platform/service/udelay/src/subdir.mk
-include gecko_sdk_4.0.1/platform/service/system/src/subdir.mk
-include gecko_sdk_4.0.1/platform/service/sleeptimer/src/subdir.mk
-include gecko_sdk_4.0.1/platform/service/power_manager/src/subdir.mk
-include gecko_sdk_4.0.1/platform/service/iostream/src/subdir.mk
-include gecko_sdk_4.0.1/platform/service/hfxo_manager/src/subdir.mk
-include gecko_sdk_4.0.1/platform/service/device_init/src/subdir.mk
-include gecko_sdk_4.0.1/platform/radio/rail_lib/plugin/pa-conversions/subdir.mk
-include gecko_sdk_4.0.1/platform/emlib/src/subdir.mk
-include gecko_sdk_4.0.1/platform/emdrv/spidrv/src/subdir.mk
-include gecko_sdk_4.0.1/platform/emdrv/nvm3/src/subdir.mk
-include gecko_sdk_4.0.1/platform/emdrv/dmadrv/src/subdir.mk
-include gecko_sdk_4.0.1/platform/common/toolchain/src/subdir.mk
-include gecko_sdk_4.0.1/platform/common/src/subdir.mk
-include gecko_sdk_4.0.1/platform/bootloader/app_properties/subdir.mk
-include gecko_sdk_4.0.1/platform/bootloader/api/subdir.mk
-include gecko_sdk_4.0.1/platform/Device/SiliconLabs/EFR32BG22/Source/GCC/subdir.mk
-include gecko_sdk_4.0.1/platform/Device/SiliconLabs/EFR32BG22/Source/subdir.mk
-include gecko_sdk_4.0.1/app/bluetooth/common/ota_dfu/subdir.mk
-include drivers/subdir.mk
-include autogen/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: UT-3.axf

# Tool invocations
UT-3.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -mcpu=cortex-m33 -mthumb -T "UT-3.ld" -nostdlib -Xlinker --gc-sections -Xlinker -Map="UT-3.map" -mfpu=fpv5-sp-d16 -mfloat-abi=softfp --specs=nano.specs -o UT-3.axf "./autogen/gatt_db.o" "./autogen/sl_bluetooth.o" "./autogen/sl_device_init_clocks.o" "./autogen/sl_event_handler.o" "./autogen/sl_iostream_handles.o" "./autogen/sl_iostream_init_usart_instances.o" "./autogen/sl_power_manager_handler.o" "./autogen/sl_spidrv_init.o" "./battery_machine.o" "./ble_api.o" "./ble_manager_machine.o" "./lf_decoder.o" "./lf_machine.o" "./main.o" "./tag_beacon_machine.o" "./tag_command.o" "./tag_configuration.o" "./tag_defines.o" "./tag_main_machine.o" "./tag_power_manager.o" "./tag_status_fw_machine.o" "./tag_uptime_machine.o" "./temperature_machine.o" "./template.o" "./version.o" "./drivers/adc.o" "./drivers/as393x.o" "./drivers/iadc.o" "./drivers/nvm.o" "./drivers/rtcc.o" "./drivers/wdog.o" "./gecko_sdk_4.0.1/app/bluetooth/common/ota_dfu/sl_ota_dfu.o" "./gecko_sdk_4.0.1/platform/Device/SiliconLabs/EFR32BG22/Source/GCC/startup_efr32bg22.o" "./gecko_sdk_4.0.1/platform/Device/SiliconLabs/EFR32BG22/Source/system_efr32bg22.o" "./gecko_sdk_4.0.1/platform/bootloader/api/btl_interface.o" "./gecko_sdk_4.0.1/platform/bootloader/api/btl_interface_storage.o" "./gecko_sdk_4.0.1/platform/bootloader/app_properties/app_properties.o" "./gecko_sdk_4.0.1/platform/common/src/sl_slist.o" "./gecko_sdk_4.0.1/platform/common/toolchain/src/sl_memory.o" "./gecko_sdk_4.0.1/platform/emdrv/dmadrv/src/dmadrv.o" "./gecko_sdk_4.0.1/platform/emdrv/nvm3/src/nvm3_default_common_linker.o" "./gecko_sdk_4.0.1/platform/emdrv/nvm3/src/nvm3_hal_flash.o" "./gecko_sdk_4.0.1/platform/emdrv/nvm3/src/nvm3_lock.o" "./gecko_sdk_4.0.1/platform/emdrv/spidrv/src/spidrv.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_assert.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_burtc.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_cmu.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_core.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_emu.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_gpio.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_iadc.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_ldma.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_msc.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_prs.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_rmu.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_rtcc.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_se.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_system.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_usart.o" "./gecko_sdk_4.0.1/platform/emlib/src/em_wdog.o" "./gecko_sdk_4.0.1/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o" "./gecko_sdk_4.0.1/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o" "./gecko_sdk_4.0.1/platform/service/device_init/src/sl_device_init_dcdc_s2.o" "./gecko_sdk_4.0.1/platform/service/device_init/src/sl_device_init_emu_s2.o" "./gecko_sdk_4.0.1/platform/service/device_init/src/sl_device_init_hfxo_s2.o" "./gecko_sdk_4.0.1/platform/service/device_init/src/sl_device_init_lfrco.o" "./gecko_sdk_4.0.1/platform/service/device_init/src/sl_device_init_lfxo_s2.o" "./gecko_sdk_4.0.1/platform/service/device_init/src/sl_device_init_nvic.o" "./gecko_sdk_4.0.1/platform/service/hfxo_manager/src/sl_hfxo_manager.o" "./gecko_sdk_4.0.1/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.o" "./gecko_sdk_4.0.1/platform/service/iostream/src/sl_iostream.o" "./gecko_sdk_4.0.1/platform/service/iostream/src/sl_iostream_retarget_stdio.o" "./gecko_sdk_4.0.1/platform/service/iostream/src/sl_iostream_stdlib_config.o" "./gecko_sdk_4.0.1/platform/service/iostream/src/sl_iostream_uart.o" "./gecko_sdk_4.0.1/platform/service/iostream/src/sl_iostream_usart.o" "./gecko_sdk_4.0.1/platform/service/power_manager/src/sl_power_manager.o" "./gecko_sdk_4.0.1/platform/service/power_manager/src/sl_power_manager_debug.o" "./gecko_sdk_4.0.1/platform/service/power_manager/src/sl_power_manager_hal_s2.o" "./gecko_sdk_4.0.1/platform/service/sleeptimer/src/sl_sleeptimer.o" "./gecko_sdk_4.0.1/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o" "./gecko_sdk_4.0.1/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.o" "./gecko_sdk_4.0.1/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.o" "./gecko_sdk_4.0.1/platform/service/system/src/sl_system_init.o" "./gecko_sdk_4.0.1/platform/service/system/src/sl_system_process_action.o" "./gecko_sdk_4.0.1/platform/service/udelay/src/sl_udelay.o" "./gecko_sdk_4.0.1/platform/service/udelay/src/sl_udelay_armv6m_gcc.o" "./gecko_sdk_4.0.1/util/silicon_labs/silabs_core/memory_manager/sl_malloc.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/cipher.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/cipher_wrap.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/platform.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/platform_util.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_aead.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_cipher.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_client.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_driver_wrappers.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_ecp.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_hash.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_mac.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_rsa.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_se.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_slot_management.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/psa_crypto_storage.o" "./gecko_sdk_4.0.1/util/third_party/crypto/mbedtls/library/threading.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager_attestation.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager_cipher.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager_entropy.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager_hash.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager_key_derivation.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager_key_handling.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager_signature.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/se_manager/src/sl_se_manager_util.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/ba414ep_config.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/ba431_config.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/cryptodma_internal.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/cryptolib_types.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_aes.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_blk_cipher.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_dh_alg.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_ecc_curves.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_ecc_keygen_alg.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_ecdsa_alg.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_hash.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_math.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_memcmp.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_memcpy.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_primitives.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_rng.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_cryptoacc_library/src/sx_trng.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_mbedtls_support/src/cryptoacc_aes.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_mbedtls_support/src/cryptoacc_gcm.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_mbedtls_support/src/sl_mbedtls.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/cryptoacc_management.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_aead.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_cipher.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_hash.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_derivation.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_key_management.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_mac.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_cryptoacc_transparent_driver_signature.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_psa_driver_common.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_psa_driver_init.o" "./gecko_sdk_4.0.1/util/third_party/crypto/sl_component/sl_psa_driver/src/sli_psa_trng.o" "./utils/boot.o" "./utils/cli.o" "./utils/dbg_utils.o" "./utils/tag_sw_timer.o" 
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building hex file: UT-3.hex'
	arm-none-eabi-objcopy -O ihex "UT-3.axf" "UT-3.hex"
	@echo ' '

	@echo 'Building bin file: UT-3.bin'
	arm-none-eabi-objcopy -O binary "UT-3.axf" "UT-3.bin"
	@echo ' '

	@echo 'Building s37 file: UT-3.s37'
	arm-none-eabi-objcopy -O srec "UT-3.axf" "UT-3.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "UT-3.axf" -A
	@echo ' '

# Other Targets
clean:
	-@$(foreach FILE, $(EXECUTABLES), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(OBJS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(C_DEPS), $(shell $(RM) $(FILE)) )
	-$(RM) UT-3.axf
	-@echo ' '

.PHONY: all clean dependents

-include ../makefile.targets
