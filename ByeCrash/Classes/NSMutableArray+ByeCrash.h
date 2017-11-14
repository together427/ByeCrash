//
//  NSMutableArray+ByeCrash.h
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ByeCrash)
- (id)bye_mutableObjectAtIndex:(NSUInteger)index;
- (void)bye_addObject:(id)anObject;
- (void)bye_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)bye_removeObjectAtIndex:(NSUInteger)index ;
- (void)bye_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end
