#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := elish

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from elish device
$(call inherit-product, device/xiaomi/elish/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := elish
PRODUCT_NAME := twrp_elish
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := M2105K81AC
PRODUCT_MANUFACTURER := Xiaomi
#PRODUCT_RELEASE_NAME := Xiaomi Pad 5 Pro
