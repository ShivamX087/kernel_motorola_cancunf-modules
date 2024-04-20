# SPDX-License-Identifier: GPL-2.0

include $(wildcard $(KERNEL_SRC)/$(DEVICE_MODULES_REL_DIR)/Makefile.include)

define build_kernel_modules_img
$(MAKE) -C $(KERNEL_SRC) M=$(M)/$(1)/$(2) modules $(KBUILD_OPTIONS) MTK_PLATFORM=$(1) DDK_VERSION=$(2) LOCAL_MTK_GPU_PROTECTED_SUPPORT=$(3) BUILD_RULE=$(RULE)
endef

define install_kernel_modules_img
$(MAKE) -C $(KERNEL_SRC) M=$(M)/$(1)/$(2) modules_install $(KBUILD_OPTIONS) MTK_PLATFORM=$(1) DDK_VERSION=$(2) LOCAL_MTK_GPU_PROTECTED_SUPPORT=$(3) BUILD_RULE=$(RULE)
endef

define clean_kernel_modules_img
$(MAKE) -C $(KERNEL_SRC) M=$(M)/$(1)/$(2) clean $(KBUILD_OPTIONS) MTK_PLATFORM=$(1) DDK_VERSION=$(2) LOCAL_MTK_GPU_PROTECTED_SUPPORT=$(3) BUILD_RULE=$(RULE)
endef

comma := ,
PARAMS :=

ifneq (,$(wildcard mt6855))
	PARAMS += img,mt6855,m1.15ED6070602,n
	PARAMS += img,mt6855,m1.15ED6070602_TD,y
endif

targets_build := $(addprefix build_,$(PARAMS))
all: $(targets_build)
$(targets_build):
	$(eval param=$(subst $(comma), ,$(subst build_,,$@)))
	$(call build_kernel_modules_$(word 1,$(param)),$(word 2,$(param)),$(word 3,$(param)),$(word 4,$(param)),$(word 5,$(param)))

targets_install := $(addprefix install_,$(PARAMS))
modules_install: $(targets_install)
$(targets_install):
	$(eval param=$(subst $(comma), ,$(subst install_,,$@)))
	$(call install_kernel_modules_$(word 1,$(param)),$(word 2,$(param)),$(word 3,$(param)),$(word 4,$(param)),$(word 5,$(param)))

targets_clean := $(addprefix clean_,$(PARAMS))
clean: $(targets_clean)
$(targets_clean):
	$(eval param=$(subst $(comma), ,$(subst clean_,,$@)))
	$(call clean_kernel_modules_$(word 1,$(param)),$(word 2,$(param)),$(word 3,$(param)),$(word 4,$(param)),$(word 5,$(param)))
