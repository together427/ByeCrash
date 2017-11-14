//
//  ViewController.m
//  ByeCrash
//
//  Created by together427 on 2017/9/4.
//  Copyright © 2017 together427. All rights reserved.
//

#import "ViewController.h"
#import "ByeCrashManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ByeCrashManager startProtect];
    
    NSArray *array = @[@"a", @"b", @"c"];
    NSString *str = [array objectAtIndex:4];
    NSLog(@"str:%@", str);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
