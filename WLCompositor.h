#include <ObjFW/ObjFW.h>
#include <wayland-client.h>
#include "WLObject.h"

@interface WLCompositor : WLObject {
    struct wl_compositor *_compositor;
}

- (void*) nativeInterface;
@end
