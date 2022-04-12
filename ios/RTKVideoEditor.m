#import <UIKit/UIKit.h>
#import <React/RCTUtils.h>
#import <React/RCTConvert.h>
#import <Foundation/Foundation.h>
#import "RTKVideoEditor.h"

static NSString* const TMP_DIRECTORY = @"react-native-kit/";

@interface RTKVideoEditor() <UIVideoEditorControllerDelegate>

@property (nonatomic, copy) NSDictionary *options;
@property (nonatomic, copy) NSString *directory;
@property (nonatomic, copy) void (^completion)(NSString *error, NSDictionary *result);

@end


@implementation RTKVideoEditor

- (instancetype)init {
    if ((self = [super init])) {
        self.directory = [NSTemporaryDirectory() stringByAppendingString:TMP_DIRECTORY];
    }
    return self;
}

- (void) openWithOptions:(NSDictionary *)options completion:(void (^)(NSString *, NSDictionary *))completion {
    self.options = options;
    self.completion = completion;
    int maxDuration = options[@"maxDuration"] ?: 1;
    float quality = options[@"quality"] ?: 1;
    NSString path = options[@"source"];
    
    if (path == nil) {
        self.completion(@"Source cannot be nil", nil);
        return;
    }
    
    UIVideoEditorController *videoEditorController = [UIVideoEditorController new];
    
    videoEditorController.videoPath = path;
    videoEditorController.videoMaximumDuration = maxDuration;
    videoEditorController.videoQuality = maxDuration;
    videoEditorController.delegate = self;

    UIViewController *rootViewController = RCTPresentedViewController();
    [rootViewController presentViewController:videoEditorController animated:YES completion:nil];
}

#pragma mark - UIVideoEditorControllerDelegate

- (void)videoEditorController:(UIVideoEditorController *)editor didSaveEditedVideoToPath:(NSString *)editedVideoPath {
    NSLog(@"+++++++++++++++%@",editedVideoPath);
    self.completion(nil, @{ @"uri": editedVideoPath });
}
 
- (void)videoEditorController:(UIVideoEditorController *)editor didFailWithError:(NSError *)error {
     self.completion(error.localizedDescription, nil);
}

@end
