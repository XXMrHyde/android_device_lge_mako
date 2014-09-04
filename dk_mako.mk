#
# Copyright 2012 The Android Open Source Project
# Copyright (C) 2013 DarkKat
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers

# Additional packages
PRODUCT_PACKAGES += \
    Torch

# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the darkkat vendor common configuration
$(call inherit-product, vendor/dk/config/common.mk)

PRODUCT_NAME := dk_mako
PRODUCT_DEVICE := mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/msm/mako
TARGET_KERNEL_CONFIG := mako_defconfig
TARGET_VARIANT_CONFIG := mako_defconfig
TARGET_SELINUX_CONFIG := mako_defconfig

# Device specific part of the OTA update uri
PRODUCT_UPDATE_URI_PART := vwwqt3sepg51eln/dk_update_mako.json

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/lge/mako/device.mk)
$(call inherit-product-if-exists, vendor/lge/mako/device-vendor.mk)
