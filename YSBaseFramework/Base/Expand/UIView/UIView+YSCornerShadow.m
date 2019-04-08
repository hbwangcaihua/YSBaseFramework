//
//  UIView+YSCornerShadow.m
//  ApuRay
//
//  Created by qitmac000370 on 2019/2/27.
//  Copyright © 2019年 wch. All rights reserved.
//

#import "UIView+YSCornerShadow.h"

@implementation UIView (YSCornerShadow)

/*
 * 给View设置阴影
 */
-(void)makeShadowWithColor:(UIColor *)color opacity:(CGFloat)opacity radius:(CGFloat)radius{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = CGSizeMake(0,0);   // 阴影偏移，默认(0, -3)
    self.layer.shadowOpacity = opacity; // 阴影透明度，默认0
    self.layer.shadowRadius = radius; // 阴影半径，默认3
}

/*
 * 给View设置圆角
 */
-(void)makeCornerWithCorner:(CGFloat)corner{
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(corner,corner)].CGPath;
    self.layer.mask = maskLayer;
}

@end
