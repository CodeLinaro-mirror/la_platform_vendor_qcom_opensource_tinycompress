LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES:= $(LOCAL_PATH)/include
LOCAL_SRC_FILES:= src/lib/compress.c src/lib/compress_hw.c
LOCAL_MODULE := liboss_tinycompress
LOCAL_SHARED_LIBRARIES:= libcutils libutils
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_CFLAGS := -DTINYCOMPRESS_PLUGIN_DIR=\"\"
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES:= $(LOCAL_PATH)/include
LOCAL_SRC_FILES:= src/utils/cplay.c
LOCAL_MODULE := oss_cplay
LOCAL_SHARED_LIBRARIES:= libcutils libutils liboss_tinycompress
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES:= $(LOCAL_PATH)/include
LOCAL_SRC_FILES:= src/utils/crecord.c src/utils/wave.c
LOCAL_MODULE := oss_crec
LOCAL_SHARED_LIBRARIES:= libcutils libutils liboss_tinycompress
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_EXECUTABLE)

