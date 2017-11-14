//
//  NSMutableArray+ByeCrash.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "NSMutableArray+ByeCrash.h"

@implementation NSMutableArray (ByeCrash)

- (id)bye_mutableObjectAtIndex:(NSUInteger)index {
    if (index > self.count - 1) {
        index = self.count - 1;
        NSString *reason = [NSString stringWithFormat:@"*** ByeCrash Log ***\ntarget is %@ method is %@,reason : index %@ out of count %@ of marray ",
                            [self class], NSStringFromSelector(_cmd),@(index), @(self.count)];
        NSLog(@"%@", reason);
        return nil;
    }
    
    return [self bye_mutableObjectAtIndex:index];
}
    
- (void)bye_addObject:(id)anObject {
    
    if (anObject) {
        
        [self bye_addObject:anObject];
    }
}
    
- (void)bye_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (anObject) {
        
        [self bye_insertObject:anObject atIndex:index];
    }
}
    
- (void)bye_removeObjectAtIndex:(NSUInteger)index {
    
    if (self.count == 0) {
        
        return;
    }
    
    if (index > self.count - 1) {
        NSString *reason = [NSString stringWithFormat:@"*** ByeCrash Log ***\ntarget is %@ method is %@,reason : index %@ out of count %@ of marray ",
                            [self class], NSStringFromSelector(_cmd),@(index), @(self.count)];
        
        NSLog(@"%@", reason);
        index = self.count - 1;
    }
    
    [self bye_removeObjectAtIndex:index];
}
    
- (void)bye_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    
    if (index > self.count - 1) {
        NSString *reason = [NSString stringWithFormat:@"*** ByeCrash Log ***\ntarget is %@ method is %@,reason : index %@ out of count %@ of marray ",
                            [self class], NSStringFromSelector(_cmd),@(index), @(self.count)];
        NSLog(@"%@", reason);
        return;
    }
    
    if (anObject == nil) {
        return;
    }
    
    [self bye_replaceObjectAtIndex:index withObject:anObject];
}

@end
