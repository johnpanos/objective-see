#import <ObjFW/ObjFW.h>
#include <wayland-client.h>
#include "WLSurface.h"

@implementation WLSurface
@synthesize delegate;

- (void) attach:(WLBuffer *)buffer position:(OFPoint)position {
}

- (void) commit {
    wl_surface_commit(_surface);
}
@end
