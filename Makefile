ARCHS = armv7 arm64
SDK = iPhoneOS7.1
include theos/makefiles/common.mk

TWEAK_NAME = Browser
Browser_FILES = Tweak.xm
Browser_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += browser
include $(THEOS_MAKE_PATH)/aggregate.mk
