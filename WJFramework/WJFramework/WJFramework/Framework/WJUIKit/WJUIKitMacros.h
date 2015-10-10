//
//  WJUIKitMacros.h
//  WJFramework
//
//  Created by wangjiangjiao on 15/9/30.
//  Copyright © 2015年 wangjiangjiao. All rights reserved.
//

#ifndef WJUIKitMacros_h
#define WJUIKitMacros_h


#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define MAIN_CONTENT_HEIGHT	(SCREEN_HEIGHT - 20 - 44)

#pragma mark -- Color functions

#define RGBCOLOR(r, g, b)               [UIColor colorWithRed : (r) / 255.0f green : (g) / 255.0f blue : (b) / 255.0f alpha : 1]
#define RGBACOLOR(r, g, b, a)           [UIColor colorWithRed : (r) / 255.0f green : (g) / 255.0f blue : (b) / 255.0f alpha : (a)]

// sample: Designer - #FF0000, We - HEXCOLOR(0xFF0000)
#define HEXCOLOR(hexValue)              [UIColor colorWithRed : ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0 green : ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0 blue : ((CGFloat)(hexValue & 0xFF)) / 255.0 alpha : 1.0]

#define HEXACOLOR(hexValue, alphaValue) [UIColor colorWithRed : ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0 green : ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0 blue : ((CGFloat)(hexValue & 0xFF)) / 255.0 alpha : (alphaValue)]

#define WJRectMake(x, y, width, height) CGRectMake(floor(x), floor(y), floor(width), floor(height)) //防止frame出现小数，绘制模糊


#pragma mark -- Font functions

#define UIFontSize(CGFloat)                         [UIFont systemFontOfSize : CGFloat]
#define UIItalicFont(CGFloat)                       [UIFont italicSystemFontOfSize : CGFloat]
#define UIBoldFontSize(CGFloat)                     [UIFont boldSystemFontOfSize : CGFloat]


#pragma mark --NavigationBar字体大小

#define NavigationBarTitleFont 18.0f
#define NavigationBarLeftTitleFont 15.0f
#define NavigationBarRightTitleFont 15.0f

#define TwentyFont        UIFontSize(20.0f)
#define NinteenFont       UIFontSize(19.0f)
#define EighteenFont      UIFontSize(18.0f)
#define SeventeenFont     UIFontSize(17.0f)
#define SixteenFont       UIFontSize(16.0f)
#define FifteenFont       UIFontSize(15.0f)
#define FourteenFont      UIFontSize(14.0f)
#define ThirteenFont      UIFontSize(13.0f)
#define TwelveFont        UIFontSize(12.0f)
#define ElevenFont        UIFontSize(11.0f)
#define TenFont           UIFontSize(10.0f)
#define NineFont          UIFontSize(9.0f)

#pragma mark -- Image

#define ImageNamed(_pointer)                      [UIImage imageNamed:_pointer]


#endif /* WJUIKitMacros_h */
