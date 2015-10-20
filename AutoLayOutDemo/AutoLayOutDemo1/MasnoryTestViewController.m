//
//  MasnoryTestViewController.m
//  AutoLayOutDemo
//
//  Created by wangjiangjiao on 14/10/18.
//  Copyright © 2014年 elong. All rights reserved.
//

#import "MasnoryTestViewController.h"
#import <Masonry/Masonry.h>
@interface MasnoryTestViewController ()

@end

//- (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block;
//- (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block;
//- (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block;

/*
 mas_makeConstraints 只负责新增约束 Autolayout不能同时存在两条针对于同一对象的约束 否则会报错
 mas_updateConstraints 针对上面的情况 会更新在block中出现的约束 不会导致出现两个相同约束的情况
 mas_remakeConstraints 则会清除之前的所有约束 仅保留最新的约束
 
 三种函数善加利用 就可以应对各种情况了
 */

@implementation MasnoryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //从此以后基本可以抛弃CGRectMake了
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor blackColor];
    //在做autoLayout之前 一定要先将view添加到superview上 否则会报错
    [self.view addSubview:view];
    
    
    //mas_makeConstraints就是Masonry的autolayout添加函数 将所需的约束添加到block中行了
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        //将view居中
        make.center.equalTo(self.view);
        //将size设置成(300,300)
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
     
    UIView * view1 = [UIView new];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker * make){
        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        /* 等价于
         make.top.equalTo(sv).with.offset(10);
         make.left.equalTo(sv).with.offset(10);
         make.bottom.equalTo(sv).with.offset(-10);
         make.right.equalTo(sv).with.offset(-10);
         */
        /* 也等价于
         make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
         */
    }];
    
    
    UIView * view2 = [UIView new];
    view2.backgroundColor = [UIColor blueColor];
    [view1 addSubview:view2];
    
    UIView * view3 = [UIView new];
    view3.backgroundColor = [UIColor blueColor];
    [view1 addSubview:view3];
    
    int padding1 = 10;
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY);
        make.left.equalTo(view.mas_left).with.offset(padding1);
        make.right.equalTo(view3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view3);
    }];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY);
        make.left.equalTo(view2.mas_right).with.offset(padding1);
        make.right.equalTo(view.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view2);
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
