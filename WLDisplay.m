#include "WLDisplay.h"
#include "WLRegistry.h"
#include "wayland-client.h"
#include <wayland-client-core.h>

@implementation WLDisplay
- init {
    self = [super init];
    if (!self) {
        return nil;
    }

    _display = wl_display_connect(NULL);
    _registry = [[WLRegistry alloc] initWithDisplay: self];

    return self;
}

- (struct wl_display*) nativeDisplay {
    return _display;
}

- (void) roundtrip {
    wl_display_roundtrip(_display);
}

- (WLRegistry*) registry {
    return _registry;
}
@end
