#import "RNToolkit.h"
#import "RNMediaLibrary.h"
#import "RNDocumentCamera.h"
#import "RTKVideoEditor.h"

static NSString* const TMP_DIRECTORY = @"react-native-kit/";

@interface RNToolkit()

@property (nonatomic, strong) RNDocumentCamera *documentCamera;
@property (nonatomic, strong) RTKVideoEditor *videoEditor;

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
    
    self.documentCamera = [[RNDocumentCamera alloc] init];
    self.videoEditor = [[RTKVideoEditor alloc] init];
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

RCT_REMAP_METHOD(openDocumentCamera,
                 withOptions: (NSDictionary *)options
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.documentCamera openDocumentCamera:options
                                completion:^(NSString *error, NSDictionary *result) {
            if (error == nil) {
                resolve(result);
            } else {
                reject(@"ERROR", error, nil);
            }
        }];
    });
}

RCT_REMAP_METHOD(openVideoEditor,
                 withOptions: (NSDictionary *)options
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.videoEditor openWithOptions:options
                                completion:^(NSString *error, NSDictionary *result) {
            if (error == nil) {
                resolve(result);
            } else {
                reject(@"ERROR", error, nil);
            }
        }];
    });
}

@end
