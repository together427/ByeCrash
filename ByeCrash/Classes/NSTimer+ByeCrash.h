//
//  NSTimer+ByeCrash.h
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ByeCrash)
+ (NSTimer *)bye_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                         target:(id)aTarget
                                       selector:(SEL)aSelector
                                       userInfo:(id)userInfo
                                        repeats:(BOOL)yesOrNo;
@end
