#import <ObjFW/ObjFW.h>
#include "WLObject.h"

@class WLDisplay;
@interface WLRegistry : OFObject {
    struct wl_registry *_registry;
    OFMutableDictionary<OFString*, WLObject*> *objects;
}

- (instancetype) initWithDisplay: (WLDisplay *) display;

- (void) forKey: (OFString*) key
        withObjId: (uint32_t) objId
        withVersion: (uint32_t) version;

// - (id) instanceForKey: (OFString*) key;
@end
