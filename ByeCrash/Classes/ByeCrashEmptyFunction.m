//
//  ByeCrashEmptyFunction.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "ByeCrashEmptyFunction.h"
#import <objc/runtime.h>

int smartFunction(id target, SEL cmd, ...) {
    return 0;
}

@implementation ByeCrashEmptyFunction
    
- (BOOL)addFunc:(SEL)sel {
    NSString *selName = NSStringFromSelector(sel);
    
    NSMutableString *tmpString = [[NSMutableString alloc] initWithFormat:@"%@", selName];
    
    int count = (int)[tmpString replaceOccurrencesOfString:@":"
                                                withString:@"_"
                                                   options:NSCaseInsensitiveSearch
                                                     range:NSMakeRange(0, selName.length)];
    
    NSMutableString *val = [[NSMutableString alloc] initWithString:@"i@:"];
    
    for (int i = 0; i < count; i++) {
        
        [val appendString:@"@"];
    }
    
    const char *funcTypeEncoding = [val UTF8String];
    
    return class_addMethod([ByeCrashEmptyFunction class], sel, (IMP)smartFunction, funcTypeEncoding);
}
    
+ (BOOL)addClassFunc:(SEL)sel {
    NSString *selName = NSStringFromSelector(sel);
    
    NSMutableString *tmpString = [[NSMutableString alloc] initWithFormat:@"%@", selName];
    
    int count = (int)[tmpString replaceOccurrencesOfString:@":"
                                                withString:@"_"
                                                   options:NSCaseInsensitiveSearch
                                                     range:NSMakeRange(0, selName.length)];
    
    NSMutableString *val = [[NSMutableString alloc] initWithString:@"i@:"];
    
    for (int i = 0; i < count; i++) {
        
        [val appendString:@"@"];
    }
    
    const char *funcTypeEncoding = [val UTF8String];
    
    Class metaClass = objc_getMetaClass(class_getName([ByeCrashEmptyFunction class]));
    
    return class_addMethod(metaClass, sel, (IMP)smartFunction, funcTypeEncoding);
}
    
@end
