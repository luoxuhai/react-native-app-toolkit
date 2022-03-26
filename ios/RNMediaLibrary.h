//
//  RNMediaLibrary.h
//
#import <Foundation/Foundation.h>

@interface RNMediaLibrary : NSObject

@property (nonatomic, copy) NSString *directory;

-(NSDictionary *)getVideoThumbnail:(nonnull NSString*)path
                       withOptions:(NSDictionary *)options;

@end
