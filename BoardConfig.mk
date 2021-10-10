#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/mars

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Board
TARGET_BOOTLOADER_BOARD_NAME := mars

# Display
TARGET_SCREEN_DENSITY := 560
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 175
TARGET_USES_VULKAN := true

# OTA assert
TARGET_OTA_ASSERT_DEVICE := mars|star

# Kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/mars
TARGET_KERNEL_CONFIG := vendor/mars_defconfig
TARGET_KERNEL_CLANG_VERSION := prelude
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-prelude/bin
KERNEL_SUPPORTS_LLVM_TOOLS := true

# Kernel modules
BOOT_KERNEL_MODULES := \
    fts_touch_spi.ko \
    hwid.ko \
    xiaomi_touch.ko

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114001162240

# Include proprietary files
include vendor/xiaomi/mars/BoardConfigVendor.mk
-include vendor/xiaomi/mars-firmware/BoardConfigVendor.mk

# Inherit from proprietary files for miuicamera
include vendor/xiaomi/mars-miuicamera/products/board.mk
