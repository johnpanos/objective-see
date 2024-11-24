#pragma once
#include <ObjFW/OFArray.h>
#import <ObjFW/ObjFW.h>

@interface WLObject : OFObject
@property (nonatomic, retain) OFNumber *objId;
@property (nonatomic, retain) OFNumber *version;

- (instancetype) initWithObjId: (uint32_t)objId;
- (instancetype) initWithObj: (void*)obj;
- (void*) nativeInterface;

+ (OFArray*) allObjects;
@end
