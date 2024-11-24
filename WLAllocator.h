#import <ObjFW/ObjFW.h>

@class WLBuffer;
@protocol WLAllocator
+ (WLBuffer*) createBuffer;
@end
