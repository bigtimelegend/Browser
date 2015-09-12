#import <Preferences/Preferences.h>

@interface BrowserListController: PSListController {
}
@end

@implementation BrowserListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Browser" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
