#include <ObjFW/ObjFW.h>
#include <wayland-client-protocol.h>
#include <wayland-client.h>
#include "WLCompositor.h"

@implementation WLCompositor
- (instancetype)withObj:(void *)obj {
    _compositor = obj;
    return self;
}

- (WLSurface*) createSurface {
//     wl_compositor_create_surface(_compositor);
    return nil;
}

- (void*) nativeInterface {
    return (void*)&wl_compositor_interface;
}
@end
