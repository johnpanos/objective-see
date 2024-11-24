#include <ObjFW/ObjFW.h>
#include "WLDisplay.h"
#include "WLObject.h"
#include "WLSurface.h"

int main() {
    WLDisplay *display = [[WLDisplay alloc] init];
    [display roundtrip];

    for (WLObject *obj in [WLObject allObjects]) {
        [OFStdOut writeLine: [OFString stringWithFormat: @"Found object %@", [obj className]]];

        WLSurface *surface = [obj createSurface];
         [OFStdOut writeLine: [OFString stringWithFormat: @"Found object %@", [surface className]]];
    }


    return 0;
}
