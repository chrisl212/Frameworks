#import <stdio.h>
#import <stdlib.h>
#import <objc/runtime.h>
#import "NSObject.h"

@implementation NSObject

+ (Class)class {
    return self;
}

+ (Class)superclass {
    return class_getSuperclass(self);
}

+ (BOOL)isSubclassOfClass:(Class)c {
    return class_getSuperclass(self) == c;
}

+ (id)alloc {
    NSObject *o = class_createInstance(self, 0);
    o->isa = self;
    o->retainCount = 1;
    return o;
}

+ (id)new {
    return [[self alloc] init];
}

+ (BOOL)conformsToProtocol:(Protocol *)p {
    return class_conformsToProtocol(self, p);
}

- (id)init {
    return self;
}

- (void)release {
    if (--retainCount <= 0) {
        [self dealloc];
    }
}

- (int32_t)retain {
    return retainCount++;
}

- (int32_t)retainCount {
    return retainCount;
}

- (void)dealloc {
    free(self);
}

- (void)doesNotRecognizeSelector:(SEL)sel {
    const char *selectorName = sel_getName(sel);
    const char *className = class_getName(isa);

    fprintf(stderr, "objc: class %s does not recognize selector %s.\n", className, selectorName);
}

- (NSString *)description {
    return nil;
}

- (BOOL)isKindOfClass:(Class)c {
    return c == isa;
}

- (BOOL)isEqual:(id)o {
    return self == o;    
}

- (IMP)methodForSelector:(SEL)s {
    return class_getMethodImplementation(isa, s);
}

@end
