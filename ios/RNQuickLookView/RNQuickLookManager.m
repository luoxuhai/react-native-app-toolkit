//
//  RNQuickLookManager.m
//  RNToolkit
//
//  Created by 罗绪海 on 2022/4/7.
//

#import "RNQuickLookManager.h"
#import "RNQuickLookView.h"
#import <QuickLook/QuickLook.h>

@implementation RNQuickLookManager

RCT_EXPORT_MODULE(RNQuickLookView)

- (UIView *) view  {
    return [[RNQuickLookView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(url, NSString)
RCT_EXPORT_VIEW_PROPERTY(assetFileName, NSString)

@end
