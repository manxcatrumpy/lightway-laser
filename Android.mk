LOCAL_PATH := $(call my-dir)
# Main module
include $(CLEAR_VARS)
LOCAL_MODULE := lw
LOCAL_MODULE_TAGS := optional

# Add all source files
LOCAL_SRC_FILES := \
    src/main.c \
    src/state.c \
    src/he/helium.c \
    src/udp/client.c \
    src/util.c \
    src/udp/server.c \
    src/udp/flow.c \
    src/tun/tun.c \
    src/tun/tun_util.c \
    src/tun/tun_network.c \
    third_party/zlog/tidy/zlog.c \
    third_party/argparse/tidy/argparse.c

# Include paths
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/src \
    $(LOCAL_PATH)/src/he \
    $(LOCAL_PATH)/third_party/libhelium/include \
    $(LOCAL_PATH)/third_party/libwolfssl/include \
    $(LOCAL_PATH)/third_party/liboqs/include \
    $(LOCAL_PATH)/third_party/libuv/include \
    $(LOCAL_PATH)/third_party/zlog/tidy \
    $(LOCAL_PATH)/third_party/argparse/tidy

LOCAL_C_INCLUDES += $(KERNEL_HEADERS)

# Compiler flags
LOCAL_CFLAGS := -Wall -Werror -Wno-unused-parameter -Wno-unused-variable -Wno-missing-field-initializers

# Static libraries to link against
LOCAL_STATIC_LIBRARIES := \
    libhelium \
    libwolfssl \
    liboqs \
    libuv

# Shared libraries to link against
LOCAL_SHARED_LIBRARIES := \
    libc \
    libcutils \
    liblog \
    libutils \
    libdl

include $(BUILD_EXECUTABLE)

# Define libhelium first
include $(CLEAR_VARS)
LOCAL_MODULE := libhelium
LOCAL_SRC_FILES := third_party/libhelium/lib/libhelium.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/third_party/libhelium/include
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_PATH := $(LOCAL_PATH)/third_party/libhelium/lib
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# Define libwolfssl
include $(CLEAR_VARS)
LOCAL_MODULE := libwolfssl
LOCAL_SRC_FILES := third_party/libwolfssl/lib/libwolfssl.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/third_party/libwolfssl/include
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_PATH := $(LOCAL_PATH)/third_party/libwolfssl/lib
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# Define liboqs
include $(CLEAR_VARS)
LOCAL_MODULE := liboqs
LOCAL_SRC_FILES := third_party/liboqs/lib/liboqs.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/third_party/liboqs/include
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_PATH := $(LOCAL_PATH)/third_party/liboqs/lib
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# Define libuv
include $(CLEAR_VARS)
LOCAL_MODULE := libuv
LOCAL_SRC_FILES := third_party/libuv/lib/libuv.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/third_party/libuv/include
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_PATH := $(LOCAL_PATH)/third_party/libuv/lib
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
