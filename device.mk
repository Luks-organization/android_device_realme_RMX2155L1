#
# SPDX-FileCopyrightText: 2019 The Android Open Source Project
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/RMX2155L1

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION ?= false

# OTA package
AB_OTA_UPDATER := false
TARGET_OTA_ALLOW_NON_AB := true

PRODUCT_SOONG_NAMESPACES += \
    bootable/deprecated-ota

# Platform
TARGET_BOARD_PLATFORM := mt6785

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29
BOARD_SHIPPING_API_LEVEL := 31

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Dex compiler
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed-profile

# Dex pre-opt
WITH_DEXPREOPT := true
DEX_PREOPT_DEFAULT := generate-vdex-and-image
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
WITH_DEXPREOPT_DEBUG_INFO := false
DONT_DEXPREOPT_PREBUILTS := true

# Kernel
PRODUCT_ENABLE_UFFD_GC := true
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl:32 \
    android.hardware.audio.effect@7.0-impl:32 \
    android.hardware.soundtrigger@2.3-impl:32

PRODUCT_PACKAGES += \
    audio.bluetooth.default:32 \
    audio.primary.default:32 \
    audio.r_submix.default:32 \
    audio.usbv2.default:32 \
    audio_policy.stub:32

PRODUCT_PACKAGES += \
    libaudiofoundation.vendor:32 \
    libalsautils:32 \
    libdynproc:32 \
    libhapticgenerator:32 \
    libopus.vendor:32

# Audio configuration files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/audio,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Speaker
$(call soong_config_set,android_hardware_audio,skip_speaker_layout_channel_mask_field,true)

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth-service.mediatek \
    android.hardware.bluetooth.audio-impl:32

# Library Codec
PRODUCT_PACKAGES += \
    libldacBT_enc \
    libldacBT_abr \
    libldacBT_bco \
    libldacBT_bco.vendor \
    liblhdc

# Dolby
$(call inherit-product, hardware/dolby/dolby.mk)

# JamesDSP
$(call inherit-product, packages/apps/JamesDSPManager/config.mk)

# RealmePearts
#PRODUCT_PACKAGES += \
    #RealmeParts

# Dplus
PRODUCT_PACKAGES += \
    OplusDeviceService

# Doze
PRODUCT_PACKAGES += \
    OplusDoze

# FMRadio
PRODUCT_PACKAGES += \
    FMRadio

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# BesLoudness
PRODUCT_PACKAGES += \
    BesLoudness

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.oplus

# Camera
PRODUCT_PACKAGES += \
    libcamera2ndk_vendor \
    libperfctl_vendor \
    liblz4.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    libmockdrmcryptoplugin

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.2-service \
    android.hardware.memtrack-service.mediatek-mali

# Charger
PRODUCT_PACKAGES += \
    libsuspend:64

# ConfigStore
PRODUCT_PACKAGES += \
    disable_configstore

# Lineage Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch-service.MT6785

# Sensors
PRODUCT_PACKAGES += \
    vendor.lineage.oplus_als.service \
    android.hardware.sensors@1.0-service \
    android.hardware.sensors@1.0-impl:64 \
    sensors.dynamic_sensor_hal:64 \
    sensors.als_wrapper:64 \
    sensors.oplus_virtual:64

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Fastboot
PRODUCT_PACKAGES += \
    android.hardware.fastboot-service.example_recovery \
    fastbootd

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss-V1-ndk.vendor \
    android.hardware.gnss@1.0.vendor \
    android.hardware.gnss@1.1.vendor \
    android.hardware.gnss@2.0.vendor \
    android.hardware.gnss@2.1.vendor \
    libexpat.vendor \
    libcurl.vendor \
    libssl.vendor

PRODUCT_PACKAGES += \
    android.hardware.gnss-service.mediatek

# IMS
$(call inherit-product, vendor/mediatek/ims/ims.mk)

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio-service.compat

PRODUCT_PACKAGES += \
    libprotobuf-cpp-lite.vendor \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# Rcs Service
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Mtk In Call Service
PRODUCT_PACKAGES += \
    MtkInCallService

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.mediatek \
    android.hardware.health-service.mediatek-recovery \
    charger_res_images_vendor

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

$(call soong_config_set,lineage_health,charging_control_charging_path,/sys/class/oplus_chg/battery/mmi_charging_enable)

# Light
PRODUCT_PACKAGES += \
    android.hardware.light-service.MT6785

# Linker
PRODUCT_VENDOR_LINKER_CONFIG_FRAGMENTS += \
    $(DEVICE_PATH)/configs/linker/linker.config.json

# Keystore
PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore.xml

# Keymaster
PRODUCT_PACKAGES += \
    libkeymaster4support.vendor \
    libsoft_attestation_cert.vendor \
    libpuresoftkeymasterdevice.vendor

