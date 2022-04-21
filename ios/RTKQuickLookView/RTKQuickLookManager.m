#import "RTKQuickLookManager.h"
#import "RTKQuickLookView.h"
#import <QuickLook/QuickLook.h>

@implementation RTKQuickLookManager

RCT_EXPORT_MODULE(RTKQuickLookView)

- (UIView *) view  {
    return [[RTKQuickLookView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(url, NSString)

@end
