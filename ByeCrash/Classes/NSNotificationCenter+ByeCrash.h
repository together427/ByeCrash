//
//  NSNotificationCenter+ByeCrash.h
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSNotificationStability)
- (void)bye_notificationDealloc;
@end

@interface NSNotificationCenter (ByeCrash)
- (void)bye_addObserver:(NSObject *)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject;
@end
