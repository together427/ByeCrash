//
//  NSCache+ByeCrash.h
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCache (ByeCrash)

- (void)bye_setObject:(id)obj forKey:(id)key;
    
- (void)bye_setObject:(id)obj forKey:(id)key cost:(NSUInteger)g;
    
@end
