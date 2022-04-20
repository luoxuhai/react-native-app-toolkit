#import "RNToolkit.h"
#import "RTKAppearance.h"

@implementation RNToolkit

RCT_EXPORT_MODULE(RTKAppearance)

RCT_EXPORT_METHOD(setAppearanceColorScheme:(NSString *)style
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    if (@available(iOS 13.0, *)) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWindow *window = UIApplication.sharedApplication.delegate.window;
            if ([style isEqual:@"light"]) {
                window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
            } else if ([style isEqual:@"dark"]) {
                window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
            } else {
                window.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
            }
        });
        resolve(nil);
    } else {
        reject(@"ERROR", @"Only available on iOS 13.0 or newer", nil);
    }
}

@end
