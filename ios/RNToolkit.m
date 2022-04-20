#import "RNToolkit.h"
#import "RNMediaLibrary.h"

static NSString* const TMP_DIRECTORY = @"react-native-kit/";

@interface RNToolkit()

@end

@implementation RNToolkit

- (instancetype)init {
    NSString *directory = [NSTemporaryDirectory() stringByAppendingString:TMP_DIRECTORY];
    NSFileManager *fileManager = [[NSFileManager alloc] init];

    BOOL isDir = YES;
    BOOL exists = [fileManager fileExistsAtPath:directory isDirectory:&isDir];
    if (!exists) {
        [fileManager createDirectoryAtPath: directory
                                  withIntermediateDirectories:YES attributes:nil error:nil];
     }
    return self;
}

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
