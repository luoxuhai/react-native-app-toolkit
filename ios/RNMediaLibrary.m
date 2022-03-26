#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAsset.h>
#import <UIKit/UIKit.h>
#import "RNMediaLibrary.h"

static NSString* const OPTIONS_KEY_QUALITY = @"quality";
static NSString* const OPTIONS_KEY_TIME = @"time";
static NSString* const OPTIONS_KEY_INCLUDE_SIZE = @"includeSize";
static NSString* const TMP_DIRECTORY = @"react-native-kit/";
static NSString* const OPTIONS_KEY_HEADERS = @"headers";

@implementation RNMediaLibrary

-(id)init {
    [self initTempDir];
    return self;
}

-(void)initTempDir {
    self.directory = [NSTemporaryDirectory() stringByAppendingString:TMP_DIRECTORY];
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    BOOL isDir = YES;
    BOOL exists = [fileManager fileExistsAtPath:self.directory isDirectory:&isDir];
    if (!exists) {
        [fileManager createDirectoryAtPath: self.directory
                                  withIntermediateDirectories:YES attributes:nil error:nil];
     }
}

-(NSDictionary *)getVideoThumbnail:(nonnull NSString *)path
withOptions:(NSDictionary *)options
{
    NSURL *url = [NSURL URLWithString:path];
    long timeOption = [options[OPTIONS_KEY_TIME] integerValue] ?: 0;
    float quality = [options[OPTIONS_KEY_QUALITY] floatValue] ?: 0;
    BOOL includeSize = [options[OPTIONS_KEY_INCLUDE_SIZE] boolValue] ?: NO;
    NSDictionary *headers = options[OPTIONS_KEY_HEADERS] ?: @{};

    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:@{@"AVURLAssetHTTPHeaderFieldsKey": headers}];

    AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    generator.appliesPreferredTrackTransform = YES;
    generator.requestedTimeToleranceBefore = kCMTimeZero;
    generator.requestedTimeToleranceAfter = kCMTimeZero;
    
    NSError *err = NULL;
    CMTime time = CMTimeMake(timeOption, 1000);
    
    CGImageRef imgRef = [generator copyCGImageAtTime:time actualTime:NULL error:&err];
    if (err) {
        return @{
            @"error": err.localizedFailureReason,
        };
     }
    
    UIImage *thumbnail = [UIImage imageWithCGImage:imgRef];
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@".jpg"];
    NSString *dest = [self.directory stringByAppendingString:fileName];

    NSData *data = UIImageJPEGRepresentation(thumbnail, quality);

    if (![data writeToFile:dest atomically:YES]) {
        return @{
            @"error": @"Can't write to file.",
        };
    }
    
    NSNumber *fileSize = nil;

    if (includeSize) {
        [[NSURL fileURLWithPath:dest] getResourceValue:&fileSize
                             forKey:NSURLFileSizeKey
                              error:nil];
    }

    CGImageRelease(imgRef);
    
    return @{
        @"uri": dest,
        @"width": @(thumbnail.size.width),
        @"height": @(thumbnail.size.height),
        @"size": (fileSize) ?: [NSNull null]
    };
}

@end
