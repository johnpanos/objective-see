#include <ObjFW/ObjFW.h>
#include "WLRegistry.h"
#include "WLDisplay.h"
#include "WLCompositor.h"
#include <wayland-client-protocol.h>
#include <wayland-client.h>

static const OFMutableDictionary* kInterfaceToClassDict = nil;

@implementation WLRegistry
static void
registry_handle_global(void *data, struct wl_registry *registry,
		uint32_t name, const char *interface, uint32_t version)
{
    WLRegistry *wlRegistry = (__bridge WLRegistry*) data;
    OFString *key = [OFString stringWithUTF8String:interface];
    [wlRegistry forKey:key withObjId:name withVersion:version];
}

static void
registry_handle_global_remove(void *data, struct wl_registry *registry,
		uint32_t name)
{
	// This space deliberately left blank
	WLRegistry *wlRegistry = (__bridge WLRegistry*) data;
	OFNumber *objId = [OFNumber numberWithUnsignedInt:name];

	[wlRegistry removeObjId: objId];
}

static const struct wl_registry_listener
registry_listener = {
	.global = registry_handle_global,
	.global_remove = registry_handle_global_remove,
};

- initWithDisplay:(WLDisplay *)display {
    if (kInterfaceToClassDict == nil) {
        kInterfaceToClassDict = [OFMutableDictionary dictionary];
        kInterfaceToClassDict[@"wl_compositor"] = [WLCompositor class];
    }

    if (self = [super init]) {
        _registry = wl_display_get_registry([display nativeDisplay]);
        wl_registry_add_listener(_registry, &registry_listener, self);
    }

    return nil;
}

- (void)forKey:(OFString *)key withObjId:(uint32_t)objId withVersion:(uint32_t)version {
    Class klass = kInterfaceToClassDict[key];

    if (klass) {
        WLObject *obj = [klass alloc];

        void* interfaceStruct = [obj nativeInterface];
        void *interface = wl_registry_bind(_registry, objId, interfaceStruct, version);
        [[obj initWithObjId:objId] initWithObj:interface];
    }
}

- (void) removeObjId:(OFNumber *)objId {
    WLObject *obj = [WLObject objectForId:objId];
    [obj dealloc];
}
@end
