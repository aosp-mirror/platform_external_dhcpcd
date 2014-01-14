# Copyright 2006 The Android Open Source Project
LOCAL_PATH:= $(call my-dir)

etc_dir := $(TARGET_OUT)/etc/dhcpcd
hooks_dir := dhcpcd-hooks
hooks_target := $(etc_dir)/$(hooks_dir)

L_CFLAGS = -D_BSD_SOURCE
L_CFLAGS += -D_XOPEN_SOURCE=700
L_CFLAGS += -DINET
L_CFLAGS += -DINET6

##################################################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES := common.c control.c dhcpcd.c duid.c eloop.c \
                   if-options.c if-pref.c ifaddrs.c net.c script.c\
                   dhcp-common.c lpf.c if-linux.c if-linux-wireless.c platform-linux.c \
                   arp.c dhcp.c ipv4.c ipv4ll.c ipv6.c ipv6rs.c ipv6ns.c \
                   dhcp6.c compat/arc4random.c compat/closefrom.c compat/strlcpy.c \
                   compat/pselect.c compat/getline.c compat/posix_spawn.c

#LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
LOCAL_SHARED_LIBRARIES := libc libcutils libnetutils
LOCAL_MODULE = dhcpcd
LOCAL_CFLAGS = $(L_CFLAGS)
LOCAL_CFLAGS += -O2
LOCAL_CFLAGS += -std=c99
LOCAL_CFLAGS += -DDEBUG_RS
include $(BUILD_EXECUTABLE)
###################################################################################

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES := showlease.c
##LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
#LOCAL_SHARED_LIBRARIES := libc
#LOCAL_MODULE = showlease
#LOCAL_MODULE_TAGS := debug
#include $(BUILD_EXECUTABLE)
###################################################################################

#include $(CLEAR_VARS)
#LOCAL_MODULE := dhcpcd.conf
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_PATH := $(etc_dir)
#LOCAL_SRC_FILES := android.conf
#include $(BUILD_PREBUILT)
###################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := dhcpcd-run-hooks
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(etc_dir)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
###################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := 20-dns.conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(hooks_target)
LOCAL_SRC_FILES := $(hooks_dir)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
###################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := 95-configured
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(hooks_target)
LOCAL_SRC_FILES := $(hooks_dir)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
