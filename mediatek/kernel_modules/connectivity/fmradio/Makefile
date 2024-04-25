# SPDX-License-Identifier: GPL-2.0
# Copyright (c) 2021 Mediatek Inc.

include $(wildcard $(KERNEL_SRC)/$(DEVICE_MODULES_REL_DIR)/Makefile.include)

define build_kernel_modules
    $(MAKE) -C $(KERNEL_SRC) M=$(M)/Build/$(1) modules $(KBUILD_OPTIONS) CFG_FM_PLAT=$(1) CFG_BUILD_CONNAC2=$(2) CFG_FM_CHIP_ID=$(3) CFG_FM_CHIP=$(4) KBUILD_EXTRA_SYMBOLS="$(5)"
endef

define install_kernel_modules
   $(MAKE) M=$(M)/Build/$(1) -C $(KERNEL_SRC) modules_install
endef

define clean_kernel_modules
   $(MAKE) -C $(KERNEL_SRC) M=$(M)/Build/$(1) clean
endef

extra_symbols := $(abspath $(O)/../vendor/mediatek/kernel_modules/connectivity/common/Module.symvers)

all:
	$(call build_kernel_modules,mt6631_6635,false,,,$(extra_symbols))

modules_install:
	$(call install_kernel_modules,mt6631_6635,false,,,$(extra_symbols))

clean:
	$(call clean_kernel_modules,mt6631_6635,false,,,$(extra_symbols))
