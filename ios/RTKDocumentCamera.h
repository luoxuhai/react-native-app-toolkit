#import <React/RCTBridgeModule.h>

typedef NS_ENUM(NSInteger, RTKDocumentCameraResultType) {
    RTKResultPdf,
    RTKResultImage
};

@interface RTKDocumentCamera : NSObject <RCTBridgeModule>

@end
