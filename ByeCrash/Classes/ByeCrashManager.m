//
//  ByeCrashManager.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "ByeCrashManager.h"
#import <JRSwizzle/JRSwizzle.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "NSArray+ByeCrash.h"
#import "NSMutableArray+ByeCrash.h"
#import "NSMutableDictionary+ByeCrash.h"
#import "NSCache+ByeCrash.h"
#import "NSNull+ByeCrash.h"
#import "NSNotificationCenter+ByeCrash.h"
#import "NSTimer+ByeCrash.h"
#import "NSObject+ByeCrash.h"

static NSString *const kClassNameNSSingleObjectArrayI = @"__NSSingleObjectArrayI";
static NSString *const kClassNameNSArrayI = @"__NSArrayI";
static NSString *const kClassNameNSArray0 = @"__NSArray0";
static NSString *const kClassNameNSArrayM = @"__NSArrayM";
static NSString *const kClassNameNSDictionaryM = @"__NSDictionaryM";
static NSString *const kDealloc = @"dealloc";

@implementation ByeCrashManager

+ (void)startProtect {
    [ByeCrashManager protectNSArray];
    [ByeCrashManager protectNSMutableArray];
    [ByeCrashManager protectNSMutableDictionary];
    [ByeCrashManager protectNSCache];
    [ByeCrashManager protectNSNull];
    [ByeCrashManager protectNSNotificationCenter];
    [ByeCrashManager protectNSTimer];
    [ByeCrashManager protectUnrecognizedSelector];
}
    
+ (void)protectNSArray {
    NSArray<NSString *> *arrayClasses = @[kClassNameNSSingleObjectArrayI, kClassNameNSArrayI, kClassNameNSArray0];
    for (NSString *arrayClassName in arrayClasses) {
        Class array = objc_getClass(arrayClassName.UTF8String);
        [array jr_swizzleMethod:@selector(objectAtIndex:)
                     withMethod:@selector(bye_objectAtIndex:)
                          error:nil];
    }
}

+ (void)protectNSMutableArray {
    Class mArray = objc_getClass(kClassNameNSArrayM.UTF8String);
    if (mArray) {
        [mArray jr_swizzleMethod:@selector(objectAtIndex:)
                      withMethod:@selector(bye_mutableObjectAtIndex:)
                           error:nil];
        [mArray jr_swizzleMethod:@selector(addObject:)
                      withMethod:@selector(bye_addObject:)
                           error:nil];
        [mArray jr_swizzleMethod:@selector(insertObject:atIndex:)
                      withMethod:@selector(bye_insertObject:atIndex:)
                           error:nil];
        [mArray jr_swizzleMethod:@selector(removeObjectAtIndex:)
                      withMethod:@selector(bye_removeObjectAtIndex:)
                           error:nil];
        [mArray jr_swizzleMethod:@selector(replaceObjectAtIndex:withObject:)
                      withMethod:@selector(bye_replaceObjectAtIndex:withObject:)
                           error:nil];
        
    }
}

+ (void)protectNSMutableDictionary {
    Class mDictionary = objc_getClass(kClassNameNSDictionaryM.UTF8String);
    if (mDictionary) {
        [mDictionary jr_swizzleMethod:@selector(setObject:forKey:)
                           withMethod:@selector(bye_setObject:forKey:)
                                error:nil];
    }
}
    
+ (void)protectNSCache {
    [[NSCache class] jr_swizzleMethod:@selector(setObject:forKey:)
                           withMethod:@selector(bye_setObject:forKey:)
                                error:nil];
    [[NSCache class] jr_swizzleMethod:@selector(setObject:forKey:cost:)
                           withMethod:@selector(bye_setObject:forKey:cost:)
                                error:nil];
}

+ (void)protectNSNull {
    [[NSNull class] jr_swizzleMethod:@selector(forwardingTargetForSelector:)
                          withMethod:@selector(bye_forwardingTargetForSelector:)
                               error:nil];
}

+ (void)protectNSNotificationCenter {
    BOOL ABOVE_IOS8  = (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO);
    if (!ABOVE_IOS8) {
        [[NSNotificationCenter class] jr_swizzleMethod:@selector(addObserver:selector:name:object:)
                                            withMethod:@selector(bye_addObserver:selector:name:object:)
                                                 error:nil];
        [[NSObject class] jr_swizzleMethod:NSSelectorFromString(kDealloc)
                                withMethod:@selector(bye_notificationDealloc)
                                     error:nil];
    }
    
    
}

+ (void)protectNSTimer {
    [[NSTimer class] jr_swizzleClassMethod:@selector(scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:) withClassMethod:@selector(bye_scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:)
                                     error:nil];
}

+ (void)protectUnrecognizedSelector {
    [[NSObject class] jr_swizzleMethod:@selector(forwardingTargetForSelector:)
                            withMethod:@selector(bye_forwardingTargetForSelector:)
                                 error:nil];
    [[NSObject class] jr_swizzleClassMethod:@selector(forwardingTargetForSelector:)
                            withClassMethod:@selector(bye_classforwardingTargetForSelector:)
                                      error:nil];
}
@end
