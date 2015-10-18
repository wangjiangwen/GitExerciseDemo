//
//  TestAutoLayOutViewController.m
//  AutoLayOutDemo
//
//  Created by wangjiangjiao on 14-9-16.
//  Copyright (c) 2014年 elong. All rights reserved.
//

#import "TestAutoLayOutViewController.h"
#import "MasnoryTestViewController.h"

@interface TestAutoLayOutViewController ()

@end

@implementation TestAutoLayOutViewController

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
    // Do any additional setup after loading the view from its nib.
}



- (IBAction)masnoryTestButtonClick:(id)sender
{
    MasnoryTestViewController * masnoryTestViewController = [[MasnoryTestViewController alloc] init];
    [self.navigationController pushViewController:masnoryTestViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
