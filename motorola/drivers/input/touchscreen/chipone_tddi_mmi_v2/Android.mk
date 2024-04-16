DLKM_DIR := motorola/kernel/modules
LOCAL_PATH := $(call my-dir)

ifneq ($(CHIPONE_TOUCH_IC_NAME),)
	KERNEL_CFLAGS += CONFIG_INPUT_CHIPONE_IC_NAME=$(CHIPONE_TOUCH_IC_NAME)
else
	KERNEL_CFLAGS += CONFIG_INPUT_CHIPONE_IC_NAME=icnl9922c
endif

ifneq ($(BOARD_USES_MTK_CHECK_PANEL),)
	KERNEL_CFLAGS += CONFIG_CHIPONE_MTK_CHECK_PANEL=y
endif

ifneq ($(BOARD_USES_MTK_GET_PANEL),)
	KERNEL_CFLAGS += CONFIG_INPUT_CHIPONE_MTK_GET_PANEL=y
endif

ifeq ($(MTK_PANEL_NOTIFICATIONS),true)
	KERNEL_CFLAGS += CONFIG_MTK_PANEL_NOTIFICATIONS=y
endif

ifeq ($(CONFIG_INPUT_CHECK_DEVICE_BOOTMODE),true)
	KERNEL_CFLAGS += CONFIG_CHIPONE_CHECK_DEVICE_BOOTMODE=y
endif

ifneq ($(BOARD_USES_DOUBLE_TAP),)
	KERNEL_CFLAGS += CONFIG_CTS_INPUT_ENABLE_DOUBLE_TAP=y
endif

ifeq ($(BOARD_USES_DOUBLE_TAP_CTRL),true)
	KERNEL_CFLAGS += CONFIG_BOARD_USES_DOUBLE_TAP_CTRL=y
endif

ifneq ($(CONFIG_INPUT_SET_TOUCH_STATE),)
	KERNEL_CFLAGS += CONFIG_CTS_NOTIFY_TOUCH_STATE=y
endif

ifeq ($(TOUCHSCREEN_LAST_TIME),true)
	KERNEL_CFLAGS += CONFIG_CTS_LAST_TIME=y
endif

ifeq ($(CHIPONE_ESD),true)
	KERNEL_CFLAGS += CONFIG_CHIPONE_ESD=y
endif

ifeq ($(CHIPONE_EARJACK),true)
	KERNEL_CFLAGS += CONFIG_INPUT_CHIPONE_EARJACK=y
endif

ifeq ($(findstring factory,$(TARGET_PRODUCT)),factory)
	KERNEL_CFLAGS += CONFIG_TARGET_BUILD_FACTORY=y
endif


include $(CLEAR_VARS)
ifneq ($(BOARD_USES_DOUBLE_TAP),)
LOCAL_ADDITIONAL_DEPENDENCIES += $(KERNEL_MODULES_OUT)/sensors_class.ko
endif
LOCAL_MODULE := chipone_tddi_mmi_v2.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/modules/

include $(DLKM_DIR)/AndroidKernelModule.mk
