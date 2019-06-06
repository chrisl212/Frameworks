#import "../Foundation.h"

@class NSError, NSArray;

@interface NSString : NSObject {
    char *c_str;
}

+ (id)string;
+ (id)stringWithUTF8String:(const char *)str;
+ (id)stringWithString:(NSString *)str;
+ (id)stringWithContentsOfFile:(NSString *)path error:(NSError **)error;
+ (id)stringWithFormat:(NSString *)fmt, ...;

- (id)initWithUTF8String:(const char *)str;
- (id)initWithString:(NSString *)str;
- (id)initWithContentsOfFile:(NSString *)path error:(NSError **)error;
- (id)initWithFormat:(NSString *)fmt, ...;
- (NSInteger)length;
- (char *)UTF8String;
- (BOOL)isEqualToString:(NSString *)str;
- (void)appendString:(NSString *)str;
- (void)writeToFile:(NSString *)path error:(NSError **)error;
- (NSArray *)componentsSeparatedByString:(NSString *)str;

@end
