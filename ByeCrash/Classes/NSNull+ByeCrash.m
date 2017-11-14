//
//  NSNull+ByeCrash.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "NSNull+ByeCrash.h"

@implementation NSNull (ByeCrash)
    
- (id)bye_forwardingTargetForSelector:(SEL)aSelector {
    static NSArray *sTmpOutput = nil;
    if (sTmpOutput == nil) {
        sTmpOutput = @[@"", @0, @[], @{}];
    }
    
    for (id tmpObj in sTmpOutput) {
        if ([tmpObj respondsToSelector:aSelector]) {
            return tmpObj;
        }
    }
    
    return [self bye_forwardingTargetForSelector:aSelector];
}
    
@end
