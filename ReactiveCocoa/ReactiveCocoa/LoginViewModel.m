//
//  LoginViewModel.m
//  ReactiveCocoa
//
//  Created by wangjiangjiao on 15/10/10.
//  Copyright © 2015年 wangjiangjiao. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (void)loadNewArray
{
    NSMutableArray * array = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        NSInteger number = arc4random();
        [array addObject:[NSNumber numberWithInteger:number]];
    }
    self.loginArray = array;
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.loginArray = nil;
//    });
}

@end
