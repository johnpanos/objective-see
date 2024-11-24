#include "WLObject.h"
#include <ObjFW/OFMutableDictionary.h>

static const OFMutableDictionary* wlObjectDict = nil;

@implementation WLObject
- (instancetype)initWithObjId:(uint32_t)objId {
    self.objId = [OFNumber numberWithUnsignedInt:objId];

    @synchronized(wlObjectDict) {
        if (!wlObjectDict) {
            wlObjectDict = [OFMutableDictionary dictionary];
        }

        [wlObjectDict setObject:self forKey: self.objId];
    }

    return self;
}

- (instancetype)initWithObj:(void*)obj {
    return self;
}

- (void*) nativeInterface {
    return nil;
}

+ (OFArray*) allObjects {
    return [wlObjectDict allObjects];
}

+ (WLObject*) objectForId: (OFNumber*) objId {
    return [wlObjectDict objectForKey:objId];
}
@end
