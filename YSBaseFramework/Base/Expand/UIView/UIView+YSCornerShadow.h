//
//  UIView+YSCornerShadow.h
//  ApuRay
//
//  Created by qitmac000370 on 2019/2/27.
//  Copyright © 2019年 wch. All rights reserved.
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
