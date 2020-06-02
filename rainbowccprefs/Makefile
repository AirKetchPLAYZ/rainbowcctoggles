include $(THEOS)/makefiles/common.mk


BUNDLE_NAME = RainbowCCPrefs

RainbowCCPrefs_FILES = rainRootListController.m
RainbowCCPrefs_INSTALL_PATH = /Library/PreferenceBundles
RainbowCCPrefs_FRAMEWORKS = UIKit
RainbowCCPrefs_PRIVATE_FRAMEWORKS = Preferences
RainbowCCPrefs_EXTRA_FRAMEWORKS = CepheiPrefs Cephei
RainbowCCPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RainbowCCPrefs.plist$(ECHO_END)
