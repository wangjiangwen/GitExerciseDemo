//
//  WJBaseViewController.m
//  WJFramework
//
//  Created by wangjiangjiao on 15/5/4.
//  Copyright (c) 2015年 Wangjiangjiao. All rights reserved.
//

#import "WJBaseViewController.h"
#import "WJNavigationBarView.h"
#import "UIView+WJAdditions.h"

@interface WJBaseViewController () <WJNavigationBarViewDelegate>
{
    WJNavigationBarView *_navigationBarView;
}
@end

const CGRect NavigationBarFrame = {0,0,320,44};
#define ViewControllerRGBBgColor RGBCOLOR(245, 245, 245)



@implementation WJBaseViewController

- (id)initWithDictionary:(NSDictionary*)dictionary {
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)isLoadNavigationBar
{
    return YES;
}

- (BOOL)isNeedBgImage
{
    return NO;
}

- (NavigationBarStyle)getNavigationBarStyle
{
    return NavigationBarNormarlStyle;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadContentView];
    [self loadNavigationBar];
    // Do any additional setup after loading the view.
}

#pragma mark -- setUpView
- (void)loadContentView
{
    BOOL systemIOS7 = ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending);

    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _contentView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_contentView];
    }
    _contentView.frame = [UIScreen mainScreen].bounds;
    self.view.height = systemIOS7 ? SCREEN_HEIGHT : SCREEN_HEIGHT - 20;
    //    _contentView.height = IS_IOS7 ? SCREEN_HEIGHT : SCREEN_HEIGHT - 20;
    CGFloat navgationHeight = systemIOS7 ? 64 : 44;
    
    _contentView.top = navgationHeight;
    _contentView.height = SCREEN_HEIGHT - 64;
    _contentView.backgroundColor = ViewControllerRGBBgColor;
    
    self.view.backgroundColor = [UIColor clearColor];
    if ([self isNeedBgImage]) {
        [self setUpContentBgView];
    }
    
    if (systemIOS7) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
}

- (void)setUpContentBgView
{
    UIImageView * bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [bgImageView setImage:ImageNamed(@"UMBgImage.png")];
    bgImageView.userInteractionEnabled = YES;
    [self.view addSubview:bgImageView];
    
    [self.view sendSubviewToBack:bgImageView];
}

//自定义导航栏背景
-(void)loadNavigationBar
{
    self.navigationController.navigationBarHidden = YES;
    
    BOOL systemIOS7 = ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending);

    
    if ([self isLoadNavigationBar]) {
        _navigationBarView = [[WJNavigationBarView alloc] initWithFrame:NavigationBarFrame];
        _navigationBarView.width = SCREEN_WIDTH;
        _navigationBarView.delegate = self;
        if (systemIOS7) {
            _navigationBarView.height = 64;
        }
        [self.view addSubview:_navigationBarView];
        
        [_navigationBarView setNavigationBarStyle:[self getNavigationBarStyle]];
    }else{
        _contentView.top = 0;
        _contentView.height = SCREEN_HEIGHT ;
        
        if (!systemIOS7) {
            _contentView.height = SCREEN_HEIGHT - 20;
        }
    }
    
}

#pragma mark - NavigationBarViewTitle

-(void)setNavigationBarHidden:(BOOL)isHidden
{
    _navigationBarView.hidden = isHidden;
}

-(void)setNavigationBarTitle:(NSString *)title;
{
    _navigationBarView.titleLabel.text = title;
}

- (NSString *)getTitle
{
    return  _navigationBarView.titleLabel.text;
}


#pragma mark - NavigationBarViewButtonStyle

-(void)setRightButtonStyle:(NavigationButtonStyle)style
{
    [_navigationBarView setRightButtonStyle:style];
    
}

-(void)setLeftButtonStyle:(NavigationButtonStyle)style
{
    [_navigationBarView setLeftButtonStyle:style];
}


#pragma mark - showMessage
//- (void)showMessage:(NSString *)messageText {
//    [APP_DELEGATE showTip:messageText inView:self.view];
//}
//
//- (void)startActivityAnimating {
//    [APP_DELEGATE startActivityAnimating];
//}
//
//- (void)stopActivityAnimating {
//    [APP_DELEGATE stopActivityAnimating];
//}



#pragma mark -- 设置StatusBarStyle

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


#pragma mark -- 编辑状态取消，即取消键盘
- (void)endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


#pragma mark - NavigationBarViewButtonClick(NavigationBarViewDelegate)

- (void)leftButtonClick
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)rightButtonClick
{
    
}
@end
