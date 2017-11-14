//
//  NSCache+ByeCrash.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "NSCache+ByeCrash.h"

@implementation NSCache (ByeCrash)

    - (void)bye_setObject:(id)obj forKey:(id)key {
        if (obj && key) {
            [self bye_setObject:obj forKey:key];
        } else {
            NSString *reason = [NSString stringWithFormat:@"target is %@ method is %@, reason : ket or value appear nil- key is %@, obj is %@",
                                [self class], NSStringFromSelector(_cmd),key, obj];
            NSLog(@"%@", reason);
        }
    }
    
- (void)bye_setObject:(id)obj forKey:(id)key cost:(NSUInteger)g {
    if (obj && key) {
        [self bye_setObject:obj forKey:key cost:g];
    } else {
        NSString *reason = [NSString stringWithFormat:@"target is %@ method is %@, reason : ket or value appear nil- key is %@, obj is %@",
                            [self class], NSStringFromSelector(_cmd),key, obj];
        NSLog(@"%@", reason);
    }
}
    
@end
