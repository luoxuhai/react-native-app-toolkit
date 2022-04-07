//
//  RNQuickLookView.m
//  RNToolkit
//
//  Created by 罗绪海 on 2022/4/7.
//

#import <QuickLook/QuickLook.h>
#import "RNQuickLookView.h"

@interface RNQuickLookView () <QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@property UIView* previewView;
@property QLPreviewController* controller;

@end


@implementation RNQuickLookView

- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.controller = [[QLPreviewController alloc] init];
    self.controller.delegate = self;
    self.controller.dataSource = self;
    self.previewView = self.controller.view;
    self.previewView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.controller.view.backgroundColor = UIColor.blackColor;
    self.controller.automaticallyAdjustsScrollViewInsets = NO;
    [self addSubview:self.previewView];
}

- (id)initWithPreviewItemUrl:(NSString*)url {
    NSAssert(url != nil, @"Preview Item URL cannot be nil");
    self = [super init];
    if (self) {
        _url = url;
        [self initialize];
    }
    return self;
}

- (void)setUrl:(NSString *)urlString {
  _url = [urlString stringByRemovingPercentEncoding];
  [self.controller refreshCurrentPreviewItem];
  [self.controller reloadData];
}

#pragma mark - QLPreviewControllerDataSource

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return [NSURL fileURLWithPath:_url];
}

#pragma mark - QLPreviewControllerDelegate

- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [self.controller didReceiveMemoryWarning];
}

@end
