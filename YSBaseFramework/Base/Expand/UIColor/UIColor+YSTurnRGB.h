//
//  UIColor+YSTurnRGB.h
//  YSFramework
//
//  Created by qitmac000370 on 2018/12/4.
//  Copyright © 2018年 wch. All rights reserved.
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
