#import <QuickLookThumbnailing/QLThumbnailGenerationRequest.h>
#import <QuickLookThumbnailing/QLThumbnailGenerator.h>
#import "RTKThumbnailGenerator.h"
#import "RCTConvert+RNToolkit.h"

static NSString* const TMP_DIRECTORY = @"react-native-kit/";

@interface RTKThumbnailGenerator() <UIVideoEditorControllerDelegate>

@property (nonatomic, copy) NSString *directory;

@end


@implementation RTKThumbnailGenerator

- (id)init {
    if ((self = [super init])) {
        self.directory = [NSTemporaryDirectory() stringByAppendingString:TMP_DIRECTORY];
    }
    return self;
}

RCT_EXPORT_MODULE(RTKThumbnailGenerator)

RCT_EXPORT_METHOD(generate:(NSDictionary *)options
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    if (@available(iOS 14.0, *)) {
        NSURL *url = [NSURL fileURLWithPath:options[@"path"]];
        CGFloat scale = [options[@"scale"] floatValue] ?: UIScreen.mainScreen.scale;
        CGSize size = {[options[@"width"] floatValue], [options[@"height"] floatValue]};
        NSString *dest = [NSString stringWithFormat:@"%@%@.%@", self.directory, [[NSUUID UUID] UUIDString], @"jpg"];
        NSURL *toFileAtURL = [NSURL fileURLWithPath:options[@"toFileAtURL"] ?: dest ];
        BOOL iconMode = [options[@"iconMode"] boolValue] ?: NO;
        CGFloat minimumDimension = [options[@"minimumDimension"] floatValue] ?: 0;
        
        QLThumbnailGenerationRequestRepresentationTypes representationType = [RCTConvert QLThumbnailGenerationRequestRepresentationTypes:options[@"representationType"]];


        QLThumbnailGenerationRequest *request = [[QLThumbnailGenerationRequest alloc] initWithFileAtURL:url
                                                                               size:size
                                                                              scale:scale
                                                                representationTypes:representationType];
        request.iconMode = iconMode;
        request.minimumDimension = minimumDimension;
        
        [QLThumbnailGenerator.sharedGenerator saveBestRepresentationForRequest:request
                                                                   toFileAtURL:toFileAtURL
                                                               withContentType:UTTypeJPEG.identifier
                                                             completionHandler:^(NSError * _Nullable error) {
            if (error) {
                reject(@"ERROR", error.localizedDescription, error);
            } else {
                resolve(@{
                    @"path": [toFileAtURL absoluteString]
                });
            }
        }];
        
    } else {
        reject(@"ERROR", @"Only available on iOS 13.0 or newer", nil);
    }
}

@end
