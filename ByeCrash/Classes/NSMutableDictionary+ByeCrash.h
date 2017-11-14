//
//  NSMutableDictionary+ByeCrash.h
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (ByeCrash)
- (void)bye_setObject:(id)anObject forKey:(id<NSCopying>)aKey;
@end
