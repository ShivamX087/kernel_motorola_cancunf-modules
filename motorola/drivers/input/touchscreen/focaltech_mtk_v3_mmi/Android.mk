DLKM_DIR := motorola/kernel/modules
LOCAL_PATH := $(call my-dir)

ifeq ($(DLKM_INSTALL_TO_VENDOR_OUT),true)
FOCALTECH_MMI_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/modules/
else
FOCALTECH_MMI_MODULE_PATH := $(KERNEL_MODULES_OUT)
endif

ifneq ($(FOCALTECH_TOUCH_IC_NAME),)
	KERNEL_CFLAGS += CONFIG_INPUT_FTS_MTK_V3_MMI_IC_NAME=$(FOCALTECH_TOUCH_IC_NAME)
else
	KERNEL_CFLAGS += CONFIG_INPUT_FTS_MTK_V3_MMI_IC_NAME=ft8006s
endif


ifeq ($(MTK_PANEL_NOTIFICATIONS),true)
      KERNEL_CFLAGS += CONFIG_MTK_PANEL_NOTIFICATIONS=y
endif
ifneq ($(BOARD_USES_MTK_GET_PANEL),)
	KERNEL_CFLAGS += CONFIG_INPUT_CHIPONE_MTK_GET_PANEL=y
endif
ifeq ($(CONFIG_INPUT_FB_PANEL), true)
	KERNEL_CFLAGS += FOCALTECH_FB_PANEL=y
endif
ifneq ($(FOCALTECH_TOUCH_TEST_SUPPORT),)
	KERNEL_CFLAGS += CONFIG_INPUT_FTS_TEST_SUPPORT=y
endif
include $(CLEAR_VARS)
LOCAL_MODULE := focaltech_mtk_v3_mmi.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(FOCALTECH_MMI_MODULE_PATH)
include $(DLKM_DIR)/AndroidKernelModule.mk
