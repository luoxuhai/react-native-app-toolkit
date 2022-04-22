#import <React/RCTConvert.h>
@import UIKit;

@interface RCTConvert(RNToolkit)

+ (UIModalPresentationStyle)UIModalPresentationStyle:(NSString*)value;
+ (UIModalTransitionStyle)UIModalTransitionStyle:(NSString*)value;
+ (UIImagePickerControllerQualityType)UIImagePickerControllerQualityType:(NSString*)value;

@end
