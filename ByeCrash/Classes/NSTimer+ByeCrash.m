//
//  NSTimer+ByeCrash.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "NSTimer+ByeCrash.h"
#import <objc/runtime.h>


@interface ByeTimerProperty : NSObject
@property (nonatomic, weak) NSTimer *sourceTimer;
@property (nonatomic, weak) id target;
@property (nonatomic) SEL aSelector;
@end

@implementation ByeTimerProperty
- (void)trigger:(id)userinfo  {
    if (self.target && ([self.target respondsToSelector:self.aSelector])) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        [self.target performSelector:self.aSelector withObject:userinfo];
#pragma clang diagnostic pop
        
    } else {
        if (self.sourceTimer) {
            [self.sourceTimer invalidate];
            
        }
        NSString *reason = [NSString stringWithFormat:@"*****Warning***** logic error target is %@ method is %@, reason : an object dealloc not invalidate Timer.",
                            [self class], NSStringFromSelector(_cmd)];
        NSLog(@"%@", reason);
    }
}
    
@end

@interface NSTimer (ByeCrashProxy)
@property (nonatomic, strong) ByeTimerProperty   *timerProxy;
@end

@implementation NSTimer (ByeCrash)
    
- (void)setTimerProxy:(ByeTimerProperty *)timerProxy {
    objc_setAssociatedObject(self, @selector(timerProxy), timerProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
    
- (ByeTimerProperty *)timerProxy {
    return objc_getAssociatedObject(self, @selector(timerProxy));
}
 
+ (NSTimer *)bye_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo {
    if (yesOrNo) {
        ByeTimerProperty *proxy = [ByeTimerProperty new];
        proxy.target = aTarget;
        proxy.aSelector = aSelector;
        NSTimer *timer = [NSTimer bye_scheduledTimerWithTimeInterval:ti target:proxy selector:@selector(trigger:) userInfo:userInfo repeats:yesOrNo];
        timer.timerProxy = proxy;
        proxy.sourceTimer = timer;
        return  timer;
    } else {
        return  [self bye_scheduledTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
        
    }
}

@end
