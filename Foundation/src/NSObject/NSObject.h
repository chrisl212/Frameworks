/*
 * @file NSObject.h
 * @author Chris Loonam
 * @brief Root class for all objects
 *
 *
 *
 *
*/

#import <objc/objc.h>

@class NSString;

@interface NSObject {
    Class isa;
    int32_t retainCount;
}

+ (Class)class;
+ (Class)superclass;
+ (BOOL)isSubclassOfClass:(Class)c;
+ (id)alloc;
+ (id)new;
+ (BOOL)conformsToProtocol:(Protocol *)p;

- (id)init;
- (void)release;
- (int32_t)retain;
- (int32_t)retainCount;
- (void)dealloc;
- (void)doesNotRecognizeSelector:(SEL)sel;
- (NSString *)description;
- (BOOL)isKindOfClass:(Class)c;
- (BOOL)isEqual:(id)o;
- (IMP)methodForSelector:(SEL)s;

@end
