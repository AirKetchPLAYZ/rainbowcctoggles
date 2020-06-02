ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_DEVICE_IP = 192.168.1.152
PACKAGE_VERSION=1.1-b


include $(THEOS)/makefiles/common.mk

export TWEAK_NAME = RainbowCCSwitches

$(TWEAK_NAME)_FILES = Tweak/Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += rainbowccprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
