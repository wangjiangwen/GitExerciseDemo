//
//  WJBaseViewController.h
//  WJFramework
//
//  Created by wangjiangjiao on 15/5/4.
//  Copyright (c) 2015年 Wangjiangjiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJNavigationBarView.h"

@interface WJBaseViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView * contentView;



//初始化方法要子类复写
- (id)initWithDictionary:(NSDictionary *)dictionary;

-(void)setNavigationBarTitle:(NSString *)title;

-(void)setNavigationBarHidden:(BOOL)isHidden;


//设置左右uibutton样式。   左边默认返回按钮；右边默认无按钮
- (void)setLeftButtonStyle:(NavigationButtonStyle)style;
- (void)setRightButtonStyle:(NavigationButtonStyle)style;


#pragma mark - showMessage
//- (void)showMessage:(NSString *)messageText;
//
//#pragma mark -Activity
////Activity
//- (void)startActivityAnimating;  //加载框没有覆盖到导航栏
//- (void)startActivityAnimatingInScreenView; //加载框覆盖到导航栏
//- (void)stopActivityAnimating;

- (void)endEditing;


@end
