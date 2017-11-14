//
//  NSArray+ByeCrash.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "NSArray+ByeCrash.h"
#import <objc/runtime.h>

@implementation NSArray (ByeCrash)

- (id)bye_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        NSString *reason = [NSString stringWithFormat:@"*** ByeCrash Log *** NSRangeException, [%@ %@], index: %lu, array count: %lu",
                            [self class], NSStringFromSelector(_cmd),(unsigned long)index, (unsigned long)self.count];
        NSLog(@"%@", reason);
        return nil;
    }
    
    
    return [self bye_objectAtIndex:index];
}
    
@end
