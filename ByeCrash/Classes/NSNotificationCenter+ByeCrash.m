//
//  NSNotificationCenter+ByeCrash.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "NSNotificationCenter+ByeCrash.h"
#import <objc/runtime.h>


#pragma mark - flag
@interface NSObject (NSNotificationFlag)
    @property (nonatomic, strong) NSNumber *notificationFlag;
    @end
@implementation NSObject (NSNotificationFlag)
- (NSNumber * )notificationFlag {
    return objc_getAssociatedObject(self, @selector(notificationFlag));
}
- (void)setNotificationFlag:(NSNumber *)notificationFlag {
    objc_setAssociatedObject(self, @selector(notificationFlag), notificationFlag,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
    
    @end

#pragma mark - Notification
@implementation NSObject (NSNotificationStability)
- (void)bye_notificationDealloc {
    if (self.notificationFlag) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    [self bye_notificationDealloc];
}
    
@end

@implementation NSNotificationCenter (ByeCrash)
- (void)bye_addObserver:(NSObject *)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject {
    observer.notificationFlag = @(YES);
    [self bye_addObserver:observer selector:aSelector name:aName object:anObject];
}
@end
