#include <ObjFW/ObjFW.h>
#include "WLObject.h"

@class WLBuffer;

@protocol WLSurfaceDelegate
- (void) enter;
- (void) leave;
- (void) preferredBufferScale: (int)factor;
- (void) preferredBufferTransform: (int)transform;
@end

@interface WLSurface : WLObject {
    struct wl_surface *_surface;
}

@property (assign) id<WLSurfaceDelegate> delegate;

- (void) attach: (WLBuffer*)buffer position:(OFPoint) position;
- (void) commit;
@end


