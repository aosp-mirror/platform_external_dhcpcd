# Copyright 2006 The Android Open Source Project
ifneq ($(TARGET_SIMULATOR),true)
LOCAL_PATH:= $(call my-dir)

etc_dir := $(TARGET_OUT)/etc/dhcpcd
hooks_dir := dhcpcd-hooks
hooks_target := $(etc_dir)/$(hooks_dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := common.c dhcp.c dhcpcd.c logger.c net.c \
	signals.c configure.c client.c if-linux.c lpf.c
LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
LOCAL_SHARED_LIBRARIES := libc libcutils
LOCAL_MODULE = dhcpcd
LOCAL_MODULE_TAGS := user
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := showlease.c
LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
LOCAL_SHARED_LIBRARIES := libc
LOCAL_MODULE = showlease
LOCAL_MODULE_TAGS := debug
include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#LOCAL_MODULE := dhcpcd.conf
#LOCAL_MODULE_TAGS := user
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_PATH := $(etc_dir)
#LOCAL_SRC_FILES := android.conf
#include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := dhcpcd-run-hooks
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(etc_dir)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := 01-test
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(hooks_target)
LOCAL_SRC_FILES := $(hooks_dir)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := 20-dns.conf
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(hooks_target)
LOCAL_SRC_FILES := $(hooks_dir)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := 95-configured
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(hooks_target)
LOCAL_SRC_FILES := $(hooks_dir)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

endif