# MediaCodec
PRODUCT_PACKAGES += \
    media_codecs_c2.xml \
    media_codecs_mediatek_video.xml \
    media_codecs_performance.xml \
    media_profiles_V1_0.xml \
    mtk_platform_codecs_config.xml \
    mtk_platform_codecs_whitelist.xml

PRODUCT_PACKAGES += \
    libstagefright_softomx_plugin.vendor

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

$(call soong_config_set,stagefright,target_disables_thumbnail_block_model,true)

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    libchrome.vendor \
    Tag

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/nfc_features.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/sku_nfc/nfc_features.xml

# Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayPlatform \
    DialerOverlayPlatform \
    ApertureQRScannerOverlay \
    LineageSDKOverlayPlatform \
    LineageSettingsOverlayPlatform

PRODUCT_PACKAGES += \
    FrameworkResOverlayPlatform \
    SettingsProviderOverlayPlatform \
    SettingsOverlayPlatform \
    SystemUIOverlayPlatform \
    TetheringConfigOverlay \
    CarrierConfigOverlay \
    NfcOverlayPlatform \
    WifiOverlayPlatform \
    OplusDozeOverlay

PRODUCT_PACKAGES += \
    SettingsProviderOverlayRMX2151L1 \
    SettingsProviderOverlayRMX2155L1 \
    SettingsProviderOverlayRMX2156L1 \
    SettingsProviderOverlayRMX2161L1 \
    SettingsProviderOverlayRMX2163L1

# RRO (Runtime Resource Overlay)
PRODUCT_ENFORCE_RRO_TARGETS := *

# Libinit
$(call soong_config_set,libinit,vendor_init_lib,//$(DEVICE_PATH):libinit_RMX2155L1)

# Permission
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/public.libraries/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \
    $(DEVICE_PATH)/configs/public.libraries/public.libraries-trustonic.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries-trustonic.txt \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-xhotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-xhotword.xml \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-com.mediatek.engineermode.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-com.mediatek.engineermode.xml \
    $(DEVICE_PATH)/configs/permissions/com.android.hotwordenrollment.common.util.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.android.hotwordenrollment.common.util.xml \
    $(DEVICE_PATH)/configs/permissions/com.mediatek.hardware.vow_dsp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.mediatek.hardware.vow_dsp.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.external.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.external.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.software.window_magnification.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.window_magnification.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.telephony.radio.access.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.radio.access.xml \
    frameworks/native/data/etc/android.hardware.telephony.data.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.data.xml \
    frameworks/native/data/etc/android.hardware.telephony.calling.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.calling.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnel_migration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnel_migration.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.hardware.gamepad.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.gamepad.xml \
    frameworks/native/data/etc/android.hardware.xr.input.hand_tracking.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.xr.input.hand_tracking.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

# Power
PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub \
    libmtkperf_client_vendor \
    libmtkperf_client

PRODUCT_PACKAGES += \
    android.hardware.power-service.lineage-libperfmgr

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/perf/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Cgroup and task_profiles
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    $(DEVICE_PATH)/configs/profiles/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

PRODUCT_PACKAGES += \
    PowerOffAlarm

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init/init.recovery.mt6785.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6785.rc

PRODUCT_PACKAGES += \
    init.mt6785.power.rc \
    init.mt6785.rc \
    init.mt6785.usb.rc \
    init.nfc_detect.rc \
    init.oplus.rc \
    fstab.mt6785 \
    fstab.mt6785.ramdisk \
    ueventd.mtk.rc \
    ueventd.oplus.rc \
    nfc_detect.sh \
    parts.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    $(DEVICE_PATH)/aidl/touch \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/lineage/interfaces/power-libperfmgr \
    hardware/mediatek/libmtkperf_client \
    hardware/mediatek \
    hardware/oplus \
    hardware/dolby

# Properties
include $(DEVICE_PATH)/configs/props/vendor_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb-service.mediatek \
    android.hardware.usb.gadget-service.mediatek

$(call soong_config_set,android_hardware_mediatek_usb,audio_accessory_supported,true)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

$(call soong_config_set,mediatek_vibrator,supports_effects,true)

# VNDK
PRODUCT_PACKAGES += \
    libunwindstack.vendor \
    vndservicemanager

# Required for QPR3
PRODUCT_PACKAGES += \
    libdng_sdk.vendor \
    libmemunreachable.vendor \
    libjsoncpp.vendor

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl \
    libwifi-hal-wrapper:64 \
    lib_driver_cmd_mt66xx \
    wpa_supplicant \
    hostapd

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

# Inherit vendor the proprietary files
$(call inherit-product, vendor/realme/RMX2155L1/RMX2155L1-vendor.mk)
