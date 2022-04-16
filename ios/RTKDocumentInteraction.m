#import <UIKit/UIKit.h>
#import <React/RCTUtils.h>
#import <React/RCTConvert.h>
#import <Foundation/Foundation.h>
#import "RTKDocumentInteraction.h"

static NSString* const TMP_DIRECTORY = @"react-native-kit/";

@interface RTKDocumentInteraction() <UIDocumentInteractionControllerDelegate>

@property (nonatomic, copy) NSDictionary *options;
@property (nonatomic, copy) NSString *directory;
@property (nonatomic, copy) void (^completion)(NSString *error, NSDictionary *result);

@end


@implementation RTKDocumentInteraction

- (instancetype)init {
    self = [super init];
    return self;
}

- (void) openWithOptions:(NSDictionary *)options completion:(void (^)(NSString *, NSDictionary *))completion {
    self.options = options;
    self.completion = completion;
    NSString *filePath = options[@"path"];
    
    if (filePath == nil) {
        self.completion(@"Path cannot be nil", nil);
        return;
    }
    
    UIDocumentInteractionController *documentInteractionController = [UIDocumentInteractionController  interactionControllerWithURL:[NSURL URLWithString:filePath]];
    
    documentInteractionController.delegate = self;

    UIViewController *rootViewController = RCTPresentedViewController();
    [documentInteractionController presentOpenInMenuFromRect:CGRectZero inView:rootViewController.view animated:YES];
  //  [rootViewController presentViewController:documentInteractionController animated:YES completion:nil];
}

#pragma mark - UIDocumentInteractionControllerDelegate

- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(NSString *)application {
    
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller didEndSendingToApplication:(NSString *)application {
    
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller {
    
}

@end
