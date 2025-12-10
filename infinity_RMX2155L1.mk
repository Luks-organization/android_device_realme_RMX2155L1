#
# SPDX-FileCopyrightText: 2019 The Android Open Source Project
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit some common Infinity-X OS stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Inherit from device makefile.
$(call inherit-product, device/realme/RMX2155L1/device.mk)

# Infinity-X flags
INFINITY_BUILD_TYPE := UNOFFICIAL
INFINITY_MAINTAINER := LUKS
TARGET_SUPPORTS_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_BUILD_DEVICE_AS_WEBCAM := false
TARGET_SUPPORTS_64_BIT_APPS := true

# Gapps
WITH_GAPPS := true

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1920

# Device Information
PRODUCT_BRAND := realme
PRODUCT_DEVICE := RMX2155L1
PRODUCT_MANUFACTURER := realme
PRODUCT_MODEL := RMX2155
PRODUCT_NAME := lineage_RMX2155L1

PRODUCT_SYSTEM_NAME := RMX2155
PRODUCT_SYSTEM_DEVICE := RMX2155L1

PRODUCT_GMS_CLIENTID_BASE := android-$(PRODUCT_BRAND)

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc=$(call normalize-path-list, "sys_mssi_64_cn_armv82-user 12 SP1A.210812.016 1668670161293 release-keys") \
    SystemModel=$(PRODUCT_SYSTEM_NAME) \
    SystemName=$(PRODUCT_SYSTEM_NAME) \
    ProductModel=$(PRODUCT_SYSTEM_NAME) \
    DeviceProduct=$(PRODUCT_SYSTEM_DEVICE)
