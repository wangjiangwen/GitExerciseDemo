//
//  ViewController.m
//  并发编程
//
//  Created by wangjiangjiao on 15/9/20.
//  Copyright (c) 2015年 wangjiangjiao. All rights reserved.
//

#import "ViewController.h"
#import "PThreadClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        PThreadClass * threadInstance = [[PThreadClass alloc] init];
        [threadInstance nonThreadOperation];
    });
   
//    [threadInstance nonThreadOperation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
