//
//  WJNavigationBarView.h
//  WJFramework
//
//  Created by wangjiangjiao on 15/9/30.
//  Copyright © 2015年 wangjiangjiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    NavigationButtonStyleBack,
    NavigationButtonStyleBackWord,
    NavigationButtonStyleNone,
    NavigationRightButtonStylePublic
} NavigationButtonStyle;

typedef NS_ENUM(NSInteger,NavigationBarStyle){
    NavigationBarNoneStyle,
    NavigationBarNormarlStyle,              
};

@protocol WJNavigationBarViewDelegate <NSObject>

- (void)leftButtonClick;
- (void)rightButtonClick;


@end

@interface WJNavigationBarView : UIView

@property (nonatomic, weak) id <WJNavigationBarViewDelegate>delegate;


@property(nonatomic, strong)  UILabel  *  titleLabel;

//设置左右UIButton样式
- (void)setLeftButtonStyle:(NavigationButtonStyle)style;
- (void)setRightButtonStyle:(NavigationButtonStyle)style;
//设置NavigationBar样式
- (void)setNavigationBarStyle:(NavigationBarStyle)navigationBarStyle;

@end
