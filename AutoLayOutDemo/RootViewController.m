//
//  RootViewController.m
//  AutoLayOutDemo
//
//  Created by wangjiangjiao on 14-9-16.
//  Copyright (c) 2014年 elong. All rights reserved.
//

#import "RootViewController.h"
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIView * redView = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [self makeConstraints1:redView];

    UIView * blueView = [[UIView alloc] initWithFrame:CGRectMake(10, redView.frame.origin.y + redView.frame.size.height + 10, 100, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    
    UIView * yellowView = [[UIView alloc] initWithFrame:CGRectMake(10, blueView.frame.origin.y + blueView.frame.size.height + 10, 100, 100)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
//    [self makeConstraints1:blueView];
//    [self makeConstraints1:yellowView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1 animations:^{
            [self makeConstraints1:blueView];
            [self.view layoutIfNeeded];//最后使用layoutifneeded方法来从新定义约束，并且产生动画
        } completion:^(BOOL finished) {
            
        }];
    });

}


- (void)makeConstraints1:(UIView *)view
{
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20);
        make.left.equalTo(20);
        make.bottom.equalTo(-20);
        make.right.equalTo(-20);

    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
