//
//  NSMutableDictionary+ByeCrash.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "NSMutableDictionary+ByeCrash.h"

@implementation NSMutableDictionary (ByeCrash)
- (void)bye_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject && aKey) {
        [self bye_setObject:anObject forKey:aKey];
    } else {
        NSString *reason = [NSString stringWithFormat:@"*** ByeCrash Log ***\ntarget is %@ method is %@, reason : ket or value appear nil- key is %@, obj is %@",
                            [self class], NSStringFromSelector(_cmd),aKey, anObject];
        NSLog(@"%@", reason);
    }
}
@end
