//
//  NSObject+ByeCrash.h
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ByeCrash)
- (id)bye_forwardingTargetForSelector:(SEL)aSelector;
+ (id)bye_classforwardingTargetForSelector:(SEL)aSelector;
@end
