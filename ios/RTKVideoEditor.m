#import <UIKit/UIKit.h>
#import <React/RCTUtils.h>
#import <React/RCTConvert.h>
#import <Foundation/Foundation.h>
#import "RTKVideoEditor.h"

static NSString* const TMP_DIRECTORY = @"react-native-kit/";

@interface RTKVideoEditor() <UIVideoEditorControllerDelegate>

@property (nonatomic, copy) NSString *directory;
@property (nonatomic, copy) RCTPromiseResolveBlock resolve;
@property (nonatomic, copy) RCTPromiseRejectBlock reject;

@end


@implementation RTKVideoEditor

- (instancetype)init {
    if ((self = [super init])) {
        self.directory = [NSTemporaryDirectory() stringByAppendingString:TMP_DIRECTORY];
    }
    return self;
}

RCT_EXPORT_MODULE(RTKVideoEditor)

RCT_EXPORT_METHOD(openVideoEditor:(NSDictionary *)options
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    self.resolve = resolve;
    self.reject = reject;
    int maxDuration = [options[@"maxDuration"] intValue] ?: 1;
   // float quality = [options[@"quality"] floatValue] ?: 1;
    NSString *path = options[@"source"];
    
    if (path == nil) {
        reject(@"ERROR", @"Source cannot be nil", nil);
        return;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        UIVideoEditorController *videoEditorController = [UIVideoEditorController new];
        
        videoEditorController.videoPath = path;
        videoEditorController.videoMaximumDuration = maxDuration;
        videoEditorController.videoQuality = maxDuration;
        videoEditorController.delegate = self;

        UIViewController *rootViewController = RCTPresentedViewController();
        [rootViewController presentViewController:videoEditorController animated:YES completion:nil];
    });
}


- (void) openWithOptions:(NSDictionary *)options completion:(void (^)(NSString *, NSDictionary *))completion {

}

#pragma mark - UIVideoEditorControllerDelegate

- (void)videoEditorController:(UIVideoEditorController *)editor didSaveEditedVideoToPath:(NSString *)editedVideoPath {
    NSLog(@"+++++++++++++++%@",editedVideoPath);
    self.resolve(@{ @"uri": editedVideoPath });
}
 
- (void)videoEditorController:(UIVideoEditorController *)editor didFailWithError:(NSError *)error {
    self.reject(@"ERROR", error.localizedDescription, nil);
}

@end
