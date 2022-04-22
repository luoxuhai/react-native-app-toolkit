#import "RCTConvert+RNToolkit.h"

@implementation RCTConvert(RNToolkit)

+ (UIModalPresentationStyle)defaultModalPresentationStyle {
    if (@available(iOS 13.0, *)) {
        return UIModalPresentationAutomatic;
    } else {
        return UIModalPresentationFullScreen;
    }
}

RCT_ENUM_CONVERTER(UIModalTransitionStyle, (@{
                       @"coverVertical" : @(UIModalTransitionStyleCoverVertical),
                       @"flipHorizontal" : @(UIModalTransitionStyleFlipHorizontal),
                       @"crossDissolve" : @(UIModalTransitionStyleCrossDissolve),
                       @"partialCurl" : @(UIModalTransitionStylePartialCurl)
                   }),
                   UIModalTransitionStyleCoverVertical, integerValue)

RCT_ENUM_CONVERTER(UIModalPresentationStyle, (@{
                       @"fullScreen" : @(UIModalPresentationFullScreen),
                       @"pageSheet" : @(UIModalPresentationPageSheet),
                       @"formSheet" : @(UIModalPresentationFormSheet),
                       @"currentContext" : @(UIModalPresentationCurrentContext),
                       @"custom" : @(UIModalPresentationCustom),
                       @"overFullScreen" : @(UIModalPresentationOverFullScreen),
                       @"overCurrentContext" : @(UIModalPresentationOverCurrentContext),
                       @"popover" : @(UIModalPresentationPopover),
                       @"none" : @(UIModalPresentationNone),
                       @"default" : @([RCTConvert defaultModalPresentationStyle])
                   }),
                   UIModalPresentationFullScreen, integerValue)

RCT_ENUM_CONVERTER(UIImagePickerControllerQualityType,(@{
                      @"high" : @(UIImagePickerControllerQualityTypeHigh),
                      @"640x480" : @(UIImagePickerControllerQualityType640x480),
                      @"medium" : @(UIImagePickerControllerQualityTypeMedium),
                      @"low" : @(UIImagePickerControllerQualityTypeLow),
                      @"iFrame1280x720" : @(UIImagePickerControllerQualityTypeIFrame1280x720),
                      @"iFrame960x540" : @(UIImagePickerControllerQualityTypeIFrame960x540),
                    }),
                   UIImagePickerControllerQualityTypeHigh, integerValue)

@end
