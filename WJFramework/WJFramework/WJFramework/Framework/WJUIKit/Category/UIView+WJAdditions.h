//
//  UIView+WJAdditions.h
//  WJFramework
//
//  Created by wangjiangjiao on 14-7-23.
//  Copyright (c) 2014年 Wangjiangjiao. All rights reserved.
//
/*!
 @header UIView+ITTAdditions
 @abstract UIView 扩展类别
 @author wangjiangjiao
 @version V1.0 2014/07/23 Creation
 */
#import <UIKit/UIKit.h>

/*!
 @class
 @abstract 对系统UIView类扩展一些方法
 */
#import <UIKit/UIKit.h>

@interface UIView (WJJAdditions)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
/*!
 @property
 @abstract frame.origin.x 的简写,
 left = frame.origin.x
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
/*!
 @property
 @abstract frame.origin.y 的缩写,
 top = frame.origin.y
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
/*!
 @property
 @abstract frame.origin.x + frame.size.width 的简写
 right = frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
/*!
 @property
 @abstract frame.origin.y + frame.size.height 的缩写
 bottom = frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
/*!
 @property
 @abstract frame.size.width 的缩写
 width = frame.size.width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
/*!
 @property
 @abstract frame.size.height 的缩写
 height = frame.size.height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
/*!
 @property
 @abstract center.x 的缩写
 centerX =  center.x
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
/*!
 @property
 @abstract centerY = center.y
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
/*!
 @property
 @abstract 只读(readonly) 返回相对于视图控制器(0,0)点的x坐标
 */
@property (nonatomic, readonly) CGFloat ttScreenX;

/**
 * Return the y coordinate on the screen.
 */
/*!
 @property
 @abstract 只读(readonly) 返回相对于视图控制器(0,0)点的y坐标
 */
@property (nonatomic, readonly) CGFloat ttScreenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */

@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
/*!
 @property
 @abstract 只读(readonly) 只读(readonly) 返回相对于视图控制器(0,0)点的frame
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
/*!
 @property
 @abstract frame.origin 的缩写
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
/*!
 @property
 @abstract frame.size 的缩写
 */
@property (nonatomic) CGSize size;

/**
 * Return the width in portrait or the height in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationHeight;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
/*!
 @method
 @abstract 移除某个视图下面所有子视图
 @discussion 该方法获得子视图,并调用removeFromSuperview
 @result void
 */
- (void)removeAllSubviews;

/**
 * Calculates the offset of this view from another view in screen coordinates.
 *
 * otherView should be a parent view of this view.
 */
- (CGPoint)offsetFromView:(UIView*)otherView;


@end
