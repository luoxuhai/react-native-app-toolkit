#import <VisionKit/VisionKit.h>
#import <PDFKit/PDFKit.h>
#import <React/RCTUtils.h>
#import <React/RCTConvert.h>
#import "RTKDocumentCamera.h"

static NSString* const TMP_DIRECTORY = @"react-native-kit/";

@implementation RCTConvert (RTKDocumentCameraResultType)

RCT_ENUM_CONVERTER(
    RTKDocumentCameraResultType,
    (@{
      @"pdf" : @(RTKResultPdf),
      @"image" : @(RTKResultImage)
    }),
    RTKResultPdf,
    integerValue)
@end

@interface RTKDocumentCamera() <VNDocumentCameraViewControllerDelegate>

@property (nonatomic, copy) NSDictionary *options;
@property (nonatomic, copy) NSString *directory;
@property (nonatomic, copy) RCTPromiseResolveBlock resolve;
@property (nonatomic, copy) RCTPromiseRejectBlock reject;

@end

@implementation RTKDocumentCamera

- (instancetype)init {
    if ((self = [super init])) {
        self.directory = [NSTemporaryDirectory() stringByAppendingString:TMP_DIRECTORY];
    }
    return self;
}

RCT_EXPORT_MODULE(RTKDocumentCamera)

RCT_EXPORT_METHOD(openDocumentCamera:(NSDictionary *)options
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    self.resolve = resolve;
    self.reject = reject;
    self.options = options;

    dispatch_async(dispatch_get_main_queue(), ^{
        if (@available(iOS 13.0, *)) {
            if (VNDocumentCameraViewController.isSupported) {
                VNDocumentCameraViewController* documentCameraViewController = [[VNDocumentCameraViewController alloc] init];
                
                documentCameraViewController.delegate = self;
                
                UIViewController *rootViewController = RCTPresentedViewController();
                [rootViewController presentViewController:documentCameraViewController animated:YES completion:nil];
            } else {
                self.reject(@"ERROR",@"The current device doesn't support document scanning", nil);
            }
        } else {
            self.reject(@"ERROR", @"Only available on iOS 13.0 or newer", nil);
        }
    });
}

RCT_EXPORT_METHOD(isSupported:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    if (@available(iOS 13.0, *)) {
        resolve(@(VNDocumentCameraViewController.isSupported));
    } else {
        resolve(@(NO));
    }
}

- (void) dismissViewController: (VNDocumentCameraViewController *)controller  API_AVAILABLE(ios(13.0)){
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *) imagesToPDF: (NSMutableArray *)images {
    PDFDocument *pdfDocument = [PDFDocument new];
    
    for (int i = 0; i < images.count; i++) {
        PDFPage *pdfPage = [[PDFPage alloc] initWithImage:images[i]];
        [pdfDocument insertPage:pdfPage atIndex:i];
    }
    NSData *data = [pdfDocument dataRepresentation];
    NSString *dest = [NSString stringWithFormat:@"%@%@.%@", self.directory, [[NSUUID UUID] UUIDString], @"pdf"];
    if (![data writeToFile:dest atomically:YES]) {
        self.reject(@"ERROR", @"Can't write to file.", nil);
        return nil;
    }
    return dest;
}

#pragma mark - VNDocumentCameraViewControllerDelegate

- (void)documentCameraViewController:(VNDocumentCameraViewController *)controller didFinishWithScan:(VNDocumentCameraScan *)scan  API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)){
    NSString *typeStr = self.options[@"type"];
    RTKDocumentCameraResultType type = [RCTConvert RTKDocumentCameraResultType:typeStr];
    
    NSMutableArray *images = [NSMutableArray new];
    for (int i = 0; i < [scan pageCount]; i++) {
        UIImage* image = [scan imageOfPageAtIndex:i];
        [images addObject:image];
    }
    
    if (type == RTKResultImage) {
        NSMutableArray *source = [NSMutableArray new];
        NSNumber *quality = self.options[@"quality"];
        
        for (int i = 0; i < [images count]; i++) {
            NSString *dest = [NSString stringWithFormat:@"%@%@.%@", self.directory, [[NSUUID UUID] UUIDString], @"jpg"];
            NSData *data = UIImageJPEGRepresentation(images[i], [quality floatValue]);
            if (![data writeToFile:dest atomically:YES]) {
                self.reject(@"ERROR", @"Can't write to file.", nil);
                [self dismissViewController:controller];
                return;
            }
            [source addObject:dest];
        }
        self.resolve(@{
            @"type":self.options[@"type"],
            @"source":source
        });
    } else {
       NSString *pdfPath = [self imagesToPDF:images];
        if (pdfPath) {
            self.resolve(@{
                @"type":self.options[@"type"],
                @"source":pdfPath
            });
        }
    }

    [self dismissViewController:controller];
}

- (void)documentCameraViewControllerDidCancel:(VNDocumentCameraViewController *)controller  API_AVAILABLE(ios(13.0)){
    [self dismissViewController:controller];
}

- (void)documentCameraViewController:(VNDocumentCameraViewController *)controller didFailWithError:(NSError *)error API_AVAILABLE(ios(13)){
    self.reject(@"ERROR", error.localizedDescription, error);
    [self dismissViewController:controller];
}

@end
