//
//  NSNull+ByeCrash.h
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (ByeCrash)
    
- (id)bye_forwardingTargetForSelector:(SEL)aSelector;
    
@end
