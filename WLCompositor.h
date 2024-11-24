#include <ObjFW/ObjFW.h>
#include <wayland-client.h>
#include "WLObject.h"

@class WLSurface;
@interface WLCompositor : WLObject {
    struct wl_compositor *_compositor;
}

+ (instancetype) sharedInstance;

- (void*) nativeInterface;

- (WLSurface*) createSurface;
@end
