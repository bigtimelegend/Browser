include theos/makefiles/common.mk

BUNDLE_NAME = Browser
Browser_FILES = Browser.mm
Browser_INSTALL_PATH = /Library/PreferenceBundles
Browser_FRAMEWORKS = UIKit
Browser_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Browser.plist$(ECHO_END)
