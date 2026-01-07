#Note: We have created copy of  'libqti-tinycompress' module in Android.bp
# for RBVM-LA15.2.0 (_sdv _cdcsdv), to support APEX
# in audio components and also to avoid conflict
# as the this bin component is common among many other Software-Images

#********* update the Android.bp also if this Android.mk is updated,
#          as both have common properties                 *********


ifeq (,$(filter $(TARGET_BOARD_DERIVATIVE_SUFFIX), _sdv _cdcsdv))
ifneq ($(AUDIO_USE_STUB_HAL), true)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Wno-macro-redefined -Wno-unused-function
ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)), true)
LOCAL_CFLAGS += -DENABLE_EXTENDED_COMPRESS_FORMAT
endif
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_SRC_FILES := compress.c utils.c compress_hw.c compress_plugin.c snd_utils.c
LOCAL_MODULE := libqti-tinycompress
LOCAL_SHARED_LIBRARIES := libcutils libutils
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Wno-macro-redefined -Wno-unused-function
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_SRC_FILES := cplay.c
LOCAL_MODULE := qticplay
LOCAL_VENDOR_MODULE := true
LOCAL_SHARED_LIBRARIES := libcutils libutils libqti-tinycompress
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

endif
endif
