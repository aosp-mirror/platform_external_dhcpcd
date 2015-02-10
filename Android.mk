# Copyright 2006 The Android Open Source Project
LOCAL_PATH:= $(call my-dir)

etc_dir := $(TARGET_OUT)/etc/dhcpcd
hooks_dir := dhcpcd-hooks
hooks_target := $(etc_dir)/$(hooks_dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	arp.c \
	auth.c \
	common.c \
	control.c \
	dhcp6.c \
	dhcp.c \
	dhcpcd.c \
	dhcp-common.c \
	dhcpcd-embedded.c \
	duid.c \
	eloop.c \
	if.c \
	if-linux.c \
	if-linux-wext.c \
	if-options.c \
	ipv4.c \
	ipv4ll.c \
	ipv6.c \
	ipv6nd.c \
	script.c \
	compat/closefrom.c \
	compat/posix_spawn.c \
	crypt/hmac_md5.c \
	crypt/md5.c \
	crypt/sha256.c \

# should be in compat/ (or libc).
LOCAL_SRC_FILES += ifaddrs.c

LOCAL_CFLAGS += -DINET -DINET6 -I$(LOCAL_PATH)/crypt

# Clang complains about configure.c's comparing array with null.
LOCAL_CFLAGS += -Wno-tautological-pointer-compare
LOCAL_SHARED_LIBRARIES := libc libcutils libnetutils
LOCAL_MODULE = dhcpcd
include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES := showlease.c
#LOCAL_SHARED_LIBRARIES := libc
#LOCAL_MODULE = showlease
#LOCAL_MODULE_TAGS := debug
#include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#LOCAL_MODULE := dhcpcd.conf
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_PATH := $(etc_dir)
#LOCAL_SRC_FILES := android.conf
#include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := dhcpcd-run-hooks
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(etc_dir)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := 20-dns.conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(hooks_target)
LOCAL_SRC_FILES := $(hooks_dir)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := 95-configured
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(hooks_target)
LOCAL_SRC_FILES := $(hooks_dir)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
