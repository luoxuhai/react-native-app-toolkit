@interface RTKDocumentInteraction : NSObject

- (void)openWithOptions:(NSDictionary *)options
                          completion:(void (^)(NSString *error, NSDictionary *result))completion;

@end
