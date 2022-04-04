#import "RNToolkit.h"
#import "RNMediaLibrary.h"

@implementation RNToolkit

RCT_EXPORT_MODULE(RNToolkit)

RCT_REMAP_METHOD(getVideoThumbnail,
                 withPath:(nonnull NSString *)path widthOptions:(NSDictionary *)options
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    RNMediaLibrary *mediaLibrary = [[RNMediaLibrary alloc] init];
    NSDictionary *result = [mediaLibrary getVideoThumbnail:path withOptions: options];
    resolve(result);
}

RCT_REMAP_METHOD(setAppearanceColorScheme,
                 withUserInterfaceStyle:(NSString *)style
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
