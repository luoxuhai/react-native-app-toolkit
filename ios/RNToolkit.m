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

@end
