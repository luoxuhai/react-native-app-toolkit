#import <Foundation/Foundation.h>

@interface RNMediaLibrary : NSObject

-(NSDictionary *)getVideoThumbnail:(nonnull NSString*)path
                       withOptions:(nullable NSDictionary *)options;

@end
