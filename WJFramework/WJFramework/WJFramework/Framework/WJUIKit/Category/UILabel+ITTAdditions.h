//
//  UILabel+ITTAdditions.h
//  BMSMerchant
//
//  Created by wangjiangjiao on 14-8-19.
//  Copyright (c) 2014年 chenmingguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ITTAdditions)


+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font;

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment;

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment
                        tag:(NSInteger)tag;

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment
                        tag:(NSInteger)tag
                  hasShadow:(BOOL)hasShadow;

@end
