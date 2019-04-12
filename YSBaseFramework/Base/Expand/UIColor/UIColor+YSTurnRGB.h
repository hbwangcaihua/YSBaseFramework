//
//  UIColor+YSTurnRGB.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YSTurnRGB)

/**
 *  将字符串转换为UIColor,（默认alpha为1）
 */
+(UIColor *)turnStringToRGB:(NSString *)stringColor;

/**
 *  将字符串转换为UIColor，可指定alpha值
 */
+(UIColor *)turnStringToRGB:(NSString *)stringColor alpha:(CGFloat)alpha;

@end
