//
//  UIImage+YSOrientation.h
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YSOrientation)

/**
 纠正图片方向
 */
+ (UIImage *)fixOrientation:(UIImage *)image;

@end
