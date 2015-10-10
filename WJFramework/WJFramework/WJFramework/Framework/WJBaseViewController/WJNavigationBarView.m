//
//  WJNavigationBarView.m
//  WJFramework
//
//  Created by wangjiangjiao on 15/9/30.
//  Copyright © 2015年 wangjiangjiao. All rights reserved.
//

#import "WJNavigationBarView.h"
#import "UIView+WJAdditions.h"

const CGRect TitleLabelFrame = {60,12,200,21};
const CGRect LeftButtonFrame = {0 ,0, 55,44};
const CGRect RightButtonFrame = {270, 0, 50, 44};

const UIEdgeInsets contentEdgeInsets = {12, 13, 11, 30};
const UIEdgeInsets RightEdgeInsets = {12, 18, 10, 10};

#define LightBlueBgColor RGBCOLOR(90, 173, 239)
#define LightDeepGrayRGBColor  RGBCOLOR(96, 96, 96)

@interface WJNavigationBarView ()

@property(nonatomic, strong)  UIButton * leftButton;
@property(nonatomic, strong)  UIButton * rightButton;

@end


@implementation WJNavigationBarView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = LightBlueBgColor;
        
    }
    return self;
}


- (BOOL)wj_systemVersion7
{
    BOOL systemIOS7 = ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending);
    return systemIOS7;
}

/*!
 @class
 @abstract lazyload
 */

- (UILabel *)titleLabel
{
    
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:TitleLabelFrame];
        _titleLabel.font = [UIFont boldSystemFontOfSize:NavigationBarTitleFont];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        [self addSubview:_titleLabel];
        
        if ([self wj_systemVersion7]) {
            _titleLabel.top += 20;
        }
        
    }
    return _titleLabel;
}

- (UIButton *)leftButton
{
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = LeftButtonFrame;
        _leftButton.contentEdgeInsets = contentEdgeInsets;
        [_leftButton setImage:[UIImage imageNamed:@"CWNavigationBar_back.png"] forState:UIControlStateNormal];
        [_leftButton setImage:[UIImage imageNamed:@"CWNavigationBar_back.png"] forState:UIControlStateHighlighted | UIControlStateSelected];
        _leftButton.titleLabel.font = FifteenFont;
        [_leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_leftButton];
        
        if ([self wj_systemVersion7]) {
            _leftButton.top = 20;
        }
    }
    
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = RightButtonFrame;
        _rightButton.contentEdgeInsets = RightEdgeInsets;
        _rightButton.titleLabel.font = FifteenFont;
        [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_rightButton];
        
        if ([self wj_systemVersion7]) {
            _rightButton.top = 20;
        }
    }
    return _rightButton;
}


#pragma mark -- NavigationBarStyle类型

- (void)setNavigationBarStyle:(NavigationBarStyle)navigationBarStyle
{
    if (navigationBarStyle == NavigationBarNormarlStyle) {
        
    }
}

//设置左右uibutton样式。   左边默认返回按钮；右边默认无按钮
- (void)setLeftButtonStyle:(NavigationButtonStyle)style
{
    if (style == NavigationButtonStyleNone) {
        if (_leftButton ) {
            _leftButton.hidden = YES;
        }
    }else{ //带返回的图片
        [self setLeftButtonStyleWithBack:style];
    }
}

- (void)setRightButtonStyle:(NavigationButtonStyle)style
{
    if (style == NavigationButtonStyleNone) {
        if (_rightButton ) {
            _rightButton.hidden = YES;
        }
    }else if (style == NavigationRightButtonStylePublic){
        self.rightButton.frame = CGRectMake(SCREEN_WIDTH - 50,self.rightButton.top, 50, 44);
        [_rightButton setTitle:@"发 布"forState:UIControlStateNormal];
        _rightButton.contentEdgeInsets = UIEdgeInsetsZero;
    }
}



- (void)setLeftButtonStyleWithBack:(NavigationButtonStyle)style
{
    NSString * title = @"";
    
    if (style == NavigationButtonStyleBackWord){
        title = @"返回";
    }
    
#warning titleSize zero
//    CGSize titleSize = [CommonHelp getSizeFromString:title WithFont:UIFontSize(NavigationBarLeftTitleFont) withSize:CGSizeMake(CGFLOAT_MAX, 20)];
    CGSize titleSize = CGSizeZero;

    CGFloat width =  titleSize.width + 28;
    
    
    
    [self.leftButton setImage:[UIImage imageNamed:@"CWNavigationBar_back.png"] forState:UIControlStateNormal];
    
    _leftButton.titleLabel.font = UIFontSize(NavigationBarLeftTitleFont);
    [_leftButton setTitle:title forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftButton setTitleColor:LightDeepGrayRGBColor forState:UIControlStateHighlighted];
    
    _leftButton.width = width;
    
    _leftButton.contentEdgeInsets = UIEdgeInsetsZero;
    _leftButton.imageEdgeInsets = UIEdgeInsetsMake(13, 8, 13, width - 26);
    _leftButton.titleEdgeInsets = UIEdgeInsetsMake(13, 23 - 20, 13, 7 );
}


#pragma mark - NavigationBarViewButtonClick

- (void)leftButtonClick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftButtonClick)]) {
        [self.delegate leftButtonClick];
    }
}

- (void)rightButtonClick:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightButtonClick)]) {
        [self.delegate rightButtonClick];
    }
}


@end
