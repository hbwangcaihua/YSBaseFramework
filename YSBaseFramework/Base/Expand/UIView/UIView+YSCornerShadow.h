//
//  UIView+YSCornerShadow.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YSCornerShadow)

/*
 * 给View设置阴影
 */
-(void)makeShadowWithColor:(UIColor *)color opacity:(CGFloat)opacity radius:(CGFloat)radius;

/*
 * 给View设置圆角
 */
-(void)makeCornerWithCorner:(CGFloat)corner;

@end

NS_ASSUME_NONNULL_END
