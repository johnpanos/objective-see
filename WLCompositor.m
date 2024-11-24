#include <ObjFW/ObjFW.h>
#include <wayland-client-protocol.h>
#include <wayland-client.h>
#include "WLCompositor.h"
#include "WLSurface.h"

@implementation WLCompositor
- (instancetype)initWithObj:(void *)obj {
    _compositor = obj;
    return self;
}

- (WLSurface*) createSurface {
    struct wl_surface *surface = wl_compositor_create_surface(_compositor);
    WLSurface *oSurface = [[WLSurface alloc] initWithObj:surface];

    [oSurface retain];

    return oSurface;
}

- (void*) nativeInterface {
    return (void*)&wl_compositor_interface;
}
@end
