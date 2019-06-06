#import <string.h>
#import <stdarg.h>
#import "NSString.h"

@implementation NSString

- (NSString *)initWithFormat:(NSString *)fmt args:(va_list)args {
    return nil;
}

+ (id)string {
    return [self stringWithUTF8String:""];
}

+ (id)stringWithUTF8String:(const char *)str {
    return [[self alloc] initWithUTF8String:str];
}

+ (id)stringWithString:(NSString *)str {
    return [self stringWithUTF8String:str->c_str];
}

+ (id)stringWithContentsOfFile:(NSString *)path error:(NSError **)error {
    return [[self alloc] initWithContentsOfFile:path error:error];
}

+ (id)stringWithFormat:(NSString *)fmt, ... {
    va_list lst;
    NSString *ret;

    va_start(lst, fmt);
    ret = [[self alloc] initWithFormat:fmt args:lst];
    va_end(lst);
    return ret;
}

- (id)initWithUTF8String:(const char *)str {
    if (self = [super init]) {
        c_str = strdup(str);
    }
    return self;
}

- (id)initWithString:(NSString *)str {
    return [self initWithUTF8String:str->c_str];
}

- (id)initWithContentsOfFile:(NSString *)path error:(NSError **)error {

}

- (id)initWithFormat:(NSString *)fmt, ... {
    va_list lst;

    va_start(lst, fmt);
    [self initWithFormat:fmt args:lst];
    va_end(lst);
    return self;
}

- (NSInteger)length {
    return (NSInteger)strlen(c_str);
}

- (char *)UTF8String {
    return strdup(c_str);
}

- (BOOL)isEqualToString:(NSString *)str {
    return strcmp(c_str, str->c_str) == 0;
}

- (void)appendString:(NSString *)str {
    size_t newLen;

    newLen = self.length + str.length + 1;
    c_str = realloc(c_str, sizeof(*c_str) * newLen);
    strcat(c_str, str->c_str);
}

- (void)writeToFile:(NSString *)path error:(NSError **)error {

}

- (NSArray *)componentsSeparatedByString:(NSString *)str {
    return nil;
}

@end
