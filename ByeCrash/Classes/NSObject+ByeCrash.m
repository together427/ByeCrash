//
//  NSObject+ByeCrash.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "NSObject+ByeCrash.h"
#import "ByeCrashEmptyFunction.h"

@implementation NSObject (ByeCrash)

- (id)bye_forwardingTargetForSelector:(SEL)aSelector {
    if ([self isKindOfClass:[NSNumber class]] && [NSString instancesRespondToSelector:aSelector]) {
        NSNumber *number = (NSNumber *)self;
        NSString *str = [number stringValue];
        return str;
    } else if ([self isKindOfClass:[NSString class]] && [NSNumber instancesRespondToSelector:aSelector]) {
        NSString *str = (NSString *)self;
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSNumber *number = [formatter numberFromString:str];
        return number;
    }
    
    BOOL aBool = [self respondsToSelector:aSelector];
    NSMethodSignature *signatrue = [self methodSignatureForSelector:aSelector];
    
    if (aBool || signatrue) {
        return [self bye_forwardingTargetForSelector:aSelector];
    } else {
        ByeCrashEmptyFunction *func = [[ByeCrashEmptyFunction alloc] init];
        [func addFunc:aSelector];
        
        NSString *reason = [NSString stringWithFormat:@"*****Warning***** logic error.target is %@ method is %@, reason : method forword to SmartFunction Object default implement like send message to nil.",
                            [self class], NSStringFromSelector(_cmd)];
        NSLog(@"%@", reason);
        return func;
    }
}
    
+ (id)bye_classforwardingTargetForSelector:(SEL)aSelector {
    BOOL respondsToSelector = [self respondsToSelector:aSelector];
    NSMethodSignature *sign = [self methodSignatureForSelector:aSelector];
    
    if (respondsToSelector || sign) {
        return [self bye_forwardingTargetForSelector:aSelector];
    } else {
        [ByeCrashEmptyFunction addClassFunc:aSelector];
        NSString *reason = [NSString stringWithFormat:@"*****Warning***** logic error.target is %@ method is %@, reason : method forword to SmartFunction Object default implement like send message to nil.",
                            [self class], NSStringFromSelector(_cmd)];
        NSLog(@"%@", reason);
        return [ByeCrashEmptyFunction class];
    }
}
@end
