#include <ObjFW/ObjFW.h>
#include "WLDisplay.h"
#include "WLObject.h"
#include "WLSurface.h"
#include "WLCompositor.h"

int main() {
    WLDisplay *display = [[WLDisplay alloc] init];
    [display roundtrip];

    for (WLObject *obj in [WLObject allObjects]) {
        [OFStdOut writeLine: [OFString stringWithFormat: @"Found object %@", [obj className]]];
    }

    WLSurface *surface = [[WLCompositor sharedInstance] createSurface];
    [OFStdOut writeLine: [OFString stringWithFormat: @"Surface obj %@", [surface className]]];

    return 0;
}
