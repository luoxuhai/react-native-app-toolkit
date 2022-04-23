#import <React/RCTConvert.h>
#import <QuickLookThumbnailing/QLThumbnailGenerationRequest.h>
@import UIKit;

@interface RCTConvert(RNToolkit)

+ (UIModalPresentationStyle)UIModalPresentationStyle:(NSString*)value;
+ (UIModalTransitionStyle)UIModalTransitionStyle:(NSString*)value;
+ (UIImagePickerControllerQualityType)UIImagePickerControllerQualityType:(NSString*)value;
+ (QLThumbnailGenerationRequestRepresentationTypes)QLThumbnailGenerationRequestRepresentationTypes:(NSString*)value API_AVAILABLE(ios(13.0));

@end
