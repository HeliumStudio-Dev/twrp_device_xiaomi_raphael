#
# Copyright (C) 2025 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/raphael

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msmnile
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := msmnile

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.usbcontroller=a600000.dwc3 service_locator.enable=1 lpm_levels.sleep_disabled=1 loop.max_part=7 kpti=off
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xa90000 androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_BOOT_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USES_METADATA_PARTITION := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_F2FS := true

# System as Root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist

# Extra
BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# TWRP
TW_DEVICE_VERSION := Helium_Studio
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_THEME := portrait_hdpi
TW_FRAMERATE := 60

TW_HAS_EDL_MODE := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_APEX := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_RESETPROP := true

TW_DEFAULT_LANGUAGE := zh_CN
TW_EXTRA_LANGUAGES := true

# TWRP - Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

PLATFORM_VERSION := 99.87.36

TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2 \
    vendor.display.config@1.0 \
    vendor.display.config@2.0

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so

# TWRP - Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Allow building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
