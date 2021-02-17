#import "SelectorPlugin.h"
#if __has_include(<selector/selector-Swift.h>)
#import <selector/selector-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "selector-Swift.h"
#endif

@implementation SelectorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSelectorPlugin registerWithRegistrar:registrar];
}
@end
