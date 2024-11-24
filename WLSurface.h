#include <ObjFW/ObjFW.h>

@class WLBuffer;

@protocol WLSurfaceDelegate
- (void) enter;
- (void) leave;
- (void) preferredBufferScale: (int)factor;
- (void) preferredBufferTransform: (int)transform;
@end

@interface WLSurface : OFObject

@property (weak) id<WLSurfaceDelegate> delegate;

- (void) attach: (WLBuffer*)buffer position:(OFPoint) position;
- (void) commit;
@end


