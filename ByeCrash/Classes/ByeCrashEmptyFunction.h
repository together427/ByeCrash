//
//  ByeCrashEmptyFunction.h
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ByeCrashEmptyFunction : NSObject
- (BOOL)addFunc:(SEL)sel;    
+ (BOOL)addClassFunc:(SEL)sel;
@end
