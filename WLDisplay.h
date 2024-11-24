#import <ObjFW/ObjFW.h>
#include <wayland-client.h>

@class WLRegistry;
@interface WLDisplay : OFObject {
    struct wl_display *_display;
    WLRegistry *_registry;
}
- (struct wl_display*) nativeDisplay;
- (void) roundtrip;
- (WLRegistry *) registry;
@end
