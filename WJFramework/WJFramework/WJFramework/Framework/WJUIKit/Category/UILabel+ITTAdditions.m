//
//  UILabel+ITTAdditions.m
//  BMSMerchant
//
//  Created by wangjiangjiao on 14-8-19.
//  Copyright (c) 2014年 chenmingguo. All rights reserved.
//

#import "UILabel+ITTAdditions.h"

@implementation UILabel (ITTAdditions)


+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
{
	UILabel *label = [UILabel labelWithFrame:frame text:text textColor:textColor font:font textAlignment:NSTextAlignmentLeft];
	return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [UILabel labelWithFrame:frame text:text textColor:textColor font:font textAlignment:textAlignment tag:0];

    return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
                  textAlignment:(NSTextAlignment)textAlignment
                        tag:(NSInteger)tag
{
	UILabel *label = [UILabel labelWithFrame:frame text:text textColor:textColor font:font textAlignment:textAlignment tag:tag hasShadow:NO];
	return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment
                        tag:(NSInteger)tag
                  hasShadow:(BOOL)hasShadow
{
	UILabel *label = [[UILabel alloc] initWithFrame:frame];
	label.text = text;
	label.textColor = textColor;
    label.numberOfLines = 0;
	label.backgroundColor = [UIColor clearColor];
	if( hasShadow ){
		label.shadowColor = [UIColor blackColor];
		label.shadowOffset = CGSizeMake(1,1);
	}
	label.textAlignment = textAlignment;
	label.font = font;
    if (tag != 0) {
        label.tag = tag;
    }    
	return label;
}

@end
