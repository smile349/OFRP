#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/elish

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := elish

# Bootloader
PRODUCT_PLATFORM := kona
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Display
# TARGET_SCREEN_DENSITY := 360
# TARGET_SCREEN_HEIGHT := 2560
# TARGET_SCREEN_WIDTH := 1440

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

TW_INCLUDE_REPACKTOOLS := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.init_fatal_reboot_target=recovery
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_SOURCE := kernel/xiaomi/elish
TARGET_KERNEL_CONFIG := elish_defconfig

# Kernel - prebuilt
ifeq ($(USE_CAF_KERNEL),1)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
else
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Kenel dtb
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb

# Platform
TARGET_BOARD_PLATFORM := kona
TARGET_BOARD_PLATFORM_GPU := qcom-adreno650
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true
QCOM_BOARD_PLATFORMS += kona

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9124708352
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system product odm system_ext vendor

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Crypto
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 13
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Set boot SPL
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# TWRP Configuration
TW_THEME := portrait_hdpi
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file"
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 200

# QCOM_FIX
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Load drivers
TW_LOAD_VENDOR_MODULES := "exfat.ko"

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# haptics
TW_NO_HAPTICS := true

# Tool
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true

ifeq ($(TW_DEVICE_VERSION),)
TW_DEVICE_VERSION=13.0
endif
