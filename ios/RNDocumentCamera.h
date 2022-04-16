typedef NS_ENUM(NSInteger, RTKDocumentCameraResultType) {
    RTKResultPdf,
    RTKResultImage
};

@interface RNDocumentCamera : NSObject

- (void)openDocumentCamera:(NSDictionary *)options
                          completion:(void (^)(NSString *error, NSDictionary *result))completion;

- (BOOL)isSupported;

@end
